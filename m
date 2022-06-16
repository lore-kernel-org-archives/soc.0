Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E53C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0249CC3411C; Thu, 16 Jun 2022 00:54:17 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D1FFC3411E
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D1FFC3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id u2so117555pfc.2
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hsW59cFZjklHB2Wpxrfsfror1DmvkvVRBrL7nFD90Rw=;
        b=gT7gqFzbN8epGJaDV1iKFM6cTxx7kd3KDK95NFIR6vxJr/e/IBbTs4Wztt6Gf8e9nD
         5sVU/Dk9DyC18wj3nLZp1lVtPcj0NC0BybAhCNtTB10PZg5ho9Q3jIheRedswqqM3vvw
         YEo+K7qmtxwnfAUZCHk7II4CLLTQ2lCbPTrOb2+9ZL31uPpaPn4LqjklKkDjrJWpmeN2
         f3yfH3Lu2WPIFiWiAlX355Jt0GRcBNpbmXKttGoO+H66Wwl+NusPKjIn30Zxsfuly9Xz
         1IhilHqF2ZDGOOyII59iTkLsR02JRWRcEwZF99vHIfqhxibqdQnk+hOfsDswuc8FR5eD
         4wOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hsW59cFZjklHB2Wpxrfsfror1DmvkvVRBrL7nFD90Rw=;
        b=Bl5zS3pjVrjeSjDNpxkxktIV+ryZ6rwq24K89/l7WqstEUQIenPd4NkULjLNmDB8na
         M3elE0/tCb17dZqPwxAYliP/b7VIusP/cvnbKHUarjpwEKoCkJOn16Yp4VqeN4mQ/zlr
         KOC328qL0potCQAgQUTB13/EjPnsHB/tlXWLHopb3pU3j+sZHSE+xJ/Jre7FSDWRZzzO
         XwMTqi5Fahz8P7qAPig397U2Bh8Z9/ZY7dFj7+LJnRNVZDivXvm5oX5CUsYqKJQeqFll
         541nJLGDVb4tFSMbIeRKCF84V0xium9SepkUlV7rZr9dyhxQtTkivyd4sj1VKj/u761w
         JEYg==
X-Gm-Message-State: AJIora9ePrYysdbPbX+glXrOVohR/in5+DRhTdoU7+MGu3RcwInZpc6c
	yn3VMZ3HeTGSmhz06ifV47mfQ8J2I5GInw==
X-Google-Smtp-Source: AGRyM1v9PXc3M6qtFJkIuJ5CZkLsvfE0UjONQMjhaOvEr+7WUGSHaubkM2UtRha1WHx8hBYamDVZtg==
X-Received: by 2002:a63:441f:0:b0:3fc:8bd2:f828 with SMTP id r31-20020a63441f000000b003fc8bd2f828mr2096272pga.579.1655340855648;
        Wed, 15 Jun 2022 17:54:15 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 15/40] arm64: dts: mediatek: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:53:08 -0700
Message-Id: <20220616005333.18491-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts      |  4 ++--
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts           |  4 ++--
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts  |  6 +++---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi           | 10 +++++-----
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi |  4 ++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi  |  2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi         |  2 +-
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi       |  4 ++--
 8 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 2b9bf8dd14ec..c2311733d2de 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -40,13 +40,13 @@ cpu@1 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		factory {
+		factory-key {
 			label = "factory";
 			linux,code = <BTN_0>;
 			gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
 		};
 
-		wps {
+		wps-key {
 			label = "wps";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&pio 102 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 596c073d8b05..c28da9323a9c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -42,13 +42,13 @@ gpio-keys {
 		compatible = "gpio-keys";
 		poll-interval = <100>;
 
-		factory {
+		key-factory {
 			label = "factory";
 			linux,code = <BTN_0>;
 			gpios = <&pio 0 0>;
 		};
 
-		wps {
+		key-wps {
 			label = "wps";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&pio 102 0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
index 44f6149c1307..28433b94f7c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
@@ -21,7 +21,7 @@ cpu_crit: cpu_crit0 {
 };
 
 &gpio_keys {
-	/delete-node/tablet_mode;
-	/delete-node/volume_down;
-	/delete-node/volume_up;
+	/delete-node/switch-tablet-mode;
+	/delete-node/switch-volume-down;
+	/delete-node/switch-volume-up;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 9c75fbb31f98..d20378758213 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -53,7 +53,7 @@ gpio_keys: gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pins>;
 
-		lid {
+		switch-lid {
 			label = "Lid";
 			gpios = <&pio 69 GPIO_ACTIVE_LOW>;
 			linux,code = <SW_LID>;
@@ -61,7 +61,7 @@ lid {
 			gpio-key,wakeup;
 		};
 
-		power {
+		switch-power {
 			label = "Power";
 			gpios = <&pio 14 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_POWER>;
@@ -69,7 +69,7 @@ power {
 			gpio-key,wakeup;
 		};
 
-		tablet_mode {
+		switch-tablet-mode {
 			label = "Tablet_mode";
 			gpios = <&pio 121 GPIO_ACTIVE_HIGH>;
 			linux,code = <SW_TABLET_MODE>;
@@ -77,13 +77,13 @@ tablet_mode {
 			gpio-key,wakeup;
 		};
 
-		volume_down {
+		switch-volume-down {
 			label = "Volume_down";
 			gpios = <&pio 123 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		volume_up {
+		switch-volume-up {
 			label = "Volume_up";
 			gpios = <&pio 124 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 2d7a193272ae..3ac83be53627 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -73,7 +73,7 @@ volume_buttons: volume-buttons {
 		pinctrl-names = "default";
 		pinctrl-0 = <&volume_button_pins>;
 
-		volume_down {
+		button-volume-down {
 			label = "Volume Down";
 			linux,code = <KEY_VOLUMEDOWN>;
 			debounce-interval = <100>;
@@ -81,7 +81,7 @@ volume_down {
 			gpios = <&pio 6 GPIO_ACTIVE_LOW>;
 		};
 
-		volume_up {
+		button-volume-up {
 			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
 			debounce-interval = <100>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index 28966a65391b..50a0dd36b5fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -45,7 +45,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pen_eject>;
 
-		pen-insert {
+		switch-pen-insert {
 			label = "Pen Insert";
 			/* Insert = low, eject = high */
 			gpios = <&pio 6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index b035e06840e6..b50261e8b9ed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -144,7 +144,7 @@ wifi_wakeup: wifi-wakeup {
 		pinctrl-names = "default";
 		pinctrl-0 = <&wifi_pins_wakeup>;
 
-		wowlan {
+		button-wowlan {
 			label = "Wake on WiFi";
 			gpios = <&pio 113 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_WAKEUP>;
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 7a717f926929..8ee1529683a3 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -28,7 +28,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_default>;
 
-		volume-up {
+		key-volume-up {
 			gpios = <&pio 42 GPIO_ACTIVE_LOW>;
 			label = "volume_up";
 			linux,code = <115>;
@@ -36,7 +36,7 @@ volume-up {
 			debounce-interval = <15>;
 		};
 
-		volume-down {
+		key-volume-down {
 			gpios = <&pio 43 GPIO_ACTIVE_LOW>;
 			label = "volume_down";
 			linux,code = <114>;
-- 
2.34.1

