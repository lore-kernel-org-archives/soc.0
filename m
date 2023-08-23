Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8082FEE49A0
	for <soc@archiver.kernel.org>; Wed, 23 Aug 2023 16:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EB96C433CB; Wed, 23 Aug 2023 16:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B9BC433C7;
	Wed, 23 Aug 2023 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807022;
	bh=ZTyfQUINi5x2/ndYp8o4i7iD/UZv7PtLCIrokF24fVA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=afuFpz0AJ2AMFpj0y2VkoieZbnffpqsnOM5Na/+KrUBykwnf66W/UyjIBwIsW9SjY
	 5TO+9YXO7+QyBrbo38bmZ/vMN3x4kHDPfLEdabbyoQisUNCPG9XgRCJMMFRlaYWplC
	 Vsgt/aD7k9t3DMkaA6qn60pjvQuFNEJWxUyhWtnWRn3WCWyBtSY4rApds2JS+zkCMf
	 JUxOrtCuqPWH9HQawcZj51XicKXEX7I+SV7jM3yvfvYGmZHauuZREjFF2IkqtlUEw8
	 W3QNsy9zeh8WuaZ3hg1bmK62NZnf/yX10xOZ0H35LvTwsE51Yf0+5CDJoqFUF6eY6P
	 d4AN7sUhnvVjg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 3/4] ARM: dts: turris-omnia: Add MCU system-controller node
Date: Wed, 23 Aug 2023 18:10:11 +0200
Message-ID: <20230823161012.6986-4-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823161012.6986-1-kabel@kernel.org>
References: <20230823161012.6986-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Turris Omnia's MCU provides various features that can be configured over
I2C at address 0x2a. Add device-tree node.

Fixes: 26ca8b52d6e1 ("ARM: dts: add support for Turris Omnia")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../dts/marvell/armada-385-turris-omnia.dts   | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
index 2d8d319bec83..761147f5870f 100644
--- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
@@ -218,7 +218,24 @@ i2c@0 {
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
+
+				status = "okay";
+			};
 
 			led-controller@2b {
 				compatible = "cznic,turris-omnia-leds";
@@ -503,6 +520,11 @@ fixed-link {
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

