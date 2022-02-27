Return-Path: <jic23@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F29C433F5
	for <soc@archiver.kernel.org>; Sun, 27 Feb 2022 13:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9DE2C340F3; Sun, 27 Feb 2022 13:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5061C340E9;
	Sun, 27 Feb 2022 13:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645969069;
	bh=ZqxqzxKm5RlzSZz6Bcuqatr+FdW894UjNeCe8KwGwxI=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=kCu+52IeFt1DHIByn79IR8PxUGOtZ3bCKJYzO5K20x9UMQydsJRAOf0hGEDxI0hno
	 CWhjHi17CNPoJcRdP6FL6zyjtmXMYXHnpXLeT3EqgwaIOolErUi+H3bR9+gZCDHl3U
	 1wDfrMPq+5WQfGNSgtvsuwJyJzjamJKFnODxQI7GRUsgi7+Nc/zAVjaCxnhIDnrmKq
	 i5k7OHun9h+GFmMKVz2Tm1VnFCOy6KP/VM0cL1Sxg3KsVmuO0KknuiL0Dsy9Tvq7PL
	 I+xfNxIIG+TDMsXrjdiXDPuhd5bvX+OB2iX62by5vfGzUc67FrgBoPbj7/jvMQc62c
	 cS2wec0ojDk+w==
From: Jonathan Cameron <jic23@kernel.org>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	soc@kernel.org
Subject: [PATCH v4] ARM: pxa: remove Intel Imote2 and Stargate 2 boards
Date: Sun, 27 Feb 2022 13:44:31 +0000
Message-Id: <20220227134431.908998-1-jic23@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

I have no reason to believe these boards have any more users and I
haven't tested them for several years.  Removing them may simplify
other changes to the various PXA boards people still care about.
The recent conversion of pxa2xx_spi to GPIO descriptors for example
had to update this board despite no one caring or testing.

Great boards that got me started in kernel development, RIP!

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Daniel Mack <daniel@zonque.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: soc@kernel.org

---
v4: Added Daniel's Ack and sent to soc@kernel.org

 MAINTAINERS                                 |    7 -
 arch/arm/configs/pxa_defconfig              |    3 -
 arch/arm/mach-pxa/Kconfig                   |   10 -
 arch/arm/mach-pxa/Makefile                  |    2 -
 arch/arm/mach-pxa/include/mach/uncompress.h |    3 +-
 arch/arm/mach-pxa/stargate2.c               | 1030 -------------------
 drivers/pcmcia/Kconfig                      |    2 +-
 drivers/pcmcia/Makefile                     |    1 -
 drivers/pcmcia/pxa2xx_stargate2.c           |  137 ---
 sound/soc/pxa/Kconfig                       |    9 -
 sound/soc/pxa/Makefile                      |    2 -
 sound/soc/pxa/imote2.c                      |   99 --
 12 files changed, 2 insertions(+), 1303 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/stargate2.c
 delete mode 100644 drivers/pcmcia/pxa2xx_stargate2.c
 delete mode 100644 sound/soc/pxa/imote2.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..541da15996a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2115,13 +2115,6 @@ F:	Documentation/devicetree/bindings/arm/intel,keembay.yaml
 F:	arch/arm64/boot/dts/intel/keembay-evm.dts
 F:	arch/arm64/boot/dts/intel/keembay-soc.dtsi
 
-ARM/INTEL RESEARCH IMOTE/STARGATE 2 MACHINE SUPPORT
-M:	Jonathan Cameron <jic23@cam.ac.uk>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-F:	arch/arm/mach-pxa/stargate2.c
-F:	drivers/pcmcia/pxa2xx_stargate2.c
-
 ARM/INTEL XSC3 (MANZANO) ARM CORE
 M:	Lennert Buytenhek <kernel@wantstofly.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index dedaaae3d0d8..29b1f192afbb 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -41,8 +41,6 @@ CONFIG_MACH_EXEDA=y
 CONFIG_MACH_CM_X300=y
 CONFIG_MACH_CAPC7117=y
 CONFIG_ARCH_GUMSTIX=y
-CONFIG_MACH_INTELMOTE2=y
-CONFIG_MACH_STARGATE2=y
 CONFIG_MACH_XCEP=y
 CONFIG_TRIZEPS_PXA=y
 CONFIG_MACH_TRIZEPS4WL=y
@@ -487,7 +485,6 @@ CONFIG_SND_SOC_ZYLONITE=m
 CONFIG_SND_PXA2XX_SOC_HX4700=m
 CONFIG_SND_PXA2XX_SOC_MAGICIAN=m
 CONFIG_SND_PXA2XX_SOC_MIOA701=m
-CONFIG_SND_PXA2XX_SOC_IMOTE2=m
 CONFIG_SND_SOC_AK4642=m
 CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SIMPLE_CARD=m
diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index f7520a6cc7d4..57f0be4065c1 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -153,16 +153,6 @@ config GUMSTIX_AM300EPD
 
 endchoice
 
-config MACH_INTELMOTE2
-	bool "Intel Mote 2 Platform"
-	select IWMMXT
-	select PXA27x
-
-config MACH_STARGATE2
-	bool "Intel Stargate 2 Platform"
-	select IWMMXT
-	select PXA27x
-
 config MACH_XCEP
 	bool "Iskratel Electronics XCEP"
 	select MTD
diff --git a/arch/arm/mach-pxa/Makefile b/arch/arm/mach-pxa/Makefile
index 177abe584dd5..68730ceb8b7c 100644
--- a/arch/arm/mach-pxa/Makefile
+++ b/arch/arm/mach-pxa/Makefile
@@ -45,8 +45,6 @@ obj-$(CONFIG_MACH_CAPC7117)     += capc7117.o mxm8x10.o
 obj-$(CONFIG_ARCH_GUMSTIX)	+= gumstix.o
 obj-$(CONFIG_GUMSTIX_AM200EPD)	+= am200epd.o
 obj-$(CONFIG_GUMSTIX_AM300EPD)	+= am300epd.o
-obj-$(CONFIG_MACH_INTELMOTE2)	+= stargate2.o
-obj-$(CONFIG_MACH_STARGATE2)	+= stargate2.o
 obj-$(CONFIG_MACH_XCEP)         += xcep.o
 obj-$(CONFIG_MACH_TRIZEPS4)	+= trizeps4.o
 obj-$(CONFIG_MACH_LOGICPD_PXA270)	+= lpd270.o
diff --git a/arch/arm/mach-pxa/include/mach/uncompress.h b/arch/arm/mach-pxa/include/mach/uncompress.h
index c36306064eee..f71a8dafa6e0 100644
--- a/arch/arm/mach-pxa/include/mach/uncompress.h
+++ b/arch/arm/mach-pxa/include/mach/uncompress.h
@@ -58,8 +58,7 @@ static inline void arch_decomp_setup(void)
 	uart_shift = 2;
 	uart_is_pxa = 1;
 
-	if (machine_is_littleton() || machine_is_intelmote2()
-	    || machine_is_csb726() || machine_is_stargate2()
+	if (machine_is_littleton() ||  machine_is_csb726() ||
 	    || machine_is_cm_x300() || machine_is_balloon3())
 		uart_base = STUART_BASE;
 
diff --git a/arch/arm/mach-pxa/stargate2.c b/arch/arm/mach-pxa/stargate2.c
deleted file mode 100644
index 8ca02ec1d44c..000000000000
--- a/arch/arm/mach-pxa/stargate2.c
+++ /dev/null
@@ -1,1030 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  linux/arch/arm/mach-pxa/stargate2.c
- *
- *  Author:	Ed C. Epp
- *  Created:	Nov 05, 2002
- *  Copyright:	Intel Corp.
- *
- *  Modified 2009:  Jonathan Cameron <jic23@cam.ac.uk>
- */
-
-#include <linux/init.h>
-#include <linux/device.h>
-#include <linux/interrupt.h>
-#include <linux/sched.h>
-#include <linux/bitops.h>
-#include <linux/fb.h>
-#include <linux/delay.h>
-#include <linux/platform_device.h>
-#include <linux/regulator/machine.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/plat-ram.h>
-#include <linux/mtd/partitions.h>
-
-#include <linux/platform_data/i2c-pxa.h>
-#include <linux/platform_data/pcf857x.h>
-#include <linux/smc91x.h>
-#include <linux/gpio/machine.h>
-#include <linux/gpio.h>
-#include <linux/leds.h>
-#include <linux/property.h>
-
-#include <asm/types.h>
-#include <asm/setup.h>
-#include <asm/memory.h>
-#include <asm/mach-types.h>
-#include <asm/irq.h>
-
-#include <asm/mach/arch.h>
-#include <asm/mach/map.h>
-#include <asm/mach/irq.h>
-#include <asm/mach/flash.h>
-
-#include "pxa27x.h"
-#include <linux/platform_data/mmc-pxamci.h>
-#include "udc.h"
-#include "pxa27x-udc.h"
-#include <mach/smemc.h>
-
-#include <linux/spi/spi.h>
-#include <linux/spi/pxa2xx_spi.h>
-#include <linux/mfd/da903x.h>
-
-#include "devices.h"
-#include "generic.h"
-
-#define STARGATE_NR_IRQS	(IRQ_BOARD_START + 8)
-
-/* Bluetooth */
-#define SG2_BT_RESET		81
-
-/* SD */
-#define SG2_GPIO_nSD_DETECT	90
-#define SG2_SD_POWER_ENABLE	89
-
-static unsigned long sg2_im2_unified_pin_config[] __initdata = {
-	/* Device Identification for wakeup*/
-	GPIO102_GPIO,
-	/* DA9030 */
-	GPIO1_GPIO,
-
-	/* MMC */
-	GPIO32_MMC_CLK,
-	GPIO112_MMC_CMD,
-	GPIO92_MMC_DAT_0,
-	GPIO109_MMC_DAT_1,
-	GPIO110_MMC_DAT_2,
-	GPIO111_MMC_DAT_3,
-
-	/* 802.15.4 radio - driver out of mainline */
-	GPIO22_GPIO,			/* CC_RSTN */
-	GPIO114_GPIO,			/* CC_FIFO */
-	GPIO116_GPIO,			/* CC_CCA */
-	GPIO0_GPIO,			/* CC_FIFOP */
-	GPIO16_GPIO,			/* CCSFD */
-	GPIO115_GPIO,			/* Power enable */
-
-	/* I2C */
-	GPIO117_I2C_SCL,
-	GPIO118_I2C_SDA,
-
-	/* SSP 3 - 802.15.4 radio */
-	GPIO39_GPIO,			/* Chip Select */
-	GPIO34_SSP3_SCLK,
-	GPIO35_SSP3_TXD,
-	GPIO41_SSP3_RXD,
-
-	/* SSP 2 to daughter boards */
-	GPIO11_SSP2_RXD,
-	GPIO38_SSP2_TXD,
-	GPIO36_SSP2_SCLK,
-	GPIO37_GPIO, /* chip select */
-
-	/* SSP 1 - to daughter boards */
-	GPIO24_GPIO,			/* Chip Select */
-	GPIO23_SSP1_SCLK,
-	GPIO25_SSP1_TXD,
-	GPIO26_SSP1_RXD,
-
-	/* BTUART Basic Connector*/
-	GPIO42_BTUART_RXD,
-	GPIO43_BTUART_TXD,
-	GPIO44_BTUART_CTS,
-	GPIO45_BTUART_RTS,
-
-	/* STUART  - IM2 via debug board not sure on SG2*/
-	GPIO46_STUART_RXD,
-	GPIO47_STUART_TXD,
-
-	/* Basic sensor board */
-	GPIO96_GPIO,	/* accelerometer interrupt */
-	GPIO99_GPIO,	/* ADC interrupt */
-
-	/* SHT15 */
-	GPIO100_GPIO,
-	GPIO98_GPIO,
-
-	/* Basic sensor board */
-	GPIO96_GPIO,	/* accelerometer interrupt */
-	GPIO99_GPIO,	/* ADC interrupt */
-
-	/* Connector pins specified as gpios */
-	GPIO94_GPIO, /* large basic connector pin 14 */
-	GPIO10_GPIO, /* large basic connector pin 23 */
-};
-
-static struct gpiod_lookup_table sht15_gpiod_table = {
-	.dev_id = "sht15",
-	.table = {
-		/* FIXME: should this have |GPIO_OPEN_DRAIN set? */
-		GPIO_LOOKUP("gpio-pxa", 100, "data", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio-pxa", 98, "clk", GPIO_ACTIVE_HIGH),
-	},
-};
-
-static struct platform_device sht15 = {
-	.name = "sht15",
-	.id = -1,
-};
-
-static struct regulator_consumer_supply stargate2_sensor_3_con[] = {
-	REGULATOR_SUPPLY("vcc", "sht15"),
-};
-
-enum stargate2_ldos{
-	vcc_vref,
-	vcc_cc2420,
-	/* a mote connector? */
-	vcc_mica,
-	/* the CSR bluecore chip */
-	vcc_bt,
-	/* The two voltages available to sensor boards */
-	vcc_sensor_1_8,
-	vcc_sensor_3,
-	/* directly connected to the pxa27x */
-	vcc_sram_ext,
-	vcc_pxa_pll,
-	vcc_pxa_usim, /* Reference voltage for certain gpios */
-	vcc_pxa_mem,
-	vcc_pxa_flash,
-	vcc_pxa_core, /*Dc-Dc buck not yet supported */
-	vcc_lcd,
-	vcc_bb,
-	vcc_bbio, /*not sure!*/
-	vcc_io, /* cc2420 802.15.4 radio and pxa vcc_io ?*/
-};
-
-/* The values of the various regulator constraints are obviously dependent
- * on exactly what is wired to each ldo.  Unfortunately this information is
- * not generally available.  More information has been requested from Xbow.
- */
-static struct regulator_init_data stargate2_ldo_init_data[] = {
-	[vcc_bbio] = {
-		.constraints = { /* board default 1.8V */
-			.name = "vcc_bbio",
-			.min_uV = 1800000,
-			.max_uV = 1800000,
-		},
-	},
-	[vcc_bb] = {
-		.constraints = { /* board default 2.8V */
-			.name = "vcc_bb",
-			.min_uV = 2700000,
-			.max_uV = 3000000,
-		},
-	},
-	[vcc_pxa_flash] = {
-		.constraints = {/* default is 1.8V */
-			.name = "vcc_pxa_flash",
-			.min_uV = 1800000,
-			.max_uV = 1800000,
-		},
-	},
-	[vcc_cc2420] = { /* also vcc_io */
-		.constraints = {
-			/* board default is 2.8V */
-			.name = "vcc_cc2420",
-			.min_uV = 2700000,
-			.max_uV = 3300000,
-		},
-	},
-	[vcc_vref] = { /* Reference for what? */
-		.constraints = { /* default 1.8V */
-			.name = "vcc_vref",
-			.min_uV = 1800000,
-			.max_uV = 1800000,
-		},
-	},
-	[vcc_sram_ext] = {
-		.constraints = { /* default 2.8V */
-			.name = "vcc_sram_ext",
-			.min_uV = 2800000,
-			.max_uV = 2800000,
-		},
-	},
-	[vcc_mica] = {
-		.constraints = { /* default 2.8V */
-			.name = "vcc_mica",
-			.min_uV = 2800000,
-			.max_uV = 2800000,
-		},
-	},
-	[vcc_bt] = {
-		.constraints = { /* default 2.8V */
-			.name = "vcc_bt",
-			.min_uV = 2800000,
-			.max_uV = 2800000,
-		},
-	},
-	[vcc_lcd] = {
-		.constraints = { /* default 2.8V */
-			.name = "vcc_lcd",
-			.min_uV = 2700000,
-			.max_uV = 3300000,
-		},
-	},
-	[vcc_io] = { /* Same or higher than everything
-			  * bar vccbat and vccusb */
-		.constraints = { /* default 2.8V */
-			.name = "vcc_io",
-			.min_uV = 2692000,
-			.max_uV = 3300000,
-		},
-	},
-	[vcc_sensor_1_8] = {
-		.constraints = { /* default 1.8V */
-			.name = "vcc_sensor_1_8",
-			.min_uV = 1800000,
-			.max_uV = 1800000,
-		},
-	},
-	[vcc_sensor_3] = { /* curiously default 2.8V */
-		.constraints = {
-			.name = "vcc_sensor_3",
-			.min_uV = 2800000,
-			.max_uV = 3000000,
-		},
-		.num_consumer_supplies = ARRAY_SIZE(stargate2_sensor_3_con),
-		.consumer_supplies = stargate2_sensor_3_con,
-	},
-	[vcc_pxa_pll] = { /* 1.17V - 1.43V, default 1.3V*/
-		.constraints = {
-			.name = "vcc_pxa_pll",
-			.min_uV = 1170000,
-			.max_uV = 1430000,
-		},
-	},
-	[vcc_pxa_usim] = {
-		.constraints = { /* default 1.8V */
-			.name = "vcc_pxa_usim",
-			.min_uV = 1710000,
-			.max_uV = 2160000,
-		},
-	},
-	[vcc_pxa_mem] = {
-		.constraints = { /* default 1.8V */
-			.name = "vcc_pxa_mem",
-			.min_uV = 1800000,
-			.max_uV = 1800000,
-		},
-	},
-};
-
-static struct mtd_partition stargate2flash_partitions[] = {
-	{
-		.name = "Bootloader",
-		.size = 0x00040000,
-		.offset = 0,
-		.mask_flags = 0,
-	}, {
-		.name = "Kernel",
-		.size = 0x00200000,
-		.offset = 0x00040000,
-		.mask_flags = 0
-	}, {
-		.name = "Filesystem",
-		.size = 0x01DC0000,
-		.offset = 0x00240000,
-		.mask_flags = 0
-	},
-};
-
-static struct resource flash_resources = {
-	.start = PXA_CS0_PHYS,
-	.end = PXA_CS0_PHYS + SZ_32M - 1,
-	.flags = IORESOURCE_MEM,
-};
-
-static struct flash_platform_data stargate2_flash_data = {
-	.map_name = "cfi_probe",
-	.parts = stargate2flash_partitions,
-	.nr_parts = ARRAY_SIZE(stargate2flash_partitions),
-	.name = "PXA27xOnChipROM",
-	.width = 2,
-};
-
-static struct platform_device stargate2_flash_device = {
-	.name = "pxa2xx-flash",
-	.id = 0,
-	.dev = {
-		.platform_data = &stargate2_flash_data,
-	},
-	.resource = &flash_resources,
-	.num_resources = 1,
-};
-
-static struct pxa2xx_spi_controller pxa_ssp_master_0_info = {
-	.num_chipselect = 1,
-};
-
-static struct pxa2xx_spi_controller pxa_ssp_master_1_info = {
-	.num_chipselect = 1,
-};
-
-static struct pxa2xx_spi_controller pxa_ssp_master_2_info = {
-	.num_chipselect = 1,
-};
-
-/* An upcoming kernel change will scrap SFRM usage so these
- * drivers have been moved to use GPIOs */
-static struct pxa2xx_spi_chip staccel_chip_info = {
-	.tx_threshold = 8,
-	.rx_threshold = 8,
-	.dma_burst_size = 8,
-	.timeout = 235,
-	.gpio_cs = 24,
-};
-
-static struct pxa2xx_spi_chip cc2420_info = {
-	.tx_threshold = 8,
-	.rx_threshold = 8,
-	.dma_burst_size = 8,
-	.timeout = 235,
-	.gpio_cs = 39,
-};
-
-static struct spi_board_info spi_board_info[] __initdata = {
-	{
-		.modalias = "lis3l02dq",
-		.max_speed_hz = 8000000,/* 8MHz max spi frequency at 3V */
-		.bus_num = 1,
-		.chip_select = 0,
-		.controller_data = &staccel_chip_info,
-		.irq = PXA_GPIO_TO_IRQ(96),
-	}, {
-		.modalias = "cc2420",
-		.max_speed_hz = 6500000,
-		.bus_num = 3,
-		.chip_select = 0,
-		.controller_data = &cc2420_info,
-	},
-};
-
-static void sg2_udc_command(int cmd)
-{
-	switch (cmd) {
-	case PXA2XX_UDC_CMD_CONNECT:
-		UP2OCR |=  UP2OCR_HXOE  | UP2OCR_DPPUE | UP2OCR_DPPUBE;
-		break;
-	case PXA2XX_UDC_CMD_DISCONNECT:
-		UP2OCR &= ~(UP2OCR_HXOE  | UP2OCR_DPPUE | UP2OCR_DPPUBE);
-		break;
-	}
-}
-
-static struct i2c_pxa_platform_data i2c_pwr_pdata = {
-	.fast_mode = 1,
-};
-
-static struct i2c_pxa_platform_data i2c_pdata = {
-	.fast_mode = 1,
-};
-
-static void __init imote2_stargate2_init(void)
-{
-
-	pxa2xx_mfp_config(ARRAY_AND_SIZE(sg2_im2_unified_pin_config));
-
-	pxa_set_ffuart_info(NULL);
-	pxa_set_btuart_info(NULL);
-	pxa_set_stuart_info(NULL);
-
-	pxa2xx_set_spi_info(1, &pxa_ssp_master_0_info);
-	pxa2xx_set_spi_info(2, &pxa_ssp_master_1_info);
-	pxa2xx_set_spi_info(3, &pxa_ssp_master_2_info);
-	spi_register_board_info(spi_board_info, ARRAY_SIZE(spi_board_info));
-
-
-	pxa27x_set_i2c_power_info(&i2c_pwr_pdata);
-	pxa_set_i2c_info(&i2c_pdata);
-}
-
-#ifdef CONFIG_MACH_INTELMOTE2
-/* As the the imote2 doesn't currently have a conventional SD slot
- * there is no option to hotplug cards, making all this rather simple
- */
-static int imote2_mci_get_ro(struct device *dev)
-{
-	return 0;
-}
-
-/* Rather simple case as hotplugging not possible */
-static struct pxamci_platform_data imote2_mci_platform_data = {
-	.ocr_mask = MMC_VDD_32_33 | MMC_VDD_33_34, /* default anyway */
-	.get_ro = imote2_mci_get_ro,
-};
-
-static struct gpio_led imote2_led_pins[] = {
-	{
-		.name       =  "imote2:red",
-		.gpio       = 103,
-		.active_low = 1,
-	}, {
-		.name       = "imote2:green",
-		.gpio       = 104,
-		.active_low = 1,
-	}, {
-		.name       = "imote2:blue",
-		.gpio       = 105,
-		.active_low = 1,
-	},
-};
-
-static struct gpio_led_platform_data imote2_led_data = {
-	.num_leds = ARRAY_SIZE(imote2_led_pins),
-	.leds     = imote2_led_pins,
-};
-
-static struct platform_device imote2_leds = {
-	.name = "leds-gpio",
-	.id   = -1,
-	.dev = {
-		.platform_data = &imote2_led_data,
-	},
-};
-
-static struct da903x_subdev_info imote2_da9030_subdevs[] = {
-	{
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO2,
-		.platform_data = &stargate2_ldo_init_data[vcc_bbio],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO3,
-		.platform_data = &stargate2_ldo_init_data[vcc_bb],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO4,
-		.platform_data = &stargate2_ldo_init_data[vcc_pxa_flash],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO5,
-		.platform_data = &stargate2_ldo_init_data[vcc_cc2420],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO6,
-		.platform_data = &stargate2_ldo_init_data[vcc_vref],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO7,
-		.platform_data = &stargate2_ldo_init_data[vcc_sram_ext],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO8,
-		.platform_data = &stargate2_ldo_init_data[vcc_mica],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO9,
-		.platform_data = &stargate2_ldo_init_data[vcc_bt],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO10,
-		.platform_data = &stargate2_ldo_init_data[vcc_sensor_1_8],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO11,
-		.platform_data = &stargate2_ldo_init_data[vcc_sensor_3],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO12,
-		.platform_data = &stargate2_ldo_init_data[vcc_lcd],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO15,
-		.platform_data = &stargate2_ldo_init_data[vcc_pxa_pll],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO17,
-		.platform_data = &stargate2_ldo_init_data[vcc_pxa_usim],
-	}, {
-		.name = "da903x-regulator", /*pxa vcc i/o and cc2420 vcc i/o */
-		.id = DA9030_ID_LDO18,
-		.platform_data = &stargate2_ldo_init_data[vcc_io],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO19,
-		.platform_data = &stargate2_ldo_init_data[vcc_pxa_mem],
-	},
-};
-
-static struct da903x_platform_data imote2_da9030_pdata = {
-	.num_subdevs = ARRAY_SIZE(imote2_da9030_subdevs),
-	.subdevs = imote2_da9030_subdevs,
-};
-
-static struct i2c_board_info __initdata imote2_pwr_i2c_board_info[] = {
-	{
-		.type = "da9030",
-		.addr = 0x49,
-		.platform_data = &imote2_da9030_pdata,
-		.irq = PXA_GPIO_TO_IRQ(1),
-	},
-};
-
-static struct i2c_board_info __initdata imote2_i2c_board_info[] = {
-	{ /* UCAM sensor board */
-		.type = "max1239",
-		.addr = 0x35,
-	}, { /* ITS400 Sensor board only */
-		.type = "max1363",
-		.addr = 0x34,
-		/* Through a nand gate - Also beware, on V2 sensor board the
-		 * pull up resistors are missing.
-		 */
-		.irq = PXA_GPIO_TO_IRQ(99),
-	}, { /* ITS400 Sensor board only */
-		.type = "tsl2561",
-		.addr = 0x49,
-		/* Through a nand gate - Also beware, on V2 sensor board the
-		 * pull up resistors are missing.
-		 */
-		.irq = PXA_GPIO_TO_IRQ(99),
-	}, { /* ITS400 Sensor board only */
-		.type = "tmp175",
-		.addr = 0x4A,
-		.irq = PXA_GPIO_TO_IRQ(96),
-	}, { /* IMB400 Multimedia board */
-		.type = "wm8940",
-		.addr = 0x1A,
-	},
-};
-
-static unsigned long imote2_pin_config[] __initdata = {
-
-	/* Button */
-	GPIO91_GPIO,
-
-	/* LEDS */
-	GPIO103_GPIO, /* red led */
-	GPIO104_GPIO, /* green led */
-	GPIO105_GPIO, /* blue led */
-};
-
-static struct pxa2xx_udc_mach_info imote2_udc_info __initdata = {
-	.udc_command		= sg2_udc_command,
-};
-
-static struct platform_device imote2_audio_device = {
-	.name = "imote2-audio",
-	.id   = -1,
-};
-
-static struct platform_device *imote2_devices[] = {
-	&stargate2_flash_device,
-	&imote2_leds,
-	&sht15,
-	&imote2_audio_device,
-};
-
-static void __init imote2_init(void)
-{
-	pxa2xx_mfp_config(ARRAY_AND_SIZE(imote2_pin_config));
-
-	imote2_stargate2_init();
-
-	gpiod_add_lookup_table(&sht15_gpiod_table);
-	platform_add_devices(imote2_devices, ARRAY_SIZE(imote2_devices));
-
-	i2c_register_board_info(0, imote2_i2c_board_info,
-				ARRAY_SIZE(imote2_i2c_board_info));
-	i2c_register_board_info(1, imote2_pwr_i2c_board_info,
-				ARRAY_SIZE(imote2_pwr_i2c_board_info));
-
-	pxa_set_mci_info(&imote2_mci_platform_data);
-	pxa_set_udc_info(&imote2_udc_info);
-}
-#endif
-
-#ifdef CONFIG_MACH_STARGATE2
-
-static unsigned long stargate2_pin_config[] __initdata = {
-
-	GPIO15_nCS_1, /* SRAM */
-	/* SMC91x */
-	GPIO80_nCS_4,
-	GPIO40_GPIO, /*cable detect?*/
-
-	/* Button */
-	GPIO91_GPIO | WAKEUP_ON_LEVEL_HIGH,
-
-	/* Compact Flash */
-	GPIO79_PSKTSEL,
-	GPIO48_nPOE,
-	GPIO49_nPWE,
-	GPIO50_nPIOR,
-	GPIO51_nPIOW,
-	GPIO85_nPCE_1,
-	GPIO54_nPCE_2,
-	GPIO55_nPREG,
-	GPIO56_nPWAIT,
-	GPIO57_nIOIS16,
-	GPIO120_GPIO, /* Buff ctrl */
-	GPIO108_GPIO, /* Power ctrl */
-	GPIO82_GPIO, /* Reset */
-	GPIO53_GPIO, /* SG2_S0_GPIO_DETECT */
-
-	/* MMC not shared with imote2 */
-	GPIO90_GPIO, /* nSD detect */
-	GPIO89_GPIO, /* SD_POWER_ENABLE */
-
-	/* Bluetooth */
-	GPIO81_GPIO, /* reset */
-};
-
-static struct resource smc91x_resources[] = {
-	[0] = {
-		.name = "smc91x-regs",
-		.start = (PXA_CS4_PHYS + 0x300),
-		.end = (PXA_CS4_PHYS + 0xfffff),
-		.flags = IORESOURCE_MEM,
-	},
-	[1] = {
-		.start = PXA_GPIO_TO_IRQ(40),
-		.end = PXA_GPIO_TO_IRQ(40),
-		.flags = IORESOURCE_IRQ | IORESOURCE_IRQ_HIGHEDGE,
-	}
-};
-
-static struct smc91x_platdata stargate2_smc91x_info = {
-	.flags = SMC91X_USE_8BIT | SMC91X_USE_16BIT | SMC91X_USE_32BIT
-	| SMC91X_NOWAIT | SMC91X_USE_DMA,
-	.pxa_u16_align4 = true,
-};
-
-static struct platform_device smc91x_device = {
-	.name = "smc91x",
-	.id = -1,
-	.num_resources = ARRAY_SIZE(smc91x_resources),
-	.resource = smc91x_resources,
-	.dev = {
-		.platform_data = &stargate2_smc91x_info,
-	},
-};
-
-
-/*
- * The card detect interrupt isn't debounced so we delay it by 250ms
- * to give the card a chance to fully insert / eject.
- */
-static int stargate2_mci_init(struct device *dev,
-			      irq_handler_t stargate2_detect_int,
-			      void *data)
-{
-	int err;
-
-	err = gpio_request(SG2_SD_POWER_ENABLE, "SG2_sd_power_enable");
-	if (err) {
-		printk(KERN_ERR "Can't get the gpio for SD power control");
-		goto return_err;
-	}
-	gpio_direction_output(SG2_SD_POWER_ENABLE, 0);
-
-	err = gpio_request(SG2_GPIO_nSD_DETECT, "SG2_sd_detect");
-	if (err) {
-		printk(KERN_ERR "Can't get the sd detect gpio");
-		goto free_power_en;
-	}
-	gpio_direction_input(SG2_GPIO_nSD_DETECT);
-
-	err = request_irq(PXA_GPIO_TO_IRQ(SG2_GPIO_nSD_DETECT),
-			  stargate2_detect_int,
-			  IRQ_TYPE_EDGE_BOTH,
-			  "MMC card detect",
-			  data);
-	if (err) {
-		printk(KERN_ERR "can't request MMC card detect IRQ\n");
-		goto free_nsd_detect;
-	}
-	return 0;
-
- free_nsd_detect:
-	gpio_free(SG2_GPIO_nSD_DETECT);
- free_power_en:
-	gpio_free(SG2_SD_POWER_ENABLE);
- return_err:
-	return err;
-}
-
-/**
- * stargate2_mci_setpower() - set state of mmc power supply
- *
- * Very simple control. Either it is on or off and is controlled by
- * a gpio pin */
-static int stargate2_mci_setpower(struct device *dev, unsigned int vdd)
-{
-	gpio_set_value(SG2_SD_POWER_ENABLE, !!vdd);
-	return 0;
-}
-
-static void stargate2_mci_exit(struct device *dev, void *data)
-{
-	free_irq(PXA_GPIO_TO_IRQ(SG2_GPIO_nSD_DETECT), data);
-	gpio_free(SG2_SD_POWER_ENABLE);
-	gpio_free(SG2_GPIO_nSD_DETECT);
-}
-
-static struct pxamci_platform_data stargate2_mci_platform_data = {
-	.detect_delay_ms = 250,
-	.ocr_mask = MMC_VDD_32_33 | MMC_VDD_33_34,
-	.init = stargate2_mci_init,
-	.setpower = stargate2_mci_setpower,
-	.exit = stargate2_mci_exit,
-};
-
-
-/*
- * SRAM - The Stargate 2 has 32MB of SRAM.
- *
- * Here it is made available as an MTD. This will then
- * typically have a cifs filesystem created on it to provide
- * fast temporary storage.
- */
-static struct resource sram_resources = {
-	.start = PXA_CS1_PHYS,
-	.end = PXA_CS1_PHYS + SZ_32M-1,
-	.flags = IORESOURCE_MEM,
-};
-
-static struct platdata_mtd_ram stargate2_sram_pdata = {
-	.mapname = "Stargate2 SRAM",
-	.bankwidth = 2,
-};
-
-static struct platform_device stargate2_sram = {
-	.name = "mtd-ram",
-	.id = 0,
-	.resource = &sram_resources,
-	.num_resources = 1,
-	.dev = {
-		.platform_data = &stargate2_sram_pdata,
-	},
-};
-
-static struct pcf857x_platform_data platform_data_pcf857x = {
-	.gpio_base = 128,
-	.n_latch = 0,
-	.setup = NULL,
-	.teardown = NULL,
-	.context = NULL,
-};
-
-static const struct property_entry pca9500_eeprom_properties[] = {
-	PROPERTY_ENTRY_U32("pagesize", 4),
-	{ }
-};
-
-static const struct software_node pca9500_eeprom_node = {
-	.properties = pca9500_eeprom_properties,
-};
-
-/**
- * stargate2_reset_bluetooth() reset the bluecore to ensure consistent state
- **/
-static int stargate2_reset_bluetooth(void)
-{
-	int err;
-	err = gpio_request(SG2_BT_RESET, "SG2_BT_RESET");
-	if (err) {
-		printk(KERN_ERR "Could not get gpio for bluetooth reset\n");
-		return err;
-	}
-	gpio_direction_output(SG2_BT_RESET, 1);
-	mdelay(5);
-	/* now reset it - 5 msec minimum */
-	gpio_set_value(SG2_BT_RESET, 0);
-	mdelay(10);
-	gpio_set_value(SG2_BT_RESET, 1);
-	gpio_free(SG2_BT_RESET);
-	return 0;
-}
-
-static struct led_info stargate2_leds[] = {
-	{
-		.name = "sg2:red",
-		.flags = DA9030_LED_RATE_ON,
-	}, {
-		.name = "sg2:blue",
-		.flags = DA9030_LED_RATE_ON,
-	}, {
-		.name = "sg2:green",
-		.flags = DA9030_LED_RATE_ON,
-	},
-};
-
-static struct da903x_subdev_info stargate2_da9030_subdevs[] = {
-	{
-		.name = "da903x-led",
-		.id = DA9030_ID_LED_2,
-		.platform_data = &stargate2_leds[0],
-	}, {
-		.name = "da903x-led",
-		.id = DA9030_ID_LED_3,
-		.platform_data = &stargate2_leds[2],
-	}, {
-		.name = "da903x-led",
-		.id = DA9030_ID_LED_4,
-		.platform_data = &stargate2_leds[1],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO2,
-		.platform_data = &stargate2_ldo_init_data[vcc_bbio],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO3,
-		.platform_data = &stargate2_ldo_init_data[vcc_bb],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO4,
-		.platform_data = &stargate2_ldo_init_data[vcc_pxa_flash],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO5,
-		.platform_data = &stargate2_ldo_init_data[vcc_cc2420],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO6,
-		.platform_data = &stargate2_ldo_init_data[vcc_vref],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO7,
-		.platform_data = &stargate2_ldo_init_data[vcc_sram_ext],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO8,
-		.platform_data = &stargate2_ldo_init_data[vcc_mica],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO9,
-		.platform_data = &stargate2_ldo_init_data[vcc_bt],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO10,
-		.platform_data = &stargate2_ldo_init_data[vcc_sensor_1_8],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO11,
-		.platform_data = &stargate2_ldo_init_data[vcc_sensor_3],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO12,
-		.platform_data = &stargate2_ldo_init_data[vcc_lcd],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO15,
-		.platform_data = &stargate2_ldo_init_data[vcc_pxa_pll],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO17,
-		.platform_data = &stargate2_ldo_init_data[vcc_pxa_usim],
-	}, {
-		.name = "da903x-regulator", /*pxa vcc i/o and cc2420 vcc i/o */
-		.id = DA9030_ID_LDO18,
-		.platform_data = &stargate2_ldo_init_data[vcc_io],
-	}, {
-		.name = "da903x-regulator",
-		.id = DA9030_ID_LDO19,
-		.platform_data = &stargate2_ldo_init_data[vcc_pxa_mem],
-	},
-};
-
-static struct da903x_platform_data stargate2_da9030_pdata = {
-	.num_subdevs = ARRAY_SIZE(stargate2_da9030_subdevs),
-	.subdevs = stargate2_da9030_subdevs,
-};
-
-static struct i2c_board_info __initdata stargate2_pwr_i2c_board_info[] = {
-	{
-		.type = "da9030",
-		.addr = 0x49,
-		.platform_data = &stargate2_da9030_pdata,
-		.irq = PXA_GPIO_TO_IRQ(1),
-	},
-};
-
-static struct i2c_board_info __initdata stargate2_i2c_board_info[] = {
-	/* Techically this a pca9500 - but it's compatible with the 8574
-	 * for gpio expansion and the 24c02 for eeprom access.
-	 */
-	{
-		.type = "pcf8574",
-		.addr =  0x27,
-		.platform_data = &platform_data_pcf857x,
-	}, {
-		.type = "24c02",
-		.addr = 0x57,
-		.swnode = &pca9500_eeprom_node,
-	}, {
-		.type = "max1238",
-		.addr = 0x35,
-	}, { /* ITS400 Sensor board only */
-		.type = "max1363",
-		.addr = 0x34,
-		/* Through a nand gate - Also beware, on V2 sensor board the
-		 * pull up resistors are missing.
-		 */
-		.irq = PXA_GPIO_TO_IRQ(99),
-	}, { /* ITS400 Sensor board only */
-		.type = "tsl2561",
-		.addr = 0x49,
-		/* Through a nand gate - Also beware, on V2 sensor board the
-		 * pull up resistors are missing.
-		 */
-		.irq = PXA_GPIO_TO_IRQ(99),
-	}, { /* ITS400 Sensor board only */
-		.type = "tmp175",
-		.addr = 0x4A,
-		.irq = PXA_GPIO_TO_IRQ(96),
-	},
-};
-
-/* Board doesn't support cable detection - so always lie and say
- * something is there.
- */
-static int sg2_udc_detect(void)
-{
-	return 1;
-}
-
-static struct pxa2xx_udc_mach_info stargate2_udc_info __initdata = {
-	.udc_is_connected	= sg2_udc_detect,
-	.udc_command		= sg2_udc_command,
-};
-
-static struct platform_device *stargate2_devices[] = {
-	&stargate2_flash_device,
-	&stargate2_sram,
-	&smc91x_device,
-	&sht15,
-};
-
-static void __init stargate2_init(void)
-{
-	/* This is probably a board specific hack as this must be set
-	   prior to connecting the MFP stuff up. */
-	__raw_writel(__raw_readl(MECR) & ~MECR_NOS, MECR);
-
-	pxa2xx_mfp_config(ARRAY_AND_SIZE(stargate2_pin_config));
-
-	imote2_stargate2_init();
-
-	gpiod_add_lookup_table(&sht15_gpiod_table);
-	platform_add_devices(ARRAY_AND_SIZE(stargate2_devices));
-
-	i2c_register_board_info(0, ARRAY_AND_SIZE(stargate2_i2c_board_info));
-	i2c_register_board_info(1, stargate2_pwr_i2c_board_info,
-				ARRAY_SIZE(stargate2_pwr_i2c_board_info));
-
-	pxa_set_mci_info(&stargate2_mci_platform_data);
-
-	pxa_set_udc_info(&stargate2_udc_info);
-
-	stargate2_reset_bluetooth();
-}
-#endif
-
-#ifdef CONFIG_MACH_INTELMOTE2
-MACHINE_START(INTELMOTE2, "IMOTE 2")
-	.map_io		= pxa27x_map_io,
-	.nr_irqs	= PXA_NR_IRQS,
-	.init_irq	= pxa27x_init_irq,
-	.handle_irq	= pxa27x_handle_irq,
-	.init_time	= pxa_timer_init,
-	.init_machine	= imote2_init,
-	.atag_offset	= 0x100,
-	.restart	= pxa_restart,
-MACHINE_END
-#endif
-
-#ifdef CONFIG_MACH_STARGATE2
-MACHINE_START(STARGATE2, "Stargate 2")
-	.map_io = pxa27x_map_io,
-	.nr_irqs = STARGATE_NR_IRQS,
-	.init_irq = pxa27x_init_irq,
-	.handle_irq = pxa27x_handle_irq,
-	.init_time	= pxa_timer_init,
-	.init_machine = stargate2_init,
-	.atag_offset = 0x100,
-	.restart	= pxa_restart,
-MACHINE_END
-#endif
diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index ab53eab635f6..2ce261cfff8e 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -210,7 +210,7 @@ config PCMCIA_PXA2XX
 	depends on ARM && ARCH_PXA && PCMCIA
 	depends on (ARCH_LUBBOCK || MACH_MAINSTONE || PXA_SHARPSL \
 		    || ARCH_PXA_PALM || TRIZEPS_PCMCIA \
-		    || ARCOM_PCMCIA || ARCH_PXA_ESERIES || MACH_STARGATE2 \
+		    || ARCOM_PCMCIA || ARCH_PXA_ESERIES \
 		    || MACH_VPAC270 || MACH_BALLOON3 || MACH_COLIBRI \
 		    || MACH_COLIBRI320 || MACH_H4700)
 	select PCMCIA_SOC_COMMON
diff --git a/drivers/pcmcia/Makefile b/drivers/pcmcia/Makefile
index 2d5657cfc49c..c43267b18f55 100644
--- a/drivers/pcmcia/Makefile
+++ b/drivers/pcmcia/Makefile
@@ -56,7 +56,6 @@ pxa2xx-obj-$(CONFIG_MACH_PALMTX)		+= pxa2xx_palmtx.o
 pxa2xx-obj-$(CONFIG_MACH_PALMTC)		+= pxa2xx_palmtc.o
 pxa2xx-obj-$(CONFIG_MACH_PALMLD)		+= pxa2xx_palmld.o
 pxa2xx-obj-$(CONFIG_MACH_E740)			+= pxa2xx_e740.o
-pxa2xx-obj-$(CONFIG_MACH_STARGATE2)		+= pxa2xx_stargate2.o
 pxa2xx-obj-$(CONFIG_MACH_VPAC270)		+= pxa2xx_vpac270.o
 pxa2xx-obj-$(CONFIG_MACH_BALLOON3)		+= pxa2xx_balloon3.o
 pxa2xx-obj-$(CONFIG_MACH_COLIBRI)		+= pxa2xx_colibri.o
diff --git a/drivers/pcmcia/pxa2xx_stargate2.c b/drivers/pcmcia/pxa2xx_stargate2.c
deleted file mode 100644
index 6efb7f814b4a..000000000000
--- a/drivers/pcmcia/pxa2xx_stargate2.c
+++ /dev/null
@@ -1,137 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * linux/drivers/pcmcia/pxa2xx_stargate2.c
- *
- * Stargate 2 PCMCIA specific routines.
- *
- * Created:	December 6, 2005
- * Author:	Ed C. Epp
- * Copyright:	Intel Corp 2005
- *              Jonathan Cameron <jic23@cam.ac.uk> 2009
- */
-
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/interrupt.h>
-#include <linux/delay.h>
-#include <linux/platform_device.h>
-#include <linux/gpio.h>
-
-#include <pcmcia/ss.h>
-
-#include <asm/irq.h>
-#include <asm/mach-types.h>
-
-#include "soc_common.h"
-
-#define SG2_S0_POWER_CTL	108
-#define SG2_S0_GPIO_RESET	82
-#define SG2_S0_GPIO_DETECT	53
-#define SG2_S0_GPIO_READY	81
-
-static struct gpio sg2_pcmcia_gpios[] = {
-	{ SG2_S0_GPIO_RESET, GPIOF_OUT_INIT_HIGH, "PCMCIA Reset" },
-	{ SG2_S0_POWER_CTL, GPIOF_OUT_INIT_HIGH, "PCMCIA Power Ctrl" },
-};
-
-static int sg2_pcmcia_hw_init(struct soc_pcmcia_socket *skt)
-{
-	skt->stat[SOC_STAT_CD].gpio = SG2_S0_GPIO_DETECT;
-	skt->stat[SOC_STAT_CD].name = "PCMCIA0 CD";
-	skt->stat[SOC_STAT_RDY].gpio = SG2_S0_GPIO_READY;
-	skt->stat[SOC_STAT_RDY].name = "PCMCIA0 RDY";
-	return 0;
-}
-
-static void sg2_pcmcia_socket_state(struct soc_pcmcia_socket *skt,
-				    struct pcmcia_state *state)
-{
-	state->bvd1   = 0; /* not available - battery detect on card */
-	state->bvd2   = 0; /* not available */
-	state->vs_3v  = 1; /* not available - voltage detect for card */
-	state->vs_Xv  = 0; /* not available */
-}
-
-static int sg2_pcmcia_configure_socket(struct soc_pcmcia_socket *skt,
-				       const socket_state_t *state)
-{
-	/* Enable card power */
-	switch (state->Vcc) {
-	case 0:
-		/* sets power ctl register high */
-		gpio_set_value(SG2_S0_POWER_CTL, 1);
-		break;
-	case 33:
-	case 50:
-		/* sets power control register low (clear) */
-		gpio_set_value(SG2_S0_POWER_CTL, 0);
-		msleep(100);
-		break;
-	default:
-		pr_err("%s(): bad Vcc %u\n",
-		       __func__, state->Vcc);
-		return -1;
-	}
-
-	/* reset */
-	gpio_set_value(SG2_S0_GPIO_RESET, !!(state->flags & SS_RESET));
-
-	return 0;
-}
-
-static struct pcmcia_low_level sg2_pcmcia_ops __initdata = {
-	.owner			= THIS_MODULE,
-	.hw_init		= sg2_pcmcia_hw_init,
-	.socket_state		= sg2_pcmcia_socket_state,
-	.configure_socket	= sg2_pcmcia_configure_socket,
-	.nr			= 1,
-};
-
-static struct platform_device *sg2_pcmcia_device;
-
-static int __init sg2_pcmcia_init(void)
-{
-	int ret;
-
-	if (!machine_is_stargate2())
-		return -ENODEV;
-
-	sg2_pcmcia_device = platform_device_alloc("pxa2xx-pcmcia", -1);
-	if (!sg2_pcmcia_device)
-		return -ENOMEM;
-
-	ret = gpio_request_array(sg2_pcmcia_gpios, ARRAY_SIZE(sg2_pcmcia_gpios));
-	if (ret)
-		goto error_put_platform_device;
-
-	ret = platform_device_add_data(sg2_pcmcia_device,
-				       &sg2_pcmcia_ops,
-				       sizeof(sg2_pcmcia_ops));
-	if (ret)
-		goto error_free_gpios;
-
-	ret = platform_device_add(sg2_pcmcia_device);
-	if (ret)
-		goto error_free_gpios;
-
-	return 0;
-error_free_gpios:
-	gpio_free_array(sg2_pcmcia_gpios, ARRAY_SIZE(sg2_pcmcia_gpios));
-error_put_platform_device:
-	platform_device_put(sg2_pcmcia_device);
-
-	return ret;
-}
-
-static void __exit sg2_pcmcia_exit(void)
-{
-	platform_device_unregister(sg2_pcmcia_device);
-	gpio_free_array(sg2_pcmcia_gpios, ARRAY_SIZE(sg2_pcmcia_gpios));
-}
-
-fs_initcall(sg2_pcmcia_init);
-module_exit(sg2_pcmcia_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:pxa2xx-pcmcia");
diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index 9d40e8a206d1..cecbec2a09d7 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -220,15 +220,6 @@ config SND_PXA2XX_SOC_MIOA701
 	  Say Y if you want to add support for SoC audio on the
 	  MIO A701.
 
-config SND_PXA2XX_SOC_IMOTE2
-	tristate "SoC Audio support for IMote 2"
-	depends on SND_PXA2XX_SOC && MACH_INTELMOTE2 && I2C
-	select SND_PXA2XX_SOC_I2S
-	select SND_SOC_WM8940
-	help
-	  Say Y if you want to add support for SoC audio on the
-	  IMote 2.
-
 config SND_MMP_SOC_BROWNSTONE
 	tristate "SoC Audio support for Marvell Brownstone"
 	depends on SND_MMP_SOC_SSPA && MACH_BROWNSTONE && I2C
diff --git a/sound/soc/pxa/Makefile b/sound/soc/pxa/Makefile
index ea4929d73318..b712eb894a61 100644
--- a/sound/soc/pxa/Makefile
+++ b/sound/soc/pxa/Makefile
@@ -29,7 +29,6 @@ snd-soc-hx4700-objs := hx4700.o
 snd-soc-magician-objs := magician.o
 snd-soc-mioa701-objs := mioa701_wm9713.o
 snd-soc-z2-objs := z2.o
-snd-soc-imote2-objs := imote2.o
 snd-soc-brownstone-objs := brownstone.o
 snd-soc-ttc-dkb-objs := ttc-dkb.o
 
@@ -47,6 +46,5 @@ obj-$(CONFIG_SND_PXA2XX_SOC_MAGICIAN) += snd-soc-magician.o
 obj-$(CONFIG_SND_PXA2XX_SOC_MIOA701) += snd-soc-mioa701.o
 obj-$(CONFIG_SND_PXA2XX_SOC_Z2) += snd-soc-z2.o
 obj-$(CONFIG_SND_SOC_ZYLONITE) += snd-soc-zylonite.o
-obj-$(CONFIG_SND_PXA2XX_SOC_IMOTE2) += snd-soc-imote2.o
 obj-$(CONFIG_SND_MMP_SOC_BROWNSTONE) += snd-soc-brownstone.o
 obj-$(CONFIG_SND_SOC_TTC_DKB) += snd-soc-ttc-dkb.o
diff --git a/sound/soc/pxa/imote2.c b/sound/soc/pxa/imote2.c
deleted file mode 100644
index a575676508b3..000000000000
--- a/sound/soc/pxa/imote2.c
+++ /dev/null
@@ -1,99 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-#include <linux/module.h>
-#include <sound/soc.h>
-
-#include <asm/mach-types.h>
-
-#include "../codecs/wm8940.h"
-#include "pxa2xx-i2s.h"
-
-static int imote2_asoc_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	unsigned int clk = 0;
-	int ret;
-
-	switch (params_rate(params)) {
-	case 8000:
-	case 16000:
-	case 48000:
-	case 96000:
-		clk = 12288000;
-		break;
-	case 11025:
-	case 22050:
-	case 44100:
-		clk = 11289600;
-		break;
-	}
-
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, clk,
-				     SND_SOC_CLOCK_IN);
-	if (ret < 0)
-		return ret;
-
-	/* set the I2S system clock as input (unused) */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, clk,
-		SND_SOC_CLOCK_OUT);
-
-	return ret;
-}
-
-static const struct snd_soc_ops imote2_asoc_ops = {
-	.hw_params = imote2_asoc_hw_params,
-};
-
-SND_SOC_DAILINK_DEFS(wm8940,
-	DAILINK_COMP_ARRAY(COMP_CPU("pxa2xx-i2s")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("wm8940-codec.0-0034",
-				      "wm8940-hifi")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("pxa-pcm-audio")));
-
-static struct snd_soc_dai_link imote2_dai = {
-	.name = "WM8940",
-	.stream_name = "WM8940",
-	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
-	.ops = &imote2_asoc_ops,
-	SND_SOC_DAILINK_REG(wm8940),
-};
-
-static struct snd_soc_card imote2 = {
-	.name = "Imote2",
-	.owner = THIS_MODULE,
-	.dai_link = &imote2_dai,
-	.num_links = 1,
-};
-
-static int imote2_probe(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = &imote2;
-	int ret;
-
-	card->dev = &pdev->dev;
-
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
-			ret);
-	return ret;
-}
-
-static struct platform_driver imote2_driver = {
-	.driver		= {
-		.name	= "imote2-audio",
-		.pm     = &snd_soc_pm_ops,
-	},
-	.probe		= imote2_probe,
-};
-
-module_platform_driver(imote2_driver);
-
-MODULE_AUTHOR("Jonathan Cameron");
-MODULE_DESCRIPTION("ALSA SoC Imote 2");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:imote2-audio");
-- 
2.35.1

