Return-Path: <SRS0=X96t=R3=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34B3C433F5
	for <soc@archiver.kernel.org>; Tue, 11 Jan 2022 21:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83671C36AE9; Tue, 11 Jan 2022 21:57:47 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA61AC36AE3;
	Tue, 11 Jan 2022 21:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA61AC36AE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id b127so453173qkd.0;
        Tue, 11 Jan 2022 13:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tAICFwgK+5loeH6T2WZmu2JcAthYSYGSu13AnEoNjNo=;
        b=fu4Ru7hpqv2MN1GE7X5Z3Yv5Iy511hZj7DD6BAf57927si2x3BZBW2nMIeOvUGbBUc
         rGsNOTrsbFcKZaoopAV518MvWttifE9a7k43KazdqQeoWPpfs/oAE3tZoOrRnbya0QgT
         CBrnkz08m0SVDhNBAVVepWaL6YOI7BHez6Y9I83lGBNT/+KPkSDzlHrcfLvK11OikIPy
         1COTr9fJev3Ak4Afq+vFvAApjPWYn8HGdcGzxpBYXmHRjQicFA5rDUmgsS9pkieQubar
         fO7DsnREFVGz2mKFKCxZiF2HU6JA/6bqKaByttjUC3IAtDs1R2Un9I4LmRd1PSfnQH+R
         +E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tAICFwgK+5loeH6T2WZmu2JcAthYSYGSu13AnEoNjNo=;
        b=5/fmwgPPxAFs5VocIIrUIBOsvlizX2CTIU+ZP1H1qyyDjPkgzcxbHKeDInSVQWRYhN
         CTEAXSMJFUSlEeA75P2LIY8rZPVSIKeJVoO6H2otS25vLC5bSqTeWX9N3RApqANdTQNA
         QXayOEy5RIMHN+0G0UryWNwtDL/vnTAwSYOcVIizO7xQy1rtkM4mKEbFyNQYO9NdCem0
         4TK3GtKw9P98LkbVYuIl6O/vGghcVqY1IrKkOKnbCUB4rpznrJ4glAR+vIKXeFaRvWEm
         OCM9jGeNtEQ3Lzvjx78CsUP1QMFAY7uAmeRcsLDVhWnLMFq2eucvKlE2U25SXqBSZzZY
         U/6Q==
X-Gm-Message-State: AOAM533RHsE8d46EfLhwt0MSRhUPxTYgNZZ5JaHaHjHvlFk7eOWa2xiR
	quaMorOSixI8OfruFjh2O/4=
X-Google-Smtp-Source: ABdhPJxGF2boBf45RLlVY7W/rjQ/EenPnnKU3Yl1sJb7Tyb7flGCBD30h037BkXfrIZQB0I1TRKIMQ==
X-Received: by 2002:a05:620a:1b:: with SMTP id j27mr4553408qki.308.1641938265879;
        Tue, 11 Jan 2022 13:57:45 -0800 (PST)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id n129sm7050881qkn.64.2022.01.11.13.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 13:57:45 -0800 (PST)
Message-ID: <fc0169c3-eea7-e067-784b-eebeccee13b8@gmail.com>
Date: Tue, 11 Jan 2022 16:57:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v7 0/7] Add initial support for the i.MXRTxxxx SoC family
 starting from i.IMXRT1050 SoC.
Content-Language: en-US
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20220111212606.2072669-1-Mr.Bossman075@gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <20220111212606.2072669-1-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/11/22 16:25, Jesse Taube wrote:
> This patchset contains:
> - i.MXRT10xx family infrastructure
> - i.MXRT1050 pinctrl driver adaption
> - i.MXRT1050 clock driver adaption
> - i.MXRT1050 sd-card driver adaption
> - i.MXRT1050 uart driver adaption
> - i.MXRT1050-evk basic support
> 
> The i.MXRTxxxx family that could have support by Linux actually spreads
> from i.MXRT1020 to i.MXRT1170 with the first one supporting 1 USB OTG &
> 100M ethernet with a cortex-M7@500Mhz up to the latter with i.MXRT1170
> with cortex-M7@1Ghz and cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU,
> 2x 1Gb and 1x 100Mb ENET. The i.MXRT family is NXP's answer to
> STM32F7XX, as it uses only simple SDRAM, it gives the chance of a 4 or
> less layer PCBs. Seeing that these chips are comparable to the
> STM32F7XXs which have linux ported to them it seems reasonable to add
> support for them.
> 
> Giving Linux support to this family should ease the development process,
> instead of using a RTOS they could use Embedded Linux allowing for more
> portability, ease of design and will broaden the scope of people using
> embedded linux.
> 
> The EVK has very little SDRAM, generally 32MB starting from
> i.MXRT1020(the lowest P/N), although the i.MXRT1160/70 provide instead
> 64MB of SDRAM for more functionality.
> 
> At the moment we do not support XIP for either u-boot or Linux but it
> should be done in the future. XIP will also save SDRAM.
> 
> Another interesting fact is the amount of internal SRAM, as the P/N
> increases the SRAM will reach up to 2MB(some could be for cache and
> some would be for video).
> 
> Also, some parts have embed flash of 4MB that can be used for
> u-boot/Linux, if both correctly sized it will leave the SDRAM free.
> 
> External flash can be Quad SPI and HyperFlash, so throughput would be
> decent.
> 
> The i.MXRT11xx series supports MIPI interface too.
> 
> The family in general provide CAN bus, audio I/O, 1 or more
> USB(otg/host), 1 or more 100Mb/1Gb ethernet, camera interface, sd-card.
> 
> All this can be used for simple GUIs, web-servers, point-of-sale
> stations, etc.
> 
> 
> Giulio Benetti (4):
>    ARM: imx: Add initial support for i.MXRT10xx family
>    dt-bindings: imx: Add clock binding for i.MXRT1050
>    ARM: dts: imx: Add i.MXRT1050-EVK support
>    ARM: imxrt_defconfig: Add i.MXRT family defconfig
> 
> Jesse Taube (3):
>    ARM: dts: imxrt1050-pinfunc: Add pinctrl binding header
>    dt-bindings: clock: imx: Add documentation for i.MXRT1050 clock
>    clk: imx: Add initial support for i.MXRT1050 clock driver
> 
>   .../bindings/clock/imxrt1050-clock.yaml       |  67 ++
>   arch/arm/boot/dts/Makefile                    |   2 +
>   arch/arm/boot/dts/imxrt1050-evk.dts           |  72 ++
>   arch/arm/boot/dts/imxrt1050-pinfunc.h         | 993 ++++++++++++++++++
>   arch/arm/boot/dts/imxrt1050.dtsi              | 160 +++
>   arch/arm/configs/imxrt_defconfig              |  35 +
>   arch/arm/mach-imx/Kconfig                     |   7 +
>   arch/arm/mach-imx/Makefile                    |   2 +
>   arch/arm/mach-imx/mach-imxrt.c                |  19 +
>   drivers/clk/imx/Kconfig                       |   7 +
>   drivers/clk/imx/Makefile                      |   1 +
>   drivers/clk/imx/clk-imxrt1050.c               | 168 +++
>   include/dt-bindings/clock/imxrt1050-clock.h   |  72 ++
>   13 files changed, 1605 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
>   create mode 100644 arch/arm/boot/dts/imxrt1050-evk.dts
>   create mode 100644 arch/arm/boot/dts/imxrt1050-pinfunc.h
>   create mode 100644 arch/arm/boot/dts/imxrt1050.dtsi
>   create mode 100644 arch/arm/configs/imxrt_defconfig
>   create mode 100644 arch/arm/mach-imx/mach-imxrt.c
>   create mode 100644 drivers/clk/imx/clk-imxrt1050.c
>   create mode 100644 include/dt-bindings/clock/imxrt1050-clock.h
> 

Oh No!
I'm very sorry I sent v8 under the wrong version number. I sent it again...

Sincerely,
	Jesse Taube

