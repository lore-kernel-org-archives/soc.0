Return-Path: <SRS0=wikG=UU=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCC0C433F5
	for <soc@archiver.kernel.org>; Sun, 10 Apr 2022 02:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3679EC385A0; Sun, 10 Apr 2022 02:39:22 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48400C385A4;
	Sun, 10 Apr 2022 02:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48400C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id t207so6669997qke.2;
        Sat, 09 Apr 2022 19:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4k9M3A5SaOTIoKov6CrPu7jYsykoDqASGcsbW1Bxs2g=;
        b=AHZSbnkdgSigwea2G56xzm53+YbTuhFFSPXwIgKn+Vviezo7xUX1B2Z5IYdWp+5z2b
         4rk4NO0j6irlPJ2XebeMhDD7nfoylM58cb2TQ15TLd4FN4mKLsMFzKNaBIIswUe025y+
         TRu3hCw5NeC4HSbbJTq20TmKkYuKk1yo5b99hpRfySbk+Szci0AHKV3qwekfuofJMyvR
         3GQnTbRs4lVWtGKCaw+hLKJz10LPMAUBzldPxQwxI6PkeqEq90yGYJcU5MkCTO/LsMhX
         E7xXxcI7UEq66//XhQXdxb9Zzk3xs/65tvDsOfkni4xZZvAIH9zzvDgJ3vue5cf55908
         g8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4k9M3A5SaOTIoKov6CrPu7jYsykoDqASGcsbW1Bxs2g=;
        b=QUpWvta3mYUFiAbvN1efzN0NP/UrZG4fc88OvUSB7zG+Jx61fP+drNdb5ZMpofYvM4
         ZQw964AXNy0+uFeolZWOf+JiMGeMau1O3Q/xwkET72OMz1a/un3cYBj9ndwM8lyKCjhV
         /I3obLBCzELK7SU05wmin6ujSZNESg25SIN54nNbsw0musQ0S8ReMgSGbNLE8rMqXla7
         lyrXsKxq+FJPEeJ8NPrdloLV8nbAe9oacLf6hLDcm5qpGgMQTGxmqkJEyynep6h0Q1JW
         I4pmgiTyL8CVhUo5NAkVY0y23JmgtZN7kDa1ZuIvwQjGdjXcVtMGErWVYGf8IOY/0HMO
         5fsQ==
X-Gm-Message-State: AOAM530XLbj1+h9zBKFMcXH/rQb9MjaPr/RPL23nkmx+oWy6D3aHlsZb
	7F+A9ThLnlfBBR56qa5+gjg=
X-Google-Smtp-Source: ABdhPJwReclOWi6comV7f0t4FE3p7oaNQ35SJ8JbEQWYuT+E14luIOkj8va8kxoE4ZlzpOywqqEzKQ==
X-Received: by 2002:a37:f508:0:b0:69b:ed2f:e56 with SMTP id l8-20020a37f508000000b0069bed2f0e56mr5681454qkk.384.1649558360126;
        Sat, 09 Apr 2022 19:39:20 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id d3-20020a05622a15c300b002eb9af4c945sm24191439qty.3.2022.04.09.19.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 19:39:19 -0700 (PDT)
Message-ID: <8d6595d8-13c3-0f29-1a5e-e48e78b01f89@gmail.com>
Date: Sat, 9 Apr 2022 22:39:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 00/12] Add support for the i.MXRT1170-evk
Content-Language: en-US
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch,
 linus.walleij@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, dev@lynxeye.de, marcel.ziswiler@toradex.com,
 tharvey@gateworks.com, leoyang.li@nxp.com, sebastian.reichel@collabora.com,
 cniedermaier@dh-electronics.com, clin@suse.com,
 giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/26/22 10:43, Jesse Taube wrote:
> This patch continues support for the imxrt series now with the imxrt1170
> 
> This patch contains:
> - Update to imxrt_defconfig
> - Devicetree
> - Clock driver
> - Pinctrl driver
> - New pll
> 
> This patch also updates some documentation for both imxrt1170 an 1050.
> 
> The i.MXRT1170 has a vast array of fetures includeing two cores. 2 Ethernet, 2 USB phy, and a 2d gpu.
> 
> It also is fetured in a new google coral board
> https://coral.ai/products/dev-board-micro
> Not affiliated unfortunaly.
> 
> Jesse Taube (12):
>    dt-bindings: arm: imx: Add i.MXRT compatible Documentation
>    dt-bindings: timer: gpt: Add i.MXRT compatible Documentation
>    dt-bindings: pinctrl: add i.MXRT1170 pinctrl Documentation
>    dt-bindings: clock: imx: Add documentation for i.MXRT1170 clock
>    ARM: mach-imx: Add support for i.MXRT1170
>    ARM: clk: imx: Update pllv3 to support i.MXRT1170
>    dt-bindings: imx: Add clock binding for i.MXRT1170
>    clk: imx: Add initial support for i.MXRT1170 clock driver
>    pinctrl: freescale: Add i.MXRT1170 pinctrl driver support
>    ARM: dts: imxrt1170-pinfunc: Add pinctrl binding header
>    ARM: dts: imx: Add i.MXRT1170-EVK support
>    ARM: imxrt_defconfig: Add i.MXRT1170
> 
>   .../devicetree/bindings/arm/fsl.yaml          |   12 +
>   .../bindings/clock/imxrt1170-clock.yaml       |   59 +
>   .../bindings/pinctrl/fsl,imxrt1170.yaml       |   77 +
>   .../devicetree/bindings/timer/fsl,imxgpt.yaml |    2 +
>   arch/arm/boot/dts/Makefile                    |    3 +-
>   arch/arm/boot/dts/imxrt1170-evk.dts           |  126 ++
>   arch/arm/boot/dts/imxrt1170-pinfunc.h         | 1561 +++++++++++++++++
>   arch/arm/boot/dts/imxrt1170.dtsi              |  278 +++
>   arch/arm/configs/imxrt_defconfig              |   26 +
>   arch/arm/mach-imx/mach-imxrt.c                |    1 +
>   drivers/clk/imx/Kconfig                       |    7 +
>   drivers/clk/imx/Makefile                      |    1 +
>   drivers/clk/imx/clk-imxrt1170.c               |  391 +++++
>   drivers/clk/imx/clk-pllv3.c                   |   57 +-
>   drivers/clk/imx/clk.h                         |    4 +
>   drivers/pinctrl/freescale/Kconfig             |    7 +
>   drivers/pinctrl/freescale/Makefile            |    1 +
>   drivers/pinctrl/freescale/pinctrl-imxrt1170.c |  349 ++++
>   include/dt-bindings/clock/imxrt1170-clock.h   |  282 +++
>   19 files changed, 3241 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/imxrt1170-clock.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
>   create mode 100644 arch/arm/boot/dts/imxrt1170-evk.dts
>   create mode 100644 arch/arm/boot/dts/imxrt1170-pinfunc.h
>   create mode 100644 arch/arm/boot/dts/imxrt1170.dtsi
>   create mode 100644 drivers/clk/imx/clk-imxrt1170.c
>   create mode 100644 drivers/pinctrl/freescale/pinctrl-imxrt1170.c
>   create mode 100644 include/dt-bindings/clock/imxrt1170-clock.h
> 
Hi Freind's,

Are there any more comments on this patch set or should V2 be sent.
If there is something obviously wrong that I have missed an you haven't 
I would love to know because I haven't noticed yet.

Cheers,
Jesse Taube
