Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282FAC433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:19:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DDA6164EB8; Wed, 10 Feb 2021 17:19:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5685364EBC;
	Wed, 10 Feb 2021 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612977544;
	bh=SVJBhSQhKo0sjCca2+rFaIzizC4yhNF5IW9Yq4LCxsE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ikPTq2DO2xgh3nUYg/jJU7Y3b2CfVXw8NkTY+faY0NHPlxgTEoDNclnzqI53oH89p
	 6o0/os0sTzptEqRaEQ7N7zKRR96HNuotV2lQ7iX7o76FBoXN7Bw9oGzIj8gdfZ7lnn
	 CHVqY+g7mBMcYep7PcraR4+2FuJKFjb7mOLCzh8nX2lBk+wCta9X4vjDgBfNhm9nbP
	 KIKrmUxEjsFX2Rgi3SCH+lMsa+cAazAUXHrOFOJsVWBmDaunxVuGRt9Y35gb/Xp/p/
	 o26XbTUNmQqV/3fnurmna9bHF7uKGXZCLC1Ms3Am2fq5Uv6ZK17zogehCqEVW/iNaj
	 cFZhxmgn9jX5w==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 04/11] arm64: dts: intel: socfpga_agilex: move clocks out of soc node
Date: Wed, 10 Feb 2021 18:18:16 +0100
Message-Id: <20210210171823.333802-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clocks are usually not part of the SoC but provided on the board
(external oscillators).  Moving them out of soc node fixes dtc warning:

    arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:111.10-137.5:
        Warning (simple_bus_reg): /soc/clocks: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 56 +++++++++----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index e1c0fcba5c20..12b6d208e236 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -87,6 +87,34 @@ intc: intc@fffc1000 {
 		      <0x0 0xfffc6000 0x0 0x2000>;
 	};
 
+	clocks {
+		cb_intosc_hs_div2_clk: cb-intosc-hs-div2-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+		};
+
+		cb_intosc_ls_clk: cb-intosc-ls-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+		};
+
+		f2s_free_clk: f2s-free-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+		};
+
+		osc1: osc1 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+		};
+
+		qspi_clk: qspi-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+		};
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -108,34 +136,6 @@ clkmgr: clock-controller@ffd10000 {
 			#clock-cells = <1>;
 		};
 
-		clocks {
-			cb_intosc_hs_div2_clk: cb-intosc-hs-div2-clk {
-				#clock-cells = <0>;
-				compatible = "fixed-clock";
-			};
-
-			cb_intosc_ls_clk: cb-intosc-ls-clk {
-				#clock-cells = <0>;
-				compatible = "fixed-clock";
-			};
-
-			f2s_free_clk: f2s-free-clk {
-				#clock-cells = <0>;
-				compatible = "fixed-clock";
-			};
-
-			osc1: osc1 {
-				#clock-cells = <0>;
-				compatible = "fixed-clock";
-			};
-
-			qspi_clk: qspi-clk {
-				#clock-cells = <0>;
-				compatible = "fixed-clock";
-				clock-frequency = <200000000>;
-			};
-		};
-
 		gmac0: ethernet@ff800000 {
 			compatible = "altr,socfpga-stmmac-a10-s10", "snps,dwmac-3.74a", "snps,dwmac";
 			reg = <0xff800000 0x2000>;
-- 
2.25.1

