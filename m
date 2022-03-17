Return-Path: <SRS0=YD5N=T4=arm.com=andre.przywara@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A55C433EF
	for <soc@archiver.kernel.org>; Thu, 17 Mar 2022 18:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EF0DC340F2; Thu, 17 Mar 2022 18:31:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id EACE0C340E9
	for <soc@kernel.org>; Thu, 17 Mar 2022 18:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EACE0C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9A0E1692;
	Thu, 17 Mar 2022 11:30:58 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 474163F7F5;
	Thu, 17 Mar 2022 11:30:57 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 4/5] ARM: configs: clean up multi_v5_defconfig
Date: Thu, 17 Mar 2022 18:30:42 +0000
Message-Id: <20220317183043.948432-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317183043.948432-1-andre.przywara@arm.com>
References: <20220317183043.948432-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up some cruft accumulated over time:
- The default definition of CONFIG_ZBOOT_ROM_* got fixed in commit
  39c3e304567a ("ARM: 8984/1: Kconfig: set default ZBOOT_ROM_TEXT/BSS
  value to 0x0"), so we don't need the explicit setting anymore.
- CONFIG_ABX500_CORE now explicitly depends on the ARMv7 ARCH_U8500,
  so we don't need to disable that symbol explicitly anymore.
- CONFIG_DEBUG_FS was just moved around in the generated defconfig.

No change to the generated .config or savedefconfig.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/configs/multi_v5_defconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 9af55d650cf4..f89baa88facb 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -54,8 +54,6 @@ CONFIG_MACH_RD88F5181L_FXO=y
 CONFIG_MACH_RD88F6183AP_GE=y
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_CPU_FREQ=y
@@ -176,7 +174,6 @@ CONFIG_ORION_WATCHDOG=y
 CONFIG_NPCM7XX_WATCHDOG=y
 CONFIG_IMX2_WDT=y
 CONFIG_MFD_ATMEL_HLCDC=y
-# CONFIG_ABX500_CORE is not set
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_MEDIA_SUPPORT=y
@@ -298,8 +295,8 @@ CONFIG_CRYPTO_DEV_MARVELL_CESA=y
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

