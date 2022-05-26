Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD3CC433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 051D7C34116; Thu, 26 May 2022 20:38:21 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24489C34118
	for <soc@kernel.org>; Thu, 26 May 2022 20:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24489C34118
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id ck4so5039663ejb.8
        for <soc@kernel.org>; Thu, 26 May 2022 13:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SE4BNjFdqLE0+GuEKPforw6u34ofhCy2Rfxq0TB6A5c=;
        b=oidgsHlBxWTgyl8UEMdxGOEbv0if3NzKgUQfQ6gzbfw7GlEZ8DAKZbXDv+Gfi5Tg5a
         v55Pgj3p1bdPdnzZIzsU5iXkY5mLEuMqAoRyL5G6xEjO7WhLxyuLT3O2kigDwOWsSAE9
         adpvtkk7tHVu9VfnOViCi8nYwH30glJZal8TJBaWyJnkKqY43BCfGaKq2sM/a2dhj01u
         utTw1jXzZDL8GfrxtB3XqkalX6tYlCW9Moam94jpSrP/59F1ROHThuccPpHc4BITRpor
         NHsgHpe55QtObrKVOSG9BFSF1JhtCT2h4F8S/Sbs8HD05ZZCMMhoLRJk5qDv19wi547O
         yCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SE4BNjFdqLE0+GuEKPforw6u34ofhCy2Rfxq0TB6A5c=;
        b=0euWDnHBSlNP99f/ftvw7TfmcGfvmKmXp+bhht4oKrecH/yCD7tLW19mf00M2qRgRQ
         dg5W8+0Odfl/0U87NWgdRR8X/ht74TBkzjdm+kClr3Tb2hHCdC4++LwqwJsry2Y2hsCM
         GjiKYEF27R4cJsK9coM2DXLotJCINi5scNTeAyEVIAmvvH42ol+5e9uPVlwgeHPGo1ae
         Gv5427CHXSRH4NeBLTU1gzUEf5KAil9uWaBAvagf1//59iCORK7bNfKS2cUul8TYI77S
         240gQzXkGyk/kv1QBEJ90uRXe3Fvit0CEOYf0DAELEYBQgTx9m2SYXjQ4GbVOvkg05Mv
         3C7w==
X-Gm-Message-State: AOAM531XmYv2AOcHoMQpfUkPnuWq9ZaQ6Nj00rSm3AnZJNaHWHdL5FGB
	Kuyx/gewBtVic06cNb5hzNB8dA==
X-Google-Smtp-Source: ABdhPJyxzdY9k14chD6ueVnbFF/pTmmgU2qpDaplGqdPnajbWBTlH4U65Qdhrdte2YfL/oMvjT3jsA==
X-Received: by 2002:a17:907:a089:b0:6ff:29b5:49c3 with SMTP id hu9-20020a170907a08900b006ff29b549c3mr3285275ejc.86.1653597498368;
        Thu, 26 May 2022 13:38:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u19-20020a50a413000000b0042aaecf8707sm1212343edb.70.2022.05.26.13.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:38:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: spear: adjust whitespace around '='
Date: Thu, 26 May 2022 22:38:15 +0200
Message-Id: <20220526203815.831383-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/spear1310-evb.dts | 2 +-
 arch/arm/boot/dts/spear1340-evb.dts | 2 +-
 arch/arm/boot/dts/spear1340.dtsi    | 2 +-
 arch/arm/boot/dts/spear300-evb.dts  | 2 +-
 arch/arm/boot/dts/spear310-evb.dts  | 2 +-
 arch/arm/boot/dts/spear320-evb.dts  | 2 +-
 arch/arm/boot/dts/spear320-hmi.dts  | 2 +-
 arch/arm/boot/dts/spear320.dtsi     | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/spear1310-evb.dts b/arch/arm/boot/dts/spear1310-evb.dts
index ddd1cf4d0554..05408df38203 100644
--- a/arch/arm/boot/dts/spear1310-evb.dts
+++ b/arch/arm/boot/dts/spear1310-evb.dts
@@ -170,7 +170,7 @@ sdhci@b3000000 {
 
 		smi: flash@ea000000 {
 			status = "okay";
-			clock-rate=<50000000>;
+			clock-rate = <50000000>;
 
 			flash@e6000000 {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/spear1340-evb.dts b/arch/arm/boot/dts/spear1340-evb.dts
index 3a51a41eb5e4..7700f2afc128 100644
--- a/arch/arm/boot/dts/spear1340-evb.dts
+++ b/arch/arm/boot/dts/spear1340-evb.dts
@@ -168,7 +168,7 @@ sdhci@b3000000 {
 
 		smi: flash@ea000000 {
 			status = "okay";
-			clock-rate=<50000000>;
+			clock-rate = <50000000>;
 
 			flash@e6000000 {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
index 13e1bdb3ddbf..818886e11713 100644
--- a/arch/arm/boot/dts/spear1340.dtsi
+++ b/arch/arm/boot/dts/spear1340.dtsi
@@ -88,7 +88,7 @@ pinmux: pinmux@e0700000 {
 		};
 
 		pwm: pwm@e0180000 {
-			compatible ="st,spear13xx-pwm";
+			compatible = "st,spear13xx-pwm";
 			reg = <0xe0180000 0x1000>;
 			#pwm-cells = <2>;
 			status = "disabled";
diff --git a/arch/arm/boot/dts/spear300-evb.dts b/arch/arm/boot/dts/spear300-evb.dts
index 2beb30ca2cba..303ef29fb805 100644
--- a/arch/arm/boot/dts/spear300-evb.dts
+++ b/arch/arm/boot/dts/spear300-evb.dts
@@ -80,7 +80,7 @@ sdhci@70000000 {
 
 		smi: flash@fc000000 {
 			status = "okay";
-			clock-rate=<50000000>;
+			clock-rate = <50000000>;
 
 			flash@f8000000 {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/spear310-evb.dts b/arch/arm/boot/dts/spear310-evb.dts
index 1c41e4a40334..ea0b53036f7b 100644
--- a/arch/arm/boot/dts/spear310-evb.dts
+++ b/arch/arm/boot/dts/spear310-evb.dts
@@ -94,7 +94,7 @@ gmac: eth@e0800000 {
 
 		smi: flash@fc000000 {
 			status = "okay";
-			clock-rate=<50000000>;
+			clock-rate = <50000000>;
 
 			flash@f8000000 {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/spear320-evb.dts b/arch/arm/boot/dts/spear320-evb.dts
index c322407a0ade..3c026d021c92 100644
--- a/arch/arm/boot/dts/spear320-evb.dts
+++ b/arch/arm/boot/dts/spear320-evb.dts
@@ -95,7 +95,7 @@ sdhci@70000000 {
 
 		smi: flash@fc000000 {
 			status = "okay";
-			clock-rate=<50000000>;
+			clock-rate = <50000000>;
 
 			flash@f8000000 {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/spear320-hmi.dts b/arch/arm/boot/dts/spear320-hmi.dts
index b587e4ec11e5..34503ac9c51c 100644
--- a/arch/arm/boot/dts/spear320-hmi.dts
+++ b/arch/arm/boot/dts/spear320-hmi.dts
@@ -167,7 +167,7 @@ sdhci@70000000 {
 
 		smi: flash@fc000000 {
 			status = "okay";
-			clock-rate=<50000000>;
+			clock-rate = <50000000>;
 
 			flash@f8000000 {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/spear320.dtsi b/arch/arm/boot/dts/spear320.dtsi
index 47ac4474ed96..b12474446a48 100644
--- a/arch/arm/boot/dts/spear320.dtsi
+++ b/arch/arm/boot/dts/spear320.dtsi
@@ -78,7 +78,7 @@ spi2: spi@a6000000 {
 		};
 
 		pwm: pwm@a8000000 {
-			compatible ="st,spear-pwm";
+			compatible = "st,spear-pwm";
 			reg = <0xa8000000 0x1000>;
 			#pwm-cells = <2>;
 			status = "disabled";
-- 
2.34.1

