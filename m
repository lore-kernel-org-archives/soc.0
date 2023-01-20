Return-Path: <SRS0=MX/P=5R=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB23C05027
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 11:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0C39C433D2; Fri, 20 Jan 2023 11:12:45 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86307C43442;
	Fri, 20 Jan 2023 11:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86307C43442
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674213163; x=1705749163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xNdlCrHFToP/5MC7OGHqs7z08rQM8UBVnbXSWrZZxTw=;
  b=n5KPxNYC7E3vE/o+ySAIu000Z+OZ7iw9OgEr2X6e6bysXVjnttZsPb71
   4RlDupNRWIP3NNisrMGA9TcF6MwlkbDMlVDXSpFZsfhlD9a7bs+HZxZcd
   tGM70VicQxVAj9xx21W0Eq2FvWULXhVzyPEymVmjSYlsB4qr3x/mfyiLO
   WzEz1eKxH+TAjgMQvMbq8PjVgIMQc/3l40LFm5LJOOgehfSmvGobScYDp
   7cuftK+zgM9iY03LXlZMnVgnZ59Btx68tscS/EnhqJ4EmHvfr37Mpv46j
   r6G5jfVABGXSatlH+tNH84YHYBRLrCnQcmsHTsuFDSphy6Tqg8OLwLfIw
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28557546"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 12:12:39 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 12:12:39 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 12:12:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674213159; x=1705749159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xNdlCrHFToP/5MC7OGHqs7z08rQM8UBVnbXSWrZZxTw=;
  b=Jm2QChZIOKJ0Hgnu/bAPdboO3RsJ46JqsVMc5dArc/YpsI/gVsv0lOP5
   xN1mONKs7zS/LrNCFftg82U+LqSp6TuohRDcheFXYPSjFoTThUE9mYPOK
   PD2c1e1kgSRIWykjlWJghnxNGy2De3+tViCG0SumLX4ridAqRk8zKYi2L
   vOOlkPpkkS8bJlLD089zg34NAhY48/hlsOseLfvod6N7VTTuS+yszOEDy
   EkA9TTxZ6uZNXDC6UBLZLYlQug1jBQjKteACq/5ZtisgBYbBKwCxCSk7B
   BsuiI6reqnTg6zTnD/uz97u/anW8ci96Do7kBqjg/wRYAgFy0J/EYcYma
   w==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28557545"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 12:12:39 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 633EB280056;
	Fri, 20 Jan 2023 12:12:39 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Russell King <linux@armlinux.org.uk>, Marek Vasut <marex@denx.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/9] ARM: multi_v7_defconfig: Add options to support TQMLS102xA series
Date: Fri, 20 Jan 2023 12:12:39 +0100
Message-ID: <2168770.1BCLMh4Saa@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <acab1d7a-ef00-a3be-f73c-6cb9d01687b9@linaro.org>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com> <20230119144236.3541751-9-alexander.stein@ew.tq-group.com> <acab1d7a-ef00-a3be-f73c-6cb9d01687b9@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Krzysztof,

thanks for the feedback.

Am Donnerstag, 19. Januar 2023, 18:04:31 CET schrieb Krzysztof Kozlowski:
> On 19/01/2023 15:42, Alexander Stein wrote:
> > This enables drivers used on TQMLS102xA + MBLS1021A.
> 
> Do not use "This (commit/patch)".
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submit
> ting-patches.rst#L95

Thanks, this sounds much better.

> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >  arch/arm/configs/multi_v7_defconfig | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/arch/arm/configs/multi_v7_defconfig
> > b/arch/arm/configs/multi_v7_defconfig index ee184eb37adcf..441a449172368
> > 100644
> > --- a/arch/arm/configs/multi_v7_defconfig
> > +++ b/arch/arm/configs/multi_v7_defconfig
> > @@ -191,6 +191,7 @@ CONFIG_PCI_TEGRA=y
> > 
> >  CONFIG_PCI_RCAR_GEN2=y
> >  CONFIG_PCIE_RCAR_HOST=y
> >  CONFIG_PCI_DRA7XX_EP=y
> > 
> > +CONFIG_PCI_LAYERSCAPE=y
> > 
> >  CONFIG_PCI_ENDPOINT=y
> >  CONFIG_PCI_ENDPOINT_CONFIGFS=y
> >  CONFIG_PCI_EPF_TEST=m
> > 
> > @@ -249,6 +250,7 @@ CONFIG_AHCI_ST=y
> > 
> >  CONFIG_AHCI_IMX=y
> >  CONFIG_AHCI_SUNXI=y
> >  CONFIG_AHCI_TEGRA=y
> > 
> > +CONFIG_AHCI_QORIQ=y
> > 
> >  CONFIG_SATA_HIGHBANK=y
> >  CONFIG_SATA_MV=y
> >  CONFIG_SATA_RCAR=y
> > 
> > @@ -329,6 +331,7 @@ CONFIG_TOUCHSCREEN_ADC=m
> > 
> >  CONFIG_TOUCHSCREEN_ATMEL_MXT=m
> >  CONFIG_TOUCHSCREEN_ELAN=m
> >  CONFIG_TOUCHSCREEN_MMS114=m
> > 
> > +CONFIG_TOUCHSCREEN_EDT_FT5X06=m
> > 
> >  CONFIG_TOUCHSCREEN_WM97XX=m
> >  CONFIG_TOUCHSCREEN_ST1232=m
> >  CONFIG_TOUCHSCREEN_STMPE=y
> > 
> > @@ -483,6 +486,7 @@ CONFIG_GPIO_ASPEED_SGPIO=y
> > 
> >  CONFIG_GPIO_DAVINCI=y
> >  CONFIG_GPIO_DWAPB=y
> >  CONFIG_GPIO_EM=y
> > 
> > +CONFIG_GPIO_MPC8XXX=y
> 
> module

Sounds reasonable, but it's not actually possible, it's just a bool.

> >  CONFIG_GPIO_MXC=y
> >  CONFIG_GPIO_RCAR=y
> >  CONFIG_GPIO_SYSCON=y
> > 
> > @@ -493,6 +497,7 @@ CONFIG_GPIO_PCA953X=y
> > 
> >  CONFIG_GPIO_PCA953X_IRQ=y
> >  CONFIG_GPIO_PCF857X=y
> >  CONFIG_GPIO_PALMAS=y
> > 
> > +CONFIG_GPIO_STMPE=y
> 
> module

That one as well, it's just a bool.

> >  CONFIG_GPIO_TPS6586X=y
> >  CONFIG_GPIO_TPS65910=y
> >  CONFIG_GPIO_TWL4030=y
> > 
> > @@ -533,6 +538,7 @@ CONFIG_SENSORS_INA2XX=m
> > 
> >  CONFIG_CPU_THERMAL=y
> >  CONFIG_DEVFREQ_THERMAL=y
> >  CONFIG_IMX_THERMAL=y
> > 
> > +CONFIG_QORIQ_THERMAL=m
> > 
> >  CONFIG_ROCKCHIP_THERMAL=y
> >  CONFIG_RCAR_THERMAL=y
> >  CONFIG_ARMADA_THERMAL=y
> > 
> > @@ -821,6 +827,8 @@ CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
> > 
> >  CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
> >  CONFIG_SND_SOC_SGTL5000=m
> >  CONFIG_SND_SOC_STI_SAS=m
> > 
> > +CONFIG_SND_SOC_TLV320AIC32X4=m
> > +CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
> > 
> >  CONFIG_SND_SOC_WM8978=m
> >  CONFIG_SND_AUDIO_GRAPH_CARD=m
> >  CONFIG_USB=y
> > 
> > @@ -830,6 +838,7 @@ CONFIG_USB_XHCI_MVEBU=y
> > 
> >  CONFIG_USB_XHCI_TEGRA=m
> >  CONFIG_USB_BRCMSTB=m
> >  CONFIG_USB_EHCI_HCD=y
> > 
> > +CONFIG_USB_EHCI_FSL=y
> 
> module

Well, apparently module autoload is broken due to wrong modalias value of ehci 
node created by fsl-mph-dr-of. This setting this as a module is currently not 
working.

> >  CONFIG_USB_EHCI_HCD_STI=y
> >  CONFIG_USB_EHCI_EXYNOS=m
> >  CONFIG_USB_EHCI_MV=m
> > 
> > @@ -933,6 +942,8 @@ CONFIG_NEW_LEDS=y
> > 
> >  CONFIG_LEDS_CLASS=y
> >  CONFIG_LEDS_CLASS_FLASH=m
> >  CONFIG_LEDS_CPCAP=m
> > 
> > +CONFIG_LEDS_PCA9532=m
> > +CONFIG_LEDS_PCA9532_GPIO=y
> > 
> >  CONFIG_LEDS_GPIO=y
> >  CONFIG_LEDS_PWM=y
> >  CONFIG_LEDS_MAX8997=m
> > 
> > @@ -949,6 +960,7 @@ CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
> > 
> >  CONFIG_LEDS_TRIGGER_TRANSIENT=y
> >  CONFIG_LEDS_TRIGGER_CAMERA=y
> >  CONFIG_EDAC=y
> > 
> > +CONFIG_EDAC_LAYERSCAPE=y
> > 
> >  CONFIG_EDAC_HIGHBANK_MC=y
> >  CONFIG_EDAC_HIGHBANK_L2=y
> >  CONFIG_RTC_CLASS=y
> > 
> > @@ -962,6 +974,7 @@ CONFIG_RTC_DRV_MAX8997=m
> > 
> >  CONFIG_RTC_DRV_MAX77686=y
> >  CONFIG_RTC_DRV_RK808=m
> >  CONFIG_RTC_DRV_RS5C372=m
> > 
> > +CONFIG_RTC_DRV_PCF85063=y
> 
> module

Okay, module it is. So I assume it is acceptable the system time is set much 
later after mounting rootfs then?

> >  CONFIG_RTC_DRV_PCF85363=m
> >  CONFIG_RTC_DRV_BQ32K=m
> >  CONFIG_RTC_DRV_TWL4030=y
> 
> Best regards,
> Krzysztof

Best regards,
Alexander



