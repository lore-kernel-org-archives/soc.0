Return-Path: <SRS0=gJAr=HJ=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7915C433E0
	for <soc@archiver.kernel.org>; Sun,  7 Feb 2021 08:36:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7F98B64E33; Sun,  7 Feb 2021 08:36:20 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0272764E30;
	Sun,  7 Feb 2021 08:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0272764E30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 3A3F742856;
	Sun,  7 Feb 2021 08:36:14 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>, Marc Zyngier <maz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-11-marcan@marcan.st> <87h7mpky0f.wl-maz@kernel.org>
 <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 10/18] arm64: Introduce FIQ support
Message-ID: <cb721f28-d5e9-3381-2d04-746c0aa2a0d3@marcan.st>
Date: Sun, 7 Feb 2021 17:36:12 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 07/02/2021 01.22, Arnd Bergmann wrote:
> * In the fiq handler code, check if normal interrupts were enabled
>    when the fiq hit. Normally they are enabled, so just proceed to
>    handle the timer and ipi directly
> 
> * if irq was disabled, defer the handling by doing a self-ipi
>    through the aic's ipi method, and handle it from there
>    when dealing with the next interrupt once interrupts get
>    enabled.
> 
> This would be similar to the soft-disable feature on powerpc, which
> never actually turns off interrupts from regular kernel code but
> just checks a flag in local_irq_enable that gets set when a
> hardirq happened.

Case #2 seems messy. In AIC, we'd have to either:

* Disable FIQs, and hope that doesn't confuse any save/restore code 
going on, then set a flag and check it in *both* the IRQ and FIQ path 
since either might trigger depending on what happens next, or
* Mask the relevant timer, which we'd then need to make sure does not 
confuse the timer code (Unmask it again when we fire the interrupt? But 
what if the timer code intended to mask it in the interim?)

Neither sounds particularly clean to me... if we had FIQ status masking 
registers this would be more reasonable, but I'm not sure I'd want the 
AIC driver to mess with neither DAIF nor the timer registers. It's bad 
enough that it has to read the latter already (and I hope I can find a 
better way of doing that...).

Plus I don't know if the vector entry code and other scaffolding between 
the vector and the AIC driver would be happy with, effectively, 
recursive interrupts. This could work with a carefully controlled path 
to make sure it doesn't break things, but I'm not so sure about the 
current "just point FIQ and IRQ to the same place" approach here.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
