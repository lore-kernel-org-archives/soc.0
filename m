Return-Path: <SRS0=3mSG=WD=gmail.com=orsonzhai@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FABC433EF
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 06:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E22FC34113; Fri, 27 May 2022 06:28:37 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71169C385A9;
	Fri, 27 May 2022 06:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 71169C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id c65so2994966pfb.1;
        Thu, 26 May 2022 23:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XpmmuYOXBkBP9By6R6nKTLgZB5DybQG//UzfVx711Q0=;
        b=a2HrE1/SvaCrCtKv6DERQl7xsr/JdXo+y6Kv7qkTXnE0KniWXHqc+04IujKvcX4vMK
         oIYyuxqY8S6rDGpmnSwbm9vH8LxLWEepZEd/O2/f6++bTuZQi0ceMqbXKrHXogqSJJcC
         Pg/3g7z1QQorrNnnhDNoR/wPiwF7tM1tZ85CNg+1kj1Tyc3BM+IQsWXBHZu/ygdAm/VY
         SZL9GWWNH0u7OvDRqdHQC43DJxTsrCLQni6ROX9JSYxi7HwWvJfL2RBIQsNzBl682pRW
         6E5VfvsGwSLJLjTaXW4luYoHHsIS4y/Y+hkxk7JJp1Gpm+x9jEfATHnKSm16iVCGA10m
         gd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XpmmuYOXBkBP9By6R6nKTLgZB5DybQG//UzfVx711Q0=;
        b=nBIDqhROZ1uz5bcARAcg5c1lK3i91vOYIReK0GTLgBzuhqOxP0x6kEoB9xjHowqo4m
         m/EiweHOwHW1gMWP33V08MBXJSmINnOjzS21r20mtkczcifqf11pfz6gMDVDeQ7gMHWz
         yRovlUs2vlzODCUCT1DYNlW57R1DUekjTwtm3N2kKPf8+gNstuEV2eJi4qE6dw8+43t9
         Hz4g+I1uU1KUgSeb7iE76s9aJOCvUyoxTkGBcqfCA4NMAb780uHD+h1mBIMr6n6m9/gK
         +J7SUWLdIljDQlUC8VqWCTyFTY2hG+SQt7IL/0mY0InJM/Jnelh/cH2eCzgbYPazYh62
         XrJQ==
X-Gm-Message-State: AOAM532er1IimoZU0J0fRnjD/eVhfwIRY0yjOBqNeHwZQ+ua0oYOitOQ
	S/G336Il4jfoE2rz4tmghO8OeKh1YDfsmgjdK9U=
X-Google-Smtp-Source: ABdhPJzBjOQT3REuxrp043mRJ2tOI4cMLlRM9bIyjSl1sP2f6OlLXS00jjixA0RZnsy5AjDGCgciWveo9vvjC7l7PuQ=
X-Received: by 2002:a05:6a00:14d4:b0:518:b918:fae4 with SMTP id
 w20-20020a056a0014d400b00518b918fae4mr20076157pfu.55.1653632915852; Thu, 26
 May 2022 23:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220526204152.831948-1-krzysztof.kozlowski@linaro.org> <CA+H2tpGipB4faYDEdJZ82kjTak5ewW_cp=3LO+JkDa=hYiqZJw@mail.gmail.com>
In-Reply-To: <CA+H2tpGipB4faYDEdJZ82kjTak5ewW_cp=3LO+JkDa=hYiqZJw@mail.gmail.com>
From: Orson Zhai <orsonzhai@gmail.com>
Date: Fri, 27 May 2022 14:28:24 +0800
Message-ID: <CA+H2tpECYtgJAgJbwfgmu++ZVmk+nuoRmK=fX=4pquTFSFyzhg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sprd: adjust whitespace around '='
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Baolin Wang <baolin.wang7@gmail.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 27, 2022 at 12:35 PM Orson Zhai <orsonzhai@gmail.com> wrote:
>
> Hi Krzysztof,
>
> On Fri, May 27, 2022 at 4:42 AM Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Fix whitespace coding style: use single space instead of tabs or
>> multiple spaces around '=' sign in property assignment.  No functional
>> changes (same DTB).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>
> Thanks for your patch.
>
> We have a plan to reconstruct the device tree of SPRD into modular form.
> sc9836 has been in status of EOL for years and I believe no one will need to run it anymore.
> We want to remove it as well.
>
> But your patch is fine.
> It could be taken in advance.
>
> Reviewed-by: Orson Zhai <orsonzhai@gmail.com>

Sorry, re-send for my getting failure...

-Orson

>
>> ---
>>
>> Output compared with dtx_diff and fdtdump.
>> ---
>>  arch/arm64/boot/dts/sprd/sc9836.dtsi  | 10 +++++-----
>>  arch/arm64/boot/dts/sprd/sc9863a.dtsi |  4 ++--
>>  arch/arm64/boot/dts/sprd/whale2.dtsi  |  2 +-
>>  3 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/sprd/sc9836.dtsi b/arch/arm64/boot/dts/sprd/sc9836.dtsi
>> index 231436be0e3f..8bb8a70966d2 100644
>> --- a/arch/arm64/boot/dts/sprd/sc9836.dtsi
>> +++ b/arch/arm64/boot/dts/sprd/sc9836.dtsi
>> @@ -207,11 +207,11 @@ gic: interrupt-controller@12001000 {
>>         };
>>
>>         psci {
>> -               compatible      = "arm,psci";
>> -               method          = "smc";
>> -               cpu_on          = <0xc4000003>;
>> -               cpu_off         = <0x84000002>;
>> -               cpu_suspend     = <0xc4000001>;
>> +               compatible = "arm,psci";
>> +               method = "smc";
>> +               cpu_on = <0xc4000003>;
>> +               cpu_off = <0x84000002>;
>> +               cpu_suspend = <0xc4000001>;
>>         };
>>
>>         timer {
>> diff --git a/arch/arm64/boot/dts/sprd/sc9863a.dtsi b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
>> index 8cf4a6575980..22d81ace740a 100644
>> --- a/arch/arm64/boot/dts/sprd/sc9863a.dtsi
>> +++ b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
>> @@ -552,7 +552,7 @@ ap-ahb {
>>                         ranges;
>>
>>                         sdio0: sdio@20300000 {
>> -                               compatible  = "sprd,sdhci-r11";
>> +                               compatible = "sprd,sdhci-r11";
>>                                 reg = <0 0x20300000 0 0x1000>;
>>                                 interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>>
>> @@ -568,7 +568,7 @@ sdio0: sdio@20300000 {
>>                         };
>>
>>                         sdio3: sdio@20600000 {
>> -                               compatible  = "sprd,sdhci-r11";
>> +                               compatible = "sprd,sdhci-r11";
>>                                 reg = <0 0x20600000 0 0x1000>;
>>                                 interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
>>
>> diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
>> index 79b9591c37aa..957b2658e1fb 100644
>> --- a/arch/arm64/boot/dts/sprd/whale2.dtsi
>> +++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
>> @@ -132,7 +132,7 @@ ap_dma: dma-controller@20100000 {
>>                         };
>>
>>                         sdio3: sdio@50430000 {
>> -                               compatible  = "sprd,sdhci-r11";
>> +                               compatible = "sprd,sdhci-r11";
>>                                 reg = <0 0x50430000 0 0x1000>;
>>                                 interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
>>
>> --
>> 2.34.1
>>
