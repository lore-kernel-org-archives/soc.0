Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185CDC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 15:22:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F102310E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 15:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F102310E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Md4vFi5zQSBhuCk6VZNJkXmVm243YjJPelS+DzQEZWU=; b=0ozjmHCUQJ0GhYv0Z/yourUgp
	I0Yk0C9Bzqkz9iWjBH0COTWfZc03afZx0+RCedGgAycmtYD3QuNmaLW1IAfImITcekbqwkzhytgmh
	hoWMmbmoeQEu292Ijsqm7g4QXDvU0fmnMqCgY6T8758Fjugg0I9SJ2TXfb8J5ypUOi2xmSabuejq/
	pPOHyqxQLg7uX4J3RRNb+Sz445rysKSMqC2HUyu2PgXR6y9ZX+vakzqkYS4FI9HJrmL+Htnu7dZDw
	WvOVIqRiFFO4pwop/B3eVsoxjl7lHsPHN5maQ1iDfiQ1GTTZlW/B7zm5dAh3VyJSPjdO8az4Yxlkn
	F4ik158Tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knNkn-0004mq-CJ; Thu, 10 Dec 2020 15:21:13 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knNkh-0004ly-57
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 15:21:11 +0000
Received: by mail-qk1-x744.google.com with SMTP id n142so5066131qkn.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Dec 2020 07:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lzQQMikD25mHaOvU70fXFtFueunUhFhKwR7BFI8Wd2E=;
 b=qv6OHjvyatbf9wKTVaFQva3h+iUSafbS8ijuZeLyhKbykf4t6BnP+haSBQApyYmukP
 H+6pdEm9J76xjjxiqX2zzaNFJeKxUke42FfgngvNFw8n3PKxtI1fMdpC5/hg6m4SuP03
 DbtLskqJ+Y62beHrt6KZB0tysLwvUe+SQ+0TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lzQQMikD25mHaOvU70fXFtFueunUhFhKwR7BFI8Wd2E=;
 b=X8vpD5y2kwcHnA5o+8FX1R4so8/EvymJQwdbpzhNQFaOU9deJqgclhABiHSH1sW8/t
 nOVg5B/jjSjFMhIwDz5Jpe07SAn0yVC6HkucJL91hMKWCPmI480Boduu71Qhagc2OrtN
 00ToRLJtIg7KPAWphkcTZFnazLneTR1eX0/ZY6JdfyvvR3GOR2CNpPcK4z0r9t55ySnf
 Mfx0wrajGbabA2KQu70dn7gKCwPBOixrqUIatostModNbm0HOYe0A2kxiz2api1t26rk
 lVq4rxgvYEVqGHTuVK3lL+36k7nzFKYJrjgKucNVHDrgOw25P9QL4jTCO43C6X3E6h+h
 he5g==
X-Gm-Message-State: AOAM532ecxf74ylfVu5spexVFYGWxoxTVE+EDb46hw4Zm4FLm38Kphak
 K9HJ+qo5xNFxYbnWYps9cXI97nWHdt1Dz+lew1AdcQ==
X-Google-Smtp-Source: ABdhPJxPU/4SCy7/rE3UgsP7U/aCV3swWmca2vtLjkgy3KaDHEnkpgdsyXm48xf4KUJ4++imK7n8+UBiYOo9V42wb9w=
X-Received: by 2002:ae9:e219:: with SMTP id c25mr1251874qkc.443.1607613664449; 
 Thu, 10 Dec 2020 07:21:04 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <20201129110803.2461700-4-daniel@0x0f.com>
 <CAHp75Vdy9rBgJhyYXjUKapYdeMfsNhbX9Zi3Jtxb4H8H279V-A@mail.gmail.com>
In-Reply-To: <CAHp75Vdy9rBgJhyYXjUKapYdeMfsNhbX9Zi3Jtxb4H8H279V-A@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 11 Dec 2020 00:21:44 +0900
Message-ID: <CAFr9PX=GTHQvwkCMU6ocK+5=QoEGXK6UAFH4ZUF4zq19ds06wQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_102107_427879_E4DF78E3 
X-CRM114-Status: GOOD (  26.08  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Willy Tarreau <w@1wt.eu>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201210152144.e7RPAgAq1mOPk8NAcDlhzdERqy9Pc3pgVIvReBnMDgY@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
