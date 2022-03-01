Return-Path: <SRS0=GkT/=TM=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729EAC433EF
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 08:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 403C3C340F1; Tue,  1 Mar 2022 08:08:07 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86957C340EE
	for <soc@kernel.org>; Tue,  1 Mar 2022 08:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86957C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id k29-20020a05600c1c9d00b003817fdc0f00so849630wms.4
        for <soc@kernel.org>; Tue, 01 Mar 2022 00:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=53dOAB2vBN3+b4Fbz+8eHbf2N76aKf8ZDQVBCIga/q8=;
        b=cgJ73JoWW5R1zOaE3eQq/WB3EEbveu0prkJNYZDoReh5an/6ry8x1dpyLn9Qvc/R2A
         b5tnmvrCIQof0hhvjoTRtHtqF5nkzem96v72LhUPE3Kb93mXQ2YSAkH5JKRCkFZUISgC
         A1sza/UotJgRM3/DQTH523/h364l/EAA0t+BDeuhWV+CrTekoVgm/zyXdBONxlsz3FDB
         t2pni8nENIwm2ZYgqedL3wq3IR6XGs9Dm+zrsZi13NdajCtqcr+a2Imo+vo+V4O0J84U
         gvKqpxfmAifYU/DxKKjJGk1LCAQqeNuOdUMv2s/D65LqmrOuCRNT5e00UiDLPEbhBlIo
         Ussg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=53dOAB2vBN3+b4Fbz+8eHbf2N76aKf8ZDQVBCIga/q8=;
        b=uCqw3VqW1uFQTPNjjPdx7RhSww9NbkZYdCeZkCWh3VFDRRqx/rmcqAWhZO6QkHpWFv
         Yqvg+5etvA8iImfHa2lyMGo2qW/hbwolHCuHNImSEE0AxoPSLOnvrMsnlQ8pUgQQIlud
         kq2rpiZGWb3HUIP20SYMXcgg3jD1yGTvBGPTxXCHB2Y5NpdN35vR0/3lTScMs34CaYep
         zZ8QAB5IPJfNkDC4PvDwlUcncIOrDyASnfEmMeBnWWcHUO4cePf/N4iS5t4oBIsHqHI0
         Ti/3fpqvYaNiJu84ZqshIrbNgivO+/AqmBlyxcVOFviSVWiCIQUlciDlXMVJMZ/NWrza
         /afQ==
X-Gm-Message-State: AOAM532Dtobk4cQFvE617RshCdz5ZTkRPLbQsVof2AxIDa/r1NO6EGUW
	kbReplqZzjbVQzwlgT7rQJ0fmS29Y/Xi5g==
X-Google-Smtp-Source: ABdhPJwjGoPSylNWjBtSFXHIe6pLfehteffxF8Bjft8RLt4F+qM/K2M/+iCsfvHvSVeKej5MmXkXmQ==
X-Received: by 2002:a7b:c959:0:b0:381:4b39:e9c3 with SMTP id i25-20020a7bc959000000b003814b39e9c3mr11055189wml.4.1646122084836;
        Tue, 01 Mar 2022 00:08:04 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id a9-20020a05600c2d4900b0038100a95903sm1641634wmg.41.2022.03.01.00.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 00:08:04 -0800 (PST)
Message-ID: <860747c9-109f-20d7-84d1-94e2eebee9d2@gmail.com>
Date: Tue, 1 Mar 2022 09:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 00/13] Add support for Airoha EN7523 SoC
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, john@phrozen.org
References: <20220130145116.88406-1-nbd@nbd.name>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/01/2022 15:51, Felix Fietkau wrote:
> This patchset adds support for the Airoha EN7523 SoC, intended primarily
> for xPON/xDSL routers.
> 

I applied patch 1, 2, 3, 4 and 13 to me tree. The rest unfortunately will need 
to go through clk and pci tree or at least need a Acked-by from the maintainers.

Thanks!
Matthias

> Felix Fietkau (4):
>    clk: en7523: Add clock driver for Airoha EN7523 SoC
>    ARM: dts: add clock support for Airoha EN7523
>    PCI: mediatek: Allow building for ARCH_AIROHA
>    ARM: dts: Add PCIe support for Airoha EN7523
> 
> John Crispin (9):
>    dt-bindings: Add vendor prefix for Airoha
>    dt-bindings: arm: airoha: Add binding for EN7523 SoC and EVB
>    ARM: Add basic support for Airoha EN7523 SoC
>    ARM: multi_v7_defconfig: Add support for Airoha EN7523 SoC
>    dt-bindings: Add en7523-scu device tree binding documentation
>    dt-bindings: PCI: Add support for Airoha EN7532
>    dt-bindings: arm: airoha: Add binding for Airoha GPIO controller
>    gpio: Add support for Airoha EN7523 GPIO controller
>    ARM: dts: add GPIO support for Airoha EN7523
> 
>   .../devicetree/bindings/arm/airoha.yaml       |  28 ++
>   .../bindings/clock/airoha,en7523-scu.yaml     |  58 +++
>   .../bindings/gpio/airoha,en7523-gpio.yaml     |  67 ++++
>   .../devicetree/bindings/pci/mediatek-pcie.txt |   1 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   arch/arm/Kconfig                              |  12 +
>   arch/arm/Makefile                             |   1 +
>   arch/arm/boot/dts/Makefile                    |   2 +
>   arch/arm/boot/dts/en7523-evb.dts              |  43 +++
>   arch/arm/boot/dts/en7523.dtsi                 | 205 ++++++++++
>   arch/arm/configs/multi_v7_defconfig           |   1 +
>   arch/arm/mach-airoha/Makefile                 |   2 +
>   arch/arm/mach-airoha/airoha.c                 |  16 +
>   drivers/clk/Kconfig                           |   9 +
>   drivers/clk/Makefile                          |   1 +
>   drivers/clk/clk-en7523.c                      | 350 ++++++++++++++++++
>   drivers/gpio/Kconfig                          |  10 +
>   drivers/gpio/Makefile                         |   1 +
>   drivers/gpio/gpio-en7523.c                    | 137 +++++++
>   drivers/pci/controller/Kconfig                |   2 +-
>   include/dt-bindings/clock/en7523-clk.h        |  17 +
>   21 files changed, 964 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/airoha.yaml
>   create mode 100644 Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>   create mode 100644 Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
>   create mode 100644 arch/arm/boot/dts/en7523-evb.dts
>   create mode 100644 arch/arm/boot/dts/en7523.dtsi
>   create mode 100644 arch/arm/mach-airoha/Makefile
>   create mode 100644 arch/arm/mach-airoha/airoha.c
>   create mode 100644 drivers/clk/clk-en7523.c
>   create mode 100644 drivers/gpio/gpio-en7523.c
>   create mode 100644 include/dt-bindings/clock/en7523-clk.h
> 
