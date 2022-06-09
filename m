Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A656FC43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B3B0C341C4; Thu,  9 Jun 2022 11:39:47 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F822C34114
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F822C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id m20so46823071ejj.10
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TLOgEcTi8rykVs8pllx/IciieSLBDIse4+2rVzfArXY=;
        b=evrfUU8qIoxac6Ugbi3uM5mJKY60p4YJBYqvn0mjWeqmoit6epSOjwDebGiemocatb
         sIHlNETvyjeZwJVhxFN4KmkKkoWdsi2yA7+R1G9qiP5tFlbLlt80KWLAqFRXf1qbJNkx
         4JLKz1NZEbpm/hH5DDI5yf35MwKKmQs3LK0AXdlEViBaMRKrfMu9ncCpKP0dlw4RA6CD
         8Tsix8oGxtOxRSAF0Jj3INBW14nTeZDjhtEon8nqIXVTUStXlVLhaFBNeMNYYr+5hScl
         hga8kyT7M+RF0mbro0jYogrRfScRgXGmF7LnovgsoAOrsMGnnZ/eBD7Ag0JwVEliCsXX
         8CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TLOgEcTi8rykVs8pllx/IciieSLBDIse4+2rVzfArXY=;
        b=LbJ5gIdFmInd7cMwdDsv7dDrt3PT18MbPBj3xh30BZwMr4eHI4xvcO+AH+ocElKHlW
         A7/3VMQTvpuML0Msofhsx3E80krl04aoIRCAfT9ZxY6Jk+HqdGbNRNjfVfRvhdqx85M0
         NCTtjat71ZMounB0WwMFO1Uny0VAs7y3BoMs1KbgWRn2jxEDW41OvXAxNFVw2lxjPdf4
         ssDBjJPyb1kwzqr/FVSNAgrEBHEBKH23jCX+2aGlKXVJBXfQ3HSNtRAj5pPfPYKzKU20
         FTs47kBptGrQ24Gn76tWNoHxwANWuu5lMEJwIHGmviQ4eVAx268obY6yEuiCwR4DZRN4
         wjgg==
X-Gm-Message-State: AOAM531Kd91Us4Rg2OKHQC6JOh03oTXw4ah5KOxrfvJZMcfabYfK39sl
	5in7k+zosWaSGScpIAqcjUxb0Q==
X-Google-Smtp-Source: ABdhPJz0pGnYtX431VAMWvN9hF8NzcqmGoQxAtLFMtLCB50gITaiEBjsFH+kmA+yrIxtVspBhuvbcA==
X-Received: by 2002:a17:907:7fa5:b0:711:c8e2:2f4c with SMTP id qk37-20020a1709077fa500b00711c8e22f4cmr20871316ejc.49.1654774786132;
        Thu, 09 Jun 2022 04:39:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906528a00b0070a80f03a44sm9460415ejm.119.2022.06.09.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 12/48] ARM: dts: broadcom: correct gpio-keys properties
Date: Thu,  9 Jun 2022 13:39:31 +0200
Message-Id: <20220609113938.380466-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts       | 2 --
 arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts | 2 --
 arch/arm/boot/dts/bcm4709-linksys-ea9200.dts      | 2 --
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts       | 2 --
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts       | 2 --
 arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts | 2 --
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts     | 2 --
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts        | 2 --
 8 files changed, 16 deletions(-)

diff --git a/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts
index 14bb788a693d..f52a75c4ca09 100644
--- a/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts
@@ -47,8 +47,6 @@ wan {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-wps {
 			label = "WPS";
diff --git a/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts b/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
index a8294c1ac11b..5ff6c588e16e 100644
--- a/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
@@ -77,8 +77,6 @@ wireless-white {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-power {
 			label = "Power";
diff --git a/arch/arm/boot/dts/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/bcm4709-linksys-ea9200.dts
index 4bbd31916729..99253fd7adb3 100644
--- a/arch/arm/boot/dts/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/bcm4709-linksys-ea9200.dts
@@ -29,8 +29,6 @@ nvram@1c080000 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-wps {
 			label = "WPS";
diff --git a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
index 8783963f113b..de961fbb6200 100644
--- a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
@@ -72,8 +72,6 @@ usb2 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-wps {
 			label = "WPS";
diff --git a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
index ac2f4692fc4d..087f7f60de18 100644
--- a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
@@ -99,8 +99,6 @@ usb2 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-rfkill {
 			label = "WiFi";
diff --git a/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts b/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts
index 651113592598..11d1068160da 100644
--- a/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts
+++ b/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts
@@ -77,8 +77,6 @@ power {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-wps {
 			label = "WPS";
diff --git a/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts
index 9100ff66ab86..654fcce9fded 100644
--- a/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts
+++ b/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts
@@ -34,8 +34,6 @@ status	{
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-restart {
 			label = "Reset";
diff --git a/arch/arm/boot/dts/bcm53016-meraki-mr32.dts b/arch/arm/boot/dts/bcm53016-meraki-mr32.dts
index 64ea6def30a4..e678bc03d816 100644
--- a/arch/arm/boot/dts/bcm53016-meraki-mr32.dts
+++ b/arch/arm/boot/dts/bcm53016-meraki-mr32.dts
@@ -47,8 +47,6 @@ sysled2 {
 
 	keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-restart {
 			label = "Reset";
-- 
2.34.1

