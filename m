Return-Path: <SRS0=WEIr=X6=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F2EC43334
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 14:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BAF3C341C6; Mon, 25 Jul 2022 14:22:46 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5BA9C341C8;
	Mon, 25 Jul 2022 14:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5BA9C341C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ed1-f47.google.com ([209.85.208.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N45th-1nY9mj2k0v-0106kp; Mon, 25 Jul 2022 16:22:40 +0200
Received: by mail-ed1-f47.google.com with SMTP id w5so1727012edd.13;
        Mon, 25 Jul 2022 07:22:40 -0700 (PDT)
X-Gm-Message-State: AJIora808p3FXqFIdj1c7qvJSteEhkitc6o6pmgH1dovuoIGkjt05ftN
	BquYwj67taMWIe9A8cPqOmGzOgGGsEr90m7L42E=
X-Google-Smtp-Source: AGRyM1s2D8V5GQidovTCjEsN5J6TDfyCGeQYf90VamdInH5SBM48LWGGlcNHnEnjLsAHBe5C/yK484ns9dg/F49ME3k=
X-Received: by 2002:a50:ee13:0:b0:43b:aadb:a8cd with SMTP id
 g19-20020a50ee13000000b0043baadba8cdmr13542983eds.206.1658758960318; Mon, 25
 Jul 2022 07:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
 <CAK8P3a0umWWic6LAzxXJ7BACYVE--m-wbynh7Z8F+pGoUBxGTA@mail.gmail.com>
 <25237c44-ebc4-fc9a-7c6f-3e990f968038@huawei.com> <CAK8P3a2+0EwSJ=fRBL2JCGypJRL-qE4rEiXYnJbqhZ=weethdQ@mail.gmail.com>
 <4d5c9bfc-dc10-7019-cad4-751e21f02a18@huawei.com>
In-Reply-To: <4d5c9bfc-dc10-7019-cad4-751e21f02a18@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Jul 2022 16:22:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3QNjOSodb-ND=nZ=ThC9xZhEyUOaUsWCDF70s9g80r-w@mail.gmail.com>
Message-ID: <CAK8P3a3QNjOSodb-ND=nZ=ThC9xZhEyUOaUsWCDF70s9g80r-w@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64 defconfig: Get faddr2line working
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, jpoimboe@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:w6ei3XO2Ba4JSpxf0l+ZvypUD6QxnolMOot6ZcCHwMPqqXweelu
 HcVelYWc3OdmEDA8ZI7xplEq4cnNY0RdDTqZ4JS8NwPvacCBEqbjajkYT4R7eKqsN9lUxc6
 6cAFvDamtJja1UOLK8oZbEeuEaycuIq5sCUtsPygqhPXL0JG91zR/z1pAvLsAUGFGdRgK9L
 q2f8WowpRgcuJ4sYQgyVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:udEA5sNeLJE=:Xzm76edJijkh7gASndWUeS
 LcHufnck1+nKDhO49G+3Xp4CRbHra8UnDGbDQKb7POXiXly0I0AC5jUs0oKmVY77RgGe9GUzh
 i60Ibd+Zt/VaASWDZOsomk7Hw6GkVDqGsXKLq3oHKdmesDM+jj3hnhqhuJy2PJN3UPIIc3WzV
 h99Hr2phb8+vWHKbV8A6xSHzBGUC7YwpFzY1CUkjdtYQIGfXtCKJqFH0ylq6aXrvp8aA6paXv
 +K5Hf9bT23E7NpTY6XWHoFql/3RXdrx03ghqP9iWxSST4/rtbD934xtbAIaXUxqg02dUj6z5Z
 VdghFreaYURgVK4sEw6Ovkm0/CujFaOKUTveILv4JWlxsp7gzbNZtEQrvcdYT8C/xqQLirsp1
 /+VNveDVrCbCkQ7fyNQYN5XDx+3zXBUkdqHbzVz+Lni/h3bytEw+FSDVnyV/rJfUaBE6R2aG0
 xevUWaPDTqTg5hHeRsELoSIDpVZdkmCtWDhYln3Nx1ZUK4DMVbF4Lo01S31x2SPUmYiI+TOpH
 q7iTpiF5+PBtPtzGPet9+ocQbBk43zVgFrwg7cLtmxmsiq5qEINtBIUmQyaT7Q5tuQ3IDH+RB
 2qrU9Fj7DmADuBuvsFMPLQrIPu9cLXm9Aleu8nKXCNrmZ4V8ZX/WI+bfPcqFKbKKVhqix7yHl
 5ebgKg3OqHOI7hT8L7L/Af0EXl6oDMCgjdFwuy+nIiVS5N7Z+93njsKkMQa365qNEfNa6bI23
 NBQjjB9IIULDs9ndmlxrtue09813pzY9Qrrdh1HoGT5iTxLNuW2DhPmxuq3sih7diMjgz7keH
 u9AyCgS0cTRdruejJpnaEaBRXpIB+xU0K4zfjujYBPu78LaiTZRiD9l8bDw09S49pGibddqJd
 qWuRe7flbV5kXxY09TjQ==

On Mon, Jul 25, 2022 at 4:03 PM John Garry <john.garry@huawei.com> wrote:
> >
> >>> CONFIG_MAILBOX=y
> >> In commit fc739069aa92, config MAILBOX was enabled in the defconfig but
> >> it was already being enabled from elsewhere. There was definitely no
> >> sync of the savedefconfig going on there:)
> > I see it's selected by a couple of drivers using mailboxes, and I
> > agree we shouldn't
> > need it here. It might be good to just hide the symbol in this case
> > and select it
> > consistently from all drivers using it.
>
> Uhh, we have ~15x "select" and ~18x "depends on"...

> >>> CONFIG_INTERCONNECT=y
> >> Since commit 06f079816d4c, config TEGRA_MC added a kconfig select on
> >> config INTERCONNECT, so no need to explicitly enable from the kconfig
> > We have one driver using 'depends on INTERCONNECT' and two drivers
> > using 'select INTERCONNECT', so at least one of them is wrong.
>
> INTERCONNECT has no dependencies, so "select" - like for MAILBOX -
> should be fine, I suppose

There are a couple of trade-offs between the two approaches.
The main advantage of 'select' is that you can enable drivers more
easily and all the required subsystems are there automatically.
The advantage of 'depends on' is that it becomes easier to disable
entire subsystems that one may not need.

Which of those two is more important is of course a matter of perspective,
I like to be able to turn things off more easily because that makes it
possible to test the corner cases with randconfig more easily, and it
helps produce size-reduced kernels for embedded systems.

Another aspect is that we overall have more 'depends on' than 'select',
and sticking with the more common way avoids circular dependencies,
both within an area of the kernel and overall.

The rule that I tend to follow with 'select' is to only use it on symbols
that you don't even want to show to users. If a feature is part of
a library (think zlib), then each user just needs to select the symbol
but you never actually have to decide whether to show it or not.

> >> And would each config item deletion merit a separate patch?
> > You send a combined patch for the obvious ones (secccomp
> > and mailbox AFAICT) or send them separately. For the other ones I think
> > we should try fixing the Kconfig files first, otherwise we just end up
> > putting them back afterwards.
>
> ok, fine. I'll deal with the obvious changes first plus
> CONFIG_DEBUG_INFO and then the non-obvious, non-trivial ones. I'll base
> on your arm/defconfig branch (for defconfig changes).

The CONFIG_DEBUG_INFO one should be fixed by my series from
last week already, do you still see another issue with that? I actually
have another patch to fix up all the non-Arm defconfigs for this one as
well, but haven't sent that one yet.

     Arnd
