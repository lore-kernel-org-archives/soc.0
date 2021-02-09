Return-Path: <SRS0=VmVe=HL=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D18C433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 06:20:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BF77964EBE; Tue,  9 Feb 2021 06:20:38 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4693D64E54;
	Tue,  9 Feb 2021 06:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4693D64E54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A46B941F47;
	Tue,  9 Feb 2021 06:20:31 +0000 (UTC)
To: Marc Zyngier <maz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-16-marcan@marcan.st> <87eehqlxlr.wl-maz@kernel.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
Message-ID: <1a8d801d-3b02-8909-52e2-28ca5d67f48e@marcan.st>
Date: Tue, 9 Feb 2021 15:20:29 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87eehqlxlr.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 08/02/2021 18.25, Marc Zyngier wrote:
> I really do not want to expose IPIs in the DT. The OS defines what
> IPIs are used for, not the firmware/HW. No other platform requires
> this either, so is there any reason to do so?

This is used internally by the chained IPI driver (patch #16), but it 
does not need to be ever used in the DT. I guess it would be appropriate 
to just not document it in the bindings, and also use a higher type than 
2 (e.g. 0xff), so that if we ever have to add another type to the 
binding (e.g. the timer on older SoCs) it doesn't have to skip the 
number 2 to avoid breaking compat between newer DTs and older drivers.

See irq-bcm2836.c for the same approach: a chained IPI controller using 
an otherwise undocumented IRQ binding.

Another approach is to do what irq-armada-370-xp.c does: just ditch the 
chained irqchip and call handle_domain_irq into the IPI domain directly 
from the main IRQ handler function.

>> +#include <linux/irqchip/chained_irq.h>
> 
> There isn't any chained interrupt controller here, AFAICT.

This goes with patch #16, I'll move it there.

> If these functions have no impact on the per-CPU interrupts, then
> maybe these interrupts should be given a different irqchip.

Same IRQ domain, different irqchip? That sounds reasonable and gets rid 
of the bounds check on the mask/unmask calls, I'll do it for v2. This 
chip would apply for both IPIs (where a different register set in AIC 
for  masking/unmasking applies, but that is handled at the chained 
irqchip level in #16) and FIQs (which have no masking).

>> +static void aic_irq_eoi(struct irq_data *d)
>> +{
>> +	/*
>> +	 * Reading the interrupt reason automatically acknowledges and masks
>> +	 * the IRQ, so we just unmask it here if needed.
>> +	 */
>> +	if (!irqd_irq_disabled(d) && !irqd_irq_masked(d))
>> +		aic_irq_unmask(d);
> 
> This doesn't apply to per-CPU interrupts, right? Or does it?

The auto-masking does apply to IPIs, but this code doesn't do the 
unmasking. That is handled in the chained IPI domain in #16

*Strictly speaking* if we separate the responsibility at AIC for the 
root handler and say the chained handler should purely be a multiplexer 
for IPIs that doesn't touch the hardware at all, then the 
masking/unmasking should move here (into another irqchip) and the IPI 
domain code should just call into the root domain to mask/unmask the 
sole used hardware IPI; the current approach is a minor layering 
violation but... I'm not sure how useful it is to keep the layering 
pristine when both drivers live in the same file and are instantiated 
together anyway.

If I switch to the irq-armada-370-xp.c model where there is no logical 
chaining, then this would be fine as-is as both domains would logically 
represent driving different parts of AIC in parallel, with no nesting 
relationship.

>> +		u32 type = event >> 16, irq = event & 0xffff;
> 
> Nit: please consider introducing masks and using the bitfield macros
> to extract the various fields.

Ack, will do.

>> +		/* AIC_EVENT is read-sensitive, ensure it happens before we proceed */
>> +		isb();
> 
> You seem to have a data dependency after this, so I can't see how the
> ISB influences the read from AIC_EVENT. However you need to order it
> with the read from the timer registers, and I believe it'd be better
> to move the barrier there.

(Keeping the barrier story in the other thread)

>> +		if (type == AIC_EVENT_TYPE_HW) {
>> +			handle_domain_irq(aic_irqc->hw_domain, irq, regs);
>> +		} else if (type == AIC_EVENT_TYPE_IPI) {
>> +			handle_domain_irq(aic_irqc->hw_domain,
>> +					  ic->nr_hw + AIC_NR_FIQ + irq - 1, regs);
> 
> nit: it would be slightly less cumbersome to compute the hwirq in a
> switch, and have a single call to handle_domain_irq().
> 
> I also wonder whether using two top-level domains would be better. Not
> a big deal though.

Exactly :) I can certainly switch to that if you have no objection. It 
should have lower overhead for IPIs anyway, and removes the fwspec step 
to glue it all together.

>> +		} else {
>> +			pr_err("spurious IRQ event %d, %d\n", type, irq);
> 
> Spurious interrupts aren't an error, in general. If you really want to
> keep this, at the very least make it rate-limited.

In this case it's more like "unknown IRQ event", which better be an 
error because it means the chip is doing something we don't know about - 
*except* the zero case, that's just a spurious IRQ which indeed isn't an 
error (peripheral asserted and deasserted IRQ before we could handle it; 
I need to check but I believe AIC would just withdraw the event in that 
case).

So the zero case should be ignored and the unknown case should be fine 
without rate limiting, because it really shouldn't happen, ever. I'll 
fix the zero case for v2.

> Consider turning the whole thing into a do{}while() so that there is
> only a single read of AIC_EVENT in the function.

Ack.

>> +	/*
>> +	 * It would be really nice to find a system register that lets us get the FIQ source
>> +	 * state without having to peek down into clients...
>> +	 */
> 
> nit: please try to keep comments within the 80 cols limit. I don't
> mind code being wider, but comments benefit from being more rigorously
> structured.

Ack, I'll keep it in mind. For this one I just used clang-format as a 
first-pass and made some minor changes, so please do point out any other 
style nits I missed so I can keep it in check. I know it doesn't enforce 
nor fully represent kernel style.

> And yes, having to poll each end-point IP is really a drag. How does
> the PMU work on this system? Is there any other per-CPU source?

PMU also ends up in FIQ, and it's nonstandard (not the ARM Performance 
Monitors extension). That means one more FIQ source is going to have to 
end up here, and one more downstream register to poll (a proprietary one 
in this case: SYS_PMCR0 is s3_1_c15_c0_0, not to be confused with the 
standard SYS_PMCR_EL0 which is completely different).

So the FIQ sources to be polled are the following:

1. HV timers
2. Guest timers (auto-masked, mask register TBD, I still have no idea 
how XNU routes these to the hypervisor framework... haven't found the 
code yet, or the mask register)
3. Fast IPIs (not currently implemented)
4 Apple PMU

We have #1, I'll look for the mask bits to properly implement #2, #3 can 
wait until we actually implement those, and #4 can wait until we 
implement that PMU. Does that sound OK?

If you think it's worth it, I could at least check the status registers 
for #3 and #4 and yell loudly, so that if we somehow end up with a FIQ 
storm because those paths went off unchecked, at least we have logs. Or 
just make sure to mask them in the AIC init code, or both.

Since these are per-CPU, setting the masks is a per-cpu call, so that 
needs to go via something like cpuhp_setup_state_nocalls to run on CPU 
bring-up.

That said: PMC seems to have IRQ settings to go via AIC instead of FIQ, 
but I have no idea if that works on these CPUs; XNU only uses it on 
older ones. That should probably be investigated later.

> This system runs VHE, so there is also CNT{P,V}_CTL_EL02 to consider.
> But I really wonder how the whole thing works once these two timers
> are assigned to a guest. Somehow, something must control the masking,
> otherwise you wouldn't be able to enter a guest with a timer firing.

Yeah, as I mentioned on IRC, there is auto-masking for the guest timers, 
somehow. I'll find that mask bit.

> It also means that there is no way to have threaded per-CPU
> interrupts, which means no Preempt-RT. You could wire the mask/unmask
> callbacks to mess with the IMASK bit in individual timers, but that
> doesn't solve the problem for guests.

For HV timers, we're probably have to mess with IMASK here if there is 
no other way... I need to read through the timer code and make sure that 
wouldn't confuse it, as that creates a bit of an implicit contract here.

It'd be great if I can find a true status/mask register for FIQs, but 
I'm not holding my breath that it exists...

> Are all interrupts level? How are MSIs implemented?

Seems a fixed set of MSIs are routed into AIC, presumably transformed 
into level lines? I need to look into this part in more detail.

>> +	irqc->hw_domain =
>> +		irq_domain_add_linear(node,
>> +				      irqc->nr_hw + AIC_NR_FIQ + AIC_NR_IPI,
>> +				      &aic_irq_domain_ops, irqc);
> 
> Please keep assignments on a single line.

I think this one was one of those clang-format things :-).

I'll fix it and watch out for similar things.

>> +	for (i = 0; i < BITS_TO_LONGS(irqc->nr_hw); i++)
> 
> long is 64bit on arm64, so this loop is unlikely to do what you
> want. Consider using BITS_TO_U32.

Ha, nice catch. Thanks!

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
