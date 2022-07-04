Return-Path: <SRS0=IknR=XJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E334BC43334
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 12:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9A29C3411E; Mon,  4 Jul 2022 12:50:26 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C44C7C341C7
	for <soc@kernel.org>; Mon,  4 Jul 2022 12:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C44C7C341C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MvKL3-1nHcWD1uSX-00rJBU for <soc@kernel.org>; Mon, 04 Jul 2022 14:50:20
 +0200
Received: by mail-yb1-f172.google.com with SMTP id d145so13517870ybh.1
        for <soc@kernel.org>; Mon, 04 Jul 2022 05:50:20 -0700 (PDT)
X-Gm-Message-State: AJIora+WOvI+1A9SAsnTtdYdoTI4D6y3z8zxsG8gQc08uh9HCM3PR/pa
	BkKWnOkdIurAucrZpmmewkG+AfzcfqtjJjaIZCQ=
X-Google-Smtp-Source: AGRyM1uaeE4jM1koCm04WQVP4yG4rUJOTiLWSAMup7fW8wHbAKgR/65sR/v98CH9ry3bRJwq/jr4ZolkNyD8MH4iCoY=
X-Received: by 2002:a25:7c41:0:b0:66d:766a:4815 with SMTP id
 x62-20020a257c41000000b0066d766a4815mr28691199ybc.480.1656939019237; Mon, 04
 Jul 2022 05:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220702075454.12575-1-lfdebrux@gmail.com>
In-Reply-To: <20220702075454.12575-1-lfdebrux@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Jul 2022 14:50:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3o0_GxcZzq+hmveqzE=-_E9gs1LtMWbWsLMyMfXGMEWQ@mail.gmail.com>
Message-ID: <CAK8P3a3o0_GxcZzq+hmveqzE=-_E9gs1LtMWbWsLMyMfXGMEWQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: pxa: Fix gpio numbers for backlight controls
To: Laurence de Bruxelles <lfdebrux@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:BGaB19R0Paf3QvXAOj/8frgsC/7kRICegkv65oRmLBJkvmjWNcF
 O+g1Bj9nXR7iv7XmnuNuqrJQ+eYcVO4FxDDkvsUtKXwu3HyjuIh/NwEg7pLT3zmCC3E5Uxb
 MAriZcTxtYwpK6GPY6bwVncttNiQkth5D5X/namZZJLQ8WAvgVcy36UH73UgJyhILJt0BXo
 h28KoroVeUkz3ejtfe6fg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NbGwif+20UQ=:DUoJEf6E3Y9a6GbeqdtqcS
 1McQfBWlJe7fymNKtXxd2DX1ofWkYODoFQ2U+WtX6zT+GDSo0LnTnDlK2B3qEDHAQ0neXM60O
 Fkuc91cN4+WNHpG/O2VDquaCwvBE0EXsd3eIXu+mCVPI9yA7gt88xNr+8+y9UhcVw4hIV5kwT
 UEwGHrIsqqZoM3pjn7qLnmA/5RSL56uIzHLe3M1XO5WIZuvLOYrCUDJMIW/1STvtDsIolDEUe
 1f8Tk3VRVa22LXa9NInhMM4FZHFLXLBJav2REb5pkqX12dy5UHcKPiYHsv3KcIJ82kvgozhyJ
 jDzSGp+iB4LHtDaCl/aUMSB83XJbZJ/I/BhY+M0QyQCZi6U4ebPKcvQMfFsPz5umAQt9A/O/9
 r9FOnBLTr9DWGmOya1XRRFhRODtlzOg2gCXiwlamVdhpaU126KT4WNEAESehZy3nqYg5FcO4V
 fD7zipwSJvjGi2o8bysCudB5ghtE6r/dax80yNDTBcFPjPU3Vyzw35AGKjWXeIw7yfIlv85Ah
 0MKZHzfpoTLbz2++ULFi+E1qxyEHcT7na+5bCuBL5joE4vHflakRVki8BWVKnMJoGG7CKcD2l
 +NtXnRNj2Oh8v6CsZck8x1xFnwBYVzHtzK+VqGqDj27HbGjHJWyXvD3r9IVhdkHf8Qe7rsJXy
 DFiBqyDKG+fpSi6b1TIHeIOJymdy3ZvWWw3Y12q9UNjgS0NEDpgQYl+/5X4l6BNrrIO32j0zR
 6ha7ew9zf6Z4vRavhTj5GfA4plCDXIgGMeVPpH2y9ca8xHVW66BH5igGFL+rFj0Ll6gwf3IPq
 6woZcEmOhum8Qs6HFmPvkKXCn4CykCH19nVM6EV1+enhjIz7v8ikYFpEN/i2JiWiaI+64ll6s
 ni640w2c5jnTGYlc3oZw==

On Sat, Jul 2, 2022 at 9:54 AM Laurence de Bruxelles <lfdebrux@gmail.com> wrote:
>
> With recent stable kernels on my Zaurus Akita I am unable to change the
> backlight brightness, as the necessary files are not in the sys
> filesystem, and at startup I get the following errors:
>
> corgi-lcd spi2.1: requested GPIO 0 (207) is out of range [0..120] for
> chip gpio-pxa
> corgi-lcd: probe of spi2.1 failed with error -22
>
> Looking at recent changes to the Corgi backlight driver, I found that
> commit ee0c8e494cc3 ("backlight: corgi: Convert to use GPIO
> descriptors") replaced the use of the deprecated integer-based GPIO
> interface, but didn't convert the GPIO numbers in the platform header
> to match this. I think this is what causes the error, as the GPIOs for
> the backlight are part of an expander chip with a GPIO base number
> larger than the number of GPIOs for the gpio-pxa device.
>
> This patch fixes things by updating the GPIO numbers for the backlight,
> simply by dropping the GPIO base. It also updates the GPIO lookups to
> look in the table for the appropriate expander. For the Akita platform
> the expander with i2c address 0-0018 is used, for Spitz and Borzoi
> the second Sharp SCOOP expander is used.
>
> I've tested this patch with real Akita and Spitz handhelds, as well as
> with QEMU.

Thank you for the patch! Since I recently worked on those files,
I tried to have a closer look myself

> @@ -524,9 +524,9 @@ static void spitz_bl_kick_battery(void)
>  static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
>         .dev_id = "spi2.1",
>         .table = {
> -               GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_BACKLIGHT_CONT,
> +               GPIO_LOOKUP("sharp-scoop.1", SPITZ_GPIO_BACKLIGHT_CONT,
>                             "BL_CONT", GPIO_ACTIVE_LOW),
> -               GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_BACKLIGHT_ON,
> +               GPIO_LOOKUP("sharp-scoop.1", SPITZ_GPIO_BACKLIGHT_ON,
>                             "BL_ON", GPIO_ACTIVE_HIGH),
>                 { },
>         },

This part looks fine.

> @@ -535,9 +535,9 @@ static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
>  static struct gpiod_lookup_table akita_lcdcon_gpio_table = {
>         .dev_id = "spi2.1",
>         .table = {
> -               GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_CONT,
> +               GPIO_LOOKUP("0-0018", AKITA_GPIO_BACKLIGHT_CONT,
>                             "BL_CONT", GPIO_ACTIVE_LOW),
> -               GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_ON,
> +               GPIO_LOOKUP("0-0018", AKITA_GPIO_BACKLIGHT_ON,
>                             "BL_ON", GPIO_ACTIVE_HIGH),
>                 { },
>         },

I assume this is correct as well, but I can't see where you got the "0-0018"
name from, or if we need to change others the same way.

> diff --git a/arch/arm/mach-pxa/spitz.h b/arch/arm/mach-pxa/spitz.h
> index 04828d8918aa..4def79ee6df0 100644
> --- a/arch/arm/mach-pxa/spitz.h
> +++ b/arch/arm/mach-pxa/spitz.h
> @@ -137,26 +137,26 @@
>  #define SPITZ_SCP2_SUS_SET  (SPITZ_SCP2_IR_ON | SPITZ_SCP2_RESERVED_1)
>
>  #define SPITZ_SCP2_GPIO_BASE           (PXA_NR_BUILTIN_GPIO + 12)
> -#define SPITZ_GPIO_IR_ON               (SPITZ_SCP2_GPIO_BASE + 0)
> -#define SPITZ_GPIO_AKIN_PULLUP         (SPITZ_SCP2_GPIO_BASE + 1)
> -#define SPITZ_GPIO_RESERVED_1          (SPITZ_SCP2_GPIO_BASE + 2)
> -#define SPITZ_GPIO_RESERVED_2          (SPITZ_SCP2_GPIO_BASE + 3)
> -#define SPITZ_GPIO_RESERVED_3          (SPITZ_SCP2_GPIO_BASE + 4)
> -#define SPITZ_GPIO_RESERVED_4          (SPITZ_SCP2_GPIO_BASE + 5)
> -#define SPITZ_GPIO_BACKLIGHT_CONT      (SPITZ_SCP2_GPIO_BASE + 6)
> -#define SPITZ_GPIO_BACKLIGHT_ON                (SPITZ_SCP2_GPIO_BASE + 7)
> -#define SPITZ_GPIO_MIC_BIAS            (SPITZ_SCP2_GPIO_BASE + 8)
> +#define SPITZ_GPIO_IR_ON               0
> +#define SPITZ_GPIO_AKIN_PULLUP         1
> +#define SPITZ_GPIO_RESERVED_1          2
> +#define SPITZ_GPIO_RESERVED_2          3
> +#define SPITZ_GPIO_RESERVED_3          4
> +#define SPITZ_GPIO_RESERVED_4          5
> +#define SPITZ_GPIO_BACKLIGHT_CONT      6
> +#define SPITZ_GPIO_BACKLIGHT_ON                7
> +#define SPITZ_GPIO_MIC_BIAS            8

This probably breaks the audio support, at least the SPITZ_GPIO_MIC_BIAS
one:

arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
SPITZ_GPIO_MUTE_L - SPITZ_SCP_GPIO_BASE,
arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
SPITZ_GPIO_MUTE_R - SPITZ_SCP_GPIO_BASE,
arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.1",
SPITZ_GPIO_MIC_BIAS - SPITZ_SCP2_GPIO_BASE,
arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
SPITZ_GPIO_MUTE_L - SPITZ_SCP_GPIO_BASE,
arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("sharp-scoop.0",
SPITZ_GPIO_MUTE_R - SPITZ_SCP_GPIO_BASE,

I think we'd probably want to handle the SCP and SCP2 GPIOs the same
way, either adding/subtracting the GPIO_BASE everywhere, or dropping that.

>  /* Akita IO Expander GPIOs */
>  #define AKITA_IOEXP_GPIO_BASE          (PXA_NR_BUILTIN_GPIO + 12)
> -#define AKITA_GPIO_RESERVED_0          (AKITA_IOEXP_GPIO_BASE + 0)
> -#define AKITA_GPIO_RESERVED_1          (AKITA_IOEXP_GPIO_BASE + 1)
> -#define AKITA_GPIO_MIC_BIAS            (AKITA_IOEXP_GPIO_BASE + 2)
> -#define AKITA_GPIO_BACKLIGHT_ON                (AKITA_IOEXP_GPIO_BASE + 3)
> -#define AKITA_GPIO_BACKLIGHT_CONT      (AKITA_IOEXP_GPIO_BASE + 4)
> -#define AKITA_GPIO_AKIN_PULLUP         (AKITA_IOEXP_GPIO_BASE + 5)
> -#define AKITA_GPIO_IR_ON               (AKITA_IOEXP_GPIO_BASE + 6)
> -#define AKITA_GPIO_RESERVED_7          (AKITA_IOEXP_GPIO_BASE + 7)
> +#define AKITA_GPIO_RESERVED_0          0
> +#define AKITA_GPIO_RESERVED_1          1
> +#define AKITA_GPIO_MIC_BIAS            2
> +#define AKITA_GPIO_BACKLIGHT_ON                3
> +#define AKITA_GPIO_BACKLIGHT_CONT      4
> +#define AKITA_GPIO_AKIN_PULLUP         5
> +#define AKITA_GPIO_IR_ON               6
> +#define AKITA_GPIO_RESERVED_7          7

I see that this line

arch/arm/mach-pxa/spitz.c:              GPIO_LOOKUP("i2c-max7310",
AKITA_GPIO_MIC_BIAS - AKITA_IOEXP_GPIO_BASE,

is now wrong, and presumably the "i2c-max7310" string also needs to be changed
to "0-0018" now.

         Arnd
