Return-Path: <SRS0=V8kV=V7=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D030C433F5
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 15:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57E0FC36AE3; Mon, 23 May 2022 15:11:53 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 032E4C385A9;
	Mon, 23 May 2022 15:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 032E4C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id g16so17595498lja.3;
        Mon, 23 May 2022 08:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0QPzY5dv4g1MBNtDQB96ePR1IDzyzraTlb4TcmcBYLI=;
        b=mrEAXZyZFn+bdmYnZOLdtm+rUVHZtOyha6DLDi2l1IxVq/NiCD3owrOaQOIdKDMH/G
         /2BQrW/9gAKeL4l4h0EBihNkVjGqDzJxoyj80pWKednfz1ZHwWZcZ+qoSL1r/La1N0f0
         RXZdXysk7URgHmc8yxZbKbJPbvHK9vZdjwLOmj29BjHMe2k6FvIQq4SpsErWpLeJclS1
         Js0pfGoAYj0uztCkK6hYLu9zKrJwKfDRC7s0Rvu80MVbq50c7YEJy3DHd4cpGIag+pDa
         2yVqrDehvE+q7OgeHPW2v6cyBXUTBNuiThLuvyD/TuOVmy12ra4FSrVDd3ywEABqIQKg
         kG3A==
X-Gm-Message-State: AOAM531t9A8QukNL4BgGVrdyzek4axJGxginEaBsZ053Fw1SVWQHZJp+
	hdDczeJ2Pdby09LBUPY/UG7tP0ptcZbpf/2E
X-Google-Smtp-Source: ABdhPJwGSj1UbmLpy/IySfUJUQegKwn4nm+BY74w/xzR9CUGD+Iyj/VYET0ICi0t1MQjibVT41PnAw==
X-Received: by 2002:a2e:bd10:0:b0:253:d40c:15ba with SMTP id n16-20020a2ebd10000000b00253d40c15bamr12980580ljq.114.1653318708074;
        Mon, 23 May 2022 08:11:48 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id r12-20020a056512102c00b0047255d211d6sm2020868lfr.261.2022.05.23.08.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 08:11:45 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id l13so19459000lfp.11;
        Mon, 23 May 2022 08:11:44 -0700 (PDT)
X-Received: by 2002:a05:6512:1520:b0:443:ec43:5fe8 with SMTP id
 bq32-20020a056512152000b00443ec435fe8mr16745443lfb.589.1653318703688; Mon, 23
 May 2022 08:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-12-tmaimon77@gmail.com>
 <86cd6a37-70ad-3a90-bc8a-dcd8b41f1175@linaro.org> <CAP6Zq1i2Wj4FCA4-eseVoJyMof5=ocFCUcitVquJqYJ4Z3JTYQ@mail.gmail.com>
 <CAMuHMdVCCrKTpNHng2_kKGViuEXf=O3MsfpjjzMusuUcKE6HiA@mail.gmail.com> <62562cdf-93e3-f642-5bbd-48329eff33ea@linaro.org>
In-Reply-To: <62562cdf-93e3-f642-5bbd-48329eff33ea@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 May 2022 17:11:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFV02t+vbwzEpNbpkSP4M3sGnJpzFMPBw7RkrJ9YvyKw@mail.gmail.com>
Message-ID: <CAMuHMdVFV02t+vbwzEpNbpkSP4M3sGnJpzFMPBw7RkrJ9YvyKw@mail.gmail.com>
Subject: Re: [PATCH v1 11/19] dt-bindings: reset: npcm: Add support for NPCM8XX
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greg KH <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, Vinod Koul <vkoul@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Robert Hancock <robert.hancock@calian.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Lubomir Rintel <lkundrak@v3.sk>, arm-soc <soc@kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, May 23, 2022 at 4:26 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 23/05/2022 16:22, Geert Uytterhoeven wrote:
> > On Mon, May 23, 2022 at 4:03 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >> On Mon, 23 May 2022 at 12:01, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >>> On 22/05/2022 17:50, Tomer Maimon wrote:
> >>>> Add binding document and device tree binding
> >>>> constants for Nuvoton BMC NPCM8XX reset controller.
> >>>>
> >>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >
> >>>> --- /dev/null
> >>>> +++ b/include/dt-bindings/reset/nuvoton,npcm8xx-reset.h
> >>>> @@ -0,0 +1,124 @@
> >>>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>>> +// Copyright (c) 2022 Nuvoton Technology corporation.
> >>>> +
> >>>> +#ifndef _DT_BINDINGS_NPCM8XX_RESET_H
> >>>> +#define _DT_BINDINGS_NPCM8XX_RESET_H
> >>>> +
> >>>> +#define NPCM8XX_RESET_IPSRST1                0x20
> >>>> +#define NPCM8XX_RESET_IPSRST2                0x24
> >>>> +#define NPCM8XX_RESET_IPSRST3                0x34
> >>>> +#define NPCM8XX_RESET_IPSRST4                0x74
> >>>
> >>> What are these? All IDs should be incremental, decimal and start from 0.
> >>
> >> Register offset, we use the same method in NPCM7xx. please refer
> >> https://elixir.bootlin.com/linux/v5.18/source/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
> >>
> >> and the driver asserts the reset according to the reset include definitions
> >
> > So if they're easy to look up the values, you could do without the
> > definitions? Cfr. the interrupts properties in .dtsi files, where we
> > typically just use the hardcoded numbers.
> >
> > If you do decide to keep them, a comment explaining their origins
> > would be useful.
> >
> >>>> +
> >>>> +/* Reset lines on IP1 reset module (NPCM8XX_RESET_IPSRST1) */
> >>>> +#define NPCM8XX_RESET_GDMA0          3
> >>>
> >>> IDs start from 0 and do not have holes.
> >>
> >> This represents the reset BIT in the reset register.
> >
> > Likewise, I think it's a good idea to document that in a comment, cfr.
> > https://elixir.bootlin.com/linux/v5.18/source/include/dt-bindings/power/r8a7795-sysc.h#L8
>
> Renesas is also doing it not correct (just like many others). The
> bindings are not for register bits or offsets. Such data can be DTS but
> not part of bindings.

I think you are taking a too-extremist standpoint.
The two extremes are:
  1. Numbers correspond to hardware numbers, and are easy to look up
    in the hardware documentation (e.g. GIC SPI interrupt numbers).
     => Use the hardcoded numbers in DTS.
  2. Numbers do not correspond to hardware numbers, so we had to
     invent our own definitions and numbers, usually loosely
     based on some table in the hardware documentation.
     The driver will have to look up the numbers in a data
     structure, to know how to program the hardware.
     The numbers become part of the DT ABI, and cannot be changed
     (header file is append-only).
     => Use the binding definitions in DTS.

We are taking the middle ground: there is a one-to-one relation between
numbers and hardware numbers that can be looked up in or derived from
the hardware documentation, but the conversion is non-trivial (for the
casual human reviewer), or the documentation refers to names instead
of numbers in most sections (e.g. named power domains). Then why not
let the numbers match some feature in the hardware (e.g. register
offset or register bit)?

> Imagine now you made mistake in this register
> offset and hardware uses slightly different value. What now? Change
> bindings? No. Bindings hold here ID, the abstraction, and ID stays fixed.

I see no difference here with using the wrong interrupt number in an
interrupts property in DTS.  What do we do in that case? Fix the DTS.

BTW, are you aware of any driver that transforms interrupt numbers
obtained from DTS, because the DTS used the wrong number?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
