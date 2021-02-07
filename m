Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D12C433E0
	for <soc@archiver.kernel.org>; Sun,  7 Feb 2021 18:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DD9D364E34; Sun,  7 Feb 2021 18:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B99BC64E30;
	Sun,  7 Feb 2021 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612723809;
	bh=zLrZH7u8b340JUKe9u6QJb984ZFsjNLKfNoSrHfAx+o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MwoR5mPeh9MdovahURDMIbLVVgXSEXSaRaE6YH1NojJ2PTjBrKG6zB8SghMuhXdVV
	 0mSTNSlMPe6SoYjY/Qp0EfG9XJR5f23J9aA6pbiuSfXA65+nKZUpKR4YoNrE3MYfrz
	 479sjvyZYnBRKskTtTRyegPY+/dlWCHMxbGbxeZBH60BAInAV7mKtdD2YQNf7Nrg+z
	 H4X7nwBxE9xcAfFaDymre9iWromuxpWZcE1i1L5jvPKF4YUIwt4P46qcgBX4J8rwHT
	 5KDUIUb0Wt8Lej0wIffL344i9inBOgjxCFUWl5mW04+476FBUtFKk49XizjWeiUFLb
	 mJeQ6aoUZtuLQ==
Received: by mail-oi1-f175.google.com with SMTP id v193so8014084oie.8;
        Sun, 07 Feb 2021 10:50:09 -0800 (PST)
X-Gm-Message-State: AOAM533xchNF+WuKI5BTlfy3sNSmdDCPdG3A1dJk39i32Jcyyb1vic76
	+ruX0kM0HibV5FQiKSIHaXVWRKJR1dyfR/Hb1UQ=
X-Google-Smtp-Source: ABdhPJyDRjLOh/MKsgqtGED0S0mi24CWBQUO9WGLOYmU4ZVYj6zUfXxnEIp9WinnK4URvR05/Fc874Z+oPrQQ/N7PRE=
X-Received: by 2002:aca:e103:: with SMTP id y3mr8916747oig.11.1612723808999;
 Sun, 07 Feb 2021 10:50:08 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-11-marcan@marcan.st>
 <87h7mpky0f.wl-maz@kernel.org> <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
 <cb721f28-d5e9-3381-2d04-746c0aa2a0d3@marcan.st> <CAK8P3a1R51_nqfMWG7SxScJNJEQ3qvp-cynABKEDaQ4O9REM=Q@mail.gmail.com>
 <df54df32-088a-c707-9ffd-e099878548bc@marcan.st>
In-Reply-To: <df54df32-088a-c707-9ffd-e099878548bc@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 7 Feb 2021 19:49:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1vmUJ0EpzU2+u2gy8WHCVV5ur9u-oTzU2BP=ddbXQeLQ@mail.gmail.com>
Message-ID: <CAK8P3a1vmUJ0EpzU2+u2gy8WHCVV5ur9u-oTzU2BP=ddbXQeLQ@mail.gmail.com>
Subject: Re: [PATCH 10/18] arm64: Introduce FIQ support
To: "Hector Martin 'marcan'" <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 7, 2021 at 4:40 PM Hector Martin 'marcan' <marcan@marcan.st> wrote:
> On 07/02/2021 21.25, Arnd Bergmann wrote:
> > On Sun, Feb 7, 2021 at 9:36 AM Hector Martin 'marcan' <marcan@marcan.st> wrote:
> >> On 07/02/2021 01.22, Arnd Bergmann wrote:
> >>> * In the fiq handler code, check if normal interrupts were enabled
> >>>     when the fiq hit. Normally they are enabled, so just proceed to
> >>>     handle the timer and ipi directly
> >>>
> >>> * if irq was disabled, defer the handling by doing a self-ipi
> >>>     through the aic's ipi method, and handle it from there
> >>>     when dealing with the next interrupt once interrupts get
> >>>     enabled.
> >>>
> >>> This would be similar to the soft-disable feature on powerpc, which
> >>> never actually turns off interrupts from regular kernel code but
> >>> just checks a flag in local_irq_enable that gets set when a
> >>> hardirq happened.
> >>
> >> Case #2 seems messy. In AIC, we'd have to either:
> >>
> >> * Disable FIQs, and hope that doesn't confuse any save/restore code
> >> going on, then set a flag and check it in *both* the IRQ and FIQ path
> >> since either might trigger depending on what happens next, or
> >> * Mask the relevant timer, which we'd then need to make sure does not
> >> confuse the timer code (Unmask it again when we fire the interrupt? But
> >> what if the timer code intended to mask it in the interim?)
> >
> > I'm not quite following here. The IRQ should be disabled the entire time
> > while handling that self-IPI and the timer top half code, so if we get
> > another FIQ while handling the timer from the IRQ path, it will lead
> > either yet another self-IPI or it will be ignored in case the previous timer
> > event has not been Acked yet. I would expect that both cases are
> > race-free here, the only time that the FIQ needs to be disabled is
> > while actually handling the FIQ. Did I miss something?
>
> FIQs are level-triggered, and there are only two* ways of masking them
> (that we know of): in the timer, or DAIF. That means that if we get a
> FIQ, we *must* do one of two things: either mask it in the timer
> register, or mask FIQs entirely. If we do neither of these, we get a FIQ
> storm.
>
> So if a timer FIQ fires while IRQs are disabled, and we can't call into
> the timer code (because IRQs were disabled, so we need to defer handling
> via the IPI), the only other options are to either poke the timer mask
> bit directly, or to mask FIQs. Neither seems particularly correct.

Ok, I had not realized the timer was level triggered. In case of the
timer, I suppose it could be either masked or acknowledged from the
fiq top-half handler when deferring to irq, but I agree that it means a
layering violation in either case.

What might still work is an approach where FIQ is normally enabled,
and local_irq_disable() leaves it on, while local_irq_enable() turns
it on regardless of the current state.

In this case, the fiq handler could run the timer function if interrupts
are enabled but just turn off fiqs when they are turned off, waiting
for the next local_irq_enable() to get us back in the state where
the handler can run.  Not sure if that would buy us anything though,
or if that still requires platform specific conditionals in common code.

> * An exception seems to be non-HV timer interrupts firing while we have
> a VM guest running (HCR_EL2.TGE=0). This causes a single FIQ, and no
> more, which suggests there is a mask bit for guest timer FIQs somewhere
> that gets automatically set when the FIQ is delivered to the CPU core.
> I've yet to find where this bit lives, I'll be doing a brute force sweep
> of system register space soon to see if I can find it, and if there is
> anything else useful near it.

Right. Maybe you can even find a bit that switches between FIQ and
IRQ mode for the timer, as that would solve the problem completely.
I think it's not that rare for irqchips to be configurable to either route
an interrupt one way or the other.

> >> Plus I don't know if the vector entry code and other scaffolding between
> >> the vector and the AIC driver would be happy with, effectively,
> >> recursive interrupts. This could work with a carefully controlled path
> >> to make sure it doesn't break things, but I'm not so sure about the
> >> current "just point FIQ and IRQ to the same place" approach here.
> >
> > If we do what I described above, the FIQ and IRQ entry would have
> > to be separate and only arrive in the same code path when calling
> > into drivers/clocksource/arm_arch_timer.c. It's not recursive there
> > because that part is only called when IRQ is disabled, and no IRQ
> > is being executed while the FIQ hits.
>
> Right, that's what i'm saying; we can't re-use the IRQ handler like Marc
> proposed, because I don't think that expects to be called reentrantly;
> we'd have to have a separate FIQ entry, but since it can be called with
> IRQs enabled and handle the FIQ in-line, it also needs to be able to
> *conditionally* behave like a normal IRQ handler. This level of
> complexity seems somewhat dubious, just to not maintain the FIQ mask bit
> synced. That's not just AIC code any more, it needs a bespoke FIQ vector
> and logic to decide whether IRQs are masked (call AIC to self-IPI
> without doing the usual IRQ processing) or unmasked (go through regular
> IRQ accounting and behave like an IRQ).
>
> Perhaps I'm misunderstanding what you're proposing here or how this
> would work :)

The way I had imagined it was to have a parallel set_handle_irq()
and set_handle_fiq() in the aic driver, which end up using the same
logic in the entry code to call into the driver. The code leading up
to that is all in assembler but isn't all that complex in the end, and
is already abstracted with macros to a large degree. For existing
machines that don't call set_handle_fiq() it could just end up in
either panic() or in WARN_ONCE() if an FIQ does happen
unexpectedly.

The aic_handle_fiq() function itself would be straightforward,
doing not much more than

       if (interrupts_enabled(ptregs))
             /* safe to call timer interrupt here, as interrupts are on */
             handle_domain_irq(aic->domain, AIC_TIMER_IRQ, regs);
       else
             /* need to defer until interrupts get re-enabled */
             aic_send_ipi(smp_processor_id(), TIMER_SELF_IPI);

Anyway, it's probably not worth pursuing this further if the timer
interrupt is level-triggered, as you explained above.

       Arnd
