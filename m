Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BCEC433E6
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 16:22:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D86EA65227; Mon,  8 Mar 2021 16:22:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 030F16522B;
	Mon,  8 Mar 2021 16:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615220574;
	bh=1RA/yRxBOCs6FoTAm1zSc0Sywe7/BN7TKdPLvBvA7rY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p0mR/YYwQlu+8rKD6T2VeuZscVos5YWqS68cVzz0NCL8IUJZ26Bc7OSkUrTX2+PsS
	 xsB3lf4H9Mz8Ju4zsC6JTuDK2b7QmwmBMmA27IiwUI28mhg6+8nBkFu4v5U9AnrLnO
	 z9P94sHQ92+hPNSVs8PvqcUFhZDIoDIluPJCE1ocJ5Mfwt9NiZtdLHKDcTfqdHUKeA
	 S0EVQw1OZsmW+ErEgV2Dp823aUDawnjmTg/LiAjsjpZVcv4mQDDj+OONg9sNeDlCNX
	 mqyAKqvOeVsYbSrPXo66YhHjDMeli2rW2DNpx2Zoh9gPc0SxK7ylh5IampJRHFrvlr
	 0AafFU6z258Qg==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 08/10] arm64: dts: intel: socfpga_agilex: align node names with dtschema
Date: Mon,  8 Mar 2021 17:22:26 +0100
Message-Id: <20210308162228.62614-9-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308162228.62614-1-krzk@kernel.org>
References: <20210308162228.62614-1-krzk@kernel.org>
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
index 3cba4c03d560..163f33b46e4f 100644
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

