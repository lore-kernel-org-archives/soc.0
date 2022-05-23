Return-Path: <SRS0=V8kV=V7=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C0BC433F5
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 14:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4CA70C36AE3; Mon, 23 May 2022 14:28:31 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D6D4C385AA;
	Mon, 23 May 2022 14:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D6D4C385AA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id q20so2889219qtw.1;
        Mon, 23 May 2022 07:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N6EnHNW72poBEAFOl9gSp7lOZY9kd68M75fXJVPe+FI=;
        b=NvF2a66NC3zNrECb3o6BsJ+p2fWzoXWPVWyn3kwBBBHBA0U5pdohUQXUD0a1JGA1us
         RJCUfBK9cTZuVW/JslCnAMDQ843cVQA7WNMEDWcLMQdP8WtbueXAxzf9SCrO8pySoM86
         w+uncJqzoNlU/pdpuxNS8vPI76mMUyvW09++cPmw90vzXfVwZ1U6fU1vjCgp9sy9VQsj
         vyF7xAyTs4It+ffkMuR3fmw/SUfyd8qLt8jPXPoMdC332/2v1nWKDfcGoatrHEdgGsZn
         CP6s0RGIqbBKbIAYs06yKNoBn6BGB2XidtVb7GsxSyUlxXq2qJB2Q/DSQRsxrIV1JKhH
         93OA==
X-Gm-Message-State: AOAM532xm+EZy3wfCTDTW/4Hu5Qy+sRm8i4L0ltiAUw7OHyzd0Kgk6j5
	O5dhYVZ8bD6jNes777tfaHCWQHVWq8q4RA==
X-Google-Smtp-Source: ABdhPJxjdZJTQUs7diKWfgiblEkNQSQ9UmHPW6McMbe45nAI479AVvYN9HCu/gUFeTNK9vvn5z3FCg==
X-Received: by 2002:a05:622a:1302:b0:2f9:39e5:924 with SMTP id v2-20020a05622a130200b002f939e50924mr2087923qtk.347.1653316109306;
        Mon, 23 May 2022 07:28:29 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id w16-20020a05620a129000b0069fc13ce1e1sm4494052qki.18.2022.05.23.07.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 07:28:29 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id q135so25718898ybg.10;
        Mon, 23 May 2022 07:28:29 -0700 (PDT)
X-Received: by 2002:a25:e04d:0:b0:64d:6f23:b906 with SMTP id
 x74-20020a25e04d000000b0064d6f23b906mr21745041ybg.380.1653315743376; Mon, 23
 May 2022 07:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-12-tmaimon77@gmail.com>
 <86cd6a37-70ad-3a90-bc8a-dcd8b41f1175@linaro.org> <CAP6Zq1i2Wj4FCA4-eseVoJyMof5=ocFCUcitVquJqYJ4Z3JTYQ@mail.gmail.com>
In-Reply-To: <CAP6Zq1i2Wj4FCA4-eseVoJyMof5=ocFCUcitVquJqYJ4Z3JTYQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 May 2022 16:22:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCCrKTpNHng2_kKGViuEXf=O3MsfpjjzMusuUcKE6HiA@mail.gmail.com>
Message-ID: <CAMuHMdVCCrKTpNHng2_kKGViuEXf=O3MsfpjjzMusuUcKE6HiA@mail.gmail.com>
Subject: Re: [PATCH v1 11/19] dt-bindings: reset: npcm: Add support for NPCM8XX
To: Tomer Maimon <tmaimon77@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
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
	Geert Uytterhoeven <geert+renesas@glider.be>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
	Vinod Koul <vkoul@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Robert Hancock <robert.hancock@calian.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Lubomir Rintel <lkundrak@v3.sk>, arm-soc <soc@kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tomer,

On Mon, May 23, 2022 at 4:03 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> On Mon, 23 May 2022 at 12:01, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> On 22/05/2022 17:50, Tomer Maimon wrote:
>> > Add binding document and device tree binding
>> > constants for Nuvoton BMC NPCM8XX reset controller.
>> >
>> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

>> > --- /dev/null
>> > +++ b/include/dt-bindings/reset/nuvoton,npcm8xx-reset.h
>> > @@ -0,0 +1,124 @@
>> > +/* SPDX-License-Identifier: GPL-2.0 */
>> > +// Copyright (c) 2022 Nuvoton Technology corporation.
>> > +
>> > +#ifndef _DT_BINDINGS_NPCM8XX_RESET_H
>> > +#define _DT_BINDINGS_NPCM8XX_RESET_H
>> > +
>> > +#define NPCM8XX_RESET_IPSRST1                0x20
>> > +#define NPCM8XX_RESET_IPSRST2                0x24
>> > +#define NPCM8XX_RESET_IPSRST3                0x34
>> > +#define NPCM8XX_RESET_IPSRST4                0x74
>>
>> What are these? All IDs should be incremental, decimal and start from 0.
>
> Register offset, we use the same method in NPCM7xx. please refer
> https://elixir.bootlin.com/linux/v5.18/source/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
>
> and the driver asserts the reset according to the reset include definitions

So if they're easy to look up the values, you could do without the
definitions? Cfr. the interrupts properties in .dtsi files, where we
typically just use the hardcoded numbers.

If you do decide to keep them, a comment explaining their origins
would be useful.

>> > +
>> > +/* Reset lines on IP1 reset module (NPCM8XX_RESET_IPSRST1) */
>> > +#define NPCM8XX_RESET_GDMA0          3
>>
>> IDs start from 0 and do not have holes.
>
> This represents the reset BIT in the reset register.

Likewise, I think it's a good idea to document that in a comment, cfr.
https://elixir.bootlin.com/linux/v5.18/source/include/dt-bindings/power/r8a7795-sysc.h#L8

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
