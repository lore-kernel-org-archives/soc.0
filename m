Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6297CC433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 23:04:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 03C4664FB1; Thu,  4 Feb 2021 23:04:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDC9D64F43;
	Thu,  4 Feb 2021 23:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612479873;
	bh=saYPbWVoRCSiB6YQLhbHJMaba/ejpipgZUMwWNam6vE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=C9ae0hNQSwf6nbL5N1Rp1hRl++plKulvR36BAdZKvcDqvZk2FH0JujVMDKx0fgJ8z
	 p9qsXTPqYQi6duF77eV0h/veRR3XTRhrDV1+U0VDexE1e9rfTiWNHSWm01En/pK6pY
	 VUQhwlfG6IEOpZrWsbQG2siZaKH4Ydw2qblotqYHQTzmVxHpTkQ5tp4feXHSi62yV5
	 lREwbJ2jZc4FqEFzPNz9m/ujuVQXccA18AQk1daX3O1iSPzhBdqcHGKuaNhmATjG8S
	 2pIznMTvWhzCnWK36WNAef2mIkpTu3NHraIkt24PmcH2FznBw2A15pH/W1RxgLGPYc
	 FBSWsSalkMt1A==
Received: by mail-oi1-f176.google.com with SMTP id m7so5490842oiw.12;
        Thu, 04 Feb 2021 15:04:33 -0800 (PST)
X-Gm-Message-State: AOAM530bSCr84lRPN0kU24Chb2NgUTVOgTPu7rb4jYm7PKF61m6LIq+c
	bKHHN5jKlOQxv6fL3xxeF7XWIzzZnpSGW2PRyNI=
X-Google-Smtp-Source: ABdhPJxyDw2DSx7lycpinEE2gJN2fNLHw2CFujBWSv/ZNshzIfW/HiG6TcDE2X9T8aKAct17Y2+zeicQ9JTeZlM1Ndw=
X-Received: by 2002:aca:d908:: with SMTP id q8mr1189387oig.67.1612479872924;
 Thu, 04 Feb 2021 15:04:32 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-16-marcan@marcan.st>
 <CAK8P3a1zbLM0s_GwkJ0AJQ8cocS-zcsWWKhOB7B99OtRYyDE7g@mail.gmail.com> <8adb1047-2b1a-9cfc-c906-3c369a8e494f@marcan.st>
In-Reply-To: <8adb1047-2b1a-9cfc-c906-3c369a8e494f@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Feb 2021 00:04:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a14vsLkCujd_XBAOAjL2h878gxkaoKPpaxL4jddZZcc-A@mail.gmail.com>
Message-ID: <CAK8P3a14vsLkCujd_XBAOAjL2h878gxkaoKPpaxL4jddZZcc-A@mail.gmail.com>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
To: "Hector Martin 'marcan'" <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 11:06 PM Hector Martin 'marcan' <marcan@marcan.st> wrote:
> On 05/02/2021 06.37, Arnd Bergmann wrote:
> > On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:
> >> + * - This driver creates one IRQ domain for HW IRQs and the timer FIQs
> >> + * - FIQ hwirq numbers are assigned after true hwirqs, and are per-cpu
> >> + * - DT bindings use 3-cell form (like GIC):
> >> + *   - <0 nr flags> - hwirq #nr
> >> + *   - <1 nr flags> - FIQ #nr
> >> + *     - nr=0  physical timer
> >> + *     - nr=1  virtual timer
> >> + *   - <2 nr flags> - IPI #nr
> >> + *     - nr=0  other IPI
> >> + *     - nr=1  self IPI
> >
> > I think we should discuss the binding a bit here. My initial thinking was that
> > it would be better to separate the AIC from the FIQ handling, as they don't
> > seem to have any relation in hardware, and representing them as two
> > separate nodes seems like a cleaner abstraction.
>
> This was actually my original approach (I still have the FIQ irqchip
> patch lying around), but that idea somewhat broke when we decided to
> merge the vectors.
>
> If we split it up again, one of the two still needs to be the root,
> decide whether what fired is an IRQ or FIQ, and dispatch accordingly. Or
> we could have three nodes and have one root handler dispatch to IRQ and
> FIQ nodes, but that sounds like overkill... (?)

Maybe I'm misreading the low-level entry code, but my impression
was that the fiq and irq exception vectors could just be pointed to
two different root drivers from the code in kernel_ventry

> Are you proposing just having different drivers/nodes in the same file,
> or implementing these as separate drivers in separate files?

I was thinking of separate driver files.

> >> +#define TIMER_FIRING(x)                                                        \
> >> +       (((x) & (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_MASK |            \
> >> +                ARCH_TIMER_CTRL_IT_STAT)) ==                                  \
> >> +        (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT))
> >> +
> >> +static void aic_handle_fiq(struct pt_regs *regs)
> >> +{
> >> +       /*
> >> +        * It would be really nice to find a system register that lets us get the FIQ source
> >> +        * state without having to peek down into clients...
> >> +        */
> >> +       if (TIMER_FIRING(read_sysreg(cntp_ctl_el0))) {
> >> +               handle_domain_irq(aic_irqc->hw_domain,
> >> +                                 aic_irqc->nr_hw + AIC_TMR_PHYS, regs);
> >> +       }
> >> +
> >> +       if (TIMER_FIRING(read_sysreg(cntv_ctl_el0))) {
> >> +               handle_domain_irq(aic_irqc->hw_domain,
> >> +                                 aic_irqc->nr_hw + AIC_TMR_VIRT, regs);
> >> +       }
> >> +}
> >
> > This seems to be a minor layering violation to me.
>
> Absolutely. Under the assumption that these IRQ lines are ORed together
> into FIQ with no top-level dispatch though, there isn't a great solution
> here...
>
> I think there is a chance FIQ interrupt child bits exist *somewhere*, so
> I actually plan on brute-forcing the list of implemented/valid CPU
> registers and trying to see if I can find some bits that do what I want.
> If it turns out they exist, this could alleviate some of the ugliness of
> the current approach.

Right, that would of course be ideal.

> > One idea I had was to just keep all the fiq handling in the timer driver
> > itself, jumping there directly from the top-level fiq entry whenever
> > we are on an Apple platform. At least as long as nothing else ever
> > uses fiq.
>
> In principle, as long as the timer handler only ever uses one IRQ (which
> I think is the case here, it just picks one of the 4, usually the
> physical timer, and it should only enable that one) it would work. But
> we still need *some* IRQ chip driver to deliver that, unless we want to
> throw a bunch of special-case code into the timer driver to hook
> directly into FIQs without an interrupt parent which... seems like it
> could get quite messy.

I looked at other architectures, and found that at least powerpc
and sparc64 have a really minimal timer tick, with their timer_interrupt()
function getting called directly from the exception vector, and
doing a minimum of accounting (irq_enter(), statistics, ...) manually.

It's a different question if we want to do that, or if there should always
be an irqchip for consistency.

> > When we discussed the earlier submission for the aic, I understood
> > that FIQ is used for both timer and IPI, but the IPI actually has another
> > method based on normal AIC interrupts that can be used as an
> > alternative.
>
> Correct, there are two parallel IPI implementations. It is my
> understanding that the CPU register based one, which ties into FIQ, is
> faster / more featureful (it has deferred IPIs, not sure if the plain
> AIC does those), as it is built into the core complexes instead of being
> part of the external AIC block. I could try benchmarking it within m1n1
> and see if I can find out how much faster it is.

Benchmarking would at least help understand why there are two.

My best guess was that this is mostly an artifact of the XNU kernel
design, where it makes sense to split the timer and IPI that
you want to be handled by Mach kernel from the device irqs
that (I guess) would be handled by the BSD kernel.

> I think it's worth thinking about supporting that IPI mechanism, which
> would necessitate dispatching FIQs too, so hard-coding it to route
> straight to the timer doesn't sound like a very future-proof plan...
> consider that Apple might put out a SoC in the future that rips out the
> AIC IPIs and leaves only the FIQ ones too.

I don't think we have to pay too much attention to preparing the
code design for it, we can always change it when needed. However,
anything that impacts the DT binding here would have to be designed
to not get in the way of adding it later.

> >> +static void __exception_irq_entry aic_handle_irq_or_fiq(struct pt_regs *regs)
> >> +{
> >> +       u64 isr = read_sysreg(isr_el1);
> >> +
> >> +       if (isr & PSR_F_BIT)
> >> +               aic_handle_fiq(regs);
> >> +
> >> +       if (isr & PSR_I_BIT)
> >> +               aic_handle_irq(regs);
> >> +}
> >
> > Having the shared entry point here looks reasonable to me though, it
> > does seem to make a few things easier.
> >
> > I wonder if there is a possible race here: if we are ever in a situation
> > where one of the two -- fiq or irq -- is disabled while the other one
> > is enabled, we could get into a state where a handler is run while
> > it should be masked.
>
> That's a good point. We could filter with the SPSR_ELx mask bits here.
>
> Though the FIQ support patch tries pretty hard to keep the mask bits in
> sync after early boot, so this concern might be somewhat academic. I'm
> happy to implement it if you think it might help though.

It's probably fine as it is, just wanted to make sure you were not missing
something here.

        Arnd
