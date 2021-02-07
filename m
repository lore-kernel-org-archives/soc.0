Return-Path: <SRS0=gJAr=HJ=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F9FC433DB
	for <soc@archiver.kernel.org>; Sun,  7 Feb 2021 08:47:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3925464E76; Sun,  7 Feb 2021 08:47:32 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9420064E33;
	Sun,  7 Feb 2021 08:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9420064E33
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 0B62E4283E;
	Sun,  7 Feb 2021 08:47:24 +0000 (UTC)
To: Marc Zyngier <maz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-11-marcan@marcan.st> <87h7mpky0f.wl-maz@kernel.org>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 10/18] arm64: Introduce FIQ support
Message-ID: <2bfebb31-afb5-88a7-d092-87f88aa7367a@marcan.st>
Date: Sun, 7 Feb 2021 17:47:23 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87h7mpky0f.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 07/02/2021 00.37, Marc Zyngier wrote:
> See my digression in patch 8. I really wonder what the benefit is to
> treat FIQ independently of IRQ, and we might as well generalise
> this. We could always panic on getting a FIQ on platforms that don't
> expect one.
> 
> It'd be good to rope in the other interested parties (Mark for the
> early entry code, James for RAS and SError handling).

CCing Mark and James: TL;DR what do you think about unconditionally 
keeping DAIF.I == DAIF.F, would this break other platforms with spurious 
FIQs or conversely mask FIQs when we don't want to in some cases? The 
FIQ vector would remain a panic except on platforms that require using 
it, via an alternatives patch.

>>   	kernel_ventry	1, sync				// Synchronous EL1h
>>   	kernel_ventry	1, irq				// IRQ EL1h
>> -	kernel_ventry	1, fiq_invalid			// FIQ EL1h
>> +							// FIQ EL1h
>> +	kernel_ventry	1, fiq_invalid, 64, irq, ARM64_NEEDS_FIQ
> 
> It could be better to create a set of first class FIQ handlers rather
> than this alternative target macro. I quickly hacked this instead,
> which I find more readable.

I think I ended up with the macro change to keep it 1:1 with IRQ, vs a 
separate branch... but I didn't think of the fallthrough-with-nop trick, 
neat. It is definitely is more readable. Are you OK with me pulling this 
patch in for v2, with your name on it?

> -	kernel_ventry	0, fiq_invalid_compat, 32	// FIQ 32-bit EL0
> +	kernel_ventry	0, fiq, 32			// FIQ 32-bit EL0

fiq_compat here, right?

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
