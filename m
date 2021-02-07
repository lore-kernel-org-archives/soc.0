Return-Path: <SRS0=gJAr=HJ=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97581C433E0
	for <soc@archiver.kernel.org>; Sun,  7 Feb 2021 15:38:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5E89D64E43; Sun,  7 Feb 2021 15:38:56 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F51464D9D;
	Sun,  7 Feb 2021 15:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F51464D9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 9836E4285A;
	Sun,  7 Feb 2021 15:38:47 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-11-marcan@marcan.st> <87h7mpky0f.wl-maz@kernel.org>
 <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
 <cb721f28-d5e9-3381-2d04-746c0aa2a0d3@marcan.st>
 <CAK8P3a1R51_nqfMWG7SxScJNJEQ3qvp-cynABKEDaQ4O9REM=Q@mail.gmail.com>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 10/18] arm64: Introduce FIQ support
Message-ID: <df54df32-088a-c707-9ffd-e099878548bc@marcan.st>
Date: Mon, 8 Feb 2021 00:38:44 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1R51_nqfMWG7SxScJNJEQ3qvp-cynABKEDaQ4O9REM=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 07/02/2021 21.25, Arnd Bergmann wrote:
> On Sun, Feb 7, 2021 at 9:36 AM Hector Martin 'marcan' <marcan@marcan.st> wrote:
>> On 07/02/2021 01.22, Arnd Bergmann wrote:
>>> * In the fiq handler code, check if normal interrupts were enabled
>>>     when the fiq hit. Normally they are enabled, so just proceed to
>>>     handle the timer and ipi directly
>>>
>>> * if irq was disabled, defer the handling by doing a self-ipi
>>>     through the aic's ipi method, and handle it from there
>>>     when dealing with the next interrupt once interrupts get
>>>     enabled.
>>>
>>> This would be similar to the soft-disable feature on powerpc, which
>>> never actually turns off interrupts from regular kernel code but
>>> just checks a flag in local_irq_enable that gets set when a
>>> hardirq happened.
>>
>> Case #2 seems messy. In AIC, we'd have to either:
>>
>> * Disable FIQs, and hope that doesn't confuse any save/restore code
>> going on, then set a flag and check it in *both* the IRQ and FIQ path
>> since either might trigger depending on what happens next, or
>> * Mask the relevant timer, which we'd then need to make sure does not
>> confuse the timer code (Unmask it again when we fire the interrupt? But
>> what if the timer code intended to mask it in the interim?)
> 
> I'm not quite following here. The IRQ should be disabled the entire time
> while handling that self-IPI and the timer top half code, so if we get
> another FIQ while handling the timer from the IRQ path, it will lead
> either yet another self-IPI or it will be ignored in case the previous timer
> event has not been Acked yet. I would expect that both cases are
> race-free here, the only time that the FIQ needs to be disabled is
> while actually handling the FIQ. Did I miss something?

FIQs are level-triggered, and there are only two* ways of masking them 
(that we know of): in the timer, or DAIF. That means that if we get a 
FIQ, we *must* do one of two things: either mask it in the timer 
register, or mask FIQs entirely. If we do neither of these, we get a FIQ 
storm.

So if a timer FIQ fires while IRQs are disabled, and we can't call into 
the timer code (because IRQs were disabled, so we need to defer handling 
via the IPI), the only other options are to either poke the timer mask 
bit directly, or to mask FIQs. Neither seems particularly correct.

* An exception seems to be non-HV timer interrupts firing while we have 
a VM guest running (HCR_EL2.TGE=0). This causes a single FIQ, and no 
more, which suggests there is a mask bit for guest timer FIQs somewhere 
that gets automatically set when the FIQ is delivered to the CPU core. 
I've yet to find where this bit lives, I'll be doing a brute force sweep 
of system register space soon to see if I can find it, and if there is 
anything else useful near it.

>> Plus I don't know if the vector entry code and other scaffolding between
>> the vector and the AIC driver would be happy with, effectively,
>> recursive interrupts. This could work with a carefully controlled path
>> to make sure it doesn't break things, but I'm not so sure about the
>> current "just point FIQ and IRQ to the same place" approach here.
> 
> If we do what I described above, the FIQ and IRQ entry would have
> to be separate and only arrive in the same code path when calling
> into drivers/clocksource/arm_arch_timer.c. It's not recursive there
> because that part is only called when IRQ is disabled, and no IRQ
> is being executed while the FIQ hits.

Right, that's what i'm saying; we can't re-use the IRQ handler like Marc 
proposed, because I don't think that expects to be called reentrantly; 
we'd have to have a separate FIQ entry, but since it can be called with 
IRQs enabled and handle the FIQ in-line, it also needs to be able to 
*conditionally* behave like a normal IRQ handler. This level of 
complexity seems somewhat dubious, just to not maintain the FIQ mask bit 
synced. That's not just AIC code any more, it needs a bespoke FIQ vector 
and logic to decide whether IRQs are masked (call AIC to self-IPI 
without doing the usual IRQ processing) or unmasked (go through regular 
IRQ accounting and behave like an IRQ).

Perhaps I'm misunderstanding what you're proposing here or how this 
would work :)

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
