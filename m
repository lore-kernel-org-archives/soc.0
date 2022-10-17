Return-Path: <SRS0=wyjY=2S=gmail.com=prabhakar.csengg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7303C4332F
	for <soc@archiver.kernel.org>; Mon, 17 Oct 2022 09:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B37B0C43470; Mon, 17 Oct 2022 09:12:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C074C433D7;
	Mon, 17 Oct 2022 09:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C074C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id bp11so17454092wrb.9;
        Mon, 17 Oct 2022 02:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OltTue7fV+pm0dWoAkRtVfC8ZA3XHcmTKymb7cJyD0k=;
        b=ZS2QYyal2gUd1IByUizGEzMmWmSMrjjVLI0ohRMORZyEWhLGUhea8H3MT5a/FAqXK3
         qMtTIVEq4TfTuirgB/rE6cJWPP+4b9i9eD+GciP3qzExErmY+s64x5yUfFbq/WRwdcZT
         HxCWNagEobfRYDLtkOzP72ZDszadYJLvF9QxZvJBIsJQGHbVTn+IFmY8RsFLSouOhphj
         7VUHeSZOa46zIXBFGnhXiPzZxVjClbmAgQ+7nVd9jkdjpHxzKLNeKx8Q82TplTnKe05s
         Oz/Mvd/Q/IdD71lKubzDN9tMjKJFF8wGqly27eXuiTCAFTlRUyuY1lhC70pmTGQz82v2
         mWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OltTue7fV+pm0dWoAkRtVfC8ZA3XHcmTKymb7cJyD0k=;
        b=XxhLXb/it9PCkQe77aPeGPJMqbis3uj3N2eBNkbnXK8oylE1qV3SN/v1PDAdg0+T0n
         CIgW5QGWOxuQsCLXbjR6wyHcXxeba4qOk3jVKaeRFVLChFts7Y3RhpZ03Q53KowHOM01
         DvvL+0twF/YX+8qWAwXYSfHQ5dR3YJYXGA7negs2VSQjZeKSfsechrLRdUw9+MlaKz7b
         NyuJ9Sq6uKp/1wcfdg+Ztl46zu8UtP4RavzP90753AIwEBx4g2K8c++mEJq4YV8nB0rt
         /orcDw4UeVKGBS+cvh5Ltioq07UmVJJ0qIvEr9C6TwpC4hr8mu/PRLKlYwiyGc9QjQeZ
         bCKw==
X-Gm-Message-State: ACrzQf0CP26ouM+qBBa2retR+YG+6yFuyqlaHiv/TDC+wmancJ2fHC5o
	tBkC93C6BCffbikPxuPhvhY=
X-Google-Smtp-Source: AMsMyM5hDf4SUG7Gumh65b8tzMsDyGNpkRs5+FGPgK4imvvBTVDx/Nmg8smHZisNAU+on60+/OJFoQ==
X-Received: by 2002:a05:6000:144c:b0:230:816f:3167 with SMTP id v12-20020a056000144c00b00230816f3167mr5542749wrx.532.1665997939669;
        Mon, 17 Oct 2022 02:12:19 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:fc4d:6548:d8bd:5bd])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d400e000000b0022ae401e9e0sm7921503wrp.78.2022.10.17.02.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 02:12:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC RESEND PATCH 2/2] arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts
Date: Mon, 17 Oct 2022 10:12:01 +0100
Message-Id: <20221017091201.199457-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move RZ/G2UL SoC specific parts to r9a07g043u.dtsi so that r9a07g043.dtsi
can be shared with RZ/Five (RISC-V SoC).

Below are the changes due to which SoC specific parts are moved to
r9a07g043u.dtsi:
- RZ/G2UL has Cortex-A55 (ARM64) whereas the RZ/Five has AX45MP (RISC-V)
- RZ/G2UL has GICv3 as interrupt controller whereas the RZ/Five has PLIC
- RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
  for SYSC block on RZ/Five

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi  | 54 +------------------
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 60 +++++++++++++++++++++
 2 files changed, 61 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index c41840e32c30..fd2b7d7e6d1a 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for the RZ/G2UL SoC
+ * Device Tree Source for the RZ/Five and RZ/G2UL SoCs
  *
  * Copyright (C) 2022 Renesas Electronics Corp.
  */
@@ -68,36 +68,8 @@ opp-1000000000 {
 		};
 	};
 
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			compatible = "arm,cortex-a55";
-			reg = <0>;
-			device_type = "cpu";
-			#cooling-cells = <2>;
-			next-level-cache = <&L3_CA55>;
-			enable-method = "psci";
-			clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
-			operating-points-v2 = <&cluster0_opp>;
-		};
-
-		L3_CA55: cache-controller-0 {
-			compatible = "cache";
-			cache-unified;
-			cache-size = <0x40000>;
-		};
-	};
-
-	psci {
-		compatible = "arm,psci-1.0", "arm,psci-0.2";
-		method = "smc";
-	};
-
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -550,12 +522,6 @@ cpg: clock-controller@11010000 {
 		sysc: system-controller@11020000 {
 			compatible = "renesas,r9a07g043-sysc";
 			reg = <0 0x11020000 0 0x10000>;
-			interrupts = <SOC_PERIPHERAL_IRQ(42, IRQ_TYPE_LEVEL_HIGH)>,
-				     <SOC_PERIPHERAL_IRQ(43, IRQ_TYPE_LEVEL_HIGH)>,
-				     <SOC_PERIPHERAL_IRQ(44, IRQ_TYPE_LEVEL_HIGH)>,
-				     <SOC_PERIPHERAL_IRQ(45, IRQ_TYPE_LEVEL_HIGH)>;
-			interrupt-names = "lpm_int", "ca55stbydone_int",
-					  "cm33stbyr_int", "ca55_deny";
 			status = "disabled";
 		};
 
@@ -608,16 +574,6 @@ dmac: dma-controller@11820000 {
 			dma-channels = <16>;
 		};
 
-		gic: interrupt-controller@11900000 {
-			compatible = "arm,gic-v3";
-			#interrupt-cells = <3>;
-			#address-cells = <0>;
-			interrupt-controller;
-			reg = <0x0 0x11900000 0 0x40000>,
-			      <0x0 0x11940000 0 0x60000>;
-			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
-		};
-
 		sdhi0: mmc@11c00000 {
 			compatible = "renesas,sdhi-r9a07g043",
 				     "renesas,rcar-gen3-sdhi";
@@ -883,12 +839,4 @@ target: trip-point {
 			};
 		};
 	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
-	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index be84392ee47f..dcbeda9b6c23 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -10,3 +10,63 @@
 #define SOC_PERIPHERAL_IRQ(nr, na)	GIC_SPI nr na
 
 #include "r9a07g043.dtsi"
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0>;
+			device_type = "cpu";
+			#cooling-cells = <2>;
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
+			operating-points-v2 = <&cluster0_opp>;
+		};
+
+		L3_CA55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x40000>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
+
+&soc {
+	interrupt-parent = <&gic>;
+
+	gic: interrupt-controller@11900000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		#address-cells = <0>;
+		interrupt-controller;
+		reg = <0x0 0x11900000 0 0x40000>,
+		      <0x0 0x11940000 0 0x60000>;
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&sysc {
+	interrupts = <SOC_PERIPHERAL_IRQ(42, IRQ_TYPE_LEVEL_HIGH)>,
+		     <SOC_PERIPHERAL_IRQ(43, IRQ_TYPE_LEVEL_HIGH)>,
+		     <SOC_PERIPHERAL_IRQ(44, IRQ_TYPE_LEVEL_HIGH)>,
+		     <SOC_PERIPHERAL_IRQ(45, IRQ_TYPE_LEVEL_HIGH)>;
+	interrupt-names = "lpm_int", "ca55stbydone_int",
+			  "cm33stbyr_int", "ca55_deny";
+};
-- 
2.25.1

