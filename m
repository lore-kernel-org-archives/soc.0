Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983FAC47077
	for <soc@archiver.kernel.org>; Thu, 11 Jan 2024 09:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E3B5C433C7; Thu, 11 Jan 2024 09:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E923C43394;
	Thu, 11 Jan 2024 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704965165;
	bh=8QrUOHLW+4aq7g83zJYx7AR/QcEBCMOkvF3anr4+p0A=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SljeHMB4f7Jaw4ofAI8/WR6Ayu0bY44/y0EaQ7L7HBXyqfTy7XTRSxD31F0pPi83o
	 8OLRUEHNDBt1priWc0NN8IOxr2wXkx9E9J71xJhFPPRkVYhe6V8OVNKRzBPx7u9ae7
	 XCYMjZvZhYvt/Vsk5drctRkEhj9IMJYrFd56meeVHk3RH0BUYO155nb1Uf+Fo7A74z
	 CUDgn48P564VhwWsL4IrXlaKfslWDdw72gS2IMuRCDoomerMMYJTtOMwkoPeVQhr/b
	 IfujIC0Q/MwOLkfAFT4N4X1NOZYPuNMbL4e2LqXhL+GdpsqBJbobcrNeqHFRBBmGbg
	 78o0ZqvWdltBQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/6] ARM: defconfig: remove sysfs-deprecated entries
Date: Thu, 11 Jan 2024 10:25:47 +0100
Message-Id: <20240111092550.1313277-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240111092550.1313277-1-arnd@kernel.org>
References: <20240111092550.1313277-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

These were removed last year in commit 721da5cee9d4 ("driver core:
remove CONFIG_SYSFS_DEPRECATED and CONFIG_SYSFS_DEPRECATED_V2"),
so remove the last references to them in arm config files.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/am200epdkit_defconfig | 1 -
 arch/arm/configs/jornada720_defconfig  | 1 -
 arch/arm/configs/lpc32xx_defconfig     | 2 --
 arch/arm/configs/mmp2_defconfig        | 1 -
 arch/arm/configs/mv78xx0_defconfig     | 1 -
 arch/arm/configs/pxa168_defconfig      | 1 -
 arch/arm/configs/pxa3xx_defconfig      | 1 -
 arch/arm/configs/pxa910_defconfig      | 1 -
 arch/arm/configs/s3c6400_defconfig     | 2 --
 arch/arm/configs/s5pv210_defconfig     | 2 --
 arch/arm/configs/sama7_defconfig       | 2 --
 arch/arm/configs/spitz_defconfig       | 1 -
 12 files changed, 16 deletions(-)

diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
index a25834e4c901..84c1c8e535b1 100644
--- a/arch/arm/configs/am200epdkit_defconfig
+++ b/arch/arm/configs/am200epdkit_defconfig
@@ -1,6 +1,5 @@
 CONFIG_LOCALVERSION="gum"
 CONFIG_SYSVIPC=y
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_PREEMPT=y
 CONFIG_EXPERT=y
 # CONFIG_EPOLL is not set
diff --git a/arch/arm/configs/jornada720_defconfig b/arch/arm/configs/jornada720_defconfig
index 91bdcc095884..394631bbbca5 100644
--- a/arch/arm/configs/jornada720_defconfig
+++ b/arch/arm/configs/jornada720_defconfig
@@ -1,6 +1,5 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_ARCH_MULTI_V4=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_SA1100=y
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index 42053e45f730..98e267213b21 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -5,8 +5,6 @@ CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
-CONFIG_SYSFS_DEPRECATED=y
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EXPERT=y
diff --git a/arch/arm/configs/mmp2_defconfig b/arch/arm/configs/mmp2_defconfig
index 3d1d6f3b592a..ddba034117f5 100644
--- a/arch/arm/configs/mmp2_defconfig
+++ b/arch/arm/configs/mmp2_defconfig
@@ -2,7 +2,6 @@ CONFIG_SYSVIPC=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SYSFS_DEPRECATED_V2=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_ARCH_MMP=y
 CONFIG_AEABI=y
diff --git a/arch/arm/configs/mv78xx0_defconfig b/arch/arm/configs/mv78xx0_defconfig
index 4ed6e8c8e164..93eddb71833b 100644
--- a/arch/arm/configs/mv78xx0_defconfig
+++ b/arch/arm/configs/mv78xx0_defconfig
@@ -3,7 +3,6 @@ CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
diff --git a/arch/arm/configs/pxa168_defconfig b/arch/arm/configs/pxa168_defconfig
index ec3a43f9c85e..34d5ce65314b 100644
--- a/arch/arm/configs/pxa168_defconfig
+++ b/arch/arm/configs/pxa168_defconfig
@@ -1,5 +1,4 @@
 CONFIG_SYSVIPC=y
-CONFIG_SYSFS_DEPRECATED_V2=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
index 7f95fa273a7d..e06dbd8816ae 100644
--- a/arch/arm/configs/pxa3xx_defconfig
+++ b/arch/arm/configs/pxa3xx_defconfig
@@ -1,7 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=18
-CONFIG_SYSFS_DEPRECATED_V2=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arm/configs/pxa910_defconfig b/arch/arm/configs/pxa910_defconfig
index 958d958377dc..4f4b46b86dc9 100644
--- a/arch/arm/configs/pxa910_defconfig
+++ b/arch/arm/configs/pxa910_defconfig
@@ -3,7 +3,6 @@ CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_ARCH_MMP=y
 CONFIG_CMDLINE="root=/dev/nfs rootfstype=nfs nfsroot=192.168.2.100:/nfsroot/ ip=192.168.2.101:192.168.2.100::255.255.255.0::eth0:on console=ttyS0,115200 mem=128M earlyprintk"
diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
index 93258d5b57ff..a37e6ac40825 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -1,5 +1,3 @@
-CONFIG_SYSFS_DEPRECATED=y
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_ARCH_MULTI_V6=y
diff --git a/arch/arm/configs/s5pv210_defconfig b/arch/arm/configs/s5pv210_defconfig
index d280169081bd..5dbe85c263de 100644
--- a/arch/arm/configs/s5pv210_defconfig
+++ b/arch/arm/configs/s5pv210_defconfig
@@ -3,8 +3,6 @@ CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_CGROUPS=y
-CONFIG_SYSFS_DEPRECATED=y
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_ARCH_S5PV210=y
diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index 6777f0a1cc60..7fa5d251ced2 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -6,8 +6,6 @@ CONFIG_LOG_BUF_SHIFT=16
 CONFIG_CGROUPS=y
 CONFIG_CGROUP_DEBUG=y
 CONFIG_NAMESPACES=y
-CONFIG_SYSFS_DEPRECATED=y
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_FHANDLE is not set
diff --git a/arch/arm/configs/spitz_defconfig b/arch/arm/configs/spitz_defconfig
index 10108b4a978e..72c14b8345de 100644
--- a/arch/arm/configs/spitz_defconfig
+++ b/arch/arm/configs/spitz_defconfig
@@ -2,7 +2,6 @@ CONFIG_SYSVIPC=y
 CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SYSFS_DEPRECATED_V2=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_EXPERT=y
 CONFIG_PROFILING=y
-- 
2.39.2

