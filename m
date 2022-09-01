Return-Path: <SRS0=HV0T=ZE=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EAFC6FA81
	for <soc@archiver.kernel.org>; Thu,  1 Sep 2022 18:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4EB3BC433C1; Thu,  1 Sep 2022 18:34:09 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83EBBC43142;
	Thu,  1 Sep 2022 18:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83EBBC43142
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id g14so14138850qto.11;
        Thu, 01 Sep 2022 11:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=srjwgoxmTPtEe1SG1ioq7pVoriIcXpcyIEaZ6dlPwow=;
        b=oPcfxYFfUEbKFc5jxdBrsrBmYV2HVkMlK0gbV1WbanHdaSbp5PqrCr8Sovw7MIK8li
         Sb4yq8jNQkC/oaGnHVQK7RTOFHHfz/UwO76xQkMGuQoi7owPwYib/R35QSzXQfmmwgV8
         DJzdNzI+DGQ+9GSXQi+MrBoGmov73HaDupIRxaHLPtMKrX+pPvN6i3zEYOANuMD3hMaH
         gfEqY+H/HbP6Pg05+9boZCDqmIjCh6zWO9dmW/hxFV8+n5f69TpUvE7ngCsY7FNmjjAc
         wlIKv8Vidc21VClpHf6k62FeRV6IPWjShWigq9EDva4lUdy3V8NIPkgczfwyat2JLpG1
         oDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=srjwgoxmTPtEe1SG1ioq7pVoriIcXpcyIEaZ6dlPwow=;
        b=fedhu+45RG4cx91Ti4WVUDgScPdM+2ZK/upFMEJwhJJavzL+QkfTUMRQRtqWh7ks8N
         2VFDqaoaSaXtSxTilffSLp/0AN7Cme8MsymBMP3AeRyNt2CYaKnOsPnp0mHxH7Zkv++y
         y+paRqRlgFbDBIpUw2KEr+fY1zgGyo1+Q/t4e4ttx5uu2Bj+qHlo2yEB54yM8Yen2Xl3
         /ZdtJ+w2w0rPsbEIAp1q1vHvmr8lO+3sxqOhyGzAIPfGetjjZ30pK2gIe0WEVuaNn85u
         NH+jDnQd5I1fMaSDONjv4yOg3TAyzKECAk9G7oXEidODABz++5r5EyibEiWHrXsMVCql
         2CEg==
X-Gm-Message-State: ACgBeo0P+bo6oc5lQDdXouZhMimjBYNgSqAlvTvjgHh3zYRjX6EVsFRd
	0HM6/nvizU+nvl/yt5oxYYs=
X-Google-Smtp-Source: AA6agR6o7CS7icax6eFSi4NvO9mtX22KZNWQeIDJHaBWd9apWTu5vPPEA0am6oTpHsjEMPKmcc5yZw==
X-Received: by 2002:ac8:5d49:0:b0:342:f7df:dbd9 with SMTP id g9-20020ac85d49000000b00342f7dfdbd9mr24461247qtx.449.1662057248159;
        Thu, 01 Sep 2022 11:34:08 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id u20-20020ac87514000000b00342e86b3bdasm10563343qtq.12.2022.09.01.11.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 11:34:07 -0700 (PDT)
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
Subject: [PATCH v6 10/10] ARM: imxrt_defconfig: Add i.MXRT1170
Date: Thu,  1 Sep 2022 14:33:43 -0400
Message-Id: <20220901183343.3188903-11-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
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
V3 -> V4:
 - Nothing done
V4 -> V5:
 - Nothing done
V5 -> V6:
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

