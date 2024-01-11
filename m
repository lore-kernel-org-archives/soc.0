Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAEDC4725D
	for <soc@archiver.kernel.org>; Thu, 11 Jan 2024 09:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24AC6C433F1; Thu, 11 Jan 2024 09:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED327C433C7;
	Thu, 11 Jan 2024 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704965164;
	bh=JbxfWqdGo+sZOZkHPpjCwZflvN1UDJKFHqg1p+mQ1QM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ByTznzGlvbWXIO9ZhfP87J/Y+Xsz8eKzpDftf8KHbF7e1xkmv3tcL5sqlGhN0ZPlR
	 DJm7yvLRY/9IRexPfBMpRN7db95374rdB30/vR2+PmzlAV65lnmTeJGLv9EsdAPDXf
	 1GZ4MBeORx1Kedy2mA7uWPsg3Z864TPSwvJXghPbRhm9x01SpAvD8HJZKlRwH8DnsP
	 O2tbAsQu58zFV7ofAqSePrOQy1vFtv+AnsUvBPs0fbowilvhPKr8CuCW0059Zp2cIY
	 Ir0vYZvyx2adeTDGwxZXwRzC90HqpIlDb0a7EUyu7Y3y+x4+35m3EEf3g8sSbmjB2s
	 g3M5Zs6hWweZw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/6] ARM: defconfig: reorder config lines
Date: Thu, 11 Jan 2024 10:25:46 +0100
Message-Id: <20240111092550.1313277-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240111092550.1313277-1-arnd@kernel.org>
References: <20240111092550.1313277-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

As part of general housekeeping, change the defconfig files to
sort lines based on the 'make savedefconfig' output, to make
it easier to do additional changes on top.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/aspeed_g4_defconfig   |  4 ++--
 arch/arm/configs/aspeed_g5_defconfig   |  4 ++--
 arch/arm/configs/at91_dt_defconfig     |  4 ++--
 arch/arm/configs/bcm2835_defconfig     |  4 ++--
 arch/arm/configs/collie_defconfig      |  2 +-
 arch/arm/configs/davinci_all_defconfig |  2 +-
 arch/arm/configs/ep93xx_defconfig      |  2 +-
 arch/arm/configs/gemini_defconfig      |  2 +-
 arch/arm/configs/moxart_defconfig      |  4 ++--
 arch/arm/configs/multi_v4t_defconfig   |  2 +-
 arch/arm/configs/multi_v5_defconfig    |  2 +-
 arch/arm/configs/multi_v7_defconfig    | 26 +++++++++++++-------------
 arch/arm/configs/omap1_defconfig       |  4 ++--
 arch/arm/configs/pxa_defconfig         |  8 ++++----
 arch/arm/configs/qcom_defconfig        | 10 +++++-----
 arch/arm/configs/realview_defconfig    |  4 ++--
 arch/arm/configs/rpc_defconfig         |  4 ++--
 arch/arm/configs/sama5_defconfig       |  2 +-
 arch/arm/configs/sama7_defconfig       |  2 +-
 arch/arm/configs/stm32_defconfig       |  2 +-
 arch/arm/configs/tegra_defconfig       |  4 ++--
 arch/arm/configs/vf610m4_defconfig     |  2 +-
 22 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 9d1b297c432e..b3dc0465796f 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -12,11 +12,12 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
+CONFIG_EXPERT=y
 # CONFIG_UID16 is not set
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_AIO is not set
-CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
+CONFIG_KEXEC=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_ASPEED=y
 CONFIG_MACH_ASPEED_G4=y
@@ -24,7 +25,6 @@ CONFIG_VMSPLIT_2G=y
 CONFIG_AEABI=y
 CONFIG_UACCESS_WITH_MEMCPY=y
 # CONFIG_ATAGS is not set
-CONFIG_KEXEC=y
 CONFIG_JUMP_LABEL=y
 CONFIG_STRICT_KERNEL_RWX=y
 # CONFIG_BLK_DEBUG_FS is not set
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index b55f8f539c5f..3fdf4dbfdea5 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -12,11 +12,12 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
+CONFIG_EXPERT=y
 # CONFIG_UID16 is not set
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_AIO is not set
-CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
+CONFIG_KEXEC=y
 CONFIG_ARCH_MULTI_V6=y
 CONFIG_ARCH_ASPEED=y
 CONFIG_MACH_ASPEED_G5=y
@@ -29,7 +30,6 @@ CONFIG_NR_CPUS=2
 CONFIG_HIGHMEM=y
 CONFIG_UACCESS_WITH_MEMCPY=y
 # CONFIG_ATAGS is not set
-CONFIG_KEXEC=y
 CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 71b5acc78187..1d53aec4c836 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -6,8 +6,9 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_KALLSYMS_ALL=y
 CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_KEXEC=y
 CONFIG_ARCH_MULTI_V4T=y
 CONFIG_ARCH_MULTI_V5=y
 # CONFIG_ARCH_MULTI_V7 is not set
@@ -22,7 +23,6 @@ CONFIG_UACCESS_WITH_MEMCPY=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_CMDLINE="console=ttyS0,115200 initrd=0x21100000,25165824 root=/dev/ram0 rw"
-CONFIG_KEXEC=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index 225a16c0323c..b5f0bd8dd536 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -18,17 +18,17 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_KALLSYMS_ALL=y
 CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_CC_STACKPROTECTOR_REGULAR=y
+CONFIG_CRASH_DUMP=y
 CONFIG_ARCH_MULTI_V6=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
 CONFIG_AEABI=y
 CONFIG_SECCOMP=y
 CONFIG_KEXEC=y
-CONFIG_CRASH_DUMP=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=y
diff --git a/arch/arm/configs/collie_defconfig b/arch/arm/configs/collie_defconfig
index 69341c33e0cc..6efac6d9c023 100644
--- a/arch/arm/configs/collie_defconfig
+++ b/arch/arm/configs/collie_defconfig
@@ -60,9 +60,9 @@ CONFIG_MCP_SA11X0=y
 CONFIG_MCP_UCB1200=y
 CONFIG_MCP_UCB1200_TS=y
 CONFIG_FB=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_SA1100=y
 # CONFIG_VGA_CONSOLE is not set
+CONFIG_FB_MODE_HELPERS=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_NEW_LEDS=y
diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index 05ea71778ef8..3474e475373a 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -148,8 +148,8 @@ CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_TINYDRM=m
 CONFIG_TINYDRM_ST7586=m
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_DA8XX=y
+CONFIG_FIRMWARE_EDID=y
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_GPIO=m
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arm/configs/ep93xx_defconfig b/arch/arm/configs/ep93xx_defconfig
index 44e89a980d29..7dece9d98828 100644
--- a/arch/arm/configs/ep93xx_defconfig
+++ b/arch/arm/configs/ep93xx_defconfig
@@ -78,8 +78,8 @@ CONFIG_SPI_EP93XX=y
 CONFIG_WATCHDOG=y
 CONFIG_EP93XX_WATCHDOG=y
 CONFIG_FB=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_EP93XX=y
+CONFIG_FB_MODE_HELPERS=y
 CONFIG_LOGO=y
 CONFIG_USB=y
 CONFIG_USB_DYNAMIC_MINORS=y
diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index 592a6e6024d4..7b1daec630cb 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -7,13 +7,13 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_USER_NS=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_KEXEC=y
 CONFIG_ARCH_MULTI_V4=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_GEMINI=y
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
 CONFIG_CMDLINE="console=ttyS0,115200n8"
-CONFIG_KEXEC=y
 CONFIG_PM=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=y
diff --git a/arch/arm/configs/moxart_defconfig b/arch/arm/configs/moxart_defconfig
index bb6a5222e42f..1d41e73f4903 100644
--- a/arch/arm/configs/moxart_defconfig
+++ b/arch/arm/configs/moxart_defconfig
@@ -4,13 +4,13 @@ CONFIG_NO_HZ_IDLE=y
 CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
+CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
 # CONFIG_BASE_FULL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_TIMERFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
-CONFIG_EXPERT=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_ARCH_MULTI_V4=y
 # CONFIG_ARCH_MULTI_V7 is not set
@@ -126,8 +126,8 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_KGDB=y
 CONFIG_DEBUG_PAGEALLOC=y
 # CONFIG_SLUB_DEBUG is not set
-CONFIG_DEBUG_OBJECTS=y
 CONFIG_DEBUG_KMEMLEAK=y
+CONFIG_DEBUG_OBJECTS=y
 CONFIG_DEBUG_STACK_USAGE=y
 CONFIG_DEBUG_MEMORY_INIT=y
 CONFIG_DEBUG_SHIRQ=y
diff --git a/arch/arm/configs/multi_v4t_defconfig b/arch/arm/configs/multi_v4t_defconfig
index a7fabf1d88ff..9abc7aae83fa 100644
--- a/arch/arm/configs/multi_v4t_defconfig
+++ b/arch/arm/configs/multi_v4t_defconfig
@@ -5,12 +5,12 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_ARCH_MULTI_V4T=y
 # CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_NSPIRE=y
 CONFIG_ARCH_AT91=y
 CONFIG_SOC_AT91RM9200=y
 CONFIG_ARCH_CLPS711X=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMX1=y
-CONFIG_ARCH_NSPIRE=y
 CONFIG_ARCH_INTEGRATOR=y
 CONFIG_ARCH_INTEGRATOR_AP=y
 CONFIG_INTEGRATOR_IMPD1=y
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 52bb1a5e25fc..3f4ddcf49ec7 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -62,8 +62,8 @@ CONFIG_NET_DSA=y
 CONFIG_NET_PKTGEN=m
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
-CONFIG_PCI_MVEBU=y
 CONFIG_PCI_VERSATILE=y
+CONFIG_PCI_MVEBU=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_IMX_WEIM=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3e95a2bcde3e..ecb3e286107a 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -5,8 +5,11 @@ CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
+CONFIG_KEXEC=y
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_AIROHA=y
+CONFIG_ARCH_SUNPLUS=y
+CONFIG_ARCH_UNIPHIER=y
 CONFIG_ARCH_ACTIONS=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_ARTPEC=y
@@ -96,10 +99,8 @@ CONFIG_MACH_SPEAR1310=y
 CONFIG_MACH_SPEAR1340=y
 CONFIG_ARCH_STI=y
 CONFIG_ARCH_STM32=y
-CONFIG_ARCH_SUNPLUS=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_TEGRA=y
-CONFIG_ARCH_UNIPHIER=y
 CONFIG_ARCH_U8500=y
 CONFIG_ARCH_VEXPRESS=y
 CONFIG_ARCH_VEXPRESS_TC2_PM=y
@@ -109,7 +110,6 @@ CONFIG_SMP=y
 CONFIG_NR_CPUS=16
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
-CONFIG_KEXEC=y
 CONFIG_EFI=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
@@ -179,10 +179,10 @@ CONFIG_NFC_S3FWRN5_I2C=m
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_MVEBU=y
 CONFIG_PCI_TEGRA=y
-CONFIG_PCI_RCAR_GEN2=y
 CONFIG_PCIE_RCAR_HOST=y
-CONFIG_PCI_DRA7XX_EP=y
+CONFIG_PCI_RCAR_GEN2=y
 CONFIG_PCI_LAYERSCAPE=y
+CONFIG_PCI_DRA7XX_EP=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
@@ -524,6 +524,7 @@ CONFIG_CHARGER_TPS65090=y
 CONFIG_BATTERY_ACER_A500=m
 CONFIG_SENSORS_ARM_SCMI=y
 CONFIG_SENSORS_ASPEED=m
+CONFIG_SENSORS_GXP_FAN_CTRL=m
 CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_LAN966X=m
 CONFIG_SENSORS_LM90=y
@@ -532,7 +533,6 @@ CONFIG_SENSORS_NTC_THERMISTOR=m
 CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_INA2XX=m
-CONFIG_SENSORS_GXP_FAN_CTRL=m
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
 CONFIG_IMX_THERMAL=y
@@ -1074,8 +1074,8 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_OMAP2PLUS_MBOX=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
-CONFIG_QCOM_IPCC=y
 CONFIG_STM32_IPCC=m
+CONFIG_QCOM_IPCC=y
 CONFIG_OMAP_IOMMU=y
 CONFIG_OMAP_IOMMU_DEBUG=y
 CONFIG_ROCKCHIP_IOMMU=y
@@ -1097,15 +1097,11 @@ CONFIG_RPMSG_VIRTIO=m
 CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
-CONFIG_RASPBERRYPI_POWER=y
 CONFIG_QCOM_COMMAND_DB=m
-CONFIG_QCOM_CPR=y
 CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_OCMEM=m
 CONFIG_QCOM_RMTFS_MEM=m
 CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_RPMHPD=y
-CONFIG_QCOM_RPMPD=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
@@ -1133,11 +1129,15 @@ CONFIG_ARCH_R8A7744=y
 CONFIG_ARCH_R9A06G032=y
 CONFIG_ARCH_SH73A0=y
 CONFIG_ROCKCHIP_IODOMAIN=y
-CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_ARCH_TEGRA_2x_SOC=y
 CONFIG_ARCH_TEGRA_3x_SOC=y
 CONFIG_ARCH_TEGRA_114_SOC=y
 CONFIG_ARCH_TEGRA_124_SOC=y
+CONFIG_RASPBERRYPI_POWER=y
+CONFIG_QCOM_CPR=y
+CONFIG_QCOM_RPMHPD=y
+CONFIG_QCOM_RPMPD=y
+CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_ARM_EXYNOS_BUS_DEVFREQ=m
 CONFIG_ARM_TEGRA_DEVFREQ=m
 CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=m
@@ -1246,8 +1246,8 @@ CONFIG_OPTEE=y
 CONFIG_INTERCONNECT_QCOM=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=y
 CONFIG_COUNTER=m
-CONFIG_STM32_TIMER_CNT=m
 CONFIG_STM32_LPTIMER_CNT=m
+CONFIG_STM32_TIMER_CNT=m
 CONFIG_EXT4_FS=y
 CONFIG_AUTOFS_FS=y
 CONFIG_MSDOS_FS=y
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index 7c2cc7a89511..e7f36aa5b782 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -132,14 +132,14 @@ CONFIG_WATCHDOG=y
 CONFIG_WATCHDOG_NOWAYOUT=y
 CONFIG_OMAP_WATCHDOG=y
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_VIRTUAL=y
 CONFIG_FB_OMAP=y
 CONFIG_FB_OMAP_LCDC_EXTERNAL=y
 CONFIG_FB_OMAP_LCDC_HWA742=y
 CONFIG_FB_OMAP_MANUAL_UPDATE=y
 CONFIG_FB_OMAP_LCD_MIPID=y
+CONFIG_FIRMWARE_EDID=y
+CONFIG_FB_MODE_HELPERS=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 9e81b1849e4c..2d2102b19e95 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -10,9 +10,10 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=13
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_KALLSYMS_ALL=y
 CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
+CONFIG_KEXEC=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_GUMSTIX=y
@@ -22,7 +23,6 @@ CONFIG_MACH_BORZOI=y
 CONFIG_AEABI=y
 CONFIG_ARCH_FORCE_MAX_ORDER=8
 CONFIG_CMDLINE="root=/dev/ram0 ro"
-CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
@@ -380,8 +380,6 @@ CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_PXA27x=m
 CONFIG_DRM=m
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
-CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_PXA=y
 CONFIG_FB_PXA_OVERLAY=y
 CONFIG_FB_PXA_PARAMETERS=y
@@ -393,6 +391,8 @@ CONFIG_LCD_CORGI=m
 CONFIG_LCD_PLATFORM=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FIRMWARE_EDID=y
+CONFIG_FB_TILEBLITTING=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
 CONFIG_SOUND=m
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 737d51412eb2..ec52ccece0ca 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -6,8 +6,8 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_KALLSYMS_ALL=y
 CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_QCOM=y
 CONFIG_ARCH_MSM8X60=y
@@ -139,11 +139,11 @@ CONFIG_PINCTRL_MDM9615=y
 CONFIG_PINCTRL_MSM8X74=y
 CONFIG_PINCTRL_MSM8909=y
 CONFIG_PINCTRL_MSM8916=y
-CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
-CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_GPIOLIB=y
 CONFIG_PINCTRL_SDX55=y
 CONFIG_PINCTRL_SDX65=y
+CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
+CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_MSM=y
@@ -259,8 +259,6 @@ CONFIG_QCOM_OCMEM=y
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_RMTFS_MEM=y
 CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_RPMHPD=y
-CONFIG_QCOM_RPMPD=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
@@ -268,6 +266,8 @@ CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=y
 CONFIG_QCOM_STATS=y
 CONFIG_QCOM_WCNSS_CTRL=y
+CONFIG_QCOM_RPMHPD=y
+CONFIG_QCOM_RPMPD=y
 CONFIG_EXTCON_QCOM_SPMI_MISC=y
 CONFIG_IIO=y
 CONFIG_IIO_BUFFER_CB=y
diff --git a/arch/arm/configs/realview_defconfig b/arch/arm/configs/realview_defconfig
index a221a99f6472..d1eaed19fa6c 100644
--- a/arch/arm/configs/realview_defconfig
+++ b/arch/arm/configs/realview_defconfig
@@ -58,6 +58,8 @@ CONFIG_GPIOLIB=y
 # CONFIG_HWMON is not set
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_AUXDISPLAY=y
+CONFIG_ARM_CHARLCD=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
@@ -85,8 +87,6 @@ CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_PL031=y
-CONFIG_AUXDISPLAY=y
-CONFIG_ARM_CHARLCD=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_CRAMFS=y
diff --git a/arch/arm/configs/rpc_defconfig b/arch/arm/configs/rpc_defconfig
index b1d12a2c2ef8..30b093c491ba 100644
--- a/arch/arm/configs/rpc_defconfig
+++ b/arch/arm/configs/rpc_defconfig
@@ -2,13 +2,13 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
 CONFIG_ARCH_MULTI_V4=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_RPC=y
 CONFIG_CPU_SA110=y
 CONFIG_FPE_NWFPE=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BSD_DISKLABEL=y
 CONFIG_NET=y
diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index 0e030063130f..9096a99b5abd 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
+CONFIG_KEXEC=y
 CONFIG_ARCH_AT91=y
 CONFIG_SOC_SAMA5D2=y
 CONFIG_SOC_SAMA5D3=y
@@ -14,7 +15,6 @@ CONFIG_SOC_SAMA5D4=y
 CONFIG_UACCESS_WITH_MEMCPY=y
 # CONFIG_ATAGS is not set
 CONFIG_CMDLINE="console=ttyS0,115200 initrd=0x21100000,25165824 root=/dev/ram0 rw"
-CONFIG_KEXEC=y
 CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index be0cfed4ecf1..6777f0a1cc60 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -9,10 +9,10 @@ CONFIG_NAMESPACES=y
 CONFIG_SYSFS_DEPRECATED=y
 CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
 # CONFIG_FHANDLE is not set
 # CONFIG_IO_URING is not set
 CONFIG_KALLSYMS_ALL=y
-CONFIG_EXPERT=y
 CONFIG_ARCH_AT91=y
 CONFIG_SOC_SAMA7G5=y
 CONFIG_ATMEL_CLOCKSOURCE_TCB=y
diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index e95aba916547..b9fe3fbed5ae 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -4,6 +4,7 @@ CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_EXPERT=y
 # CONFIG_UID16 is not set
 # CONFIG_BASE_FULL is not set
 # CONFIG_FUTEX is not set
@@ -11,7 +12,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_SIGNALFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
-CONFIG_EXPERT=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_MMU is not set
 CONFIG_ARCH_STM32=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 8635b7216bfc..d2a094ad360c 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -13,13 +13,13 @@ CONFIG_CGROUP_DEBUG=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_ELF_CORE is not set
 CONFIG_EXPERT=y
+# CONFIG_ELF_CORE is not set
 CONFIG_PERF_EVENTS=y
+CONFIG_KEXEC=y
 CONFIG_ARCH_TEGRA=y
 CONFIG_SMP=y
 CONFIG_HIGHMEM=y
-CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
diff --git a/arch/arm/configs/vf610m4_defconfig b/arch/arm/configs/vf610m4_defconfig
index 963ff0a03311..a5609cbfdfb3 100644
--- a/arch/arm/configs/vf610m4_defconfig
+++ b/arch/arm/configs/vf610m4_defconfig
@@ -4,8 +4,8 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZ4 is not set
-CONFIG_KALLSYMS_ALL=y
 CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
 # CONFIG_MMU is not set
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_VF610=y
-- 
2.39.2

