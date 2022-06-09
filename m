Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6BCC43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A2B4C3411F; Thu,  9 Jun 2022 11:40:35 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B838C3411B
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B838C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id v1so36213738ejg.13
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VIMCTR1frvgpFCy/vc70wP9R+xYc4n9eebnCO6KFjK8=;
        b=e87w43dqaKRQ7Z/dx+eIcL+FrCawq+shSTObf8LVjoQtraBFuU9aOy5zqaETz0fAu5
         sOjEiZqfSRL1Qvn3y+om0xZsVLmMggAgQPn9t0SJ2S3xMtB+MTRF2tmyOUw3yF9MNQR5
         fejPJ/pGRUhL66yMSYmRWbgVSUGuuqOZkwpB6jmoVgIY3Qlg15kXmqmCBlyynUfjLaEq
         srqqTDE6kT9Vtl50jxgDHRowOHnGC+Da8f8+QUd36Vs8YMzAP+tFMjRLSn8aNTiHQz/K
         uuFUbdx5SXkCMdhX6JegFLquuwlb/q1x+JeEj4uugHxcUwWZjvTiuwZvNUwGnOxBMEcj
         UOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VIMCTR1frvgpFCy/vc70wP9R+xYc4n9eebnCO6KFjK8=;
        b=vjw/inxdPBJzRsrD1mc+ByoiEoZ2EbbRab+kMdyf1gL8DZTduwNenMruvaXuVGS6A2
         wNFxZDvvQiD8a/q+H67/nSLYDoshkevH90yUoxeXyZjwzNJqVNCpD3/ICtqrwMLSpVQe
         kTNVz0aDG9+yNHM8GyCaUD/QLXUyCGdDUnvGI+25nYZDtPPjkepq+4QPMiN8Mr9M14NA
         o1cXbn9n2uTUEd/pczF1kjlHZwlnUKF5d4ZQbAoSG15wHCrugcmsM4yKcactcsnEDsjp
         j8KzWNwtgCwNYva2HTjyx/iqDyWHJNVw+MAZSg+h2FEizkynr8veBHGpnSTn8hmGME1F
         UVmg==
X-Gm-Message-State: AOAM533JLWaDq8OMcqUZbrl4nOy0OVycIlf+fd0JdCwfoQLTII6zZDRp
	hNZE1xsbn8FberZZVe48num7tg==
X-Google-Smtp-Source: ABdhPJxg5RjCwZhjIijeZmNGh2LNUXMbxIJjQHT/neGfAI+evNUZBpeF4c5I0UK2Tq9zSG8JegRfWg==
X-Received: by 2002:a17:907:1310:b0:709:bfa:4f3e with SMTP id vj16-20020a170907131000b007090bfa4f3emr28754314ejb.589.1654774833043;
        Thu, 09 Jun 2022 04:40:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906058a00b007101f6f0720sm7760844ejn.120.2022.06.09.04.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 31/48] ARM: dts: qcom: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:40:18 +0200
Message-Id: <20220609114026.380682-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
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

