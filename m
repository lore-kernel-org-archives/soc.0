Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470A6C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 10:30:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF09123B31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 10:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF09123B31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Msd7Qh5EpFjosF6Mpw7/bRVHXxih2Hw2JHNSA2H8G0w=; b=nBfCG9v9nuZ8CedqVJa6afhyY
	t61uf2hWRTOD18vZpKwgtjVT/ETiYumywsiVOiWAKBt+Ff0qM1Zzj2MuAJDQl3yAi4SygaTOXzocx
	xMu4G7FAL80w9+V1TgN8tnf+sjUBR3wW9xHlFu6qnSJAoCnbX5QRvXVANbd1E40eRXOojo0j8YgVS
	0bsELTTHslqpxdGPHBbobFTLYQcGIrfa+9gDyfJutpm7XaA46Xxvt8VOeLaklKDPdHWIPkD9Sfiy9
	dNUHUf+yaxsVT0/evren714CQqdFlPQV2pYnH3ZuFwiqGS/MoS85VrdHDpn27suApiomV5h1cxYJl
	+Z4fdrj6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJCQ-0006hO-Nz; Thu, 10 Dec 2020 10:29:26 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJCN-0006fi-5p
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 10:29:24 +0000
Received: by mail-qk1-x744.google.com with SMTP id z11so4237160qkj.7
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Dec 2020 02:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b0knabE4pLiyMjkoiksYG/IB8kMycYTPeC8EyBeBTFk=;
 b=miRhMRcVYRU8W2s9H83rcF+aFhaacPuIK1msFRh8h6eJwvU0WCRwa9ZzdaBW9vYaSM
 5XrEfOOQ5WKR+Vi4i3eQCuBJOhhTI4d+IymcP5l/zOl4TfKm6+/MK8E1yiXqqFv+VhNz
 gc7Zw1UEvharuOq3E/DRhmUxt30EVJiLe85UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b0knabE4pLiyMjkoiksYG/IB8kMycYTPeC8EyBeBTFk=;
 b=POa/cC/S4i5Jxz1Oi2LAhkDfHtaQu2GY/Vc73YO72YeLIQAivR+A4BQKdPEvqfsYOx
 2NHgcAaLA5hCWp2cWhotPVcA9FAeyz012xRc8oSmlR6T+E3TNEND/xFeC7EBwHxnmRvt
 NpcJQeM8tVShCzylgwkl/ZXRDzNRsZ6ZDr4wvB8Gf2Rr7QTLP6C9mWdgkj+U18P8FJvE
 tmHajwhEiZJQ8Y4r8xAgPLhCivSBXmp28YzXem8N3Udzn9AqLpRR3Nzn3aUEYrmHlEd0
 BnMnArawICx8KmrWlsC5sLdmqACbUYlZkoxlMXaE2knx9Pvi6fEx9EMCu3VOHx89Cau9
 8Png==
X-Gm-Message-State: AOAM531Tdjdn3z2XAV6y0DhI/qC1je29GxTaPiJvku/KmWu+eRBO1bsr
 3KSNWBcFHI/Q0NnyBen3gT6D0pGUj33BE5rA8Hss2Q==
X-Google-Smtp-Source: ABdhPJwOZUi2Sl1Yd/f5v6x5SU7/RnsNHC6u16neZmVHJ04GokosGXeljSbqswV/Mein4PrK5Or0sFRoiVO0l3ifl/U=
X-Received: by 2002:a37:8681:: with SMTP id i123mr7867752qkd.54.1607596159936; 
 Thu, 10 Dec 2020 02:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <20201129110803.2461700-4-daniel@0x0f.com>
 <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 10 Dec 2020 19:29:09 +0900
Message-ID: <CAFr9PX=fhKiZF80iKaGeBWOONm3VpwtzgbB+yBHk8MHdTotaHg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_052923_418829_85255E9E 
X-CRM114-Status: GOOD (  30.35  )
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
Message-ID: <20201210102909.Q406cy-MXZN00mz7oT80jf4bn4yDReUg-0OyNbe51Ug@z>

Hi Arnd,

On Thu, 10 Dec 2020 at 06:58, Arnd Bergmann <arnd@kernel.org> wrote:
> These seem to just be contiguous ranges, so I probably would have
> suggested describing them as separate gpio controllers to avoid
> all the complexity with the names. As Linus already merged the
> driver into the gpio tree, I won't complain too much about it.
>
> Maybe you can do that for the other chips though and have one
> implementation that works for all others, leaving only the msc313
> as the one with the extra complexity.

I'll have a think about that. The other chips I'm aiming to support
(the mercury5 ssc8336 and infinity2m ssd202) currently reuse most of
the msc313 bits with a few extras for the differences.
i.e. the ssc8336 reuses most of the tables for the msc313 with some
additions. Adding new chips hasn't been too bad so far.

> > +#define MSC313_GPIO_CHIPDATA(_chip) \
> > static const struct msc313_gpio_data _chip##_data = { \
> > +       .names = _chip##_names, \
> > +       .offsets = _chip##_offsets, \
> > +       .num = ARRAY_SIZE(_chip##_offsets), \
> > +}
>
> > +#ifdef CONFIG_MACH_INFINITY
> > +static const char * const msc313_names[] = {
> > +       FUART_NAMES,
> > +       SR_NAMES,
>
> I would try to avoid the #ifdefs and the macros here, don't overthink
> it. The macro really hurts readability with the ## concatenation
> making it impossible to grep for where things are defined, and
> the #ifdef means you get worse compile test coverage compared
> to an if(IS_ENABLED()) check in the place where the identifiers
> are actually used.

Ok. I was really just trying to enforce some sort of pattern there so
that each chip that gets added follows the same convention.

> Even better would be to completely avoid the lookup tables here,
> and have one driver that is instantiated based on settings from
> the DT.

I did think about this and I did this with the clk mux driver I
haven't pushed yet. In that case there is a random lump of registers
with some muxes mixed into it so I decided to make the lump a syscon
and then have a node for each clk mux in the lump and some properties
for the muxes within. The driver is certainly less complex but the
device tree is pretty unmanageable as there are probably 30 or more
muxes.

> > +static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> > +{
> > +       struct msc313_gpio *gpio = gpiochip_get_data(chip);
> > +       u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> > +
> > +       if (value)
> > +               gpioreg |= MSC313_GPIO_OUT;
> > +       else
> > +               gpioreg &= ~MSC313_GPIO_OUT;
> > +
> > +       writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
> > +}
>
> It would be helpful here to replace all the readb_relaxed/writeb_relaxed()
> with normal readb()/writeb(). Don't use _relaxed() unless there is a strong
> reason why you have to do it, and if you do, explain it in a comment what
> the reason is.

The reason is that readb()/writeb() will invoke the heavy memory
barrier even though it's not needed for peripheral registers.
I guess it doesn't actually make all that much difference in reality.

> > +static int msc313_gpio_direction_output(struct gpio_chip *chip, unsigned int offset, int value)
> > +{
> > +       struct msc313_gpio *gpio = gpiochip_get_data(chip);
> > +       u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> > +
> > +       gpioreg &= ~MSC313_GPIO_OEN;
> > +       if (value)
> > +               gpioreg |= MSC313_GPIO_OUT;
> > +       else
> > +               gpioreg &= ~MSC313_GPIO_OUT;
> > +       writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
>
> These look like they also need a spinlock to avoid races between concurrent
> read-modify-write cycles on the same register.

Noted. I'll fix this and the readb and send a patch at some point.

> > +builtin_platform_driver(msc313_gpio_driver);
>
> There is a trend to make all drivers optionally loadable modules these days.
> Is there a reason this has to be built-in?

This was discussed and I think Linus said it was ok.

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
