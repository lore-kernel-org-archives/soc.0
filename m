Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86097CCA473
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B695C341C5; Thu,  9 Jun 2022 11:40:15 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A8FEC341C4
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A8FEC341C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id v25so30822465eda.6
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tGTPqf53Lj9/8GsMg13z01n1z5EhrPKNzDb0BXUNfys=;
        b=kitaKtvp0SE7mSBoE2pXSTHt21w7Sr98N1rPkBMLXtlzrxPFs3C6pPpgiO8TUgB5vu
         ags+20VIXPW3rq3v27384LQ/XV1dfIlYL/DZFDHhjmcdv1PtEMpkOCYlbQ7XhlYfTJxs
         z39Yc1n9es73zxZmEtVBqZWhy/+MtxCRhL0sZ3gC+G8gP7xJswe7PeHEdmzjkb3Ne2Gf
         NdqBkE8GNjb1x9+Cx82ia4JYKGgYI3mqzKMqY0uQvMCMsLOIWNz1E5r3+U2N2mUr5ZxD
         GOYLb2cKpNPTPsYDWdah6SdXoe33L/XdONnGsx2ILtmTadzAgTcN6XeuVtn7/91xd1BU
         wi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGTPqf53Lj9/8GsMg13z01n1z5EhrPKNzDb0BXUNfys=;
        b=t8ceS8VjbkNzkV8WI24Q3/KUkIJDPJcqa98o0Q/aLYsSpwtHLcVLvdoySGrB9261uN
         ryehYFgzfDPD9wzQ0cjBblzsyEpAx0b/0Q1785rf4cEMD+l1maFSdNZ8zeQXxoqnUl3s
         Fj7EttNzgRjIQgwLfplZH5Q6X6z6SCDRDAOumzZohsSGHU7oI+cb1BMSJVnGAPubHEPG
         Op208TNR8mRAuxNpvealaaRZiaUMsQNm8rlSGKJC+Kk5YHEd0IwX4rF/JgA0ECT9S4c2
         fXfkQTXB82j5s3+UizZeUHXnEP7qF/rStJvJog4UilkvtBd2/ezhz6eDXsJVW7C82H5o
         7grQ==
X-Gm-Message-State: AOAM531KAazUs6nxvHK7GTHQX8bSKKyp2YlfMNDQoD4zrWrDCMANFPT7
	WW1aqZaGLQb2qOU22ddYCG6DvQ==
X-Google-Smtp-Source: ABdhPJwzVf4vg45Ge9eQ2e4ZvQucxMpqgoHucsajxGzyvrMmlr/roydrDvsgVFKB6iuVuc/JneEgRg==
X-Received: by 2002:a05:6402:34cc:b0:431:67ed:96a0 with SMTP id w12-20020a05640234cc00b0043167ed96a0mr21782473edc.372.1654774814117;
        Thu, 09 Jun 2022 04:40:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b006ff59151e34sm10638441ejb.39.2022.06.09.04.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 24/48] ARM: dts: mediatek: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:39:57 +0200
Message-Id: <20220609114002.380563-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts        | 4 ++--
 arch/arm/boot/dts/mt7623a-rfb-nand.dts        | 4 ++--
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 4 ++--
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 4 ++--
 arch/arm/boot/dts/mt7629-rfb.dts              | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
index 13c86936d1c8..e8b4b6d30d19 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
@@ -45,13 +45,13 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&key_pins_a>;
 
-		factory {
+		button-factory {
 			label = "factory";
 			linux,code = <BTN_0>;
 			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
 		};
 
-		wps {
+		button-wps {
 			label = "wps";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/mt7623a-rfb-nand.dts b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
index 88d8f0b2f4c2..61f5da68d4b0 100644
--- a/arch/arm/boot/dts/mt7623a-rfb-nand.dts
+++ b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
@@ -45,13 +45,13 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&key_pins_a>;
 
-		factory {
+		button-factory {
 			label = "factory";
 			linux,code = <BTN_0>;
 			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
 		};
 
-		wps {
+		button-wps {
 			label = "wps";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 027c1b0c6a98..5008115d2494 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -91,13 +91,13 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&key_pins_a>;
 
-		factory {
+		button-factory {
 			label = "factory";
 			linux,code = <BTN_0>;
 			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
 		};
 
-		wps {
+		button-wps {
 			label = "wps";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
index 1b9b9a8145a7..bf67a8e9be59 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -60,13 +60,13 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&key_pins_a>;
 
-		factory {
+		button-factory {
 			label = "factory";
 			linux,code = <BTN_0>;
 			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
 		};
 
-		wps {
+		button-wps {
 			label = "wps";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/mt7629-rfb.dts b/arch/arm/boot/dts/mt7629-rfb.dts
index eb536cbebd9b..84e14bee7235 100644
--- a/arch/arm/boot/dts/mt7629-rfb.dts
+++ b/arch/arm/boot/dts/mt7629-rfb.dts
@@ -23,13 +23,13 @@ chosen {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		reset {
+		button-reset {
 			label = "factory";
 			linux,code = <KEY_RESTART>;
 			gpios = <&pio 60 GPIO_ACTIVE_LOW>;
 		};
 
-		wps {
+		button-wps {
 			label = "wps";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&pio 58 GPIO_ACTIVE_LOW>;
-- 
2.34.1

