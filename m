Return-Path: <SRS0=vJyh=TS=arm.com=andre.przywara@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB57EC433FE
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 14:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AF09BC340EB; Mon,  7 Mar 2022 14:34:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 7949DC340E9;
	Mon,  7 Mar 2022 14:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7949DC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A798ED1;
	Mon,  7 Mar 2022 06:34:56 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0924C3F66F;
	Mon,  7 Mar 2022 06:34:53 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Mesih Kilinc <mesihkilinc@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Subject: [PATCH 13/14] ARM: configs: sync multi_v5_defconfig from savedefconfig
Date: Mon,  7 Mar 2022 14:34:20 +0000
Message-Id: <20220307143421.1106209-14-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307143421.1106209-1-andre.przywara@arm.com>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Kconfig options have changed, some other platforms have been
removed.

Update multi_v5_defconfig with the result of "make savedefconfig", the
resulting .config files are identical.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/configs/multi_v5_defconfig | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index fe8d760256a4..8b7fe7ff5366 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -24,11 +24,6 @@ CONFIG_MACH_DM355_LEOPARD=y
 CONFIG_MACH_MITYOMAPL138=y
 CONFIG_MACH_OMAPL138_HAWKBOARD=y
 CONFIG_ARCH_MXC=y
-CONFIG_MACH_MX21ADS=y
-CONFIG_MACH_MX27ADS=y
-CONFIG_MACH_MX27_3DS=y
-CONFIG_MACH_IMX27_VISSTRIM_M10=y
-CONFIG_MACH_PCA100=y
 CONFIG_SOC_IMX25=y
 CONFIG_SOC_IMX27=y
 CONFIG_ARCH_MVEBU=y
@@ -57,11 +52,8 @@ CONFIG_MACH_WNR854T=y
 CONFIG_MACH_RD88F5181L_GE=y
 CONFIG_MACH_RD88F5181L_FXO=y
 CONFIG_MACH_RD88F6183AP_GE=y
-CONFIG_ARCH_U300=y
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_CPU_FREQ=y
@@ -159,7 +151,6 @@ CONFIG_I2C_ASPEED=m
 CONFIG_I2C_AT91=y
 CONFIG_I2C_IMX=y
 CONFIG_I2C_MV64XXX=y
-CONFIG_I2C_NOMADIK=y
 CONFIG_SPI=y
 CONFIG_SPI_ATMEL=y
 CONFIG_SPI_IMX=y
@@ -183,22 +174,13 @@ CONFIG_ORION_WATCHDOG=y
 CONFIG_NPCM7XX_WATCHDOG=y
 CONFIG_IMX2_WDT=y
 CONFIG_MFD_ATMEL_HLCDC=y
-# CONFIG_ABX500_CORE is not set
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
-CONFIG_V4L_PLATFORM_DRIVERS=y
-CONFIG_VIDEO_ASPEED=m
-CONFIG_VIDEO_ATMEL_ISI=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=m
-CONFIG_DRM_PANEL_SIMPLE=y
-CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_ASPEED_GFX=m
-CONFIG_FB_IMX=y
-CONFIG_FB_ATMEL=y
-CONFIG_BACKLIGHT_ATMEL_LCDC=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
@@ -303,8 +285,8 @@ CONFIG_CRYPTO_DEV_MARVELL_CESA=y
 CONFIG_CRC_CCITT=y
 CONFIG_LIBCRC32C=y
 CONFIG_DEBUG_INFO=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_KERNEL=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
-- 
2.25.1

