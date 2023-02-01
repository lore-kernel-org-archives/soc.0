Return-Path: <SRS0=7X9i=55=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A070CC05027
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 05:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62714C433A0; Wed,  1 Feb 2023 05:15:46 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3CA4AC4339B
	for <soc@kernel.org>; Wed,  1 Feb 2023 05:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3CA4AC4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so862572pjb.1
        for <soc@kernel.org>; Tue, 31 Jan 2023 21:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XU7B2HodrmZ+2U0B9nn/Gxwop5Fsqw3mGRGEIhjxZQU=;
        b=oie8loXX31obAlC0/4l2TNIl9v7iBGZA4wruGWa10n5/1hul/7A2WjubmchbSgMlbK
         z8VoCZXn6/T9hFUpHsJq5AiyQafid6dH59oK02ifWPAEJ5B91uYv10wFsCXLtx4B/+f6
         yO+2IsxwG9Tiy10E11VwJoLENCZMAOd0FYssLuiLM5c4ZwqAzqN11IfBiMcDN8h37Gzt
         F9j9u9RDheBo9DWo8gpwcBnFFcVqFe1xj7Jec0Zx5myIoYxLM8XYMQMYhq1fgiB8a7RN
         /BCycG+13+eLeFwH6TltVbX/qovhH1ru8GPhhUKG/Ataq8GLZmA1y2bApBDNAxGG1bm9
         Ywdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XU7B2HodrmZ+2U0B9nn/Gxwop5Fsqw3mGRGEIhjxZQU=;
        b=nse2R0oxL8b+FIro/1QOl35J9nPtagUo10jtfnHDzBn61CiAore6HsCZZAEb7eYxsu
         elJ42NUQXy6dA1ZIzkAeRDk3rFOEEqrk7Ra+13UN1DZSk8LVGaNwqA3QjUGtCQnne27f
         9SAgWH44nxvr/mz0XXvOWi2SKjxupuOZmXQNv32+nW9bmz4BIdTkFziMfJGL/mNrDrAW
         5dJ7jrZ8dhN0/Ewxdw1wUUcqKVqxNc1chhU4vKlFcC8Tr+XK8zJAyGkaKs8YiW9GS4Zm
         iWbfJbh8WnzXiOAH7fAmPmT2IHmnYWdlpyK9RFqplLRwrKAxOo0lrnjsPAw+SGSI3Gfl
         N3rA==
X-Gm-Message-State: AO0yUKV2RtHUCJzA0uXQN3wXANQszfxPCEOiCFklMpCOoekFA2SBq4E5
	Ank4Q3xtbn5Iznkvb6gxzaPD2iQdQjk=
X-Google-Smtp-Source: AK7set+nX6P0+x9gFYRBwNZUOjj3Q0xioaQh0/B4+bC5E7LfzsoDZP1smWvslxQ8T9Wj7dCdCKdMlg==
X-Received: by 2002:a05:6a20:1aa5:b0:be:b878:6d71 with SMTP id ci37-20020a056a201aa500b000beb8786d71mr1155038pzb.7.1675228542829;
        Tue, 31 Jan 2023 21:15:42 -0800 (PST)
Received: from voyager.ibm.com ([125.63.148.35])
        by smtp.gmail.com with ESMTPSA id s5-20020a637705000000b004da425922c6sm9452595pgc.74.2023.01.31.21.15.40
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 21:15:41 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] ARM: Add wpcm450_defconfig for Nuvoton WPCM450
Date: Wed,  1 Feb 2023 15:45:34 +1030
Message-Id: <20230201051534.1005847-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

This defconfig aims to offer a reasonable set of defaults for all
systems running on a Nuvoton WPCM450 chip.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/20230129041547.942335-1-j.neuschaefer@gmx.net
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Soc maintainers, please queue for v6.3

 MAINTAINERS                        |   1 +
 arch/arm/configs/wpcm450_defconfig | 211 +++++++++++++++++++++++++++++
 2 files changed, 212 insertions(+)
 create mode 100644 arch/arm/configs/wpcm450_defconfig

diff --git a/MAINTAINERS b/MAINTAINERS
index f61eb221415b..4cb2141def3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2610,6 +2610,7 @@ S:	Maintained
 W:	https://github.com/neuschaefer/wpcm450/wiki
 F:	Documentation/devicetree/bindings/*/*wpcm*
 F:	arch/arm/boot/dts/nuvoton-wpcm450*
+F:	arch/arm/configs/wpcm450_defconfig
 F:	arch/arm/mach-npcm/wpcm450.c
 F:	drivers/*/*/*wpcm*
 F:	drivers/*/*wpcm*
diff --git a/arch/arm/configs/wpcm450_defconfig b/arch/arm/configs/wpcm450_defconfig
new file mode 100644
index 000000000000..45483deab034
--- /dev/null
+++ b/arch/arm/configs/wpcm450_defconfig
@@ -0,0 +1,211 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=19
+CONFIG_CGROUPS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_PROFILING=y
+# CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_NPCM=y
+CONFIG_ARCH_WPCM450=y
+CONFIG_CPU_DCACHE_WRITETHROUGH=y
+CONFIG_AEABI=y
+CONFIG_UACCESS_WITH_MEMCPY=y
+# CONFIG_ATAGS is not set
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_CPU_IDLE=y
+CONFIG_KPROBES=y
+CONFIG_JUMP_LABEL=y
+CONFIG_STRICT_KERNEL_RWX=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_PACKET_DIAG=y
+CONFIG_UNIX=y
+CONFIG_UNIX_DIAG=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_NET_DSA=y
+CONFIG_NET_DSA_TAG_DSA=y
+CONFIG_NET_DSA_TAG_EDSA=y
+CONFIG_NET_DSA_TAG_TRAILER=y
+CONFIG_NET_PKTGEN=m
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_FASTMAP=y
+CONFIG_MTD_UBI_BLOCK=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_SRAM=y
+CONFIG_EEPROM_AT24=y
+CONFIG_SCSI=y
+# CONFIG_SCSI_PROC_FS is not set
+# CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_AMAZON is not set
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CADENCE is not set
+# CONFIG_NET_VENDOR_CAVIUM is not set
+# CONFIG_NET_VENDOR_CIRRUS is not set
+# CONFIG_NET_VENDOR_CORTINA is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
+# CONFIG_NET_VENDOR_FARADAY is not set
+# CONFIG_NET_VENDOR_GOOGLE is not set
+# CONFIG_NET_VENDOR_HISILICON is not set
+# CONFIG_NET_VENDOR_HUAWEI is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MELLANOX is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MICROSEMI is not set
+# CONFIG_NET_VENDOR_NI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_PENSANDO is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_RENESAS is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_SOCIONEXT is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+# CONFIG_NET_VENDOR_XILINX is not set
+CONFIG_REALTEK_PHY=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_FF_MEMLESS=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_QT1070=m
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_LEGACY_PTY_COUNT=16
+# CONFIG_LEGACY_TIOCSTI is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=6
+CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_NPCM7XX_KCS_IPMI_BMC=y
+CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
+CONFIG_IPMI_KCS_BMC_SERIO=y
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_NPCM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_NPCM=y
+CONFIG_SPI=y
+CONFIG_SPI_WPCM_FIU=y
+CONFIG_SPI_NPCM_PSPI=y
+CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_WPCM450=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_SENSORS_NPCM7XX=y
+# CONFIG_THERMAL is not set
+CONFIG_WATCHDOG=y
+CONFIG_NPCM7XX_WATCHDOG=y
+CONFIG_MFD_SYSCON=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_FB=y
+CONFIG_FB_MODE_HELPERS=y
+# CONFIG_HID is not set
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_CONFIGFS=y
+CONFIG_USB_CONFIGFS_SERIAL=y
+CONFIG_USB_CONFIGFS_ACM=y
+CONFIG_USB_CONFIGFS_EEM=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+CONFIG_USB_CONFIGFS_F_FS=y
+CONFIG_USB_CONFIGFS_F_HID=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_DMADEVICES=y
+CONFIG_SYNC_FILE=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+CONFIG_STAGING=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_PWM=y
+CONFIG_GENERIC_PHY=y
+CONFIG_PECI=y
+CONFIG_PECI_CPU=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_UBIFS_FS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_XZ=y
+CONFIG_SQUASHFS_ZSTD=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_2=y
+CONFIG_NLS_UTF8=y
+CONFIG_KEYS=y
+CONFIG_HARDENED_USERCOPY=y
+CONFIG_FORTIFY_SOURCE=y
+CONFIG_CRYPTO_RSA=y
+CONFIG_CRYPTO_AES=y
+CONFIG_CRYPTO_CBC=m
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_CCM=y
+CONFIG_CRYPTO_GCM=y
+CONFIG_CRYPTO_CMAC=y
+CONFIG_CRYPTO_SHA256=y
+CONFIG_ASYMMETRIC_KEY_TYPE=y
+CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
+CONFIG_X509_CERTIFICATE_PARSER=y
+CONFIG_PKCS7_MESSAGE_PARSER=y
+CONFIG_SYSTEM_TRUSTED_KEYRING=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC_ITU_T=m
+CONFIG_LIBCRC32C=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_PREEMPT is not set
+# CONFIG_FTRACE is not set
+CONFIG_IO_STRICT_DEVMEM=y
+CONFIG_DEBUG_USER=y
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_LL_UART_8250=y
+CONFIG_DEBUG_UART_PHYS=0xb8000000
+CONFIG_DEBUG_UART_VIRT=0x0ff000000
+CONFIG_DEBUG_UART_8250_WORD=y
+CONFIG_EARLY_PRINTK=y
-- 
2.39.1

