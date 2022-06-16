Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C71C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32B07C3411A; Thu, 16 Jun 2022 00:54:44 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73136C3411C
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73136C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id f65so12907315pgc.7
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDp4i9fK6ZlNgpwtecp/EcLoXznY+8QAd3GbFyU5H28=;
        b=sQFWVugTKfxkM3FYLe8fA9qt8IbPmRaJCz6KfPIj9CmpsllvH84Mg3v8tQ6IhPc3SS
         zc8Dtc4c8u9Hl8Ow22OSqpjd6wyCAFkRjyHiiad8/aYi69QpE0IqQMfVlD7xaj4b9VBa
         0l/ZkdJPB4EwB+KCvM1bl4Okes4z29IqbXC4kMKu3a8fLCrsslykIIB/f5nooNIkZjXl
         suYIwd3Vtj0XIgpo2TLLQlZ5886Y8K+MYCh4WfzVO/hOl9Dku/MMeLqYhkzBVG1HR/F4
         ocsmZWX0x9onjWimnY8ko3zyqpSSv89tr2whubCAiby6jnXK83QOFnbVwDH6ljEDQIYv
         z0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDp4i9fK6ZlNgpwtecp/EcLoXznY+8QAd3GbFyU5H28=;
        b=ya1jTLwpBUtA7tsLaCVlA4rIi11SU/Po/iS4oozMhR41x+nbgsys1L0N07GFfvCsbY
         PQrSJHwEcut1rA2KpI7VXrf6/HO2zMMvKJpnLRZ3zSVdMFRs7gmevsJCAJ0JQHu3pvnm
         2VhhHk/7ndD/zYCGchNA4TvNydVz6bPTe8eoZHgYfBSlgvpbbp6daPiE7XMZwyaoQj1k
         CipxdqnUpMB6GJu4w+L/A3+1AuGx1lj+LLqKpiFgNuBD0Xr6xlnSquPDK27b0JoXo0y5
         jilruFcqYnD59JhJOP3s05sWB7VefY476EKR9Le8sJbqPCwWM5BOI4oNj6rMO6oTWcSD
         EnUw==
X-Gm-Message-State: AJIora8G2wtMHuhrEhm5iBVw2zVJFD/1mFV7ycdUL5cEWfWSHc2Np1Fk
	Bbzc1OBFO9tiQaiVJPOmR/3feA==
X-Google-Smtp-Source: AGRyM1v6FOhhaKzh+JdhBC9cu610BDMkWk1LO+sEVJbXFRIOwm8ZKRuSwp9M2dzz1kigPNKkrweZEA==
X-Received: by 2002:a63:1566:0:b0:405:3aa3:23de with SMTP id 38-20020a631566000000b004053aa323demr2137255pgv.528.1655340882982;
        Wed, 15 Jun 2022 17:54:42 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 33/40] ARM: dts: omap: correct gpio-keys properties
Date: Wed, 15 Jun 2022 17:53:26 -0700
Message-Id: <20220616005333.18491-33-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/am335x-evm.dts                  | 2 --
 arch/arm/boot/dts/am335x-guardian.dts             | 2 --
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi | 4 +---
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi | 4 +---
 arch/arm/boot/dts/am335x-pcm-953.dtsi             | 4 ++--
 arch/arm/boot/dts/am335x-pepper.dts               | 8 +++-----
 arch/arm/boot/dts/am437x-idk-evm.dts              | 4 +---
 7 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index 730898310641..25c6ac9913d2 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -94,8 +94,6 @@ &gpio1 26 GPIO_ACTIVE_HIGH		/* Bank1, pin26 */
 
 	gpio_keys: volume-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
 
 		switch-9 {
diff --git a/arch/arm/boot/dts/am335x-guardian.dts b/arch/arm/boot/dts/am335x-guardian.dts
index 1a7e187b1953..f6356266564c 100644
--- a/arch/arm/boot/dts/am335x-guardian.dts
+++ b/arch/arm/boot/dts/am335x-guardian.dts
@@ -33,8 +33,6 @@ guardian_buttons: gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&guardian_button_pins>;
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		select-button {
 			label = "guardian-select-button";
diff --git a/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi b/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
index 92a0e98ec231..7b40ca9483ca 100644
--- a/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
+++ b/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
@@ -166,10 +166,8 @@ &mmc2 {
 &buttons {
 	pinctrl-names = "default";
 	pinctrl-0 = <&push_button_pins>;
-	#address-cells = <1>;
-	#size-cells = <0>;
 
-	button@0 {
+	button-0 {
 		label = "push_button";
 		linux,code = <0x100>;
 		gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi b/arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi
index e7e439a0630a..e0364adb8393 100644
--- a/arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi
+++ b/arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi
@@ -378,10 +378,8 @@ &mmc3 {
 &buttons {
 	pinctrl-names = "default";
 	pinctrl-0 = <&push_button_pins>;
-	#address-cells = <1>;
-	#size-cells = <0>;
 
-	button@0 {
+	button-0 {
 		label = "push_button";
 		linux,code = <0x100>;
 		gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/am335x-pcm-953.dtsi b/arch/arm/boot/dts/am335x-pcm-953.dtsi
index 124026fa0d09..dae448040a97 100644
--- a/arch/arm/boot/dts/am335x-pcm-953.dtsi
+++ b/arch/arm/boot/dts/am335x-pcm-953.dtsi
@@ -54,14 +54,14 @@ user_buttons: user_buttons {
 		pinctrl-names = "default";
 		pinctrl-0 = <&user_buttons_pins>;
 
-		button@0 {
+		button-0 {
 			label = "home";
 			linux,code = <KEY_HOME>;
 			gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
 			wakeup-source;
 		};
 
-		button@1 {
+		button-1 {
 			label = "menu";
 			linux,code = <KEY_MENU>;
 			gpios = <&gpio3 8 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/am335x-pepper.dts b/arch/arm/boot/dts/am335x-pepper.dts
index b5e88e627bc1..8691eec33b61 100644
--- a/arch/arm/boot/dts/am335x-pepper.dts
+++ b/arch/arm/boot/dts/am335x-pepper.dts
@@ -596,24 +596,22 @@ led1 {
 &buttons {
 	pinctrl-names = "default";
 	pinctrl-0 = <&user_buttons_pins>;
-	#address-cells = <1>;
-	#size-cells = <0>;
 
-	button0 {
+	button-0 {
 		label = "home";
 		linux,code = <KEY_HOME>;
 		gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
 		wakeup-source;
 	};
 
-	button1 {
+	button-1 {
 		label = "menu";
 		linux,code = <KEY_MENU>;
 		gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
 		wakeup-source;
 	};
 
-	buttons2 {
+	button-2 {
 		label = "power";
 		linux,code = <KEY_POWER>;
 		gpios = <&gpio0 7 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/am437x-idk-evm.dts b/arch/arm/boot/dts/am437x-idk-evm.dts
index d46cd721f27e..123a95f87554 100644
--- a/arch/arm/boot/dts/am437x-idk-evm.dts
+++ b/arch/arm/boot/dts/am437x-idk-evm.dts
@@ -102,10 +102,8 @@ gpio_keys: gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pins_default>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 
-		switch0 {
+		switch-0 {
 			label = "power-button";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
-- 
2.34.1

