Return-Path: <SRS0=TAfj=VZ=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF82C433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 03:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6324C36AE5; Tue, 17 May 2022 03:28:28 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0188FC34116;
	Tue, 17 May 2022 03:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0188FC34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id s22so7831695qta.0;
        Mon, 16 May 2022 20:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fXmNlpDbzOxRrZAm6s7udd8IkwN0nR06v8V3BWFHZdk=;
        b=GYLkcxPA87mOZdo5LWGhpVxV2f0FwFi1G1Nl9gLLb77YB8iiR2sizI8lUdo0k17GDw
         W1//of9scrilNib4oc8WoGNoKzmM/CEl3mnU0sjw/2q4XCWIXlb4OjX8x17d2uXlOf4p
         JZWQ7UXxOGcutVNInX8dm99dcUDfkprb7qAaSsq4K/1p70IXZFkb8bQ5I6Wf+4GK71U2
         XqIQ61nCDxf7CU8ASlK13CQy3b+laB5M02MrkVxePrC2ocqfpZe6DbTfLKYEwqHrb6pM
         lh2DdMUdfPQgzbLktRyGSO7Jrj2J0vH8472cFETODArSBYvvMG222n1Jb5MHlowQ7CaR
         Lxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fXmNlpDbzOxRrZAm6s7udd8IkwN0nR06v8V3BWFHZdk=;
        b=dR52q/cD7pmimEYD97asIpjRvX63SAE8tWWPhv5k/JymlqHaoFdFmbwCzci90A4JqU
         AK9DNgWXD6Dh1yTpzEVvYW0hDoHqF1uG0pM+Z1FqT/3shvvtzv/asuaRcf3NYWNURInW
         +T1EuDH17XiIAGW64Dsle2EUYYgTwJ7yQlPKDu+j1efcORwm0HizSrFRXSdWDUy2/J/+
         JF8R+NXn770X27sUzXeJmdEZdLKQwxvKaCDOoxCExn1Pj58IoST4wnAjjhz0HydkzWV8
         a5CI3CV1RULmWqbQfXRkaZyB/oroPRkR3T60+tC56URWDQwKAo1Fn1gedPwDkyUlplT9
         9+qg==
X-Gm-Message-State: AOAM531AWTEjhLV1oYt8cPXRMyi9CoEh8Fq3A9QrjRi4cfjVPjlBz5Nx
	pwfXsH0ui+oMp7BCjQVmIB4=
X-Google-Smtp-Source: ABdhPJwYXy7lsI7pu54YWVezMi5uWhumShFNv7VsQJ2P625ux42XfkdP78M+jJCs8n1XGfnWLb4Tcw==
X-Received: by 2002:a05:622a:191:b0:2f3:f489:1bb4 with SMTP id s17-20020a05622a019100b002f3f4891bb4mr18266731qtw.425.1652758107654;
        Mon, 16 May 2022 20:28:27 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id a19-20020a376613000000b006a098381abcsm7079535qkc.114.2022.05.16.20.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 20:28:27 -0700 (PDT)
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
Subject: [PATCH v3 15/15] ARM: imxrt_defconfig: Add i.MXRT1170
Date: Mon, 16 May 2022 23:28:02 -0400
Message-Id: <20220517032802.451743-14-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i.MXRT1170 pinctrl, clocks imxrt_defconfig.
Add support for CHIPIDEA usb host and usb gadget and other usb drives.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - Remove USB_CONFIGFS*
V2 -> V3:
 - Nothing done
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
2.36.1

