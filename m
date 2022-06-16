Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C429CC433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEB1BC3411C; Thu, 16 Jun 2022 00:54:33 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13846C3411E
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13846C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f181.google.com with SMTP id 184so12881460pga.12
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VIMCTR1frvgpFCy/vc70wP9R+xYc4n9eebnCO6KFjK8=;
        b=y+Bxfq08WOaYThdVhgYolyJaWlaGxLy4qMMds1bdhBPTxUCc9xLXz5xeMIden2601Y
         3HtiVFzLvAPtOnMIlTNzfg9DKJZMSDNdBdDu0YlKuHqSNYPbYRybUPzhL3/z8KjiRDrn
         56ACr/ghc2YFUbs4Eht7vrTfnRk+qTw5O4Jd7NmYZTKrET2qfxT/xb8ieSzSOsIbsGlO
         VP+aKEDK3jTaX4qKe9x9b3/MANx8QkHcKhvHNDF16G7wTSts97CrPiXaSyCPwrCIQHp7
         6h8iMeUHILVdnkCwhpFm+7VNKD/+A6G9vmZD6RHVBuWhIWm7Ks44zpolIrjh5OmoDWra
         r5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VIMCTR1frvgpFCy/vc70wP9R+xYc4n9eebnCO6KFjK8=;
        b=6/t2Ky7TfBUZnigrCL3dfQGGxjEZs6XZfJXE1rNvMA9NfSLadVsQBlPEdPlpaio4lD
         sYN2d2uE1PjXUjDdhRPsTmmlRzfkPh3/WcjVNTAkqZz1iMOi+p0OCLpDnt8iNfeo7i0V
         Iu0wYAfpjqJKM9u5Qwx9MkjgXFvAqgqwszeGZoN9hf8rbI8mQsUDH3T5HIkN1f3e63hk
         70SXC8UQ11nqOqXTx3N5KNVHWL1xvt+56Wqz6V0iPYbRREn8JHxgDwaLS/3vo9WOQv1H
         Rzj4+FfAEG9H2cbkwVNlt6N9xyL9CMlhLwrR0FyAtaE1h3+b+XKceHJhQEbyisPZV18L
         sV6Q==
X-Gm-Message-State: AJIora/ohX0gFwhoMiKnsjui0FFQX6K0g1qa6tRTJvZznB44LGk4Kgbo
	RHz3d4YoN7WLykoMep9RduLt8huRdpH9fQ==
X-Google-Smtp-Source: AGRyM1vwOc/dWt2kPEMzNVwZ2dJyFCYvWdzs2BG+Ys7RzoWigxYjI1adQN123ziNlVcdY4Do7Q92Pw==
X-Received: by 2002:a63:c5:0:b0:3fe:26a0:7abe with SMTP id 188-20020a6300c5000000b003fe26a07abemr2258759pga.152.1655340871718;
        Wed, 15 Jun 2022 17:54:31 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 25/40] ARM: dts: qcom: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:53:18 -0700
Message-Id: <20220616005333.18491-25-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts        | 4 ++--
 arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dts | 8 ++++----
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi             | 2 +-
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts                 | 4 ++--
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi                  | 6 +++---
 arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts  | 4 ++--
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi     | 8 ++++----
 arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts       | 6 +++---
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts        | 6 +++---
 .../dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts    | 8 ++++----
 10 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index ca9f73528196..549f3ef53b2d 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -44,12 +44,12 @@ ext_3p3v: regulator-fixed@1 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		volume_up {
+		key-volume-up {
 			label = "Volume Up";
 			gpios = <&pm8921_gpio 4 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
-		volume_down {
+		key-volume-down {
 			label = "Volume Down";
 			gpios = <&pm8921_gpio 38 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_VOLUMEDOWN>;
diff --git a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dts b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dts
index 0cee62c7b8b0..13826462fee5 100644
--- a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dts
@@ -23,28 +23,28 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
 
-		camera-focus {
+		key-camera-focus {
 			label = "camera_focus";
 			gpios = <&pm8921_gpio 3 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
 			linux,code = <KEY_CAMERA_FOCUS>;
 		};
 
-		camera-snapshot {
+		key-camera-snapshot {
 			label = "camera_snapshot";
 			gpios = <&pm8921_gpio 4 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
 			linux,code = <KEY_CAMERA>;
 		};
 
-		volume-down {
+		key-volume-down {
 			label = "volume_down";
 			gpios = <&pm8921_gpio 29 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		volume-up {
+		key-volume-up {
 			label = "volume_up";
 			gpios = <&pm8921_gpio 35 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
diff --git a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
index 1f3b1ce82108..af9a26fb5d4a 100644
--- a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
@@ -11,7 +11,7 @@ / {
 	keys {
 		compatible = "gpio-keys";
 
-		reset {
+		key-reset {
 			label = "reset";
 			gpios = <&tlmm 63 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_RESTART>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
index 596d129d4a95..760151b52add 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
@@ -187,12 +187,12 @@ partition@0 {
 			};
 		};
 
-		gpio_keys {
+		gpio-keys {
 			compatible = "gpio-keys";
 			pinctrl-0 = <&buttons_pins>;
 			pinctrl-names = "default";
 
-			button@1 {
+			button {
 				label = "reset";
 				linux,code = <KEY_RESTART>;
 				gpios = <&qcom_pinmux 66 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
index 5c802b99e15f..ccebb7d56113 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
@@ -65,19 +65,19 @@ sata@29000000 {
 			status = "okay";
 		};
 
-		gpio_keys {
+		gpio-keys {
 			compatible = "gpio-keys";
 			pinctrl-0 = <&buttons_pins>;
 			pinctrl-names = "default";
 
-			button@1 {
+			button-1 {
 				label = "reset";
 				linux,code = <KEY_RESTART>;
 				gpios = <&qcom_pinmux 54 GPIO_ACTIVE_LOW>;
 				linux,input-type = <1>;
 				debounce-interval = <60>;
 			};
-			button@2 {
+			button-2 {
 				label = "wps";
 				linux,code = <KEY_WPS_BUTTON>;
 				gpios = <&qcom_pinmux 65 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 9493886a5c0d..72e82033252e 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -24,14 +24,14 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
 
-		volume-up {
+		key-volume-up {
 			label = "volume_up";
 			gpios = <&pm8941_gpios 2 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
-		volume-down {
+		key-volume-down {
 			label = "volume_down";
 			gpios = <&pm8941_gpios 3 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
index 1d21de46f85c..e0152f118495 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -20,28 +20,28 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
 
-		volume-down {
+		key-volume-down {
 			label = "volume_down";
 			gpios = <&pm8941_gpios 2 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		camera-snapshot {
+		key-camera-snapshot {
 			label = "camera_snapshot";
 			gpios = <&pm8941_gpios 3 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
 			linux,code = <KEY_CAMERA>;
 		};
 
-		camera-focus {
+		key-camera-focus {
 			label = "camera_focus";
 			gpios = <&pm8941_gpios 4 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
 			linux,code = <KEY_CAMERA_FOCUS>;
 		};
 
-		volume-up {
+		key-volume-up {
 			label = "volume_up";
 			gpios = <&pm8941_gpios 5 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
index 58cb2ce1e4df..92857283a675 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
@@ -25,7 +25,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
 
-		camera-snapshot {
+		key-camera-snapshot {
 			label = "camera_snapshot";
 			gpios = <&pm8941_gpios 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_CAMERA>;
@@ -33,7 +33,7 @@ camera-snapshot {
 			debounce-interval = <15>;
 		};
 
-		volume-down {
+		key-volume-down {
 			label = "volume_down";
 			gpios = <&pm8941_gpios 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
@@ -41,7 +41,7 @@ volume-down {
 			debounce-interval = <15>;
 		};
 
-		volume-up {
+		key-volume-up {
 			label = "volume_up";
 			gpios = <&pm8941_gpios 5 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
index d6b2300a8223..1ed40c14f9d3 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
@@ -25,7 +25,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
 
-		volume-down {
+		key-volume-down {
 			label = "volume_down";
 			gpios = <&pma8084_gpios 2 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
@@ -33,7 +33,7 @@ volume-down {
 			debounce-interval = <15>;
 		};
 
-		home-key {
+		key-home {
 			label = "home_key";
 			gpios = <&pma8084_gpios 3 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
@@ -42,7 +42,7 @@ home-key {
 			debounce-interval = <15>;
 		};
 
-		volume-up {
+		key-volume-up {
 			label = "volume_up";
 			gpios = <&pma8084_gpios 5 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 9bd8faea61a5..e409c12edc81 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -24,28 +24,28 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
 
-		volume-down {
+		key-volume-down {
 			label = "volume_down";
 			gpios = <&pm8941_gpios 2 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		camera-snapshot {
+		key-camera-snapshot {
 			label = "camera_snapshot";
 			gpios = <&pm8941_gpios 3 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
 			linux,code = <KEY_CAMERA>;
 		};
 
-		camera-focus {
+		key-camera-focus {
 			label = "camera_focus";
 			gpios = <&pm8941_gpios 4 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
 			linux,code = <KEY_CAMERA_FOCUS>;
 		};
 
-		volume-up {
+		key-volume-up {
 			label = "volume_up";
 			gpios = <&pm8941_gpios 5 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
-- 
2.34.1

