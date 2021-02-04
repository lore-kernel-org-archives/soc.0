Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17A2C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 22:05:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6663064E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 22:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6663064E4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZdsN5tZ5ivty50poxxLX3QPRYapABg79bvWukfuWCjA=; b=GFpGcCfq7XamtrcYoroy2ABxv
	8pY7wkiDcDRAlcCpsdpnNkpuaDQ0c5cAnQ07CGaIR9tz/Ictg3M00uE4AMJyppbrdzF1q4SlhNjKa
	lRF28qbLTuyDn8JYY5+cXxAzu6jcC/YaSVHt6iTgDCgWJ7oix4Jd7+fIiNY8FixIcG8i80Tbi+Srg
	4g6QSiWFKIgcKXzWUO7o57kqD5ydXdUOVteeOCS4VMiNJuevp5Vh6HmVRt1wmPbsQue3wKsxTbbCm
	7b/5YxrWebAkgHTcG+Hc+W9Q7234S8YKOzSIGiYm+EygSwncF0DEO6Kkm8ynb+tASkHZiHB8YenGe
	DjrAEGsmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7mk4-0007sy-4Q; Thu, 04 Feb 2021 22:04:48 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7mk1-0007sC-2o
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 22:04:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id F2C1242598;
 Thu,  4 Feb 2021 22:04:40 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-16-marcan@marcan.st>
 <CAK8P3a1zbLM0s_GwkJ0AJQ8cocS-zcsWWKhOB7B99OtRYyDE7g@mail.gmail.com>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
Message-ID: <8adb1047-2b1a-9cfc-c906-3c369a8e494f@marcan.st>
Date: Fri, 5 Feb 2021 07:04:38 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1zbLM0s_GwkJ0AJQ8cocS-zcsWWKhOB7B99OtRYyDE7g@mail.gmail.com>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_170445_465779_D58A6D8E 
X-CRM114-Status: GOOD (  40.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204220438.WdRpI4jE2kZtELgBIIQm5B6kf6sAMK0H1cDDTJs7bBo@z>

On 05/02/2021 06.37, Arnd Bergmann wrote:
> On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:
>> + * - This driver creates one IRQ domain for HW IRQs and the timer FIQs
>> + * - FIQ hwirq numbers are assigned after true hwirqs, and are per-cpu
>> + * - DT bindings use 3-cell form (like GIC):
>> + *   - <0 nr flags> - hwirq #nr
>> + *   - <1 nr flags> - FIQ #nr
>> + *     - nr=0  physical timer
>> + *     - nr=1  virtual timer
>> + *   - <2 nr flags> - IPI #nr
>> + *     - nr=0  other IPI
>> + *     - nr=1  self IPI
> 
> I think we should discuss the binding a bit here. My initial thinking was that
> it would be better to separate the AIC from the FIQ handling, as they don't
> seem to have any relation in hardware, and representing them as two
> separate nodes seems like a cleaner abstraction.

This was actually my original approach (I still have the FIQ irqchip 
patch lying around), but that idea somewhat broke when we decided to 
merge the vectors.

If we split it up again, one of the two still needs to be the root, 
decide whether what fired is an IRQ or FIQ, and dispatch accordingly. Or 
we could have three nodes and have one root handler dispatch to IRQ and 
FIQ nodes, but that sounds like overkill... (?)

Are you proposing just having different drivers/nodes in the same file, 
or implementing these as separate drivers in separate files?

>> +#define TIMER_FIRING(x)                                                        \
>> +       (((x) & (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_MASK |            \
>> +                ARCH_TIMER_CTRL_IT_STAT)) ==                                  \
>> +        (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT))
>> +
>> +static void aic_handle_fiq(struct pt_regs *regs)
>> +{
>> +       /*
>> +        * It would be really nice to find a system register that lets us get the FIQ source
>> +        * state without having to peek down into clients...
>> +        */
>> +       if (TIMER_FIRING(read_sysreg(cntp_ctl_el0))) {
>> +               handle_domain_irq(aic_irqc->hw_domain,
>> +                                 aic_irqc->nr_hw + AIC_TMR_PHYS, regs);
>> +       }
>> +
>> +       if (TIMER_FIRING(read_sysreg(cntv_ctl_el0))) {
>> +               handle_domain_irq(aic_irqc->hw_domain,
>> +                                 aic_irqc->nr_hw + AIC_TMR_VIRT, regs);
>> +       }
>> +}
> 
> This seems to be a minor layering violation to me.

Absolutely. Under the assumption that these IRQ lines are ORed together 
into FIQ with no top-level dispatch though, there isn't a great solution 
here...

I think there is a chance FIQ interrupt child bits exist *somewhere*, so 
I actually plan on brute-forcing the list of implemented/valid CPU 
registers and trying to see if I can find some bits that do what I want. 
If it turns out they exist, this could alleviate some of the ugliness of 
the current approach.

> One idea I had was to just keep all the fiq handling in the timer driver
> itself, jumping there directly from the top-level fiq entry whenever
> we are on an Apple platform. At least as long as nothing else ever
> uses fiq.

In principle, as long as the timer handler only ever uses one IRQ (which 
I think is the case here, it just picks one of the 4, usually the 
physical timer, and it should only enable that one) it would work. But 
we still need *some* IRQ chip driver to deliver that, unless we want to 
throw a bunch of special-case code into the timer driver to hook 
directly into FIQs without an interrupt parent which... seems like it 
could get quite messy.

> When we discussed the earlier submission for the aic, I understood
> that FIQ is used for both timer and IPI, but the IPI actually has another
> method based on normal AIC interrupts that can be used as an
> alternative.

Correct, there are two parallel IPI implementations. It is my 
understanding that the CPU register based one, which ties into FIQ, is 
faster / more featureful (it has deferred IPIs, not sure if the plain 
AIC does those), as it is built into the core complexes instead of being 
part of the external AIC block. I could try benchmarking it within m1n1 
and see if I can find out how much faster it is.

I think it's worth thinking about supporting that IPI mechanism, which 
would necessitate dispatching FIQs too, so hard-coding it to route 
straight to the timer doesn't sound like a very future-proof plan... 
consider that Apple might put out a SoC in the future that rips out the 
AIC IPIs and leaves only the FIQ ones too.

>> +static void __exception_irq_entry aic_handle_irq_or_fiq(struct pt_regs *regs)
>> +{
>> +       u64 isr = read_sysreg(isr_el1);
>> +
>> +       if (isr & PSR_F_BIT)
>> +               aic_handle_fiq(regs);
>> +
>> +       if (isr & PSR_I_BIT)
>> +               aic_handle_irq(regs);
>> +}
> 
> Having the shared entry point here looks reasonable to me though, it
> does seem to make a few things easier.
> 
> I wonder if there is a possible race here: if we are ever in a situation
> where one of the two -- fiq or irq -- is disabled while the other one
> is enabled, we could get into a state where a handler is run while
> it should be masked.

That's a good point. We could filter with the SPSR_ELx mask bits here.

Though the FIQ support patch tries pretty hard to keep the mask bits in 
sync after early boot, so this concern might be somewhat academic. I'm 
happy to implement it if you think it might help though.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
