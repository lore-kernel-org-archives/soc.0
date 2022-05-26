Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC92C433FE
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23D9FC34113; Thu, 26 May 2022 20:44:12 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 578A6C385B8
	for <soc@kernel.org>; Thu, 26 May 2022 20:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 578A6C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id c93so1835498edf.7
        for <soc@kernel.org>; Thu, 26 May 2022 13:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XOY58nRo2FBMVZy4R9dChoRFoguqNiD/V0YfBQb6+is=;
        b=jP0bjuQktDPX6JTVbJjvC+zRgIO8NTyrFajRszjwmIwb1XAOJzbMLaoYRW4V9EiAvC
         unlwEAj2AHm1wi/ncAhOpQltINgTs8tyspxKTxa45VV/Q9qryXDtlCggrdOE05keuzg5
         SdkZ1uKmYeQ4JjSlTUnxAyZsOJS4MoGnPqC2g2TRh+wE9jGJJyLBacNOg5dZbcc8Nns0
         DujxcKG2MHdwp505Fqt4dhqJvokj5t88Tx9ZrCFJJJdBx2rrWKdK9QQgrLExp0cwzio+
         GlCCQx79fnPsReDh2OMi6GifCZ2J8Q1D6fpPp8sgJfg7YyqQf9a8S/jIp8c3LHDb6SRH
         gFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XOY58nRo2FBMVZy4R9dChoRFoguqNiD/V0YfBQb6+is=;
        b=UJosMO1Z+9N0d2Jm5jZ3GQYRhktmY3cDg/tgcPWPyUMfid1Lm2tP0WwmMnObubNy9f
         y/j7CfyqmaZNH0YarijuAN1Oi+DrfnY83FhAsdKeiqpbnfWAZKZopyyIzm5e+hDK/Tal
         XCtqwFPo4VpFjA4KodcpN3MpSNSR2yo/kORWnpUgFR6UiUE9SGH3+hu5SMSV1YsaeRva
         urazcTIkqoIr3LS/XXyjWyLiUmB7Hrwm/BJDoANdZJLhx1IPmvwfFh/EXfkFa2IEpfIg
         TubTt50zC4kSlvTRHPTjEaPNQlZwoO+vSyqLYtbU1pdFbfdzEQh+DCJgyUZ8fgGXBH8a
         J4rA==
X-Gm-Message-State: AOAM531ETzsj4q3wEqfJZu3QUB/IBG+TCW71BFQegix58gB0vUCX6Fj9
	CrrMO+0DSni02LEFG3giAHPfDQ==
X-Google-Smtp-Source: ABdhPJyrLaR89tqeL23Sv2113VdbG8ErSnQMN2ndTBmG7bJIm8BHM2LMNk1k5z6mSMinJ7S/qaYvBw==
X-Received: by 2002:aa7:dbc1:0:b0:42b:77a2:4f81 with SMTP id v1-20020aa7dbc1000000b0042b77a24f81mr19418697edt.287.1653597849731;
        Thu, 26 May 2022 13:44:09 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709061ccf00b006fec5cef701sm803475ejh.197.2022.05.26.13.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:44:09 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: mediatek: adjust whitespace around '='
Date: Thu, 26 May 2022 22:44:02 +0200
Message-Id: <20220526204402.832393-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204402.832393-1-krzysztof.kozlowski@linaro.org>
References: <20220526204402.832393-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/mt2701.dtsi | 8 ++++----
 arch/arm/boot/dts/mt7623.dtsi | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index ef583cfd3baf..b8eba3ba153c 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -427,9 +427,9 @@ audsys: clock-controller@11220000 {
 
 		afe: audio-controller {
 			compatible = "mediatek,mt2701-audio";
-			interrupts =  <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
 				      <GIC_SPI 132 IRQ_TYPE_LEVEL_LOW>;
-			interrupt-names	= "afe", "asys";
+			interrupt-names = "afe", "asys";
 			power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
 
 			clocks = <&infracfg CLK_INFRA_AUDIO>,
@@ -559,7 +559,7 @@ jpegdec: jpegdec@15004000 {
 		compatible = "mediatek,mt2701-jpgdec";
 		reg = <0 0x15004000 0 0x1000>;
 		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
-		clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
+		clocks = <&imgsys CLK_IMG_JPGDEC_SMI>,
 			  <&imgsys CLK_IMG_JPGDEC>;
 		clock-names = "jpgdec-smi",
 			      "jpgdec";
@@ -573,7 +573,7 @@ jpegenc: jpegenc@1500a000 {
 			     "mediatek,mtk-jpgenc";
 		reg = <0 0x1500a000 0 0x1000>;
 		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
-		clocks =  <&imgsys CLK_IMG_VENC>;
+		clocks = <&imgsys CLK_IMG_VENC>;
 		clock-names = "jpgenc";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index f4848362b3be..25d31e40a553 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -241,7 +241,7 @@ infracfg: syscon@10001000 {
 	};
 
 	pericfg: syscon@10003000 {
-		compatible =  "mediatek,mt7623-pericfg",
+		compatible = "mediatek,mt7623-pericfg",
 			      "mediatek,mt2701-pericfg",
 			      "syscon";
 		reg = <0 0x10003000 0 0x1000>;
@@ -628,9 +628,9 @@ audsys: clock-controller@11220000 {
 		afe: audio-controller {
 			compatible = "mediatek,mt7623-audio",
 				     "mediatek,mt2701-audio";
-			interrupts =  <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
 				      <GIC_SPI 132 IRQ_TYPE_LEVEL_LOW>;
-			interrupt-names	= "afe", "asys";
+			interrupt-names = "afe", "asys";
 			power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
 
 			clocks = <&infracfg CLK_INFRA_AUDIO>,
-- 
2.34.1

