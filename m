Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E833C433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:19:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DB1B164ED9; Wed, 10 Feb 2021 17:19:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39F5A64ECE;
	Wed, 10 Feb 2021 17:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612977561;
	bh=OkUEgbvb3q7v/xr6+fYyiQ2LjIwiJVB/Qs6LTMIkR08=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sJn+VaIdQM+nODR4PWAIuaL2t/24mKKmhrbQDpUEM5GWaKycNlUUNdBdXauPeuiBN
	 1jiUSrTyeYGIMenYDxcVvGp3mhd2YF8gCT2LzgMx0X3pW6sj8YTL1yi3givOgHTEG0
	 0aVuGmdILauIGS4kF1yR8of3oGLIzT82WaT9jPo649qFFGeCVgByPrgixFMN43jrFg
	 oyy13QOaTUgwUoze0tsInVWvEYE+fdcqPPqINxY2UBUYbmhpxQ8TmjUiakdv/Jz9/G
	 L31bRcLaRhdodUuJzb3SyUle1iV7wfpUupXHE8MZ14njHiEW2e2CsNLeGH3+Phg4U0
	 ReJb/NfNvRXrA==
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
Subject: [RFT 09/11] arm64: dts: intel: socfpga_agilex: align node names with dtschema
Date: Wed, 10 Feb 2021 18:18:21 +0100
Message-Id: <20210210171823.333802-9-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the NAND, GIC and UART node names with dtschema to silence
dtbs_check warnings like:

    arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dt.yaml:
        intc@fffc1000: $nodename:0: 'intc@fffc1000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
    arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dt.yaml:
        serial0@ffc02000: $nodename:0: 'serial0@ffc02000' does not match '^serial(@[0-9a-f,]+)*$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 8e6ba1c06938..860a80c4258f 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -78,7 +78,7 @@ psci {
 		method = "smc";
 	};
 
-	intc: intc@fffc1000 {
+	intc: interrupt-controller@fffc1000 {
 		compatible = "arm,gic-400", "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
@@ -316,7 +316,7 @@ mmc: dwmmc0@ff808000 {
 			status = "disabled";
 		};
 
-		nand: nand@ffb90000 {
+		nand: nand-controller@ffb90000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "altr,socfpga-denali-nand";
@@ -479,7 +479,7 @@ timer3: timer3@ffd00100 {
 			clock-names = "timer";
 		};
 
-		uart0: serial0@ffc02000 {
+		uart0: serial@ffc02000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xffc02000 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
@@ -490,7 +490,7 @@ uart0: serial0@ffc02000 {
 			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 		};
 
-		uart1: serial1@ffc02100 {
+		uart1: serial@ffc02100 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xffc02100 0x100>;
 			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1

