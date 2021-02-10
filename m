Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDC2C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:21:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9424764DDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9424764DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Tf6PNpUjBL777o0Z4EHXbNPi84kLLpqTFdp2DQLtZg=; b=qPAYlamo96hWciL0bLfhSn+AO
	dHNPnAUvOXl99awwxYczC+FgufEQy+Ehmgc7YD+uMGFOuk6cOJQ4GJBAazVrjWpUyoTvAHODXrYQA
	LSQlZgsiP4BxYONvALPHAe+K2pBuixP12sfATHR4i7i9h/7vE4OLErhkO2EWtNlKRvwKfEgq2mKPe
	iS0v1Ny0ZMB5dqpJUiGVTn/KHjSYyTCN+VAJ5F26l3Ve1tRxxTXaGjPIryxc+rn+5OToYkYE8HoE8
	UOvyHwi3i2CrhVkSYj7v57RpXSYBKljT+YiAvVyphj+5Ps+OaXbAc7MK6pp36rxn+Oz4uiGZmARA7
	MU7s+gOPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9t9R-0008Gy-NG; Wed, 10 Feb 2021 17:19:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9t95-000887-MF
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 17:19:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17FDE64ED7;
 Wed, 10 Feb 2021 17:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612977558;
 bh=pKKVptmd2p/hBV6GqodBnUu6HbhFt/nm3XajRVwjJLk=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BYCTNwhNBdYf1HYs46GX0wj5oO9QYVext7k8GC+EX3Dsf86ZU6wwy5uZpjNjQ92X8
 vUE6m8DsRL3+X3fUh2zg40owgmNY2h2lUa86qtS/Id2AWWclmiRZ08fs0ddp2ojOIF
 Z4Jd4lCaw++RL51eyPJGYJUPcgVHYabhYpicaCDICE6DLk8rpl8uEhYx1PLHGHeZF3
 K0JtHwxCm9lPFLAg2LSuDN2l/24/sTMQRyiV4xZiNAKBUBX2rFsLWsKHBHg5xxGbcZ
 84bmB85aYX/ncaDeKXndUSW2ByymOJPgD43T+Mc+JT5k2ixrOdbDeJpu8Crp7UVadW
 YdEorTnWjUiWA==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: [PATCH 08/11] arm64: dts: intel: socfpga_agilex: use defined for GIC
 interrupts
Date: Wed, 10 Feb 2021 18:18:20 +0100
Message-ID: <20210210171823.333802-8-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_121919_960709_2C56A8F5 
X-CRM114-Status: GOOD (  13.10  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210171820.OFdRfm88RVK-xzEXJK2Ey_0HGEboKF6VTuhTnBGq-RE@z>

Use human-readable defines for GIC interrupt type and flag, instead of
hard-coding the numbers.  It makes review easier.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 137 +++++++++++-------
 1 file changed, 82 insertions(+), 55 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 20ae9f80febd..8e6ba1c06938 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 #include <dt-bindings/reset/altr,rst-mgr-s10.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/agilex-clock.h>
 
 / {
@@ -61,10 +62,10 @@ cpu3: cpu@3 {
 
 	pmu {
 		compatible = "arm,armv8-pmuv3";
-		interrupts = <0 170 4>,
-			     <0 171 4>,
-			     <0 172 4>,
-			     <0 173 4>;
+		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>,
 				     <&cpu1>,
 				     <&cpu2>,
@@ -118,10 +119,10 @@ qspi_clk: qspi-clk {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&intc>;
-		interrupts = <1 13 0xf08>,
-			     <1 14 0xf08>,
-			     <1 11 0xf08>,
-			     <1 10 0xf08>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
 	usbphy0: usbphy {
@@ -153,7 +154,7 @@ clkmgr: clock-controller@ffd10000 {
 		gmac0: ethernet@ff800000 {
 			compatible = "altr,socfpga-stmmac-a10-s10", "snps,dwmac-3.74a", "snps,dwmac";
 			reg = <0xff800000 0x2000>;
-			interrupts = <0 90 4>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			mac-address = [00 00 00 00 00 00];
 			resets = <&rst EMAC0_RESET>, <&rst EMAC0_OCP_RESET>;
@@ -171,7 +172,7 @@ gmac0: ethernet@ff800000 {
 		gmac1: ethernet@ff802000 {
 			compatible = "altr,socfpga-stmmac-a10-s10", "snps,dwmac-3.74a", "snps,dwmac";
 			reg = <0xff802000 0x2000>;
-			interrupts = <0 91 4>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			mac-address = [00 00 00 00 00 00];
 			resets = <&rst EMAC1_RESET>, <&rst EMAC1_OCP_RESET>;
@@ -189,7 +190,7 @@ gmac1: ethernet@ff802000 {
 		gmac2: ethernet@ff804000 {
 			compatible = "altr,socfpga-stmmac-a10-s10", "snps,dwmac-3.74a", "snps,dwmac";
 			reg = <0xff804000 0x2000>;
-			interrupts = <0 92 4>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			mac-address = [00 00 00 00 00 00];
 			resets = <&rst EMAC2_RESET>, <&rst EMAC2_OCP_RESET>;
@@ -220,7 +221,7 @@ porta: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <0 110 4>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -240,7 +241,7 @@ portb: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <0 111 4>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -249,7 +250,7 @@ i2c0: i2c@ffc02800 {
 			#size-cells = <0>;
 			compatible = "snps,designware-i2c";
 			reg = <0xffc02800 0x100>;
-			interrupts = <0 103 4>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rst I2C0_RESET>;
 			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			status = "disabled";
@@ -260,7 +261,7 @@ i2c1: i2c@ffc02900 {
 			#size-cells = <0>;
 			compatible = "snps,designware-i2c";
 			reg = <0xffc02900 0x100>;
-			interrupts = <0 104 4>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rst I2C1_RESET>;
 			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			status = "disabled";
@@ -271,7 +272,7 @@ i2c2: i2c@ffc02a00 {
 			#size-cells = <0>;
 			compatible = "snps,designware-i2c";
 			reg = <0xffc02a00 0x100>;
-			interrupts = <0 105 4>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rst I2C2_RESET>;
 			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			status = "disabled";
@@ -282,7 +283,7 @@ i2c3: i2c@ffc02b00 {
 			#size-cells = <0>;
 			compatible = "snps,designware-i2c";
 			reg = <0xffc02b00 0x100>;
-			interrupts = <0 106 4>;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rst I2C3_RESET>;
 			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			status = "disabled";
@@ -293,7 +294,7 @@ i2c4: i2c@ffc02c00 {
 			#size-cells = <0>;
 			compatible = "snps,designware-i2c";
 			reg = <0xffc02c00 0x100>;
-			interrupts = <0 107 4>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rst I2C4_RESET>;
 			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			status = "disabled";
@@ -304,7 +305,7 @@ mmc: dwmmc0@ff808000 {
 			#size-cells = <0>;
 			compatible = "altr,socfpga-dw-mshc";
 			reg = <0xff808000 0x1000>;
-			interrupts = <0 96 4>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 			fifo-depth = <0x400>;
 			resets = <&rst SDMMC_RESET>;
 			reset-names = "reset";
@@ -322,7 +323,7 @@ nand: nand@ffb90000 {
 			reg = <0xffb90000 0x10000>,
 			      <0xffb80000 0x1000>;
 			reg-names = "nand_data", "denali_reg";
-			interrupts = <0 97 4>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkmgr AGILEX_NAND_CLK>,
 				 <&clkmgr AGILEX_NAND_X_CLK>,
 				 <&clkmgr AGILEX_NAND_ECC_CLK>;
@@ -339,15 +340,15 @@ ocram: sram@ffe00000 {
 		pdma: pdma@ffda0000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0xffda0000 0x1000>;
-			interrupts = <0 81 4>,
-				     <0 82 4>,
-				     <0 83 4>,
-				     <0 84 4>,
-				     <0 85 4>,
-				     <0 86 4>,
-				     <0 87 4>,
-				     <0 88 4>,
-				     <0 89 4>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			#dma-channels = <8>;
 			#dma-requests = <32>;
@@ -369,17 +370,43 @@ smmu: iommu@fa000000 {
 			#global-interrupts = <2>;
 			#iommu-cells = <1>;
 			interrupt-parent = <&intc>;
-			interrupts = <0 128 4>,	/* Global Secure Fault */
-				<0 129 4>, /* Global Non-secure Fault */
+			/* Global Secure Fault */
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				/* Global Non-secure Fault */
+				<GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
 				/* Non-secure Context Interrupts (32) */
-				<0 138 4>, <0 139 4>, <0 140 4>, <0 141 4>,
-				<0 142 4>, <0 143 4>, <0 144 4>, <0 145 4>,
-				<0 146 4>, <0 147 4>, <0 148 4>, <0 149 4>,
-				<0 150 4>, <0 151 4>, <0 152 4>, <0 153 4>,
-				<0 154 4>, <0 155 4>, <0 156 4>, <0 157 4>,
-				<0 158 4>, <0 159 4>, <0 160 4>, <0 161 4>,
-				<0 162 4>, <0 163 4>, <0 164 4>, <0 165 4>,
-				<0 166 4>, <0 167 4>, <0 168 4>, <0 169 4>;
+				<GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 			stream-match-mask = <0x7ff0>;
 			clocks = <&clkmgr AGILEX_MPU_CCU_CLK>,
 				 <&clkmgr AGILEX_L3_MAIN_FREE_CLK>,
@@ -392,7 +419,7 @@ spi0: spi@ffda4000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xffda4000 0x1000>;
-			interrupts = <0 99 4>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rst SPIM0_RESET>;
 			reset-names = "spi";
 			reg-io-width = <4>;
@@ -406,7 +433,7 @@ spi1: spi@ffda5000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xffda5000 0x1000>;
-			interrupts = <0 100 4>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rst SPIM1_RESET>;
 			reset-names = "spi";
 			reg-io-width = <4>;
@@ -422,7 +449,7 @@ sysmgr: sysmgr@ffd12000 {
 
 		timer0: timer0@ffc03000 {
 			compatible = "snps,dw-apb-timer";
-			interrupts = <0 113 4>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0xffc03000 0x100>;
 			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			clock-names = "timer";
@@ -430,7 +457,7 @@ timer0: timer0@ffc03000 {
 
 		timer1: timer1@ffc03100 {
 			compatible = "snps,dw-apb-timer";
-			interrupts = <0 114 4>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0xffc03100 0x100>;
 			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			clock-names = "timer";
@@ -438,7 +465,7 @@ timer1: timer1@ffc03100 {
 
 		timer2: timer2@ffd00000 {
 			compatible = "snps,dw-apb-timer";
-			interrupts = <0 115 4>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0xffd00000 0x100>;
 			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			clock-names = "timer";
@@ -446,7 +473,7 @@ timer2: timer2@ffd00000 {
 
 		timer3: timer3@ffd00100 {
 			compatible = "snps,dw-apb-timer";
-			interrupts = <0 116 4>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0xffd00100 0x100>;
 			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			clock-names = "timer";
@@ -455,7 +482,7 @@ timer3: timer3@ffd00100 {
 		uart0: serial0@ffc02000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xffc02000 0x100>;
-			interrupts = <0 108 4>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			resets = <&rst UART0_RESET>;
@@ -466,7 +493,7 @@ uart0: serial0@ffc02000 {
 		uart1: serial1@ffc02100 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xffc02100 0x100>;
-			interrupts = <0 109 4>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			resets = <&rst UART1_RESET>;
@@ -477,7 +504,7 @@ uart1: serial1@ffc02100 {
 		usb0: usb@ffb00000 {
 			compatible = "snps,dwc2";
 			reg = <0xffb00000 0x40000>;
-			interrupts = <0 93 4>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usbphy0>;
 			phy-names = "usb2-phy";
 			resets = <&rst USB0_RESET>, <&rst USB0_OCP_RESET>;
@@ -490,7 +517,7 @@ usb0: usb@ffb00000 {
 		usb1: usb@ffb40000 {
 			compatible = "snps,dwc2";
 			reg = <0xffb40000 0x40000>;
-			interrupts = <0 94 4>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usbphy0>;
 			phy-names = "usb2-phy";
 			resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
@@ -503,7 +530,7 @@ usb1: usb@ffb40000 {
 		watchdog0: watchdog@ffd00200 {
 			compatible = "snps,dw-wdt";
 			reg = <0xffd00200 0x100>;
-			interrupts = <0 117 4>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rst WATCHDOG0_RESET>;
 			clocks = <&clkmgr AGILEX_L4_SYS_FREE_CLK>;
 			status = "disabled";
@@ -512,7 +539,7 @@ watchdog0: watchdog@ffd00200 {
 		watchdog1: watchdog@ffd00300 {
 			compatible = "snps,dw-wdt";
 			reg = <0xffd00300 0x100>;
-			interrupts = <0 118 4>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rst WATCHDOG1_RESET>;
 			clocks = <&clkmgr AGILEX_L4_SYS_FREE_CLK>;
 			status = "disabled";
@@ -521,7 +548,7 @@ watchdog1: watchdog@ffd00300 {
 		watchdog2: watchdog@ffd00400 {
 			compatible = "snps,dw-wdt";
 			reg = <0xffd00400 0x100>;
-			interrupts = <0 125 4>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rst WATCHDOG2_RESET>;
 			clocks = <&clkmgr AGILEX_L4_SYS_FREE_CLK>;
 			status = "disabled";
@@ -530,7 +557,7 @@ watchdog2: watchdog@ffd00400 {
 		watchdog3: watchdog@ffd00500 {
 			compatible = "snps,dw-wdt";
 			reg = <0xffd00500 0x100>;
-			interrupts = <0 126 4>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rst WATCHDOG3_RESET>;
 			clocks = <&clkmgr AGILEX_L4_SYS_FREE_CLK>;
 			status = "disabled";
@@ -547,7 +574,7 @@ eccmgr {
 			altr,sysmgr-syscon = <&sysmgr>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			interrupts = <0 15 4>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			ranges;
@@ -606,7 +633,7 @@ qspi: spi@ff8d2000 {
 			#size-cells = <0>;
 			reg = <0xff8d2000 0x100>,
 			      <0xff900000 0x100000>;
-			interrupts = <0 3 4>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			cdns,fifo-depth = <128>;
 			cdns,fifo-width = <4>;
 			cdns,trigger-address = <0x00000000>;
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
