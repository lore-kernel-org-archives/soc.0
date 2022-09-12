Return-Path: <SRS0=ZTeZ=ZP=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46721C6FA8E
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 07:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D60AC4347C; Mon, 12 Sep 2022 07:16:27 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 94516C433B5;
	Mon, 12 Sep 2022 07:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94516C433B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 12 Sep 2022 16:16:00 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id DEA102059027;
	Mon, 12 Sep 2022 16:15:59 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 12 Sep 2022 16:15:59 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 2E24BB62AE;
	Mon, 12 Sep 2022 16:15:59 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 9/9] arm64: dts: uniphier: Add L2 cache node
Date: Mon, 12 Sep 2022 16:15:54 +0900
Message-Id: <20220912071554.1480-10-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220912071554.1480-1-hayashi.kunihiko@socionext.com>
References: <20220912071554.1480-1-hayashi.kunihiko@socionext.com>

Add a L2 cache node referenced from CPU nodes as the missing cache
hierarchy information because the following warning was issued.

  cacheinfo: Unable to detect cache hierarchy for CPU 0
  Early cacheinfo failed, ret = -2

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi |  6 ++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi |  8 ++++++++
 3 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 6a7d7973e9dd..a75356db006b 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -36,6 +36,7 @@ cpu0: cpu@0 {
 			reg = <0 0x000>;
 			clocks = <&sys_clk 33>;
 			enable-method = "psci";
+			next-level-cache = <&l2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -45,8 +46,13 @@ cpu1: cpu@1 {
 			reg = <0 0x001>;
 			clocks = <&sys_clk 33>;
 			enable-method = "psci";
+			next-level-cache = <&l2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
+
+		l2: l2-cache {
+			compatible = "cache";
+		};
 	};
 
 	cluster0_opp: opp-table {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index e24784e12b7b..1e6317e371ba 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -46,6 +46,7 @@ cpu0: cpu@0 {
 			reg = <0 0x000>;
 			clocks = <&sys_clk 32>;
 			enable-method = "psci";
+			next-level-cache = <&a72_l2>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
@@ -56,6 +57,7 @@ cpu1: cpu@1 {
 			reg = <0 0x001>;
 			clocks = <&sys_clk 32>;
 			enable-method = "psci";
+			next-level-cache = <&a72_l2>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
@@ -66,6 +68,7 @@ cpu2: cpu@100 {
 			reg = <0 0x100>;
 			clocks = <&sys_clk 33>;
 			enable-method = "psci";
+			next-level-cache = <&a53_l2>;
 			operating-points-v2 = <&cluster1_opp>;
 			#cooling-cells = <2>;
 		};
@@ -76,9 +79,18 @@ cpu3: cpu@101 {
 			reg = <0 0x101>;
 			clocks = <&sys_clk 33>;
 			enable-method = "psci";
+			next-level-cache = <&a53_l2>;
 			operating-points-v2 = <&cluster1_opp>;
 			#cooling-cells = <2>;
 		};
+
+		a72_l2: l2-cache0 {
+			compatible = "cache";
+		};
+
+		a53_l2: l2-cache1 {
+			compatible = "cache";
+		};
 	};
 
 	cluster0_opp: opp-table-0 {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index 6277be04a974..72ba6a52233e 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -43,6 +43,7 @@ cpu0: cpu@0 {
 			reg = <0 0x000>;
 			clocks = <&sys_clk 33>;
 			enable-method = "psci";
+			next-level-cache = <&l2>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
@@ -53,6 +54,7 @@ cpu1: cpu@1 {
 			reg = <0 0x001>;
 			clocks = <&sys_clk 33>;
 			enable-method = "psci";
+			next-level-cache = <&l2>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
@@ -63,6 +65,7 @@ cpu2: cpu@2 {
 			reg = <0 0x002>;
 			clocks = <&sys_clk 33>;
 			enable-method = "psci";
+			next-level-cache = <&l2>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
@@ -73,9 +76,14 @@ cpu3: cpu@3 {
 			reg = <0 0x003>;
 			clocks = <&sys_clk 33>;
 			enable-method = "psci";
+			next-level-cache = <&l2>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
+
+		l2: l2-cache {
+			compatible = "cache";
+		};
 	};
 
 	cluster0_opp: opp-table {
-- 
2.25.1

