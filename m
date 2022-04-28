Return-Path: <SRS0=tSnG=VG=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A47C433FE
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 21:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CE56C385AE; Thu, 28 Apr 2022 21:49:07 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 919B7C385AD;
	Thu, 28 Apr 2022 21:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 919B7C385AD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id bz24so4506739qtb.2;
        Thu, 28 Apr 2022 14:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x2tfNJJ7zvk5t2UFdzL7uNJCGv9rRgs1ExdTc2XZh9U=;
        b=baXLtRyTMQ7d/LV1qdLfIjPKcoZLa/+WgUsUFZmrNSSw1msbNF4DpgT0CwPs7rjxK9
         0ioHyPE5v+hfAEhGAPSsAHJCO+wv2FMP6Dr9t/BCigIw/sGbbSQqMzbESC7lfCFyjAQ/
         sn6KgPtKJ6XP9UowM1ptd+p7MqQNCBFlG9l7UqNjBz3adUedpNWRnm3Tlnk58HdNTMYL
         qaq+ETHzKpkaR//VBKb4ovs7g/5lgGNOAM+rtkDd2SXlaiB/bSp/2FS58wfAiM7pBSVh
         Lq8C7SPfoIiAR7tE1hi+XzYarY9HfpB200D8kdxoYRMAXvmw5CpppgySeAnzsTBJ5GRL
         lTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x2tfNJJ7zvk5t2UFdzL7uNJCGv9rRgs1ExdTc2XZh9U=;
        b=vvBG9tVhjlnkZB/dM6Udl8D7CmZTum+RcdMoufVyb1or0X6WWNK9qGaimiqdCXwg73
         w7yR/PiNuv/yn16EHe2RN0SYBO6UnInHlBIySIhxL+AAIXfenzdVIw2XgghG1NY9yQZ8
         Gebf8OqsDNBI2n3vyyorcSJi+ekrYBwKg8/8ASDKhzvVT19C5wPNQiWs3Ony5orGQwS0
         viCUx6rXKVgXaOQt6VKBFStT/h+j/kc1+Mukj0jqdDo/L3+vDOpl3R0pCO8KovmOlw47
         GxcfLT8JXyYZl+2dxuxdaRwkyY1egW1jwYoFGItqSUdWEJ/GB/5DFmbb0SvqaVNacUEt
         U+zw==
X-Gm-Message-State: AOAM531Q1xydl/ffFhDn+N8DXSYG3WK0n7HeE1n5vfKBxAivtCN9YgNs
	TayRZs/piWtxyjP2MEflUOg=
X-Google-Smtp-Source: ABdhPJzx4tI+mCCSK+NG5AFusHNVdENss/6rZpTI+zjsZ5SvXww7P7xynhM8elMWOFDfB8sN136FlA==
X-Received: by 2002:a05:622a:148b:b0:2f1:fb24:5bcb with SMTP id t11-20020a05622a148b00b002f1fb245bcbmr24425756qtx.64.1651182545613;
        Thu, 28 Apr 2022 14:49:05 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id bl5-20020a05620a1a8500b0069f51e47c5esm546442qkb.110.2022.04.28.14.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:49:05 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	dev@lynxeye.de,
	marcel.ziswiler@toradex.com,
	tharvey@gateworks.com,
	leoyang.li@nxp.com,
	sebastian.reichel@collabora.com,
	cniedermaier@dh-electronics.com,
	Mr.Bossman075@gmail.com,
	clin@suse.com,
	giulio.benetti@benettiengineering.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 15/15] ARM: imxrt_defconfig: Add i.MXRT1170
Date: Thu, 28 Apr 2022 17:48:38 -0400
Message-Id: <20220428214838.1040278-16-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i.MXRT1170 pinctrl, clocks imxrt_defconfig.
Add support for CHIPIDEA usb host and usb gadget and other usb drives.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - Remove USB_CONFIGFS*
---
 arch/arm/configs/imxrt_defconfig | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/configs/imxrt_defconfig b/arch/arm/configs/imxrt_defconfig
index 52dba3762996..b3a013686255 100644
--- a/arch/arm/configs/imxrt_defconfig
+++ b/arch/arm/configs/imxrt_defconfig
@@ -17,7 +17,23 @@ CONFIG_SERIAL_FSL_LPUART=y
 CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_PINCTRL_IMXRT1050=y
+CONFIG_PINCTRL_IMXRT1170=y
 CONFIG_GPIO_MXC=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_DYNAMIC_MINORS=y
+CONFIG_USB_OTG=y
+CONFIG_USB_OTG_FSM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_FSL=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_MXS_PHY=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_MASS_STORAGE=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
@@ -25,6 +41,7 @@ CONFIG_MMC_SDHCI_ESDHC_IMX=y
 CONFIG_DMADEVICES=y
 CONFIG_FSL_EDMA=y
 CONFIG_CLK_IMXRT1050=y
+CONFIG_CLK_IMXRT1170=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
-- 
2.35.1

