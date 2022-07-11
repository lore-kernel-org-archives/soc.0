Return-Path: <SRS0=vdOq=XQ=gmail.com=lfdebrux@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B15EC433EF
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 23:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1CDEC341C8; Mon, 11 Jul 2022 23:34:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 056C3C34115
	for <soc@kernel.org>; Mon, 11 Jul 2022 23:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 056C3C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id d16so8902360wrv.10
        for <soc@kernel.org>; Mon, 11 Jul 2022 16:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=/lWQgtjG0m1bF+syHl8dPd0vrG/J6o640/+lyoe0D1U=;
        b=ciIAIsZM5JpXMHJ9yUt3oKnnmsbOdyPNkm/cKLci6CZ4fuZKmYR7mKBGrI47YOk7Kd
         wb+JLlzNVmxlnUdf7vdGbU0XgtLfIamR+WNVWCWlzijZ/5GtkzPRrBj48aXoZFAPg6qo
         +b4kcYtZoQiH4t0Po7Wh5w50urEIOBxoCeBl1SzGktdKtCL1dWlo8hvkLOzfy94uPHeB
         Gq6t7O+27UYVZVzDYuGYk3P/VIb0J0TJSmT/HSY9i6B/vSm8S0n2i11taPvz+MCwmQZY
         67MaEyDPbyJ2IX2Ku+JRZjPoRBk0u5fyKMyiTxUn3ZaHL6ZgwZn3VWzcNdPIPfd+XH+g
         zNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=/lWQgtjG0m1bF+syHl8dPd0vrG/J6o640/+lyoe0D1U=;
        b=vP2ZiOZ+UnwYBoyM5qxDtVOGLgi313V7dF2X5wC7gPmvrp2tQhETTkCB+sX5+DncfN
         RPArRmZgdO3uRxmC0fAD22dico+pBMV9gCRQAtqDRyPU1fdCWyemdHYDZPvFC2+R26o1
         7KN6q6OqhsBNhoRWVN+ZdhEpgCqQIIWgyIHcVsv28KgribLZgKOVthfPDVAxnCL+5HTw
         LNLUKKQ2agPjoR04bWI827VdfE3nrLrUCuiJwXHj9D2LVl2K8pP3lmXo/Iw1v5B9PnFK
         dm/YIqXtek4iJhIxo2WIl2Rd8VOS9hjf7MBKliwEK6raFQ+bYEOBueLgTu2NI3xHhDrF
         62ow==
X-Gm-Message-State: AJIora8YTrK8RNwSS2XTMpyL5/z4XNzvnVFXgbnIB+laTenA/EDlSfFe
	2gTnlYGcS90gFvWomKRxKek=
X-Google-Smtp-Source: AGRyM1vVE8U7hSDaahgE3KAltdOvcfphaC2qVfjj/vKlwKZNz8jKoHlKTKuUZlKr9PUvyD488oFb/Q==
X-Received: by 2002:adf:f78d:0:b0:21d:6e79:88a2 with SMTP id q13-20020adff78d000000b0021d6e7988a2mr19427667wrp.493.1657582442162;
        Mon, 11 Jul 2022 16:34:02 -0700 (PDT)
Received: from localhost ([45.12.242.3])
        by smtp.gmail.com with ESMTPSA id p13-20020a5d458d000000b0021d728d687asm8459038wrq.36.2022.07.11.16.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 16:34:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Jul 2022 00:34:00 +0100
Message-Id: <CLD7XOPCI9PE.YLIXTV8SDQ3M@voidz-builder>
List-Id: <soc.lore.kernel.org>
Cc: "SoC Team" <soc@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: pxa: Fix gpio numbers for backlight controls
From: "Laurence de Bruxelles" <lfdebrux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
X-Mailer: aerc 0.10.0
References: <20220702075454.12575-1-lfdebrux@gmail.com>
 <CAK8P3a3o0_GxcZzq+hmveqzE=-_E9gs1LtMWbWsLMyMfXGMEWQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3o0_GxcZzq+hmveqzE=-_E9gs1LtMWbWsLMyMfXGMEWQ@mail.gmail.com>

On Mon Jul 4, 2022 at 1:50 PM BST, Arnd Bergmann wrote:
>
> Thank you for the patch! Since I recently worked on those files,
> I tried to have a closer look myself

Thanks for the comments! Sorry for the late reply, I got stuck in a
rabbit hole trying to understand some things.

>
> > @@ -535,9 +535,9 @@ static struct gpiod_lookup_table spitz_lcdcon_gpio_=
table =3D {
> >  static struct gpiod_lookup_table akita_lcdcon_gpio_table =3D {
> >         .dev_id =3D "spi2.1",
> >         .table =3D {
> > -               GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_CONT,
> > +               GPIO_LOOKUP("0-0018", AKITA_GPIO_BACKLIGHT_CONT,
> >                             "BL_CONT", GPIO_ACTIVE_LOW),
> > -               GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_ON,
> > +               GPIO_LOOKUP("0-0018", AKITA_GPIO_BACKLIGHT_ON,
> >                             "BL_ON", GPIO_ACTIVE_HIGH),
> >                 { },
> >         },
>
> I assume this is correct as well, but I can't see where you got the "0-00=
18"
> name from, or if we need to change others the same way.

Good question. I spent a while trying to figure this out at the time, in
the end I just plugged in the i2c address I found from looking in sysfs,
and it worked. It does seem a bit opaque, but as far as I can tell from
reading the GPIO API manual and the i2c GPIO driver that's what it is
supposed to be:

key is ... the label of the gpiod_chip instance providing the GPIO

(from https://www.kernel.org/doc/html/latest/driver-api/gpio/board.html).

>
> > diff --git a/arch/arm/mach-pxa/spitz.h b/arch/arm/mach-pxa/spitz.h
> > index 04828d8918aa..4def79ee6df0 100644
> > --- a/arch/arm/mach-pxa/spitz.h
> > +++ b/arch/arm/mach-pxa/spitz.h
> > @@ -137,26 +137,26 @@
> >  #define SPITZ_SCP2_SUS_SET  (SPITZ_SCP2_IR_ON | SPITZ_SCP2_RESERVED_1)
> >
> >  #define SPITZ_SCP2_GPIO_BASE           (PXA_NR_BUILTIN_GPIO + 12)
> > -#define SPITZ_GPIO_IR_ON               (SPITZ_SCP2_GPIO_BASE + 0)
> > -#define SPITZ_GPIO_AKIN_PULLUP         (SPITZ_SCP2_GPIO_BASE + 1)
> > -#define SPITZ_GPIO_RESERVED_1          (SPITZ_SCP2_GPIO_BASE + 2)
> > -#define SPITZ_GPIO_RESERVED_2          (SPITZ_SCP2_GPIO_BASE + 3)
> > -#define SPITZ_GPIO_RESERVED_3          (SPITZ_SCP2_GPIO_BASE + 4)
> > -#define SPITZ_GPIO_RESERVED_4          (SPITZ_SCP2_GPIO_BASE + 5)
> > -#define SPITZ_GPIO_BACKLIGHT_CONT      (SPITZ_SCP2_GPIO_BASE + 6)
> > -#define SPITZ_GPIO_BACKLIGHT_ON                (SPITZ_SCP2_GPIO_BASE +=
 7)
> > -#define SPITZ_GPIO_MIC_BIAS            (SPITZ_SCP2_GPIO_BASE + 8)
> > +#define SPITZ_GPIO_IR_ON               0
> > +#define SPITZ_GPIO_AKIN_PULLUP         1
> > +#define SPITZ_GPIO_RESERVED_1          2
> > +#define SPITZ_GPIO_RESERVED_2          3
> > +#define SPITZ_GPIO_RESERVED_3          4
> > +#define SPITZ_GPIO_RESERVED_4          5
> > +#define SPITZ_GPIO_BACKLIGHT_CONT      6
> > +#define SPITZ_GPIO_BACKLIGHT_ON                7
> > +#define SPITZ_GPIO_MIC_BIAS            8
>
> This probably breaks the audio support, at least the SPITZ_GPIO_MIC_BIAS
> one:
>
> arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
> SPITZ_GPIO_MUTE_L - SPITZ_SCP_GPIO_BASE,
> arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
> SPITZ_GPIO_MUTE_R - SPITZ_SCP_GPIO_BASE,
> arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.1",
> SPITZ_GPIO_MIC_BIAS - SPITZ_SCP2_GPIO_BASE,
> arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
> SPITZ_GPIO_MUTE_L - SPITZ_SCP_GPIO_BASE,
> arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
> SPITZ_GPIO_MUTE_R - SPITZ_SCP_GPIO_BASE,
>
> I think we'd probably want to handle the SCP and SCP2 GPIOs the same
> way, either adding/subtracting the GPIO_BASE everywhere, or dropping that=
.
>

Good catch, I'm not sure how I missed your patch. I think having the
GPIO_BASE included in the index is part of the legacy API, or that is
what the API docs suggest, so we shouldn't need to add it or subtract it
anywhere.

I'd like to make that change, butg I'm not sure whether to submit that
as another patch in a new V3 series, or as a separate patch, or just
roll it into one patch... I'll probably make a V3 patch series unless
you suggest otherwise.

> >  /* Akita IO Expander GPIOs */
> >  #define AKITA_IOEXP_GPIO_BASE          (PXA_NR_BUILTIN_GPIO + 12)
> > -#define AKITA_GPIO_RESERVED_0          (AKITA_IOEXP_GPIO_BASE + 0)
> > -#define AKITA_GPIO_RESERVED_1          (AKITA_IOEXP_GPIO_BASE + 1)
> > -#define AKITA_GPIO_MIC_BIAS            (AKITA_IOEXP_GPIO_BASE + 2)
> > -#define AKITA_GPIO_BACKLIGHT_ON                (AKITA_IOEXP_GPIO_BASE =
+ 3)
> > -#define AKITA_GPIO_BACKLIGHT_CONT      (AKITA_IOEXP_GPIO_BASE + 4)
> > -#define AKITA_GPIO_AKIN_PULLUP         (AKITA_IOEXP_GPIO_BASE + 5)
> > -#define AKITA_GPIO_IR_ON               (AKITA_IOEXP_GPIO_BASE + 6)
> > -#define AKITA_GPIO_RESERVED_7          (AKITA_IOEXP_GPIO_BASE + 7)
> > +#define AKITA_GPIO_RESERVED_0          0
> > +#define AKITA_GPIO_RESERVED_1          1
> > +#define AKITA_GPIO_MIC_BIAS            2
> > +#define AKITA_GPIO_BACKLIGHT_ON                3
> > +#define AKITA_GPIO_BACKLIGHT_CONT      4
> > +#define AKITA_GPIO_AKIN_PULLUP         5
> > +#define AKITA_GPIO_IR_ON               6
> > +#define AKITA_GPIO_RESERVED_7          7
>
> I see that this line
>
> arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("i2c-max7310",
> AKITA_GPIO_MIC_BIAS - AKITA_IOEXP_GPIO_BASE,
>
> is now wrong, and presumably the "i2c-max7310" string also needs to be ch=
anged
> to "0-0018" now.
>

Yes, I think so, when I run the kernel with this change with akita on
QEMU I get the error

spitz-audio spitz-audio: cannot find GPIO chip i2c-max7310, deferring

It's a shame, because it is more readable I think. I will change that in
the followup patch I mentioned.=20

But to be honest I'm not fully able to test any changes to the audio
support for this hardware. I spent a little while trying to get audio
working on my device with a version of kernel 5.15, which doesn't have
your audio patch, but it was broken. I reverted a change to the pxa
audio driver to fix a DMA preallocation issue, but it was still broken.
So I don't have a working audio setup just yet.

