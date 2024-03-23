Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B2CCD11BF
	for <soc@archiver.kernel.org>; Sat, 23 Mar 2024 16:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A38FFC433A6; Sat, 23 Mar 2024 16:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D70C43394;
	Sat, 23 Mar 2024 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711212274;
	bh=Q0koGnmwaXdVW+j0AQFV1qDgdqeBWF2zVD4eGoLBPvA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BRe4AUb57e4oj3ZE7u4d+lIIytkoyHBvkoVWgOhScLtwh8wafOX4sPYtIklUrAFMB
	 hpMP3xgf2wcxJQTcA0hBz1hYe77LBnCXL4ivKlQZ2W+V5HTrP4JH2CLtc46pTuFt4h
	 0biX70DHz+AtQN7TTGLJ3Xi4SWLv224YmNymzY0E5IUkvF9IhKylOeDNbMyUdQyzg1
	 T7muooJ8NCdgoMur0owVIFk6MJZVji9ecpY93kCZLsOciK+fXDGXokUBFhuhenEaxb
	 YKwtK3RcWHFM/ISDWhNmK0DHQ1RQsWoD9/hC3lri4+m29LBh5opii9A/TcworGw2tW
	 tqQks3Ge0oKiQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	soc@kernel.org,
	arm@kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v5 10/11] ARM: dts: turris-omnia: Add MCU system-controller node
Date: Sat, 23 Mar 2024 17:43:58 +0100
Message-ID: <20240323164359.21642-11-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240323164359.21642-1-kabel@kernel.org>
References: <20240323164359.21642-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Turris Omnia's MCU provides various features that can be configured over
I2C at address 0x2a. Add device-tree node.

Fixes: 26ca8b52d6e1 ("ARM: dts: add support for Turris Omnia")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
Changes since v4:
- #gpio-cells set to 3 instead of 2, see patch 01/11
---
 .../dts/marvell/armada-385-turris-omnia.dts   | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
index 7b755bb4e4e7..59079d63fe27 100644
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
+				#gpio-cells = <3>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 
 			led-controller@2b {
 				compatible = "cznic,turris-omnia-leds";
@@ -501,6 +516,11 @@ fixed-link {
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
2.43.2

