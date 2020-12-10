Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46ACCC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 14:23:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA62923D57
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 14:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA62923D57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OXpAqyaUmxKVZeKrgPPLIe88jdcG+Nkkg3XCR1JLi1s=; b=VzSlg8JzpG610Ot6fTtoVJerM
	Yk0JhC6GLkuWYSKMSp/vCTu/VQ/LOUiJDOKc3lupKN2dJRQoParn5rh+LQ4yHrzTLV3f7g125ztzo
	IOfVdr/yUHtnGOLfOqdq22s1fk522+FAsuhZldEE4VVJTqGsNEtzlP5AZ/+9DlSYwftyu5Z7GRNlz
	NfnQL7Vp9tIdIHJ3BZdQ2RvcNxNuc35Klsgs63bW1zI5kOHyq/pmT4vFUWRl9L7/jJ3v/QAc+U8TH
	Jb5SOah2gE4WnhI5zH2aWOTUvJenrRCd3svLdE750yVGjgQeL1phzCyxSm9p97vsBntfgzdBM1kdr
	w+oDrllig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knMpn-0003Mf-4f; Thu, 10 Dec 2020 14:22:19 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMpk-0003M8-7I
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 14:22:16 +0000
Received: by mail-pf1-x443.google.com with SMTP id i3so4214639pfd.6
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Dec 2020 06:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7gvh3enTyM7r16asGFsXp25EQVi9nM03JLF3FLpI4e8=;
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
 b=R0/05KXdHMpWHZUc8sasFD37eAPaqvYFe4X41bUTAFu6Q7Ue9QsJABjGROlGUiUz3Y
 FANiqgPEk8z8AEfhdn6wTK/n87R3JP3jH+ZyjPJTl7hTJlbiO7zrIrmscfiy9gm5ybOu
 ZCwz5UiXGIC5Jp61L3sYqQYpOh5VzC3aGQXGFUYFxv5kEK6X6dBVzvA2kjGcVZfsAAae
 wUpHTFZ/8jzae3njAEABwBcQpQjRaKXgqf5xMTXBo92m6xjUilCnoMeDllTcqQuCmavt
 kN3JG0fGPC5xPZ5daUnBfkFIWZ3WxAE2Q5+ROIGZMRc7We94TRWhbfqtNY8cJyVvFFG5
 LS8A==
X-Gm-Message-State: AOAM531X/t1Txm5HZcUN55z9wTF0njk8sz+LAkgg+Zi2zGPKMc10YMaM
 RyAqblF65LShHdu6LLudfRaSdM7kL9pmprPlI6vekgYZeyg=
X-Google-Smtp-Source: ABdhPJxVp8EjIZlO70I74O7fyXpVy6WLFzWzXDg3HsS2ENh9tXjZCbb5x1gDs1oxITNXtrQMaWhjZVC5PijATGv5ts4=
X-Received: by 2002:a63:4002:: with SMTP id n2mr6926113pga.4.1607610133882;
 Thu, 10 Dec 2020 06:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <20201129110803.2461700-4-daniel@0x0f.com>
In-Reply-To: <20201129110803.2461700-4-daniel@0x0f.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Dec 2020 16:23:02 +0200
Message-ID: <CAHp75Vdy9rBgJhyYXjUKapYdeMfsNhbX9Zi3Jtxb4H8H279V-A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Daniel Palmer <daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_092216_296346_CD1C15BB 
X-CRM114-Status: GOOD (  24.83  )
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
Message-ID: <20201210142302.DGDdYH-99-3GzsznhCkwP62wTb4DztJ13_TApR4qRY0@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
