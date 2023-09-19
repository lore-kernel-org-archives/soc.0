Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C44CD54AF
	for <soc@archiver.kernel.org>; Tue, 19 Sep 2023 10:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C18B8C43391; Tue, 19 Sep 2023 10:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BF5C433D9;
	Tue, 19 Sep 2023 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695119915;
	bh=FrAOJo8NZ2o+EAT8kUzffn2OavypU6rZq8MVsfqbCFo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i7jPsrVoUBI1C9G3fgMGsP/h2fOBfpB0giLgprjnyw1d4dumEwcyUfAkuCMttP/Is
	 2zX5L9MKahXi2ZZwInjRybp+ODeIKojCOhpyMjo3OBqbU+s4srHeBv3CM5LXB7ryLB
	 RFieZeEVEyG8ZNEaYQVCby8tUGpBzImsnb1KzEX1Paeasf87fL/s2GLV04Q1lu9hfv
	 XXe9D7ZB3ZCCTaBuB7YW7IL7AT44Av6vTJ1fJtVnxD5eEL/cgvQOmRtmCYPUPyy4Po
	 9I+9lgQrxr98oidKtMc/iUdAdYc+DuId4sihB29g++amKWNXmqs8ivsePLdXwFOUG9
	 Z+JW/GlDIWZRQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 6/7] ARM: dts: turris-omnia: Add MCU system-controller node
Date: Tue, 19 Sep 2023 12:38:14 +0200
Message-ID: <20230919103815.16818-7-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919103815.16818-1-kabel@kernel.org>
References: <20230919103815.16818-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Turris Omnia's MCU provides various features that can be configured over
I2C at address 0x2a. Add device-tree node.

Fixes: 26ca8b52d6e1 ("ARM: dts: add support for Turris Omnia")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../dts/marvell/armada-385-turris-omnia.dts   | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
index 2d8d319bec83..7682fda4000a 100644
--- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
@@ -218,7 +218,22 @@ i2c@0 {
 			#size-cells = <0>;
 			reg = <0>;
 
-			/* STM32F0 command interface at address 0x2a */
+			mcu: system-controller@2a {
+				compatible = "cznic,turris-omnia-mcu";
+				reg = <0x2a>;
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&mcu_pins>;
+
+				interrupt-parent = <&gpio1>;
+				interrupts = <11 IRQ_TYPE_NONE>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 
 			led-controller@2b {
 				compatible = "cznic,turris-omnia-leds";
@@ -503,6 +518,11 @@ fixed-link {
 };
 
 &pinctrl {
+	mcu_pins: mcu-pins {
+		marvell,pins = "mpp43";
+		marvell,function = "gpio";
+	};
+
 	pcawan_pins: pcawan-pins {
 		marvell,pins = "mpp46";
 		marvell,function = "gpio";
-- 
2.41.0

