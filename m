Return-Path: <SRS0=xk3N=5Q=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0571FC004D4
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 17:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE108C433F2; Thu, 19 Jan 2023 17:04:35 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C93CFC433F1
	for <soc@kernel.org>; Thu, 19 Jan 2023 17:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C93CFC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so1757962wmc.1
        for <soc@kernel.org>; Thu, 19 Jan 2023 09:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MranoMQvEitL66SUgxUH4GxVhFF9M/Ro+uQ50zE1sVY=;
        b=sAWAhhIWcvX+dCvn+cYq7rbGndKgluno0uJ0fPk/tFSRmQATeKihtiDfcEVOussgAY
         qMcavNrCr6gq/xYiBfrMBdd99ucnsIlNTuoQWfo3ewteqMBOszuG+d94VHngv6JBBB+N
         +PRSz055tL1nCe5TcetT64Wfy1FlpzNylSdrfld0pfnl/ySnN5nD7CKee9Irn23c7Lj3
         hTpgC4Hm/Zh0bcNDftT6al4qmDCvDqzErv8fiyHfUwCf5+Sjb0huuNYZB9ML7o9QCwG0
         sKBF+LqmFu9O1ASbvsbHX5/bg7+zwQe29RXY3ApWgVYfFrwwVnWXQs2WdDo2YXF80lNC
         77aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MranoMQvEitL66SUgxUH4GxVhFF9M/Ro+uQ50zE1sVY=;
        b=5HISZCm8TjfFNmu3gAQlJBeUT/KeyPLRaJCySWSOG7ObBD1JEbNxC7KyRVWFglkZ3m
         cD9a0HbhOhkyy/I+6vhsHhwsft31eLIywMQxaUDaqEVPJgth10E84irSrDXUvQ4rYGTx
         F/DOnufBHEiKneyGQI8bCndxBYbFZpAn1v0dnN701DLSMRX3Te2Qemz1LPw6Nplezvgl
         X2MQ5vj2GZhE9/tPHyPCknf3iL2xUfRzBUg+B/yqh9dzkHjYBwWleF8qY9jQnOOFERYr
         zEU9mCnOSxn/MxWYPa/sBpbndULwe8GxJB5FZOkNdpUQ6LyPBmtQccXI3CwbTUUOm/Wb
         Y1sg==
X-Gm-Message-State: AFqh2kqZFYUwQK4A7v0k/QnwEb1G0ul019hV/VJduXZmxlXwcJmyrROm
	1KlpiZjuVlmLFsetYwtOgAXrBQ==
X-Google-Smtp-Source: AMrXdXvqVyNb+4WyNf6BscYxHtqDfumx6PYvLfvtcecj8JxJqAVasH4AWSoOGZE9iOxV1WtzYIvw/g==
X-Received: by 2002:a05:600c:3ba5:b0:3da:ff66:e3cc with SMTP id n37-20020a05600c3ba500b003daff66e3ccmr10641592wms.21.1674147873191;
        Thu, 19 Jan 2023 09:04:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fc13-20020a05600c524d00b003db2dede1a2sm210168wmb.26.2023.01.19.09.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 09:04:32 -0800 (PST)
Message-ID: <acab1d7a-ef00-a3be-f73c-6cb9d01687b9@linaro.org>
Date: Thu, 19 Jan 2023 18:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 8/9] ARM: multi_v7_defconfig: Add options to support
 TQMLS102xA series
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Marek Vasut <marex@denx.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
 <20230119144236.3541751-9-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119144236.3541751-9-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/01/2023 15:42, Alexander Stein wrote:
> This enables drivers used on TQMLS102xA + MBLS1021A.

Do not use "This (commit/patch)".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index ee184eb37adcf..441a449172368 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -191,6 +191,7 @@ CONFIG_PCI_TEGRA=y
>  CONFIG_PCI_RCAR_GEN2=y
>  CONFIG_PCIE_RCAR_HOST=y
>  CONFIG_PCI_DRA7XX_EP=y
> +CONFIG_PCI_LAYERSCAPE=y
>  CONFIG_PCI_ENDPOINT=y
>  CONFIG_PCI_ENDPOINT_CONFIGFS=y
>  CONFIG_PCI_EPF_TEST=m
> @@ -249,6 +250,7 @@ CONFIG_AHCI_ST=y
>  CONFIG_AHCI_IMX=y
>  CONFIG_AHCI_SUNXI=y
>  CONFIG_AHCI_TEGRA=y
> +CONFIG_AHCI_QORIQ=y
>  CONFIG_SATA_HIGHBANK=y
>  CONFIG_SATA_MV=y
>  CONFIG_SATA_RCAR=y
> @@ -329,6 +331,7 @@ CONFIG_TOUCHSCREEN_ADC=m
>  CONFIG_TOUCHSCREEN_ATMEL_MXT=m
>  CONFIG_TOUCHSCREEN_ELAN=m
>  CONFIG_TOUCHSCREEN_MMS114=m
> +CONFIG_TOUCHSCREEN_EDT_FT5X06=m
>  CONFIG_TOUCHSCREEN_WM97XX=m
>  CONFIG_TOUCHSCREEN_ST1232=m
>  CONFIG_TOUCHSCREEN_STMPE=y
> @@ -483,6 +486,7 @@ CONFIG_GPIO_ASPEED_SGPIO=y
>  CONFIG_GPIO_DAVINCI=y
>  CONFIG_GPIO_DWAPB=y
>  CONFIG_GPIO_EM=y
> +CONFIG_GPIO_MPC8XXX=y

module

>  CONFIG_GPIO_MXC=y
>  CONFIG_GPIO_RCAR=y
>  CONFIG_GPIO_SYSCON=y
> @@ -493,6 +497,7 @@ CONFIG_GPIO_PCA953X=y
>  CONFIG_GPIO_PCA953X_IRQ=y
>  CONFIG_GPIO_PCF857X=y
>  CONFIG_GPIO_PALMAS=y
> +CONFIG_GPIO_STMPE=y

module

>  CONFIG_GPIO_TPS6586X=y
>  CONFIG_GPIO_TPS65910=y
>  CONFIG_GPIO_TWL4030=y
> @@ -533,6 +538,7 @@ CONFIG_SENSORS_INA2XX=m
>  CONFIG_CPU_THERMAL=y
>  CONFIG_DEVFREQ_THERMAL=y
>  CONFIG_IMX_THERMAL=y
> +CONFIG_QORIQ_THERMAL=m
>  CONFIG_ROCKCHIP_THERMAL=y
>  CONFIG_RCAR_THERMAL=y
>  CONFIG_ARMADA_THERMAL=y
> @@ -821,6 +827,8 @@ CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
>  CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
>  CONFIG_SND_SOC_SGTL5000=m
>  CONFIG_SND_SOC_STI_SAS=m
> +CONFIG_SND_SOC_TLV320AIC32X4=m
> +CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
>  CONFIG_SND_SOC_WM8978=m
>  CONFIG_SND_AUDIO_GRAPH_CARD=m
>  CONFIG_USB=y
> @@ -830,6 +838,7 @@ CONFIG_USB_XHCI_MVEBU=y
>  CONFIG_USB_XHCI_TEGRA=m
>  CONFIG_USB_BRCMSTB=m
>  CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_FSL=y

module

>  CONFIG_USB_EHCI_HCD_STI=y
>  CONFIG_USB_EHCI_EXYNOS=m
>  CONFIG_USB_EHCI_MV=m
> @@ -933,6 +942,8 @@ CONFIG_NEW_LEDS=y
>  CONFIG_LEDS_CLASS=y
>  CONFIG_LEDS_CLASS_FLASH=m
>  CONFIG_LEDS_CPCAP=m
> +CONFIG_LEDS_PCA9532=m
> +CONFIG_LEDS_PCA9532_GPIO=y
>  CONFIG_LEDS_GPIO=y
>  CONFIG_LEDS_PWM=y
>  CONFIG_LEDS_MAX8997=m
> @@ -949,6 +960,7 @@ CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
>  CONFIG_LEDS_TRIGGER_TRANSIENT=y
>  CONFIG_LEDS_TRIGGER_CAMERA=y
>  CONFIG_EDAC=y
> +CONFIG_EDAC_LAYERSCAPE=y
>  CONFIG_EDAC_HIGHBANK_MC=y
>  CONFIG_EDAC_HIGHBANK_L2=y
>  CONFIG_RTC_CLASS=y
> @@ -962,6 +974,7 @@ CONFIG_RTC_DRV_MAX8997=m
>  CONFIG_RTC_DRV_MAX77686=y
>  CONFIG_RTC_DRV_RK808=m
>  CONFIG_RTC_DRV_RS5C372=m
> +CONFIG_RTC_DRV_PCF85063=y

module

>  CONFIG_RTC_DRV_PCF85363=m
>  CONFIG_RTC_DRV_BQ32K=m
>  CONFIG_RTC_DRV_TWL4030=y

Best regards,
Krzysztof

