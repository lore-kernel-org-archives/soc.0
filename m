Return-Path: <SRS0=PHoy=VF=ext.kapsi.fi=maukka@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6461C433FE
	for <soc@archiver.kernel.org>; Wed, 27 Apr 2022 16:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E43CC385AD; Wed, 27 Apr 2022 16:23:34 +0000 (UTC)
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [91.232.154.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD1D8C385AC;
	Wed, 27 Apr 2022 16:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD1D8C385AC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ext.kapsi.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ext.kapsi.fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=96VA1LCFGe/JvuVSSqeh3RFojoN1Pi+gViOc3zJWqLg=; b=ENNNQASmzDY3LU/lzbMtj3gl9H
	gJfXLSu5mXP4DGNXY1oQvgavzpyDkmk2KuG80lQoxklHHy9iwRGDpXizCkaVO0kj6lxpCLk1PPWpX
	H8/eROyTGx6RZhDIFbXYHkW2jvmHRqk6haHmGoES8bCbIWy8Yr/O9B+/k+dFM7c5kaRAIh/lH8j5z
	TMpd60OeutyqJmJhmW1q0D4uaSrsc4M5CWe7v4xdsBzI1hAi+AfxM+izKAWBkQwvV0GBK5p4otYYX
	ZdXMPbH7kEUh1Y2qLfgRVzlvhhsKmfHlkTLwGwyjdTmvzDCV9mrec9wUgdwpHwvq7kDoLUHDupGzS
	OlIbK/bw==;
Received: from 82-71-190-90.dyn.estpak.ee ([90.190.71.82]:62338 helo=localhost)
	by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1njkRa-00047M-Hc; Wed, 27 Apr 2022 19:23:13 +0300
Received: by localhost (sSMTP sendmail emulation); Wed, 27 Apr 2022 19:23:10 +0300
From: Mauri Sandberg <maukka@ext.kapsi.fi>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andrew@lunn.ch,
	sebastian.hesselbarth@gmail.com,
	Mauri Sandberg <maukka@ext.kapsi.fi>
Date: Wed, 27 Apr 2022 19:21:23 +0300
Message-Id: <20220427162123.110458-2-maukka@ext.kapsi.fi>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427162123.110458-1-maukka@ext.kapsi.fi>
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.190.71.82
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: [RFC RFT PATCH v1 1/1] ARM: orion5x: convert D-Link DNS-323 to the Device Tree
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)

Convert D-Link DNS-323 to use the device tree and remove associated
mach file.

Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
---
 arch/arm/boot/dts/Makefile                   |   3 +
 arch/arm/boot/dts/orion5x-dlink-dns323.dtsi  | 217 ++++++
 arch/arm/boot/dts/orion5x-dlink-dns323a1.dts |  59 ++
 arch/arm/boot/dts/orion5x-dlink-dns323b1.dts |  38 +
 arch/arm/boot/dts/orion5x-dlink-dns323c1.dts |  80 ++
 arch/arm/mach-orion5x/Kconfig                |   6 +-
 arch/arm/mach-orion5x/Makefile               |   2 +-
 arch/arm/mach-orion5x/board-dns323.c         | 118 +++
 arch/arm/mach-orion5x/board-dt.c             |   3 +
 arch/arm/mach-orion5x/common.h               |   6 +
 arch/arm/mach-orion5x/dns323-setup.c         | 724 -------------------
 11 files changed, 528 insertions(+), 728 deletions(-)
 create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323.dtsi
 create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323a1.dts
 create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323b1.dts
 create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323c1.dts
 create mode 100644 arch/arm/mach-orion5x/board-dns323.c
 delete mode 100644 arch/arm/mach-orion5x/dns323-setup.c

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7c16f8a2b738..c7c5c0b6c843 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -949,6 +949,9 @@ dtb-$(CONFIG_SOC_DRA7XX) += \
 	dra71-evm.dtb \
 	dra76-evm.dtb
 dtb-$(CONFIG_ARCH_ORION5X) += \
+	orion5x-dlink-dns323a1.dtb \
+	orion5x-dlink-dns323b1.dtb \
+	orion5x-dlink-dns323c1.dtb \
 	orion5x-kuroboxpro.dtb \
 	orion5x-lacie-d2-network.dtb \
 	orion5x-lacie-ethernet-disk-mini-v2.dtb \
diff --git a/arch/arm/boot/dts/orion5x-dlink-dns323.dtsi b/arch/arm/boot/dts/orion5x-dlink-dns323.dtsi
new file mode 100644
index 000000000000..2b033d37cbf8
--- /dev/null
+++ b/arch/arm/boot/dts/orion5x-dlink-dns323.dtsi
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Mauri Sandberg <maukka@ext.kapsi.fi>
+ *
+ */
+
+/ {
+	model = "D-Link DNS-323";
+	compatible = "dlink,dns323", "marvell,orion5x";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x4000000>; /* 64 MB */
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		bootargs = "console=ttyS0,115200n8 earlyprintk";
+	};
+
+	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000>,
+			 <MBUS_ID(0x09, 0x00) 0 0xf2200000 0x800>,
+			 <MBUS_ID(0x01, 0x0f) 0 0xf4000000 0x800000>;
+
+		/delete-node/ devbus-cs0;
+		/delete-node/ devbus-cs1;
+		/delete-node/ devbus-cs2;
+
+		internal-regs {
+			/delete-node/ dma-controller@60900;  /* xor */
+			/delete-node/ ehci@a0000;            /* ehci1 */
+			/delete-node/ serial@12100;          /* uart1 */
+			/delete-node/ spi@10600;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&pmx_gpio_keys>;
+		pinctrl-names = "default";
+
+		key-0 {
+			label = "Power button";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio0 9 GPIO_ACTIVE_LOW>;
+		};
+
+		key-1 {
+			label = "Reset button";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&pmx_gpio_leds>;
+		pinctrl-names = "default";
+
+		led-0 {
+			label = "amber:right";
+			gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
+		};
+
+		led-1 {
+			label = "amber:left";
+			gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
+		};
+
+		led-2 {
+			label = "blue:power";
+			gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+	};
+
+	gpio-poweroff {
+		compatible = "gpio-poweroff";
+		pinctrl-0 = <&pmx_power_off>;
+		pinctrl-names = "default";
+
+		gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
+		timeout-ms = <3000>;
+	};
+};
+
+&devbus_bootcs {
+	status = "okay";
+	devbus,keep-config;
+
+	flash@0 {
+		compatible = "cfi-flash";
+		reg = <0 0x800000>;
+		bank-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "MTD1";
+				reg = <0x000000 0x010000>;
+				read-only;
+			};
+
+			partition@10000 {
+				label = "MTD2";
+				reg = <0x010000 0x010000>;
+				read-only;
+			};
+
+			partition@20000 {
+				label = "Linux Kernel";
+				reg = <0x020000 0x180000>;
+			};
+
+			partition@1a0000 {
+				label = "File System";
+				reg = <0x1a0000 0x630000>;
+			};
+
+			uboot: partition@7d0000 {
+				label = "U-boot";
+				reg = <0x7d0000 0x030000>;
+				read-only;
+			};
+		};
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&i2c {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	/* fan speed PWM */
+	fan@3e {
+		compatible = "g760a";
+		reg = <0x3e>;
+	};
+
+	/* temp sensor and thermal watchdog */
+	temperature-sensor@48 {
+		compatible = "gmt,g751";
+		reg = <0x48>;
+	};
+
+	/* RTC w/ alarm */
+	rtc@68 {
+		compatible = "st,m41t80";
+		reg = <0x68>;
+	};
+};
+
+&mdio {
+	status = "okay";
+
+	ethphy: ethernet-phy {
+		reg = <8>;
+	};
+};
+
+&eth {
+	status = "okay";
+	pinctrl-0 = <&pmx_ge>;
+	pinctrl-names = "default";
+};
+
+&ethport {
+	phy-handle = <&ethphy>;
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&pinctrl {
+	pmx_gpio_leds: pmx-gpio-leds {
+		marvell,pins = "mpp1", "mpp2", "mpp5";
+		marvell,function = "gpio";
+	};
+
+	pmx_gpio_misc: pmx-gpio-misc {
+		/* set marvell,pins in board file */
+		marvell,function = "gpio";
+	};
+
+	pmx_power_off: pmx-power-off {
+		marvell,pins = "mpp8";
+		marvell,function = "gpio";
+	};
+
+	pmx_gpio_keys: pmx-gpio-keys {
+		marvell,pins = "mpp9", "mpp10";
+		marvell,function = "gpio";
+	};
+
+	pmx_ge: pmx-ge {
+		marvell,function = "ge";
+	};
+};
+
+&sata {
+	pinctrl-0 = <&pmx_sata0 &pmx_sata1>;
+	pinctrl-names = "default";
+	status = "okay";
+	nr-ports = <2>;
+};
diff --git a/arch/arm/boot/dts/orion5x-dlink-dns323a1.dts b/arch/arm/boot/dts/orion5x-dlink-dns323a1.dts
new file mode 100644
index 000000000000..73e7006ab5a7
--- /dev/null
+++ b/arch/arm/boot/dts/orion5x-dlink-dns323a1.dts
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Mauri Sandberg <maukka@ext.kapsi.fi>
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "orion5x-mv88f5181.dtsi"
+#include "orion5x-dlink-dns323.dtsi"
+
+/ {
+	compatible = "dlink,dns323a1", "dlink,dns323", "marvell,orion5x-88f5181",
+		     "marvell,orion5x";
+
+	/delete-node/ sa-sram;	/* crypto_sram */
+
+	soc {
+		internal-regs {
+			/delete-node/ crypto@90000;
+			/delete-node/ sata@80000;
+		};
+	};
+};
+
+&gpio0 {
+	pinctrl-0 = <&pmx_gpio_misc>;
+	pinctrl-names = "default";
+
+	/* The DNS323 rev A1 power LED requires GPIO 4 to be low. */
+	pin_gpio0_4 {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_LOW>;
+		output-high;
+		line-name = "Power led enable";
+	};
+};
+
+&pinctrl {
+	pinctrl-0 = <&pmx_pci_pins>;
+	pinctrl-names = "default";
+
+	pmx_pci_pins: pmx-pci-pins {
+		marvell,pins = "mpp0";
+		marvell,function = "pcie";
+	};
+};
+
+&pmx_gpio_misc {
+	marvell,pins = "mpp4";
+};
+
+&pmx_ge {
+	marvell,pins = "mpp11", "mpp12", "mpp13", "mpp14", "mpp15",
+		       "mpp16", "mpp17", "mpp18", "mpp19";
+};
diff --git a/arch/arm/boot/dts/orion5x-dlink-dns323b1.dts b/arch/arm/boot/dts/orion5x-dlink-dns323b1.dts
new file mode 100644
index 000000000000..31251f64c573
--- /dev/null
+++ b/arch/arm/boot/dts/orion5x-dlink-dns323b1.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Mauri Sandberg <maukka@ext.kapsi.fi>
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "orion5x-mv88f5182.dtsi"
+#include "orion5x-dlink-dns323.dtsi"
+
+/ {
+	compatible = "dlink,dns323b1", "dlink,dns323", "marvell,orion5x-88f5182",
+		     "marvell,orion5x";
+};
+
+&gpio0 {
+	pinctrl-0 = <&pmx_gpio_misc>;
+	pinctrl-names = "default";
+
+	/* The rev B1 has a flag to indicate the system is up.
+	 * Without this flag set, power LED will flash and cannot be
+	 * controlled via gpio-leds.
+	 */
+	pin_gpio0_3 {
+		gpio-hog;
+		gpios = <3 GPIO_ACTIVE_LOW>;
+		output-high;
+		line-name = "System up";
+	};
+};
+
+&pmx_gpio_misc {
+	marvell,pins = "mpp3";
+};
diff --git a/arch/arm/boot/dts/orion5x-dlink-dns323c1.dts b/arch/arm/boot/dts/orion5x-dlink-dns323c1.dts
new file mode 100644
index 000000000000..c36af513ecd7
--- /dev/null
+++ b/arch/arm/boot/dts/orion5x-dlink-dns323c1.dts
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Mauri Sandberg <maukka@ext.kapsi.fi>
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "orion5x-mv88f5182.dtsi"
+#include "orion5x-dlink-dns323.dtsi"
+
+/ {
+	compatible = "dlink,dns323c1", "dlink,dns323", "marvell,orion5x-88f5182",
+		     "marvell,orion5x";
+
+	fan {
+		compatible = "gpio-fan";
+		pinctrl-0 = <&pmx_gpio_fan>;
+		pinctrl-names = "default";
+
+		gpios = <&gpio0 19 GPIO_ACTIVE_LOW
+			 &gpio0 18 GPIO_ACTIVE_LOW>;
+
+		gpio-fan,speed-map = <0    0
+				      1000 1
+				      2000 2>;
+		alarm-gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
+	};
+
+	gpio-keys {
+		/delete-node/ key-1;
+
+		key-0 {
+			gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio-leds {
+		led-0 {
+			gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
+		};
+
+		led-1 {
+			gpios = <&gpio0 9 GPIO_ACTIVE_LOW>;
+		};
+
+		led-2 {
+			gpios = <&gpio0 17 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+};
+
+&i2c {
+	/delete-node/ fan@3e;
+};
+
+&pinctrl {
+	/delete-node/ pmx-gpio-misc;
+
+	pmx_gpio_fan: pmx-gpio-fan {
+		marvell,pins = "mpp10", "mpp18", "mpp19";
+		marvell,function = "gpio";
+	};
+};
+
+&pmx_gpio_leds {
+	marvell,pins = "mpp8", "mpp9", "mpp17";
+};
+
+&pmx_power_off {
+	marvell,pins = "mpp2";
+};
+
+&pmx_gpio_keys {
+	marvell,pins = "mpp1";
+};
diff --git a/arch/arm/mach-orion5x/Kconfig b/arch/arm/mach-orion5x/Kconfig
index c77f3b4e287b..65cd5307a460 100644
--- a/arch/arm/mach-orion5x/Kconfig
+++ b/arch/arm/mach-orion5x/Kconfig
@@ -55,9 +55,9 @@ config MACH_KUROBOX_PRO
 	  Say 'Y' here if you want your kernel to support the
 	  KuroBox Pro platform.
 
-config MACH_DNS323
-	bool "D-Link DNS-323"
-	select I2C_BOARDINFO if I2C
+config MACH_DNS323_DT
+	bool "D-Link DNS-323 (Flattened Device Tree)"
+	select ARCH_ORION5X_DT
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  D-Link DNS-323 platform.
diff --git a/arch/arm/mach-orion5x/Makefile b/arch/arm/mach-orion5x/Makefile
index 1a585a62d5e6..b8c0671fbd1c 100644
--- a/arch/arm/mach-orion5x/Makefile
+++ b/arch/arm/mach-orion5x/Makefile
@@ -8,7 +8,6 @@ obj-$(CONFIG_MACH_KUROBOX_PRO)	+= kurobox_pro-setup.o
 obj-$(CONFIG_MACH_TERASTATION_PRO2)	+= terastation_pro2-setup.o
 obj-$(CONFIG_MACH_LINKSTATION_PRO) += kurobox_pro-setup.o
 obj-$(CONFIG_MACH_LINKSTATION_LS_HGL) += ls_hgl-setup.o
-obj-$(CONFIG_MACH_DNS323)	+= dns323-setup.o
 obj-$(CONFIG_MACH_TS209)	+= ts209-setup.o tsx09-common.o
 obj-$(CONFIG_MACH_TS409)	+= ts409-setup.o tsx09-common.o
 obj-$(CONFIG_MACH_WRT350N_V2)	+= wrt350n-v2-setup.o
@@ -22,5 +21,6 @@ obj-$(CONFIG_MACH_RD88F6183AP_GE)	+= rd88f6183ap-ge-setup.o
 
 obj-$(CONFIG_ARCH_ORION5X_DT)		+= board-dt.o
 obj-$(CONFIG_MACH_D2NET_DT)	+= board-d2net.o
+obj-$(CONFIG_MACH_DNS323_DT)	+= board-dns323.o
 obj-$(CONFIG_MACH_MSS2_DT)	+= board-mss2.o
 obj-$(CONFIG_MACH_RD88F5182_DT)	+= board-rd88f5182.o
diff --git a/arch/arm/mach-orion5x/board-dns323.c b/arch/arm/mach-orion5x/board-dns323.c
new file mode 100644
index 000000000000..705ddb7b691a
--- /dev/null
+++ b/arch/arm/mach-orion5x/board-dns323.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Mauri Sandberg <maukka@ext.kapsi.fi>
+ *
+ * Flattened Device Tree board initialization
+ *
+ * This is adapted from existing mach file and most of the source code is
+ * originally written by:
+ *  Copyright (C) 2007 Herbert Valerio Riedel <hvr@gnu.org>
+ *  Copyright (C) 2010 Benjamin Herrenschmidt <benh@kernel.crashing.org>
+ */
+
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/marvell_phy.h>
+#include <asm/mach/pci.h>
+#include "bridge-regs.h"
+#include "common.h"
+
+/* Rev A1 and B1 */
+#define DNS323_GPIO_LED_RIGHT_AMBER	1
+#define DNS323_GPIO_LED_LEFT_AMBER	2
+#define DNS323_GPIO_SYSTEM_UP		3
+#define DNS323_GPIO_LED_POWER1		4
+#define DNS323_GPIO_LED_POWER2		5
+#define DNS323_GPIO_OVERTEMP		6
+#define DNS323_GPIO_RTC			7
+#define DNS323_GPIO_POWER_OFF		8
+#define DNS323_GPIO_KEY_POWER		9
+#define DNS323_GPIO_KEY_RESET		10
+
+/* Rev C1 */
+#define DNS323C_GPIO_KEY_POWER		1
+#define DNS323C_GPIO_POWER_OFF		2
+#define DNS323C_GPIO_LED_RIGHT_AMBER	8
+#define DNS323C_GPIO_LED_LEFT_AMBER	9
+#define DNS323C_GPIO_LED_POWER		17
+#define DNS323C_GPIO_FAN_BIT1		18
+#define DNS323C_GPIO_FAN_BIT0		19
+
+/* Exposed to userspace, do not change */
+enum {
+	DNS323_REV_A1,	/* 0 */
+	DNS323_REV_B1,	/* 1 */
+	DNS323_REV_C1,	/* 2 */
+};
+
+/****************************************************************************
+ * PCI setup
+ */
+
+static int __init dns323_pci_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
+{
+	int irq;
+
+	/*
+	 * Check for devices with hard-wired IRQs.
+	 */
+	irq = orion5x_pci_map_irq(dev, slot, pin);
+	if (irq != -1)
+		return irq;
+
+	return -1;
+}
+
+static struct hw_pci dns323_pci __initdata = {
+	.nr_controllers = 2,
+	.setup		= orion5x_pci_sys_setup,
+	.scan		= orion5x_pci_sys_scan_bus,
+	.map_irq	= dns323_pci_map_irq,
+};
+
+static int __init dns323_pci_init(void)
+{
+	/* Rev B1 and C1 doesn't really use its PCI bus, and
+	 * initialising PCI gets in the way of initialising the SATA
+	 * controller.
+	 */
+	if (of_machine_is_compatible("dlink,dns323a1"))
+		pci_common_init(&dns323_pci);
+
+	return 0;
+}
+subsys_initcall(dns323_pci_init);
+
+/****************************************************************************
+ * Fix-ups
+ */
+
+static int dns323c_phy_fixup(struct phy_device *phy)
+{
+	phy->dev_flags |= MARVELL_PHY_M1118_DNS323_LEDS;
+
+	return 0;
+}
+
+void __init dns323_init(void)
+{
+	if (of_machine_is_compatible("dlink,dns323a1")) {
+		writel(0, MPP_DEV_CTRL);		/* DEV_D[31:16] */
+	} else if (of_machine_is_compatible("dlink,dns323c1") &&
+		IS_BUILTIN(CONFIG_PHYLIB)) {
+		/* Register fixup for the PHY LEDs */
+		phy_register_fixup_for_uid(MARVELL_PHY_ID_88E1118,
+					   MARVELL_PHY_ID_MASK,
+					   dns323c_phy_fixup);
+
+		/* Now, -this- should theorically be done by the sata_mv driver
+		 * once I figure out what's going on there. Maybe the behaviour
+		 * of the LEDs should be somewhat passed via the platform_data.
+		 * for now, just whack the register and make the LEDs happy
+		 *
+		 * Note: AFAIK, rev B1 needs the same treatement but I'll let
+		 * somebody else test it.
+		 */
+		writel(0x5, ORION5X_SATA_VIRT_BASE + 0x2c);
+	}
+}
diff --git a/arch/arm/mach-orion5x/board-dt.c b/arch/arm/mach-orion5x/board-dt.c
index 3d36f1d95196..279194483fcf 100644
--- a/arch/arm/mach-orion5x/board-dt.c
+++ b/arch/arm/mach-orion5x/board-dt.c
@@ -60,6 +60,9 @@ static void __init orion5x_dt_init(void)
 		cpu_idle_poll_ctrl(true);
 	}
 
+	if (of_machine_is_compatible("dlink,dns323"))
+		dns323_init();
+
 	if (of_machine_is_compatible("maxtor,shared-storage-2"))
 		mss2_init();
 
diff --git a/arch/arm/mach-orion5x/common.h b/arch/arm/mach-orion5x/common.h
index eb96009e21c4..ac92b67bf9ec 100644
--- a/arch/arm/mach-orion5x/common.h
+++ b/arch/arm/mach-orion5x/common.h
@@ -75,6 +75,12 @@ extern void mss2_init(void);
 static inline void mss2_init(void) {}
 #endif
 
+#ifdef CONFIG_MACH_DNS323_DT
+extern void dns323_init(void);
+#else
+static inline void dns323_init(void) {}
+#endif
+
 /*****************************************************************************
  * Helpers to access Orion registers
  ****************************************************************************/
diff --git a/arch/arm/mach-orion5x/dns323-setup.c b/arch/arm/mach-orion5x/dns323-setup.c
deleted file mode 100644
index 87cb47220e82..000000000000
--- a/arch/arm/mach-orion5x/dns323-setup.c
+++ /dev/null
@@ -1,724 +0,0 @@
-/*
- * arch/arm/mach-orion5x/dns323-setup.c
- *
- * Copyright (C) 2007 Herbert Valerio Riedel <hvr@gnu.org>
- *
- * Support for HW Rev C1:
- *
- * Copyright (C) 2010 Benjamin Herrenschmidt <benh@kernel.crashing.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as
- * published by the Free Software Foundation; either version 2 of the
- * License, or (at your option) any later version.
- *
- */
-#include <linux/gpio.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/platform_device.h>
-#include <linux/pci.h>
-#include <linux/irq.h>
-#include <linux/mtd/physmap.h>
-#include <linux/mv643xx_eth.h>
-#include <linux/leds.h>
-#include <linux/gpio_keys.h>
-#include <linux/input.h>
-#include <linux/i2c.h>
-#include <linux/ata_platform.h>
-#include <linux/phy.h>
-#include <linux/marvell_phy.h>
-#include <asm/mach-types.h>
-#include <asm/mach/arch.h>
-#include <asm/mach/pci.h>
-#include <asm/system_info.h>
-#include <plat/orion-gpio.h>
-#include "orion5x.h"
-#include "common.h"
-#include "mpp.h"
-
-/* Rev A1 and B1 */
-#define DNS323_GPIO_LED_RIGHT_AMBER	1
-#define DNS323_GPIO_LED_LEFT_AMBER	2
-#define DNS323_GPIO_SYSTEM_UP		3
-#define DNS323_GPIO_LED_POWER1		4
-#define DNS323_GPIO_LED_POWER2		5
-#define DNS323_GPIO_OVERTEMP		6
-#define DNS323_GPIO_RTC			7
-#define DNS323_GPIO_POWER_OFF		8
-#define DNS323_GPIO_KEY_POWER		9
-#define DNS323_GPIO_KEY_RESET		10
-
-/* Rev C1 */
-#define DNS323C_GPIO_KEY_POWER		1
-#define DNS323C_GPIO_POWER_OFF		2
-#define DNS323C_GPIO_LED_RIGHT_AMBER	8
-#define DNS323C_GPIO_LED_LEFT_AMBER	9
-#define DNS323C_GPIO_LED_POWER		17
-#define DNS323C_GPIO_FAN_BIT1		18
-#define DNS323C_GPIO_FAN_BIT0		19
-
-/* Exposed to userspace, do not change */
-enum {
-	DNS323_REV_A1,	/* 0 */
-	DNS323_REV_B1,	/* 1 */
-	DNS323_REV_C1,	/* 2 */
-};
-
-
-/****************************************************************************
- * PCI setup
- */
-
-static int __init dns323_pci_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	int irq;
-
-	/*
-	 * Check for devices with hard-wired IRQs.
-	 */
-	irq = orion5x_pci_map_irq(dev, slot, pin);
-	if (irq != -1)
-		return irq;
-
-	return -1;
-}
-
-static struct hw_pci dns323_pci __initdata = {
-	.nr_controllers = 2,
-	.setup		= orion5x_pci_sys_setup,
-	.scan		= orion5x_pci_sys_scan_bus,
-	.map_irq	= dns323_pci_map_irq,
-};
-
-static int __init dns323_pci_init(void)
-{
-	/* Rev B1 and C1 doesn't really use its PCI bus, and initialising PCI
-	 * gets in the way of initialising the SATA controller.
-	 */
-	if (machine_is_dns323() && system_rev == DNS323_REV_A1)
-		pci_common_init(&dns323_pci);
-
-	return 0;
-}
-
-subsys_initcall(dns323_pci_init);
-
-/****************************************************************************
- * 8MiB NOR flash (Spansion S29GL064M90TFIR4)
- *
- * Layout as used by D-Link:
- *  0x00000000-0x00010000 : "MTD1"
- *  0x00010000-0x00020000 : "MTD2"
- *  0x00020000-0x001a0000 : "Linux Kernel"
- *  0x001a0000-0x007d0000 : "File System"
- *  0x007d0000-0x00800000 : "u-boot"
- */
-
-#define DNS323_NOR_BOOT_BASE 0xf4000000
-#define DNS323_NOR_BOOT_SIZE SZ_8M
-
-static struct mtd_partition dns323_partitions[] = {
-	{
-		.name	= "MTD1",
-		.size	= 0x00010000,
-		.offset	= 0,
-	}, {
-		.name	= "MTD2",
-		.size	= 0x00010000,
-		.offset = 0x00010000,
-	}, {
-		.name	= "Linux Kernel",
-		.size	= 0x00180000,
-		.offset	= 0x00020000,
-	}, {
-		.name	= "File System",
-		.size	= 0x00630000,
-		.offset	= 0x001A0000,
-	}, {
-		.name	= "u-boot",
-		.size	= 0x00030000,
-		.offset	= 0x007d0000,
-	},
-};
-
-static struct physmap_flash_data dns323_nor_flash_data = {
-	.width		= 1,
-	.parts		= dns323_partitions,
-	.nr_parts	= ARRAY_SIZE(dns323_partitions)
-};
-
-static struct resource dns323_nor_flash_resource = {
-	.flags		= IORESOURCE_MEM,
-	.start		= DNS323_NOR_BOOT_BASE,
-	.end		= DNS323_NOR_BOOT_BASE + DNS323_NOR_BOOT_SIZE - 1,
-};
-
-static struct platform_device dns323_nor_flash = {
-	.name		= "physmap-flash",
-	.id		= 0,
-	.dev		= {
-		.platform_data	= &dns323_nor_flash_data,
-	},
-	.resource	= &dns323_nor_flash_resource,
-	.num_resources	= 1,
-};
-
-/****************************************************************************
- * Ethernet
- */
-
-static struct mv643xx_eth_platform_data dns323_eth_data = {
-	.phy_addr = MV643XX_ETH_PHY_ADDR(8),
-};
-
-/* dns323_parse_hex_*() taken from tsx09-common.c; should a common copy of these
- * functions be kept somewhere?
- */
-static int __init dns323_parse_hex_nibble(char n)
-{
-	if (n >= '0' && n <= '9')
-		return n - '0';
-
-	if (n >= 'A' && n <= 'F')
-		return n - 'A' + 10;
-
-	if (n >= 'a' && n <= 'f')
-		return n - 'a' + 10;
-
-	return -1;
-}
-
-static int __init dns323_parse_hex_byte(const char *b)
-{
-	int hi;
-	int lo;
-
-	hi = dns323_parse_hex_nibble(b[0]);
-	lo = dns323_parse_hex_nibble(b[1]);
-
-	if (hi < 0 || lo < 0)
-		return -1;
-
-	return (hi << 4) | lo;
-}
-
-static int __init dns323_read_mac_addr(void)
-{
-	u_int8_t addr[6];
-	int i;
-	char *mac_page;
-
-	/* MAC address is stored as a regular ol' string in /dev/mtdblock4
-	 * (0x007d0000-0x00800000) starting at offset 196480 (0x2ff80).
-	 */
-	mac_page = ioremap(DNS323_NOR_BOOT_BASE + 0x7d0000 + 196480, 1024);
-	if (!mac_page)
-		return -ENOMEM;
-
-	/* Sanity check the string we're looking at */
-	for (i = 0; i < 5; i++) {
-		if (*(mac_page + (i * 3) + 2) != ':') {
-			goto error_fail;
-		}
-	}
-
-	for (i = 0; i < 6; i++)	{
-		int byte;
-
-		byte = dns323_parse_hex_byte(mac_page + (i * 3));
-		if (byte < 0) {
-			goto error_fail;
-		}
-
-		addr[i] = byte;
-	}
-
-	iounmap(mac_page);
-	printk("DNS-323: Found ethernet MAC address: %pM\n", addr);
-
-	memcpy(dns323_eth_data.mac_addr, addr, 6);
-
-	return 0;
-
-error_fail:
-	iounmap(mac_page);
-	return -EINVAL;
-}
-
-/****************************************************************************
- * GPIO LEDs (simple - doesn't use hardware blinking support)
- */
-
-static struct gpio_led dns323ab_leds[] = {
-	{
-		.name = "power:blue",
-		.gpio = DNS323_GPIO_LED_POWER2,
-		.default_trigger = "default-on",
-	}, {
-		.name = "right:amber",
-		.gpio = DNS323_GPIO_LED_RIGHT_AMBER,
-		.active_low = 1,
-	}, {
-		.name = "left:amber",
-		.gpio = DNS323_GPIO_LED_LEFT_AMBER,
-		.active_low = 1,
-	},
-};
-
-
-static struct gpio_led dns323c_leds[] = {
-	{
-		.name = "power:blue",
-		.gpio = DNS323C_GPIO_LED_POWER,
-		.default_trigger = "timer",
-		.active_low = 1,
-	}, {
-		.name = "right:amber",
-		.gpio = DNS323C_GPIO_LED_RIGHT_AMBER,
-		.active_low = 1,
-	}, {
-		.name = "left:amber",
-		.gpio = DNS323C_GPIO_LED_LEFT_AMBER,
-		.active_low = 1,
-	},
-};
-
-
-static struct gpio_led_platform_data dns323ab_led_data = {
-	.num_leds	= ARRAY_SIZE(dns323ab_leds),
-	.leds		= dns323ab_leds,
-	.gpio_blink_set = orion_gpio_led_blink_set,
-};
-
-static struct gpio_led_platform_data dns323c_led_data = {
-	.num_leds	= ARRAY_SIZE(dns323c_leds),
-	.leds		= dns323c_leds,
-	.gpio_blink_set = orion_gpio_led_blink_set,
-};
-
-static struct platform_device dns323_gpio_leds = {
-	.name		= "leds-gpio",
-	.id		= -1,
-	.dev		= {
-		.platform_data	= &dns323ab_led_data,
-	},
-};
-
-/****************************************************************************
- * GPIO Attached Keys
- */
-
-static struct gpio_keys_button dns323ab_buttons[] = {
-	{
-		.code		= KEY_RESTART,
-		.gpio		= DNS323_GPIO_KEY_RESET,
-		.desc		= "Reset Button",
-		.active_low	= 1,
-	}, {
-		.code		= KEY_POWER,
-		.gpio		= DNS323_GPIO_KEY_POWER,
-		.desc		= "Power Button",
-		.active_low	= 1,
-	},
-};
-
-static struct gpio_keys_platform_data dns323ab_button_data = {
-	.buttons	= dns323ab_buttons,
-	.nbuttons	= ARRAY_SIZE(dns323ab_buttons),
-};
-
-static struct gpio_keys_button dns323c_buttons[] = {
-	{
-		.code		= KEY_POWER,
-		.gpio		= DNS323C_GPIO_KEY_POWER,
-		.desc		= "Power Button",
-		.active_low	= 1,
-	},
-};
-
-static struct gpio_keys_platform_data dns323c_button_data = {
-	.buttons	= dns323c_buttons,
-	.nbuttons	= ARRAY_SIZE(dns323c_buttons),
-};
-
-static struct platform_device dns323_button_device = {
-	.name		= "gpio-keys",
-	.id		= -1,
-	.num_resources	= 0,
-	.dev		= {
-		.platform_data	= &dns323ab_button_data,
-	},
-};
-
-/*****************************************************************************
- * SATA
- */
-static struct mv_sata_platform_data dns323_sata_data = {
-       .n_ports        = 2,
-};
-
-/****************************************************************************
- * General Setup
- */
-static unsigned int dns323a_mpp_modes[] __initdata = {
-	MPP0_PCIE_RST_OUTn,
-	MPP1_GPIO,		/* right amber LED (sata ch0) */
-	MPP2_GPIO,		/* left amber LED (sata ch1) */
-	MPP3_UNUSED,
-	MPP4_GPIO,		/* power button LED */
-	MPP5_GPIO,		/* power button LED */
-	MPP6_GPIO,		/* GMT G751-2f overtemp */
-	MPP7_GPIO,		/* M41T80 nIRQ/OUT/SQW */
-	MPP8_GPIO,		/* triggers power off */
-	MPP9_GPIO,		/* power button switch */
-	MPP10_GPIO,		/* reset button switch */
-	MPP11_UNUSED,
-	MPP12_UNUSED,
-	MPP13_UNUSED,
-	MPP14_UNUSED,
-	MPP15_UNUSED,
-	MPP16_UNUSED,
-	MPP17_UNUSED,
-	MPP18_UNUSED,
-	MPP19_UNUSED,
-	0,
-};
-
-static unsigned int dns323b_mpp_modes[] __initdata = {
-	MPP0_UNUSED,
-	MPP1_GPIO,		/* right amber LED (sata ch0) */
-	MPP2_GPIO,		/* left amber LED (sata ch1) */
-	MPP3_GPIO,		/* system up flag */
-	MPP4_GPIO,		/* power button LED */
-	MPP5_GPIO,		/* power button LED */
-	MPP6_GPIO,		/* GMT G751-2f overtemp */
-	MPP7_GPIO,		/* M41T80 nIRQ/OUT/SQW */
-	MPP8_GPIO,		/* triggers power off */
-	MPP9_GPIO,		/* power button switch */
-	MPP10_GPIO,		/* reset button switch */
-	MPP11_UNUSED,
-	MPP12_SATA_LED,
-	MPP13_SATA_LED,
-	MPP14_SATA_LED,
-	MPP15_SATA_LED,
-	MPP16_UNUSED,
-	MPP17_UNUSED,
-	MPP18_UNUSED,
-	MPP19_UNUSED,
-	0,
-};
-
-static unsigned int dns323c_mpp_modes[] __initdata = {
-	MPP0_GPIO,		/* ? input */
-	MPP1_GPIO,		/* input power switch (0 = pressed) */
-	MPP2_GPIO,		/* output power off */
-	MPP3_UNUSED,		/* ? output */
-	MPP4_UNUSED,		/* ? output */
-	MPP5_UNUSED,		/* ? output */
-	MPP6_UNUSED,		/* ? output */
-	MPP7_UNUSED,		/* ? output */
-	MPP8_GPIO,		/* i/o right amber LED */
-	MPP9_GPIO,		/* i/o left amber LED */
-	MPP10_GPIO,		/* input */
-	MPP11_UNUSED,
-	MPP12_SATA_LED,
-	MPP13_SATA_LED,
-	MPP14_SATA_LED,
-	MPP15_SATA_LED,
-	MPP16_UNUSED,
-	MPP17_GPIO,		/* power button LED */
-	MPP18_GPIO,		/* fan speed bit 0 */
-	MPP19_GPIO,		/* fan speed bit 1 */
-	0,
-};
-
-/* Rev C1 Fan speed notes:
- *
- * The fan is controlled by 2 GPIOs on this board. The settings
- * of the bits is as follow:
- *
- *  GPIO 18    GPIO 19    Fan
- *
- *    0          0        stopped
- *    0          1        low speed
- *    1          0        high speed
- *    1          1        don't do that (*)
- *
- * (*) I think the two bits control two feed-in resistors into a fixed
- *     PWN circuit, setting both bits will basically go a 'bit' faster
- *     than high speed, but d-link doesn't do it and you may get out of
- *     HW spec so don't do it.
- */
-
-/*
- * On the DNS-323 A1 and B1 the following devices are attached via I2C:
- *
- *  i2c addr | chip        | description
- *  0x3e     | GMT G760Af  | fan speed PWM controller
- *  0x48     | GMT G751-2f | temp. sensor and therm. watchdog (LM75 compatible)
- *  0x68     | ST M41T80   | RTC w/ alarm
- */
-static struct i2c_board_info __initdata dns323ab_i2c_devices[] = {
-	{
-		I2C_BOARD_INFO("g760a", 0x3e),
-	}, {
-		I2C_BOARD_INFO("lm75", 0x48),
-	}, {
-		I2C_BOARD_INFO("m41t80", 0x68),
-	},
-};
-
-/*
- * On the DNS-323 C1 the following devices are attached via I2C:
- *
- *  i2c addr | chip        | description
- *  0x48     | GMT G751-2f | temp. sensor and therm. watchdog (LM75 compatible)
- *  0x68     | ST M41T80   | RTC w/ alarm
- */
-static struct i2c_board_info __initdata dns323c_i2c_devices[] = {
-	{
-		I2C_BOARD_INFO("lm75", 0x48),
-	}, {
-		I2C_BOARD_INFO("m41t80", 0x68),
-	},
-};
-
-/* DNS-323 rev. A specific power off method */
-static void dns323a_power_off(void)
-{
-	pr_info("DNS-323: Triggering power-off...\n");
-	gpio_set_value(DNS323_GPIO_POWER_OFF, 1);
-}
-
-/* DNS-323 rev B specific power off method */
-static void dns323b_power_off(void)
-{
-	pr_info("DNS-323: Triggering power-off...\n");
-	/* Pin has to be changed to 1 and back to 0 to do actual power off. */
-	gpio_set_value(DNS323_GPIO_POWER_OFF, 1);
-	mdelay(100);
-	gpio_set_value(DNS323_GPIO_POWER_OFF, 0);
-}
-
-/* DNS-323 rev. C specific power off method */
-static void dns323c_power_off(void)
-{
-	pr_info("DNS-323: Triggering power-off...\n");
-	gpio_set_value(DNS323C_GPIO_POWER_OFF, 1);
-}
-
-static int dns323c_phy_fixup(struct phy_device *phy)
-{
-	phy->dev_flags |= MARVELL_PHY_M1118_DNS323_LEDS;
-
-	return 0;
-}
-
-static int __init dns323_identify_rev(void)
-{
-	u32 dev, rev, i, reg;
-
-	pr_debug("DNS-323: Identifying board ... \n");
-
-	/* Rev A1 has a 5181 */
-	orion5x_pcie_id(&dev, &rev);
-	if (dev == MV88F5181_DEV_ID) {
-		pr_debug("DNS-323: 5181 found, board is A1\n");
-		return DNS323_REV_A1;
-	}
-	pr_debug("DNS-323: 5182 found, board is B1 or C1, checking PHY...\n");
-
-	/* Rev B1 and C1 both have 5182, let's poke at the eth PHY. This is
-	 * a bit gross but we want to do that without links into the eth
-	 * driver so let's poke at it directly. We default to rev B1 in
-	 * case the accesses fail
-	 */
-
-#define ETH_SMI_REG		(ORION5X_ETH_VIRT_BASE + 0x2000 + 0x004)
-#define  SMI_BUSY		0x10000000
-#define  SMI_READ_VALID		0x08000000
-#define  SMI_OPCODE_READ	0x04000000
-#define  SMI_OPCODE_WRITE	0x00000000
-
-	for (i = 0; i < 1000; i++) {
-		reg = readl(ETH_SMI_REG);
-		if (!(reg & SMI_BUSY))
-			break;
-	}
-	if (i >= 1000) {
-		pr_warn("DNS-323: Timeout accessing PHY, assuming rev B1\n");
-		return DNS323_REV_B1;
-	}
-	writel((3 << 21)	/* phy ID reg */ |
-	       (8 << 16)	/* phy addr */ |
-	       SMI_OPCODE_READ, ETH_SMI_REG);
-	for (i = 0; i < 1000; i++) {
-		reg = readl(ETH_SMI_REG);
-		if (reg & SMI_READ_VALID)
-			break;
-	}
-	if (i >= 1000) {
-		pr_warn("DNS-323: Timeout reading PHY, assuming rev B1\n");
-		return DNS323_REV_B1;
-	}
-	pr_debug("DNS-323: Ethernet PHY ID 0x%x\n", reg & 0xffff);
-
-	/* Note: the Marvell tools mask the ID with 0x3f0 before comparison
-	 * but I don't see that making a difference here, at least with
-	 * any known Marvell PHY ID
-	 */
-	switch(reg & 0xfff0) {
-	case 0x0cc0: /* MV88E1111 */
-		return DNS323_REV_B1;
-	case 0x0e10: /* MV88E1118 */
-		return DNS323_REV_C1;
-	default:
-		pr_warn("DNS-323: Unknown PHY ID 0x%04x, assuming rev B1\n",
-			reg & 0xffff);
-	}
-	return DNS323_REV_B1;
-}
-
-static void __init dns323_init(void)
-{
-	/* Setup basic Orion functions. Need to be called early. */
-	orion5x_init();
-
-	/* Identify revision */
-	system_rev = dns323_identify_rev();
-	pr_info("DNS-323: Identified HW revision %c1\n", 'A' + system_rev);
-
-	/* Just to be tricky, the 5182 has a completely different
-	 * set of MPP modes to the 5181.
-	 */
-	switch(system_rev) {
-	case DNS323_REV_A1:
-		orion5x_mpp_conf(dns323a_mpp_modes);
-		writel(0, MPP_DEV_CTRL);		/* DEV_D[31:16] */
-		break;
-	case DNS323_REV_B1:
-		orion5x_mpp_conf(dns323b_mpp_modes);
-		break;
-	case DNS323_REV_C1:
-		orion5x_mpp_conf(dns323c_mpp_modes);
-		break;
-	}
-
-	/* setup flash mapping
-	 * CS3 holds a 8 MB Spansion S29GL064M90TFIR4
-	 */
-	mvebu_mbus_add_window_by_id(ORION_MBUS_DEVBUS_BOOT_TARGET,
-				    ORION_MBUS_DEVBUS_BOOT_ATTR,
-				    DNS323_NOR_BOOT_BASE,
-				    DNS323_NOR_BOOT_SIZE);
-	platform_device_register(&dns323_nor_flash);
-
-	/* Sort out LEDs, Buttons and i2c devices */
-	switch(system_rev) {
-	case DNS323_REV_A1:
-		/* The 5181 power LED is active low and requires
-		 * DNS323_GPIO_LED_POWER1 to also be low.
-		 */
-		 dns323ab_leds[0].active_low = 1;
-		 gpio_request(DNS323_GPIO_LED_POWER1, "Power Led Enable");
-		 gpio_direction_output(DNS323_GPIO_LED_POWER1, 0);
-		fallthrough;
-	case DNS323_REV_B1:
-		i2c_register_board_info(0, dns323ab_i2c_devices,
-				ARRAY_SIZE(dns323ab_i2c_devices));
-		break;
-	case DNS323_REV_C1:
-		/* Hookup LEDs & Buttons */
-		dns323_gpio_leds.dev.platform_data = &dns323c_led_data;
-		dns323_button_device.dev.platform_data = &dns323c_button_data;
-
-		/* Hookup i2c devices and fan driver */
-		i2c_register_board_info(0, dns323c_i2c_devices,
-				ARRAY_SIZE(dns323c_i2c_devices));
-		platform_device_register_simple("dns323c-fan", 0, NULL, 0);
-
-		/* Register fixup for the PHY LEDs */
-		if (!IS_BUILTIN(CONFIG_PHYLIB))
-			break;
-		phy_register_fixup_for_uid(MARVELL_PHY_ID_88E1118,
-					   MARVELL_PHY_ID_MASK,
-					   dns323c_phy_fixup);
-	}
-
-	platform_device_register(&dns323_gpio_leds);
-	platform_device_register(&dns323_button_device);
-
-	/*
-	 * Configure peripherals.
-	 */
-	if (dns323_read_mac_addr() < 0)
-		printk("DNS-323: Failed to read MAC address\n");
-	orion5x_ehci0_init();
-	orion5x_eth_init(&dns323_eth_data);
-	orion5x_i2c_init();
-	orion5x_uart0_init();
-
-	/* Remaining GPIOs */
-	switch(system_rev) {
-	case DNS323_REV_A1:
-		/* Poweroff GPIO */
-		if (gpio_request(DNS323_GPIO_POWER_OFF, "POWEROFF") != 0 ||
-		    gpio_direction_output(DNS323_GPIO_POWER_OFF, 0) != 0)
-			pr_err("DNS-323: failed to setup power-off GPIO\n");
-		pm_power_off = dns323a_power_off;
-		break;
-	case DNS323_REV_B1:
-		/* 5182 built-in SATA init */
-		orion5x_sata_init(&dns323_sata_data);
-
-		/* The DNS323 rev B1 has flag to indicate the system is up.
-		 * Without this flag set, power LED will flash and cannot be
-		 * controlled via leds-gpio.
-		 */
-		if (gpio_request(DNS323_GPIO_SYSTEM_UP, "SYS_READY") == 0)
-			gpio_direction_output(DNS323_GPIO_SYSTEM_UP, 1);
-
-		/* Poweroff GPIO */
-		if (gpio_request(DNS323_GPIO_POWER_OFF, "POWEROFF") != 0 ||
-		    gpio_direction_output(DNS323_GPIO_POWER_OFF, 0) != 0)
-			pr_err("DNS-323: failed to setup power-off GPIO\n");
-		pm_power_off = dns323b_power_off;
-		break;
-	case DNS323_REV_C1:
-		/* 5182 built-in SATA init */
-		orion5x_sata_init(&dns323_sata_data);
-
-		/* Poweroff GPIO */
-		if (gpio_request(DNS323C_GPIO_POWER_OFF, "POWEROFF") != 0 ||
-		    gpio_direction_output(DNS323C_GPIO_POWER_OFF, 0) != 0)
-			pr_err("DNS-323: failed to setup power-off GPIO\n");
-		pm_power_off = dns323c_power_off;
-
-		/* Now, -this- should theorically be done by the sata_mv driver
-		 * once I figure out what's going on there. Maybe the behaviour
-		 * of the LEDs should be somewhat passed via the platform_data.
-		 * for now, just whack the register and make the LEDs happy
-		 *
-		 * Note: AFAIK, rev B1 needs the same treatement but I'll let
-		 * somebody else test it.
-		 */
-		writel(0x5, ORION5X_SATA_VIRT_BASE + 0x2c);
-		break;
-	}
-}
-
-/* Warning: D-Link uses a wrong mach-type (=526) in their bootloader */
-MACHINE_START(DNS323, "D-Link DNS-323")
-	/* Maintainer: Herbert Valerio Riedel <hvr@gnu.org> */
-	.atag_offset	= 0x100,
-	.nr_irqs	= ORION5X_NR_IRQS,
-	.init_machine	= dns323_init,
-	.map_io		= orion5x_map_io,
-	.init_early	= orion5x_init_early,
-	.init_irq	= orion5x_init_irq,
-	.init_time	= orion5x_timer_init,
-	.fixup		= tag_fixup_mem32,
-	.restart	= orion5x_restart,
-MACHINE_END
-- 
2.25.1

