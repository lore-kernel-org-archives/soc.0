Return-Path: <SRS0=oGzf=FO=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3680AC4361B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 14:22:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 033E223D39; Thu, 10 Dec 2020 14:22:15 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADC5E23D22;
	Thu, 10 Dec 2020 14:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADC5E23D22
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=andy.shevchenko@gmail.com
Received: by mail-pf1-f195.google.com with SMTP id b26so4220637pfi.3;
        Thu, 10 Dec 2020 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7gvh3enTyM7r16asGFsXp25EQVi9nM03JLF3FLpI4e8=;
        b=g8KiW139pOV2susxo8HdW/YCjk7r0bCJ4v1VqLcaQGdS+kugolJyuTrKNLYE02M5Oy
         hwO0pFh3VRMHS9xsoL4zKAssx6DcQGdsUPQWjDb8Ms2QdI/RaFjWvBMAs3LlajEYLm7B
         E/A2Nm7BKrKcghKE4sxxyC17d2pz3yJPxpj7vgNOtGlyOeLGfWzS+Yh+MQnFrYW4XKPv
         Et7xQ/S87ZeU5xl/3i8CHeYDwkhdvTgBFJG+CL1zBOYmJ35bV5D/W9PFODHWO9hTZGHF
         +ffG/RBD1oTr9lZrJf6/aM81EXYASfnDpjNY7jdq5a4j15se5zsQCeoNQNwtCZaeEsNH
         DC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7gvh3enTyM7r16asGFsXp25EQVi9nM03JLF3FLpI4e8=;
        b=I/Fzx4F+E/hiCYymlPF9yd/AlyDzN/PClcmqtxuOI0tgZKyMv/t7MZ7z5yXu2oIPV8
         XcOPSFsP3MekZEkCM8KqZgSLzwpQr1kkRS23QRgfprlKdJy6fLGz8VPYWs+v9D5l+jWa
         6CoSAMd+Y3u+I7TVr0ppu4My/XHmNNy+NQgJ9AOcp87m9V+XlpM6BadpVvAZAwalpydR
         pn1HNEqJ9QyvJVS2h6Dh1KUbt2sGZSdAtFKEA75LTlNT1z0rGjC3/Pqh5M+LOP0i9aFE
         Mn5djCkdr7zTHInxeOkLnJVFqimt3TCQB53KJsmZFpL90VgA+EBYjAxm6mSvwYkgT4Ir
         eZ5g==
X-Gm-Message-State: AOAM532/+M19BsZvhROg3z6rYIcxCHA2i7QIfa1yF/kTlthvlb6XTspi
	jjX1b3UhBZlmaI0/K6s3BBiytu6CbeOsniukPoI=
X-Google-Smtp-Source: ABdhPJxVp8EjIZlO70I74O7fyXpVy6WLFzWzXDg3HsS2ENh9tXjZCbb5x1gDs1oxITNXtrQMaWhjZVC5PijATGv5ts4=
X-Received: by 2002:a63:4002:: with SMTP id n2mr6926113pga.4.1607610133882;
 Thu, 10 Dec 2020 06:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <20201129110803.2461700-4-daniel@0x0f.com>
In-Reply-To: <20201129110803.2461700-4-daniel@0x0f.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Dec 2020 16:23:02 +0200
Message-ID: <CAHp75Vdy9rBgJhyYXjUKapYdeMfsNhbX9Zi3Jtxb4H8H279V-A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 29, 2020 at 1:10 PM Daniel Palmer <daniel@0x0f.com> wrote:
>
> This adds a driver that supports the GPIO block found in
> MStar/SigmaStar ARMv7 SoCs.
>
> The controller seems to have enough register for 128 lines
> but where they are wired up differs between chips and
> no currently known chip uses anywhere near 128 lines so there
> needs to be some per-chip data to collect together what lines
> actually have physical pins attached and map the right names to them.
>
> The core peripherals seem to use the same lines on the
> currently known chips but the lines used for the sensor
> interface, lcd controller etc pins seem to be totally
> different between the infinity and mercury chips
>
> The code tries to collect all of the re-usable names,
> offsets etc together so that it's easy to build the extra
> per-chip data for other chips in the future.
>
> So far this only supports the MSC313 and MSC313E chips.
>
> Support for the SSC8336N (mercury5) is trivial to add once
> all of the lines have been mapped out.

...

> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

Perhaps ordered?

...

> +       /*
> +        * only the spi0 pins have interrupts on the parent
> +        * on all of the known chips and so far they are all
> +        * mapped to the same place
> +        */

You have a different comment style here (no capital letter, no period).

> +       if (offset >= OFF_SPI0_CZ && offset <= OFF_SPI0_DO) {

Why not traditional pattern, i.e.

if (...)
  return -EINVAL;
...

?

> +               *parent_type = child_type;
> +               *parent = ((offset - OFF_SPI0_CZ) >> 2) + 28;
> +               return 0;
> +       }
> +
> +       return -EINVAL;

...

> +       ret = devm_gpiochip_add_data(dev, gpiochip, gpio);
> +       return ret;

Purpose?

return devm_...(...);

...

> +static int msc313_gpio_remove(struct platform_device *pdev)
> +{
> +       return 0;
> +}

Purpose?

...

> +static const struct of_device_id msc313_gpio_of_match[] = {

> +#ifdef CONFIG_MACH_INFINITY

What's the point? Are you expecting two drivers for the same IP?

> +       {
> +               .compatible = "mstar,msc313-gpio",
> +               .data = &msc313_data,
> +       },
> +#endif
> +       { }
> +};

...

> +static struct platform_driver msc313_gpio_driver = {
> +       .driver = {
> +               .name = DRIVER_NAME,
> +               .of_match_table = msc313_gpio_of_match,
> +               .pm = &msc313_gpio_ops,
> +       },
> +       .probe = msc313_gpio_probe,
> +       .remove = msc313_gpio_remove,
> +};

> +

Redundant blank line.

> +builtin_platform_driver(msc313_gpio_driver);

-- 
With Best Regards,
Andy Shevchenko
