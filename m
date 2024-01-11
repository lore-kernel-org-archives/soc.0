Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5087BC4725D
	for <soc@archiver.kernel.org>; Thu, 11 Jan 2024 09:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37A94C433F1; Thu, 11 Jan 2024 09:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB82C43394;
	Thu, 11 Jan 2024 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704965168;
	bh=6NGWaDWsy3WnFDR2xmV670DWLBQORB+mtRXuoyuN6TI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVlv3kG20McnEGDdsBv3qPZexROqFtNK6UBJXbFz2c+9yGBkpUxVAyT0YsLokTbox
	 Ht9NPb7qB+KglMpJN5XUI0tFFRe9CUmiFmcrHznWraWyelSn0shYuQA8vLkNf8Q4hU
	 wCIozc4oMthZMBhSuTJkQ/Lu+spGTFIcKpiettVKu2ec7FjxruvMXPVY2q8YI6rKFz
	 D2r4/CUrYigE2D0ABBOnQZzGQSD+9Q+lcWIKmqvgRS+rKWQOWpSQ24qofu0RC5zQfO
	 efc+zEZ8gxIZbKquWBbZbYjjq/QcDoMevLJ5cS8SaS4xCjXSpLqGodMTneVOfp65EI
	 gPcE2rKAwKEpA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 5/6] ARM: defconfig: remove CONFIG_SLUB references
Date: Thu, 11 Jan 2024 10:25:49 +0100
Message-Id: <20240111092550.1313277-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240111092550.1313277-1-arnd@kernel.org>
References: <20240111092550.1313277-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

SLUB is now the only remaining allocator after the SLAB removal and it
was the default already before that, so no need to mention it in the
defconfig files.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/clps711x_defconfig  | 1 -
 arch/arm/configs/collie_defconfig    | 1 -
 arch/arm/configs/multi_v4t_defconfig | 1 -
 arch/arm/configs/omap1_defconfig     | 1 -
 arch/arm/configs/pxa_defconfig       | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/arm/configs/clps711x_defconfig b/arch/arm/configs/clps711x_defconfig
index d7ed1e7c6a90..5ce6ee0006e0 100644
--- a/arch/arm/configs/clps711x_defconfig
+++ b/arch/arm/configs/clps711x_defconfig
@@ -14,7 +14,6 @@ CONFIG_ARCH_EDB7211=y
 CONFIG_ARCH_P720T=y
 CONFIG_AEABI=y
 # CONFIG_COREDUMP is not set
-CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/arm/configs/collie_defconfig b/arch/arm/configs/collie_defconfig
index 6efac6d9c023..01b5a5a73f03 100644
--- a/arch/arm/configs/collie_defconfig
+++ b/arch/arm/configs/collie_defconfig
@@ -13,7 +13,6 @@ CONFIG_CMDLINE="noinitrd root=/dev/mtdblock2 rootfstype=jffs2 fbcon=rotate:1"
 CONFIG_FPE_NWFPE=y
 CONFIG_PM=y
 # CONFIG_SWAP is not set
-CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/arm/configs/multi_v4t_defconfig b/arch/arm/configs/multi_v4t_defconfig
index 9abc7aae83fa..27d650635d9b 100644
--- a/arch/arm/configs/multi_v4t_defconfig
+++ b/arch/arm/configs/multi_v4t_defconfig
@@ -25,7 +25,6 @@ CONFIG_ARM_CLPS711X_CPUIDLE=y
 CONFIG_JUMP_LABEL=y
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_COREDUMP is not set
-CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index e7f36aa5b782..af5f1c4ec084 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -40,7 +40,6 @@ CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=y
 # CONFIG_SWAP is not set
-CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 2d2102b19e95..f2ca5c9131b5 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -44,7 +44,6 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_LDM_PARTITION=y
 CONFIG_CMDLINE_PARTITION=y
 CONFIG_BINFMT_MISC=y
-CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
-- 
2.39.2

