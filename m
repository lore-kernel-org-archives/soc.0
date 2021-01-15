Return-Path: <SRS0=9KG2=GS=pengutronix.de=ukl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16DDC433DB
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 15:51:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5AAF523884; Fri, 15 Jan 2021 15:51:36 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 687432339D
	for <soc@kernel.org>; Fri, 15 Jan 2021 15:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 687432339D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=ukl@pengutronix.de
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1l0RNs-0003NL-NR; Fri, 15 Jan 2021 16:51:32 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1l0RNs-0008LK-6s; Fri, 15 Jan 2021 16:51:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v2 1/7] ARM: drop efm32 platform
Date: Fri, 15 Jan 2021 16:51:24 +0100
Message-Id: <20210115155130.185010-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

I didn't touch this code since it served as a platform to introduce
ARMv7-M support to Linux. The only known machine that runs Linux has only
4 MiB of RAM (that originally only exists to hold the display's framebuffer).

There are no known users and no further use foreseeable, so drop the
code.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/Kconfig                     |  10 +-
 arch/arm/Kconfig.debug               |  17 ---
 arch/arm/Makefile                    |   1 -
 arch/arm/boot/dts/Makefile           |   2 -
 arch/arm/boot/dts/efm32gg-dk3750.dts |  88 -------------
 arch/arm/boot/dts/efm32gg.dtsi       | 177 ---------------------------
 arch/arm/configs/efm32_defconfig     |  98 ---------------
 arch/arm/include/debug/efm32.S       |  45 -------
 arch/arm/mach-efm32/Makefile         |   2 -
 arch/arm/mach-efm32/Makefile.boot    |   4 -
 arch/arm/mach-efm32/dtmachine.c      |  16 ---
 arch/arm/mm/Kconfig                  |   1 -
 12 files changed, 1 insertion(+), 460 deletions(-)
 delete mode 100644 arch/arm/boot/dts/efm32gg-dk3750.dts
 delete mode 100644 arch/arm/boot/dts/efm32gg.dtsi
 delete mode 100644 arch/arm/configs/efm32_defconfig
 delete mode 100644 arch/arm/include/debug/efm32.S
 delete mode 100644 arch/arm/mach-efm32/Makefile
 delete mode 100644 arch/arm/mach-efm32/Makefile.boot
 delete mode 100644 arch/arm/mach-efm32/dtmachine.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 138248999df7..d31f3d74ce9b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -727,14 +727,6 @@ source "arch/arm/mach-zx/Kconfig"
 source "arch/arm/mach-zynq/Kconfig"
 
 # ARMv7-M architecture
-config ARCH_EFM32
-	bool "Energy Micro efm32"
-	depends on ARM_SINGLE_ARMV7M
-	select GPIOLIB
-	help
-	  Support for Energy Micro's (now Silicon Labs) efm32 Giant Gecko
-	  processors.
-
 config ARCH_LPC18XX
 	bool "NXP LPC18xx/LPC43xx"
 	depends on ARM_SINGLE_ARMV7M
@@ -1552,7 +1544,7 @@ config ARM_MODULE_PLTS
 config FORCE_MAX_ZONEORDER
 	int "Maximum zone order"
 	default "12" if SOC_AM33XX
-	default "9" if SA1111 || ARCH_EFM32
+	default "9" if SA1111
 	default "11"
 	help
 	  The kernel memory allocator divides physically contiguous memory
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 4ff04201a8cc..46458f9f99fc 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1456,20 +1456,6 @@ choice
 		  options; the platform specific options are deprecated
 		  and will be soon removed.
 
-	config DEBUG_LL_UART_EFM32
-		bool "Kernel low-level debugging via efm32 UART"
-		depends on ARCH_EFM32
-		help
-		  Say Y here if you want the debug print routines to direct
-		  their output to an UART or USART port on efm32 based
-		  machines. Use the following addresses for DEBUG_UART_PHYS:
-
-		    0x4000c000 | USART0
-		    0x4000c400 | USART1
-		    0x4000c800 | USART2
-		    0x4000e000 | UART0
-		    0x4000e400 | UART1
-
 	config DEBUG_LL_UART_PL01X
 		bool "Kernel low-level debugging via ARM Ltd PL01x Primecell UART"
 		help
@@ -1587,7 +1573,6 @@ config DEBUG_LL_INCLUDE
 	default "debug/meson.S" if DEBUG_MESON_UARTAO
 	default "debug/pl01x.S" if DEBUG_LL_UART_PL01X || DEBUG_UART_PL01X
 	default "debug/exynos.S" if DEBUG_EXYNOS_UART
-	default "debug/efm32.S" if DEBUG_LL_UART_EFM32
 	default "debug/icedcc.S" if DEBUG_ICEDCC
 	default "debug/imx.S" if DEBUG_IMX1_UART || \
 				 DEBUG_IMX25_UART || \
@@ -1682,7 +1667,6 @@ config DEBUG_UART_PHYS
 	default 0x20201000 if DEBUG_BCM2835
 	default 0x3e000000 if DEBUG_BCM_KONA_UART
 	default 0x3f201000 if DEBUG_BCM2836
-	default 0x4000e400 if DEBUG_LL_UART_EFM32
 	default 0x40010000 if STM32MP1_DEBUG_UART
 	default 0x40011000 if STM32F4_DEBUG_UART || STM32F7_DEBUG_UART || \
 				STM32H7_DEBUG_UART
@@ -1768,7 +1752,6 @@ config DEBUG_UART_PHYS
 	default 0xfffff200 if DEBUG_AT91_RM9200_DBGU
 	depends on ARCH_EP93XX || \
 	        DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
-		DEBUG_LL_UART_EFM32 || \
 		DEBUG_UART_8250 || DEBUG_UART_PL01X || DEBUG_MESON_UARTAO || \
 		DEBUG_QCOM_UARTDM || DEBUG_R7S72100_SCIF2 || \
 		DEBUG_R7S9210_SCIF2 || DEBUG_R7S9210_SCIF4 || \
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 4aaec9599e8a..c1cf77805e9a 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -168,7 +168,6 @@ machine-$(CONFIG_ARCH_CNS3XXX)		+= cns3xxx
 machine-$(CONFIG_ARCH_DAVINCI)		+= davinci
 machine-$(CONFIG_ARCH_DIGICOLOR)	+= digicolor
 machine-$(CONFIG_ARCH_DOVE)		+= dove
-machine-$(CONFIG_ARCH_EFM32)		+= efm32
 machine-$(CONFIG_ARCH_EP93XX)		+= ep93xx
 machine-$(CONFIG_ARCH_EXYNOS)		+= exynos
 machine-$(CONFIG_ARCH_FOOTBRIDGE)	+= footbridge
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 3d1ea0b25168..325e167d3404 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -177,8 +177,6 @@ dtb-$(CONFIG_ARCH_DAVINCI) += \
 	da850-lego-ev3.dtb
 dtb-$(CONFIG_ARCH_DIGICOLOR) += \
 	cx92755_equinox.dtb
-dtb-$(CONFIG_ARCH_EFM32) += \
-	efm32gg-dk3750.dtb
 dtb-$(CONFIG_ARCH_EXYNOS3) += \
 	exynos3250-artik5-eval.dtb \
 	exynos3250-monk.dtb \
diff --git a/arch/arm/boot/dts/efm32gg-dk3750.dts b/arch/arm/boot/dts/efm32gg-dk3750.dts
deleted file mode 100644
index adfa559a488b..000000000000
--- a/arch/arm/boot/dts/efm32gg-dk3750.dts
+++ /dev/null
@@ -1,88 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Device tree for EFM32GG-DK3750 development board.
- *
- * Documentation available from
- * http://www.silabs.com/Support%20Documents/TechnicalDocs/efm32gg-dk3750-ug.pdf
- */
-
-/dts-v1/;
-#include "efm32gg.dtsi"
-
-/ {
-	model = "Energy Micro Giant Gecko Development Kit";
-	compatible = "efm32,dk3750";
-
-	chosen {
-		bootargs = "console=ttyefm4,115200 init=/linuxrc ignore_loglevel ihash_entries=64 dhash_entries=64 earlyprintk uclinux.physaddr=0x8c400000 root=/dev/mtdblock0";
-	};
-
-	memory@88000000 {
-		device_type = "memory";
-		reg = <0x88000000 0x400000>;
-	};
-
-	soc {
-		adc@40002000 {
-			status = "ok";
-		};
-
-		i2c@4000a000 {
-			energymicro,location = <3>;
-			status = "ok";
-
-			temp@48 {
-				compatible = "st,stds75";
-				reg = <0x48>;
-			};
-
-			eeprom@50 {
-				compatible = "microchip,24c02", "atmel,24c02";
-				reg = <0x50>;
-				pagesize = <16>;
-			};
-		};
-
-		spi0: spi@4000c000 { /* USART0 */
-			cs-gpios = <&gpio 68 1>; // E4
-			energymicro,location = <1>;
-			status = "ok";
-
-			microsd@0 {
-				compatible = "mmc-spi-slot";
-				spi-max-frequency = <100000>;
-				voltage-ranges = <3200 3400>;
-				broken-cd;
-				reg = <0>;
-			};
-		};
-
-		spi1: spi@4000c400 { /* USART1 */
-			cs-gpios = <&gpio 51 1>; // D3
-			energymicro,location = <1>;
-			status = "ok";
-
-			ks8851@0 {
-				compatible = "ks8851";
-				spi-max-frequency = <6000000>;
-				reg = <0>;
-				interrupt-parent = <&boardfpga>;
-				interrupts = <4>;
-			};
-		};
-
-		uart4: uart@4000e400 { /* UART1 */
-			energymicro,location = <2>;
-			status = "ok";
-		};
-
-		boardfpga: boardfpga@80000000 {
-			compatible = "efm32board";
-			reg = <0x80000000 0x400>;
-			irq-gpios = <&gpio 64 1>;
-			interrupt-controller;
-			#interrupt-cells = <1>;
-			status = "ok";
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/efm32gg.dtsi b/arch/arm/boot/dts/efm32gg.dtsi
deleted file mode 100644
index 8a58e49144cc..000000000000
--- a/arch/arm/boot/dts/efm32gg.dtsi
+++ /dev/null
@@ -1,177 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Device tree for Energy Micro EFM32 Giant Gecko SoC.
- *
- * Documentation available from
- * http://www.silabs.com/Support%20Documents/TechnicalDocs/EFM32GG-RM.pdf
- */
-
-#include "armv7-m.dtsi"
-#include "dt-bindings/clock/efm32-cmu.h"
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	aliases {
-		i2c0 = &i2c0;
-		i2c1 = &i2c1;
-		serial0 = &uart0;
-		serial1 = &uart1;
-		serial2 = &uart2;
-		serial3 = &uart3;
-		serial4 = &uart4;
-		spi0 = &spi0;
-		spi1 = &spi1;
-		spi2 = &spi2;
-	};
-
-	soc {
-		adc: adc@40002000 {
-			compatible = "energymicro,efm32-adc";
-			reg = <0x40002000 0x400>;
-			interrupts = <7>;
-			clocks = <&cmu clk_HFPERCLKADC0>;
-			status = "disabled";
-		};
-
-		gpio: gpio@40006000 {
-			compatible = "energymicro,efm32-gpio";
-			reg = <0x40006000 0x1000>;
-			interrupts = <1 11>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <1>;
-			clocks = <&cmu clk_HFPERCLKGPIO>;
-			status = "ok";
-		};
-
-		i2c0: i2c@4000a000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "energymicro,efm32-i2c";
-			reg = <0x4000a000 0x400>;
-			interrupts = <9>;
-			clocks = <&cmu clk_HFPERCLKI2C0>;
-			clock-frequency = <100000>;
-			status = "disabled";
-		};
-
-		i2c1: i2c@4000a400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "energymicro,efm32-i2c";
-			reg = <0x4000a400 0x400>;
-			interrupts = <10>;
-			clocks = <&cmu clk_HFPERCLKI2C1>;
-			clock-frequency = <100000>;
-			status = "disabled";
-		};
-
-		spi0: spi@4000c000 { /* USART0 */
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "energymicro,efm32-spi";
-			reg = <0x4000c000 0x400>;
-			interrupts = <3 4>;
-			clocks = <&cmu clk_HFPERCLKUSART0>;
-			status = "disabled";
-		};
-
-		spi1: spi@4000c400 { /* USART1 */
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "energymicro,efm32-spi";
-			reg = <0x4000c400 0x400>;
-			interrupts = <15 16>;
-			clocks = <&cmu clk_HFPERCLKUSART1>;
-			status = "disabled";
-		};
-
-		spi2: spi@4000c800 { /* USART2 */
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "energymicro,efm32-spi";
-			reg = <0x4000c800 0x400>;
-			interrupts = <18 19>;
-			clocks = <&cmu clk_HFPERCLKUSART2>;
-			status = "disabled";
-		};
-
-		uart0: uart@4000c000 { /* USART0 */
-			compatible = "energymicro,efm32-uart";
-			reg = <0x4000c000 0x400>;
-			interrupts = <3 4>;
-			clocks = <&cmu clk_HFPERCLKUSART0>;
-			status = "disabled";
-		};
-
-		uart1: uart@4000c400 { /* USART1 */
-			compatible = "energymicro,efm32-uart";
-			reg = <0x4000c400 0x400>;
-			interrupts = <15 16>;
-			clocks = <&cmu clk_HFPERCLKUSART1>;
-			status = "disabled";
-		};
-
-		uart2: uart@4000c800 { /* USART2 */
-			compatible = "energymicro,efm32-uart";
-			reg = <0x4000c800 0x400>;
-			interrupts = <18 19>;
-			clocks = <&cmu clk_HFPERCLKUSART2>;
-			status = "disabled";
-		};
-
-		uart3: uart@4000e000 { /* UART0 */
-			compatible = "energymicro,efm32-uart";
-			reg = <0x4000e000 0x400>;
-			interrupts = <20 21>;
-			clocks = <&cmu clk_HFPERCLKUART0>;
-			status = "disabled";
-		};
-
-		uart4: uart@4000e400 { /* UART1 */
-			compatible = "energymicro,efm32-uart";
-			reg = <0x4000e400 0x400>;
-			interrupts = <22 23>;
-			clocks = <&cmu clk_HFPERCLKUART1>;
-			status = "disabled";
-		};
-
-		timer0: timer@40010000 {
-			compatible = "energymicro,efm32-timer";
-			reg = <0x40010000 0x400>;
-			interrupts = <2>;
-			clocks = <&cmu clk_HFPERCLKTIMER0>;
-		};
-
-		timer1: timer@40010400 {
-			compatible = "energymicro,efm32-timer";
-			reg = <0x40010400 0x400>;
-			interrupts = <12>;
-			clocks = <&cmu clk_HFPERCLKTIMER1>;
-		};
-
-		timer2: timer@40010800 {
-			compatible = "energymicro,efm32-timer";
-			reg = <0x40010800 0x400>;
-			interrupts = <13>;
-			clocks = <&cmu clk_HFPERCLKTIMER2>;
-		};
-
-		timer3: timer@40010c00 {
-			compatible = "energymicro,efm32-timer";
-			reg = <0x40010c00 0x400>;
-			interrupts = <14>;
-			clocks = <&cmu clk_HFPERCLKTIMER3>;
-		};
-
-		cmu: cmu@400c8000 {
-			compatible = "efm32gg,cmu";
-			reg = <0x400c8000 0x400>;
-			interrupts = <32>;
-			#clock-cells = <1>;
-		};
-	};
-};
diff --git a/arch/arm/configs/efm32_defconfig b/arch/arm/configs/efm32_defconfig
deleted file mode 100644
index 46213f0530c4..000000000000
--- a/arch/arm/configs/efm32_defconfig
+++ /dev/null
@@ -1,98 +0,0 @@
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=12
-CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-# CONFIG_UID16 is not set
-# CONFIG_BASE_FULL is not set
-# CONFIG_FUTEX is not set
-# CONFIG_EPOLL is not set
-# CONFIG_SIGNALFD is not set
-# CONFIG_EVENTFD is not set
-# CONFIG_AIO is not set
-CONFIG_EMBEDDED=y
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_SLUB_DEBUG is not set
-# CONFIG_BLK_DEV_BSG is not set
-# CONFIG_MMU is not set
-CONFIG_ARM_SINGLE_ARMV7M=y
-CONFIG_ARCH_EFM32=y
-CONFIG_SET_MEM_PARAM=y
-CONFIG_DRAM_BASE=0x88000000
-CONFIG_DRAM_SIZE=0x00400000
-CONFIG_FLASH_MEM_BASE=0x8c000000
-CONFIG_FLASH_SIZE=0x01000000
-CONFIG_PREEMPT=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_XIP_KERNEL=y
-CONFIG_XIP_PHYS_ADDR=0x8c000000
-CONFIG_BINFMT_FLAT=y
-CONFIG_BINFMT_SHARED_FLAT=y
-# CONFIG_COREDUMP is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_FW_LOADER is not set
-CONFIG_MTD=y
-CONFIG_MTD_BLOCK_RO=y
-CONFIG_MTD_ROM=y
-CONFIG_MTD_UCLINUX=y
-# CONFIG_BLK_DEV is not set
-CONFIG_NETDEVICES=y
-# CONFIG_NET_VENDOR_ARC is not set
-# CONFIG_NET_CADENCE is not set
-# CONFIG_NET_VENDOR_BROADCOM is not set
-# CONFIG_NET_VENDOR_CIRRUS is not set
-# CONFIG_NET_VENDOR_FARADAY is not set
-# CONFIG_NET_VENDOR_INTEL is not set
-# CONFIG_NET_VENDOR_MARVELL is not set
-CONFIG_KS8851=y
-# CONFIG_NET_VENDOR_MICROCHIP is not set
-# CONFIG_NET_VENDOR_NATSEMI is not set
-# CONFIG_NET_VENDOR_SEEQ is not set
-# CONFIG_NET_VENDOR_SMSC is not set
-# CONFIG_NET_VENDOR_STMICRO is not set
-# CONFIG_NET_VENDOR_VIA is not set
-# CONFIG_NET_VENDOR_WIZNET is not set
-# CONFIG_WLAN is not set
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-# CONFIG_UNIX98_PTYS is not set
-# CONFIG_LEGACY_PTYS is not set
-CONFIG_SERIAL_NONSTANDARD=y
-# CONFIG_DEVKMEM is not set
-CONFIG_SERIAL_EFM32_UART=y
-CONFIG_SERIAL_EFM32_UART_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
-CONFIG_I2C_EFM32=y
-CONFIG_SPI=y
-CONFIG_SPI_EFM32=y
-CONFIG_GPIO_SYSFS=y
-# CONFIG_USB_SUPPORT is not set
-CONFIG_MMC=y
-CONFIG_MMC_SPI=y
-CONFIG_EXT2_FS=y
-# CONFIG_FILE_LOCKING is not set
-# CONFIG_DNOTIFY is not set
-# CONFIG_INOTIFY_USER is not set
-CONFIG_ROMFS_FS=y
-CONFIG_ROMFS_BACKED_BY_MTD=y
-# CONFIG_NETWORK_FILESYSTEMS is not set
-CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
-# CONFIG_ENABLE_MUST_CHECK is not set
-CONFIG_MAGIC_SYSRQ=y
-# CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_BUGVERBOSE is not set
-# CONFIG_FTRACE is not set
diff --git a/arch/arm/include/debug/efm32.S b/arch/arm/include/debug/efm32.S
deleted file mode 100644
index b0083d6e31e8..000000000000
--- a/arch/arm/include/debug/efm32.S
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2013 Pengutronix
- * Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>
- */
-
-#define UARTn_CMD		0x000c
-#define UARTn_CMD_TXEN			0x0004
-
-#define	UARTn_STATUS		0x0010
-#define	UARTn_STATUS_TXC		0x0020
-#define	UARTn_STATUS_TXBL		0x0040
-
-#define	UARTn_TXDATA		0x0034
-
-		.macro	addruart, rx, tmp, tmp2
-		ldr	\rx, =(CONFIG_DEBUG_UART_PHYS)
-
-		/*
-		 * enable TX. The driver might disable it to save energy. We
-		 * don't care about disabling at the end as during debug power
-		 * consumption isn't that important.
-		 */
-		ldr	\tmp, =(UARTn_CMD_TXEN)
-		str	\tmp, [\rx, #UARTn_CMD]
-		.endm
-
-		.macro	senduart,rd,rx
-		strb	\rd, [\rx, #UARTn_TXDATA]
-		.endm
-
-		.macro	waituartcts,rd,rx
-		.endm
-
-		.macro	waituarttxrdy,rd,rx
-1001:		ldr	\rd, [\rx, #UARTn_STATUS]
-		tst	\rd, #UARTn_STATUS_TXBL
-		beq	1001b
-		.endm
-
-		.macro	busyuart,rd,rx
-1001:		ldr	\rd, [\rx, UARTn_STATUS]
-		tst	\rd, #UARTn_STATUS_TXC
-		bne	1001b
-		.endm
diff --git a/arch/arm/mach-efm32/Makefile b/arch/arm/mach-efm32/Makefile
deleted file mode 100644
index dede3fa55a76..000000000000
--- a/arch/arm/mach-efm32/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-y += dtmachine.o
diff --git a/arch/arm/mach-efm32/Makefile.boot b/arch/arm/mach-efm32/Makefile.boot
deleted file mode 100644
index cec195d4fcba..000000000000
--- a/arch/arm/mach-efm32/Makefile.boot
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-# Empty file waiting for deletion once Makefile.boot isn't needed any more.
-# Patch waits for application at
-# http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7889/1 .
diff --git a/arch/arm/mach-efm32/dtmachine.c b/arch/arm/mach-efm32/dtmachine.c
deleted file mode 100644
index e9364b843641..000000000000
--- a/arch/arm/mach-efm32/dtmachine.c
+++ /dev/null
@@ -1,16 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/kernel.h>
-
-#include <asm/v7m.h>
-
-#include <asm/mach/arch.h>
-
-static const char *const efm32gg_compat[] __initconst = {
-	"efm32,dk3750",
-	NULL
-};
-
-DT_MACHINE_START(EFM32DT, "EFM32 (Device Tree Support)")
-	.dt_compat = efm32gg_compat,
-	.restart = armv7m_restart,
-MACHINE_END
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 02692fbe2db5..35f43d0aa056 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -638,7 +638,6 @@ config CPU_V7M_NUM_IRQ
 	int "Number of external interrupts connected to the NVIC"
 	depends on CPU_V7M
 	default 90 if ARCH_STM32
-	default 38 if ARCH_EFM32
 	default 112 if SOC_VF610
 	default 240
 	help
-- 
2.29.2

