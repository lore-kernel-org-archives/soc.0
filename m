Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28F5C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 14:29:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DAB323E20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 14:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DAB323E20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TZDH0f6WKyPMFfUpf2UDDcyEEFNxuk5hI8tHatTKgfE=; b=vmdfq5Gn6PFhU8v89UJhR4d7/
	Ofe0fWiW63uW1HTjvgXkWi/TKlM/d3eVyWtHWwZhPIaZiWKybgCY/zWyNH+zUeFHGC1M7CK2b8Z/m
	pJyy9ps9p+NPXEB+uE6FRsoTmkVDX5ptlRF6G/t8J+u1XCqth5/uvn7/Eh0RaIj7MZXuiazBdREpk
	Dfa5WB0S/dvAotx1Blp9HuiXOuBlyngukbCXVolUG0Dy5E4erPLSVjUeD2omPLA2oWr7snNftPZEb
	3yimByLcFAAkpEx1g1bBioITIPkKkk6dUkxWQnVp+m8ICO1wEeft7shsZJb9Rm9LG2xTZGvhLhfgO
	vQgqYxkUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knMva-00064X-MN; Thu, 10 Dec 2020 14:28:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMvS-000620-Di
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 14:28:11 +0000
X-Gm-Message-State: AOAM530pJAEqmN45xNDuCs/8TeHHD44SQApZMDNZL1YGDNDaXZYgqrvW
 5z2yVzDyAmYr1NNXqAh0HQ1/fW/U+ZXtk0gfdgU=
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
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <20201129110803.2461700-4-daniel@0x0f.com>
 <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
 <CAFr9PX=fhKiZF80iKaGeBWOONm3VpwtzgbB+yBHk8MHdTotaHg@mail.gmail.com>
In-Reply-To: <CAFr9PX=fhKiZF80iKaGeBWOONm3VpwtzgbB+yBHk8MHdTotaHg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 10 Dec 2020 15:27:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0zCa0Dq8uUDoSbu64sGLeNWrSk=6i4pKzgwerRseXfnA@mail.gmail.com>
Message-ID: <CAK8P3a0zCa0Dq8uUDoSbu64sGLeNWrSk=6i4pKzgwerRseXfnA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Daniel Palmer <daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_092810_665117_AF698CBF 
X-CRM114-Status: GOOD (  30.65  )
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
Message-ID: <20201210142750.ZuY_a1ylXRkMpydCQ_KoAnDQ69OWQd7C_29KsvdyQZQ@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
