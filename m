Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66D9C433E0
	for <soc@archiver.kernel.org>; Wed, 20 Jan 2021 12:48:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6161923383; Wed, 20 Jan 2021 12:48:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AC3A23381;
	Wed, 20 Jan 2021 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611146929;
	bh=BWyv/u7vwlOEx4k7nYHY2DCVRTpFdi7p6xzsWlNF87Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KW7dK1jumBIReL+LgPdnfG1xv64plTaR9D0i450ktpQwktP2lwamswOyux2Oj9znY
	 dvFWwtgtA3XOLUkvZrvgy8G7DWv1bpWZ0cVrXGRxIX21x+DvTDKo4gVeEH3rUWekX/
	 YOKClnysTB4uExfbuBEx6TMuVB/QjMFIpa7DvzCT4hKVthm5sfE7jfO6GaA024qpPy
	 Hn4xxSi6FbCaBTLQ6iGBrb2ht3fqrX06+UlBr/JjTzGkyGP2xAny0vXXZRQda6ewaL
	 UCSTmDgflsBto43Mpc1qw3mYXzq0RwTphT5D/yjS8DRQE0rk9KHucj1bx9vvKJaVpM
	 dbfCTW8nDu9oQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/5] ARM: remove u300 platform
Date: Wed, 20 Jan 2021 13:48:12 +0100
Message-Id: <20210120124812.2800027-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120124812.2800027-1-arnd@kernel.org>
References: <20210120124812.2800027-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The Ericsson U300 platform was one of two ARM929 based SoC platforms for
mobile phones in ST-Ericsson after the merger of Ericsson with ST-NXP
into ST-Ericsson, the other one being the ST Nomadik.

The platform was not widely adopted in Linux based systems and was
replaced with the far superior ST-Ericsson U8500 in 2011, but Linus
Walleij kept maintaining the code for the whole time.

Linus continues to use the Nomadik machine, but decided to drop
u300 from the kernel as part of this year's spring cleaning.
Thanks for having maintained it all these years.

Cc: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/lkml/CACRpkdbJkiHR9FSfJTH_5d_qRU1__dRXHM1TL40iqNRKbGQfrQ@mail.gmail.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../devicetree/bindings/arm/ste-u300.txt      |  46 --
 MAINTAINERS                                   |  14 +-
 arch/arm/Kconfig                              |   2 -
 arch/arm/Kconfig.debug                        |  10 -
 arch/arm/Makefile                             |   1 -
 arch/arm/boot/dts/Makefile                    |   2 -
 arch/arm/boot/dts/ste-u300.dts                | 464 ------------------
 arch/arm/configs/u300_defconfig               |  65 ---
 arch/arm/mach-u300/Kconfig                    |  32 --
 arch/arm/mach-u300/Makefile                   |   8 -
 arch/arm/mach-u300/core.c                     | 413 ----------------
 arch/arm/mach-u300/regulator.c                | 134 -----
 drivers/mtd/nand/raw/Kconfig                  |   3 +-
 drivers/spi/Kconfig                           |   1 -
 14 files changed, 2 insertions(+), 1193 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/ste-u300.txt
 delete mode 100644 arch/arm/boot/dts/ste-u300.dts
 delete mode 100644 arch/arm/configs/u300_defconfig
 delete mode 100644 arch/arm/mach-u300/Kconfig
 delete mode 100644 arch/arm/mach-u300/Makefile
 delete mode 100644 arch/arm/mach-u300/core.c
 delete mode 100644 arch/arm/mach-u300/regulator.c

diff --git a/Documentation/devicetree/bindings/arm/ste-u300.txt b/Documentation/devicetree/bindings/arm/ste-u300.txt
deleted file mode 100644
index d11d80006a19..000000000000
diff --git a/MAINTAINERS b/MAINTAINERS
index bb2a153f76d7..908e03f0ed3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2136,7 +2136,7 @@ ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
 M:	Michael Petchkovsky <mkpetch@internode.on.net>
 S:	Maintained
 
-ARM/NOMADIK/U300/Ux500 ARCHITECTURES
+ARM/NOMADIK/Ux500 ARCHITECTURES
 M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -2145,35 +2145,23 @@ F:	Documentation/devicetree/bindings/arm/ste-*
 F:	Documentation/devicetree/bindings/arm/ux500.yaml
 F:	Documentation/devicetree/bindings/arm/ux500/
 F:	Documentation/devicetree/bindings/i2c/i2c-nomadik.txt
-F:	Documentation/devicetree/bindings/i2c/i2c-stu300.txt
 F:	arch/arm/boot/dts/ste-*
 F:	arch/arm/mach-nomadik/
-F:	arch/arm/mach-u300/
 F:	arch/arm/mach-ux500/
 F:	drivers/clk/clk-nomadik.c
-F:	drivers/clk/clk-u300.c
 F:	drivers/clocksource/clksrc-dbx500-prcmu.c
-F:	drivers/clocksource/timer-u300.c
-F:	drivers/dma/coh901318*
 F:	drivers/dma/ste_dma40*
 F:	drivers/hwspinlock/u8500_hsem.c
 F:	drivers/i2c/busses/i2c-nomadik.c
-F:	drivers/i2c/busses/i2c-stu300.c
 F:	drivers/iio/adc/ab8500-gpadc.c
-F:	drivers/mfd/ab3100*
 F:	drivers/mfd/ab8500*
 F:	drivers/mfd/abx500*
 F:	drivers/mfd/db8500*
 F:	drivers/mfd/dbx500*
 F:	drivers/pinctrl/nomadik/
-F:	drivers/pinctrl/pinctrl-coh901*
-F:	drivers/pinctrl/pinctrl-u300.c
-F:	drivers/rtc/rtc-ab3100.c
 F:	drivers/rtc/rtc-ab8500.c
-F:	drivers/rtc/rtc-coh901331.c
 F:	drivers/rtc/rtc-pl031.c
 F:	drivers/soc/ux500/
-F:	drivers/watchdog/coh901327_wdt.c
 
 ARM/NUVOTON NPCM ARCHITECTURE
 M:	Avi Fishman <avifishman70@gmail.com>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 70d6bfbcd164..6c423ee402ae 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -704,8 +704,6 @@ source "arch/arm/mach-sunxi/Kconfig"
 
 source "arch/arm/mach-tegra/Kconfig"
 
-source "arch/arm/mach-u300/Kconfig"
-
 source "arch/arm/mach-uniphier/Kconfig"
 
 source "arch/arm/mach-ux500/Kconfig"
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 543e29068c08..c36c5d4c6e9c 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1280,14 +1280,6 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  on Tegra based platforms.
 
-	config DEBUG_U300_UART
-		bool "Kernel low-level debugging messages via U300 UART0"
-		depends on ARCH_U300
-		select DEBUG_UART_PL01X
-		help
-		  Say Y here if you want the debug print routines to direct
-		  their output to the uart port on U300 devices.
-
 	config DEBUG_UX500_UART
 		depends on ARCH_U8500
 		bool "Use Ux500 UART for low-level debug"
@@ -1650,7 +1642,6 @@ config DEBUG_UART_PHYS
 	default 0x808c0000 if DEBUG_EP93XX || ARCH_EP93XX
 	default 0x90020000 if DEBUG_NSPIRE_CLASSIC_UART || DEBUG_NSPIRE_CX_UART
 	default 0xb0090000 if DEBUG_VEXPRESS_UART0_CRX
-	default 0xc0013000 if DEBUG_U300_UART
 	default 0xc8000000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
 	default 0xc8000003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
 	default 0xd0000000 if DEBUG_SPEAR3XX
@@ -1804,7 +1795,6 @@ config DEBUG_UART_VIRT
 	default 0xfefb0000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
 	default 0xfefb0800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
 	default 0xfefb9800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
-	default 0xff003000 if DEBUG_U300_UART
 	default 0xffd01000 if DEBUG_HIP01_UART
 	default DEBUG_UART_PHYS if !MMU
 	depends on DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 1291fdc869f2..5887de173fc9 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -214,7 +214,6 @@ machine-$(CONFIG_ARCH_STI)		+= sti
 machine-$(CONFIG_ARCH_STM32)		+= stm32
 machine-$(CONFIG_ARCH_SUNXI)		+= sunxi
 machine-$(CONFIG_ARCH_TEGRA)		+= tegra
-machine-$(CONFIG_ARCH_U300)		+= u300
 machine-$(CONFIG_ARCH_U8500)		+= ux500
 machine-$(CONFIG_ARCH_VERSATILE)	+= versatile
 machine-$(CONFIG_ARCH_VEXPRESS)		+= vexpress
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a13112f8730c..6d8abff55238 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1255,8 +1255,6 @@ dtb-$(CONFIG_ARCH_TEGRA_124_SOC) += \
 	tegra124-nyan-big.dtb \
 	tegra124-nyan-blaze.dtb \
 	tegra124-venice2.dtb
-dtb-$(CONFIG_ARCH_U300) += \
-	ste-u300.dtb
 dtb-$(CONFIG_ARCH_U8500) += \
 	ste-snowball.dtb \
 	ste-hrefprev60-stuib.dtb \
diff --git a/arch/arm/boot/dts/ste-u300.dts b/arch/arm/boot/dts/ste-u300.dts
deleted file mode 100644
index f4e7660fead7..000000000000
diff --git a/arch/arm/configs/u300_defconfig b/arch/arm/configs/u300_defconfig
deleted file mode 100644
index 543f07338100..000000000000
diff --git a/arch/arm/mach-u300/Kconfig b/arch/arm/mach-u300/Kconfig
deleted file mode 100644
index c3c8bf54f033..000000000000
diff --git a/arch/arm/mach-u300/Makefile b/arch/arm/mach-u300/Makefile
deleted file mode 100644
index 67f71ae45dfc..000000000000
diff --git a/arch/arm/mach-u300/core.c b/arch/arm/mach-u300/core.c
deleted file mode 100644
index a1694d977ec9..000000000000
diff --git a/arch/arm/mach-u300/regulator.c b/arch/arm/mach-u300/regulator.c
deleted file mode 100644
index c0cc1d82e1b9..000000000000
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 442a039b92f3..4b84fd36e384 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -331,8 +331,7 @@ source "drivers/mtd/nand/raw/ingenic/Kconfig"
 config MTD_NAND_FSMC
 	tristate "ST Micros FSMC NAND controller"
 	depends on OF && HAS_IOMEM
-	depends on PLAT_SPEAR || ARCH_NOMADIK || ARCH_U8500 || MACH_U300 || \
-		   COMPILE_TEST
+	depends on PLAT_SPEAR || ARCH_NOMADIK || ARCH_U8500 || COMPILE_TEST
 	help
 	  Enables support for NAND Flash chips on the ST Microelectronics
 	  Flexible Static Memory Controller (FSMC)
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index aadaea052f51..74ea73a05981 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -601,7 +601,6 @@ config SPI_PIC32_SQI
 config SPI_PL022
 	tristate "ARM AMBA PL022 SSP controller"
 	depends on ARM_AMBA
-	default y if MACH_U300
 	default y if ARCH_REALVIEW
 	default y if INTEGRATOR_IMPD1
 	default y if ARCH_VERSATILE
-- 
2.29.2

