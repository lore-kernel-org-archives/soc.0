Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99806C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 23:05:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 445A564DF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 23:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 445A564DF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9QpqPNRNfD+qvDCjcMPtjVRGIchgsVq78+DpqlCmL2A=; b=IzWdjhFYyJB724T+6dOliPF72
	8q1q4s0Rc8Ygvlf8vpPPpbWK53Lp2q74dGGs1sRIQNOqhb+UffU1lRpndW1qcbwJ/gpVx7bE/BbmS
	SMSgslHKIywmAMkpO6rJ8GVVxRJnZGIHFYe0NtGbUbOTU/l3nkcfosyOErDw6q1K2wu+ILMX9Xe/v
	kc/On2+1ofDqtkOnpPk101RRf5+7Ctl6MF5XuYWItS0mD8pt87t+ZB0poclPXcfyJ26m5bNxjZsgr
	DvAeXJtP6nm5NtrYUZYjI8OE07Dgws6CXjU0ji0gjTxlSYYgKgzIQ5RgjgNG6i7J5Z8ZGhSdyqjQ8
	nuSrRZnxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7nfy-0002qq-2h; Thu, 04 Feb 2021 23:04:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7nfv-0002qU-0L
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 23:04:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8DBA64FAC
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-oi1-f171.google.com with SMTP id w124so5526492oia.6
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 04 Feb 2021 15:04:33 -0800 (PST)
X-Gm-Message-State: AOAM533B7uSG2fTR1QoA2V2swnHbr7RZrQb8qwPZcD7qJmCCZh949E8z
 JyPLj/mlbBz8IR93YGK9nEpWUyTbbrB7c63p2UA=
X-Google-Smtp-Source: ABdhPJxyDw2DSx7lycpinEE2gJN2fNLHw2CFujBWSv/ZNshzIfW/HiG6TcDE2X9T8aKAct17Y2+zeicQ9JTeZlM1Ndw=
X-Received: by 2002:aca:d908:: with SMTP id q8mr1189387oig.67.1612479872924;
 Thu, 04 Feb 2021 15:04:32 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-16-marcan@marcan.st>
 <CAK8P3a1zbLM0s_GwkJ0AJQ8cocS-zcsWWKhOB7B99OtRYyDE7g@mail.gmail.com>
 <8adb1047-2b1a-9cfc-c906-3c369a8e494f@marcan.st>
In-Reply-To: <8adb1047-2b1a-9cfc-c906-3c369a8e494f@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Feb 2021 00:04:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a14vsLkCujd_XBAOAjL2h878gxkaoKPpaxL4jddZZcc-A@mail.gmail.com>
Message-ID: <CAK8P3a14vsLkCujd_XBAOAjL2h878gxkaoKPpaxL4jddZZcc-A@mail.gmail.com>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
To: "Hector Martin 'marcan'" <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_180435_676557_BD9B4CF8 
X-CRM114-Status: GOOD (  52.84  )
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
Cc: DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204230417.Hbzt8eacx5EoXMeJPNi6M14bqY_i8DhROOU9-K30ti4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
