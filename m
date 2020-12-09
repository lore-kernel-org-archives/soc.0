Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D8FC433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 21:58:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D42F723D23; Wed,  9 Dec 2020 21:58:26 +0000 (UTC)
X-Gm-Message-State: AOAM530fnAkgx6H8Ks1pUVaL6iilVto28j3kiRNc2VyGMHQiOThL3dtY
	54dkit7LgixEB92hKBANTaNP+pXrRB7VJicJWlc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607551106;
	bh=9a0XKTebx3oJ4nPSHvq/sXeDTzRdzMfEN4iZOqtSmNA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jAbN5uNkRMnBZoLoU4AXUUosxZYwmsH8WGTQOJjISODLqWmc2GSdczb4AeWh+ZTtI
	 RLfl14M4zYETUj3wLY5ODqT+m1ubst6CAOKSD2oN9vqBXYImOcbRekqPkfAfnpFaTZ
	 0NE7IiuihCYJMaeh9xdo4+KI4gEORGq2hSbfNRByLRbQ5O4yaeaqZ9W7WWcLHgiUwc
	 PpRB5TeIr23agtayCuD/y0obTGDZdb1abgzdNrQ9ao6juS559s/ehVN3Y3ivUvt/Hw
	 OQxaWiIh9ySpkaGF5jHqbp4n9tPbKrMKY0yVWHKkva6hH/n8HZd1u3ShRxfz9tf3fa
	 LmC/lh82eu1lA==
X-Google-Smtp-Source: ABdhPJxBLZ6Kcv7h3QvR0QmpLgVDfnZoYx+u3NBP7NuRVq5SvE6bRNgydH8x/KC+0UYzIKc8oldB3jdWgOsfDWkbkvo=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr3594492otm.305.1607551105908;
 Wed, 09 Dec 2020 13:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <20201129110803.2461700-4-daniel@0x0f.com>
In-Reply-To: <20201129110803.2461700-4-daniel@0x0f.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 22:58:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
Message-ID: <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 29, 2020 at 12:12 PM Daniel Palmer <daniel@0x0f.com> wrote:
>
> This adds a driver that supports the GPIO block found in
> MStar/SigmaStar ARMv7 SoCs.
>
> The controller seems to have enough register for 128 lines
> but where they are wired up differs between chips and
> no currently known chip uses anywhere near 128 lines so there
> needs to be some per-chip data to collect together what lines
> actually have physical pins attached and map the right names to them.

I took a closer  look at the driver now, to figure out why this even
needs a dt-bindings header in the first place. I noticed a few other
things as well:

> +#define OFF_SR_IO3     0x8c
> +#define OFF_SR_IO4     0x90
> +#define OFF_SR_IO5     0x94
> +#define OFF_SR_IO6     0x98
> +#define OFF_SR_IO7     0x9c
> +#define OFF_SR_IO8     0xa0
> +#define OFF_SR_IO9     0xa4
> +#define OFF_SR_IO10    0xa8
> +#define OFF_SR_IO11    0xac
> +#define OFF_SR_IO12    0xb0
> +#define OFF_SR_IO13    0xb4
> +#define OFF_SR_IO14    0xb8
> +#define OFF_SR_IO15    0xbc
> +#define OFF_SR_IO16    0xc0
> +#define OFF_SR_IO17    0xc4
> +
> +#define SR_OFFSETS     \
> +       OFF_SR_IO2,     \
> +       OFF_SR_IO3,     \
> +       OFF_SR_IO4,     \
> +       OFF_SR_IO5,     \
> +       OFF_SR_IO6,     \
> +       OFF_SR_IO7,     \
> +       OFF_SR_IO8,     \
> +       OFF_SR_IO9,     \
> +       OFF_SR_IO10,    \
> +       OFF_SR_IO11,    \
> +       OFF_SR_IO12,    \
> +       OFF_SR_IO13,    \
> +       OFF_SR_IO14,    \
> +       OFF_SR_IO15,    \
> +       OFF_SR_IO16,    \
> +       OFF_SR_IO17
> +
> +#define SD_NAMES               \
> +       MSC313_PINNAME_SD_CLK,  \
> +       MSC313_PINNAME_SD_CMD,  \
> +       MSC313_PINNAME_SD_D0,   \
> +       MSC313_PINNAME_SD_D1,   \
> +       MSC313_PINNAME_SD_D2,   \
> +       MSC313_PINNAME_SD_D3
> +
> +#define OFF_SD_CLK     0x140
> +#define OFF_SD_CMD     0x144
> +#define OFF_SD_D0      0x148
> +#define OFF_SD_D1      0x14c
> +#define OFF_SD_D2      0x150
> +#define OFF_SD_D3      0x154

These seem to just be contiguous ranges, so I probably would have
suggested describing them as separate gpio controllers to avoid
all the complexity with the names. As Linus already merged the
driver into the gpio tree, I won't complain too much about it.

Maybe you can do that for the other chips though and have one
implementation that works for all others, leaving only the msc313
as the one with the extra complexity.

> +#define MSC313_GPIO_CHIPDATA(_chip) \
> static const struct msc313_gpio_data _chip##_data = { \
> +       .names = _chip##_names, \
> +       .offsets = _chip##_offsets, \
> +       .num = ARRAY_SIZE(_chip##_offsets), \
> +}

> +#ifdef CONFIG_MACH_INFINITY
> +static const char * const msc313_names[] = {
> +       FUART_NAMES,
> +       SR_NAMES,

I would try to avoid the #ifdefs and the macros here, don't overthink
it. The macro really hurts readability with the ## concatenation
making it impossible to grep for where things are defined, and
the #ifdef means you get worse compile test coverage compared
to an if(IS_ENABLED()) check in the place where the identifiers
are actually used.

Even better would be to completely avoid the lookup tables here,
and have one driver that is instantiated based on settings from
the DT.

> +struct msc313_gpio {
> +       void __iomem *base;
> +       const struct msc313_gpio_data *gpio_data;
> +       u8 *saved;
> +};
> +
> +static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +{
> +       struct msc313_gpio *gpio = gpiochip_get_data(chip);
> +       u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> +
> +       if (value)
> +               gpioreg |= MSC313_GPIO_OUT;
> +       else
> +               gpioreg &= ~MSC313_GPIO_OUT;
> +
> +       writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
> +}

It would be helpful here to replace all the readb_relaxed/writeb_relaxed()
with normal readb()/writeb(). Don't use _relaxed() unless there is a strong
reason why you have to do it, and if you do, explain it in a comment what
the reason is.

> +static int msc313_gpio_direction_output(struct gpio_chip *chip, unsigned int offset, int value)
> +{
> +       struct msc313_gpio *gpio = gpiochip_get_data(chip);
> +       u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> +
> +       gpioreg &= ~MSC313_GPIO_OEN;
> +       if (value)
> +               gpioreg |= MSC313_GPIO_OUT;
> +       else
> +               gpioreg &= ~MSC313_GPIO_OUT;
> +       writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);

These look like they also need a spinlock to avoid races between concurrent
read-modify-write cycles on the same register.

> +builtin_platform_driver(msc313_gpio_driver);

There is a trend to make all drivers optionally loadable modules these days.
Is there a reason this has to be built-in?

       Arnd
