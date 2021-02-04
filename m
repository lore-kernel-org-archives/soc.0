Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB96C433E6
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 21:38:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ACEBD64FAB; Thu,  4 Feb 2021 21:38:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C89B64FAA;
	Thu,  4 Feb 2021 21:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612474689;
	bh=zzBiDy/ylXik8218pjoiFAkEdpwYYwjw6FdvJ6pJC+o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OjFqLjU9rfLlatxoQIY7M7+aZTz/YU0Qv4o1Up0BRSSroqJjkuy9ATugF+ONIm+CL
	 34qGWr+8WQZbLfLmPj8xSkF5IqXHs8XvxAfzmZ9WF1Ibhf2iudR6Lmupks3Hzq64SR
	 10YcwTlQ4MpHmM4CtVybirsSr+ExCGRUlyiBIhWV2yQ8MnavtTeiTOwYuDOhVi3ytM
	 cJiWyzSmd6MAeyM4ionzZspSLhDAV5RYT9dIp+7nBs7gK2rOtz5yACxXTRZIs8LALi
	 lH3ARSjfCuRgxtq+zvzK5TRkHhxeOKPuZe2QnU3EuOWnkgYzIj9AwTGkEuQ4bScMic
	 94Iy1IxceVKXw==
Received: by mail-oi1-f171.google.com with SMTP id j25so5337603oii.0;
        Thu, 04 Feb 2021 13:38:09 -0800 (PST)
X-Gm-Message-State: AOAM5315J0rVb97QpL6BM0m1IiJMGZ2V1Ys3Rif38ocsbzs5aPWyw3L7
	yofZW3qhFZdD414MoOzacjHG/0FYJd3p531WZWw=
X-Google-Smtp-Source: ABdhPJyk4iE/eXvCgXdBfEiwULx+1juSdeQPPd6xyeR9BIxurU7R6PyXToJjijECg4hsJgFo3G5ScMvwou0qml8FSsc=
X-Received: by 2002:aca:e103:: with SMTP id y3mr994303oig.11.1612474688672;
 Thu, 04 Feb 2021 13:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-16-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-16-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 4 Feb 2021 22:37:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1zbLM0s_GwkJ0AJQ8cocS-zcsWWKhOB7B99OtRYyDE7g@mail.gmail.com>
Message-ID: <CAK8P3a1zbLM0s_GwkJ0AJQ8cocS-zcsWWKhOB7B99OtRYyDE7g@mail.gmail.com>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:
> +/*
> + * AIC is a fairly simple interrupt controller with the following features:
> + *
> + * - 896 level-triggered hardware IRQs
> + *   - Single mask bit per IRQ
> + *   - Per-IRQ affinity setting
> + *   - Automatic masking on event delivery (auto-ack)
> + *   - Software triggering (ORed with hw line)
> + * - 2 per-CPU IPIs (meant as "self" and "other", but they are interchangeable if not symmetric)
> + * - Automatic prioritization (single event/ack register per CPU, lower IRQs = higher priority)
> + * - Automatic masking on ack
> + * - Default "this CPU" register view and explicit per-CPU views
> + *
> + * In addition, this driver also handles FIQs, as these are routed to the same IRQ vector. These
> + * are used for Fast IPIs (TODO) and the ARMv8 timer IRQs.
> + *
> + * Implementation notes:
> + *
> + * - This driver creates one IRQ domain for HW IRQs and the timer FIQs
> + * - FIQ hwirq numbers are assigned after true hwirqs, and are per-cpu
> + * - DT bindings use 3-cell form (like GIC):
> + *   - <0 nr flags> - hwirq #nr
> + *   - <1 nr flags> - FIQ #nr
> + *     - nr=0  physical timer
> + *     - nr=1  virtual timer
> + *   - <2 nr flags> - IPI #nr
> + *     - nr=0  other IPI
> + *     - nr=1  self IPI

I think we should discuss the binding a bit here. My initial thinking was that
it would be better to separate the AIC from the FIQ handling, as they don't
seem to have any relation in hardware, and representing them as two
separate nodes seems like a cleaner abstraction.

> +#define TIMER_FIRING(x)                                                        \
> +       (((x) & (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_MASK |            \
> +                ARCH_TIMER_CTRL_IT_STAT)) ==                                  \
> +        (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT))
> +
> +static void aic_handle_fiq(struct pt_regs *regs)
> +{
> +       /*
> +        * It would be really nice to find a system register that lets us get the FIQ source
> +        * state without having to peek down into clients...
> +        */
> +       if (TIMER_FIRING(read_sysreg(cntp_ctl_el0))) {
> +               handle_domain_irq(aic_irqc->hw_domain,
> +                                 aic_irqc->nr_hw + AIC_TMR_PHYS, regs);
> +       }
> +
> +       if (TIMER_FIRING(read_sysreg(cntv_ctl_el0))) {
> +               handle_domain_irq(aic_irqc->hw_domain,
> +                                 aic_irqc->nr_hw + AIC_TMR_VIRT, regs);
> +       }
> +}

This seems to be a minor layering violation to me.

One idea I had was to just keep all the fiq handling in the timer driver
itself, jumping there directly from the top-level fiq entry whenever
we are on an Apple platform. At least as long as nothing else ever
uses fiq.

When we discussed the earlier submission for the aic, I understood
that FIQ is used for both timer and IPI, but the IPI actually has another
method based on normal AIC interrupts that can be used as an
alternative.

> +static void __exception_irq_entry aic_handle_irq_or_fiq(struct pt_regs *regs)
> +{
> +       u64 isr = read_sysreg(isr_el1);
> +
> +       if (isr & PSR_F_BIT)
> +               aic_handle_fiq(regs);
> +
> +       if (isr & PSR_I_BIT)
> +               aic_handle_irq(regs);
> +}

Having the shared entry point here looks reasonable to me though, it
does seem to make a few things easier.

I wonder if there is a possible race here: if we are ever in a situation
where one of the two -- fiq or irq -- is disabled while the other one
is enabled, we could get into a state where a handler is run while
it should be masked.

       Arnd
