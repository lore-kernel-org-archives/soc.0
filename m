Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2CAC433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 909B8C3411C; Thu, 16 Jun 2022 00:54:07 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70BDAC341C5
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70BDAC341C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id x138so88502pfc.12
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NYl7yU1ssVY0Vfpt/Py3PewLqdiiGecx6/cVKRT0JHY=;
        b=dm5nbwkxZllaRsb/zScP9QnPI/5s6DTndDzWLHFVX63/hAfYmPaCQGPKrqnY5wB3Uz
         F4ss39OA/2/JpsrlPsRQC7paCL03+iDH5KieRHvmiT09oKkpsrmZK0lvefR84CA2DeI1
         jUqRUDzzmiPdVxjhOX72ZC7/HJRMUCDagXRgDAHwUKuHkeFDPPnOTqFsnJKAIP15xrYC
         wKAr8agxtf4bYDLydGLQkd37yisL1YWd5t93yx+HB6M4JNaMSumvIt03TqTAuTgr7te3
         jQ7qhF6nz0+7oey8MYvzDWzZpmnX06noEW6e1QBUv4zT1Di21OLJZpIUDy7T24XfSvZ4
         bAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NYl7yU1ssVY0Vfpt/Py3PewLqdiiGecx6/cVKRT0JHY=;
        b=tJkB0xf4FmaE8W9PgQptQouO5IFCUEDYDa1fU40cS0fdMYiW3EmI9YvD/sO0ny8dbL
         aiQCAFkXx83d+1Yo9+UeU5NFfJLsmpG1+aF0owjY/dSoKMVgdXMLOuEfsEuH/eTlmK8b
         uX7y95zO1sNND3ur8qe5hW6g2i0/9CZKczmNrdmxs2Gk4m7iIAbRriZU2JCTUZBkyJ4i
         9bfb93Mp+w2Sr1zjISlYKUu2QrNGgYLkpANejVViRxb0kxwFozhg/GATmEDQ1HyxpXvU
         +bQi9hg4Pyb5qcJ5jvgDUShaDp4fKZ86SBF+vYbwnr0ZVy2WfxqMvCNTZQOangSXOEuA
         TsVQ==
X-Gm-Message-State: AJIora84P0oujy7Z4L2VOxm0lQ6yLDHKBEx1MV2kAr/TyyvZYjvtASNN
	cTGOp3CtXs3rvExfxWtIb/EbcA==
X-Google-Smtp-Source: AGRyM1tzDpIHFKCISOtxqgR7W0ZG/z3oO72AWo6nlr7LRUFRzCuzaNfOWw4e4mTf61SXfjZX/N2m+Q==
X-Received: by 2002:a05:6a00:2447:b0:520:6b82:6dfd with SMTP id d7-20020a056a00244700b005206b826dfdmr2274408pfj.39.1655340844654;
        Wed, 15 Jun 2022 17:54:04 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 07/40] arm64: dts: freescale: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:53:00 -0700
Message-Id: <20220616005333.18491-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts       | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 6 +++---
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi   | 8 ++++----
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts    | 8 ++++----
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts    | 8 ++++----
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts    | 6 +++---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi          | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 6 +++---
 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts    | 8 ++++----
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi          | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts   | 6 +++---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi         | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts         | 2 +-
 .../arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi                 | 6 +++---
 15 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index d3f03dcbb8c3..aa38f5379558 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -35,14 +35,14 @@ buttons {
 		 * external power off (e.g ATX Power Button)
 		 * asserted
 		 */
-		powerdn {
+		button-powerdn {
 			label = "External Power Down";
 			gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 		};
 
 		/* Rear Panel 'ADMIN' button (GPIO_H) */
-		admin {
+		button-admin {
 			label = "ADMIN button";
 			gpios = <&gpio3 8 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_WPS_BUTTON>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index ac1fe1530ac7..d643381417f1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -36,19 +36,19 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		back {
+		key-back {
 			label = "Back";
 			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_BACK>;
 		};
 
-		home {
+		key-home {
 			label = "Home";
 			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOME>;
 		};
 
-		menu {
+		key-menu {
 			label = "Menu";
 			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_MENU>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
index 8a496aa09072..66a0d103c90f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
@@ -16,13 +16,13 @@ memory@40000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		user-pb {
+		key-user-pb {
 			label = "user_pb";
 			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
 			linux,code = <BTN_0>;
 		};
 
-		user-pb1x {
+		key-user-pb1x {
 			label = "user_pb1x";
 			linux,code = <BTN_1>;
 			interrupt-parent = <&gsc>;
@@ -36,14 +36,14 @@ key-erased {
 			interrupts = <1>;
 		};
 
-		eeprom-wp {
+		key-eeprom-wp {
 			label = "eeprom_wp";
 			linux,code = <BTN_3>;
 			interrupt-parent = <&gsc>;
 			interrupts = <2>;
 		};
 
-		tamper {
+		key-tamper {
 			label = "tamper";
 			linux,code = <BTN_4>;
 			interrupt-parent = <&gsc>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
index 24737e89038a..35fb929e7bcc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
@@ -38,13 +38,13 @@ memory@40000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		user-pb {
+		key-user-pb {
 			label = "user_pb";
 			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
 			linux,code = <BTN_0>;
 		};
 
-		user-pb1x {
+		key-user-pb1x {
 			label = "user_pb1x";
 			linux,code = <BTN_1>;
 			interrupt-parent = <&gsc>;
@@ -58,14 +58,14 @@ key-erased {
 			interrupts = <1>;
 		};
 
-		eeprom-wp {
+		key-eeprom-wp {
 			label = "eeprom_wp";
 			linux,code = <BTN_3>;
 			interrupt-parent = <&gsc>;
 			interrupts = <2>;
 		};
 
-		tamper {
+		key-tamper {
 			label = "tamper";
 			linux,code = <BTN_4>;
 			interrupt-parent = <&gsc>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
index 407ab4592b4c..79107e287d92 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
@@ -42,13 +42,13 @@ can20m: can20m {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		user-pb {
+		key-user-pb {
 			label = "user_pb";
 			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
 			linux,code = <BTN_0>;
 		};
 
-		user-pb1x {
+		key-user-pb1x {
 			label = "user_pb1x";
 			linux,code = <BTN_1>;
 			interrupt-parent = <&gsc>;
@@ -62,14 +62,14 @@ key-erased {
 			interrupts = <1>;
 		};
 
-		eeprom-wp {
+		key-eeprom-wp {
 			label = "eeprom_wp";
 			linux,code = <BTN_3>;
 			interrupt-parent = <&gsc>;
 			interrupts = <2>;
 		};
 
-		tamper {
+		key-tamper {
 			label = "tamper";
 			linux,code = <BTN_4>;
 			interrupt-parent = <&gsc>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
index a7dae9bd4c11..a65761a53f23 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
@@ -33,13 +33,13 @@ memory@40000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		user-pb {
+		key-user-pb {
 			label = "user_pb";
 			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
 			linux,code = <BTN_0>;
 		};
 
-		user-pb1x {
+		key-user-pb1x {
 			label = "user_pb1x";
 			linux,code = <BTN_1>;
 			interrupt-parent = <&gsc>;
@@ -53,7 +53,7 @@ key-erased {
 			interrupts = <1>;
 		};
 
-		eeprom-wp {
+		key-eeprom-wp {
 			label = "eeprom_wp";
 			linux,code = <BTN_3>;
 			interrupt-parent = <&gsc>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index eafa88d980b3..a8c329cb4c28 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -43,7 +43,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpio_keys>;
 
-		wakeup {
+		key-wakeup {
 			debounce-interval = <10>;
 			/* Verdin CTRL_WAKE1_MICO# (SODIMM 252) */
 			gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index f61c48776cf3..3ed7021a487c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -26,19 +26,19 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		back {
+		key-back {
 			label = "Back";
 			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_BACK>;
 		};
 
-		home {
+		key-home {
 			label = "Home";
 			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOME>;
 		};
 
-		menu {
+		key-menu {
 			label = "Menu";
 			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_MENU>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts b/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
index 367a232675aa..636f8602b979 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
@@ -39,13 +39,13 @@ can20m: can20m {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		user-pb {
+		key-user-pb {
 			label = "user_pb";
 			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
 			linux,code = <BTN_0>;
 		};
 
-		user-pb1x {
+		key-user-pb1x {
 			label = "user_pb1x";
 			linux,code = <BTN_1>;
 			interrupt-parent = <&gsc>;
@@ -59,14 +59,14 @@ key-erased {
 			interrupts = <1>;
 		};
 
-		eeprom-wp {
+		key-eeprom-wp {
 			label = "eeprom_wp";
 			linux,code = <BTN_3>;
 			interrupt-parent = <&gsc>;
 			interrupts = <2>;
 		};
 
-		tamper {
+		key-tamper {
 			label = "tamper";
 			linux,code = <BTN_4>;
 			interrupt-parent = <&gsc>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index fb17e329cd37..8c38f89df0ad 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -49,7 +49,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpio_keys>;
 
-		wakeup {
+		button-wakeup {
 			debounce-interval = <10>;
 			/* Verdin CTRL_WAKE1_MICO# (SODIMM 252) */
 			gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index b86f188a440d..6445c6b90b5b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -36,21 +36,21 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpio_keys>;
 
-		btn1 {
+		button-1 {
 			label = "VOL_UP";
 			gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 			wakeup-source;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
-		btn2 {
+		button-2 {
 			label = "VOL_DOWN";
 			gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
 			wakeup-source;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		wwan-wake {
+		button-3 {
 			label = "WWAN_WAKE";
 			gpios = <&gpio3 8 GPIO_ACTIVE_LOW>;
 			interrupt-parent = <&gpio3>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 587e55aaa57b..9eec8a7eecfc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -37,7 +37,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_keys>;
 
-		vol-down {
+		key-vol-down {
 			label = "VOL_DOWN";
 			gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
@@ -45,7 +45,7 @@ vol-down {
 			wakeup-source;
 		};
 
-		vol-up {
+		key-vol-up {
 			label = "VOL_UP";
 			gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
index a89546b39095..9dda2a1554c3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
@@ -26,7 +26,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpio_keys>;
 
-		power {
+		button-power {
 			label = "Power Button";
 			gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi
index e3f161a10448..a08e70fb7c7a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi
@@ -16,7 +16,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpiokeys>;
 
-		wakeup {
+		key-wakeup {
 			label = "Wake-Up";
 			gpios = <&lsio_gpio3 10 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_WAKEUP>;
diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index c2f0f1a1566c..aab1aee49893 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -26,21 +26,21 @@ gpio-keys {
 		pinctrl-0 = <&pinctrl_gpiobutton>;
 		autorepeat;
 
-		switch1 {
+		switch-1 {
 			label = "switch1";
 			linux,code = <BTN_0>;
 			gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
 			wakeup-source;
 		};
 
-		btn2: switch2 {
+		btn2: switch-2 {
 			label = "switch2";
 			linux,code = <BTN_1>;
 			gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
 			wakeup-source;
 		};
 
-		switch3 {
+		switch-3 {
 			label = "switch3";
 			linux,code = <BTN_2>;
 			gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
-- 
2.34.1

