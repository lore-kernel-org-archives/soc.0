Return-Path: <SRS0=OIpR=WH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE18FC433FE
	for <soc@archiver.kernel.org>; Tue, 31 May 2022 12:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 721CDC3411F; Tue, 31 May 2022 12:59:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1CA06C3411D
	for <soc@kernel.org>; Tue, 31 May 2022 12:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1CA06C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id wh22so26506662ejb.7
        for <soc@kernel.org>; Tue, 31 May 2022 05:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=b3A2vovUg0bKU5JPF4B/5ZbzLLciYdNrlAlezxeHjSc=;
        b=Ua6RfimcV02CpRpxMSv9rTLN7SaJQHO6CY5uIozbXxGUuvbHh79H2CHK2+Vj/3IhUr
         qRky/VIYTMVCs+R/RjdVIAipm085C4P6LCFWgIpeHfmeOqX2PVg4wsY9Dai6z3VtgsWQ
         ea/WB25f+Uu2oCKVDABUnHD/sTOYXYYwp6cYwNzj0XeVBi0IPfxTHRjnAOZR/W77ne9R
         SnbbH9QpmZkvqo1Fl5RdhUltmskaWkTBELsMSGDyWp58CnBmVKiYIfeJBJZNMbzpViyy
         gZpoKUangjO9PallMWGXuQylOcjlQ9fjcNLkKvsrNTJhr7BSohJYPDanalOwX1jOdNCx
         rcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=b3A2vovUg0bKU5JPF4B/5ZbzLLciYdNrlAlezxeHjSc=;
        b=mTr2yR1W3hn4F4wRhlsgnqca8oM+SE+SDMm/NLigZXvFKovWshJgTbCddW4/TgaKOk
         VR3h/BU5ZSLjunpWapbzQeYTfCk0gbI6LL/H3ISER5Ff02g0FIkz2ivngWpocgWrCcgf
         NrRcDfULiph2liebp9lKJo4p//FYZ7sFSiIDagT0ZUye26MKPytD8R0vBJ5gHSNj6vBw
         n9moWmjNcMXuJ3Ot4do7XuCBwBVh0KTGTjO0nzVtfv5p9dU8R4Xmz0X0nN0KwdHccRAK
         7mpzzUKNPmit38+RO2rIape1L+YkMz8/UOAXuTVSPMZ0VygvIb/1Lq06v+Io6euOp2Rp
         xZOA==
X-Gm-Message-State: AOAM533JlgjhzOB1F/VMXuSq557g8qGqlaSdkhdCAWlfcbrM+y/23Wl8
	1qx3xYIdvtksvqrD1nN4lE+zrd6m/IAHUp92
X-Google-Smtp-Source: ABdhPJzjRPFplXkpu7peUA2DXz4es4kPaX1H0gpNC8Bc5HD5GzkJT+RgSbeE8+pcb0r7XWwj0W1dqg==
X-Received: by 2002:a17:907:d01:b0:6fe:dede:41fb with SMTP id gn1-20020a1709070d0100b006fedede41fbmr38003090ejc.105.1654001982383;
        Tue, 31 May 2022 05:59:42 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g10-20020a50d5ca000000b0042ad0358c8bsm8461146edj.38.2022.05.31.05.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 05:59:41 -0700 (PDT)
Message-ID: <93f9a8fb-ce3f-4133-e3ac-13f805af87fa@linaro.org>
Date: Tue, 31 May 2022 14:59:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] dts: socfpga: Change Mercury+ AA1 devicetree to
 header
Content-Language: en-US
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 Dinh Nguyen <dinguyen@kernel.org>
References: <20220530130839.120710-1-pan@semihalf.com>
 <20220530130839.120710-2-pan@semihalf.com>
 <73f01056-e674-d910-1c0d-98c4001f909d@linaro.org>
 <CAF9_jYQTTtK-MmEc11NnW8Aez6OtmZeJB7aPhYLoEvQ9vFiuLQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAF9_jYQTTtK-MmEc11NnW8Aez6OtmZeJB7aPhYLoEvQ9vFiuLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/05/2022 14:43, Paweł Anikiel wrote:
> Thank you for the review, I'm thinking of splitting this commit into
> several smaller ones:
> - remove all status = "okay" things and i2c aliases

This might have sense, might not. Depends whether the interface is
actively used in the SoM or not. If the latter - the interface is only
exposed to the carrier board - then this seems reasonable choice.

> - remove sdmmc-ecc node (it's a part of the Arria 10 SoC, not the mercury)

Sounds good, but maybe not remove but move?

> - add atsha204a node
> - add copyright header

These can come together. Copyright by itself is not a meaningful change,
but usually addon to actual copyrighted work.

> - style fixes (phy reg, memory)

Sure.

> What do you think?
> 
> Please see my other comments below.
> 
> On Mon, May 30, 2022 at 8:55 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 30/05/2022 15:08, Paweł Anikiel wrote:
>>> The Mercury+ AA1 is not a standalone board, rather it's a module
>>> with an Arria 10 SoC and some peripherals on it. Remove everything that
>>> is not strictly related to the module.
>>
>> Subject has several issues:
>> 1. Use prefix matching subsystem (git log --oneline)
> 
> Just to make sure, are you referring to the ARM: prefix?

Yes, ARM: dts: socfpga:

>> 2. You are not changing here anything to header. Header files have
>> different format and end with .h. This is a DTSI file.
> 
> Yes, I meant dtsi.
> 
>>
>>>
>>> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> ---
>>>  arch/arm/boot/dts/Makefile                    |  1 -
>>>  ...1.dts => socfpga_arria10_mercury_aa1.dtsi} | 68 ++++---------------
>>>  2 files changed, 14 insertions(+), 55 deletions(-)
>>>  rename arch/arm/boot/dts/{socfpga_arria10_mercury_aa1.dts => socfpga_arria10_mercury_aa1.dtsi} (58%)
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index edfbedaa6168..023c8b4ba45c 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1146,7 +1146,6 @@ dtb-$(CONFIG_ARCH_S5PV210) += \
>>>       s5pv210-torbreck.dtb
>>>  dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
>>>       socfpga_arria5_socdk.dtb \
>>> -     socfpga_arria10_mercury_aa1.dtb \
>>>       socfpga_arria10_socdk_nand.dtb \
>>>       socfpga_arria10_socdk_qspi.dtb \
>>>       socfpga_arria10_socdk_sdmmc.dtb \
>>> diff --git a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
>>> similarity index 58%
>>> rename from arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
>>> rename to arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
>>> index a75c059b6727..fee1fc39bb2b 100644
>>> --- a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
>>> +++ b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
>>> @@ -1,57 +1,38 @@
>>>  // SPDX-License-Identifier: GPL-2.0
>>> -/dts-v1/;
>>> -
>>> +/*
>>> + * Copyright 2022 Google LLC
>>> + */
>>
>> How is this related to the patch?
> 
> I'll move this change to a seperate commit.
> 
>>
>>>  #include "socfpga_arria10.dtsi"
>>>
>>>  / {
>>> -
>>> -     model = "Enclustra Mercury AA1";
>>> -     compatible = "enclustra,mercury-aa1", "altr,socfpga-arria10", "altr,socfpga";
>>> -
>>>       aliases {
>>>               ethernet0 = &gmac0;
>>>               serial1 = &uart1;
>>> -             i2c0 = &i2c0;
>>> -             i2c1 = &i2c1;
>>> -     };
>>> -
>>> -     memory@0 {
>>> -             name = "memory";
>>> -             device_type = "memory";
>>> -             reg = <0x0 0x80000000>; /* 2GB */
>>>       };
>>>
>>>       chosen {
>>>               stdout-path = "serial1:115200n8";
>>>       };
>>> -};
>>>
>>> -&eccmgr {
>>> -     sdmmca-ecc@ff8c2c00 {
>>> -             compatible = "altr,socfpga-sdmmc-ecc";
>>> -             reg = <0xff8c2c00 0x400>;
>>> -             altr,ecc-parent = <&mmc>;
>>> -             interrupts = <15 IRQ_TYPE_LEVEL_HIGH>,
>>> -                          <47 IRQ_TYPE_LEVEL_HIGH>,
>>> -                          <16 IRQ_TYPE_LEVEL_HIGH>,
>>> -                          <48 IRQ_TYPE_LEVEL_HIGH>;
>>> +     memory@0 {
>>> +             name = "memory";
>>> +             device_type = "memory";
>>> +             reg = <0x0 0x80000000>; /* 2GB */
>>>       };
>>>  };
>>>
>>>  &gmac0 {
>>>       phy-mode = "rgmii";
>>> -     phy-addr = <0xffffffff>; /* probe for phy addr */
>>> +     phy-handle = <&phy3>;
>>>
>>>       max-frame-size = <3800>;
>>> -     status = "okay";
>>> -
>>> -     phy-handle = <&phy3>;
>>>
>>>       mdio {
>>>               #address-cells = <1>;
>>>               #size-cells = <0>;
>>>               compatible = "snps,dwmac-mdio";
>>>               phy3: ethernet-phy@3 {
>>> +                     reg = <3>;
>>>                       txd0-skew-ps = <0>; /* -420ps */
>>>                       txd1-skew-ps = <0>; /* -420ps */
>>>                       txd2-skew-ps = <0>; /* -420ps */
>>> @@ -64,35 +45,23 @@ phy3: ethernet-phy@3 {
>>>                       txc-skew-ps = <1860>; /* 960ps */
>>>                       rxdv-skew-ps = <420>; /* 0ps */
>>>                       rxc-skew-ps = <1680>; /* 780ps */
>>> -                     reg = <3>;
>>
>> This and few other changes (like memory) are not related to the commit.
>> Do not mix different cleanups together.
> 
> l'll put the cleanup changes into a seperate commit.
> 
>>
>>>               };
>>>       };
>>>  };
>>>
>>> -&gpio0 {
>>> -     status = "okay";
>>> -};
>>> -
>>> -&gpio1 {
>>> -     status = "okay";
>>> -};
>>> -
>>> -&gpio2 {
>>> -     status = "okay";
>>> -};
>>
>> Why removing all these? Aren't they available on the SoM? The same
>> question applies to several other pieces, for example UART and USB -
>> aren't these part of SoM?
> 
> I'm removing them from here, but adding them to socfpga_arria10_chameleonv3.dts.
> I think that enabling them should be done in the base board's dts, as
> the connections
> go to the base board. The Chameleon v3 has a USB port, but a different
> base board might
> not have one.

This sounds reasonable (unless such bus is still used internally in the
SoM).

Best regards,
Krzysztof
