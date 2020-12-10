Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601D1C4167B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 14:28:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 23D5623EB1; Thu, 10 Dec 2020 14:28:09 +0000 (UTC)
X-Gm-Message-State: AOAM530RyepmzTSXCMR9qYKxvltDAWusY2U6K+daiwAouvn1FdjwgGRI
	o1RGaSVwSTLXx5uxrUfyBSDTcHkN2UFBLhTwtzc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607610489;
	bh=lDk2Ia3HxK344sL8W2jrkCsA5fzuUPgyja44zN4sI7M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TtnfyMTFyPqDgPTpWHlWj5KJKEdSrrZrMh8I6A/SRBmuvFtmOnbBlIs3u1VTGL/Nv
	 v11zvnrAdfBcn6TbiFVlu+7RoioIV4uswtQJM1CeOWtg3nraWB5IL0ZCvX1y54oHOm
	 PphRejMxRvMQ25R+Nlid+oQLZ3fsvVPH4gRCfcMPMOI8EqplYBsUqMOfQACRjy21OH
	 qgUweVJ6wI22mr4BBBLpdJa7fu5GBQRCmlaE/M/3hCjvIDk7LUwkrojrwyfW+S3tF6
	 wNnRj2KVbX5NBPAqiZfvTArDjHTWA5SFK9rCzihrlHQiZ00z0OkvaWsel3TjwnSWdJ
	 rsDgOkeJTz5Aw==
X-Google-Smtp-Source: ABdhPJxtvwBwNOJNo7rPClOcGn9+fTP9XwRw88J7XmrkAe3M0WGXoGyhktsKN/KSXnL+IzFNlcIjP0tcnL73rMhVEEQ=
X-Received: by 2002:aca:418b:: with SMTP id o133mr5362790oia.67.1607610488096;
 Thu, 10 Dec 2020 06:28:08 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <20201129110803.2461700-4-daniel@0x0f.com>
 <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com> <CAFr9PX=fhKiZF80iKaGeBWOONm3VpwtzgbB+yBHk8MHdTotaHg@mail.gmail.com>
In-Reply-To: <CAFr9PX=fhKiZF80iKaGeBWOONm3VpwtzgbB+yBHk8MHdTotaHg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 10 Dec 2020 15:27:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0zCa0Dq8uUDoSbu64sGLeNWrSk=6i4pKzgwerRseXfnA@mail.gmail.com>
Message-ID: <CAK8P3a0zCa0Dq8uUDoSbu64sGLeNWrSk=6i4pKzgwerRseXfnA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 11:29 AM Daniel Palmer <daniel@0x0f.com> wrote:
> On Thu, 10 Dec 2020 at 06:58, Arnd Bergmann <arnd@kernel.org> wrote:
> > > +#define MSC313_GPIO_CHIPDATA(_chip) \
> > > static const struct msc313_gpio_data _chip##_data = { \
> > > +       .names = _chip##_names, \
> > > +       .offsets = _chip##_offsets, \
> > > +       .num = ARRAY_SIZE(_chip##_offsets), \
> > > +}
> >
> > > +#ifdef CONFIG_MACH_INFINITY
> > > +static const char * const msc313_names[] = {
> > > +       FUART_NAMES,
> > > +       SR_NAMES,
> >
> > I would try to avoid the #ifdefs and the macros here, don't overthink
> > it. The macro really hurts readability with the ## concatenation
> > making it impossible to grep for where things are defined, and
> > the #ifdef means you get worse compile test coverage compared
> > to an if(IS_ENABLED()) check in the place where the identifiers
> > are actually used.
>
> Ok. I was really just trying to enforce some sort of pattern there so
> that each chip that gets added follows the same convention.

> > Even better would be to completely avoid the lookup tables here,
> > and have one driver that is instantiated based on settings from
> > the DT.
>
> I did think about this and I did this with the clk mux driver I
> haven't pushed yet. In that case there is a random lump of registers
> with some muxes mixed into it so I decided to make the lump a syscon
> and then have a node for each clk mux in the lump and some properties
> for the muxes within. The driver is certainly less complex but the
> device tree is pretty unmanageable as there are probably 30 or more
> muxes.

Right, for clk drivers, the trade-off is often different, it's not
unusual that they are a bit of a mess and require a separate driver for
each cheap.

> > > +static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> > > +{
> > > +       struct msc313_gpio *gpio = gpiochip_get_data(chip);
> > > +       u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> > > +
> > > +       if (value)
> > > +               gpioreg |= MSC313_GPIO_OUT;
> > > +       else
> > > +               gpioreg &= ~MSC313_GPIO_OUT;
> > > +
> > > +       writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
> > > +}
> >
> > It would be helpful here to replace all the readb_relaxed/writeb_relaxed()
> > with normal readb()/writeb(). Don't use _relaxed() unless there is a strong
> > reason why you have to do it, and if you do, explain it in a comment what
> > the reason is.
>
> The reason is that readb()/writeb() will invoke the heavy memory
> barrier even though it's not needed for peripheral registers.
> I guess it doesn't actually make all that much difference in reality.

Ah, I forgot you had that heavy barrier. It depends a bit on what you
use the GPIOs for then. For most uses I think the overhead does not
matter, but if there is any bit-banged I/O it might make a difference.

> > > +static int msc313_gpio_direction_output(struct gpio_chip *chip, unsigned int offset, int value)
> > > +{
> > > +       struct msc313_gpio *gpio = gpiochip_get_data(chip);
> > > +       u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> > > +
> > > +       gpioreg &= ~MSC313_GPIO_OEN;
> > > +       if (value)
> > > +               gpioreg |= MSC313_GPIO_OUT;
> > > +       else
> > > +               gpioreg &= ~MSC313_GPIO_OUT;
> > > +       writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
> >
> > These look like they also need a spinlock to avoid races between concurrent
> > read-modify-write cycles on the same register.
>
> Noted. I'll fix this and the readb and send a patch at some point.

Ok

> > > +builtin_platform_driver(msc313_gpio_driver);
> >
> > There is a trend to make all drivers optionally loadable modules these days.
> > Is there a reason this has to be built-in?
>
> This was discussed and I think Linus said it was ok.

Ok.

       Arnd
