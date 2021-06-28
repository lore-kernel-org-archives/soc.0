Return-Path: <SRS0=YMvz=LW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC00C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jun 2021 12:07:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 684B361C69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jun 2021 12:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 684B361C69
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzKFs7qjvQoKq//eSGG+CRdCX8CZA5bbJJMnNXLxNN4=; b=GCL12V0CsVrGKt
	dwPZbcquR7rPvdXomiYSQXvmwEWoawfGejjI2EqIttJaGmMGv3Chn6GmmhdEimoEDaA2iMtdSiLyK
	JcvHyp6R8pWBSFxIYalO3Md/xo7ko73QjhnDSC5/bB76cMBF0mKBcwUXjLt7a/S7gWSiUYXgUY8Me
	fwyyxp8Kc6h0UCWfPhx9Y21bQBIXVezYavstmzwXbvMvAiaAcxm0CzsZTB29WKFz3hVorQrUZvPFb
	tGKAASlm6EUrH3pODVZ6ufm/VLY+53TjFTsDODGJwCpBi7VcJgYlHYIWl5Pr+CLvm4ca2dCqvhuK0
	RNCorgnuSdwfSgl99Jsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxq1F-007rLu-IK; Mon, 28 Jun 2021 12:05:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxq0x-007rIx-Bz
 for linux-arm-kernel@lists.infradead.org; Mon, 28 Jun 2021 12:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624881923; x=1656417923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5C3xUPSMq8l7+W1NKGSoRKfdYUwc7FFNu5XkOVcCoDQ=;
 b=jtccTpZ2I4HnSkKq1/LqjppP3EPkwcGXm92iJKHRBLUuQVwONrcMhZHq
 s5I30rgB33oGSu7B0Ans1GvgAUADZ5Fp1Hkq2TzKUk/LNcwQeUeT4jYQf
 4McRKrJYio9bzjcxA/B3mL3O7sKoGvcE9edE7e/Rv20x+w7GQk4f9n1eD
 FThYGpxTFuQPCmCGw45d7Js0thIKVdk5ncagjUe+/BHMVmrj2kA3WlrSk
 lujIJZcDO0mEAcHzrGBkBm5+fe5oPE5yQ6eL4v7S/bSv4TUevTTzMi1w2
 0D4NcyJpCpcXSJUb7dGq9i/glQT01DTDZmoS6+A2G6O7fzNVFIpSAHY6L A==;
IronPort-SDR: pilgTavyirxWzvS3q8teyzrno9AwmJObc4BPOznHecQYtFxMj/p0ZhnaA8jMJBeONIWRamZEdY
 R+3ClJ77B+DsxMAXHLu/CqkLe7YAHAtLmTUdarL/1/9zG+0vjg1SZUlDIsBIcFXDNGubh7EUzd
 4dM7dilsdS5hai86rLy2U7aFq17mJQJpSUcXJ42aMMLGVIYpirgjik9Emi8HFSfIYZgJntQypA
 LOoutML0Hs5Le4z54HI7NgluLa7gMIkqNWtFuaHUCCnntyiB13kBD/FnBtFOM0oLRuHyOHDFbL
 NbI=
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="126883261"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2021 05:05:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 05:05:20 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 28 Jun 2021 05:05:17 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <nicolas.ferre@microchip.com>, <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <soc@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <ludovic.desroches@microchip.com>,
 <claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>
Subject: [PATCH v5 3/4] ARM: configs: at91: add defconfig for sama7 family of
 SoCs
Date: Mon, 28 Jun 2021 15:04:51 +0300
Message-ID: <20210628120452.74408-3-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628120452.74408-1-eugen.hristev@microchip.com>
References: <20210628120452.74408-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_050523_468530_D9925EF9 
X-CRM114-Status: GOOD (  12.02  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210628120451.Ya4P1TJ_ARnl_rL2Vltz7NnpCcBQPgmRIipk_zXt-sg@z>

Add defconfig for sama7 SoC family.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
[claudiu.beznea@microchip.com: add clocks, ethernet, timers, power]
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
[codrin.ciubotariu@microchip.com: add audio]
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
[nicolas.ferre@microchip.com: atags not set, mtd tests, spi gpio]
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Changes in v5:
- +# CONFIG_ATAGS is not set
- +CONFIG_MTD_TESTS=m
- +CONFIG_SPI_GPIO=y
- remove cpu freq configs.

 arch/arm/configs/sama7_defconfig | 209 +++++++++++++++++++++++++++++++
 1 file changed, 209 insertions(+)
 create mode 100644 arch/arm/configs/sama7_defconfig

diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
new file mode 100644
index 000000000000..938aae4bd80b
--- /dev/null
+++ b/arch/arm/configs/sama7_defconfig
@@ -0,0 +1,209 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_DEBUG=y
+CONFIG_NAMESPACES=y
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_FHANDLE is not set
+# CONFIG_IO_URING is not set
+CONFIG_KALLSYMS_ALL=y
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+CONFIG_SLAB=y
+CONFIG_ARCH_AT91=y
+CONFIG_SOC_SAMA7G5=y
+CONFIG_ATMEL_CLOCKSOURCE_TCB=y
+# CONFIG_CACHE_L2X0 is not set
+# CONFIG_ARM_PATCH_IDIV is not set
+# CONFIG_CPU_SW_DOMAIN_PAN is not set
+CONFIG_FORCE_MAX_ZONEORDER=15
+CONFIG_UACCESS_WITH_MEMCPY=y
+# CONFIG_ATAGS is not set
+CONFIG_CMDLINE="console=ttyS0,115200 earlyprintk ignore_loglevel"
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_COREDUMP is not set
+# CONFIG_COMPACTION is not set
+CONFIG_CMA=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+# CONFIG_INET_DIAG is not set
+CONFIG_IPV6_SIT_6RD=y
+CONFIG_BRIDGE=m
+CONFIG_BRIDGE_VLAN_FILTERING=y
+CONFIG_NET_DSA=m
+CONFIG_VLAN_8021Q=m
+CONFIG_CAN=y
+CONFIG_CAN_M_CAN=y
+CONFIG_CAN_M_CAN_PLATFORM=y
+CONFIG_BT=y
+CONFIG_BT_RFCOMM=y
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=y
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=y
+CONFIG_BT_HCIBTUSB=y
+CONFIG_BT_HCIUART=y
+CONFIG_BT_HCIUART_H4=y
+CONFIG_BT_HCIVHCI=y
+CONFIG_CFG80211=m
+# CONFIG_CFG80211_DEFAULT_PS is not set
+CONFIG_CFG80211_DEBUGFS=y
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=m
+CONFIG_MAC80211_LEDS=y
+CONFIG_RFKILL=y
+CONFIG_RFKILL_INPUT=y
+CONFIG_PCCARD=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_MTD=y
+CONFIG_MTD_TESTS=m
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_EEPROM_AT24=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_NETDEVICES=y
+CONFIG_MACB=y
+CONFIG_MICREL_PHY=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_LEGACY_PTY_COUNT=4
+CONFIG_SERIAL_ATMEL=y
+CONFIG_SERIAL_ATMEL_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_AT91=y
+CONFIG_SPI=y
+CONFIG_SPI_MEM=y
+CONFIG_SPI_ATMEL=y
+CONFIG_SPI_GPIO=y
+CONFIG_PINCTRL_AT91=y
+CONFIG_PINCTRL_AT91PIO4=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_AT91_RESET=y
+CONFIG_POWER_RESET_AT91_SAMA5D2_SHDWC=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_SAMA5D4_WATCHDOG=y
+CONFIG_MFD_ATMEL_FLEXCOM=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_MCP16502=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_SUPPORT_FILTER=y
+# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_IMX219=m
+CONFIG_VIDEO_IMX274=m
+CONFIG_VIDEO_OV5647=m
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SOC=y
+CONFIG_SND_ATMEL_SOC=y
+CONFIG_SND_SOC_MIKROE_PROTO=m
+CONFIG_SND_MCHP_SOC_I2S_MCC=y
+CONFIG_SND_MCHP_SOC_SPDIFTX=y
+CONFIG_SND_MCHP_SOC_SPDIFRX=y
+CONFIG_SND_SOC_PCM5102A=y
+CONFIG_SND_SOC_SPDIF=y
+CONFIG_SND_SIMPLE_CARD=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_DYNAMIC_MINORS=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
+CONFIG_USB_GADGET=y
+CONFIG_U_SERIAL_CONSOLE=y
+CONFIG_USB_ATMEL_USBA=m
+CONFIG_USB_CONFIGFS=y
+CONFIG_USB_CONFIGFS_ACM=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+CONFIG_USB_CONFIGFS_F_UVC=y
+CONFIG_USB_G_SERIAL=m
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_AT91=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_RTC_CLASS=y
+# CONFIG_RTC_NVMEM is not set
+CONFIG_RTC_DRV_AT91RM9200=y
+CONFIG_RTC_DRV_AT91SAM9=y
+CONFIG_DMADEVICES=y
+CONFIG_AT_XDMAC=y
+CONFIG_DMATEST=y
+CONFIG_STAGING=y
+CONFIG_MICROCHIP_PIT64B=y
+# CONFIG_IOMMU_SUPPORT is not set
+# CONFIG_ATMEL_EBI is not set
+CONFIG_IIO=y
+CONFIG_IIO_SW_TRIGGER=y
+CONFIG_AT91_SAMA5D2_ADC=y
+CONFIG_PWM=y
+CONFIG_PWM_ATMEL=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+CONFIG_FANOTIFY=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_LSM="N"
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_CRYPTO_LZO=y
+# CONFIG_CRYPTO_HW is not set
+CONFIG_CRC_CCITT=y
+CONFIG_CRC_ITU_T=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=32
+CONFIG_CMA_ALIGNMENT=9
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_DEBUG_MISC is not set
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_STACKTRACE=y
+# CONFIG_FTRACE is not set
+CONFIG_DEBUG_USER=y
+# CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
