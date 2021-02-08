Return-Path: <SRS0=ELH+=HK=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72396C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 11:13:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3B6BF64E50; Mon,  8 Feb 2021 11:13:32 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D4464E30;
	Mon,  8 Feb 2021 11:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D4464E30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 4CE7A41EE3;
	Mon,  8 Feb 2021 11:13:25 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>, Marc Zyngier <maz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-16-marcan@marcan.st> <87eehqlxlr.wl-maz@kernel.org>
 <CAK8P3a25eFFrMG-9QknFZ6Ckc3-gkiLK=jQdnyTMgn-z4X0RHQ@mail.gmail.com>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
Message-ID: <0a1a9d20-ad4e-27e8-0356-567d519653cc@marcan.st>
Date: Mon, 8 Feb 2021 20:13:22 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a25eFFrMG-9QknFZ6Ckc3-gkiLK=jQdnyTMgn-z4X0RHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 08/02/2021 19.29, Arnd Bergmann wrote:
> On Mon, Feb 8, 2021 at 10:25 AM Marc Zyngier <maz@kernel.org> wrote:
>> On Thu, 04 Feb 2021 20:39:48 +0000, Hector Martin <marcan@marcan.st> wrote:
> 
>>> +{
>>> +     return readl(ic->base + reg);
>>
>> Please consider using the _relaxed accessors, as I don't think any of
>> these interacts with memory (apart from IPIs, of course).
> 
> MSI interrupts require serializing with DMA, so at the minimum I think there
> needs to be something that ensures that DMA from device into memory
> has completed before delivering the completion interrupt to a driver. This
> may already be implied when the AIC is entered, but this is hard to know
> without actual hardware specs.
> 

I don't think this can be implied in any case, because if IRQ A fires 
and then the CPU speculates its way through AIC into the IRQ B handler, 
which reads DMA'd memory, then IRQ B fires and it has higher priority 
and *that* is what ends up getting returned from the event register 
first, the execution will commit with an ordering violation.

I'm pretty sure we need *some* level of explicit synchronization between 
reading the event register and actually delivering IRQs downstream. 
Using _relaxed might be okay, but we'd still need something where the 
isb() currently is in aic_handle_irq (though I admit I don't have a 
perfect picture of the memory ordering subtleties involved here yet).

Incidentally, just from the races and problems I've run into with 
trivial tests in m1n1, these CPUs seem to be *very* eager to speculate 
and I suspect they will help uncover race conditions in Linux...

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
