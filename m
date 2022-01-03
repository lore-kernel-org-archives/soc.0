Return-Path: <SRS0=jcq3=RT=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581A8C4167B
	for <soc@archiver.kernel.org>; Mon,  3 Jan 2022 23:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43CDBC36B0C; Mon,  3 Jan 2022 23:40:04 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BE20C36AEF;
	Mon,  3 Jan 2022 23:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BE20C36AEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id j17so32524523qtx.2;
        Mon, 03 Jan 2022 15:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y0OBHyV0Yv0fxv0JIp0Dg+o77BaY4TFzMuQN0E/92Zw=;
        b=jfglK91yHDPAxFW7UmvQNIZ3Kb9MeAw7xven4vLGLkBIgPwJBin6posEjhgdflEu2I
         NwOfxO7RtcpObVq+lxSVAnS6Q16s4pYtSqSu6hJGeqRceig7duFgVijexrttL5knuRwH
         ksX2haCa4oOPKIe16zHaf+IxHM9238NFn4jSPn9LXK4XmFOg33OixZgsmLcEIQCqgObm
         kLe0hWpr6dfXE3cZrM2rcbICu8YRsXK9vP8UCHpkbGkSej/2lpTJ9Y1+U9igy7s+ZcUR
         k9jaF07oxbuN1eG5o1SK/djvYMPMiSWRnk+4Rl/5JsqG8MMbSNhW7/oE7nc32Km5nozk
         y0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y0OBHyV0Yv0fxv0JIp0Dg+o77BaY4TFzMuQN0E/92Zw=;
        b=WqViPg2pwlBHPUMLbMrvrQO7utOVO6eRuFqB7GNXmD45OTjs3AKyomRwMd4FGIcobl
         LMoSCBf53P23HiAmxzjwt0a1C4CZ8bjo9gvdn2d2UTuRuhqIWrYvsprGWroGAjjRT2eb
         pxD68Z1Sp2NuRi8ICFh0UzQCycpUV1BEyJgijCRqjcikmm9AzFZy8ERRX1IiXgmMGmHV
         6fItshqTluKHkfLsJWMhF19aoPWHXoaJSRUutiRvJ0nHmpHdQZ7hBoqSHleyjLdH0cHp
         vc1V9dlSpIm2uDMI9trbiosmgbUoLmZzy0zvpXxsdy/qTilPeCdIhGiu89jJQ9aGvUeQ
         /FiA==
X-Gm-Message-State: AOAM531N4QPlEp0PMf5cYD8sfaG8oPhpSruGSjJlhb3f0dNQZMhOUicL
	ged9t2hpISzZsAcmnCT94Ss=
X-Google-Smtp-Source: ABdhPJzhGRPuzumek58syRdqEvkjERaZvB9j7i2ee8TKYsHTfcv8/2Xw18wRIlR/yDEpPv807riaGg==
X-Received: by 2002:ac8:7f89:: with SMTP id z9mr42462922qtj.15.1641253202503;
        Mon, 03 Jan 2022 15:40:02 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id o5sm26965991qkp.132.2022.01.03.15.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 15:40:02 -0800 (PST)
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
Subject: [PATCH v7 7/7] ARM: imxrt_defconfig: Add i.MXRT family defconfig
Date: Mon,  3 Jan 2022 18:39:48 -0500
Message-Id: <20220103233948.198119-8-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103233948.198119-1-Mr.Bossman075@gmail.com>
References: <20220103233948.198119-1-Mr.Bossman075@gmail.com>
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

