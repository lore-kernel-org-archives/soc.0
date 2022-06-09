Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41922C433EF
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F4C1C341CD; Thu,  9 Jun 2022 11:40:24 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9079DC341C0
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9079DC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id me5so46370750ejb.2
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AlVYTGpdyD/4RoZufqMfUAtnxIkgzdNZQq9JlVcPm2M=;
        b=wxAnFTfE1Q7Zm30aGELUytykVCqN/6lym2KHsshodGZw3e48MttI3JYTH7ksP24w8w
         gcoL7/WWYNmHaEvCxhL3dAmr7RIZx+isUKVQi6gPSIgNPGC0CbhfUleJ6cXnmU7Ds+tn
         DQCVs6sPeMmv45MX0KDbWaUmWY7F/9f/7kDDT+rgcTkrYYYVvYjBMssDIH2oUfEzVhcx
         gIHHZQOtgCaRQ0tNwyKRlEzV59IgotSL7Qk7p/XPauflIGqpZz0/YgAjP3YtWy0MGGOQ
         ZyMlSNochSnGZ9zMqzXnSwQu+wKdzUe0IMi1/1P1GU8EDmiVndIClthhcWN1WimzuU1V
         gTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AlVYTGpdyD/4RoZufqMfUAtnxIkgzdNZQq9JlVcPm2M=;
        b=Xd/1skCWmKQ1rRNydvGqgaydbNUV9ZU8//EfJpfapMuIa17myLGZT39TQs/iTn18vw
         FZ908b9vmjMfEWj8XZjAPRIKiEX+hAtGg9JR9qDBrJN4jC4gcsFp1FRJsvYxSUnDYd7r
         gNibG07htvJYnJ6eL3rNot+D0uM6HVlVUy1wwLs/1t3grBbNKPYAHb3l5G3exxc5yz2o
         fnCUjzMb8g5RL8QIdYKd7EOaZGgY0yWPINSs6Setg5F3gWECwpZ0k3EF2EF4eWshLxab
         vbC4KyWQ9ySk1t8ujxI8mWyx6YWabk+CVoun4/N6TgkF83UJcmD4+5OglDgbwOJKT2HM
         fVlg==
X-Gm-Message-State: AOAM53105Fwn4cQRtsiNGN9cRJAbiAYuDQuXtxiNadwaN78wlvYSunlz
	OQ8tNn9gvsfkPIKS9A2XQZn0pQ==
X-Google-Smtp-Source: ABdhPJxXw+ZR2TDeopukgwrEhWfDrwekxalrADX8jDFEbvAO1nHqPBv7LyBnA7aVusYcHtGEg6A/Qg==
X-Received: by 2002:a17:907:86ac:b0:708:9c4a:c6e9 with SMTP id qa44-20020a17090786ac00b007089c4ac6e9mr36074394ejc.297.1654774821875;
        Thu, 09 Jun 2022 04:40:21 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b006ff59151e34sm10638441ejb.39.2022.06.09.04.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:21 -0700 (PDT)
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
Subject: [PATCH v2 28/48] arm64: dts: qcom: correct gpio-keys properties
Date: Thu,  9 Jun 2022 13:40:01 +0200
Message-Id: <20220609114002.380563-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts               |  4 +---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts            |  4 +---
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts      |  4 +---
 .../boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi    | 10 ++++------
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts        |  2 --
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi  |  2 --
 .../boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts  |  2 --
 7 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 7c1eab605c15..21242919fe18 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -92,14 +92,12 @@ hdmi_con: endpoint {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&msm_key_volp_n_default>;
 
-		button@0 {
+		button {
 			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 1dbfedd5711c..ba76d4620224 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -84,14 +84,12 @@ div1_mclk: divclk1 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&volume_up_gpio>;
 
-		button@0 {
+		button {
 			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&pm8994_gpios 2 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index cdb2dfe02e56..04887182bca3 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -53,11 +53,9 @@ framebuffer0: framebuffer@3400000 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
 
-		button@0 {
+		button {
 			label = "Volume Up";
 			gpios = <&pm8994_gpios 3 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 0fb12db47d6e..f430d797196f 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -29,11 +29,9 @@ / {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
 
-		button@0 {
+		button-0 {
 			label = "Volume Down";
 			gpios = <&pm8994_gpios 2 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
@@ -42,7 +40,7 @@ button@0 {
 			debounce-interval = <15>;
 		};
 
-		button@1 {
+		button-1 {
 			label = "Volume Up";
 			gpios = <&pm8994_gpios 3 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
@@ -51,7 +49,7 @@ button@1 {
 			debounce-interval = <15>;
 		};
 
-		button@2 {
+		button-2 {
 			label = "Camera Snapshot";
 			gpios = <&pm8994_gpios 4 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
@@ -60,7 +58,7 @@ button@2 {
 			debounce-interval = <15>;
 		};
 
-		button@3 {
+		button-3 {
 			label = "Camera Focus";
 			gpios = <&pm8994_gpios 5 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index 1ffe72b47f67..6a200f37c035 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -101,8 +101,6 @@ key-alt {
 	gpio-keys {
 		compatible = "gpio-keys";
 		label = "Side buttons";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&vol_up_pin_a>, <&cam_focus_pin_a>,
 			    <&cam_snapshot_pin_a>;
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index bc06b485897c..42e89f41eb7d 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -90,8 +90,6 @@ cam_vana_rear_vreg: cam_vana_rear_vreg {
 	gpio-keys {
 		status = "okay";
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		key-camera-focus {
 			label = "Camera Focus";
diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index f933b6c4f763..c9f195649954 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -42,8 +42,6 @@ extcon_usb: extcon-usb {
 	gpio-keys {
 		status = "okay";
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
 
 		key-vol-dn {
-- 
2.34.1

