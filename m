Return-Path: <SRS0=Q6mf=GR=pengutronix.de=ukl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D192AC43331
	for <soc@archiver.kernel.org>; Thu, 14 Jan 2021 15:16:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 72D0523A84; Thu, 14 Jan 2021 15:16:36 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B18823A6C
	for <soc@kernel.org>; Thu, 14 Jan 2021 15:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B18823A6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=ukl@pengutronix.de
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1l04MS-00021r-Fg; Thu, 14 Jan 2021 16:16:32 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1l04MS-00012l-2s; Thu, 14 Jan 2021 16:16:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v1 1/7] ARM: drop efm32 platform
Date: Thu, 14 Jan 2021 16:16:24 +0100
Message-Id: <20210114151630.128830-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
References: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
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
 arch/arm/Kconfig                         |  10 +-
 arch/arm/Kconfig.debug                   |  17 -
 arch/arm/Makefile                        |   1 -
 arch/arm/boot/dts/Makefile               |   2 -
 arch/arm/boot/dts/efm32gg-dk3750.dts     |  88 ---
 arch/arm/boot/dts/efm32gg.dtsi           | 177 -----
 arch/arm/configs/efm32_defconfig         |  98 ---
 arch/arm/include/debug/efm32.S           |  45 --
 arch/arm/mach-efm32/Makefile             |   2 -
 arch/arm/mach-efm32/Makefile.boot        |   4 -
 arch/arm/mach-efm32/dtmachine.c          |  16 -
 arch/arm/mm/Kconfig                      |   1 -
 drivers/tty/serial/efm32-uart.c          | 852 -----------------------
 include/linux/platform_data/efm32-uart.h |  19 -
 14 files changed, 1 insertion(+), 1331 deletions(-)
 delete mode 100644 arch/arm/boot/dts/efm32gg-dk3750.dts
 delete mode 100644 arch/arm/boot/dts/efm32gg.dtsi
 delete mode 100644 arch/arm/configs/efm32_defconfig
 delete mode 100644 arch/arm/include/debug/efm32.S
 delete mode 100644 arch/arm/mach-efm32/Makefile
 delete mode 100644 arch/arm/mach-efm32/Makefile.boot
 delete mode 100644 arch/arm/mach-efm32/dtmachine.c
 delete mode 100644 drivers/tty/serial/efm32-uart.c
 delete mode 100644 include/linux/platform_data/efm32-uart.h

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
diff --git a/drivers/tty/serial/efm32-uart.c b/drivers/tty/serial/efm32-uart.c
deleted file mode 100644
index f12f29cf4f31..000000000000
--- a/drivers/tty/serial/efm32-uart.c
+++ /dev/null
@@ -1,852 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/io.h>
-#include <linux/platform_device.h>
-#include <linux/console.h>
-#include <linux/sysrq.h>
-#include <linux/serial_core.h>
-#include <linux/tty_flip.h>
-#include <linux/slab.h>
-#include <linux/clk.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-
-#include <linux/platform_data/efm32-uart.h>
-
-#define DRIVER_NAME "efm32-uart"
-#define DEV_NAME "ttyefm"
-
-#define UARTn_CTRL		0x00
-#define UARTn_CTRL_SYNC		0x0001
-#define UARTn_CTRL_TXBIL		0x1000
-
-#define UARTn_FRAME		0x04
-#define UARTn_FRAME_DATABITS__MASK	0x000f
-#define UARTn_FRAME_DATABITS(n)		((n) - 3)
-#define UARTn_FRAME_PARITY__MASK	0x0300
-#define UARTn_FRAME_PARITY_NONE		0x0000
-#define UARTn_FRAME_PARITY_EVEN		0x0200
-#define UARTn_FRAME_PARITY_ODD		0x0300
-#define UARTn_FRAME_STOPBITS_HALF	0x0000
-#define UARTn_FRAME_STOPBITS_ONE	0x1000
-#define UARTn_FRAME_STOPBITS_TWO	0x3000
-
-#define UARTn_CMD		0x0c
-#define UARTn_CMD_RXEN			0x0001
-#define UARTn_CMD_RXDIS		0x0002
-#define UARTn_CMD_TXEN			0x0004
-#define UARTn_CMD_TXDIS		0x0008
-
-#define UARTn_STATUS		0x10
-#define UARTn_STATUS_TXENS		0x0002
-#define UARTn_STATUS_TXC		0x0020
-#define UARTn_STATUS_TXBL		0x0040
-#define UARTn_STATUS_RXDATAV		0x0080
-
-#define UARTn_CLKDIV		0x14
-
-#define UARTn_RXDATAX		0x18
-#define UARTn_RXDATAX_RXDATA__MASK	0x01ff
-#define UARTn_RXDATAX_PERR		0x4000
-#define UARTn_RXDATAX_FERR		0x8000
-/*
- * This is a software only flag used for ignore_status_mask and
- * read_status_mask! It's used for breaks that the hardware doesn't report
- * explicitly.
- */
-#define SW_UARTn_RXDATAX_BERR		0x2000
-
-#define UARTn_TXDATA		0x34
-
-#define UARTn_IF		0x40
-#define UARTn_IF_TXC			0x0001
-#define UARTn_IF_TXBL			0x0002
-#define UARTn_IF_RXDATAV		0x0004
-#define UARTn_IF_RXOF			0x0010
-
-#define UARTn_IFS		0x44
-#define UARTn_IFC		0x48
-#define UARTn_IEN		0x4c
-
-#define UARTn_ROUTE		0x54
-#define UARTn_ROUTE_LOCATION__MASK	0x0700
-#define UARTn_ROUTE_LOCATION(n)		(((n) << 8) & UARTn_ROUTE_LOCATION__MASK)
-#define UARTn_ROUTE_RXPEN		0x0001
-#define UARTn_ROUTE_TXPEN		0x0002
-
-struct efm32_uart_port {
-	struct uart_port port;
-	unsigned int txirq;
-	struct clk *clk;
-	struct efm32_uart_pdata pdata;
-};
-#define to_efm_port(_port) container_of(_port, struct efm32_uart_port, port)
-#define efm_debug(efm_port, format, arg...)			\
-	dev_dbg(efm_port->port.dev, format, ##arg)
-
-static void efm32_uart_write32(struct efm32_uart_port *efm_port,
-		u32 value, unsigned offset)
-{
-	writel_relaxed(value, efm_port->port.membase + offset);
-}
-
-static u32 efm32_uart_read32(struct efm32_uart_port *efm_port,
-		unsigned offset)
-{
-	return readl_relaxed(efm_port->port.membase + offset);
-}
-
-static unsigned int efm32_uart_tx_empty(struct uart_port *port)
-{
-	struct efm32_uart_port *efm_port = to_efm_port(port);
-	u32 status = efm32_uart_read32(efm_port, UARTn_STATUS);
-
-	if (status & UARTn_STATUS_TXC)
-		return TIOCSER_TEMT;
-	else
-		return 0;
-}
-
-static void efm32_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
-{
-	/* sorry, neither handshaking lines nor loop functionallity */
-}
-
-static unsigned int efm32_uart_get_mctrl(struct uart_port *port)
-{
-	/* sorry, no handshaking lines available */
-	return TIOCM_CAR | TIOCM_CTS | TIOCM_DSR;
-}
-
-static void efm32_uart_stop_tx(struct uart_port *port)
-{
-	struct efm32_uart_port *efm_port = to_efm_port(port);
-	u32 ien = efm32_uart_read32(efm_port,  UARTn_IEN);
-
-	efm32_uart_write32(efm_port, UARTn_CMD_TXDIS, UARTn_CMD);
-	ien &= ~(UARTn_IF_TXC | UARTn_IF_TXBL);
-	efm32_uart_write32(efm_port, ien, UARTn_IEN);
-}
-
-static void efm32_uart_tx_chars(struct efm32_uart_port *efm_port)
-{
-	struct uart_port *port = &efm_port->port;
-	struct circ_buf *xmit = &port->state->xmit;
-
-	while (efm32_uart_read32(efm_port, UARTn_STATUS) &
-			UARTn_STATUS_TXBL) {
-		if (port->x_char) {
-			port->icount.tx++;
-			efm32_uart_write32(efm_port, port->x_char,
-					UARTn_TXDATA);
-			port->x_char = 0;
-			continue;
-		}
-		if (!uart_circ_empty(xmit) && !uart_tx_stopped(port)) {
-			port->icount.tx++;
-			efm32_uart_write32(efm_port, xmit->buf[xmit->tail],
-					UARTn_TXDATA);
-			xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
-		} else
-			break;
-	}
-
-	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
-		uart_write_wakeup(port);
-
-	if (!port->x_char && uart_circ_empty(xmit) &&
-			efm32_uart_read32(efm_port, UARTn_STATUS) &
-				UARTn_STATUS_TXC)
-		efm32_uart_stop_tx(port);
-}
-
-static void efm32_uart_start_tx(struct uart_port *port)
-{
-	struct efm32_uart_port *efm_port = to_efm_port(port);
-	u32 ien;
-
-	efm32_uart_write32(efm_port,
-			UARTn_IF_TXBL | UARTn_IF_TXC, UARTn_IFC);
-	ien = efm32_uart_read32(efm_port, UARTn_IEN);
-	efm32_uart_write32(efm_port,
-			ien | UARTn_IF_TXBL | UARTn_IF_TXC, UARTn_IEN);
-	efm32_uart_write32(efm_port, UARTn_CMD_TXEN, UARTn_CMD);
-
-	efm32_uart_tx_chars(efm_port);
-}
-
-static void efm32_uart_stop_rx(struct uart_port *port)
-{
-	struct efm32_uart_port *efm_port = to_efm_port(port);
-
-	efm32_uart_write32(efm_port, UARTn_CMD_RXDIS, UARTn_CMD);
-}
-
-static void efm32_uart_break_ctl(struct uart_port *port, int ctl)
-{
-	/* not possible without fiddling with gpios */
-}
-
-static void efm32_uart_rx_chars(struct efm32_uart_port *efm_port)
-{
-	struct uart_port *port = &efm_port->port;
-
-	while (efm32_uart_read32(efm_port, UARTn_STATUS) &
-			UARTn_STATUS_RXDATAV) {
-		u32 rxdata = efm32_uart_read32(efm_port, UARTn_RXDATAX);
-		int flag = 0;
-
-		/*
-		 * This is a reserved bit and I only saw it read as 0. But to be
-		 * sure not to be confused too much by new devices adhere to the
-		 * warning in the reference manual that reserved bits might
-		 * read as 1 in the future.
-		 */
-		rxdata &= ~SW_UARTn_RXDATAX_BERR;
-
-		port->icount.rx++;
-
-		if ((rxdata & UARTn_RXDATAX_FERR) &&
-				!(rxdata & UARTn_RXDATAX_RXDATA__MASK)) {
-			rxdata |= SW_UARTn_RXDATAX_BERR;
-			port->icount.brk++;
-			if (uart_handle_break(port))
-				continue;
-		} else if (rxdata & UARTn_RXDATAX_PERR)
-			port->icount.parity++;
-		else if (rxdata & UARTn_RXDATAX_FERR)
-			port->icount.frame++;
-
-		rxdata &= port->read_status_mask;
-
-		if (rxdata & SW_UARTn_RXDATAX_BERR)
-			flag = TTY_BREAK;
-		else if (rxdata & UARTn_RXDATAX_PERR)
-			flag = TTY_PARITY;
-		else if (rxdata & UARTn_RXDATAX_FERR)
-			flag = TTY_FRAME;
-		else if (uart_handle_sysrq_char(port,
-					rxdata & UARTn_RXDATAX_RXDATA__MASK))
-			continue;
-
-		if ((rxdata & port->ignore_status_mask) == 0)
-			tty_insert_flip_char(&port->state->port,
-					rxdata & UARTn_RXDATAX_RXDATA__MASK, flag);
-	}
-}
-
-static irqreturn_t efm32_uart_rxirq(int irq, void *data)
-{
-	struct efm32_uart_port *efm_port = data;
-	u32 irqflag = efm32_uart_read32(efm_port, UARTn_IF);
-	int handled = IRQ_NONE;
-	struct uart_port *port = &efm_port->port;
-	struct tty_port *tport = &port->state->port;
-
-	spin_lock(&port->lock);
-
-	if (irqflag & UARTn_IF_RXDATAV) {
-		efm32_uart_write32(efm_port, UARTn_IF_RXDATAV, UARTn_IFC);
-		efm32_uart_rx_chars(efm_port);
-
-		handled = IRQ_HANDLED;
-	}
-
-	if (irqflag & UARTn_IF_RXOF) {
-		efm32_uart_write32(efm_port, UARTn_IF_RXOF, UARTn_IFC);
-		port->icount.overrun++;
-		tty_insert_flip_char(tport, 0, TTY_OVERRUN);
-
-		handled = IRQ_HANDLED;
-	}
-
-	spin_unlock(&port->lock);
-
-	tty_flip_buffer_push(tport);
-
-	return handled;
-}
-
-static irqreturn_t efm32_uart_txirq(int irq, void *data)
-{
-	struct efm32_uart_port *efm_port = data;
-	u32 irqflag = efm32_uart_read32(efm_port, UARTn_IF);
-
-	/* TXBL doesn't need to be cleared */
-	if (irqflag & UARTn_IF_TXC)
-		efm32_uart_write32(efm_port, UARTn_IF_TXC, UARTn_IFC);
-
-	if (irqflag & (UARTn_IF_TXC | UARTn_IF_TXBL)) {
-		efm32_uart_tx_chars(efm_port);
-		return IRQ_HANDLED;
-	} else
-		return IRQ_NONE;
-}
-
-static int efm32_uart_startup(struct uart_port *port)
-{
-	struct efm32_uart_port *efm_port = to_efm_port(port);
-	int ret;
-
-	ret = clk_enable(efm_port->clk);
-	if (ret) {
-		efm_debug(efm_port, "failed to enable clk\n");
-		goto err_clk_enable;
-	}
-	port->uartclk = clk_get_rate(efm_port->clk);
-
-	/* Enable pins at configured location */
-	efm32_uart_write32(efm_port,
-			UARTn_ROUTE_LOCATION(efm_port->pdata.location) |
-			UARTn_ROUTE_RXPEN | UARTn_ROUTE_TXPEN,
-			UARTn_ROUTE);
-
-	ret = request_irq(port->irq, efm32_uart_rxirq, 0,
-			DRIVER_NAME, efm_port);
-	if (ret) {
-		efm_debug(efm_port, "failed to register rxirq\n");
-		goto err_request_irq_rx;
-	}
-
-	/* disable all irqs */
-	efm32_uart_write32(efm_port, 0, UARTn_IEN);
-
-	ret = request_irq(efm_port->txirq, efm32_uart_txirq, 0,
-			DRIVER_NAME, efm_port);
-	if (ret) {
-		efm_debug(efm_port, "failed to register txirq\n");
-		free_irq(port->irq, efm_port);
-err_request_irq_rx:
-
-		clk_disable(efm_port->clk);
-	} else {
-		efm32_uart_write32(efm_port,
-				UARTn_IF_RXDATAV | UARTn_IF_RXOF, UARTn_IEN);
-		efm32_uart_write32(efm_port, UARTn_CMD_RXEN, UARTn_CMD);
-	}
-
-err_clk_enable:
-	return ret;
-}
-
-static void efm32_uart_shutdown(struct uart_port *port)
-{
-	struct efm32_uart_port *efm_port = to_efm_port(port);
-
-	efm32_uart_write32(efm_port, 0, UARTn_IEN);
-	free_irq(port->irq, efm_port);
-
-	clk_disable(efm_port->clk);
-}
-
-static void efm32_uart_set_termios(struct uart_port *port,
-		struct ktermios *new, struct ktermios *old)
-{
-	struct efm32_uart_port *efm_port = to_efm_port(port);
-	unsigned long flags;
-	unsigned baud;
-	u32 clkdiv;
-	u32 frame = 0;
-
-	/* no modem control lines */
-	new->c_cflag &= ~(CRTSCTS | CMSPAR);
-
-	baud = uart_get_baud_rate(port, new, old,
-			DIV_ROUND_CLOSEST(port->uartclk, 16 * 8192),
-			DIV_ROUND_CLOSEST(port->uartclk, 16));
-
-	switch (new->c_cflag & CSIZE) {
-	case CS5:
-		frame |= UARTn_FRAME_DATABITS(5);
-		break;
-	case CS6:
-		frame |= UARTn_FRAME_DATABITS(6);
-		break;
-	case CS7:
-		frame |= UARTn_FRAME_DATABITS(7);
-		break;
-	case CS8:
-		frame |= UARTn_FRAME_DATABITS(8);
-		break;
-	}
-
-	if (new->c_cflag & CSTOPB)
-		/* the receiver only verifies the first stop bit */
-		frame |= UARTn_FRAME_STOPBITS_TWO;
-	else
-		frame |= UARTn_FRAME_STOPBITS_ONE;
-
-	if (new->c_cflag & PARENB) {
-		if (new->c_cflag & PARODD)
-			frame |= UARTn_FRAME_PARITY_ODD;
-		else
-			frame |= UARTn_FRAME_PARITY_EVEN;
-	} else
-		frame |= UARTn_FRAME_PARITY_NONE;
-
-	/*
-	 * the 6 lowest bits of CLKDIV are dc, bit 6 has value 0.25.
-	 * port->uartclk <= 14e6, so 4 * port->uartclk doesn't overflow.
-	 */
-	clkdiv = (DIV_ROUND_CLOSEST(4 * port->uartclk, 16 * baud) - 4) << 6;
-
-	spin_lock_irqsave(&port->lock, flags);
-
-	efm32_uart_write32(efm_port,
-			UARTn_CMD_TXDIS | UARTn_CMD_RXDIS, UARTn_CMD);
-
-	port->read_status_mask = UARTn_RXDATAX_RXDATA__MASK;
-	if (new->c_iflag & INPCK)
-		port->read_status_mask |=
-			UARTn_RXDATAX_FERR | UARTn_RXDATAX_PERR;
-	if (new->c_iflag & (IGNBRK | BRKINT | PARMRK))
-		port->read_status_mask |= SW_UARTn_RXDATAX_BERR;
-
-	port->ignore_status_mask = 0;
-	if (new->c_iflag & IGNPAR)
-		port->ignore_status_mask |=
-			UARTn_RXDATAX_FERR | UARTn_RXDATAX_PERR;
-	if (new->c_iflag & IGNBRK)
-		port->ignore_status_mask |= SW_UARTn_RXDATAX_BERR;
-
-	uart_update_timeout(port, new->c_cflag, baud);
-
-	efm32_uart_write32(efm_port, UARTn_CTRL_TXBIL, UARTn_CTRL);
-	efm32_uart_write32(efm_port, frame, UARTn_FRAME);
-	efm32_uart_write32(efm_port, clkdiv, UARTn_CLKDIV);
-
-	efm32_uart_write32(efm_port, UARTn_CMD_TXEN | UARTn_CMD_RXEN,
-			UARTn_CMD);
-
-	spin_unlock_irqrestore(&port->lock, flags);
-}
-
-static const char *efm32_uart_type(struct uart_port *port)
-{
-	return port->type == PORT_EFMUART ? "efm32-uart" : NULL;
-}
-
-static void efm32_uart_release_port(struct uart_port *port)
-{
-	struct efm32_uart_port *efm_port = to_efm_port(port);
-
-	clk_unprepare(efm_port->clk);
-	clk_put(efm_port->clk);
-	iounmap(port->membase);
-}
-
-static int efm32_uart_request_port(struct uart_port *port)
-{
-	struct efm32_uart_port *efm_port = to_efm_port(port);
-	int ret;
-
-	port->membase = ioremap(port->mapbase, 60);
-	if (!efm_port->port.membase) {
-		ret = -ENOMEM;
-		efm_debug(efm_port, "failed to remap\n");
-		goto err_ioremap;
-	}
-
-	efm_port->clk = clk_get(port->dev, NULL);
-	if (IS_ERR(efm_port->clk)) {
-		ret = PTR_ERR(efm_port->clk);
-		efm_debug(efm_port, "failed to get clock\n");
-		goto err_clk_get;
-	}
-
-	ret = clk_prepare(efm_port->clk);
-	if (ret) {
-		clk_put(efm_port->clk);
-err_clk_get:
-
-		iounmap(port->membase);
-err_ioremap:
-		return ret;
-	}
-	return 0;
-}
-
-static void efm32_uart_config_port(struct uart_port *port, int type)
-{
-	if (type & UART_CONFIG_TYPE &&
-			!efm32_uart_request_port(port))
-		port->type = PORT_EFMUART;
-}
-
-static int efm32_uart_verify_port(struct uart_port *port,
-		struct serial_struct *serinfo)
-{
-	int ret = 0;
-
-	if (serinfo->type != PORT_UNKNOWN && serinfo->type != PORT_EFMUART)
-		ret = -EINVAL;
-
-	return ret;
-}
-
-static const struct uart_ops efm32_uart_pops = {
-	.tx_empty = efm32_uart_tx_empty,
-	.set_mctrl = efm32_uart_set_mctrl,
-	.get_mctrl = efm32_uart_get_mctrl,
-	.stop_tx = efm32_uart_stop_tx,
-	.start_tx = efm32_uart_start_tx,
-	.stop_rx = efm32_uart_stop_rx,
-	.break_ctl = efm32_uart_break_ctl,
-	.startup = efm32_uart_startup,
-	.shutdown = efm32_uart_shutdown,
-	.set_termios = efm32_uart_set_termios,
-	.type = efm32_uart_type,
-	.release_port = efm32_uart_release_port,
-	.request_port = efm32_uart_request_port,
-	.config_port = efm32_uart_config_port,
-	.verify_port = efm32_uart_verify_port,
-};
-
-static struct efm32_uart_port *efm32_uart_ports[5];
-
-#ifdef CONFIG_SERIAL_EFM32_UART_CONSOLE
-static void efm32_uart_console_putchar(struct uart_port *port, int ch)
-{
-	struct efm32_uart_port *efm_port = to_efm_port(port);
-	unsigned int timeout = 0x400;
-	u32 status;
-
-	while (1) {
-		status = efm32_uart_read32(efm_port, UARTn_STATUS);
-
-		if (status & UARTn_STATUS_TXBL)
-			break;
-		if (!timeout--)
-			return;
-	}
-	efm32_uart_write32(efm_port, ch, UARTn_TXDATA);
-}
-
-static void efm32_uart_console_write(struct console *co, const char *s,
-		unsigned int count)
-{
-	struct efm32_uart_port *efm_port = efm32_uart_ports[co->index];
-	u32 status = efm32_uart_read32(efm_port, UARTn_STATUS);
-	unsigned int timeout = 0x400;
-
-	if (!(status & UARTn_STATUS_TXENS))
-		efm32_uart_write32(efm_port, UARTn_CMD_TXEN, UARTn_CMD);
-
-	uart_console_write(&efm_port->port, s, count,
-			efm32_uart_console_putchar);
-
-	/* Wait for the transmitter to become empty */
-	while (1) {
-		u32 status = efm32_uart_read32(efm_port, UARTn_STATUS);
-		if (status & UARTn_STATUS_TXC)
-			break;
-		if (!timeout--)
-			break;
-	}
-
-	if (!(status & UARTn_STATUS_TXENS))
-		efm32_uart_write32(efm_port, UARTn_CMD_TXDIS, UARTn_CMD);
-}
-
-static void efm32_uart_console_get_options(struct efm32_uart_port *efm_port,
-		int *baud, int *parity, int *bits)
-{
-	u32 ctrl = efm32_uart_read32(efm_port, UARTn_CTRL);
-	u32 route, clkdiv, frame;
-
-	if (ctrl & UARTn_CTRL_SYNC)
-		/* not operating in async mode */
-		return;
-
-	route = efm32_uart_read32(efm_port, UARTn_ROUTE);
-	if (!(route & UARTn_ROUTE_TXPEN))
-		/* tx pin not routed */
-		return;
-
-	clkdiv = efm32_uart_read32(efm_port, UARTn_CLKDIV);
-
-	*baud = DIV_ROUND_CLOSEST(4 * efm_port->port.uartclk,
-			16 * (4 + (clkdiv >> 6)));
-
-	frame = efm32_uart_read32(efm_port, UARTn_FRAME);
-	switch (frame & UARTn_FRAME_PARITY__MASK) {
-	case UARTn_FRAME_PARITY_ODD:
-		*parity = 'o';
-		break;
-	case UARTn_FRAME_PARITY_EVEN:
-		*parity = 'e';
-		break;
-	default:
-		*parity = 'n';
-	}
-
-	*bits = (frame & UARTn_FRAME_DATABITS__MASK) -
-			UARTn_FRAME_DATABITS(4) + 4;
-
-	efm_debug(efm_port, "get_opts: options=%d%c%d\n",
-			*baud, *parity, *bits);
-}
-
-static int efm32_uart_console_setup(struct console *co, char *options)
-{
-	struct efm32_uart_port *efm_port;
-	int baud = 115200;
-	int bits = 8;
-	int parity = 'n';
-	int flow = 'n';
-	int ret;
-
-	if (co->index < 0 || co->index >= ARRAY_SIZE(efm32_uart_ports)) {
-		unsigned i;
-		for (i = 0; i < ARRAY_SIZE(efm32_uart_ports); ++i) {
-			if (efm32_uart_ports[i]) {
-				pr_warn("efm32-console: fall back to console index %u (from %hhi)\n",
-						i, co->index);
-				co->index = i;
-				break;
-			}
-		}
-	}
-
-	efm_port = efm32_uart_ports[co->index];
-	if (!efm_port) {
-		pr_warn("efm32-console: No port at %d\n", co->index);
-		return -ENODEV;
-	}
-
-	ret = clk_prepare(efm_port->clk);
-	if (ret) {
-		dev_warn(efm_port->port.dev,
-				"console: clk_prepare failed: %d\n", ret);
-		return ret;
-	}
-
-	efm_port->port.uartclk = clk_get_rate(efm_port->clk);
-
-	if (options)
-		uart_parse_options(options, &baud, &parity, &bits, &flow);
-	else
-		efm32_uart_console_get_options(efm_port,
-				&baud, &parity, &bits);
-
-	return uart_set_options(&efm_port->port, co, baud, parity, bits, flow);
-}
-
-static struct uart_driver efm32_uart_reg;
-
-static struct console efm32_uart_console = {
-	.name = DEV_NAME,
-	.write = efm32_uart_console_write,
-	.device = uart_console_device,
-	.setup = efm32_uart_console_setup,
-	.flags = CON_PRINTBUFFER,
-	.index = -1,
-	.data = &efm32_uart_reg,
-};
-
-#else
-#define efm32_uart_console (*(struct console *)NULL)
-#endif /* ifdef CONFIG_SERIAL_EFM32_UART_CONSOLE / else */
-
-static struct uart_driver efm32_uart_reg = {
-	.owner = THIS_MODULE,
-	.driver_name = DRIVER_NAME,
-	.dev_name = DEV_NAME,
-	.nr = ARRAY_SIZE(efm32_uart_ports),
-	.cons = &efm32_uart_console,
-};
-
-static int efm32_uart_probe_dt(struct platform_device *pdev,
-		struct efm32_uart_port *efm_port)
-{
-	struct device_node *np = pdev->dev.of_node;
-	u32 location;
-	int ret;
-
-	if (!np)
-		return 1;
-
-	ret = of_property_read_u32(np, "energymicro,location", &location);
-
-	if (ret)
-		/* fall back to wrongly namespaced property */
-		ret = of_property_read_u32(np, "efm32,location", &location);
-
-	if (ret)
-		/* fall back to old and (wrongly) generic property "location" */
-		ret = of_property_read_u32(np, "location", &location);
-
-	if (!ret) {
-		if (location > 5) {
-			dev_err(&pdev->dev, "invalid location\n");
-			return -EINVAL;
-		}
-		efm_debug(efm_port, "using location %u\n", location);
-		efm_port->pdata.location = location;
-	} else {
-		efm_debug(efm_port, "fall back to location 0\n");
-	}
-
-	ret = of_alias_get_id(np, "serial");
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to get alias id: %d\n", ret);
-		return ret;
-	} else {
-		efm_port->port.line = ret;
-		return 0;
-	}
-
-}
-
-static int efm32_uart_probe(struct platform_device *pdev)
-{
-	struct efm32_uart_port *efm_port;
-	struct resource *res;
-	unsigned int line;
-	int ret;
-
-	efm_port = kzalloc(sizeof(*efm_port), GFP_KERNEL);
-	if (!efm_port) {
-		dev_dbg(&pdev->dev, "failed to allocate private data\n");
-		return -ENOMEM;
-	}
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		ret = -ENODEV;
-		dev_dbg(&pdev->dev, "failed to determine base address\n");
-		goto err_get_base;
-	}
-
-	if (resource_size(res) < 60) {
-		ret = -EINVAL;
-		dev_dbg(&pdev->dev, "memory resource too small\n");
-		goto err_too_small;
-	}
-
-	ret = platform_get_irq(pdev, 0);
-	if (ret <= 0) {
-		dev_dbg(&pdev->dev, "failed to get rx irq\n");
-		goto err_get_rxirq;
-	}
-
-	efm_port->port.irq = ret;
-
-	ret = platform_get_irq(pdev, 1);
-	if (ret <= 0)
-		ret = efm_port->port.irq + 1;
-
-	efm_port->txirq = ret;
-
-	efm_port->port.dev = &pdev->dev;
-	efm_port->port.mapbase = res->start;
-	efm_port->port.type = PORT_EFMUART;
-	efm_port->port.iotype = UPIO_MEM32;
-	efm_port->port.fifosize = 2;
-	efm_port->port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_EFM32_UART_CONSOLE);
-	efm_port->port.ops = &efm32_uart_pops;
-	efm_port->port.flags = UPF_BOOT_AUTOCONF;
-
-	ret = efm32_uart_probe_dt(pdev, efm_port);
-	if (ret > 0) {
-		/* not created by device tree */
-		const struct efm32_uart_pdata *pdata = dev_get_platdata(&pdev->dev);
-
-		efm_port->port.line = pdev->id;
-
-		if (pdata)
-			efm_port->pdata = *pdata;
-	} else if (ret < 0)
-		goto err_probe_dt;
-
-	line = efm_port->port.line;
-
-	if (line >= 0 && line < ARRAY_SIZE(efm32_uart_ports))
-		efm32_uart_ports[line] = efm_port;
-
-	ret = uart_add_one_port(&efm32_uart_reg, &efm_port->port);
-	if (ret) {
-		dev_dbg(&pdev->dev, "failed to add port: %d\n", ret);
-
-		if (line >= 0 && line < ARRAY_SIZE(efm32_uart_ports))
-			efm32_uart_ports[line] = NULL;
-err_probe_dt:
-err_get_rxirq:
-err_too_small:
-err_get_base:
-		kfree(efm_port);
-	} else {
-		platform_set_drvdata(pdev, efm_port);
-		dev_dbg(&pdev->dev, "\\o/\n");
-	}
-
-	return ret;
-}
-
-static int efm32_uart_remove(struct platform_device *pdev)
-{
-	struct efm32_uart_port *efm_port = platform_get_drvdata(pdev);
-	unsigned int line = efm_port->port.line;
-
-	uart_remove_one_port(&efm32_uart_reg, &efm_port->port);
-
-	if (line >= 0 && line < ARRAY_SIZE(efm32_uart_ports))
-		efm32_uart_ports[line] = NULL;
-
-	kfree(efm_port);
-
-	return 0;
-}
-
-static const struct of_device_id efm32_uart_dt_ids[] = {
-	{
-		.compatible = "energymicro,efm32-uart",
-	}, {
-		/* doesn't follow the "vendor,device" scheme, don't use */
-		.compatible = "efm32,uart",
-	}, {
-		/* sentinel */
-	}
-};
-MODULE_DEVICE_TABLE(of, efm32_uart_dt_ids);
-
-static struct platform_driver efm32_uart_driver = {
-	.probe = efm32_uart_probe,
-	.remove = efm32_uart_remove,
-
-	.driver = {
-		.name = DRIVER_NAME,
-		.of_match_table = efm32_uart_dt_ids,
-	},
-};
-
-static int __init efm32_uart_init(void)
-{
-	int ret;
-
-	ret = uart_register_driver(&efm32_uart_reg);
-	if (ret)
-		return ret;
-
-	ret = platform_driver_register(&efm32_uart_driver);
-	if (ret)
-		uart_unregister_driver(&efm32_uart_reg);
-
-	pr_info("EFM32 UART/USART driver\n");
-
-	return ret;
-}
-module_init(efm32_uart_init);
-
-static void __exit efm32_uart_exit(void)
-{
-	platform_driver_unregister(&efm32_uart_driver);
-	uart_unregister_driver(&efm32_uart_reg);
-}
-module_exit(efm32_uart_exit);
-
-MODULE_AUTHOR("Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>");
-MODULE_DESCRIPTION("EFM32 UART/USART driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRIVER_NAME);
diff --git a/include/linux/platform_data/efm32-uart.h b/include/linux/platform_data/efm32-uart.h
deleted file mode 100644
index ccbb8f11db75..000000000000
--- a/include/linux/platform_data/efm32-uart.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *
- *
- */
-#ifndef __LINUX_PLATFORM_DATA_EFM32_UART_H__
-#define __LINUX_PLATFORM_DATA_EFM32_UART_H__
-
-#include <linux/types.h>
-
-/**
- * struct efm32_uart_pdata
- * @location: pinmux location for the I/O pins (to be written to the ROUTE
- * 	register)
- */
-struct efm32_uart_pdata {
-	u8 location;
-};
-#endif /* ifndef __LINUX_PLATFORM_DATA_EFM32_UART_H__ */
-- 
2.29.2

