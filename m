Return-Path: <SRS0=jRGM=PM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36609C43217
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 15:41:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1940560FBF; Sun, 24 Oct 2021 15:41:03 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCFB660F21;
	Sun, 24 Oct 2021 15:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCFB660F21
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id v10so5674825qvb.10;
        Sun, 24 Oct 2021 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YheDEmlPH+D5Q0VJO3zBAo6GIkCPsU4mrGDZL+63++E=;
        b=kTlE+Wd2GxRGpG7UsR8CHxgw8NRtDJp5ySY5R2Oe2XYp52ukbTvzZar8DsUxWTPtxb
         lYIewVPSuN/8wa8KNTb3IKMwCznm4VWxUC+h6TBxh2d3ZsNaV4lkfKTjXQoyXBF2Igd+
         q2A5/23dxdvKo5O8zVZq9BwaWjE7d6G6c70vaoDlKsl6uEbdpmhAI+FdXnuQrO9MnRgm
         99t+Y9UA1G01CUpAcC5tBvHhAy9HBEmZdRqYufHkCXsZneRWMBmwHOgADXjXJh3Cj1CD
         BaBdxECygYz/vUziahpyTc/vQ5LfTSC7S6Mk73O5ZdjdGdECfQcQGbDFOVPggNRaM4l6
         z14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YheDEmlPH+D5Q0VJO3zBAo6GIkCPsU4mrGDZL+63++E=;
        b=4oloTNW0+5ZR50Ls4M90vdycCj5Y6HAD4q8U4yeACBGru6haoYZje7jeE9/uMh1vKf
         4yQv966j0l+kNUYCXjJ5042Gq7LijD/oZRpWAgT5Nej1ZDg1c4PgNcwUHrpgeSnXH/WK
         D8Ywunn1homPxljxeHGeFlQNqN7qq1g4OoN4TBh/qB8pIufE/IRwZPgVfK/xLdrnZc3x
         HLhs3Rp1feMudhb0HJk+DbfMo4cngw6bJH0i/eZOaA50jExalqDNVigyLnVzvPGXpyGA
         hcdMWswow9QMPjDE3XMSTCrdBZe37WJ7F8ffVMVpi2feR4cyNu9wEaNp9HaIkDHYyaXQ
         S5Cg==
X-Gm-Message-State: AOAM5302jekTE/2aw2SbcZaSfrzW9GyhOkAtrCaOjhCKuuTG+HgSH7B8
	C6zHMAlOfV69YyPFRiyFXx0=
X-Google-Smtp-Source: ABdhPJzCOJmNTYJHsHMc3AeIO6KwGSOv1lFICvlapqP877MBe01dvFoT1s6Ct0DDaskqWyV/qM0F/g==
X-Received: by 2002:a0c:eb11:: with SMTP id j17mr11048839qvp.51.1635090062036;
        Sun, 24 Oct 2021 08:41:02 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:41:01 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	ulf.hansson@linaro.org,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	adrian.hunter@intel.com,
	jirislaby@kernel.org,
	giulio.benetti@benettiengineering.com,
	nobuhiro1.iwamatsu@toshiba.co.jp,
	leonard.crestez@nxp.com,
	b20788@freescale.com,
	Mr.Bossman075@gmail.com,
	fugang.duan@nxp.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 13/13] ARM: imxrt_defconfig: add i.MXRT family defconfig
Date: Sun, 24 Oct 2021 11:40:27 -0400
Message-Id: <20211024154027.1479261-14-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

Add generic i.MXRT family defconfig.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/arm/configs/imxrt_defconfig | 157 +++++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 arch/arm/configs/imxrt_defconfig

diff --git a/arch/arm/configs/imxrt_defconfig b/arch/arm/configs/imxrt_defconfig
new file mode 100644
index 000000000000..d673745a5462
--- /dev/null
+++ b/arch/arm/configs/imxrt_defconfig
@@ -0,0 +1,157 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_USELIB=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_PREEMPT_VOLUNTARY=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+CONFIG_PSI=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=18
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_RDMA=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_RELAY=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
+CONFIG_SGETMASK_SYSCALL=y
+# CONFIG_FUTEX is not set
+CONFIG_KALLSYMS_ALL=y
+CONFIG_PC104=y
+# CONFIG_SLUB_DEBUG is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB_FREELIST_RANDOM=y
+CONFIG_SLAB_FREELIST_HARDENED=y
+CONFIG_PROFILING=y
+# CONFIG_MMU is not set
+CONFIG_ARCH_MXC=y
+CONFIG_SOC_IMXRT=y
+# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
+CONFIG_SET_MEM_PARAM=y
+CONFIG_DRAM_BASE=0x80000000
+CONFIG_DRAM_SIZE=0x02000000
+CONFIG_HZ_250=y
+CONFIG_FORCE_MAX_ZONEORDER=14
+CONFIG_PARAVIRT=y
+# CONFIG_ATAGS is not set
+CONFIG_CMDLINE="console=ttyS0 root=/dev/mmcblk0p2 rw earlycon rootwait"
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_BLK_DEV_INTEGRITY=y
+CONFIG_BLK_DEV_ZONED=y
+CONFIG_BLK_DEV_THROTTLING=y
+CONFIG_BLK_WBT=y
+CONFIG_BLK_SED_OPAL=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_BSD_DISKLABEL=y
+CONFIG_MINIX_SUBPARTITION=y
+CONFIG_SOLARIS_X86_PARTITION=y
+CONFIG_UNIXWARE_DISKLABEL=y
+CONFIG_LDM_PARTITION=y
+CONFIG_CMDLINE_PARTITION=y
+# CONFIG_MQ_IOSCHED_KYBER is not set
+CONFIG_BINFMT_FLAT=y
+CONFIG_CLEANCACHE=y
+CONFIG_ZPOOL=y
+CONFIG_ZBUD=y
+CONFIG_Z3FOLD=y
+CONFIG_UEVENT_HELPER=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+CONFIG_FW_LOADER_USER_HELPER=y
+CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
+CONFIG_IMX_WEIM=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=65536
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_LEGACY_PTY_COUNT=2
+CONFIG_SERIAL_FSL_LPUART=y
+CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
+CONFIG_SERIAL_NONSTANDARD=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_TTY_PRINTK=y
+CONFIG_TTY_PRINTK_LEVEL=7
+CONFIG_PINCTRL_IMXRT1050=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_MXC=y
+# CONFIG_HWMON is not set
+# CONFIG_HID is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_ESDHC_IMX=y
+CONFIG_DMADEVICES=y
+CONFIG_FSL_EDMA=y
+# CONFIG_MX3_IPU is not set
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+CONFIG_MEMORY=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT2_FS_SECURITY=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_FS_POSIX_ACL=y
+CONFIG_EXT3_FS_SECURITY=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_QUOTA=y
+# CONFIG_PRINT_QUOTA_WARNING is not set
+CONFIG_AUTOFS4_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_UTF8=y
+CONFIG_EXFAT_FS=y
+CONFIG_CONFIGFS_FS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NLS_DEFAULT="cp437"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_LSM="yama,loadpin,integrity,apparmor"
+# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
+# CONFIG_CRYPTO_HW is not set
+CONFIG_PRINTK_TIME=y
+CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
+CONFIG_CONSOLE_LOGLEVEL_QUIET=15
+CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
+CONFIG_DYNAMIC_DEBUG=y
+# CONFIG_DEBUG_BUGVERBOSE is not set
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF4=y
+CONFIG_GDB_SCRIPTS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x01b6
+CONFIG_DEBUG_FS=y
+CONFIG_PAGE_POISONING=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
+CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=1
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_SCHEDSTATS=y
+CONFIG_STACKTRACE=y
+CONFIG_DEBUG_USER=y
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_UNCOMPRESS=y
+CONFIG_EARLY_PRINTK=y
+# CONFIG_RUNTIME_TESTING_MENU is not set
+CONFIG_MEMTEST=y
-- 
2.33.0

