Return-Path: <SRS0=X96t=R3=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CDBC3526C
	for <soc@archiver.kernel.org>; Tue, 11 Jan 2022 21:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA820C36B00; Tue, 11 Jan 2022 21:54:30 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17ACEC36AE3;
	Tue, 11 Jan 2022 21:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17ACEC36AE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id fq10so786681qvb.10;
        Tue, 11 Jan 2022 13:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gcay47mnt+Y1wwFTi1j1d7+PqOItiKhQGaCcgWf4Lbk=;
        b=pBTor3+wP7S0SOqary/oB7az5TpEZWSB3ynmH0oeeEp2xF3q/CFzJjzqQeeAN/Sj6r
         SFIfEEJPy7BU64kDC7uWgTG9IQZ7/VgzawNpMiP07Cq31J2l3trJeNdoIuZmErUyg2dS
         XcWX4nmlXL9madFJ10uKxUCI7KoL29Shtd8tzegWVFEAaV49wlkSpnyS5ymFWvcI/Rl8
         FAIBV3d0JeWLuQ0FRNfOpXJGKYTmgQd+qguA/lFc+6GgHx6jhkLsI5WcodGoVMCAsRxs
         IdSCwIArwV6n6Q+KyVrW/gj6zb2re+B+7aqfwMIBXl3zFcdV53+n2KRlRX25OxZUIdLI
         I4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gcay47mnt+Y1wwFTi1j1d7+PqOItiKhQGaCcgWf4Lbk=;
        b=7UnqV1s0RQ53V8YZCqfBk/g0V3q2N6fwBn5p5LJa/TdR2nxHTCNTZD1ly2L1QCV5ra
         QZsvMjAAZ1GaxL3TJxRB5Fst6hhSC/f7NwvUqSM2EEkCj7OZDUfMSvKB2CASh9UbzoBX
         s1Z8lltDw5OV+RPxsQXp2G+OiOPmZ8H7R6ehY6EiPAUos+xLM/DnGT1vUIQiig0rQAq2
         V9NlU8Z3d0ua8fQnu4eZmsGVuesGhAwv507vhHg5yyxG4q+gz/s5IOOScGZ7xyy34jnx
         Hz9vefH9Co3Ek1KYQo+gSUf/aVmE6yalNCJu2DAyluqGvznjK1/3/eNCPuFA6OwnpNXw
         gvXg==
X-Gm-Message-State: AOAM5317A86UgiPfTppKXAXVR4Nk7fsPusJiPMSathEoQNyCr7rAneYu
	83u5JLbZ71BNxGL4UZiIdtQ=
X-Google-Smtp-Source: ABdhPJzALPYqChRutdtzquXDFIRPBPOJyNZxQ9ygFSsLztYwti//GeSdU4E5Zlfzdb86+BFSUlUBSA==
X-Received: by 2002:a05:6214:c22:: with SMTP id a2mr5742820qvd.71.1641938069182;
        Tue, 11 Jan 2022 13:54:29 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id l10sm7591020qtk.18.2022.01.11.13.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 13:54:28 -0800 (PST)
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
Subject: [PATCH v8 7/7] ARM: imxrt_defconfig: Add i.MXRT family defconfig
Date: Tue, 11 Jan 2022 16:54:15 -0500
Message-Id: <20220111215415.2075257-8-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111215415.2075257-1-Mr.Bossman075@gmail.com>
References: <20220111212606.2072669-1-Mr.Bossman075@gmail.com>
 <20220111215415.2075257-1-Mr.Bossman075@gmail.com>
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
V5->V6:
* Nothing done
V6->V7:
* Nothing done
V7->V8:
* Nothing done
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

