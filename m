Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC884C25B5F
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 10:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEC13C4AF68; Wed,  8 May 2024 10:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF094C4AF66;
	Wed,  8 May 2024 10:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715164314;
	bh=vBYPRi70YCGps6qezEgrv7Y9Q+Vd7ZSEkDa9qU0m+gY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lJlbUwWIhQKWRQwk4MfQUyaZhmUUXMOgGKTDCK5/u01kbPf4s13ThZLfn+hSiNVVW
	 J7uaic/VXly2xf4DpLdnsAGdxiRvShToyWzUPqTOW2StiPXW06z7Aj2dGsVuUy/fQM
	 sSI1T2YqZnYMKqL1J5cw8OqyRU5wLcEYIg6zMVTPwN3gSo3Xic+LLZaOGjVpXqY5PY
	 K92wAwiKxV2N80fXci6FNjmdBVkpHtp70vwx09Uw6OlcoM5xomY8aX+WPuE7v0hYZt
	 ujhiLdUmPJ59wwrcT3bGPcwMHBN+zZNjN3IQF122W4DLIqMK3NORLisdOZs5j6oHTz
	 d2mZNqJKriCsg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v9 8/9] ARM: dts: turris-omnia: Add MCU system-controller node
Date: Wed,  8 May 2024 12:31:17 +0200
Message-ID: <20240508103118.23345-9-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508103118.23345-1-kabel@kernel.org>
References: <20240508103118.23345-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Turris Omnia's MCU provides various features that can be configured over
I2C at address 0x2a. Add device-tree node.

This does not carry a Fixes tag - we do not want this to get backported
to stable kernels for the following reason: U-Boot since v2022.10
inserts a phy-reset-gpio property into the WAN ethernet node pointing to
the MCU node if it finds the MCU node with a cznic,turris-omnia-mcu
compatible. Thus if this change got backported to a stable kernel, the
WAN interface driver would defer probe indefinitely (since it would wait
for the turris-omnia-mcu driver which would not be present).

Signed-off-by: Marek Behún <kabel@kernel.org>
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

