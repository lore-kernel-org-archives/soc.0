Return-Path: <SRS0=u6u1=P3=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26559C433EF
	for <soc@archiver.kernel.org>; Mon,  8 Nov 2021 15:39:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F09B06137F; Mon,  8 Nov 2021 15:39:03 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46EA46124D;
	Mon,  8 Nov 2021 15:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46EA46124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mr9OA-1mPwfr2NIE-00oJuN; Mon, 08 Nov 2021 16:39:01 +0100
Received: by mail-wm1-f48.google.com with SMTP id z200so13377526wmc.1;
        Mon, 08 Nov 2021 07:39:01 -0800 (PST)
X-Gm-Message-State: AOAM533MvfCAhisntP7cVir1/eimxHHSbjD8eaDbrc6fXxxT9aX0Lblm
	Fey9v7u8H5HPaYjdBKQYocxfAwM+qWF5M7TlFuI=
X-Google-Smtp-Source: ABdhPJyXq+VZc2jONwlmXrBFyz9a+T8myfi+JgkFw7D4CYWMuoZyMYG0cC+vmoNAAFrxSa3fRL4VzPL0bnwjGPck568=
X-Received: by 2002:a1c:2382:: with SMTP id j124mr181071wmj.35.1636385941168;
 Mon, 08 Nov 2021 07:39:01 -0800 (PST)
MIME-Version: 1.0
References: <79ae46c3-c028-2c99-2428-b601e4fb03d4@microchip.com>
 <mhng-a25d4570-1744-44ef-988b-43914d5bc17d@palmerdabbelt-glaptop>
 <CAK8P3a31Gj-0DgN+ooMZds8_iOJWwGRp4FZLD0kgo9Go=Pzyhw@mail.gmail.com> <46f04c45-cd50-9484-de41-be8c390bf8e3@microchip.com>
In-Reply-To: <46f04c45-cd50-9484-de41-be8c390bf8e3@microchip.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Nov 2021 16:38:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1m_LhOg5JGMqPz6sohJa2hPZ3GN-jQDPxigZ5DaqAGxQ@mail.gmail.com>
Message-ID: <CAK8P3a1m_LhOg5JGMqPz6sohJa2hPZ3GN-jQDPxigZ5DaqAGxQ@mail.gmail.com>
Subject: Re: [PATCH] soc: add polarfire soc system controller
To: Conor.Dooley@microchip.com
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Cyril.Jean@microchip.com, 
	Daire McNamara <Daire.McNamara@microchip.com>, Atish Patra <Atish.Patra@wdc.com>, 
	Nicolas Ferre <Nicolas.Ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ludovic Desroches <Ludovic.Desroches@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:OnDE9B6KeqYf6r0o1J+yIzPUc7cF40jw90PQuwEf35tybZr6y+0
 pyweOrKJ4RNj3FBxm8ROlwU4SzHrrAh7d552FRuV210BcfgJVaf/m/qbZvt3HvziPQraVjT
 wBAnFbpHsmF3hulkwN0ulUBiC70DTJsm7w/q4I7gTDlfpsMzeNOgL8aPLobmHY052G0b3OR
 bI8T14vocR1Gv2bG/Ph0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CWXnjAibk80=:KPKpgyVWrQufXIDO+A6arc
 uKZr3vQ1aF4t6RiNchr2yn6olDQlgRaNuIkUbWla/o10Wrs+RRjigzgWVquk8YKIHUGMALv3s
 9cfggOOaO1pI9tPVcWXVWjWn2pJhlBE2WitfwjfICvwQEEMFZhXhzt4z6D4g2h8TjMrA44Lxk
 MaK2+UL5l3tMlvDSks4+xRBqSHtCdlSB9RgI7HHNEHBGDfGa2SFx0BOBg+553lbrpvfohkoc8
 FEfJC7cd9q0T+xV0401N4/9IPJMv52usFMvuGMdx48W9AdpbPWrQwFjmq/Qu6+Ll8DIWnCSRi
 WGZL5G8OAJo2OmfbYQ0vGS0gVcOe3TXE6yFl9LK8v8+TlnaxN9IS3NUU3clk7b2S9CjkXIl7/
 bgwjdzG8wcqb+Mmz/Lc25X6bNJwbHD7ZsQISVT/LmHTcFUGN/ngvVTlODID4itw7BYhbBCCtg
 1d3uMgGRM4pX7c+e+XCWs77hEtM6oMG7kovD0zQNnPhHmmzqKRDyWd+uhDbzOypwE2Q7Szt7X
 ZxyreM7rb1/RrbunQJ9car/Ex9SI1wcbxm9Bz5KwfyjeQOGD8+hC2eRNG9A7pQ12rqvAno0dc
 9ixVR+7hkxJbsuNQvmTJI1yOORge0YIn36jTFEPt4u1I738ujBJKgcUVO1SJ1jnMJdZ5Bcy2y
 s1Zb5bnQFoVoB77RC0GfIh/HeWRIDIUSYiAFvdPMSVqjCsD6luT4nWFyLCkoc917pouc=

On Mon, Nov 8, 2021 at 4:19 PM <Conor.Dooley@microchip.com> wrote:
>
> On 21/10/2021 19:34, Arnd Bergmann wrote:
> >>>> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg)
> >>>> +{
> >>>> +    int ret;
> >>>> +
> >>>> +    mutex_lock_interruptible(&transaction_lock);
> >
> > When you do a mutex_lock_interruptible(), you have to check its return code and
> > handle the interruption, usually by passing down -EINTR to the caller.
> >
> >>>> +struct mpfs_sys_controller *
> >>>> +mpfs_sys_controller_get(struct device_node *mss_node)
> >>>> +{
> >>>> +    struct platform_device *pdev = of_find_device_by_node(mss_node);
> >>>> +
> >>>> +    if (!pdev)
> >>>> +            return NULL;
> >>>> +
> >>>> +    return platform_get_drvdata(pdev);
> >>>> +}
> >>>> +EXPORT_SYMBOL(mpfs_sys_controller_get);
> >
> > There should probably be a check in here to ensure that this is actually
> > a system controller and it's bound do this driver, rather than returning a
> > random device's driver data >
> > It might also help to make this take a phandle instead of a device node
> > for lookup, to spare the client the extra phandle to node conversion.
>
> Finally got around to this again, is it sufficient to just check that
> platform_get_drvdata returns non null, or should I also check if the
> pdev matches the drivers compatible strings? Only found one example of
> the latter and a mix of the former & what I had done when I went looking
> around at other drivers.

Neither of those helps at all, it could still be a random other device.

I would check that the device is bound to mpfs_sys_controller_driver here,
that should be the easiest way. Looking at it some more, I suspect the
reference counting needs to be improved as well, to ensure that the
device is not going away here. You only hold a reference on the
of_node (which you apparently never release either), but not on the device.

    Arnd
