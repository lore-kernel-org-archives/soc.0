Return-Path: <SRS0=rlZL=6N=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE16DC05027
	for <soc@archiver.kernel.org>; Fri, 17 Feb 2023 08:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD337C4339C; Fri, 17 Feb 2023 08:38:42 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97966C433EF
	for <soc@kernel.org>; Fri, 17 Feb 2023 08:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97966C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id dn12so9211823edb.5
        for <soc@kernel.org>; Fri, 17 Feb 2023 00:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aotVjKdB3w06esRBunGunh97EJ04YUQLCEZCyWhQd9k=;
        b=df6K4Ks6N85m4BeBsuetyvq5ED9kxeN+MXWQ6tWrvqcrayBDZOQvLUZq+PatnBKOx6
         Hou9Zny1NgQ7aOulocFLMA5Ol7oI+a3qZhLwVUzEBFlzsiw6ATSD0rtEeTcvl6HlC3Iu
         Z/jXrI9UDvDmcOLT/XgSbzRbihv1WOWC5Rfx/7SoXAznNUeovsYE9a/bdTOyMeLK2wng
         SgWVhhQT6d0NpDxHH1Z14rA72CsgdPP9kxWIgfV+lAfMkG+49sypbkF3plDhXvztVTxd
         6lDVMWUb+Cauezs/fjktq/kyaIXB94cG83EEb3Bis8A5QclisLYdAV9gSvflVChF804F
         njGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aotVjKdB3w06esRBunGunh97EJ04YUQLCEZCyWhQd9k=;
        b=tzJLo3rMWVIoA8/gq9W+YvWBzAZmt7XmF6JUBSAldIgSdpCz2RUm721yzgUVKY/T7G
         TQcXpUUL2MZrAdKcK7YGTjKcKbYJ9k/Kxj4hmoxQDg33w/DTBIi4dXKH7wdBbfFc3/kt
         RJC5A1kbAJNf2leTLrgiiETq/rkwk7QhkQBCHzyBfGw67d+tzTdbAoTX14A8tS/XPa3x
         4aI2UrU3btW2Aj4y+m78Woj1WSXO0pQXEQETqCtuo7fvaBjdvXhKxP58CZGLfABz4Jal
         7kBrq1f3JTO8SAnUSo8RFTTz1AJiLW9SaeNHeY/SfefJjqpbheYxgWxfZ1GUGaJTrBkw
         0spw==
X-Gm-Message-State: AO0yUKWgARvI5dK/houKDn6eftH8PL9mNdakd0vpLqiC+hdexclfitLk
	3dmQ4Hzf6COR31Mt1cK1cVtq3Q==
X-Google-Smtp-Source: AK7set+/MdUcpE4Maq2Ti97rOUOiH4YBI2R73rUdx7sI33PB3L/2q6FL13Hu1VFrtA7SlI4oLARTpw==
X-Received: by 2002:a17:907:2b11:b0:8ae:b008:9b5a with SMTP id gc17-20020a1709072b1100b008aeb0089b5amr6579929ejc.69.1676623119785;
        Fri, 17 Feb 2023 00:38:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g23-20020a170906539700b008b128106fc7sm1850796ejo.46.2023.02.17.00.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 00:38:39 -0800 (PST)
Message-ID: <fb9c9533-b72b-7e20-0ee2-cca6491ea2af@linaro.org>
Date: Fri, 17 Feb 2023 09:38:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ARM: dts: mvebu: Add support for Thecus N2350 board
Content-Language: en-US
To: Tony Dinh <mibodhi@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-kernel@vger.kernel.org, soc@kernel.org
References: <20230216011046.3306-1-mibodhi@gmail.com>
 <b9af4410-2352-b5f1-0fa8-8fc481001065@linaro.org>
 <CAJaLiFypS2wtsj65D1WrSjsgDeN+jpUVYcbvOHdiYvneiCK_Aw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJaLiFypS2wtsj65D1WrSjsgDeN+jpUVYcbvOHdiYvneiCK_Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2023 22:25, Tony Dinh wrote:
> Hi Andrew,
> Hi Krzysztof,
> 
> On Thu, Feb 16, 2023 at 12:31 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 16/02/2023 02:10, Tony Dinh wrote:
>>> Thecus N2350 is a NAS based on Marvell Armada 385 SoC.
>>>
>>> Board Specification:
>>>
>>> - Marvel MV88F6820 Dual Core at 1GHz
>>> - 1 GiB DDR4 RAM
>>> - 4MB Macronix mx25l3205d SPI flash
>>> - 512MB Hynix H27U4G8F2DTR-BC NAND flash
>>> - I2C
>>> - 2x USB 3.0
>>> - 1x GBE LAN port (PHY: Marvell 88E1510)
>>> - 2x SATA (hot swap slots)
>>> - 3x buttons
>>> - 10x LEDS
>>> - serial console
>>>
>>> Signed-off-by: Tony Dinh <mibodhi@gmail.com>
>>> ---
>>>
>>>  arch/arm/boot/dts/Makefile                    |   1 +
>>>  arch/arm/boot/dts/armada-385-thecus-n2350.dts | 432 ++++++++++++++++++
>>>  2 files changed, 433 insertions(+)
>>>  create mode 100644 arch/arm/boot/dts/armada-385-thecus-n2350.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index d08a3c450..749790e6e 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1528,6 +1528,7 @@ dtb-$(CONFIG_MACH_ARMADA_38X) += \
>>>       armada-385-linksys-rango.dtb \
>>>       armada-385-linksys-shelby.dtb \
>>>       armada-385-synology-ds116.dtb \
>>> +     armada-385-thecus-n2350.dtb \
>>>       armada-385-turris-omnia.dtb \
>>>       armada-388-clearfog.dtb \
>>>       armada-388-clearfog-base.dtb \
>>> diff --git a/arch/arm/boot/dts/armada-385-thecus-n2350.dts b/arch/arm/boot/dts/armada-385-thecus-n2350.dts
>>> new file mode 100644
>>> index 000000000..38114d842
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/armada-385-thecus-n2350.dts
>>> @@ -0,0 +1,432 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Device Tree file for Thecus N2350 board
>>> + *
>>> + * Copyright (C) 2018-2023 Tony Dinh <mibodhi@gmail.com>
>>> + * Copyright (C) 2018 Manuel Jung <manuel.jung@hotmail.com>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +#include <dt-bindings/input/input.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include "armada-385.dtsi"
>>> +
>>> +/ {
>>> +     model = "Thecus N2350";
>>> +     compatible = "thecus,n2350", "marvell,armada385";
>>
>> Missing vendor prefix documentation. I wanted to say: "missing new
>> compatible documentation", but seems Marvell is missing these. Let's
>> start documenting at least new compatibles in YAML? Like Rob proposed
>> here for OMAP:
>> https://lore.kernel.org/all/20230209173534.GA539622-robh@kernel.org/
> 
> I was under the impression that the Documentation patch has to be a
> separate patch, as stated in
> Documentation/devicetree/bindings/submitting-patches.rst. Should I
> include documentation in this add-support patch?

Yes, it must be separate patch and must be first in the patchset using
new compatibles. Otherwise when we apply this, we get warnings of
undocumented compatibles.


Best regards,
Krzysztof

