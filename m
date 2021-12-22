Return-Path: <SRS0=nR9Q=RH=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07228C41535
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 01:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9137C36AEC; Wed, 22 Dec 2021 01:52:57 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59902C36AE9;
	Wed, 22 Dec 2021 01:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59902C36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id q4so963480qvh.9;
        Tue, 21 Dec 2021 17:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=07Syrs0mol4aP5r4tQ4Umh+2XxC+VkRyobBBx7Xa8m0=;
        b=X/T3wcupFk6ZOaPM3UrjnTpC9p6uX5Olp62tItlPf6I6+3L8Z8PsrtYzA/DH+Xt+ln
         jXehlN38FDZ7qNGLwIXe/VNoDmecdpGpaoA6mm7rkloJxILPy+TIFJ9CprNGXcg4UFo6
         A5gRTGMhVNWWeLexAO3IMyvVSw3mTDimDC5+gouKyiwC1T17qXuLIs++wnUs4/4OEya1
         CkggCNJW0/6W8aqPzS0Jv8S+1QHxMpIq+cVQJx6fA4vvJBuASNpetoJFUEzIY4swjjIS
         +IH1pncZv2EIGkrpZEwIEWKdMi9RCb08VbFFzKpCfCKv14OwD/RayDlW4h1XYWQNh8r9
         xIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=07Syrs0mol4aP5r4tQ4Umh+2XxC+VkRyobBBx7Xa8m0=;
        b=JHPbzMrxDK2jL2j93ISguG8fiRklAy57gHNWRGmb6UU2diGa6dacCtDAlohXCCo/HM
         7DZhLBSL1wWpV47F5nEWR2IyRAJoQ59c6CXR20i6uNR3lSGPuHMWgJ9JKHY0dsWzC0J+
         WeNCbzxcVIPf2P6HSpk2Kiknlmy0ZhwhsvpBN9ZJGEWFttioCtGm8Hr8Q8ujCzU1ytR7
         SZIPs0mluI76GulmCm8tsk90wz9tEOz3sk/aomo1Tg1QvCorEmNWCuoo0SiaNkwMpXfZ
         U4LifnT3WzUX6+vRCfrfrUkbLA3fZxKDLWGzr7rI5KxPMMMnz3YJOlAzWglqvF0ld1UU
         yrVg==
X-Gm-Message-State: AOAM531j4CAPhJ5gOn60K8ltfRaIWnrxk0nUunIZz2T7uc1HyMAQWvX8
	zGW8qW84c7+s47m9EZ+qHNw=
X-Google-Smtp-Source: ABdhPJz2ReMMBRF5tpUHQ359iYZEJF5OTseW1Y/LUdoaS272T9QSfmOM9c0MiYN6fax7//s0aMVJBQ==
X-Received: by 2002:a05:6214:4015:: with SMTP id kd21mr901299qvb.41.1640137976494;
        Tue, 21 Dec 2021 17:52:56 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id d4sm658161qkn.79.2021.12.21.17.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 17:52:56 -0800 (PST)
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
Subject: [PATCH v6 7/7] ARM: imxrt_defconfig: Add i.MXRT family defconfig
Date: Tue, 21 Dec 2021 20:52:44 -0500
Message-Id: <20211222015244.2464671-8-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211222015244.2464671-1-Mr.Bossman075@gmail.com>
References: <20211222015244.2464671-1-Mr.Bossman075@gmail.com>
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

