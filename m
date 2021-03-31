Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5544DC433C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 01:48:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF1A61990
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 01:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEF1A61990
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cisco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nnkLgbMIFpDrvUuyTiExMZQ836C2DdpwfTPwNC72nOk=; b=i6r0UhDLQ4LJbzD4PIjoQOhXz8
	tFguZuhdgNO7By5dbYb341E+Jmrqeg2asGwlcJM/IBSUmsV1ev/bU7OcJIoxjJoCsMP/A9Hv5rflN
	lrB+7obJZBPWYQHyESi9pYXmbk2h4MRii2Oe75XfP4o6cBMcaE/FrOSplm0bC6NZ+O26+KT9ik3Eb
	yUeNi1FFzexXFHaFAsyI1ZdbDjgeT5GPQPIDQ4OncjOSciPnR/cOKyY+vgNdIh4naa4msjNgeGOpD
	QoGe0bMgEnoRl8rOIDjSI1uzUDnyXjQ1IO3mjFhaB8m/z8m2QTrw8kUc/w6SDeiUDe9NezKQpM+gl
	/KKJbHAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRPw6-005HI8-P5; Wed, 31 Mar 2021 01:46:22 +0000
Received: from rcdn-iport-5.cisco.com ([173.37.86.76])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRPvy-005HHU-Eg
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 01:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=19660; q=dns/txt;
 s=iport; t=1617155174; x=1618364774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rbwNJzgcPB2VraFhNGe73M/2sVAEpzf+vKpEq1xAfKM=;
 b=FDRDNIgVQk40L1yBIpCVQr1sAv1p6ngWE8axVjjLfw+QCMYclbWpQcgn
 xnKGzkoR7yDrpTcg5924AEbuH3cLMjRtBdqWQzgeOIhwJJ97nY7aHHYK0
 28KMUOSGAlKNKNQQWjLKkdSSG88JN1Gwjl3C9/kUby3LzAnOxVT6XfPrS g=;
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="609621717"
Received: from alln-core-1.cisco.com ([173.36.13.131])
 by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 31 Mar 2021 01:46:04 +0000
Received: from zorba.cisco.com ([10.24.0.62])
 by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 12V1k3uP015515;
 Wed, 31 Mar 2021 01:46:04 GMT
From: Daniel Walker <danielwa@cisco.com>
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Ofer Licht <olicht@cisco.com>, xe-linux-external@cisco.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: Add support for cisco craw64 ARMv8 SoCs
Date: Tue, 30 Mar 2021 18:46:02 -0700
Message-ID: <20210331014603.2496983-1-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.0.62, [10.24.0.62]
X-Outbound-Node: alln-core-1.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_024615_296352_A376CBD0 
X-CRM114-Status: GOOD (  19.07  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210331014602.nOBBjbNlJxzzmHBeoPbEei0qxLmTcTY8tguQJeSu6sI@z>

From: Ofer Licht <olicht@cisco.com>

Define craw64 config, dts and Makefile for Cisco
SoCs known as Craw.

Cc: xe-linux-external@cisco.com
Signed-off-by: Ofer Licht <olicht@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/Kconfig.platforms                  |   5 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cisco/Makefile            |   5 +
 .../arm64/boot/dts/cisco/craw64-dopplerg2.dts | 239 +++++++++++
 arch/arm64/boot/dts/cisco/craw64.dtsi         | 392 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 7 files changed, 645 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cisco/Makefile
 create mode 100644 arch/arm64/boot/dts/cisco/craw64-dopplerg2.dts
 create mode 100644 arch/arm64/boot/dts/cisco/craw64.dtsi

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f6064d84a424..10ac5fa4c3e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Chuwi Innovation Ltd.
   "^ciaa,.*":
     description: Computadora Industrial Abierta Argentina
+  "^cisco,.*":
+    description: Cisco Systems, Inc
   "^cirrus,.*":
     description: Cirrus Logic, Inc.
   "^cisco,.*":
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index cdfd5fed457f..861f16ceec9d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -91,6 +91,11 @@ config ARCH_BRCMSTB
 	help
 	  This enables support for Broadcom's ARMv8 Set Top Box SoCs
 
+config ARCH_CRAW64
+	bool "Cisco craw64 ARMv8 SoC Family"
+	help
+	  This enables support for Cisco craw64 ARMv8 SoCs
+
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index f1173cd93594..10fbd54f4424 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -10,6 +10,7 @@ subdir-y += arm
 subdir-y += bitmain
 subdir-y += broadcom
 subdir-y += cavium
+subdir-y += cisco
 subdir-y += exynos
 subdir-y += freescale
 subdir-y += hisilicon
diff --git a/arch/arm64/boot/dts/cisco/Makefile b/arch/arm64/boot/dts/cisco/Makefile
new file mode 100644
index 000000000000..8503887f6a7d
--- /dev/null
+++ b/arch/arm64/boot/dts/cisco/Makefile
@@ -0,0 +1,5 @@
+dtb-$(CONFIG_ARCH_CRAW64) += craw64-dopplerg2.dtb
+
+always          := $(dtb-y)
+subdir-y        := $(dts-dirs)
+clean-files     := *.dtb
diff --git a/arch/arm64/boot/dts/cisco/craw64-dopplerg2.dts b/arch/arm64/boot/dts/cisco/craw64-dopplerg2.dts
new file mode 100644
index 000000000000..20ecc57b4e5c
--- /dev/null
+++ b/arch/arm64/boot/dts/cisco/craw64-dopplerg2.dts
@@ -0,0 +1,239 @@
+/dts-v1/;
+
+#include "craw64.dtsi"
+
+/ {
+	model = "Cisco Craw64 on DopplerG 2.0";
+	compatible = "cisco,craw64-dopplerg2", "cisco,craw64";
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+
+	soc: soc {
+		uart0: serial@23f80000 {
+			clock-frequency = <250000000>;
+			status = "ok";
+		};
+
+		uart1: serial@23fc0000 {
+			clock-frequency = <250000000>;
+			status = "ok";
+		};
+
+		spiclk: spiclk {
+			clock-frequency = <250000000>;
+		};
+
+		spi: spi@24000000 {
+			status="ok";
+			flash: flash@0 {
+				compatible = "micron,n25q128a13", "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				spi-max-frequency = <8000000>;
+				reg = <0>;
+				partition@0 {
+					label = "unused0";
+					reg = <0x0 0x10000>;
+					read-only;
+				};
+				partition@1 {
+					label = "brom";
+					reg = <0x10000 0x10000>;
+				};
+				partition@2 {
+					label = "bromg";
+					reg = <0x20000 0x10000>;
+					read-only;
+				};
+				partition@3 {
+					label = "vb";
+					reg = <0x30000 0x10000>;
+				};
+				partition@4 {
+					label = "vbg";
+					reg = <0x40000 0x10000>;
+				};
+				partition@5 {
+					label = "rsvd";
+					reg = <0x50000 0x10000>;
+				};
+				partition@6 {
+					label = "keys";
+					reg = <0x60000 0x10000>;
+				};
+				partition@7 {
+					label = "ddrinit";
+					reg = <0x70000 0x20000>;
+				};
+				partition@8 {
+					label = "bs";
+					reg = <0x90000 0x1E0000>;
+				};
+				partition@9 {
+					label = "ddrinitg";
+					reg = <0x270000 0x20000>;
+					read-only;
+				};
+				partition@10 {
+					label = "bsg";
+					reg = <0x290000 0x1E0000>;
+					read-only;
+				};
+				partition@11 {
+					label = "rsvd1";
+					reg = <0x470000 0xB90000>;
+				};
+			};
+		};
+
+		sdmmc: sdmmc@28100000 {
+			clock-frequency = <50000000>;
+			max-frequency = <25000000>;
+			status = "ok";
+			cap-mmc-highspeed;
+			non-removable;
+			no-sdio;
+			no-sd;
+		};
+
+		ciu: ciu {
+			clock-frequency = <50000000>;
+		};
+
+		biu: biu {
+			clock-frequency = <5000000>;
+		};
+
+		i2c@23f70400 {
+			clock-frequency = <100000>;
+			i2c-sda-hold-time-ns = <108800>;
+			i2c-ss-hcnt = /bits/ 16 <1250>;
+			i2c-ss-lcnt = /bits/ 16 <1250>;
+			cntrl-reg = <&doppler_i2c>;
+			status = "ok";
+
+			rtc: ds1339@68 {
+				compatible = "dallas,ds1339";
+				reg = <0x68>;
+				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		i2c@23f70500 {
+			clock-frequency = <100000>;
+			i2c-sda-hold-time-ns = <108800>;
+			i2c-ss-hcnt = /bits/ 16 <1250>;
+			i2c-ss-lcnt = /bits/ 16 <1250>;
+			cntrl-reg = <&doppler_i2c>;
+			status = "disabled";
+		};
+
+		i2c@23f70600 {
+			clock-frequency = <100000>;
+			i2c-sda-hold-time-ns = <108800>;
+			i2c-ss-hcnt = /bits/ 16 <1250>;
+			i2c-ss-lcnt = /bits/ 16 <1250>;
+			cntrl-reg = <&doppler_i2c>;
+			status = "ok";
+		};
+
+		i2c@23f70700 {
+			clock-frequency = <100000>;
+			i2c-sda-hold-time-ns = <108800>;
+			i2c-ss-hcnt = /bits/ 16 <1250>;
+			i2c-ss-lcnt = /bits/ 16 <1250>;
+			cntrl-reg = <&doppler_i2c>;
+			status = "ok";
+		};
+
+		i2c@23f70800 {
+			clock-frequency = <100000>;
+			i2c-sda-hold-time-ns = <108800>;
+			i2c-ss-hcnt = /bits/ 16 <1250>;
+			i2c-ss-lcnt = /bits/ 16 <1250>;
+			cntrl-reg = <&doppler_i2c>;
+			status = "ok";
+		};
+
+		i2c@23f70900 {
+			clock-frequency = <100000>;
+			i2c-sda-hold-time-ns = <108800>;
+			i2c-ss-hcnt = /bits/ 16 <1250>;
+			i2c-ss-lcnt = /bits/ 16 <1250>;
+			cntrl-reg = <&doppler_i2c>;
+			status = "ok";
+		};
+
+		i2c@23f70A00 {
+			clock-frequency = <100000>;
+			i2c-sda-hold-time-ns = <108800>;
+			i2c-ss-hcnt = /bits/ 16 <1250>;
+			i2c-ss-lcnt = /bits/ 16 <1250>;
+			cntrl-reg = <&doppler_i2c>;
+			status = "ok";
+		};
+
+		i2c@23f70B00 {
+			clock-frequency = <100000>;
+			i2c-sda-hold-time-ns = <108800>;
+			i2c-ss-hcnt = /bits/ 16 <1250>;
+			i2c-ss-lcnt = /bits/ 16 <1250>;
+			cntrl-reg = <&doppler_i2c>;
+			status = "ok";
+		};
+
+		stmmaceth: stmmaceth {
+			clock-frequency = <250000000>;
+		};
+
+		eth0: dwmac@282c0000 {
+			status = "ok";
+			mdio-channel = <0>;
+		};
+
+		wd@28500200 {
+			compatible = "cisco,craw-smgmt-wdt";
+			reg = <0x28500200 0x140>;
+		};
+
+		doppler_i2c: bsp_i2c {
+			compatible = "cisco,dplr-i2c";
+			reg = <0x23f71000 0x10>;
+		};
+	};
+
+	doppler {
+		intrpt {
+			compatible = "cisco,dplr_intrpt";
+			reg = <0x0 0x20000000 0x0 0x0FFFFFFF>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dpu", "oob", "packet", "offload",
+				"tla0", "tla1", "misc";
+		};
+
+		mmap {
+			compatible = "cisco,dplr_dma_mmap";
+			reg =	<0x0 0x20000000 0x0 0x10000000>,
+				<0x0 0x1fe00000 0x0 0x00040000>,
+				<0x0 0x28500000 0x0 0x00040000>,
+				<0x0 0x0e000000 0x0 0x0>,
+				<0x0 0x03f71208 0x0 0x0>;
+			reg-names = "base", "local_sram", "bsp_sram",
+				"sup_id_off", "bsp_exp0_off";
+		};
+
+		gpio {
+			compatible = "cisco,dplr_gpio";
+			reg = <0x0 0x23f700e0 0x0 0x120>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/cisco/craw64.dtsi b/arch/arm64/boot/dts/cisco/craw64.dtsi
new file mode 100644
index 000000000000..9c3c5c8c252e
--- /dev/null
+++ b/arch/arm64/boot/dts/cisco/craw64.dtsi
@@ -0,0 +1,392 @@
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/* the mbox for spin-table; not sure if this is needed given that it's outside our defined memory zone */
+/memreserve/ 0x285001F8 0x00000008;
+
+/ {
+	compatible = "cisco,craw64";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart0;
+		spi0 = &spi; /* spi driver uses this to set bus number 0, which is tacked onto the reported device name
+				so that we get device spi0 instead of spiN where N is some arbitrary large integer. */
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x0>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0x285001F8>;
+			next-level-cache = <&L2_0>;
+			cci-control-port = <&cci_control4>;
+		};
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x1>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0x285001F8>;
+			next-level-cache = <&L2_0>;
+			cci-control-port = <&cci_control4>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x2>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0x285001F8>;
+			next-level-cache = <&L2_0>;
+			cci-control-port = <&cci_control4>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x3>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0x285001F8>;
+			next-level-cache = <&L2_0>;
+			cci-control-port = <&cci_control4>;
+		};
+
+		L2_0: l2-cache0 {
+			compatible = "cache";
+		};
+	};
+
+        cci@28d70000 {
+		compatible = "arm,cci-400";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x0 0x28d70000 0 0x1000>;
+		ranges = <0x0 0x0 0x28d70000 0x6000>; /* size should be 0x10000 if including pmu node */
+
+		cci_control0: slave-if@1000 {  /* Nmp */
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace-lite";
+			reg = <0x1000 0x1000>;
+		};
+
+		cci_control1: slave-if@2000 {  /* Nap */
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace-lite";
+			reg = <0x2000 0x1000>;
+		};
+
+		cci_control2: slave-if@3000 {  /* Nap */
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace-lite";
+			reg = <0x3000 0x1000>;
+		};
+
+		cci_control3: slave-if@4000 {  /* Lil1 */
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace";
+			reg = <0x4000 0x1000>;
+		};
+
+		cci_control4: slave-if@5000 {  /* Lil0 */
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace";
+			reg = <0x5000 0x1000>;
+		};
+        };
+
+/* Macro definitions for reference
+ *
+ * define GIC_SPI 0
+ * define GIC_PPI 1
+ *
+ * define GIC_CPU_MASK_RAW(x) ((x) << 8)
+ *
+ * define IRQ_TYPE_EDGE_RISING    1
+ * define IRQ_TYPE_LEVEL_HIGH     4
+ */
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+
+		reset: reset@20001004 {
+			compatible = "syscon";
+			reg = <0x20001004 0x4>;
+		};
+
+		reboot: reboot@20001004 {
+			compatible = "syscon-reboot";
+			regmap = <&reset>;
+			offset = <0x0>;
+			mask = <0xE0002001>;
+		};
+
+		gic: interrupt-controller@28381000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x28381000 0x1000>,
+			      <0x28382000 0x1000>,
+			      <0x28384000 0x2000>,
+			      <0x28386000 0x2000>;
+		};
+
+		uart0: serial@23f80000 {
+			compatible = "ns16550a";
+			reg = <0x23f80000 0x100>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart1: serial@23fc0000 {
+			compatible = "ns16550a";
+			reg = <0x23fc0000 0x100>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		spiclk: spiclk {
+			compatible = "fixed-clock";
+			#clock-cells = <1>;
+			clock-output-names = "spiclk";
+		};
+
+		spi:    spi@24000000 {
+			compatible      = "snps,dw-spi-nor";
+			reg = <0x24000000 0x1000>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <4>;
+			clocks = <&spiclk 0>;
+			status="disabled";
+		};
+
+		ciu: ciu {
+			compatible = "fixed-clock";
+			#clock-cells = <1>;
+			clock-output-names = "ciu";
+		};
+
+		biu: biu {
+			compatible = "fixed-clock";
+			#clock-cells = <1>;
+			clock-output-names = "biu";
+		};
+
+		i2c@23f70400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,designware-i2c";
+			reg = <0x23f70400 0x100>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&biu 0 &ciu 0>;
+			clock-names = "biu", "ciu";
+			interrupt-names = "dwi2c-0";
+			status="disabled";
+			controller-id = <0>;
+		};
+
+		i2c@23f70500 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,designware-i2c";
+			reg = <0x23f70500 0x100>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&biu 0 &ciu 0>;
+			clock-names = "biu", "ciu";
+			interrupt-names = "dwi2c-1";
+			status="disabled";
+			controller-id = <1>;
+		};
+
+		i2c@23f70600 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,designware-i2c";
+			reg = <0x23f70600 0x100>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&biu 0 &ciu 0>;
+			clock-names = "biu", "ciu";
+			interrupt-names = "dwi2c-2";
+			status="disabled";
+			controller-id = <2>;
+		};
+
+		i2c@23f70700 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,designware-i2c";
+			reg = <0x23f70700 0x100>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&biu 0 &ciu 0>;
+			clock-names = "biu", "ciu";
+			interrupt-names = "dwi2c-3";
+			status="disabled";
+			controller-id = <3>;
+		};
+
+		i2c@23f70800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,designware-i2c";
+			reg = <0x23f70800 0x100>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&biu 0 &ciu 0>;
+			clock-names = "biu", "ciu";
+			interrupt-names = "dwi2c-4";
+			status="disabled";
+			controller-id = <4>;
+		};
+
+		i2c@23f70900 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,designware-i2c";
+			reg = <0x23f70900 0x100>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&biu 0 &ciu 0>;
+			clock-names = "biu", "ciu";
+			interrupt-names = "dwi2c-5";
+			status="disabled";
+			controller-id = <5>;
+		};
+
+		i2c@23f70A00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,designware-i2c";
+			reg = <0x23f70a00 0x100>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&biu 0 &ciu 0>;
+			clock-names = "biu", "ciu";
+			interrupt-names = "dwi2c-6";
+			status="disabled";
+			controller-id = <6>;
+		};
+
+		i2c@23f70B00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,designware-i2c";
+			reg = <0x23f70b00 0x100>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&biu 0 &ciu 0>;
+			clock-names = "biu", "ciu";
+			interrupt-names = "dwi2c-7";
+			status="disabled";
+			controller-id = <7>;
+		};
+
+		sdmmc: sdmmc@28100000 {
+			compatible = "snps,dw-mshc";
+			reg = <0x28100000 0x1000>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			fifo-depth = <4096>;
+			card-detect-delay = <200>; /* XXX: millisecond; do we need this? */
+			bus-width = <8>;
+			status = "disabled";
+		};
+
+		stmmaceth: stmmaceth {
+			compatible = "fixed-clock";
+			#clock-cells = <1>;
+			clock-output-names = "stmmaceth";
+		};
+
+		eth0: dwmac@282c0000 {
+			compatible = "snps,craw-dwmac";
+			reg = <0x282c0000 0x8000>;
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clock-names = "stmmaceth";
+			clocks = <&stmmaceth 0>;
+			phy-mode = "sgmii";
+			status = "disabled";
+		};
+
+		ehci: ehci@281c0000 {
+			compatible = "generic-ehci";
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x281c0000 0x90 0x281c0000 0x24>;
+			clocks = <&biu 0 &ciu 0>;
+			clock-names = "biu", "ciu";
+		};
+
+		ohci: ohci@0x28200000 {
+			compatible = "generic-ohci";
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x28200000 0x90>;
+			clocks = <&biu 0 &ciu 0>;
+			clock-names = "biu", "ciu";
+		};
+
+		mc: memory-controller@20140000 {
+			compatible = "cisco,craw-dmc-400";
+			reg = <0x20140000 0x40000
+				0x20200000 0x1000>;
+			reg-names = "dmc", "config";
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	pcie0: pcie@0 {
+		status = "disabled";
+		compatible = "cisco,craw-pcie", "snps,dw-pcie";
+		interrupts = <GIC_SPI 184 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0x28370004 0x0 0x00000008	/* controller registers */
+			0x0 0x73ffe000 0x0 0x00004000>;  /* configuration space */
+		reg-names = "regs", "config";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		num-lanes = <1>;
+		bus-range = <0x0 0xff>;
+		ranges = <0x43000000 0x20 0x00000000 0x20 0x00000000 0x0 0x80000000>; /* prefetchable memory */
+	};
+
+	pcie1: pcie@1 {
+		status = "disabled";
+		compatible = "cisco,craw-pcie", "snps,dw-pcie";
+		interrupts = <GIC_SPI 185 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0x2837000C 0x0 0x00000008	/* controller registers */
+			0x0 0x7bffe000 0x0 0x00004000>;  /* configuration space */
+		reg-names = "regs", "config";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		num-lanes = <1>;
+		bus-range = <0x0 0xff>;
+		ranges = <0x43000000 0x30 0x00000000 0x30 0x00000000 0x0 0x80000000>; /* prefetchable memory */
+	};
+
+	doppler {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+	};
+};
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d612f633b771..f7cd34931cb4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -36,6 +36,7 @@ CONFIG_ARCH_BCM4908=y
 CONFIG_ARCH_BCM_IPROC=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BRCMSTB=y
+CONFIG_ARCH_CRAW64=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LAYERSCAPE=y
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
