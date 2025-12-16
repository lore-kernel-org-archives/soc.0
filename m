Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87FE33C53A
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 18:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908144; cv=none; b=QeZ/A4HeUDvfdaq02CrON1sqcHunyAIrNB8NVwS7nvxcNUSt+7epa5cTcZzwbg4XzDdfz4nP9CpxcXSvXit8VGXP+hatXtQzVVKG/OChv0iUQtdvFzb0JPBqP4LblH4xR/Aw2UYSEXU5IPhx4BTnp3PJ+opah20Z47ifBs/ytwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908144; c=relaxed/simple;
	bh=LmeiEpnSJeBrZO0QwzigFE8VOOmE1+L3zO4uUl7fGnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5pLgZ1rphfvF6PBHdmzAZBNzW3JJJOXIVR8k8nsKiKVtN75iksRipijqVhFAFMDVlbRzNUac+Lrx1Dixm8azGjnPQKG7MZ8+Lkp3fsBfhUSGb1eQd+yGcEwyyuXdqrqducm1EmmmYf+6HtFwZnocQGrQ8XkYs/WjB9d3RqdMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjfnS/Ft; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjfnS/Ft"
Received: by smtp.kernel.org (Postfix)
	id 6243EC113D0; Tue, 16 Dec 2025 18:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B87BC4CEF1;
	Tue, 16 Dec 2025 18:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908144;
	bh=LmeiEpnSJeBrZO0QwzigFE8VOOmE1+L3zO4uUl7fGnk=;
	h=From:To:Cc:Subject:Date:From;
	b=PjfnS/FtSC+LtHr2tDmh7Z2yxYgG/YC5EKoKV0wYr/LBSNfllwvDINSlmAvj6fjG8
	 w1k5Hb+y59A5DcBjBTinlDGl3KeKrB73NzqtwCD/5arcUEbwHG0RjVKlxvnDRDZ3qh
	 kSt5CoVBgSmc15mXTCHWyGv6DFCgBMGwM5hVdizf1i8KYY3vxUUo3aRn4pGS/kS7At
	 R+KY5szd+ovfvqXnkvoVHrc50Ztkhb+viqf6WfknQ2g5gsOwOYBAwI1j9cKRJwI9zQ
	 rieMHGp4HIgk576paViMN5dbGP2G8rPN8UslUPewhWicJ9ilz7FAczcJVV9wFzulQY
	 aCeenXAQWcrAA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Richter <rric@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: cavium: Drop thunder2
Date: Tue, 16 Dec 2025 12:02:02 -0600
Message-ID: <20251216180202.2794695-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cavium thunder2 DT support
 is incomplete. It consists of 4 cores
(out of 128) and only a serial port. The thunder2 specific drivers in
the kernel don't have DT support either. The few remaining users of
this platform likely use ACPI.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, Please take this directly.

 arch/arm64/boot/dts/cavium/Makefile           |   1 -
 arch/arm64/boot/dts/cavium/thunder2-99xx.dts  |  30 ----
 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi | 144 ------------------
 3 files changed, 175 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/cavium/thunder2-99xx.dts
 delete mode 100644 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi

diff --git a/arch/arm64/boot/dts/cavium/Makefile b/arch/arm64/boot/dts/cavium/Makefile
index c178f7e06e18..8a1854380993 100644
--- a/arch/arm64/boot/dts/cavium/Makefile
+++ b/arch/arm64/boot/dts/cavium/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_THUNDER) += thunder-88xx.dtb
-dtb-$(CONFIG_ARCH_THUNDER2) += thunder2-99xx.dtb
diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dts b/arch/arm64/boot/dts/cavium/thunder2-99xx.dts
deleted file mode 100644
index 89fc4107a0c4..000000000000
--- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dts
+++ /dev/null
@@ -1,30 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * dts file for Cavium ThunderX2 CN99XX Evaluation Platform
- *
- * Copyright (c) 2017 Cavium Inc.
- * Copyright (c) 2013-2016 Broadcom
- */
-
-/dts-v1/;
-
-#include "thunder2-99xx.dtsi"
-
-/ {
-	model = "Cavium ThunderX2 CN99XX";
-	compatible = "cavium,thunderx2-cn9900", "brcm,vulcan-soc";
-
-	memory@80000000 {
-		device_type = "memory";
-		reg = <0x00000000 0x80000000 0x0 0x80000000>,  /* 2G @ 2G  */
-		      <0x00000008 0x80000000 0x0 0x80000000>;  /* 2G @ 34G */
-	};
-
-	aliases {
-		serial0 = &uart0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-};
diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
deleted file mode 100644
index 966fb57280f3..000000000000
--- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
+++ /dev/null
@@ -1,144 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * dtsi file for Cavium ThunderX2 CN99XX processor
- *
- * Copyright (c) 2017 Cavium Inc.
- * Copyright (c) 2013-2016 Broadcom
- * Author: Zi Shen Lim <zlim@broadcom.com>
- */
-
-#include <dt-bindings/interrupt-controller/arm-gic.h>
-
-/ {
-	model = "Cavium ThunderX2 CN99XX";
-	compatible = "cavium,thunderx2-cn9900", "brcm,vulcan-soc";
-	interrupt-parent = <&gic>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	/* just 4 cpus now, 128 needed in full config */
-	cpus {
-		#address-cells = <0x2>;
-		#size-cells = <0x0>;
-
-		cpu@0 {
-			device_type = "cpu";
-			compatible = "cavium,thunder2", "brcm,vulcan";
-			reg = <0x0 0x0>;
-			enable-method = "psci";
-		};
-
-		cpu@1 {
-			device_type = "cpu";
-			compatible = "cavium,thunder2", "brcm,vulcan";
-			reg = <0x0 0x1>;
-			enable-method = "psci";
-		};
-
-		cpu@2 {
-			device_type = "cpu";
-			compatible = "cavium,thunder2", "brcm,vulcan";
-			reg = <0x0 0x2>;
-			enable-method = "psci";
-		};
-
-		cpu@3 {
-			device_type = "cpu";
-			compatible = "cavium,thunder2", "brcm,vulcan";
-			reg = <0x0 0x3>;
-			enable-method = "psci";
-		};
-	};
-
-	psci {
-		compatible = "arm,psci-0.2";
-		method = "smc";
-	};
-
-	gic: interrupt-controller@4000080000 {
-		compatible = "arm,gic-v3";
-		#interrupt-cells = <3>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-		interrupt-controller;
-		#redistributor-regions = <1>;
-		reg = <0x04 0x00080000 0x0 0x20000>,	/* GICD */
-		      <0x04 0x01000000 0x0 0x1000000>;	/* GICR */
-		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
-
-		gicits: msi-controller@4000100000 {
-			compatible = "arm,gic-v3-its";
-			msi-controller;
-			reg = <0x04 0x00100000 0x0 0x20000>;	/* GIC ITS */
-		};
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	pmu {
-		compatible = "brcm,vulcan-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>; /* PMU overflow */
-	};
-
-	clk125mhz: uart_clk125mhz {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <125000000>;
-		clock-output-names = "clk125mhz";
-	};
-
-	pcie@30000000 {
-		compatible = "pci-host-ecam-generic";
-		device_type = "pci";
-		#interrupt-cells = <1>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		/* ECAM at 0x3000_0000 - 0x4000_0000 */
-		reg = <0x0 0x30000000  0x0 0x10000000>;
-
-		/*
-		 * PCI ranges:
-		 *   IO		no supported
-		 *   MEM        0x4000_0000 - 0x6000_0000
-		 *   MEM64 pref 0x40_0000_0000 - 0x60_0000_0000
-		 */
-		ranges =
-		  <0x02000000    0 0x40000000    0 0x40000000    0 0x20000000
-		   0x43000000 0x40 0x00000000 0x40 0x00000000 0x20 0x00000000>;
-		bus-range = <0 0xff>;
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map =
-		      /* addr  pin  ic   icaddr  icintr */
-			<0 0 0  1  &gic   0 0    GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-			 0 0 0  2  &gic   0 0    GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-			 0 0 0  3  &gic   0 0    GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-			 0 0 0  4  &gic   0 0    GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-		msi-parent = <&gicits>;
-		dma-coherent;
-	};
-
-	soc {
-		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		uart0: serial@402020000 {
-			compatible = "arm,pl011", "arm,primecell";
-			reg = <0x04 0x02020000 0x0 0x1000>;
-			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk125mhz>, <&clk125mhz>;
-			clock-names = "uartclk", "apb_pclk";
-		};
-	};
-
-};
-- 
2.51.0

