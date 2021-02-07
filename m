Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693B1C433E0
	for <soc@archiver.kernel.org>; Sun,  7 Feb 2021 12:25:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 25BEB64E54; Sun,  7 Feb 2021 12:25:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F39A864DF6;
	Sun,  7 Feb 2021 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612700720;
	bh=XyIV0mQRY76asF3SEYLbYdKnyQG/xcH5nGqR8aL09QE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dWr0vbjS2hz95yn1KghsniexxA5hrho2hgnMPc5FQlxBEkGL75RnqxHV3S6Qlni80
	 IuynGNgjTGBf4Mhoi69NyMTZsKvBFknA/5W5NFrrit+p6w4y3JW+SvgdiRr/nK48+D
	 5ivndodJzJSHkgXu567enpc5xFuqbgRIRpjJgl/cmqCk7T7t3a2FFUhfdDsWxnE1Vh
	 Zue6JD0G8TKA2ShDkwrTp0xvKwoBucoU0YgStvmPqSmgN7ep0TxciZHEJQkXYHBXOd
	 NkCNDgNUANxR7JmajgFAv0TfXEfUUNEbWgN946G/qbltkflSbZlLAp5opLg2so02ER
	 +f1TsK2eKONJg==
Received: by mail-oi1-f179.google.com with SMTP id v193so7352920oie.8;
        Sun, 07 Feb 2021 04:25:19 -0800 (PST)
X-Gm-Message-State: AOAM530l7AQ/SMAeKsJauyVOLJBndtLSyr3tkuJbLZmW7n9UFvjkNrxU
	uAZmVroO4YTZ9XTebf11W0PgJ069SfCKR9l6ifU=
X-Google-Smtp-Source: ABdhPJxLK4Eh3P4gg7G+hL1MAzjTYsIn7CY2vh0qkD4hrNVz8zoUU5hpLDo+VeYS+1HxaswTc9+BVAPuAiIEqUo/imM=
X-Received: by 2002:aca:e103:: with SMTP id y3mr8152498oig.11.1612700719300;
 Sun, 07 Feb 2021 04:25:19 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-11-marcan@marcan.st>
 <87h7mpky0f.wl-maz@kernel.org> <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
 <cb721f28-d5e9-3381-2d04-746c0aa2a0d3@marcan.st>
In-Reply-To: <cb721f28-d5e9-3381-2d04-746c0aa2a0d3@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 7 Feb 2021 13:25:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1R51_nqfMWG7SxScJNJEQ3qvp-cynABKEDaQ4O9REM=Q@mail.gmail.com>
Message-ID: <CAK8P3a1R51_nqfMWG7SxScJNJEQ3qvp-cynABKEDaQ4O9REM=Q@mail.gmail.com>
Subject: Re: [PATCH 10/18] arm64: Introduce FIQ support
To: "Hector Martin 'marcan'" <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 7, 2021 at 9:36 AM Hector Martin 'marcan' <marcan@marcan.st> wrote:
> On 07/02/2021 01.22, Arnd Bergmann wrote:
> > * In the fiq handler code, check if normal interrupts were enabled
> >    when the fiq hit. Normally they are enabled, so just proceed to
> >    handle the timer and ipi directly
> >
> > * if irq was disabled, defer the handling by doing a self-ipi
> >    through the aic's ipi method, and handle it from there
> >    when dealing with the next interrupt once interrupts get
> >    enabled.
> >
> > This would be similar to the soft-disable feature on powerpc, which
> > never actually turns off interrupts from regular kernel code but
> > just checks a flag in local_irq_enable that gets set when a
> > hardirq happened.
>
> Case #2 seems messy. In AIC, we'd have to either:
>
> * Disable FIQs, and hope that doesn't confuse any save/restore code
> going on, then set a flag and check it in *both* the IRQ and FIQ path
> since either might trigger depending on what happens next, or
> * Mask the relevant timer, which we'd then need to make sure does not
> confuse the timer code (Unmask it again when we fire the interrupt? But
> what if the timer code intended to mask it in the interim?)

I'm not quite following here. The IRQ should be disabled the entire time
while handling that self-IPI and the timer top half code, so if we get
another FIQ while handling the timer from the IRQ path, it will lead
either yet another self-IPI or it will be ignored in case the previous timer
event has not been Acked yet. I would expect that both cases are
race-free here, the only time that the FIQ needs to be disabled is
while actually handling the FIQ. Did I miss something?

> Plus I don't know if the vector entry code and other scaffolding between
> the vector and the AIC driver would be happy with, effectively,
> recursive interrupts. This could work with a carefully controlled path
> to make sure it doesn't break things, but I'm not so sure about the
> current "just point FIQ and IRQ to the same place" approach here.

If we do what I described above, the FIQ and IRQ entry would have
to be separate and only arrive in the same code path when calling
into drivers/clocksource/arm_arch_timer.c. It's not recursive there
because that part is only called when IRQ is disabled, and no IRQ
is being executed while the FIQ hits.

       Arnd
