Return-Path: <SRS0=CAhr=V7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6F8C433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 15:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC7E9C3411B; Mon, 23 May 2022 15:23:04 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB645C34116
	for <soc@kernel.org>; Mon, 23 May 2022 15:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB645C34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id g16so17636184lja.3
        for <soc@kernel.org>; Mon, 23 May 2022 08:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=D5XQc8wBj+L7y1AKbIXLkcUnNCOQ5528vAYo2Vyy7WQ=;
        b=M7gmNtjCllRiORAgUIpKMPSb7oS9uKwtrDvNNzoyTSoMLPRhnQOtG/+dKE/mFFVndU
         OfXjCys6aayQms2XeXouvsn8NgCDzlz0jOVSflxi7+EqCuu+XZjYixHkZyqBHuLr7CDl
         dD4XtHTv7NOSdCzZTaYJCqNAZvGSGBAPr1ly0HApxqUZGYG8+iDidxUBZAb9UlWAqHV0
         Coi2FFoPTpsFeNwdSX11azNbYK6bnKxbsLyffFRXG71CUcsDmlq618ZtEM6OHvDrntvy
         7THTrF2vJ0lk90FcFauZANDwpRTJULBxAKwr6HbwVfOpds4TPAnexwSdK0fzsqFNybYo
         v+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D5XQc8wBj+L7y1AKbIXLkcUnNCOQ5528vAYo2Vyy7WQ=;
        b=5hLeCAn538F5W1/qckzG5x3dAcUrY8URbmuXczSA3ZbHPrduCmh7d+UsGV1+UurwDz
         HV6yc/Q4Nz2JT7Ven2hbNbFbcM1Qbe88kXTyTE13cDxBAR+hbwPTMjPJuBJcXxy+l+kT
         /WRpJ7k5uP5hlFyzI2uwxAXh5AiwEQJJ1GgfqoYocvPE4g9kKR0g/2x3wxoRf5rhl4Od
         W7fpL+j6i6IOTXOvHnLe4eLbdiucxJCwrDJln7vAhhMmC9lUvaFRYD/HMv3Kpv80IXg3
         qdaWsc+fbdSIfgw5e9g64p6urjAYWLKKLEW3QuJLyEL83NfCv6AInQeHFYpqiOwe+Uem
         JtbA==
X-Gm-Message-State: AOAM531ExniofnfQMf0+iZHez24qK5F5cBrn5D3Rz0xaEiDXSo12adwp
	vS432sOqkohAVU3DQOtR1+E/CA==
X-Google-Smtp-Source: ABdhPJyVAM7kdjjShrP2QVKN0ERRYTn2eTJCgTp0tcXYWrz6bJpRhAVwFD/O3F0/8vaeprEbpanvdw==
X-Received: by 2002:a2e:9655:0:b0:253:d575:9a6d with SMTP id z21-20020a2e9655000000b00253d5759a6dmr12647403ljh.207.1653319380816;
        Mon, 23 May 2022 08:23:00 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j16-20020a2e3c10000000b00253c33d30f0sm1889534lja.87.2022.05.23.08.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 08:23:00 -0700 (PDT)
Message-ID: <b60f5fd2-dc48-9375-da1c-ffcfe8292683@linaro.org>
Date: Mon, 23 May 2022 17:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 11/19] dt-bindings: reset: npcm: Add support for
 NPCM8XX
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Bj=c3=b6rn_Andersson?=
 <bjorn.andersson@linaro.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Vinod Koul <vkoul@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Robert Hancock <robert.hancock@calian.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Lubomir Rintel <lkundrak@v3.sk>, arm-soc <soc@kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20220522155046.260146-1-tmaimon77@gmail.com>
 <20220522155046.260146-12-tmaimon77@gmail.com>
 <86cd6a37-70ad-3a90-bc8a-dcd8b41f1175@linaro.org>
 <CAP6Zq1i2Wj4FCA4-eseVoJyMof5=ocFCUcitVquJqYJ4Z3JTYQ@mail.gmail.com>
 <CAMuHMdVCCrKTpNHng2_kKGViuEXf=O3MsfpjjzMusuUcKE6HiA@mail.gmail.com>
 <62562cdf-93e3-f642-5bbd-48329eff33ea@linaro.org>
 <CAMuHMdVFV02t+vbwzEpNbpkSP4M3sGnJpzFMPBw7RkrJ9YvyKw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdVFV02t+vbwzEpNbpkSP4M3sGnJpzFMPBw7RkrJ9YvyKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/05/2022 17:11, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Mon, May 23, 2022 at 4:26 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 23/05/2022 16:22, Geert Uytterhoeven wrote:
>>> On Mon, May 23, 2022 at 4:03 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>>>> On Mon, 23 May 2022 at 12:01, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>>> On 22/05/2022 17:50, Tomer Maimon wrote:
>>>>>> Add binding document and device tree binding
>>>>>> constants for Nuvoton BMC NPCM8XX reset controller.
>>>>>>
>>>>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>>>
>>>>>> --- /dev/null
>>>>>> +++ b/include/dt-bindings/reset/nuvoton,npcm8xx-reset.h
>>>>>> @@ -0,0 +1,124 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>> +// Copyright (c) 2022 Nuvoton Technology corporation.
>>>>>> +
>>>>>> +#ifndef _DT_BINDINGS_NPCM8XX_RESET_H
>>>>>> +#define _DT_BINDINGS_NPCM8XX_RESET_H
>>>>>> +
>>>>>> +#define NPCM8XX_RESET_IPSRST1                0x20
>>>>>> +#define NPCM8XX_RESET_IPSRST2                0x24
>>>>>> +#define NPCM8XX_RESET_IPSRST3                0x34
>>>>>> +#define NPCM8XX_RESET_IPSRST4                0x74
>>>>>
>>>>> What are these? All IDs should be incremental, decimal and start from 0.
>>>>
>>>> Register offset, we use the same method in NPCM7xx. please refer
>>>> https://elixir.bootlin.com/linux/v5.18/source/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
>>>>
>>>> and the driver asserts the reset according to the reset include definitions
>>>
>>> So if they're easy to look up the values, you could do without the
>>> definitions? Cfr. the interrupts properties in .dtsi files, where we
>>> typically just use the hardcoded numbers.
>>>
>>> If you do decide to keep them, a comment explaining their origins
>>> would be useful.
>>>
>>>>>> +
>>>>>> +/* Reset lines on IP1 reset module (NPCM8XX_RESET_IPSRST1) */
>>>>>> +#define NPCM8XX_RESET_GDMA0          3
>>>>>
>>>>> IDs start from 0 and do not have holes.
>>>>
>>>> This represents the reset BIT in the reset register.
>>>
>>> Likewise, I think it's a good idea to document that in a comment, cfr.
>>> https://elixir.bootlin.com/linux/v5.18/source/include/dt-bindings/power/r8a7795-sysc.h#L8
>>
>> Renesas is also doing it not correct (just like many others). The
>> bindings are not for register bits or offsets. Such data can be DTS but
>> not part of bindings.
> 
> I think you are taking a too-extremist standpoint.
> The two extremes are:
>   1. Numbers correspond to hardware numbers, and are easy to look up
>     in the hardware documentation (e.g. GIC SPI interrupt numbers).
>      => Use the hardcoded numbers in DTS.

And such numbers (like GIC_SPI interrupt numbers) do not go to bindings.
They go to DTS only.

>   2. Numbers do not correspond to hardware numbers, so we had to
>      invent our own definitions and numbers, usually loosely
>      based on some table in the hardware documentation.
>      The driver will have to look up the numbers in a data
>      structure, to know how to program the hardware.
>      The numbers become part of the DT ABI, and cannot be changed
>      (header file is append-only).
>      => Use the binding definitions in DTS.

Correct.

However this patch is some mixture of both approaches.

The same pointed by Arnd:
https://lore.kernel.org/linux-devicetree/CAK8P3a0fDJQvGLEtG0fxLkG08Fh9V7LEMPsx4AaS+2Ldo_xWxw@mail.gmail.com/

> We are taking the middle ground: there is a one-to-one relation between
> numbers and hardware numbers that can be looked up in or derived from
> the hardware documentation, but the conversion is non-trivial (for the
> casual human reviewer), or the documentation refers to names instead
> of numbers in most sections (e.g. named power domains). Then why not
> let the numbers match some feature in the hardware (e.g. register
> offset or register bit)?

Because you are embedding the device programming model into the
bindings. It's the same as having properties:
"vendor,value-for-register-xxx"

We do not create bindings to describe programming model but hardware.
Using the values from programming model is fragile and ties the bindings
to that one programming model. Programming model can change, e.g. by
mistake, but bindings should stay independent.

> 
>> Imagine now you made mistake in this register
>> offset and hardware uses slightly different value. What now? Change
>> bindings? No. Bindings hold here ID, the abstraction, and ID stays fixed.
> 
> I see no difference here with using the wrong interrupt number in an
> interrupts property in DTS.  What do we do in that case? Fix the DTS.

Yes, fix the DTS. DTS are not the bindings. You can fix the DTS. You
cannot fix the bindings because you affect both driver and DTS.

> 
> BTW, are you aware of any driver that transforms interrupt numbers
> obtained from DTS, because the DTS used the wrong number?

Again, what do the DTS has here at all? The interrupt numbers are also
not included in the bindings, so what does it prove?

Best regards,
Krzysztof
