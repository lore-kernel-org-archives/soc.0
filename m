Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C4CC47077
	for <soc@archiver.kernel.org>; Thu, 11 Jan 2024 09:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8CC23C433F1; Thu, 11 Jan 2024 09:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9246AC43390;
	Thu, 11 Jan 2024 09:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704965169;
	bh=Wh+Ghh/xae7yXln1+wKtnus24RXFzzEP2G6Itu8NWA4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZUQ37j++js6R3XR6MOvnZPrzeYClzxboiSLBJIulEcZ6jTUeVcwf9cks5PCw66gzP
	 ESzaR3ltX4jgE3S3qu5WYz3bcg57FDy5cezJP/7EJtcTvN9KGOf64CZtfBsw++HObD
	 3YCvdmvzPUAWCYFXR0GpC7ghAGZVbb3+YDThcV0ZrAelNoBFMZskrp4DX2rxymw7i/
	 ZxgFnlxmfVGiaJ3Pftc9sxfxkYWYMzH+4QYU+35SJlLH33tYRU/dE7NlWOhHeHrZ1u
	 S5Ivlkygz2ZUH3uVVz56mLVtrrGSpWWB8YLrFMnzKXopsSrpZL4o4n6VJGwI8pMnLh
	 edQA2g9QeGoNA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 6/6] ARM: defconfig: remove dead platform options
Date: Thu, 11 Jan 2024 10:25:50 +0100
Message-Id: <20240111092550.1313277-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240111092550.1313277-1-arnd@kernel.org>
References: <20240111092550.1313277-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

These are all options for boards that got removed in the past and
are not relevant here because the options no longer exist or
are implied by the platform.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/clps711x_defconfig  | 6 ------
 arch/arm/configs/dove_defconfig      | 2 --
 arch/arm/configs/imx_v4_v5_defconfig | 5 -----
 arch/arm/configs/omap1_defconfig     | 1 -
 arch/arm/configs/realview_defconfig  | 2 --
 5 files changed, 16 deletions(-)

diff --git a/arch/arm/configs/clps711x_defconfig b/arch/arm/configs/clps711x_defconfig
index 5ce6ee0006e0..6fa3477e6b02 100644
--- a/arch/arm/configs/clps711x_defconfig
+++ b/arch/arm/configs/clps711x_defconfig
@@ -6,12 +6,6 @@ CONFIG_RD_LZMA=y
 CONFIG_EXPERT=y
 CONFIG_JUMP_LABEL=y
 CONFIG_PARTITION_ADVANCED=y
-CONFIG_ARCH_CLPS711X=y
-CONFIG_ARCH_AUTCPU12=y
-CONFIG_ARCH_CDB89712=y
-CONFIG_ARCH_CLEP7312=y
-CONFIG_ARCH_EDB7211=y
-CONFIG_ARCH_P720T=y
 CONFIG_AEABI=y
 # CONFIG_COREDUMP is not set
 CONFIG_SLUB_TINY=y
diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
index 46859e6fee5b..2849d17f5856 100644
--- a/arch/arm/configs/dove_defconfig
+++ b/arch/arm/configs/dove_defconfig
@@ -6,9 +6,7 @@ CONFIG_EXPERT=y
 # CONFIG_ARCH_MULTI_V6 is not set
 CONFIG_ARCH_MULTI_V7=y
 CONFIG_ARCH_DOVE=y
-CONFIG_MACH_DOVE_DB=y
 CONFIG_MACH_CM_A510=y
-CONFIG_MACH_DOVE_DT=y
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index ec45e6225225..875c8cdbada7 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -12,11 +12,6 @@ CONFIG_ARCH_MULTI_V4T=y
 CONFIG_ARCH_MULTI_V5=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_MXC=y
-CONFIG_MACH_MX21ADS=y
-CONFIG_MACH_MX27ADS=y
-CONFIG_MACH_MX27_3DS=y
-CONFIG_MACH_IMX27_VISSTRIM_M10=y
-CONFIG_MACH_PCA100=y
 CONFIG_SOC_IMX1=y
 CONFIG_SOC_IMX25=y
 CONFIG_SOC_IMX27=y
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index af5f1c4ec084..729ea8157e2a 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -28,7 +28,6 @@ CONFIG_MACH_OMAP_PALMTE=y
 CONFIG_MACH_SX1=y
 CONFIG_MACH_NOKIA770=y
 CONFIG_MACH_AMS_DELTA=y
-CONFIG_MACH_OMAP_GENERIC=y
 CONFIG_AEABI=y
 CONFIG_CMDLINE="root=1f03 rootfstype=jffs2"
 CONFIG_FPE_NWFPE=y
diff --git a/arch/arm/configs/realview_defconfig b/arch/arm/configs/realview_defconfig
index d1eaed19fa6c..febea5cf7aaa 100644
--- a/arch/arm/configs/realview_defconfig
+++ b/arch/arm/configs/realview_defconfig
@@ -9,8 +9,6 @@ CONFIG_MACH_REALVIEW_EB=y
 CONFIG_REALVIEW_EB_ARM1136=y
 CONFIG_REALVIEW_EB_ARM1176=y
 CONFIG_REALVIEW_EB_A9MP=y
-CONFIG_REALVIEW_EB_ARM11MP=y
-CONFIG_MACH_REALVIEW_PB11MP=y
 CONFIG_MACH_REALVIEW_PB1176=y
 CONFIG_MACH_REALVIEW_PBA8=y
 CONFIG_MACH_REALVIEW_PBX=y
-- 
2.39.2

