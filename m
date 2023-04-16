Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68579C77B76
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 10:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 417C2C4339B; Sun, 16 Apr 2023 10:26:24 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35BA8C433D2;
	Sun, 16 Apr 2023 10:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35BA8C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id xi5so56820307ejb.13;
        Sun, 16 Apr 2023 03:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681640781; x=1684232781;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18TERSmaaXbG0DMiqdELwQx5niIwl3EaR30SKNprfWo=;
        b=aGGelyyqD5Nr2w71fggyoZWACdgQRp1RtuLRXiZdI/2LbrY5wpd9TLV2CJ/EBIQEJm
         aaPPSGLLnDly5MPj5zGJihzMvugqhJF2pyA/amJ5T33bGNKMpGkJFzCKDfvJdUgb6/c4
         8h+i3ysoZLQHMWToxGKTM/ZGbbwgNFV7HrB2P7Tqmeazh/2iozntttsHHbjzbKrtjoTy
         TiGTS4zMy418tREL5XNO7hzLfLxVGYkhXGtY6ItqCRgHCZMZALVe3Ukn5H+nzNzpL+T2
         dVj/WISR2aGrfttx10cOAXa59yyCTDepMVq5YrkWpXV4457SmXpkBTAHpP49HkcWIYeF
         AvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681640781; x=1684232781;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18TERSmaaXbG0DMiqdELwQx5niIwl3EaR30SKNprfWo=;
        b=GLnxygz3ZwvdhbpmCyM5EsS+N8jZel2KQegOpQ5d1XcvHDhLo/rmZd78dEBI+W7GvD
         k1E97C6nhQ2IQFOUAyLH/nDQr1ZAZTGoR6sRtRtsJ1MNzHD+daepeYnQJzNlfy+/SdCE
         s9dl+EotV51R6ALv371d3Dmez2YqtOc+Ib/dMtBodYA95lcuW+RzO22TwiS1xszs1hLC
         Ghu1pZ4hwnMFnmV6b5hLDDgaHQhTDLGWr9LuMVpcMh23vGkJnciLnm9cRplorEq0MNpa
         Dj4jIWvEpRJJHpiGf3GCd81SfUbm1bZyVkimBLDg7WnFVrxUvE9QPi1RE6tib/6FzdI8
         kB4Q==
X-Gm-Message-State: AAQBX9e2ZRMOlFka4VJXcCoJLPtp9iFmUCPb2w6BXut8doujk44VdfIJ
	4UqLmzqfr3wpbFQQLo0BXI8=
X-Google-Smtp-Source: AKy350ZHhU8Zzl8mH9AXBlTuo6j42D0d7sHHVuXJZiIXLupMYOpRNUGLEb0QwKEXeNl9UcbFIVudQQ==
X-Received: by 2002:a17:906:9407:b0:94f:1:8468 with SMTP id q7-20020a170906940700b0094f00018468mr4188570ejx.17.1681640781251;
        Sun, 16 Apr 2023 03:26:21 -0700 (PDT)
Received: from [192.168.50.244] (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id f2-20020a056402068200b005069175dcb7sm1787767edy.58.2023.04.16.03.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 03:26:20 -0700 (PDT)
Message-ID: <3e513119-4d6a-18ec-aaec-1c6b2b7e35b4@gmail.com>
Date: Sun, 16 Apr 2023 12:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 00/12] Re-introduce Exynos4212 support and add Samsung
 Galaxy Tab 3 8.0 boards
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230416101624.15866-1-aweber.kernel@gmail.com>
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20230416101624.15866-1-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2023 12:16, Artur Weber wrote:
> This patches re-introduces the Exynos4212 platform and adds support
> for the Samsung Galaxy Tab 3 8.0 series of tablets that uses it:
> 
>   - Samsung Galaxy Tab 3 8.0 WiFi (SM-T310/lt01wifi)
>   - Samsung Galaxy Tab 3 8.0 3G (SM-T311/lt013g)
>   - Samsung Galaxy Tab 3 8.0 LTE (SM-T315/lt01lte)
> 
> What works:
> 
>   - Display and backlight
>   - Touchscreen (without touchkeys)
>   - GPIO buttons, hall sensor
>   - WiFi and Bluetooth
>   - USB, fuel gauge, charging (partial)
>   - Accelerometer and magnetometer
>   - WiFi model only: light sensor

This patchset depends on "[PATCH 0/3] Add Samsung S6D7AA0 panel 
controller driver" for the display panel support for the Samsung Galaxy 
3 8.0 boards.

> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> 
> Artur Weber (12):
>    dt-bindings: soc: samsung: add Exynos4212 PMU compatible
>    dt-bindings: clock: add Exynos4212 clock compatible
>    ARM: exynos: Re-introduce Exynos4212 support
>    soc: samsung: Re-introduce Exynos4212 support
>    clk: samsung: Add Exynos4212 compatible to CLKOUT driver
>    clk: samsung: Re-add support for Exynos4212 CPU clock
>    Revert "media: exynos4-is: Remove dependency on obsolete SoC support"
>    Revert "phy: Remove SOC_EXYNOS4212 dep. from PHY_EXYNOS4X12_USB"
>    ARM: dts: Move common Exynos4x12 definitions to exynos4x12.dtsi
>    ARM: dts: Re-introduce Exynos4212 DTSI
>    dt-bindings: arm: samsung: Add Samsung Galaxy Tab3 family boards
>    ARM: dts: exynos: Add Samsung Galaxy Tab 3 8.0 boards
> 
>   .../bindings/arm/samsung/samsung-boards.yaml  |   10 +
>   .../bindings/clock/samsung,exynos-clock.yaml  |    1 +
>   .../bindings/soc/samsung/exynos-pmu.yaml      |    3 +
>   arch/arm/boot/dts/Makefile                    |    3 +
>   arch/arm/boot/dts/exynos4212-tab3-3g8.dts     |   30 +
>   arch/arm/boot/dts/exynos4212-tab3-lte8.dts    |   43 +
>   arch/arm/boot/dts/exynos4212-tab3-wifi8.dts   |   25 +
>   arch/arm/boot/dts/exynos4212-tab3.dtsi        | 1175 +++++++++++++++++
>   arch/arm/boot/dts/exynos4212.dtsi             |  157 +++
>   arch/arm/boot/dts/exynos4412.dtsi             |  645 +--------
>   ...2-pinctrl.dtsi => exynos4x12-pinctrl.dtsi} |    4 +-
>   arch/arm/boot/dts/exynos4x12.dtsi             |  665 ++++++++++
>   arch/arm/mach-exynos/Kconfig                  |    5 +
>   arch/arm/mach-exynos/common.h                 |    8 +
>   arch/arm/mach-exynos/exynos.c                 |    2 +
>   arch/arm/mach-exynos/firmware.c               |    8 +-
>   arch/arm/mach-exynos/pm.c                     |    2 +-
>   arch/arm/mach-exynos/suspend.c                |    4 +
>   drivers/clk/samsung/clk-exynos-clkout.c       |    3 +
>   drivers/clk/samsung/clk-exynos4.c             |   44 +-
>   .../media/platform/samsung/exynos4-is/Kconfig |    2 +-
>   .../platform/samsung/exynos4-is/fimc-core.c   |    2 +-
>   .../platform/samsung/exynos4-is/fimc-lite.c   |    2 +-
>   drivers/phy/samsung/Kconfig                   |    2 +-
>   drivers/soc/samsung/exynos-pmu.c              |    9 +
>   drivers/soc/samsung/exynos-pmu.h              |    2 +
>   drivers/soc/samsung/exynos4-pmu.c             |   13 +-
>   27 files changed, 2213 insertions(+), 656 deletions(-)
>   create mode 100644 arch/arm/boot/dts/exynos4212-tab3-3g8.dts
>   create mode 100644 arch/arm/boot/dts/exynos4212-tab3-lte8.dts
>   create mode 100644 arch/arm/boot/dts/exynos4212-tab3-wifi8.dts
>   create mode 100644 arch/arm/boot/dts/exynos4212-tab3.dtsi
>   create mode 100644 arch/arm/boot/dts/exynos4212.dtsi
>   rename arch/arm/boot/dts/{exynos4412-pinctrl.dtsi => exynos4x12-pinctrl.dtsi} (99%)
>   create mode 100644 arch/arm/boot/dts/exynos4x12.dtsi
> 

