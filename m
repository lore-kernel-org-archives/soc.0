Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D495C433FE
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08ED1C385B8; Thu, 26 May 2022 20:46:18 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C2E1C34113
	for <soc@kernel.org>; Thu, 26 May 2022 20:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C2E1C34113
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id fd25so3175070edb.3
        for <soc@kernel.org>; Thu, 26 May 2022 13:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lBaqWUZdGRxVXZa/3xFn5e0ng0GgoHiZioilUw5+2nw=;
        b=Cv0JakkXE60pGLI7Iyhf67f1yhGMoKIqoT+mBKLUK6Ga875dfGpC9/btNCcIg99qBA
         UzrB7bs7Wh7HvZk6CwGBEv7Tv0e/WgtEX2C22p4pdGQsYLT6ufYXQT/MOJv8FHqGwXxj
         /TB9LO7I459hEYE+b9x7XYbDD54uLPepZvzKWl0E1RBCL0q1LvNOmuxD1rFvC9GzMW8/
         D75bhWgOULe3Ra0NRkagjYu+U3+XdeAo+US/j8hTQMgv7U2ZGA3U6oeL6uRw1a7OFglI
         +U1gFGAS0nnMCxHD4VpKI8MRIGRrHrAelcjB8cNDQMGmrL/9ilYx0+NhqtHL084FhPJ/
         eueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lBaqWUZdGRxVXZa/3xFn5e0ng0GgoHiZioilUw5+2nw=;
        b=gNvSPoNpjhjQN113iZGLChwPRfxqeWBstcRBW2ohntXKTGh0FT0Bw/8KSnLgZEu7Zb
         3ZDxV1qGJyJyiVbEp0eBu+Dkx0vvzSwehlA0WGLt/+RlZiAtKU/43P3Zm7vWWkxnHiOJ
         3/npkkiwaCHE1eQqcZyWkPbLwbxc76BIDAKE7TBKbOR4uvEbye84HPRfiPOCg8tx3mQT
         vAMTlldzuG+OSAk6H7P0wM8Y4RszV2TBGa5RANE3R17ucy04bySN2XD+F9DCsPJn+HC8
         BLggEcDs6rGhVmRtofdqvCj2FSFqaX5sBmgbve3kMGXHfsVS2tjD4mhz4KeO8Dn8VBo3
         8gOQ==
X-Gm-Message-State: AOAM530pjVifo/xvTb5C6KVRVokiS79vx7RH7kJl4LXlk83Qom08gNF7
	LvscIxjStrwcWt/SlKFYCjaW2Q==
X-Google-Smtp-Source: ABdhPJyHWBYYGWWKKVa+ctitylRhZbBsaUfysB9c86pss61rRr5dSIfVUtjmrT45kwD7kqrjoXIc6w==
X-Received: by 2002:a05:6402:221a:b0:42b:c764:9c9f with SMTP id cq26-20020a056402221a00b0042bc7649c9fmr10690849edb.75.1653597975466;
        Thu, 26 May 2022 13:46:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gc21-20020a1709072b1500b006ff16f48e2asm813254ejc.76.2022.05.26.13.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:46:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Chanho Min <chanho.min@lge.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/5] arm64: dts: lg: adjust whitespace around '='
Date: Thu, 26 May 2022 22:46:06 +0200
Message-Id: <20220526204606.833054-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
References: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm64/boot/dts/lg/lg1312.dtsi | 38 +++++++++++++++---------------
 arch/arm64/boot/dts/lg/lg1313.dtsi | 38 +++++++++++++++---------------
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/lg/lg1312.dtsi b/arch/arm64/boot/dts/lg/lg1312.dtsi
index bec97480a960..78ae73d0cf36 100644
--- a/arch/arm64/boot/dts/lg/lg1312.dtsi
+++ b/arch/arm64/boot/dts/lg/lg1312.dtsi
@@ -52,7 +52,7 @@ L2_0: l2-cache0 {
 	};
 
 	psci {
-		compatible  = "arm,psci-0.2", "arm,psci";
+		compatible = "arm,psci-0.2", "arm,psci";
 		method = "smc";
 		cpu_suspend = <0x84000001>;
 		cpu_off = <0x84000002>;
@@ -150,7 +150,7 @@ uart0: serial@fe000000 {
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		uart1: serial@fe100000 {
 			compatible = "arm,pl011", "arm,primecell";
@@ -158,7 +158,7 @@ uart1: serial@fe100000 {
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		uart2: serial@fe200000 {
 			compatible = "arm,pl011", "arm,primecell";
@@ -166,7 +166,7 @@ uart2: serial@fe200000 {
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		spi0: spi@fe800000 {
 			compatible = "arm,pl022", "arm,primecell";
@@ -197,7 +197,7 @@ gpio0: gpio@fd400000 {
 			reg = <0x0 0xfd400000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio1: gpio@fd410000 {
 			#gpio-cells = <2>;
@@ -206,7 +206,7 @@ gpio1: gpio@fd410000 {
 			reg = <0x0 0xfd410000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio2: gpio@fd420000 {
 			#gpio-cells = <2>;
@@ -215,7 +215,7 @@ gpio2: gpio@fd420000 {
 			reg = <0x0 0xfd420000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio3: gpio@fd430000 {
 			#gpio-cells = <2>;
@@ -232,7 +232,7 @@ gpio4: gpio@fd440000 {
 			reg = <0x0 0xfd440000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio5: gpio@fd450000 {
 			#gpio-cells = <2>;
@@ -241,7 +241,7 @@ gpio5: gpio@fd450000 {
 			reg = <0x0 0xfd450000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio6: gpio@fd460000 {
 			#gpio-cells = <2>;
@@ -250,7 +250,7 @@ gpio6: gpio@fd460000 {
 			reg = <0x0 0xfd460000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio7: gpio@fd470000 {
 			#gpio-cells = <2>;
@@ -259,7 +259,7 @@ gpio7: gpio@fd470000 {
 			reg = <0x0 0xfd470000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio8: gpio@fd480000 {
 			#gpio-cells = <2>;
@@ -268,7 +268,7 @@ gpio8: gpio@fd480000 {
 			reg = <0x0 0xfd480000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio9: gpio@fd490000 {
 			#gpio-cells = <2>;
@@ -277,7 +277,7 @@ gpio9: gpio@fd490000 {
 			reg = <0x0 0xfd490000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio10: gpio@fd4a0000 {
 			#gpio-cells = <2>;
@@ -286,7 +286,7 @@ gpio10: gpio@fd4a0000 {
 			reg = <0x0 0xfd4a0000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio11: gpio@fd4b0000 {
 			#gpio-cells = <2>;
@@ -303,7 +303,7 @@ gpio12: gpio@fd4c0000 {
 			reg = <0x0 0xfd4c0000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio13: gpio@fd4d0000 {
 			#gpio-cells = <2>;
@@ -312,7 +312,7 @@ gpio13: gpio@fd4d0000 {
 			reg = <0x0 0xfd4d0000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio14: gpio@fd4e0000 {
 			#gpio-cells = <2>;
@@ -321,7 +321,7 @@ gpio14: gpio@fd4e0000 {
 			reg = <0x0 0xfd4e0000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio15: gpio@fd4f0000 {
 			#gpio-cells = <2>;
@@ -330,7 +330,7 @@ gpio15: gpio@fd4f0000 {
 			reg = <0x0 0xfd4f0000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio16: gpio@fd500000 {
 			#gpio-cells = <2>;
@@ -339,7 +339,7 @@ gpio16: gpio@fd500000 {
 			reg = <0x0 0xfd500000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio17: gpio@fd510000 {
 			#gpio-cells = <2>;
diff --git a/arch/arm64/boot/dts/lg/lg1313.dtsi b/arch/arm64/boot/dts/lg/lg1313.dtsi
index ada3d4dc6305..2173316573be 100644
--- a/arch/arm64/boot/dts/lg/lg1313.dtsi
+++ b/arch/arm64/boot/dts/lg/lg1313.dtsi
@@ -52,7 +52,7 @@ L2_0: l2-cache0 {
 	};
 
 	psci {
-		compatible  = "arm,psci-0.2", "arm,psci";
+		compatible = "arm,psci-0.2", "arm,psci";
 		method = "smc";
 		cpu_suspend = <0x84000001>;
 		cpu_off = <0x84000002>;
@@ -150,7 +150,7 @@ uart0: serial@fe000000 {
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		uart1: serial@fe100000 {
 			compatible = "arm,pl011", "arm,primecell";
@@ -158,7 +158,7 @@ uart1: serial@fe100000 {
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		uart2: serial@fe200000 {
 			compatible = "arm,pl011", "arm,primecell";
@@ -166,7 +166,7 @@ uart2: serial@fe200000 {
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		spi0: spi@fe800000 {
 			compatible = "arm,pl022", "arm,primecell";
@@ -197,7 +197,7 @@ gpio0: gpio@fd400000 {
 			reg = <0x0 0xfd400000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio1: gpio@fd410000 {
 			#gpio-cells = <2>;
@@ -206,7 +206,7 @@ gpio1: gpio@fd410000 {
 			reg = <0x0 0xfd410000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio2: gpio@fd420000 {
 			#gpio-cells = <2>;
@@ -215,7 +215,7 @@ gpio2: gpio@fd420000 {
 			reg = <0x0 0xfd420000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio3: gpio@fd430000 {
 			#gpio-cells = <2>;
@@ -232,7 +232,7 @@ gpio4: gpio@fd440000 {
 			reg = <0x0 0xfd440000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio5: gpio@fd450000 {
 			#gpio-cells = <2>;
@@ -241,7 +241,7 @@ gpio5: gpio@fd450000 {
 			reg = <0x0 0xfd450000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio6: gpio@fd460000 {
 			#gpio-cells = <2>;
@@ -250,7 +250,7 @@ gpio6: gpio@fd460000 {
 			reg = <0x0 0xfd460000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio7: gpio@fd470000 {
 			#gpio-cells = <2>;
@@ -259,7 +259,7 @@ gpio7: gpio@fd470000 {
 			reg = <0x0 0xfd470000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio8: gpio@fd480000 {
 			#gpio-cells = <2>;
@@ -268,7 +268,7 @@ gpio8: gpio@fd480000 {
 			reg = <0x0 0xfd480000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio9: gpio@fd490000 {
 			#gpio-cells = <2>;
@@ -277,7 +277,7 @@ gpio9: gpio@fd490000 {
 			reg = <0x0 0xfd490000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio10: gpio@fd4a0000 {
 			#gpio-cells = <2>;
@@ -286,7 +286,7 @@ gpio10: gpio@fd4a0000 {
 			reg = <0x0 0xfd4a0000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio11: gpio@fd4b0000 {
 			#gpio-cells = <2>;
@@ -303,7 +303,7 @@ gpio12: gpio@fd4c0000 {
 			reg = <0x0 0xfd4c0000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio13: gpio@fd4d0000 {
 			#gpio-cells = <2>;
@@ -312,7 +312,7 @@ gpio13: gpio@fd4d0000 {
 			reg = <0x0 0xfd4d0000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio14: gpio@fd4e0000 {
 			#gpio-cells = <2>;
@@ -321,7 +321,7 @@ gpio14: gpio@fd4e0000 {
 			reg = <0x0 0xfd4e0000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio15: gpio@fd4f0000 {
 			#gpio-cells = <2>;
@@ -330,7 +330,7 @@ gpio15: gpio@fd4f0000 {
 			reg = <0x0 0xfd4f0000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio16: gpio@fd500000 {
 			#gpio-cells = <2>;
@@ -339,7 +339,7 @@ gpio16: gpio@fd500000 {
 			reg = <0x0 0xfd500000 0x1000>;
 			clocks = <&clk_bus>;
 			clock-names = "apb_pclk";
-			status="disabled";
+			status = "disabled";
 		};
 		gpio17: gpio@fd510000 {
 			#gpio-cells = <2>;
-- 
2.34.1

