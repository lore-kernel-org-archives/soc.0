Return-Path: <SRS0=dVdc=A7=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD619C77B7C
	for <soc@archiver.kernel.org>; Wed, 10 May 2023 10:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E18EC4339C; Wed, 10 May 2023 10:52:05 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D578C433D2
	for <soc@kernel.org>; Wed, 10 May 2023 10:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D578C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4efe8991b8aso8147356e87.0
        for <soc@kernel.org>; Wed, 10 May 2023 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683715922; x=1686307922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mfIOE2biOcQKiCde/r4ioJC3kNjxCZ4xuk17Io9jbLw=;
        b=LrLL+kX2R1Mc2jljtCstopNqdCwpUAoqtZpBSf9YD1JjJqqyklePvYu9g9moOHUYMA
         lmpVCsrTP/FthGvc99nVHKFZv/EXPDHyKlmCGES4p4CajK1yClYaS5O2GK4uK6nApC0t
         V8WyzkkjEtYfpSRac8UnbHRYlEiv3gbGOEwjkesGg3Ya3B2WAUAbNiKFCBPD7oC05+8e
         zEP8KCnIEv1Wtk33X0qh5p+c4urift5wcKpP/9szIxrXsAsCnZpPDJ/Iq8S/26cntPDv
         99s9KUgyaqj5LkIiFl6TduLg5CzCClkebs7DW3J0FAF/eayEb1ajMy/nNEF9K8POFAmB
         dpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683715922; x=1686307922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfIOE2biOcQKiCde/r4ioJC3kNjxCZ4xuk17Io9jbLw=;
        b=Sau5xQZQzovnUtazgaIUMNwhumL8R+2fbQ0G9v1Ix6ItEvW2Yx/qLPW33Dk1FQYZKL
         nb3/w8k5rLDC5nTnI2KjorTpUUasLParM4cEuMH5F7w/EGQMADIKkOUIO2TDZgxhn/BM
         ldbjhQjNO+N5eUsXHUCo9EMwKCb7vQA7BhLrRJVRh/nQWrPK7r5NPDQr+B+oXSiMnX82
         LiQuOjGSrrhcB390Q8PuguQAIpEJme886uodyQoozFv3pS2yKROp4d4knmuQNG7yHcBz
         GqNBKEW/uxJbvUWPp7Pd9dYS8xDbLyBIfS6ufx+M3VwYCMJtTKejGBzLZIMAFuiEqyzC
         X1lQ==
X-Gm-Message-State: AC+VfDwV6e6F4+uKzAl5DS4E2YMW3WhsRTrJ+wmq/ARi/qcw+AHLToAh
	gldDykOHrgyrV8NgvMDbv4NWCA==
X-Google-Smtp-Source: ACHHUZ7ghQIINlMNKEXjhFJjGVe2Z3vKWDfWrLHmrVKeLuM+eDzYl6sctlVaQgOZbg1PbJBoeEC0VQ==
X-Received: by 2002:a05:6512:509:b0:4ec:8853:136 with SMTP id o9-20020a056512050900b004ec88530136mr108810lfb.12.1683715921964;
        Wed, 10 May 2023 03:52:01 -0700 (PDT)
Received: from Linus-Dell.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id j15-20020ac253af000000b004edc76b6aabsm687394lfh.209.2023.05.10.03.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 03:52:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: Fix erroneous ADS touchscreen polarities
Date: Wed, 10 May 2023 12:51:56 +0200
Message-Id: <20230510105156.1134320-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several device tree files get the polarity of the pendown-gpios
wrong: this signal is active low. Fix up all incorrect flags, so
that operating systems can rely on the flag being correctly set.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please merge this patch directly for DTS low
urgency fixes, the Linux kernel will not be affected since the
polarity is ignored in current codebase (but we expect to change
that for v6.5).
---
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts          | 2 +-
 arch/arm/boot/dts/at91sam9261ek.dts                | 2 +-
 arch/arm/boot/dts/imx7d-pico-hobbit.dts            | 2 +-
 arch/arm/boot/dts/imx7d-sdb.dts                    | 2 +-
 arch/arm/boot/dts/omap3-cm-t3x.dtsi                | 2 +-
 arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi | 2 +-
 arch/arm/boot/dts/omap3-lilly-a83x.dtsi            | 2 +-
 arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi    | 2 +-
 arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi    | 2 +-
 arch/arm/boot/dts/omap3-pandora-common.dtsi        | 2 +-
 arch/arm/boot/dts/omap5-cm-t54.dts                 | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
index 2fc9a5d5e0c0..625b9b311b49 100644
--- a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
@@ -527,7 +527,7 @@ touchscreen@1 {
 
 		interrupt-parent = <&gpio1>;
 		interrupts = <31 0>;
-		pendown-gpio = <&gpio1 31 0>;
+		pendown-gpio = <&gpio1 31 GPIO_ACTIVE_LOW>;
 
 
 		ti,x-min = /bits/ 16 <0x0>;
diff --git a/arch/arm/boot/dts/at91sam9261ek.dts b/arch/arm/boot/dts/at91sam9261ek.dts
index 88869ca874d1..045cb253f23a 100644
--- a/arch/arm/boot/dts/at91sam9261ek.dts
+++ b/arch/arm/boot/dts/at91sam9261ek.dts
@@ -156,7 +156,7 @@ tsc2046@2 {
 					compatible = "ti,ads7843";
 					interrupts-extended = <&pioC 2 IRQ_TYPE_EDGE_BOTH>;
 					spi-max-frequency = <3000000>;
-					pendown-gpio = <&pioC 2 GPIO_ACTIVE_HIGH>;
+					pendown-gpio = <&pioC 2 GPIO_ACTIVE_LOW>;
 
 					ti,x-min = /bits/ 16 <150>;
 					ti,x-max = /bits/ 16 <3830>;
diff --git a/arch/arm/boot/dts/imx7d-pico-hobbit.dts b/arch/arm/boot/dts/imx7d-pico-hobbit.dts
index d917dc4f2f22..6ad39dca7009 100644
--- a/arch/arm/boot/dts/imx7d-pico-hobbit.dts
+++ b/arch/arm/boot/dts/imx7d-pico-hobbit.dts
@@ -64,7 +64,7 @@ ads7846@0 {
 		interrupt-parent = <&gpio2>;
 		interrupts = <7 0>;
 		spi-max-frequency = <1000000>;
-		pendown-gpio = <&gpio2 7 0>;
+		pendown-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&reg_3p3v>;
 		ti,x-min = /bits/ 16 <0>;
 		ti,x-max = /bits/ 16 <4095>;
diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index f483bc0afe5e..234e5fc647b2 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -205,7 +205,7 @@ tsc2046@0 {
 		pinctrl-0 = <&pinctrl_tsc2046_pendown>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <29 0>;
-		pendown-gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio2 29 GPIO_ACTIVE_LOW>;
 		touchscreen-max-pressure = <255>;
 		wakeup-source;
 	};
diff --git a/arch/arm/boot/dts/omap3-cm-t3x.dtsi b/arch/arm/boot/dts/omap3-cm-t3x.dtsi
index e61b8a2bfb7d..51baedf1603b 100644
--- a/arch/arm/boot/dts/omap3-cm-t3x.dtsi
+++ b/arch/arm/boot/dts/omap3-cm-t3x.dtsi
@@ -227,7 +227,7 @@ ads7846@0 {
 
 		interrupt-parent = <&gpio2>;
 		interrupts = <25 0>;		/* gpio_57 */
-		pendown-gpio = <&gpio2 25 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio2 25 GPIO_ACTIVE_LOW>;
 
 		ti,x-min = /bits/ 16 <0x0>;
 		ti,x-max = /bits/ 16 <0x0fff>;
diff --git a/arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi b/arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi
index 3decc2d78a6c..a7f99ae0c1fe 100644
--- a/arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi
+++ b/arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi
@@ -54,7 +54,7 @@ ads7846@0 {
 
 		interrupt-parent = <&gpio1>;
 		interrupts = <27 0>;		/* gpio_27 */
-		pendown-gpio = <&gpio1 27 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio1 27 GPIO_ACTIVE_LOW>;
 
 		ti,x-min = /bits/ 16 <0x0>;
 		ti,x-max = /bits/ 16 <0x0fff>;
diff --git a/arch/arm/boot/dts/omap3-lilly-a83x.dtsi b/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
index c595afe4181d..d310b5c7bac3 100644
--- a/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
+++ b/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
@@ -311,7 +311,7 @@ tsc2046@0 {
 		interrupt-parent = <&gpio1>;
 		interrupts = <8 0>;   /* boot6 / gpio_8 */
 		spi-max-frequency = <1000000>;
-		pendown-gpio = <&gpio1 8 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&reg_vcc3>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&tsc2048_pins>;
diff --git a/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi b/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
index 1d6e88f99eb3..c3570acc35fa 100644
--- a/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
@@ -149,7 +149,7 @@ ads7846@0 {
 
 		interrupt-parent = <&gpio4>;
 		interrupts = <18 0>;			/* gpio_114 */
-		pendown-gpio = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio4 18 GPIO_ACTIVE_LOW>;
 
 		ti,x-min = /bits/ 16 <0x0>;
 		ti,x-max = /bits/ 16 <0x0fff>;
diff --git a/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi b/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
index 7e30f9d45790..d95a0e130058 100644
--- a/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
@@ -160,7 +160,7 @@ ads7846@0 {
 
 		interrupt-parent = <&gpio4>;
 		interrupts = <18 0>;			/* gpio_114 */
-		pendown-gpio = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio4 18 GPIO_ACTIVE_LOW>;
 
 		ti,x-min = /bits/ 16 <0x0>;
 		ti,x-max = /bits/ 16 <0x0fff>;
diff --git a/arch/arm/boot/dts/omap3-pandora-common.dtsi b/arch/arm/boot/dts/omap3-pandora-common.dtsi
index 559853764487..4c3b6bab179c 100644
--- a/arch/arm/boot/dts/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/omap3-pandora-common.dtsi
@@ -651,7 +651,7 @@ tsc2046@0 {
 		pinctrl-0 = <&penirq_pins>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <30 IRQ_TYPE_NONE>;	/* GPIO_94 */
-		pendown-gpio = <&gpio3 30 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio3 30 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&vaux4>;
 
 		ti,x-min = /bits/ 16 <0>;
diff --git a/arch/arm/boot/dts/omap5-cm-t54.dts b/arch/arm/boot/dts/omap5-cm-t54.dts
index 2d87b9fc230e..af288d63a26a 100644
--- a/arch/arm/boot/dts/omap5-cm-t54.dts
+++ b/arch/arm/boot/dts/omap5-cm-t54.dts
@@ -354,7 +354,7 @@ ads7846@0 {
 
 		interrupt-parent = <&gpio1>;
 		interrupts = <15 0>;			/* gpio1_wk15 */
-		pendown-gpio = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio1 15 GPIO_ACTIVE_LOW>;
 
 
 		ti,x-min = /bits/ 16 <0x0>;
-- 
2.34.1

