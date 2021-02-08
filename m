Return-Path: <SRS0=ELH+=HK=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1A7C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 23:34:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5A06064E82; Mon,  8 Feb 2021 23:34:19 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F00264E25;
	Mon,  8 Feb 2021 23:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F00264E25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 3926141F47;
	Mon,  8 Feb 2021 23:34:12 +0000 (UTC)
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
 <df54df32-088a-c707-9ffd-e099878548bc@marcan.st>
 <CAK8P3a1vmUJ0EpzU2+u2gy8WHCVV5ur9u-oTzU2BP=ddbXQeLQ@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 10/18] arm64: Introduce FIQ support
Message-ID: <2eecb7cb-1065-9eab-adad-409f10906062@marcan.st>
Date: Tue, 9 Feb 2021 08:34:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1vmUJ0EpzU2+u2gy8WHCVV5ur9u-oTzU2BP=ddbXQeLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 08/02/2021 03.49, Arnd Bergmann wrote:
> Ok, I had not realized the timer was level triggered. In case of the
> timer, I suppose it could be either masked or acknowledged from the
> fiq top-half handler when deferring to irq, but I agree that it means a
> layering violation in either case.
> 
> What might still work is an approach where FIQ is normally enabled,
> and local_irq_disable() leaves it on, while local_irq_enable() turns
> it on regardless of the current state.
> 
> In this case, the fiq handler could run the timer function if interrupts
> are enabled but just turn off fiqs when they are turned off, waiting
> for the next local_irq_enable() to get us back in the state where
> the handler can run.  Not sure if that would buy us anything though,
> or if that still requires platform specific conditionals in common code.

It looks like Marc is just leaning towards making the IRQ and FIQ masks 
track each other unconditionally on all platforms anyway, so I'm going 
to try that for v2 (which is certainly the simpler solution). If this 
ends up somehow breaking any other platform we can deal with it in the 
way that makes most sense, once we know how it breaks :)

>> * An exception seems to be non-HV timer interrupts firing while we have
>> a VM guest running (HCR_EL2.TGE=0). This causes a single FIQ, and no
>> more, which suggests there is a mask bit for guest timer FIQs somewhere
>> that gets automatically set when the FIQ is delivered to the CPU core.
>> I've yet to find where this bit lives, I'll be doing a brute force sweep
>> of system register space soon to see if I can find it, and if there is
>> anything else useful near it.
> 
> Right. Maybe you can even find a bit that switches between FIQ and
> IRQ mode for the timer, as that would solve the problem completely.
> I think it's not that rare for irqchips to be configurable to either route
> an interrupt one way or the other.

That seems increasingly unlikely here; I tried poking all the AIC config 
bits and nothing switched those to FIQ (which is the converse). It looks 
like Apple has done something like use FIQ for all core-internal 
interrupt sources, and IRQ for AIC, and this is all seemingly quite 
hardwired.

In particular, a subtlety I discovered about how flipping TGE to 1 with 
a guest timer interrupt pending only takes effect properly (i.e. FIQ 
fires, and you get a FIQ storm if unhandled, no auto-masking) after 
subsequently issuing an isb, makes me think all this FIQ stuff is 
seriously deeply tied into the instruction pipeline. It's probably not 
an IRQ line any more...

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
