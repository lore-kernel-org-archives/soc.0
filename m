Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0328FC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 21:39:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A988D64FAA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 21:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A988D64FAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TuMl28NM3XrbhsMcd5lHMT0dJHnhB289s/h8gD6iSnw=; b=xR+/8egNlwsOpnlSycfvKC0ac
	RyqON/vNOeeHfVuZuTVAk52GcS8VXFCmdGy0NBCVj7VwQPyVZ2g1+ji4yC6ArjfmBS4Mku/eQPrhk
	GiYECuWp2uWOg6IkM+hAxrgJ0hRRJeedl4hUzluFFe7fRjJPzhAO8VKxuh+Ax0TJKjVl/9IeDQIME
	4fVHRjiuQchEd/No6d65CamMVeUiFWKzucRHjuLtJNbQwPTzfTrGHW7FZwBxyqZUNsfrNPrpMbfxv
	la17ntvxNd4GqQ1cto8C1TtOZ8yKe1xu96lQYapJiNyMyWfvJS/lQPJ6wsCltR0JzN7fUKwUDFm/a
	6pTvWaKig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7mKL-0006JB-N0; Thu, 04 Feb 2021 21:38:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7mKI-0006Ik-VY
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 21:38:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7770A64FAD
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-oi1-f174.google.com with SMTP id y199so3298026oia.4
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 04 Feb 2021 13:38:09 -0800 (PST)
X-Gm-Message-State: AOAM533+HCxz4lS6hoveD68LKHH3arvPiJpJarsztIDDzw6Gi+Z7jWCO
 78c9VBZDiXLWQo0FWasoWsAf4GLJwzdKOlw51Hg=
X-Google-Smtp-Source: ABdhPJyk4iE/eXvCgXdBfEiwULx+1juSdeQPPd6xyeR9BIxurU7R6PyXToJjijECg4hsJgFo3G5ScMvwou0qml8FSsc=
X-Received: by 2002:aca:e103:: with SMTP id y3mr994303oig.11.1612474688672;
 Thu, 04 Feb 2021 13:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-16-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-16-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 4 Feb 2021 22:37:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1zbLM0s_GwkJ0AJQ8cocS-zcsWWKhOB7B99OtRYyDE7g@mail.gmail.com>
Message-ID: <CAK8P3a1zbLM0s_GwkJ0AJQ8cocS-zcsWWKhOB7B99OtRYyDE7g@mail.gmail.com>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
To: Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_163811_210819_AAF2D315 
X-CRM114-Status: GOOD (  23.72  )
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
Message-ID: <20210204213752.TI7PjGrvQUUQC_4Ye_m-QLmtvGqmS_awP4y4RWlbHXw@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
