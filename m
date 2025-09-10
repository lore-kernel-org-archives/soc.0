Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C794A4A21
	for <soc@lists.linux.dev>; Wed, 10 Sep 2025 22:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757543432; cv=none; b=ouOfCscZGzPNkE09xmHmCQPPRdNRyUia6JsIdrgNCwf9/IKeDc2/1qDuF4SsM1JhCzfRbBRNCA2//SyUGw4hHxvb+G0hv6vnDi0CAz6hUnLf5+3f8eb6NFN5ZlWEEi7gzIuMHBebsycefqilqtCIh6TehYXgk8PhPOwrV0jXl7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757543432; c=relaxed/simple;
	bh=+sFCyLUko/I+0H19xOuT5uQSZYsJ9HpBVhlRtBhUaek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=no050jmdQarw5rFAH0XG9VEWKlOvnwOVGgo+Wl9FkCj/FzclN6kdYhve+c6XMpRjUP9tVKzrjiObcmwqH+y4RNrYI/kgGwO5EWJHvG+UfxOxXh76Nh+5duInwkROJuKF4juBfyOh80jCkfwNtAc/DGib+x6ybog1cl7XM72ygWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWZX3ZPO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWZX3ZPO"
Received: by smtp.kernel.org (Postfix)
	id B9AB4C4CEF0; Wed, 10 Sep 2025 22:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF7BC4CEEB;
	Wed, 10 Sep 2025 22:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757543432;
	bh=+sFCyLUko/I+0H19xOuT5uQSZYsJ9HpBVhlRtBhUaek=;
	h=From:To:Cc:Subject:Date:From;
	b=pWZX3ZPOPObMnaHgtTUxB4uf+aa4pO4KO3aVu6AwrcQKALleg5pSLZ/+aHfbUHF66
	 1whgDSdt950Y4rZ9Ai8VzScaRE/jek6xA8YqEUWkJtFbQlPvySVnwJN8d+QQQPShKB
	 DHZM6Kfq79VlYu/BWxeTIIm5qKODUm39HtjxShJ5SffUFss6ZrMA2T+L0Zl/O32K1o
	 0j0qjsN7BoMdbtFDaVxAYJancn8MQcZiBFKWPqhrtbd9zH2Cz/zu84oS0FMhH4HrSy
	 EBgce3jW4wy5Jc1SLydmGwa2MpS0IFXnI608qfclPuP/UtfizBLH+5CnMv0HCpLAvv
	 8K62awcDM2Ucw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: apm: Clean-up clock bindings
Date: Wed, 10 Sep 2025 17:30:19 -0500
Message-ID: <20250910223020.612244-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean-up a couple of clock binding related issues in the the X-Gene DTS.

CPU and I2C nodes aren't clock providers and shouldn't have
"#clock-cells" properties.

A fixed-clock only provides 1 clock, so "#clock-cells" must be 0. The
preferred node name is "clock-<freq>" as well.

The "type" property is undocumented and unused, so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Arnd, Please take this directly.

 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 16 ++-----
 arch/arm64/boot/dts/apm/apm-storm.dtsi     | 54 ++++++++++------------
 2 files changed, 29 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index 5a64239b4708..b98fd434b7d6 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -22,7 +22,6 @@ cpu@0 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
 			next-level-cache = <&xgene_L2_0>;
-			#clock-cells = <1>;
 			clocks = <&pmd0clk 0>;
 		};
 		cpu@1 {
@@ -32,7 +31,6 @@ cpu@1 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
 			next-level-cache = <&xgene_L2_0>;
-			#clock-cells = <1>;
 			clocks = <&pmd0clk 0>;
 		};
 		cpu@100 {
@@ -42,7 +40,6 @@ cpu@100 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
 			next-level-cache = <&xgene_L2_1>;
-			#clock-cells = <1>;
 			clocks = <&pmd1clk 0>;
 		};
 		cpu@101 {
@@ -52,7 +49,6 @@ cpu@101 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
 			next-level-cache = <&xgene_L2_1>;
-			#clock-cells = <1>;
 			clocks = <&pmd1clk 0>;
 		};
 		cpu@200 {
@@ -62,7 +58,6 @@ cpu@200 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
 			next-level-cache = <&xgene_L2_2>;
-			#clock-cells = <1>;
 			clocks = <&pmd2clk 0>;
 		};
 		cpu@201 {
@@ -72,7 +67,6 @@ cpu@201 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
 			next-level-cache = <&xgene_L2_2>;
-			#clock-cells = <1>;
 			clocks = <&pmd2clk 0>;
 		};
 		cpu@300 {
@@ -82,7 +76,6 @@ cpu@300 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
 			next-level-cache = <&xgene_L2_3>;
-			#clock-cells = <1>;
 			clocks = <&pmd3clk 0>;
 		};
 		cpu@301 {
@@ -92,7 +85,6 @@ cpu@301 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
 			next-level-cache = <&xgene_L2_3>;
-			#clock-cells = <1>;
 			clocks = <&pmd3clk 0>;
 		};
 		xgene_L2_0: l2-cache-0 {
@@ -211,9 +203,9 @@ v2m15: v2m@f0000 {
 		};
 	};
 
-	refclk: refclk {
+	refclk: clock-100000000 {
 		compatible = "fixed-clock";
-		#clock-cells = <1>;
+		#clock-cells = <0>;
 		clock-frequency = <100000000>;
 		clock-output-names = "refclk";
 	};
@@ -246,7 +238,7 @@ clocks {
 			pmdpll: pmdpll@170000f0 {
 				compatible = "apm,xgene-pcppll-v2-clock";
 				#clock-cells = <1>;
-				clocks = <&refclk 0>;
+				clocks = <&refclk>;
 				reg = <0x0 0x170000f0 0x0 0x10>;
 				clock-output-names = "pmdpll";
 			};
@@ -286,7 +278,7 @@ pmd3clk: pmd3clk@7e200230 {
 			socpll: socpll@17000120 {
 				compatible = "apm,xgene-socpll-v2-clock";
 				#clock-cells = <1>;
-				clocks = <&refclk 0>;
+				clocks = <&refclk>;
 				reg = <0x0 0x17000120 0x0 0x1000>;
 				clock-output-names = "socpll";
 			};
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 872093b05ce1..5feb561c75c5 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -112,9 +112,9 @@ gic: interrupt-controller@78010000 {
 		interrupts = <1 9 0xf04>;	/* GIC Maintenence IRQ */
 	};
 
-	refclk: refclk {
+	refclk: clock-100000000 {
 		compatible = "fixed-clock";
-		#clock-cells = <1>;
+		#clock-cells = <0>;
 		clock-frequency = <100000000>;
 		clock-output-names = "refclk";
 	};
@@ -148,28 +148,25 @@ clocks {
 			pcppll: pcppll@17000100 {
 				compatible = "apm,xgene-pcppll-clock";
 				#clock-cells = <1>;
-				clocks = <&refclk 0>;
+				clocks = <&refclk>;
 				clock-names = "pcppll";
 				reg = <0x0 0x17000100 0x0 0x1000>;
 				clock-output-names = "pcppll";
-				type = <0>;
 			};
 
 			socpll: socpll@17000120 {
 				compatible = "apm,xgene-socpll-clock";
 				#clock-cells = <1>;
-				clocks = <&refclk 0>;
+				clocks = <&refclk>;
 				clock-names = "socpll";
 				reg = <0x0 0x17000120 0x0 0x1000>;
 				clock-output-names = "socpll";
-				type = <1>;
 			};
 
 			socplldiv2: socplldiv2  {
 				compatible = "fixed-factor-clock";
-				#clock-cells = <1>;
+				#clock-cells = <0>;
 				clocks = <&socpll 0>;
-				clock-names = "socplldiv2";
 				clock-mult = <1>;
 				clock-div = <2>;
 				clock-output-names = "socplldiv2";
@@ -178,7 +175,7 @@ socplldiv2: socplldiv2  {
 			ahbclk: ahbclk@17000000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x17000000 0x0 0x2000>;
 				reg-names = "div-reg";
 				divider-offset = <0x164>;
@@ -190,7 +187,7 @@ ahbclk: ahbclk@17000000 {
 			sdioclk: sdioclk@1f2ac000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f2ac000 0x0 0x1000
 					0x0 0x17000000 0x0 0x2000>;
 				reg-names = "csr-reg", "div-reg";
@@ -207,7 +204,7 @@ sdioclk: sdioclk@1f2ac000 {
 			ethclk: ethclk {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				clock-names = "ethclk";
 				reg = <0x0 0x17000000 0x0 0x1000>;
 				reg-names = "div-reg";
@@ -229,7 +226,7 @@ menetclk: menetclk {
 			sge0clk: sge0clk@1f21c000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f21c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				csr-mask = <0xa>;
@@ -240,7 +237,7 @@ sge0clk: sge0clk@1f21c000 {
 			xge0clk: xge0clk@1f61c000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f61c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				csr-mask = <0x3>;
@@ -251,7 +248,7 @@ xge1clk: xge1clk@1f62c000 {
 				compatible = "apm,xgene-device-clock";
 				status = "disabled";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f62c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				csr-mask = <0x3>;
@@ -261,7 +258,7 @@ xge1clk: xge1clk@1f62c000 {
 			sataphy1clk: sataphy1clk@1f21c000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f21c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "sataphy1clk";
@@ -275,7 +272,7 @@ sataphy1clk: sataphy1clk@1f21c000 {
 			sataphy2clk: sataphy1clk@1f22c000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f22c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "sataphy2clk";
@@ -289,7 +286,7 @@ sataphy2clk: sataphy1clk@1f22c000 {
 			sataphy3clk: sataphy1clk@1f23c000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f23c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "sataphy3clk";
@@ -303,7 +300,7 @@ sataphy3clk: sataphy1clk@1f23c000 {
 			sata01clk: sata01clk@1f21c000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f21c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "sata01clk";
@@ -316,7 +313,7 @@ sata01clk: sata01clk@1f21c000 {
 			sata23clk: sata23clk@1f22c000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f22c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "sata23clk";
@@ -329,7 +326,7 @@ sata23clk: sata23clk@1f22c000 {
 			sata45clk: sata45clk@1f23c000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f23c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "sata45clk";
@@ -342,7 +339,7 @@ sata45clk: sata45clk@1f23c000 {
 			rtcclk: rtcclk@17000000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x17000000 0x0 0x2000>;
 				reg-names = "csr-reg";
 				csr-offset = <0xc>;
@@ -355,7 +352,7 @@ rtcclk: rtcclk@17000000 {
 			rngpkaclk: rngpkaclk@17000000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x17000000 0x0 0x2000>;
 				reg-names = "csr-reg";
 				csr-offset = <0xc>;
@@ -369,7 +366,7 @@ pcie0clk: pcie0clk@1f2bc000 {
 				status = "disabled";
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f2bc000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "pcie0clk";
@@ -379,7 +376,7 @@ pcie1clk: pcie1clk@1f2cc000 {
 				status = "disabled";
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f2cc000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "pcie1clk";
@@ -389,7 +386,7 @@ pcie2clk: pcie2clk@1f2dc000 {
 				status = "disabled";
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f2dc000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "pcie2clk";
@@ -399,7 +396,7 @@ pcie3clk: pcie3clk@1f50c000 {
 				status = "disabled";
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f50c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "pcie3clk";
@@ -409,7 +406,7 @@ pcie4clk: pcie4clk@1f51c000 {
 				status = "disabled";
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f51c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "pcie4clk";
@@ -418,7 +415,7 @@ pcie4clk: pcie4clk@1f51c000 {
 			dmaclk: dmaclk@1f27c000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f27c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "dmaclk";
@@ -849,7 +846,6 @@ i2c0: i2c@10512000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x0 0x10512000 0x0 0x1000>;
 			interrupts = <0 0x44 0x4>;
-			#clock-cells = <1>;
 			clocks = <&ahbclk 0>;
 		};
 
-- 
2.51.0

