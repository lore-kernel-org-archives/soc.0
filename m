Return-Path: <SRS0=km/W=XR=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB33C43334
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 07:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AC79C341CA; Tue, 12 Jul 2022 07:59:45 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF1F6C3411E
	for <soc@kernel.org>; Tue, 12 Jul 2022 07:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF1F6C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f169.google.com ([209.85.128.169]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N5FtF-1nRyX22TET-011A5K for <soc@kernel.org>; Tue, 12 Jul 2022 09:59:41
 +0200
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-31cac89d8d6so73013217b3.2
        for <soc@kernel.org>; Tue, 12 Jul 2022 00:59:41 -0700 (PDT)
X-Gm-Message-State: AJIora/tg84Pxd54mPvqACCUGeu9Q13SCpLA0vAHd/qeCoqaDh4w2eab
	8G6ySFt14YUJ7inxfVvmZQWfiLJzQ6tXnSOqe3g=
X-Google-Smtp-Source: AGRyM1sGYM3Nl80qovyMheVeLpJ34l4k4DHAnfE1K3z5cuEZJYJ83daeZgGOFeIWlogx1MG324q9vUOc1yMfjpOFmuc=
X-Received: by 2002:a0d:df0f:0:b0:31b:e000:7942 with SMTP id
 i15-20020a0ddf0f000000b0031be0007942mr23265088ywe.320.1657612780357; Tue, 12
 Jul 2022 00:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220702075454.12575-1-lfdebrux@gmail.com> <CAK8P3a3o0_GxcZzq+hmveqzE=-_E9gs1LtMWbWsLMyMfXGMEWQ@mail.gmail.com>
 <CLD7XOPCI9PE.YLIXTV8SDQ3M@voidz-builder>
In-Reply-To: <CLD7XOPCI9PE.YLIXTV8SDQ3M@voidz-builder>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 12 Jul 2022 09:59:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1PZjv97haZoXhSNYJmw0O_O3DGFY1EJE7BobXp1T9prg@mail.gmail.com>
Message-ID: <CAK8P3a1PZjv97haZoXhSNYJmw0O_O3DGFY1EJE7BobXp1T9prg@mail.gmail.com>
Subject: Re: [PATCH] ARM: pxa: Fix gpio numbers for backlight controls
To: Laurence de Bruxelles <lfdebrux@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xCqByImltH2oXFpWev12hUglEyB+GsIGUJJuOboS+7NZnwkZtfZ
 QWHfIiRl3G3MuplCFyWPlp4REJgg2cb5Be4IhLahdpg8PsTu6bewV8Nm2Lb99BD4JCCN8I9
 foduE9S1TDMgaz4rX1k+bbPjKRwBWFUVJsd3CUZS/2NFlH0Rk17O4y2zU6dm4vubV92J3Yx
 Xp+4+uM30GD6vd+J+atTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OVqXyUp4Xwg=:3oTdI1FaicSpu/Ht5yHdZK
 oEiR6bXFtoU0C5UsiGnVkJ28e4kr3e2exPwWHr2+Q4C5i0dpKcrpFBJJytMRT5QBsXmlmXAxb
 KDH/ZipMWotlTJU1ZtD5Sq56YOmUkkDFBNitN6ufoITk8bP9mcqU3ntRF7L2cKAnWJtWz/4CE
 n/+xCG/UAKvTEU79AXmgJ8olr11Jdept1dl1IyLeXq0mbBMcLVBfvY501mHf+itCQnkvKF0RR
 uLfEdOTYEKjostoVmP2/ThQV9FqPprEIAeeMAsOG33DnfV0amRjMNUmoDj3Hb/2sqd3Hqa4jC
 SfkK4e2cmCKMZmIhHKNwq605jpis/pVGbU67AL9gEe/kFGlhuaWx6xy1hIDY3HSePeI7EcpUb
 tsW/GJStO1JjQMSAvGhzwyOUHCduEx6n2rQRwAGFzkqM0DlUrc5aFHXOi64KZ0BrwUv5Jyktv
 DRPEOkyqiNthUuk+G4QPNRWLmVC6xVxlZhrKyjLO2jhKyOKdQPpavIMoBlCDWnF5lUYae7pdX
 FdMTCoBtXYz/iH3xQg5zWf6k37PWrzuZAiB59wbnMXMsvCZhherU06hBhlyFOnrWNol1kaYH5
 etRymFDuHeJvTcmNEQvo7OUe84dmAz+3a7D09HtkKwW3Lhwkg5F0OrmCljEGy9TPcfXsWFY/x
 ZjC/EETUcmvZup7R3oJJ/PX20pNAYVKNHtPdEGlf3rWKLLybaKVvesheLR/J3B8BklzrBV8n7
 nn+HP8mXtXo0DBTdeSk1UJ51Zcu1yR+Z832XDcMZ7eKI7+gX1Xd4pd5GXJYoPLxFvIPZ0iDnF
 6AW/u3bSkdDU5etCT4ExIg0NyfxawpSkksgIaRbDug7EgecxvEXJ0jYbukNsZjwWVhJY+3edJ
 UjpC8lUVuljkRlt1TJ2g==

On Tue, Jul 12, 2022 at 1:34 AM Laurence de Bruxelles
<lfdebrux@gmail.com> wrote:
> On Mon Jul 4, 2022 at 1:50 PM BST, Arnd Bergmann wrote:
> > > @@ -535,9 +535,9 @@ static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
> > >  static struct gpiod_lookup_table akita_lcdcon_gpio_table = {
> > >         .dev_id = "spi2.1",
> > >         .table = {
> > > -               GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_CONT,
> > > +               GPIO_LOOKUP("0-0018", AKITA_GPIO_BACKLIGHT_CONT,
> > >                             "BL_CONT", GPIO_ACTIVE_LOW),
> > > -               GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_ON,
> > > +               GPIO_LOOKUP("0-0018", AKITA_GPIO_BACKLIGHT_ON,
> > >                             "BL_ON", GPIO_ACTIVE_HIGH),
> > >                 { },
> > >         },
> >
> > I assume this is correct as well, but I can't see where you got the "0-0018"
> > name from, or if we need to change others the same way.
>
> Good question. I spent a while trying to figure this out at the time, in
> the end I just plugged in the i2c address I found from looking in sysfs,
> and it worked. It does seem a bit opaque, but as far as I can tell from
> reading the GPIO API manual and the i2c GPIO driver that's what it is
> supposed to be:
>
> key is ... the label of the gpiod_chip instance providing the GPIO
>
> (from https://www.kernel.org/doc/html/latest/driver-api/gpio/board.html).

It clearly has to be the label that is associated with the i2c-gpio driver,
I'm just surprised that this label is just the i2c address and nor something
more descriptive. I see that pca953x_setup_gpio() sets the label as

     gc->label = dev_name(&chip->client->dev);

which may or may not be the right thing to do here. Maybe Linus has
a suggestion if this is expected or the name can be set to something else
instead.

> > arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
> > SPITZ_GPIO_MUTE_L - SPITZ_SCP_GPIO_BASE,
> > arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
> > SPITZ_GPIO_MUTE_R - SPITZ_SCP_GPIO_BASE,
> > arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.1",
> > SPITZ_GPIO_MIC_BIAS - SPITZ_SCP2_GPIO_BASE,
> > arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
> > SPITZ_GPIO_MUTE_L - SPITZ_SCP_GPIO_BASE,
> > arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
> > SPITZ_GPIO_MUTE_R - SPITZ_SCP_GPIO_BASE,
> >
> > I think we'd probably want to handle the SCP and SCP2 GPIOs the same
> > way, either adding/subtracting the GPIO_BASE everywhere, or dropping that.
> >
>
> Good catch, I'm not sure how I missed your patch. I think having the
> GPIO_BASE included in the index is part of the legacy API, or that is
> what the API docs suggest, so we shouldn't need to add it or subtract it
> anywhere.
>
> I'd like to make that change, butg I'm not sure whether to submit that
> as another patch in a new V3 series, or as a separate patch, or just
> roll it into one patch... I'll probably make a V3 patch series unless
> you suggest otherwise.

I think it's fine either way. As a rule, I try to decide based on the changelog
text: if I end up describing two different things in a commit log, then
it's time to split it up, but if I find a coherent way to describe the change
then it can stay as a single patch. If you end up splitting it, I would
recommend to keep changes across multiple boards together when they
do the same thing, but split it into logical changes that build on top
of one another.

> But to be honest I'm not fully able to test any changes to the audio
> support for this hardware. I spent a little while trying to get audio
> working on my device with a version of kernel 5.15, which doesn't have
> your audio patch, but it was broken. I reverted a change to the pxa
> audio driver to fix a DMA preallocation issue, but it was still broken.
> So I don't have a working audio setup just yet.

Ok, I see. Don't spend too much time on that yet then. It should be
possible to figure out what broke it using git-bisect, but you can do
that once you work on the DT conversion.

      Arnd
