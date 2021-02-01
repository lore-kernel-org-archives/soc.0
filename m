Return-Path: <SRS0=ZBoG=HD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EECEC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 09:14:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C557764E57
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 09:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C557764E57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OMAv4sz6JsnWRM+i/5SZwUJJh4ljUYp5Q7B6F3lAnw4=; b=QVwvGaZZ4wRysi7tpzDglvNlvK
	DTUsTOuDvS5RVSixHmS4cVAc4rcGFMsLUgFTas3IIDyp/ZpnAnHtm9NlaYKzXsba6APA3/75QvasK
	q6YzWJPu+5pASAWqCykE2Mnt1Hjx7NKLjBH7xwC/kIrenHsoTzwFWsznEEIbBIP1XXwENmIsApMXH
	Jw++W+FTrOLD/J2ijwfJ6oGAcjR0To4K5DC9Z34wje6iw/90xUMSFoJvEMwUWu0DPJVrYzCOMNmCU
	RTIvMq94o/nE2GXutYFgxYKyHrmW3r63jHmQp/wyq59AYFQ9xXxmtMiemwVwRwfGqw+YLKBJ6ChA8
	N4Acaikg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6VGs-0005e9-Kt; Mon, 01 Feb 2021 09:13:22 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6VGo-0005dj-RN
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Feb 2021 09:13:20 +0000
Received: by mail-lj1-x231.google.com with SMTP id a25so18666163ljn.0
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 01 Feb 2021 01:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
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
 b=mFXaicV1tYnHr/QSB6DOBv+h0yarxwz3BQKM6ol8Pf87pbuNv3MvyQoaSXdinzjnhn
 RdlS0RII9uZ+FSsx8Hu0PcP7RqoeowpQ8EkAxvWsTU6QVbs9N4j8KdjiMVXN6eKbPo1H
 n3ozQr8gkCRnfUggeAiRytxm+wi71F8icpPIfPN2FLmiHu9N7eurKLlLNgSZE8e1tTCn
 lGnUNezRnuW/uUKg1yQO0PabgvVUd/mFYvhCNPINUfFe68SvDRn8otadZQ3HiTvWqnXY
 s9UIXCCxV+JldicEBd++NRAJvg0lKJmRNuf7XssMta91Yqo7GrOBKAboq4/HuV0Tb44N
 UTjw==
X-Gm-Message-State: AOAM5306G7PonaG9P7iJzUp4AXE3tsoxTSzKolyDBXf7+E0W26iseOVg
 c/TPsPFHcWquzYvHyxhwS+EhYQ==
X-Google-Smtp-Source: ABdhPJzStSOsZDhBZVeH7n4/PZVWrjzjxwDD/msE3r/i9drcj6hVhUteBKatmvqVOlD6K1JxNXhj2w==
X-Received: by 2002:a2e:9b8f:: with SMTP id z15mr10239725lji.295.1612170794765; 
 Mon, 01 Feb 2021 01:13:14 -0800 (PST)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id u4sm2939929lfc.277.2021.02.01.01.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 01:13:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [PATCH] ARM: dts: ux500: Add Flash LEDs to Samsung phones
Date: Mon,  1 Feb 2021 10:13:08 +0100
Message-ID: <20210201091308.284465-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_041319_011606_0FAA90E4 
X-CRM114-Status: GOOD (  16.07  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210201091308.MHKYamwe27CzP7edsgid8OtogADN9_2w1nokseGzDVk@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
