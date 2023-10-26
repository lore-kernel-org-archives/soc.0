Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E771C25B48
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 16:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37224C433CA; Thu, 26 Oct 2023 16:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4623C433CC;
	Thu, 26 Oct 2023 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698337114;
	bh=FrAOJo8NZ2o+EAT8kUzffn2OavypU6rZq8MVsfqbCFo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o4t958LaaSqHx39lo8yA7WjcZFlJrcqWFK9S9T0W+smpL+fXfxeA0xWDQujg2EAyg
	 bk0nxAd4twdVY+R297j0jCVw3X+hV1lmOfqH3UPn2X3qzK+CI4DbxQWVWuE4j5sKnE
	 9GA4SHb4oYuv4pU7sa9n2Ij8WZqfaa4WU2r+AWMNXL3MW2k1EXKEmN1TI4DD8sktSS
	 doRceq2tUW4hBorbE6t14ce9PCR0u6DIvlzpkuktwrPbV5qbGDt4PRosrrIc7XfjrX
	 StZRr0ZPiTasZEEsr0m6cXwFyHSO883i6Ody/oGvARBtdHOp+901AXfbmQwfKDJxNj
	 rYydKBK9hymtg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v4 6/7] ARM: dts: turris-omnia: Add MCU system-controller node
Date: Thu, 26 Oct 2023 18:18:02 +0200
Message-ID: <20231026161803.16750-7-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026161803.16750-1-kabel@kernel.org>
References: <20231026161803.16750-1-kabel@kernel.org>
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

