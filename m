Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C614D38F956
	for <soc@lists.linux.dev>; Wed, 25 Feb 2026 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014301; cv=none; b=fPw2VK8Et2noArMOphGy6ZO20dLK/KQid6M+a4mmPxP2GgbGgSU8Ly8W3NqAtuFwzJBdvFN/ys2XY2weWmAJWEFfCwLm/FOlnv8mTRoiEvqkBH6W3Qllx/YaeUS71Q2DMesEiWHYbClN0oRSZMfwoB9H7iwgyrLoekWFWzUuGbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014301; c=relaxed/simple;
	bh=iHQBjZ5Gb/Jns1ArefGi3RDRBTKcOLhp+AkcU7Ofczo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7U1y7trTP4+FtzXQ3IiXpSgYgKoPhL2O6/slabV5184v1jyJ0Zb1rpxnJ5IRuswebeeQL3Hab3a7l2gnKZIYKP9V8DUUkHKnXmmKOda0DxLLn1RIxEImn1HDwoCHeQ+TmID2pIr9OLOTO+o0/j7G8zzrzYgo4kdZusF2n7aaE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=IvKgzqCW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="IvKgzqCW"
Received: by smtp.kernel.org (Postfix)
	id 7D265C19422; Wed, 25 Feb 2026 10:11:41 +0000 (UTC)
Received: from mail-m19731100.qiye.163.com (mail-m19731100.qiye.163.com [220.197.31.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67F8EC116D0;
	Wed, 25 Feb 2026 10:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67F8EC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34ea9e545;
	Wed, 25 Feb 2026 18:06:19 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de,
	soc@kernel.org,
	krzk@kernel.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yangzh0906@thundersoft.com
Subject: [PATCH v6 1/2] arm64: dts: bst: enable eMMC controller in C1200 CDCU1.0 board
Date: Wed, 25 Feb 2026 18:06:12 +0800
Message-ID: <20260225100613.3791261-2-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225100613.3791261-1-yangzh0906@thundersoft.com>
References: <20260225100613.3791261-1-yangzh0906@thundersoft.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c944388e609cckunm3fc0fc0ab1afe2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHR1JVktJTUgaHk5IT0lDGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=IvKgzqCWGVMxhA/JTVX4uwWHHs8jZ3xconoHPSCZDjLmQQc7+Hmgy7CL6Ar++IMItYEM4K/n+fn5ZB3eielusXzNg8ksR37wDrDKfGV3t0nfcbp2mptcbXmnYaQDZNZBierRdOdwFZ3ER3G3SssYWxEGv1Y0IH52+heLC2XbawY=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=L+fRucl20FdKOFHwR98xnMI2CpradJDFDcAG3Cugf9A=;
	h=date:mime-version:subject:message-id:from;

Add eMMC controller support to the BST C1200 device tree:

- bstc1200.dtsi: Add mmc0 node for the DWCMSHC SDHCI controller
  with basic configuration (disabled by default)
- bstc1200.dtsi: Add fixed clock definition for MMC controller
- bstc1200-cdcu1.0-adas_4c2g.dts: Enable mmc0 with board-specific
  configuration including 8-bit bus width and reserved SRAM buffer

The bounce buffer in reserved SRAM addresses hardware constraints
where the eMMC controller cannot access main system memory through
SMMU due to a hardware bug, and all DRAM is located outside the
4GB boundary.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>

---
Changes for v5:
- Split from platform series per Arnd's feedback

Changes for v4:
- Change compatible to bst,c1200-sdhci
- Move bus-width and non-removable to board dts

Changes for v3:
- Split defconfig into dedicated patch

Changes for v2:
- Reorganize memory map, standardize interrupt definitions
---
 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    | 19 +++++++++++++++++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 18 ++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
index 5eb9ef369d8c..178ad4bf4f0a 100644
--- a/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
+++ b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
@@ -17,6 +17,25 @@ memory@810000000 {
 		      <0x8 0xc0000000 0x1 0x0>,
 		      <0xc 0x00000000 0x0 0x40000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		mmc0_reserved: mmc0-reserved@5160000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x5160000 0x0 0x10000>;
+			no-map;
+		};
+	};
+};
+
+&mmc0 {
+	bus-width = <8>;
+	memory-region = <&mmc0_reserved>;
+	non-removable;
+	status = "okay";
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/bst/bstc1200.dtsi b/arch/arm64/boot/dts/bst/bstc1200.dtsi
index dd13c6bfc3c8..9660d8396e27 100644
--- a/arch/arm64/boot/dts/bst/bstc1200.dtsi
+++ b/arch/arm64/boot/dts/bst/bstc1200.dtsi
@@ -7,6 +7,12 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	clk_mmc: clock-4000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <4000000>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -72,6 +78,18 @@ uart0: serial@20008000 {
 			status = "disabled";
 		};
 
+		mmc0: mmc@22200000 {
+			compatible = "bst,c1200-sdhci";
+			reg = <0x0 0x22200000 0x0 0x1000>,
+			      <0x0 0x23006000 0x0 0x1000>;
+			clocks = <&clk_mmc>;
+			clock-names = "core";
+			dma-coherent;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <200000000>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@32800000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x32800000 0x0 0x10000>,
-- 
2.43.0

