Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FA4C433EF
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D5A6C34113; Thu, 26 May 2022 20:45:01 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32F26C385A9
	for <soc@kernel.org>; Thu, 26 May 2022 20:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32F26C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id rs12so5048947ejb.13
        for <soc@kernel.org>; Thu, 26 May 2022 13:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=paw5SYFXWn9NCMynf9wnULxZ3Y1uB+T0pzqFJf4vB4I=;
        b=G4uZJutz3Gwl/OF4uR7la5EZptfaZ2TFeAvIFIBniosgSQzjJu9mSdRL10o1eSILSn
         tokalQfQipoWGw8o2DPrHHvny4q5rklGbfJOZCFOXbcOo7OCK4zcuYhMdoAip8iHCmHQ
         MX6/JOrsFZr163129HlRV6xM3jTbHVPAVcdvSKqRr+4sWp5O2MeFO0NPLIiGiwpXvOY3
         CO7ArHxh+0O/dlWjoPHLeCGjL22MEVM+ePK9SWYtPpte5Umi803RGvndePSxfllsoFV0
         XEf9v9RpMGIf9dbSTxLMk93pGP6nzvd58yUqNBbZdeBmhd5tDJbUhTRB90Qn6s15IhVm
         lLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=paw5SYFXWn9NCMynf9wnULxZ3Y1uB+T0pzqFJf4vB4I=;
        b=dAYFU6eah5AXF7khjCZtJmC7j2ZdE7TfkaHTW8IilCeJTtkZ0+biy8DZOEwSrtylH3
         AhVFcZ5p9z2hrDWaX/1MylrSY2L53qvOeE0uCPWSm1V54xwoSxasu25GxBkrJTLPSNa7
         ar6udOoxTjDJBZ61WMza17IQDfjBbf5A5kWnjJRp+8AvMWit9/hGoV2sVkqRszctbk4k
         vNYjFJJJ9+4AkfX+mo+BZwHICQKmd1R7TJhBneRkoVBca9z7EAGcbAx9sjjVU+9U/x8w
         20zns9d6X2gxBOyF0W4vb3eb7N0V/E71gr6A2YV3OD0kK6B6Q10jNPx+ydPbpyZfbSA4
         hA2g==
X-Gm-Message-State: AOAM5309Cg0zzvRM821WSSeMgMlnkbUN7rlkTC+LmKib272UEv89gC26
	SqdLJdwhFQ5fpHQL0uPh/k6bAM6Xba/eqIX7
X-Google-Smtp-Source: ABdhPJxhuEdarJLR2HwYqRyrz/1r6PmgvWgPUdkDWeAz6mkCle0i8FHB5ebBVjF6tZ92IdprBta6Ig==
X-Received: by 2002:a17:907:a0c8:b0:6fe:b73c:193f with SMTP id hw8-20020a170907a0c800b006feb73c193fmr27628667ejc.11.1653597897479;
        Thu, 26 May 2022 13:44:57 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g3-20020a1709063b0300b006feb3d65330sm810982ejf.109.2022.05.26.13.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:44:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Wei Xu <xuwei5@hisilicon.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: hisilicon: adjust whitespace around '='
Date: Thu, 26 May 2022 22:44:53 +0200
Message-Id: <20220526204453.832681-1-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 12 ++++++------
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi         |  8 ++++----
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi         |  2 +-
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts    | 12 ++++++------
 arch/arm64/boot/dts/hisilicon/hip06.dtsi          |  6 +++---
 arch/arm64/boot/dts/hisilicon/hip07.dtsi          |  6 +++---
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index f68580dc87d8..d2d1809a99b6 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -49,9 +49,9 @@ reserved-memory {
 		ramoops@32000000 {
 			compatible = "ramoops";
 			reg = <0x0 0x32000000 0x0 0x00100000>;
-			record-size	= <0x00020000>;
-			console-size	= <0x00020000>;
-			ftrace-size	= <0x00020000>;
+			record-size = <0x00020000>;
+			console-size = <0x00020000>;
+			ftrace-size = <0x00020000>;
 		};
 	};
 
@@ -63,9 +63,9 @@ reboot-mode {
 			compatible = "syscon-reboot-mode";
 			offset = <0x0>;
 
-			mode-normal	= <0x77665501>;
-			mode-bootloader	= <0x77665500>;
-			mode-recovery	= <0x77665502>;
+			mode-normal = <0x77665501>;
+			mode-bootloader = <0x77665500>;
+			mode-recovery = <0x77665502>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 6b3057a09251..8343d0cedde3 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -479,7 +479,7 @@ uart1: serial@fdf00000 {
 			reg = <0x0 0xfdf00000 0x0 0x1000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 			dma-names = "rx", "tx";
-			dmas =  <&dma0 2 &dma0 3>;
+			dmas = <&dma0 2 &dma0 3>;
 			clocks = <&crg_ctrl HI3660_CLK_GATE_UART1>,
 				 <&crg_ctrl HI3660_CLK_GATE_UART1>;
 			clock-names = "uartclk", "apb_pclk";
@@ -493,7 +493,7 @@ uart2: serial@fdf03000 {
 			reg = <0x0 0xfdf03000 0x0 0x1000>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 			dma-names = "rx", "tx";
-			dmas =  <&dma0 4 &dma0 5>;
+			dmas = <&dma0 4 &dma0 5>;
 			clocks = <&crg_ctrl HI3660_CLK_GATE_UART2>,
 				 <&crg_ctrl HI3660_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
@@ -519,7 +519,7 @@ uart4: serial@fdf01000 {
 			reg = <0x0 0xfdf01000 0x0 0x1000>;
 			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 			dma-names = "rx", "tx";
-			dmas =  <&dma0 6 &dma0 7>;
+			dmas = <&dma0 6 &dma0 7>;
 			clocks = <&crg_ctrl HI3660_CLK_GATE_UART4>,
 				 <&crg_ctrl HI3660_CLK_GATE_UART4>;
 			clock-names = "uartclk", "apb_pclk";
@@ -533,7 +533,7 @@ uart5: serial@fdf05000 {
 			reg = <0x0 0xfdf05000 0x0 0x1000>;
 			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 			dma-names = "rx", "tx";
-			dmas =  <&dma0 8 &dma0 9>;
+			dmas = <&dma0 8 &dma0 9>;
 			clocks = <&crg_ctrl HI3660_CLK_GATE_UART5>,
 				 <&crg_ctrl HI3660_CLK_GATE_UART5>;
 			clock-names = "uartclk", "apb_pclk";
diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index 3125c3869c69..886b93c5893a 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -324,7 +324,7 @@ gpio3: gpio@e8a0e000 {
 			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges =  <&pmx0 0 13 4 &pmx0 7 17 1>;
+			gpio-ranges = <&pmx0 0 13 4 &pmx0 7 17 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			clocks = <&crg_ctrl HI3670_PCLK_GPIO3>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 3df2afb2f637..629e604aa281 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -54,9 +54,9 @@ reserved-memory {
 		ramoops@21f00000 {
 			compatible = "ramoops";
 			reg = <0x0 0x21f00000 0x0 0x00100000>;
-			record-size	= <0x00020000>;
-			console-size	= <0x00020000>;
-			ftrace-size	= <0x00020000>;
+			record-size = <0x00020000>;
+			console-size = <0x00020000>;
+			ftrace-size = <0x00020000>;
 		};
 
 		/* global autoconfigured region for contiguous allocations */
@@ -76,9 +76,9 @@ reboot-mode {
 			compatible = "syscon-reboot-mode";
 			offset = <0x0>;
 
-			mode-normal	= <0x77665501>;
-			mode-bootloader	= <0x77665500>;
-			mode-recovery	= <0x77665502>;
+			mode-normal = <0x77665501>;
+			mode-bootloader = <0x77665500>;
+			mode-recovery = <0x77665502>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
index 70d7732dd348..2f8b03b0d365 100644
--- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
@@ -537,7 +537,7 @@ port@0 {
 
 			port@1 {
 				reg = <1>;
-				serdes-syscon= <&serdes_ctrl>;
+				serdes-syscon = <&serdes_ctrl>;
 				port-rst-offset = <1>;
 				port-mode-offset = <1>;
 				media-type = "fiber";
@@ -546,7 +546,7 @@ port@1 {
 			port@4 {
 				reg = <4>;
 				phy-handle = <&phy0>;
-				serdes-syscon= <&serdes_ctrl>;
+				serdes-syscon = <&serdes_ctrl>;
 				port-rst-offset = <4>;
 				port-mode-offset = <2>;
 				media-type = "copper";
@@ -555,7 +555,7 @@ port@4 {
 			port@5 {
 				reg = <5>;
 				phy-handle = <&phy1>;
-				serdes-syscon= <&serdes_ctrl>;
+				serdes-syscon = <&serdes_ctrl>;
 				port-rst-offset = <5>;
 				port-mode-offset = <3>;
 				media-type = "copper";
diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index 6baf6a686450..1a16662f8867 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1422,7 +1422,7 @@ port@0 {
 
 			port@1 {
 				reg = <1>;
-				serdes-syscon= <&serdes_ctrl>;
+				serdes-syscon = <&serdes_ctrl>;
 				cpld-syscon = <&dsa_cpld 0x4>;
 				port-rst-offset = <1>;
 				port-mode-offset = <1>;
@@ -1433,7 +1433,7 @@ port@1 {
 			port@4 {
 				reg = <4>;
 				phy-handle = <&phy0>;
-				serdes-syscon= <&serdes_ctrl>;
+				serdes-syscon = <&serdes_ctrl>;
 				port-rst-offset = <4>;
 				port-mode-offset = <2>;
 				mc-mac-mask = [ff f0 00 00 00 00];
@@ -1443,7 +1443,7 @@ port@4 {
 			port@5 {
 				reg = <5>;
 				phy-handle = <&phy1>;
-				serdes-syscon= <&serdes_ctrl>;
+				serdes-syscon = <&serdes_ctrl>;
 				port-rst-offset = <5>;
 				port-mode-offset = <3>;
 				mc-mac-mask = [ff f0 00 00 00 00];
-- 
2.34.1

