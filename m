Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE51A9FB3
	for <soc@lists.linux.dev>; Mon, 24 Nov 2025 21:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764018067; cv=none; b=LN1WqC8JquJIx3nMP+tvdB1OwrnWFVhsNi7/A0cMdlWUBA4+1W74ZB9u4D8FiR7jz8TxtpQ3U6cYsOrmokXH+DvG2g8C7mdYUk8cN4mngYlZiSkl22CpRqJYm2dMgG32/sRwrz0tDAwDQ6szyNr4nKwaB10WYtOqqu9bi+jlQyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764018067; c=relaxed/simple;
	bh=pNtG1dsnjKimp+Ox3GUKkEVTcmUQ1B6ZXj/XYIi74C4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bv1ODMmCh6yZ7fXU/kn4ZaBEGQT6ty0CNVkXjMV/e+nQSjQhADaEbPef1ojvF0NPoBHt9WI6yWZKjo4/jEiV53eW/wEK3Op7yhq45Ea+ls1jTRz9Un22QBVj8OXz30Mc2sn1c1Bzj0iuJ36Enfr9jUuqcRfVriQUGKHdONDXBsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3wIH7zy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3wIH7zy"
Received: by smtp.kernel.org (Postfix)
	id 8EFC6C16AAE; Mon, 24 Nov 2025 21:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A130C4CEF1;
	Mon, 24 Nov 2025 21:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764018067;
	bh=pNtG1dsnjKimp+Ox3GUKkEVTcmUQ1B6ZXj/XYIi74C4=;
	h=From:To:Cc:Subject:Date:From;
	b=V3wIH7zyjZTODQiBRNMk+FQkS0j1Bzq1l74aJIydwAmauxy1hTPQHxitkMK8pJz+o
	 u3pxGFbzvA22TnlAT4QW2j54nqUzjicWRpeBkddho4DFT6zR3C/ZTcZ2rrO7rNLlRQ
	 xueFL5tzYvDI0OvM/79SZ+a2VHJBQ4nO3jyFf18t8tNbV/2inbgcS0hYZtmn46z+Ce
	 XSpkg/DHnAdlWl953q3Aajl30S1/nLrVJmy9E7ypzNAhl8WFLum2m5pUJrcOmcZ+K+
	 XfD0oVLPfWpIhiIrA5FyehGz5HQWTrrOieU60uRxnX447eNSJoUmZ2s2YuBIEoSeuM
	 ezMejNltiWACg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: sprd: sc9860: Simplify clock nodes
Date: Mon, 24 Nov 2025 15:00:31 -0600
Message-ID: <20251124210031.767382-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The various "syscon" nodes in SC9860 are only referenced by clock
provider nodes in a 1:1 relationship, and nothing else references the
"syscon" nodes. There's no apparent reason for this split. The 2 nodes
can simply be merged into 1 node. The clock driver has supported using
either "reg" or "sprd,syscon" to access registers from the start, so
there shouldn't be any compatibility issues.

With this, DT schema warnings for missing a specific compatible with
"syscon" and non-MMIO devices on "simple-bus" are fixed.

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Arnd, Please apply directly.

v2:
 - Correct some indentation
---
 arch/arm64/boot/dts/sprd/sc9860.dtsi | 62 ----------------------------
 arch/arm64/boot/dts/sprd/whale2.dtsi | 54 ++++++++++++++++--------
 2 files changed, 36 insertions(+), 80 deletions(-)

diff --git a/arch/arm64/boot/dts/sprd/sc9860.dtsi b/arch/arm64/boot/dts/sprd/sc9860.dtsi
index d2456d633c39..864ef0a17425 100644
--- a/arch/arm64/boot/dts/sprd/sc9860.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc9860.dtsi
@@ -184,20 +184,6 @@ gic: interrupt-controller@12001000 {
 						| IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
-		pmu_gate: pmu-gate {
-			compatible = "sprd,sc9860-pmu-gate";
-			sprd,syscon = <&pmu_regs>; /* 0x402b0000 */
-			clocks = <&ext_26m>;
-			#clock-cells = <1>;
-		};
-
-		pll: pll {
-			compatible = "sprd,sc9860-pll";
-			sprd,syscon = <&ana_regs>; /* 0x40400000 */
-			clocks = <&pmu_gate 0>;
-			#clock-cells = <1>;
-		};
-
 		ap_clk: clock-controller@20000000 {
 			compatible = "sprd,sc9860-ap-clk";
 			reg = <0 0x20000000 0 0x400>;
@@ -214,19 +200,6 @@ aon_prediv: aon-prediv@402d0000 {
 			#clock-cells = <1>;
 		};
 
-		apahb_gate: apahb-gate {
-			compatible = "sprd,sc9860-apahb-gate";
-			sprd,syscon = <&ap_ahb_regs>; /* 0x20210000 */
-			clocks = <&aon_prediv 0>;
-			#clock-cells = <1>;
-		};
-
-		aon_gate: aon-gate {
-			compatible = "sprd,sc9860-aon-gate";
-			sprd,syscon = <&aon_regs>; /* 0x402e0000 */
-			clocks = <&aon_prediv 0>;
-			#clock-cells = <1>;
-		};
 
 		aonsecure_clk: clock-controller@40880000 {
 			compatible = "sprd,sc9860-aonsecure-clk";
@@ -235,13 +208,6 @@ aonsecure_clk: clock-controller@40880000 {
 			#clock-cells = <1>;
 		};
 
-		agcp_gate: agcp-gate {
-			compatible = "sprd,sc9860-agcp-gate";
-			sprd,syscon = <&agcp_regs>; /* 0x415e0000 */
-			clocks = <&aon_prediv 0>;
-			#clock-cells = <1>;
-		};
-
 		gpu_clk: clock-controller@60200000 {
 			compatible = "sprd,sc9860-gpu-clk";
 			reg = <0 0x60200000 0 0x400>;
@@ -256,13 +222,6 @@ vsp_clk: clock-controller@61000000 {
 			#clock-cells = <1>;
 		};
 
-		vsp_gate: vsp-gate {
-			compatible = "sprd,sc9860-vsp-gate";
-			sprd,syscon = <&vsp_regs>; /* 0x61100000 */
-			clocks = <&vsp_clk 0>;
-			#clock-cells = <1>;
-		};
-
 		cam_clk: clock-controller@62000000 {
 			compatible = "sprd,sc9860-cam-clk";
 			reg = <0 0x62000000 0 0x4000>;
@@ -270,13 +229,6 @@ cam_clk: clock-controller@62000000 {
 			#clock-cells = <1>;
 		};
 
-		cam_gate: cam-gate {
-			compatible = "sprd,sc9860-cam-gate";
-			sprd,syscon = <&cam_regs>; /* 0x62100000 */
-			clocks = <&cam_clk 0>;
-			#clock-cells = <1>;
-		};
-
 		disp_clk: clock-controller@63000000 {
 			compatible = "sprd,sc9860-disp-clk";
 			reg = <0 0x63000000 0 0x400>;
@@ -284,20 +236,6 @@ disp_clk: clock-controller@63000000 {
 			#clock-cells = <1>;
 		};
 
-		disp_gate: disp-gate {
-			compatible = "sprd,sc9860-disp-gate";
-			sprd,syscon = <&disp_regs>; /* 0x63100000 */
-			clocks = <&disp_clk 0>;
-			#clock-cells = <1>;
-		};
-
-		apapb_gate: apapb-gate {
-			compatible = "sprd,sc9860-apapb-gate";
-			sprd,syscon = <&ap_apb_regs>; /* 0x70b00000 */
-			clocks = <&ap_clk 0>;
-			#clock-cells = <1>;
-		};
-
 		funnel@10001000 { /* SoC Funnel */
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0 0x10001000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
index a551e14ce826..2ecaa56001b8 100644
--- a/arch/arm64/boot/dts/sprd/whale2.dtsi
+++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
@@ -18,49 +18,67 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
-		ap_ahb_regs: syscon@20210000 {
-			compatible = "syscon";
+		apahb_gate: clock-controller@20210000 {
 			reg = <0 0x20210000 0 0x10000>;
+			compatible = "sprd,sc9860-apahb-gate";
+			clocks = <&aon_prediv 0>;
+			#clock-cells = <1>;
 		};
 
-		pmu_regs: syscon@402b0000 {
-			compatible = "syscon";
+		pmu_gate: clock-controller@402b0000 {
 			reg = <0 0x402b0000 0 0x10000>;
+			compatible = "sprd,sc9860-pmu-gate";
+			clocks = <&ext_26m>;
+			#clock-cells = <1>;
 		};
 
-		aon_regs: syscon@402e0000 {
-			compatible = "syscon";
+		aon_gate: clock-controller@402e0000 {
 			reg = <0 0x402e0000 0 0x10000>;
+			compatible = "sprd,sc9860-aon-gate";
+			clocks = <&aon_prediv 0>;
+			#clock-cells = <1>;
 		};
 
-		ana_regs: syscon@40400000 {
-			compatible = "syscon";
+		pll: clock-controller@40400000 {
 			reg = <0 0x40400000 0 0x10000>;
+			compatible = "sprd,sc9860-pll";
+			clocks = <&pmu_gate 0>;
+			#clock-cells = <1>;
 		};
 
-		agcp_regs: syscon@415e0000 {
-			compatible = "syscon";
+		agcp_gate: clock-controller@415e0000 {
 			reg = <0 0x415e0000 0 0x1000000>;
+			compatible = "sprd,sc9860-agcp-gate";
+			clocks = <&aon_prediv 0>;
+			#clock-cells = <1>;
 		};
 
-		vsp_regs: syscon@61100000 {
-			compatible = "syscon";
+		vsp_gate: clock-controller@61100000 {
 			reg = <0 0x61100000 0 0x10000>;
+			compatible = "sprd,sc9860-vsp-gate";
+			clocks = <&vsp_clk 0>;
+			#clock-cells = <1>;
 		};
 
-		cam_regs: syscon@62100000 {
-			compatible = "syscon";
+		cam_gate: clock-controller@62100000 {
 			reg = <0 0x62100000 0 0x10000>;
+			compatible = "sprd,sc9860-cam-gate";
+			clocks = <&cam_clk 0>;
+			#clock-cells = <1>;
 		};
 
-		disp_regs: syscon@63100000 {
-			compatible = "syscon";
+		disp_gate: clock-controller@63100000 {
 			reg = <0 0x63100000 0 0x10000>;
+			compatible = "sprd,sc9860-disp-gate";
+			clocks = <&disp_clk 0>;
+			#clock-cells = <1>;
 		};
 
-		ap_apb_regs: syscon@70b00000 {
-			compatible = "syscon";
+		apapb_gate: clock-controller@70b00000 {
 			reg = <0 0x70b00000 0 0x40000>;
+			compatible = "sprd,sc9860-apapb-gate";
+			clocks = <&ap_clk 0>;
+			#clock-cells = <1>;
 		};
 
 		ap-apb@70000000 {
-- 
2.51.0

