Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD4CC4707B
	for <soc@archiver.kernel.org>; Thu, 11 Jan 2024 09:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4FBBC433C7; Thu, 11 Jan 2024 09:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D813AC433F1;
	Thu, 11 Jan 2024 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704965166;
	bh=NXgp43EUSotVmtSRPi3rKgnD5/iPJrz1R89HiWEwYcQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZSpntPGrlYLbePrC/39DFnDjx/BU6ezJ3fyoif2X2/b8sbn6N/1ekN7pGHWzvHl1B
	 CY79KyoOx2lCfgN/EJG2aOk7grtL9mVzh65IRiSA3nQ9P907pMvLtnZr+uBUh9pRzr
	 +h3sWOk3JfFwLU1m0wBldHoRQp3MQ5/5tiHy8HUjAfVTXjiHsEz/mAPy302HefGuqD
	 Nf1JoWZALYMMz/qi/TDgQcybbBoqyHjLf8YrMWP4SkHlwGEJ31GzjygWzfnVCNsFzT
	 iNdQcM1eAax+ruxPELbeMA7oVInFT3wkAtObaiEL6gSLGgwpeZhvzpUbPCDJ1Tc3GE
	 yxzpDMQ9uROww==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/6] ARM: defconfig: remove CONFIG_NET_ETHERNET references
Date: Thu, 11 Jan 2024 10:25:48 +0100
Message-Id: <20240111092550.1313277-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240111092550.1313277-1-arnd@kernel.org>
References: <20240111092550.1313277-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

CONFIG_NET_ETHERNET was removed a long time ago in f860b0522f65 ("drivers/net:
Kconfig and Makefile cleanup"). Remove the last references to in in ARM
defconfig files.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/am200epdkit_defconfig | 1 -
 arch/arm/configs/assabet_defconfig     | 1 -
 arch/arm/configs/footbridge_defconfig  | 1 -
 arch/arm/configs/jornada720_defconfig  | 1 -
 arch/arm/configs/mmp2_defconfig        | 1 -
 arch/arm/configs/mv78xx0_defconfig     | 1 -
 arch/arm/configs/neponset_defconfig    | 1 -
 arch/arm/configs/netwinder_defconfig   | 1 -
 arch/arm/configs/pxa168_defconfig      | 1 -
 arch/arm/configs/pxa3xx_defconfig      | 1 -
 arch/arm/configs/pxa910_defconfig      | 1 -
 arch/arm/configs/rpc_defconfig         | 1 -
 arch/arm/configs/spitz_defconfig       | 1 -
 13 files changed, 13 deletions(-)

diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
index 84c1c8e535b1..134a559aba3d 100644
--- a/arch/arm/configs/am200epdkit_defconfig
+++ b/arch/arm/configs/am200epdkit_defconfig
@@ -48,7 +48,6 @@ CONFIG_BLK_DEV_SD=m
 CONFIG_ATA=m
 CONFIG_PATA_PCMCIA=m
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_SMC91X=m
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_PXA=y
diff --git a/arch/arm/configs/assabet_defconfig b/arch/arm/configs/assabet_defconfig
index 8ba8eb7a4adf..07ab9eaac4af 100644
--- a/arch/arm/configs/assabet_defconfig
+++ b/arch/arm/configs/assabet_defconfig
@@ -28,7 +28,6 @@ CONFIG_MTD_SA1100=y
 CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_RAM=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_NET_PCMCIA=y
 CONFIG_PCMCIA_PCNET=y
 CONFIG_INPUT_EVDEV=y
diff --git a/arch/arm/configs/footbridge_defconfig b/arch/arm/configs/footbridge_defconfig
index c9f4594b7ca9..5f6963687ee4 100644
--- a/arch/arm/configs/footbridge_defconfig
+++ b/arch/arm/configs/footbridge_defconfig
@@ -55,7 +55,6 @@ CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_NET_VENDOR_3COM=y
 CONFIG_VORTEX=y
 CONFIG_NET_PCI=y
diff --git a/arch/arm/configs/jornada720_defconfig b/arch/arm/configs/jornada720_defconfig
index 394631bbbca5..e6ec768f42e2 100644
--- a/arch/arm/configs/jornada720_defconfig
+++ b/arch/arm/configs/jornada720_defconfig
@@ -25,7 +25,6 @@ CONFIG_ATA=y
 CONFIG_PATA_PCMCIA=y
 CONFIG_NETDEVICES=y
 CONFIG_DUMMY=y
-CONFIG_NET_ETHERNET=y
 CONFIG_NET_PCMCIA=y
 CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
 CONFIG_INPUT_MOUSEDEV_SCREEN_Y=240
diff --git a/arch/arm/configs/mmp2_defconfig b/arch/arm/configs/mmp2_defconfig
index ddba034117f5..f6f9e135353e 100644
--- a/arch/arm/configs/mmp2_defconfig
+++ b/arch/arm/configs/mmp2_defconfig
@@ -27,7 +27,6 @@ CONFIG_MTD_ONENAND_GENERIC=y
 CONFIG_MTD_RAW_NAND=y
 # CONFIG_BLK_DEV is not set
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_SMC91X=y
 # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
 # CONFIG_INPUT_KEYBOARD is not set
diff --git a/arch/arm/configs/mv78xx0_defconfig b/arch/arm/configs/mv78xx0_defconfig
index 93eddb71833b..3343f72de7ea 100644
--- a/arch/arm/configs/mv78xx0_defconfig
+++ b/arch/arm/configs/mv78xx0_defconfig
@@ -51,7 +51,6 @@ CONFIG_CHR_DEV_SG=m
 CONFIG_ATA=y
 CONFIG_SATA_MV=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_MII=y
 CONFIG_NET_PCI=y
 CONFIG_MV643XX_ETH=y
diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
index c333406ce5e3..2227f86100ad 100644
--- a/arch/arm/configs/neponset_defconfig
+++ b/arch/arm/configs/neponset_defconfig
@@ -38,7 +38,6 @@ CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_SCSI=m
 CONFIG_BLK_DEV_SD=m
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_NET_VENDOR_SMC=y
 CONFIG_PCMCIA_PCNET=y
 CONFIG_SMC9194=y
diff --git a/arch/arm/configs/netwinder_defconfig b/arch/arm/configs/netwinder_defconfig
index 30ff6fbce5a3..e639e6ad02cb 100644
--- a/arch/arm/configs/netwinder_defconfig
+++ b/arch/arm/configs/netwinder_defconfig
@@ -27,7 +27,6 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_PATA_WINBOND=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_MII=y
 CONFIG_NET_TULIP=y
 CONFIG_TULIP=y
diff --git a/arch/arm/configs/pxa168_defconfig b/arch/arm/configs/pxa168_defconfig
index 34d5ce65314b..ce10fe2104bf 100644
--- a/arch/arm/configs/pxa168_defconfig
+++ b/arch/arm/configs/pxa168_defconfig
@@ -21,7 +21,6 @@ CONFIG_IP_PNP=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_BLK_DEV is not set
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_SMC91X=y
 # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
 # CONFIG_INPUT_KEYBOARD is not set
diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
index e06dbd8816ae..381356faf382 100644
--- a/arch/arm/configs/pxa3xx_defconfig
+++ b/arch/arm/configs/pxa3xx_defconfig
@@ -33,7 +33,6 @@ CONFIG_MTD_NAND_MARVELL=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_SMC91X=y
 # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
 # CONFIG_KEYBOARD_ATKBD is not set
diff --git a/arch/arm/configs/pxa910_defconfig b/arch/arm/configs/pxa910_defconfig
index 4f4b46b86dc9..1f28aea86014 100644
--- a/arch/arm/configs/pxa910_defconfig
+++ b/arch/arm/configs/pxa910_defconfig
@@ -22,7 +22,6 @@ CONFIG_IP_PNP=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_BLK_DEV is not set
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_SMC91X=y
 # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
 # CONFIG_INPUT_KEYBOARD is not set
diff --git a/arch/arm/configs/rpc_defconfig b/arch/arm/configs/rpc_defconfig
index 30b093c491ba..24f1fa868230 100644
--- a/arch/arm/configs/rpc_defconfig
+++ b/arch/arm/configs/rpc_defconfig
@@ -45,7 +45,6 @@ CONFIG_ATA=y
 CONFIG_PATA_ICSIDE=y
 CONFIG_PATA_PLATFORM=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_ARM_ETHER1=y
 CONFIG_ARM_ETHER3=y
 CONFIG_ARM_ETHERH=y
diff --git a/arch/arm/configs/spitz_defconfig b/arch/arm/configs/spitz_defconfig
index 72c14b8345de..294d16ddeb18 100644
--- a/arch/arm/configs/spitz_defconfig
+++ b/arch/arm/configs/spitz_defconfig
@@ -86,7 +86,6 @@ CONFIG_CHR_DEV_SG=m
 CONFIG_ATA=y
 CONFIG_PATA_PCMCIA=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_PCMCIA_PCNET=m
 CONFIG_PPP=m
 CONFIG_PPP_BSDCOMP=m
-- 
2.39.2

