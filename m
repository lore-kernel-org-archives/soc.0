Return-Path: <SRS0=KNgb=RA=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A686C433F5
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 22:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D784C36AE3; Wed, 15 Dec 2021 22:05:58 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 082E9C36AE2;
	Wed, 15 Dec 2021 22:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 082E9C36AE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id 132so21519804qkj.11;
        Wed, 15 Dec 2021 14:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TitC2dO0wkJLqs3RK/Mubu0CIrjVhTLfeZ4/lpetFHg=;
        b=eakHrVjduzGabRW3rtq25pnGCL9y5N8+eoHz/VVlCoIe5YHmKiSsAzeOnubV40DS87
         G+Ub5W98G7Gqn9aYvrnpmjyYOVTdu12wY630FCgz/i6pa6m32adVwg3uuohZ6ehso01j
         NaTFEhgOXmIkraCqyPtJk/HgkaSuoQlqhQFSD4rMlkzMI00epCvqG4X8TKALKmw4nw4C
         VMyCFuuW7X2Ue/QyHQdQq8bsPOBo01uxvrsqlF8K7eS1k1pSyG+x87XAQcB4aIcvE8FM
         wq/xIqKestZSrDINVdHEEPtxRt3lQh8dukisguX/sj/amcPR4zAy1caT5IMWfnEs2Mgb
         zBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TitC2dO0wkJLqs3RK/Mubu0CIrjVhTLfeZ4/lpetFHg=;
        b=VEtSN+bgQ/w0mWTHUbbZE1h8yenjWoD+10qaq+1Na8EJiaJNHVHQ9+JjL97uNgBBcn
         +sfWf0dKAhiwnwt0rTqo0K+Q++VRsn5/XC5nNpHc3W9AovPgCflr9aiJsbvXSYQ7bFBe
         vJ7uDwf64FW7SdJWmWajoOnnjTOD9VZUDoc7EYL8NuTqmE3MFFoPYJHEoUzxaqoks0PY
         d58GvLtIPQlcvfdJcbgL+uurHnospCdDW0APRVKaSH9n8/SYge4hhriYGPROYyvLhqMR
         hmWwiKo5j4KPnWNUqnpXAogNEYYXO5Q36tots3kgW7OshapBCXbNvRVDRJNmyNxvivTC
         7BGA==
X-Gm-Message-State: AOAM533GWDroqZbVLIWYSXFoIuQC0/PQkoiBntJCnU3vplFOHbSGQLSQ
	H4ogOmUJNRSAOU7hvKLaRps=
X-Google-Smtp-Source: ABdhPJzRXboEiigLc5/HpDt4yqwG5O6jjwuy0h6MgYRO+8pT2GhcG3iZQQ59psJfOLycw+DGYkMrqA==
X-Received: by 2002:a05:620a:4712:: with SMTP id bs18mr10306929qkb.246.1639605957098;
        Wed, 15 Dec 2021 14:05:57 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id s20sm2471592qtc.75.2021.12.15.14.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:05:56 -0800 (PST)
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
	Mr.Bossman075@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 9/9] ARM: imxrt_defconfig: Add i.MXRT family defconfig
Date: Wed, 15 Dec 2021 17:05:38 -0500
Message-Id: <20211215220538.4180616-10-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
References: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

Add generic i.MXRT family defconfig.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Nothing done
V2->V3:
* Nothing done
V3->V4:
* Remove unnecessary CONFIGs
* Add futex suport after "ARM: 9122/1: select HAVE_FUTEX_CMPXCHG"
9d417cbe36eee7afdd85c2e871685f8dab7c2dba
V4->V5:
* Change commit description
---
 arch/arm/configs/imxrt_defconfig | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 arch/arm/configs/imxrt_defconfig

diff --git a/arch/arm/configs/imxrt_defconfig b/arch/arm/configs/imxrt_defconfig
new file mode 100644
index 000000000000..52dba3762996
--- /dev/null
+++ b/arch/arm/configs/imxrt_defconfig
@@ -0,0 +1,35 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_BPF_SYSCALL=y
+CONFIG_SCHED_AUTOGROUP=y
+# CONFIG_MMU is not set
+CONFIG_ARCH_MXC=y
+CONFIG_SOC_IMXRT=y
+CONFIG_SET_MEM_PARAM=y
+CONFIG_DRAM_BASE=0x80000000
+CONFIG_DRAM_SIZE=0x02000000
+CONFIG_BINFMT_FLAT=y
+CONFIG_UEVENT_HELPER=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_IMX_WEIM=y
+CONFIG_LEGACY_PTY_COUNT=2
+CONFIG_SERIAL_FSL_LPUART=y
+CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_PINCTRL_IMXRT1050=y
+CONFIG_GPIO_MXC=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_ESDHC_IMX=y
+CONFIG_DMADEVICES=y
+CONFIG_FSL_EDMA=y
+CONFIG_CLK_IMXRT1050=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_UTF8=y
+CONFIG_EXFAT_FS=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_UTF8=y
-- 
2.34.1

