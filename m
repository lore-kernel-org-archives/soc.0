Return-Path: <SRS0=4Q+8=HD=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2D7C433DB
	for <soc@archiver.kernel.org>; Mon,  1 Feb 2021 09:13:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 15E0A64E4F; Mon,  1 Feb 2021 09:13:17 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93DB764E40
	for <soc@kernel.org>; Mon,  1 Feb 2021 09:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93DB764E40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f177.google.com with SMTP id t8so18621894ljk.10
        for <soc@kernel.org>; Mon, 01 Feb 2021 01:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2oE25ixhS6qPVWF6lU9GDjpU9To1kS1GSFrjRASaVgo=;
        b=aEwO63wpfQ94jTrJai0DJL3FDE407Bn/WJpc8Crv172v+SPNNPLqLWLvI6frrlkd7y
         PjBnvfzbtwu4DnmmUovSswtjxOe2ZbEShgOpPfydnzLSUinrBwJ8boJrFm6TU9G1CCVG
         dCTf8H105j6gtI1Vlfuh2aAbpcAcO/TbOeuN+TurgTJdVbqj2f1TgIHjgGqQEBAeLOCF
         537uEBuPq5AmtJiu8sq4/xewugYAA5YsZeKL1NiG7iExYB5MeUeGd9yUNZjGhwhALBCg
         435XIY45hTcHX+E95lj8HD4NWH3qz3UR1LY/2sEieZRqt9Bb7zDMMlBwZleJHH77uwTh
         dkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2oE25ixhS6qPVWF6lU9GDjpU9To1kS1GSFrjRASaVgo=;
        b=nvT1XSk0AB03hgapo/aSZmM/xWwaSpBvbt0uQ/2Q0e13kRQThF+XFdstT9E4wb9E8x
         9DhI+XFJOLlfY7hC8F++iacD7BNOCyYhBMg7Ybxzyb7hviC4VlqYCXXNvzG8IcZxIHrE
         QhrPZx2TGIBLugOCLyZTbKfu7zRIFIlRBT5tbLq0lPfKly3Y14ngyKe8Q+dau9K3kyUX
         Ss32P5C4D56OoQrYVmXL/Q28brW6CqnGe5impE0wd+SUetM+A0tK4pmJ5bAqS7yvSYFV
         VRaH+JcfVi+Fxdvzt9mkgy5H/8reqT0Vg9Tvx2rrVXaybJ/vcuxZU6X2exa8+EqF3Xkl
         f0KA==
X-Gm-Message-State: AOAM530Pc+dXWRo6rqWEyN0mqWPECxcRbUQbX/kEtY7Ry8immqyhMn3i
	4TYqOMx8IxWh/v3MUzBw60YA2KePFD7r5L46
X-Google-Smtp-Source: ABdhPJzStSOsZDhBZVeH7n4/PZVWrjzjxwDD/msE3r/i9drcj6hVhUteBKatmvqVOlD6K1JxNXhj2w==
X-Received: by 2002:a2e:9b8f:: with SMTP id z15mr10239725lji.295.1612170794765;
        Mon, 01 Feb 2021 01:13:14 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id u4sm2939929lfc.277.2021.02.01.01.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 01:13:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Add Flash LEDs to Samsung phones
Date: Mon,  1 Feb 2021 10:13:08 +0100
Message-Id: <20210201091308.284465-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the Richtek RT8515 Flash LED to the Golden,
Skomer and Janice device trees.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please merge this on the appropriate branch for
v5.12, we got this driver and bindings merged so it's nice
to add this support in the next merge window.
---
 .../arm/boot/dts/ste-ux500-samsung-golden.dts | 36 +++++++++++++++++++
 .../arm/boot/dts/ste-ux500-samsung-janice.dts | 36 +++++++++++++++++++
 .../arm/boot/dts/ste-ux500-samsung-skomer.dts | 35 ++++++++++++++++++
 3 files changed, 107 insertions(+)

diff --git a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
index 00ee013cbd1d..7010fdcd76b2 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
@@ -5,6 +5,7 @@
 #include "ste-ab8505.dtsi"
 #include "ste-dbx5x0-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -373,6 +374,32 @@ home {
 		};
 	};
 
+	/* Richtek RT8515GQW Flash LED Driver IC */
+	flash {
+		compatible = "richtek,rt8515";
+		/* GPIO 140 */
+		enf-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+		/* GPIO 141 */
+		ent-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+		/*
+		 * RFS is 16 kOhm and RTS is 100 kOhm giving
+		 * the flash max current 343mA and torch max
+		 * current 55 mA.
+		 */
+		richtek,rfs-ohms = <16000>;
+		richtek,rts-ohms = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_flash_default_mode>;
+
+		led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			flash-max-timeout-us = <250000>;
+			flash-max-microamp = <343750>;
+			led-max-microamp = <55000>;
+		};
+	};
+
 	vibrator {
 		compatible = "gpio-vibrator";
 		/* GPIO195 (MOT_EN) */
@@ -498,6 +525,15 @@ golden_cfg1 {
 		};
 	};
 
+	flash {
+		gpio_flash_default_mode: flash_default {
+			golden_cfg1 {
+				pins = "GPIO140_B11", "GPIO141_C12";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
+
 	i2c-gpio-1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			golden_cfg1 {
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
index 95d5abe5dc0d..7411bfeda285 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
@@ -8,6 +8,7 @@
 #include "ste-ab8500.dtsi"
 #include "ste-dbx5x0-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -180,6 +181,32 @@ button-voldown {
 		};
 	};
 
+	/* Richtek RT8515GQW Flash LED Driver IC */
+	flash {
+		compatible = "richtek,rt8515";
+		/* GPIO 140 */
+		enf-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+		/* GPIO 141 */
+		ent-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+		/*
+		 * RFS is 16 kOhm and RTS is 100 kOhm giving
+		 * the flash max current 343mA and torch max
+		 * current 55 mA.
+		 */
+		richtek,rfs-ohms = <16000>;
+		richtek,rts-ohms = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_flash_default_mode>;
+
+		led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			flash-max-timeout-us = <250000>;
+			flash-max-microamp = <343750>;
+			led-max-microamp = <55000>;
+		};
+	};
+
 	/* Bit-banged I2C on GPIO143 and GPIO144 also called "SUBPMU I2C" */
 	i2c-gpio-0 {
 		compatible = "i2c-gpio";
@@ -739,6 +766,15 @@ janice_cfg1 {
 			};
 		};
 	};
+	/* Flash and torch */
+	flash {
+		gpio_flash_default_mode: flash_default {
+			janice_cfg1 {
+				pins = "GPIO140_B11", "GPIO141_C12";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
 	/* GPIO keys */
 	gpio-keys {
 		gpio_keys_default_mode: gpio_keys_default {
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
index 36420492fd72..d28a00757d0b 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
@@ -8,6 +8,7 @@
 #include "ste-ab8505.dtsi"
 #include "ste-dbx5x0-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -118,6 +119,32 @@ ktd253: backlight {
 		pinctrl-0 = <&gpio_backlight_default_mode>;
 	};
 
+	/* Richtek RT8515GQW Flash LED Driver IC */
+	flash {
+		compatible = "richtek,rt8515";
+		/* GPIO 140 */
+		enf-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+		/* GPIO 141 */
+		ent-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+		/*
+		 * RFS is 16 kOhm and RTS is 100 kOhm giving
+		 * the flash max current 343mA and torch max
+		 * current 55 mA.
+		 */
+		richtek,rfs-ohms = <16000>;
+		richtek,rts-ohms = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_flash_default_mode>;
+
+		led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			flash-max-timeout-us = <250000>;
+			flash-max-microamp = <343750>;
+			led-max-microamp = <55000>;
+		};
+	};
+
 	i2c-gpio-0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -487,6 +514,14 @@ skomer_cfg1 {
 			};
 		};
 	};
+	flash {
+		gpio_flash_default_mode: flash_default {
+			skomer_cfg1 {
+				pins = "GPIO140_B11", "GPIO141_C12";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
 	/* GPIO that enables the 2.9V SD card level translator */
 	sd-level-translator {
 		sd_level_translator_default: sd_level_translator_default {
-- 
2.29.2

