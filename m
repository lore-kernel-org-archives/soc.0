Return-Path: <SRS0=0ZpT=GX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42710C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 12:50:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D602923340
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 12:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D602923340
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gVowmczNdY+isLAWND5Cek2W8GK78e5Y922FMon+1p4=; b=kyn5ub4V7KrnCzqIrBG7s+xvZ
	RqDNSz68GP/9KZiCdrfj7ZcMCqVys3thrvbD3Vg+x60PyokKgWB6Pt82qhcOoLEdwku3EkdoUaP90
	H6N90NKiHSIQgKb/W+RhXf4XQ41A317sxe6XYtgB3iZLn9QroOve30A3SO4R5VA3vcume80Cv2UAh
	49rLjOSH7n6NG1+/BSCIuWq7D9guTeTl+SsMkJM3g80g/OavF7mMNBsBgOFIQ3yJC3iroZrCRfzbD
	+YxvqUzRWhVxErs73SLqIFPv3oya+VMbFARq2/h0msSpDc45NVn1pXqHN8ZOR+5mR+5Dvnt5nQ098
	G2cj+5f7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Cuj-0002D1-W8; Wed, 20 Jan 2021 12:48:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Cuf-0002BW-K2
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Jan 2021 12:48:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1EFC2336D;
 Wed, 20 Jan 2021 12:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611146920;
 bh=ClLWbeiD8d9T54L86cDfKFNCd1yqeq4mnSEVdHCmKL0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BvtUdvOIcQ28YH2Z6JGj620/DmVahnRIU+VBHoW20AnTUlZSI6Xzi+6knPxNv8fiS
 VwOWONNEO+iZ6+3RogV54XmmmbfvVYZQyIdUsGWbHpnCEGYk7LdYA9qvRwAFdKoOjZ
 8yGSTzl8dMcp9uVgL2yogdYGzp+5+yx1Tkr9nsNVRRVse740n4BWufL8Op0oiE+rxN
 akzCXrgwFiQL2x+wbychIq3fV1hjBg5FeMNIFfGGiX/8fupSRmNkfu/b3AVNoNNmqj
 ve6sFPdc7u4gYlb+VW6fGiwuG+bar+4FZhKVtWkYGGTMCmv4bIg+a6B9m/+u1GObia
 EbIrQF1xpfiPA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 soc@kernel.org
Subject: [PATCH 2/5] ARM: remove sirf prima2/atlas platforms
Date: Wed, 20 Jan 2021 13:48:09 +0100
Message-ID: <20210120124812.2800027-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120124812.2800027-1-arnd@kernel.org>
References: <20210120124812.2800027-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_074841_830262_DA55A710 
X-CRM114-Status: GOOD (  19.12  )
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
Cc: Barry Song <baohua@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210120124809.Lwa5v7TCWP0QBZaAaACnWFhU0vJmTUbzg5xvifIL-Ls@z>

From: Arnd Bergmann <arnd@arndb.de>

The SiRF Prima2 and Atlas platform code was contributed by Cambridge
Silicon Radio (CSR) after aquiring the original SiRF company, and
maintained by Barry Song. CSR was subsequently acquired by Qualcomm,
who no longer have an interest in maintaining the SoC platform but
instead have released more recent SoCs for the same market in the
Snapdragon family.

As Barry is no longer working for the company, nobody else there
wants to maintain it, and there are no third-party users, the
best way forward seems to be to completely remove it.

Thanks to Barry for maintaining the platform for the past ten years.

Cc: Barry Song <baohua@kernel.org>
Link: https://lore.kernel.org/lkml/c969392572604b98bcb3be44048c3165@hisilicon.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../devicetree/bindings/arm/sirf.yaml         |   30 -
 .../devicetree/bindings/reset/sirf,rstc.txt   |   42 -
 MAINTAINERS                                   |   13 -
 arch/arm/Kconfig                              |    2 -
 arch/arm/Kconfig.debug                        |   41 +-
 arch/arm/Makefile                             |    1 -
 arch/arm/boot/dts/Makefile                    |    6 -
 arch/arm/boot/dts/atlas6-evb.dts              |   78 -
 arch/arm/boot/dts/atlas6.dtsi                 |  800 -------
 arch/arm/boot/dts/atlas7-evb.dts              |  127 --
 arch/arm/boot/dts/atlas7.dtsi                 | 1955 -----------------
 arch/arm/boot/dts/prima2-evb.dts              |   37 -
 arch/arm/boot/dts/prima2.dtsi                 |  838 -------
 arch/arm/configs/prima2_defconfig             |   72 -
 arch/arm/include/debug/sirf.S                 |   40 -
 arch/arm/mach-prima2/Kconfig                  |   48 -
 arch/arm/mach-prima2/Makefile                 |    9 -
 arch/arm/mach-prima2/common.c                 |   64 -
 arch/arm/mach-prima2/common.h                 |   32 -
 arch/arm/mach-prima2/headsmp.S                |   36 -
 arch/arm/mach-prima2/hotplug.c                |   38 -
 arch/arm/mach-prima2/platsmp.c                |  123 --
 arch/arm/mach-prima2/pm.c                     |  153 --
 arch/arm/mach-prima2/pm.h                     |   28 -
 arch/arm/mach-prima2/rstc.c                   |  107 -
 arch/arm/mach-prima2/rtciobrg.c               |  179 --
 arch/arm/mach-prima2/sleep.S                  |   63 -
 27 files changed, 2 insertions(+), 4960 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/sirf.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/sirf,rstc.txt
 delete mode 100644 arch/arm/boot/dts/atlas6-evb.dts
 delete mode 100644 arch/arm/boot/dts/atlas6.dtsi
 delete mode 100644 arch/arm/boot/dts/atlas7-evb.dts
 delete mode 100644 arch/arm/boot/dts/atlas7.dtsi
 delete mode 100644 arch/arm/boot/dts/prima2-evb.dts
 delete mode 100644 arch/arm/boot/dts/prima2.dtsi
 delete mode 100644 arch/arm/configs/prima2_defconfig
 delete mode 100644 arch/arm/include/debug/sirf.S
 delete mode 100644 arch/arm/mach-prima2/Kconfig
 delete mode 100644 arch/arm/mach-prima2/Makefile
 delete mode 100644 arch/arm/mach-prima2/common.c
 delete mode 100644 arch/arm/mach-prima2/common.h
 delete mode 100644 arch/arm/mach-prima2/headsmp.S
 delete mode 100644 arch/arm/mach-prima2/hotplug.c
 delete mode 100644 arch/arm/mach-prima2/platsmp.c
 delete mode 100644 arch/arm/mach-prima2/pm.c
 delete mode 100644 arch/arm/mach-prima2/pm.h
 delete mode 100644 arch/arm/mach-prima2/rstc.c
 delete mode 100644 arch/arm/mach-prima2/rtciobrg.c
 delete mode 100644 arch/arm/mach-prima2/sleep.S

diff --git a/Documentation/devicetree/bindings/arm/sirf.yaml b/Documentation/devicetree/bindings/arm/sirf.yaml
deleted file mode 100644
index b25eb35d1b66..000000000000
diff --git a/Documentation/devicetree/bindings/reset/sirf,rstc.txt b/Documentation/devicetree/bindings/reset/sirf,rstc.txt
deleted file mode 100644
index 0505de742d30..000000000000
diff --git a/MAINTAINERS b/MAINTAINERS
index 7c3eadb185f9..aeef69cbc7ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1779,19 +1779,6 @@ F:	drivers/net/ethernet/cortina/
 F:	drivers/pinctrl/pinctrl-gemini.c
 F:	drivers/rtc/rtc-ftrtc010.c
 
-ARM/CSR SIRFPRIMA2 MACHINE SUPPORT
-M:	Barry Song <baohua@kernel.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git
-F:	arch/arm/boot/dts/prima2*
-F:	arch/arm/mach-prima2/
-F:	drivers/clk/sirf/
-F:	drivers/clocksource/timer-atlas7.c
-F:	drivers/clocksource/timer-prima2.c
-X:	drivers/gnss
-N:	[^a-z]sirf
-
 ARM/CZ.NIC TURRIS MOX SUPPORT
 M:	Marek Behun <marek.behun@nic.cz>
 S:	Maintained
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 96f153c5639b..9d9a7060d365 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -671,8 +671,6 @@ source "arch/arm/mach-orion5x/Kconfig"
 
 source "arch/arm/mach-oxnas/Kconfig"
 
-source "arch/arm/mach-prima2/Kconfig"
-
 source "arch/arm/mach-pxa/Kconfig"
 source "arch/arm/plat-pxa/Kconfig"
 
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 23264f7bff72..fe8b95069d31 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1142,32 +1142,6 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  on Allwinner A31/A23 based platforms on the R_UART.
 
-	config DEBUG_SIRFPRIMA2_UART1
-		bool "Kernel low-level debugging messages via SiRFprimaII UART1"
-		depends on ARCH_PRIMA2
-		select DEBUG_SIRFSOC_UART
-		help
-		  Say Y here if you want the debug print routines to direct
-		  their output to the uart1 port on SiRFprimaII devices.
-
-	config DEBUG_SIRFATLAS7_UART0
-		bool "Kernel low-level debugging messages via SiRFatlas7 UART0"
-		depends on ARCH_ATLAS7
-		select DEBUG_SIRFSOC_UART
-		help
-		  Say Y here if you want the debug print routines to direct
-		  their output to the uart0 port on SiRFATLAS7 devices.The uart0
-		  is used on SiRFATLAS7 as a extra debug port.sometimes an extra
-		  debug port can be very useful.
-
-	config DEBUG_SIRFATLAS7_UART1
-		bool "Kernel low-level debugging messages via SiRFatlas7 UART1"
-		depends on ARCH_ATLAS7
-		select DEBUG_SIRFSOC_UART
-		help
-		  Say Y here if you want the debug print routines to direct
-		  their output to the uart1 port on SiRFATLAS7 devices.
-
 	config DEBUG_SPEAR3XX
 		bool "Kernel low-level debugging messages via ST SPEAr 3xx/6xx UART"
 		depends on ARCH_SPEAR3XX || ARCH_SPEAR6XX
@@ -1538,10 +1512,6 @@ config DEBUG_STM32_UART
 	bool
 	depends on ARCH_STM32
 
-config DEBUG_SIRFSOC_UART
-	bool
-	depends on ARCH_SIRF
-
 config DEBUG_UART_FLOW_CONTROL
 	bool "Enable flow control (CTS) for the debug UART"
 	depends on DEBUG_LL
@@ -1596,7 +1566,6 @@ config DEBUG_LL_INCLUDE
 	default "debug/renesas-scif.S" if DEBUG_RMOBILE_SCIFA4
 	default "debug/s3c24xx.S" if DEBUG_S3C24XX_UART || DEBUG_S3C64XX_UART
 	default "debug/s5pv210.S" if DEBUG_S5PV210_UART
-	default "debug/sirf.S" if DEBUG_SIRFSOC_UART
 	default "debug/sti.S" if DEBUG_STI_UART
 	default "debug/stm32.S" if DEBUG_STM32_UART
 	default "debug/tegra.S" if DEBUG_TEGRA_UART
@@ -1648,8 +1617,6 @@ config DEBUG_UART_PHYS
 	default 0x1600d000 if DEBUG_SD5203_UART
 	default 0x18000300 if DEBUG_BCM_5301X
 	default 0x18000400 if DEBUG_BCM_HR2
-	default 0x18010000 if DEBUG_SIRFATLAS7_UART0
-	default 0x18020000 if DEBUG_SIRFATLAS7_UART1
 	default 0x18023000 if DEBUG_BCM_IPROC_UART3
 	default 0x1c090000 if DEBUG_VEXPRESS_UART0_RS1
 	default 0x20001000 if DEBUG_HIP01_UART
@@ -1695,7 +1662,6 @@ config DEBUG_UART_PHYS
 	default 0x80074000 if DEBUG_IMX28_UART
 	default 0x808c0000 if DEBUG_EP93XX || ARCH_EP93XX
 	default 0x90020000 if DEBUG_NSPIRE_CLASSIC_UART || DEBUG_NSPIRE_CX_UART
-	default 0xb0060000 if DEBUG_SIRFPRIMA2_UART1
 	default 0xb0090000 if DEBUG_VEXPRESS_UART0_CRX
 	default 0xc0013000 if DEBUG_U300_UART
 	default 0xc8000000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
@@ -1754,7 +1720,7 @@ config DEBUG_UART_PHYS
 		DEBUG_RMOBILE_SCIFA4 || DEBUG_S3C24XX_UART || \
 		DEBUG_S3C64XX_UART || \
 		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
-		DEBUG_SIRFSOC_UART || DEBUG_DIGICOLOR_UA0 || \
+		DEBUG_DIGICOLOR_UA0 || \
 		DEBUG_AT91_UART || DEBUG_STM32_UART
 
 config DEBUG_UART_VIRT
@@ -1836,10 +1802,7 @@ config DEBUG_UART_VIRT
 	default 0xfec03000 if DEBUG_SOCFPGA_CYCLONE5_UART1
 	default 0xfec12000 if DEBUG_MVEBU_UART0 || DEBUG_MVEBU_UART0_ALTERNATE
 	default 0xfec12100 if DEBUG_MVEBU_UART1_ALTERNATE
-	default 0xfec10000 if DEBUG_SIRFATLAS7_UART0
 	default 0xfec20000 if DEBUG_DAVINCI_DMx_UART0
-	default 0xfec20000 if DEBUG_SIRFATLAS7_UART1
-	default 0xfec60000 if DEBUG_SIRFPRIMA2_UART1
 	default 0xfec90000 if DEBUG_RK32_UART2
 	default 0xfed0c000 if DEBUG_DAVINCI_DA8XX_UART1
 	default 0xfed0d000 if DEBUG_DAVINCI_DA8XX_UART2 || DEBUG_SD5203_UART
@@ -1863,7 +1826,7 @@ config DEBUG_UART_VIRT
 		DEBUG_QCOM_UARTDM || DEBUG_S3C24XX_UART || \
 		DEBUG_S3C64XX_UART || \
 		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
-		DEBUG_SIRFSOC_UART || DEBUG_DIGICOLOR_UA0 || \
+		DEBUG_DIGICOLOR_UA0 || \
 		DEBUG_AT91_UART || DEBUG_STM32_UART
 
 config DEBUG_UART_8250_SHIFT
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index dd51416cdcd9..7c4b50852a78 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -209,7 +209,6 @@ machine-$(CONFIG_PLAT_SAMSUNG)		+= s3c
 machine-$(CONFIG_ARCH_S5PV210)		+= s5pv210
 machine-$(CONFIG_ARCH_SA1100)		+= sa1100
 machine-$(CONFIG_ARCH_RENESAS)	 	+= shmobile
-machine-$(CONFIG_ARCH_SIRF)		+= prima2
 machine-$(CONFIG_ARCH_SOCFPGA)		+= socfpga
 machine-$(CONFIG_ARCH_STI)		+= sti
 machine-$(CONFIG_ARCH_STM32)		+= stm32
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 2c02cb4c71cb..da413b4d5c3f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -74,10 +74,6 @@ dtb-$(CONFIG_SOC_SAM_V7) += \
 	at91-sama5d4_xplained.dtb \
 	at91-sama5d4ek.dtb \
 	at91-vinco.dtb
-dtb-$(CONFIG_ARCH_ATLAS6) += \
-	atlas6-evb.dtb
-dtb-$(CONFIG_ARCH_ATLAS7) += \
-	atlas7-evb.dtb
 dtb-$(CONFIG_ARCH_AXXIA) += \
 	axm5516-amarillo.dtb
 dtb-$(CONFIG_ARCH_BCM2835) += \
@@ -886,8 +882,6 @@ dtb-$(CONFIG_ARCH_ACTIONS) += \
 	owl-s500-labrador-base-m.dtb \
 	owl-s500-roseapplepi.dtb \
 	owl-s500-sparky.dtb
-dtb-$(CONFIG_ARCH_PRIMA2) += \
-	prima2-evb.dtb
 dtb-$(CONFIG_ARCH_PXA) += \
 	pxa300-raumfeld-connector.dtb \
 	pxa300-raumfeld-controller.dtb \
diff --git a/arch/arm/boot/dts/atlas6-evb.dts b/arch/arm/boot/dts/atlas6-evb.dts
deleted file mode 100644
index 89e430392f26..000000000000
diff --git a/arch/arm/boot/dts/atlas6.dtsi b/arch/arm/boot/dts/atlas6.dtsi
deleted file mode 100644
index 8ac5d1524a43..000000000000
diff --git a/arch/arm/boot/dts/atlas7-evb.dts b/arch/arm/boot/dts/atlas7-evb.dts
deleted file mode 100644
index e0515043d145..000000000000
diff --git a/arch/arm/boot/dts/atlas7.dtsi b/arch/arm/boot/dts/atlas7.dtsi
deleted file mode 100644
index 99c9d9d9267f..000000000000
diff --git a/arch/arm/boot/dts/prima2-evb.dts b/arch/arm/boot/dts/prima2-evb.dts
deleted file mode 100644
index 7394f764df65..000000000000
diff --git a/arch/arm/boot/dts/prima2.dtsi b/arch/arm/boot/dts/prima2.dtsi
deleted file mode 100644
index 7d3d93c22ed9..000000000000
diff --git a/arch/arm/configs/prima2_defconfig b/arch/arm/configs/prima2_defconfig
deleted file mode 100644
index be19aa127595..000000000000
diff --git a/arch/arm/include/debug/sirf.S b/arch/arm/include/debug/sirf.S
deleted file mode 100644
index 3612c7b9cbe7..000000000000
diff --git a/arch/arm/mach-prima2/Kconfig b/arch/arm/mach-prima2/Kconfig
deleted file mode 100644
index ea077f66372d..000000000000
diff --git a/arch/arm/mach-prima2/Makefile b/arch/arm/mach-prima2/Makefile
deleted file mode 100644
index 0fd2763031e9..000000000000
diff --git a/arch/arm/mach-prima2/common.c b/arch/arm/mach-prima2/common.c
deleted file mode 100644
index e2d158e331e2..000000000000
diff --git a/arch/arm/mach-prima2/common.h b/arch/arm/mach-prima2/common.h
deleted file mode 100644
index 3bab7e571ded..000000000000
diff --git a/arch/arm/mach-prima2/headsmp.S b/arch/arm/mach-prima2/headsmp.S
deleted file mode 100644
index 88ea1243942a..000000000000
diff --git a/arch/arm/mach-prima2/hotplug.c b/arch/arm/mach-prima2/hotplug.c
deleted file mode 100644
index bc0d957e89ac..000000000000
diff --git a/arch/arm/mach-prima2/platsmp.c b/arch/arm/mach-prima2/platsmp.c
deleted file mode 100644
index 8f7bbb57fb20..000000000000
diff --git a/arch/arm/mach-prima2/pm.c b/arch/arm/mach-prima2/pm.c
deleted file mode 100644
index c24bc89f320b..000000000000
diff --git a/arch/arm/mach-prima2/pm.h b/arch/arm/mach-prima2/pm.h
deleted file mode 100644
index 0aff6cb876be..000000000000
diff --git a/arch/arm/mach-prima2/rstc.c b/arch/arm/mach-prima2/rstc.c
deleted file mode 100644
index 9d56606ac87f..000000000000
diff --git a/arch/arm/mach-prima2/rtciobrg.c b/arch/arm/mach-prima2/rtciobrg.c
deleted file mode 100644
index 97c0e333e3b9..000000000000
diff --git a/arch/arm/mach-prima2/sleep.S b/arch/arm/mach-prima2/sleep.S
deleted file mode 100644
index d9bbc5ca39ef..000000000000
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
