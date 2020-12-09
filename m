Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB99AC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 21:59:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9241A23C85
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 21:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9241A23C85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ayDgt2cacpfIg63uPMkMCI8GMn+kDU4HKpq5rOiZCV0=; b=hQOfU8oAnhQ6UP9RzxDXs7Qdg
	GLeIh0spN6pxBMxzWdiDQxXqDdtLwoROPsySvmZprqcF2i3ggkez8K20z21RUtDxUfLj1Zy3XPwQR
	DRxgzWRJHf6P2/2ZqaryrEcouynZqgqIwm4/WJwwDKHHgIrVQR7nMm2FkZ3lyCrSL64QPNS7sjzwh
	WpKVhS6yG+f4GH6UvSG+sw3vJq3YpZt8tEStkG1/27pPK1EdE/WqTlFPKj8yVjKUBmMBVj6w0+U+V
	ZYAD0pb44k9SzXgUsBFhmvjCkmFR4iYGPRs1M3J3336V6yPtgV0eIL5331atr2cSTwRpedVmdHVRM
	Uwv6I2PGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn7Ti-0008Tr-CT; Wed, 09 Dec 2020 21:58:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn7Tf-0008T9-SL
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 21:58:29 +0000
X-Gm-Message-State: AOAM533pkdb+sBTDUUoI9gqS396lsMA9gja+y1Mhe6BoCXzZkEjgGlum
 p2rg44zkv4Duv2msc7/xCjcrWLpWe6fDa9OmiEw=
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
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <20201129110803.2461700-4-daniel@0x0f.com>
In-Reply-To: <20201129110803.2461700-4-daniel@0x0f.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 22:58:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
Message-ID: <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Daniel Palmer <daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_165828_200958_704F510A 
X-CRM114-Status: GOOD (  23.38  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Willy Tarreau <w@1wt.eu>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209215809.2dcKSXFmbFXzydAVsL9TBcMYBFxRzRZN5WKxj9mEi0M@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
