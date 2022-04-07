Return-Path: <SRS0=0sZe=UR=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE0FC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 20:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D496C385A4; Thu,  7 Apr 2022 20:47:26 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A1FBC385A9
	for <soc@kernel.org>; Thu,  7 Apr 2022 20:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A1FBC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id c15so8975739ljr.9
        for <soc@kernel.org>; Thu, 07 Apr 2022 13:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2n65UbWupSERe287m8Jn88jepNxBnqGltcmJEOttCFc=;
        b=DwuJ3uQ/S0KbbJq19Hc8FcP5eHSwa5XVzKUtbaIqWnUHXENpH0fSyAvv7bCdegwbOV
         T50o1G+ftK87S0t9OyxVA+urubhlI/KwrmIFkPEmkh2UZKqwvAUP1EQ79E/482DJC/gi
         hvyoIHdZMKBpGQdpIkuNdaTMJv5GhqGKJBGMsppUZvQWXavxD3hqLmathg6SQT77PtSO
         XWx0dmXOEEUAweBTl0JGtY6aIc5CdUQQgRo/0EfLIE1GHGZjGeexYJGvkivwa0xP6Dx3
         45XzitcUVtlp5z6idbV+z8YTKAKE/sXlTn8vlV/X/89L7YatW4AlmwfMY3agMKHMDYrW
         OIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2n65UbWupSERe287m8Jn88jepNxBnqGltcmJEOttCFc=;
        b=tGsmWVFcXFDuAXHwoPtsl6E2c/+h8R0ZZyz05mqFR/btUOSAwCjspfU6q+O3feYDAz
         M6JZWjqCCDf2yZY5AfWXTkx2Wwz4B9NEqA7o7vn+aLhccMZAyuVjUaNwEdAOk46nMgNZ
         NHjxK++0UryDiGYDe+/puWNapsLhEzyx62royfwhsSx3Syn5NWc6NztoWVHcYqvFnPWW
         tzpSAbT9HN6xYTwDdZmoCMZOojC/C3Rz0U7WZei1A2fy7jACjNjaYVLU8rfqQXQKuC9O
         vct8ktW41msujRGB42kCa2VYzUk2x6ZA5XlYtZVMhuiuNchFO+ZBODY+TCg0UnIMJHLr
         aERw==
X-Gm-Message-State: AOAM533ePyI3JfdDsJ5e/yIR85l4xbycfZDl2Os9gg0EowmFfeVA69Be
	si6M+8WT/EZFFDXem1zyGKO2BQ==
X-Google-Smtp-Source: ABdhPJzEcp3GcL/2mHJrmOGd8E25PGDF6gebUz7rigs9Zmu7L2wtpfRuSZG9wBFQQMEkYP6OR1N2AA==
X-Received: by 2002:a2e:a693:0:b0:24a:c41a:a3e3 with SMTP id q19-20020a2ea693000000b0024ac41aa3e3mr9387780lje.330.1649364440041;
        Thu, 07 Apr 2022 13:47:20 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id c5-20020a2e9d85000000b0024b1571209csm1467132ljj.0.2022.04.07.13.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 13:47:19 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Imre Kaloz <kaloz@openwrt.org>
Subject: [PATCH] ARM: config: Refresh IXP4xx config after multiplatform
Date: Thu,  7 Apr 2022 22:45:02 +0200
Message-Id: <20220407204502.2470560-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After converting to multiplatform the old IXP4xx defconfig
doesn't even activate the ethernet driver anymore, we need
to refresh this thoroughly.

- Drop options that ARCH_MULTI_V5 selects for us.
- Some options moved around because of multiplatform and
  because generic Kconfig movements.
- Explicitly deselect ARCH_MULTI_V7 so ARCH_MULTI_V5
  becomes available and we can select ARCH_IXP4XX
- Drop all MACH_* that do not exist anymore.
- Compress the kernel and initramfs with XZ as the memory
  is often limited for these machines.
- Make sure IXP4XX_QMGR and IXP4XX_NPE is selected.
- Make sure the MTD_PHYSMAP_IXP4XX is selected and not
  the old MTD_IXP4XX (will be deleted).
- Activate CRYPTO_DEV_IXP4XX
- Add some very basic default drivers such as AT24 EEPROMs
  used in many routers.
- Add some kernel configs needed to bring up OpenWrt
  which is the only userspace for these devices:
  CGROUPS, DEVTMPFS, INOTIFY_USER, SIGNALFD, TIMERFD,
  EPOLL, OVERLAY_FS and SQUASHFS.

Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Halasa <khalasa@piap.pl>
Cc: Imre Kaloz <kaloz@openwrt.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This needs to go into v5.19 with Arnd's multiplatform
rework.
---
 arch/arm/configs/ixp4xx_defconfig | 88 ++++++++++++-------------------
 1 file changed, 35 insertions(+), 53 deletions(-)

diff --git a/arch/arm/configs/ixp4xx_defconfig b/arch/arm/configs/ixp4xx_defconfig
index 9a7667383df9..960978a23d16 100644
--- a/arch/arm/configs/ixp4xx_defconfig
+++ b/arch/arm/configs/ixp4xx_defconfig
@@ -1,36 +1,22 @@
+CONFIG_KERNEL_XZ=y
 CONFIG_SYSVIPC=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_COMPRESSION_XZ=y
 CONFIG_EXPERT=y
-CONFIG_MODULES=y
-CONFIG_MODVERSIONS=y
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_IXP4XX=y
-CONFIG_MACH_NSLU2=y
-CONFIG_MACH_AVILA=y
-CONFIG_MACH_LOFT=y
-CONFIG_ARCH_ADI_COYOTE=y
-CONFIG_MACH_GATEWAY7001=y
-CONFIG_MACH_WG302V2=y
-CONFIG_ARCH_IXDP425=y
-CONFIG_MACH_IXDPG425=y
-CONFIG_MACH_IXDP465=y
-CONFIG_MACH_KIXRP435=y
-CONFIG_ARCH_PRPMC1100=y
-CONFIG_MACH_NAS100D=y
-CONFIG_MACH_DSMG600=y
-CONFIG_MACH_FSG=y
-CONFIG_MACH_GTWX5715=y
-CONFIG_IXP4XX_QMGR=y
-CONFIG_IXP4XX_NPE=y
 # CONFIG_ARM_THUMB is not set
 CONFIG_CPU_BIG_ENDIAN=y
 CONFIG_AEABI=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=ttyS0,115200 ip=bootp root=/dev/nfs"
-CONFIG_FPE_NWFPE=y
+CONFIG_CMDLINE="console=ttyS0,115200"
+CONFIG_STRICT_KERNEL_RWX=y
+CONFIG_STRICT_MODULE_RWX=y
+CONFIG_MODULES=y
+CONFIG_MODVERSIONS=y
+CONFIG_PARTITION_ADVANCED=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -43,8 +29,6 @@ CONFIG_IP_ROUTE_VERBOSE=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
-CONFIG_NET_IPGRE=m
-CONFIG_NET_IPGRE_BROADCAST=y
 CONFIG_IP_MROUTE=y
 CONFIG_IP_PIMSM_V1=y
 CONFIG_IP_PIMSM_V2=y
@@ -65,7 +49,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_TARGET_LOG=m
 CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_ARPTABLES=m
 CONFIG_IP_NF_ARPFILTER=m
@@ -76,14 +59,12 @@ CONFIG_ATM_MPOA=m
 CONFIG_ATM_BR2684=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
-CONFIG_IPX=m
 CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
 CONFIG_X25=m
 CONFIG_LAPB=m
-CONFIG_WAN_ROUTER=m
 CONFIG_NET_SCHED=y
 CONFIG_NET_SCH_CBQ=m
 CONFIG_NET_SCH_HTB=m
@@ -104,91 +85,92 @@ CONFIG_NET_CLS_RSVP6=m
 CONFIG_NET_CLS_ACT=y
 CONFIG_NET_ACT_POLICE=y
 CONFIG_NET_PKTGEN=m
+CONFIG_DEVTMPFS=y
 CONFIG_MTD=y
 CONFIG_MTD_REDBOOT_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_COMPLEX_MAPPINGS=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_COMPLEX_MAPPINGS=y
-CONFIG_MTD_IXP4XX=y
+CONFIG_MTD_PHYSMAP_IXP4XX=y
 CONFIG_MTD_RAW_NAND=m
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_LEGACY=y
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
+# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_SCSI_LOWLEVEL is not set
 CONFIG_ATA=y
-CONFIG_SATA_VIA=y
-CONFIG_PATA_ARTOP=y
-CONFIG_PATA_CMD64X=y
-CONFIG_PATA_HPT366=y
-CONFIG_PATA_HPT37X=y
-CONFIG_PATA_HPT3X2N=y
-CONFIG_PATA_PDC2027X=y
 CONFIG_PATA_IXP4XX_CF=y
 CONFIG_NETDEVICES=y
 CONFIG_DUMMY=y
-CONFIG_NET_ETHERNET=y
-CONFIG_MII=y
+CONFIG_ATM_TCP=m
 CONFIG_IXP4XX_ETH=y
-CONFIG_NET_PCI=y
 CONFIG_WAN=y
-CONFIG_HDLC=m
+CONFIG_HDLC=y
 CONFIG_HDLC_RAW=m
 CONFIG_HDLC_CISCO=m
 CONFIG_HDLC_FR=m
 CONFIG_HDLC_PPP=m
-CONFIG_HDLC_X25=m
-CONFIG_WAN_ROUTER_DRIVERS=m
-CONFIG_ATM_TCP=m
-# CONFIG_INPUT_KEYBOARD is not set
+CONFIG_IXP4XX_HSS=m
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_MISC=y
-CONFIG_INPUT_IXP4XX_BEEPER=y
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=2
+CONFIG_SERIAL_8250_RUNTIME_UARTS=2
 CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_I2C=y
+CONFIG_HW_RANDOM=y
 CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_GPIO=y
+CONFIG_GPIO_GW_PLD=y
+CONFIG_GPIO_PCA953X=y
+CONFIG_SENSORS_AD7418=y
 CONFIG_SENSORS_W83781D=y
 CONFIG_WATCHDOG=y
 CONFIG_IXP4XX_WATCHDOG=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_UHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_FSG=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_DISK=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_DS1672=y
 CONFIG_RTC_DRV_ISL1208=y
 CONFIG_RTC_DRV_X1205=y
 CONFIG_RTC_DRV_PCF8563=y
+CONFIG_IXP4XX_QMGR=y
+CONFIG_IXP4XX_NPE=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_POSIX_ACL=y
+CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_JFFS2_FS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_XZ=y
 CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
 CONFIG_ROOT_NFS=y
-CONFIG_PARTITION_ADVANCED=y
+CONFIG_CRYPTO_DEV_IXP4XX=y
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_LL=y
 CONFIG_DEBUG_LL_UART_8250=y
-- 
2.35.1

