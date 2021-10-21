Return-Path: <SRS0=i2pQ=PJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D708AC433EF
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 18:35:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A42D361038; Thu, 21 Oct 2021 18:35:13 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2C9A60E54;
	Thu, 21 Oct 2021 18:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2C9A60E54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MFbmS-1mUEiH0Dvy-00H3f4; Thu, 21 Oct 2021 20:35:11 +0200
Received: by mail-wm1-f52.google.com with SMTP id s198-20020a1ca9cf000000b0030d6986ea9fso506764wme.1;
        Thu, 21 Oct 2021 11:35:10 -0700 (PDT)
X-Gm-Message-State: AOAM5309XQhhmsjGPYrNPw7Z9kBBV7gBS3KoVu4aqmXmrQrmns9inqSQ
	PG0KFvVSsCXlurLZ9R08hoZYqOQPUvSaqNgUsWM=
X-Google-Smtp-Source: ABdhPJxJnttZVYDDq1wT7sqVg/34xA2ViJzSZlZ8uydGsF2cMPPIn30u8q+0i/QxoA4crgnhZkdmcwVqK+m7oJgBKVg=
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr8597496wmg.35.1634841310501;
 Thu, 21 Oct 2021 11:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <79ae46c3-c028-2c99-2428-b601e4fb03d4@microchip.com> <mhng-a25d4570-1744-44ef-988b-43914d5bc17d@palmerdabbelt-glaptop>
In-Reply-To: <mhng-a25d4570-1744-44ef-988b-43914d5bc17d@palmerdabbelt-glaptop>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 20:34:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a31Gj-0DgN+ooMZds8_iOJWwGRp4FZLD0kgo9Go=Pzyhw@mail.gmail.com>
Message-ID: <CAK8P3a31Gj-0DgN+ooMZds8_iOJWwGRp4FZLD0kgo9Go=Pzyhw@mail.gmail.com>
Subject: Re: [PATCH] soc: add polarfire soc system controller
To: Palmer Dabbelt <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
Cc: Conor.Dooley@microchip.com, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Damien Le Moal <Damien.LeMoal@wdc.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Cyril.Jean@microchip.com, 
	Daire McNamara <Daire.McNamara@microchip.com>, Atish Patra <Atish.Patra@wdc.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:tmCwJs/7MYE3BYomjydcv2bx9GVLOKjaAX2lDbaWflQoIZAGpaP
 CuaVf4onOOHH9J6DWYxH74duYDU0lRursvyVkTonnXyE3P3Za2Riy3LFvSFhs8qAfwQf5JU
 UfjrsKmghiHJULUAvYi6tRZfYuAtRVcKY2LwHQuf4G2zZplb0586Q/OJF8okMJgRm0JYJeX
 mQrz/+KOsdU5fRcwOHu9Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5WsrBBkUBF4=:bob6ndJd4iSLRwOdoM5Dq2
 R5qqjNWkJHE7REf8fLZAlIXY+QljG98vcZG/aexDoFVSW1ctBHfTTriumYMrUSnyETWYysKB2
 eoNX4ldQ6u7UNbz6b6/n0isPdxENUXyitqGTZ0f2UT4EMrN6LMU9KXz5VQU0HL7XAtSaHQr2s
 uKYc09xr3Da8rJtPfjHOQjZ18Y6EsPlAO74i6j6P1OXRX4O88YHSX8UZ14owivBWFaLWuNRMz
 x/2nqpzTxSieVBlHkUCKAsuklbn1Yf/VOtzis3i0KgIzcN8rBXNcK7UFV9cxmVKcFN7c3Nhl2
 8gizIJQTXn2wDC0cU7iSOplJoDEfoUbznohb5B21RkAEo576UBkYcW+bIZ+uEkCLAXDhaF4bo
 AQc2XQLqPY4zEqaMQbiUfi2JMZ4wCfMfgX5aQzgFHUhD1K+DHiFyl7avfA8R30uxrPa1GtPUY
 A5sMOof+6PYNUFuJfO5fO5yWTQaqaIJqZXFRn3Mnf9CPSwT9eB2ABHiqw6ctUCIuVHZeQVD67
 z+sLlI2fjqRCy8tJ5OuPiQrjjEbN3qP/ZHVx9Gj1Qk6ryaQUMWlyfiw8tOQ3opPL3Lom5wk5d
 E3jA68e9NcTk/kI92A6IA8vkWAWXZFY0yv/7wfhntBfekK5fDiqklsbFYD5oy5Xnxk27DEPJi
 PUMlQ5fYSbHYeACOUSl0bfrJcUU7ZzVk15gJvRYefydklfVoD1SHni1VDtGrVW2uyv73TMs8m
 hH5L0RG0r4FZXtPCvRihZlTT6o/weJUwS6PfVlvIZY8IqyTrK0ze+F2kPrndP6Buq8vVoyZW8
 DjH0sXGPWmPvcxDiwoc9S7XtlAxitS5QTH+dgkN2aBjjMaFLtI=

On Thu, Oct 21, 2021 at 6:00 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Thu, 21 Oct 2021 06:13:35 PDT (-0700), Conor.Dooley@microchip.com wrote:
> > On 05/10/2021 13:47, conor.dooley@microchip.com wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> This driver provides an interface for other drivers to access the
> >> functions of the system controller on the Microchip PolarFire SoC.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > Is there some extra CCs that I am missing on this patch that weren't
> > picked up by getmaintainers, and/or am I mistaken in thinking that
> > the soc tree is arm only?

We can handle non-Arm SoCs as well, though most architecture
maintainers prefer to keep them merged through their trees.

> +Arnd, Olof, and the SOC list.  They probably understand this better
> than I do, we're kind of new to having SOCs in RISC-V land.
>
> I guess I was assuming that someone maintained drivers/soc, but from
> poking around it seems like there's no entry for it and instead it's
> just a bunch of entries for the sub-directories.  As a result the
> scripts aren't picking up anyone to send these too, and I'd assuming
> that because they're not in arch/riscv that they're not for the RISC-V
> tree.
>
> That said, it looks like I put the Kendryte stuff in there (so sorry if
> I screwed anything up).  I'm happy to take these via the RISC-V tree as
> well, I'm assuming that means there should be a MAINTAINERS entry for
> this new sub-directory so changes to it are less likely to get lost.
> Sorry if I was confusing before, I guess I forgot about how this fits
> together.
>
> Arnd: aside from the lack of a maintainer, these generally look fine to
> me.  LMK if you were expecting this kind of stuff to go through the
> RISC-V tree.

It probably helps avoid merge conflicts to go through the soc tree,
as there are generally more changes for arm specific socs in there.

However, we usually take pull requests from platform maintainers,
not individual patches. For Microchip's ARM based platforms, those
patches would go through the AT91/SAMA5 maintainers (added to
Cc). You can ask them if they are willing to take future patches for
the polarfire soc as well and forward them to soc@kernel.org along
with the other stuff.

> >> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg)
> >> +{
> >> +    int ret;
> >> +
> >> +    mutex_lock_interruptible(&transaction_lock);

When you do a mutex_lock_interruptible(), you have to check its return code and
handle the interruption, usually by passing down -EINTR to the caller.

> >> +struct mpfs_sys_controller *
> >> +mpfs_sys_controller_get(struct device_node *mss_node)
> >> +{
> >> +    struct platform_device *pdev = of_find_device_by_node(mss_node);
> >> +
> >> +    if (!pdev)
> >> +            return NULL;
> >> +
> >> +    return platform_get_drvdata(pdev);
> >> +}
> >> +EXPORT_SYMBOL(mpfs_sys_controller_get);

There should probably be a check in here to ensure that this is actually
a system controller and it's bound do this driver, rather than returning a
random device's driver data.

It might also help to make this take a phandle instead of a device node
for lookup, to spare the client the extra phandle to node conversion.

       Arnd
