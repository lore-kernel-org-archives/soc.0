Return-Path: <SRS0=Y1pW=FO=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC754C4167B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 15:21:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8917F23B26; Thu, 10 Dec 2020 15:21:06 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF0712310E
	for <soc@kernel.org>; Thu, 10 Dec 2020 15:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF0712310E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qk1-f195.google.com with SMTP id y18so5046911qki.11
        for <soc@kernel.org>; Thu, 10 Dec 2020 07:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lzQQMikD25mHaOvU70fXFtFueunUhFhKwR7BFI8Wd2E=;
        b=qv6OHjvyatbf9wKTVaFQva3h+iUSafbS8ijuZeLyhKbykf4t6BnP+haSBQApyYmukP
         H+6pdEm9J76xjjxiqX2zzaNFJeKxUke42FfgngvNFw8n3PKxtI1fMdpC5/hg6m4SuP03
         DbtLskqJ+Y62beHrt6KZB0tysLwvUe+SQ+0TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lzQQMikD25mHaOvU70fXFtFueunUhFhKwR7BFI8Wd2E=;
        b=p/18QG9Fg5xaSEmrtZSD/Za+ja9pt4sEVakpgaDr8rbfcJALQZvMfgN3+lDKoVM/7Q
         T+T6ONwpI3csp3rs7Hr8xVkjONEgdkAO3xD10wnEgZJzyxOTVZw6i7SeJjW8wGBBAPmp
         OlBx4UmxmSZXW09A2BMrNUwi3uH5gl1QgD5sPa/DMH0xzMYttc2D+9yJQpfOyZcREBeL
         lzLBb9vTc7v12Q6rRmDv34+BBDwQrylOQCuJNEREKu3jFvB1CHEKQAxSoXVs12Q6m2g9
         Gb0W+o28tmMWqNaABLwQPdW/XmQCZy37YnQNkzBsF2q+PcfbJc9HOxw4xTY5a/RiLLPm
         bj5Q==
X-Gm-Message-State: AOAM530NS+VmNZH9m4op6+N4lEXhwjSTUq/kiuucfbOqmcH22+d7pDQL
	IGURwQMkBczGqC20NkDaZe+ECVks6m2edownZTKWpg==
X-Google-Smtp-Source: ABdhPJxPU/4SCy7/rE3UgsP7U/aCV3swWmca2vtLjkgy3KaDHEnkpgdsyXm48xf4KUJ4++imK7n8+UBiYOo9V42wb9w=
X-Received: by 2002:ae9:e219:: with SMTP id c25mr1251874qkc.443.1607613664449;
 Thu, 10 Dec 2020 07:21:04 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <20201129110803.2461700-4-daniel@0x0f.com>
 <CAHp75Vdy9rBgJhyYXjUKapYdeMfsNhbX9Zi3Jtxb4H8H279V-A@mail.gmail.com>
In-Reply-To: <CAHp75Vdy9rBgJhyYXjUKapYdeMfsNhbX9Zi3Jtxb4H8H279V-A@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 11 Dec 2020 00:21:44 +0900
Message-ID: <CAFr9PX=GTHQvwkCMU6ocK+5=QoEGXK6UAFH4ZUF4zq19ds06wQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Thu, 10 Dec 2020 at 23:22, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> Perhaps ordered?

Ok. I did try to find some rules on includes, mainly what should be
included even though it's included in another include, but couldn't
find anything really.
If you have a link that would be helpful. So I could track what
includes I actually needed I went for order they are used in the code.

> > +       if (offset >= OFF_SPI0_CZ && offset <= OFF_SPI0_DO) {
>
> Why not traditional pattern, i.e.
>
> if (...)
>   return -EINVAL;
> ...

You mean check if the offset is not in the interrupt capable range,
returning -EINVAL if so, and then having the interrupt mapping code?

> > +       ret = devm_gpiochip_add_data(dev, gpiochip, gpio);
> > +       return ret;
>
> Purpose?

Sorry I think that is probably an artefact of splitting the driver
apart to extract just the msc313 support.
The current version of this driver supports more chips but those
aren't completely reverse engineered yet so I've been constantly
switching back and forth.

> return devm_...(...);
>
> ...
>
> > +static int msc313_gpio_remove(struct platform_device *pdev)
> > +{
> > +       return 0;
> > +}
>
> Purpose?
>

None that I can think of. I think I was under the impression that a
remove callback was needed even if it did nothing.

>
> > +static const struct of_device_id msc313_gpio_of_match[] = {
>
> > +#ifdef CONFIG_MACH_INFINITY
>
> What's the point? Are you expecting two drivers for the same IP?

This will make more sense when the support for CONFIG_MACH_MERCURY is added.
infinity and mercury are very very close but have slightly different
pinouts, slightly different tables for clks, pin mux etc.
These chips only have 64MB of DRAM and it's embedded into the chip so
you probably don't want to include all the baggage for the whole
family in your kernel if you possibly can. Also the kernel only has a
few megabytes to fit into on the SPI NOR it's loaded from. Something
similar is going on for the ingenic pinctrl and I thought maybe
wrapping of_device_ids in #ifdefs was a no no and asked [0].
Arguably this is "peeing into the ocean" for a driver like this
because the difference is going to be tiny but I think I'm probably
tens of kilobytes away from my kernel not fitting anymore :).

> > +       {
> > +               .compatible = "mstar,msc313-gpio",
> > +               .data = &msc313_data,
> > +       },
> > +#endif
> > +       { }
> > +};
>
> ...
>
> > +static struct platform_driver msc313_gpio_driver = {
> > +       .driver = {
> > +               .name = DRIVER_NAME,
> > +               .of_match_table = msc313_gpio_of_match,
> > +               .pm = &msc313_gpio_ops,
> > +       },
> > +       .probe = msc313_gpio_probe,
> > +       .remove = msc313_gpio_remove,
> > +};

For the fixes to the above should I send another series just to fix
these up or can it wait a little while?
I'm pretty close to having all of the registers mapped out for another
chip that'll go into this driver so I could send these small changes
as part of that series.

Thanks,

Daniel

0 - https://lore.kernel.org/linux-arm-kernel/CAFr9PX=EgQSXeATLn++DSHkkQar35rpLGh978J5Lnw9jS8XMrw@mail.gmail.com/
