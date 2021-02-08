Return-Path: <SRS0=ELH+=HK=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22E7C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 15:48:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8F4FC64E7B; Mon,  8 Feb 2021 15:48:14 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E402864DAF;
	Mon,  8 Feb 2021 15:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E402864DAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 9F3BA4207F;
	Mon,  8 Feb 2021 15:48:07 +0000 (UTC)
Subject: Re: [PATCH 11/18] arm64: Kconfig: Require FIQ support for ARCH_APPLE
To: Marc Zyngier <maz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-12-marcan@marcan.st> <87ft29kxmp.wl-maz@kernel.org>
 <860b7dac-ccad-b6c9-c7be-537d6b1c5ede@marcan.st>
 <2a93bf0df74df8cb022e61d69d1de88e@kernel.org>
From: Hector Martin <marcan@marcan.st>
Message-ID: <4ed0001c-2196-5e54-9de0-e77236b2a306@marcan.st>
Date: Tue, 9 Feb 2021 00:48:05 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2a93bf0df74df8cb022e61d69d1de88e@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

On 08/02/2021 21.05, Marc Zyngier wrote:
>> I was trying to introduce the Kconfig before the code that depends on
>> it; is it kosher to have it in the other order, looking for CONFIG_
>> defines that don't exist yet?
> 
> Absolutely. The only requirement is to make sure that nothing breaks in
> the middle of a series.
> 
>> Though in this case the only user earlier in the series is the Samsung
>> stuff, which doesn't care about FIQs, so I can just sort things as
>> FIQ->ARCH_APPLE->samsung->AIC...
> 
> Seems fine to me. Sorting out the infrastructure first (FIQ, memory
> attributes) first is a requirement anyway, so the ordering of the
> series could reflect that priority.

Cool, that simplifies things.

>> I'm not sure about AIC vs. ARCH_APPLE though. Right now the pattern is
>> that AIC depends on ARCH_APPLE and also defaults to that. But then you
>> can build with ARCH_APPLE and AIC disabled if you so choose, which
>> does result in a broken system on these machines. AIC should build
>> without ARCH_APPLE (as long as we're on ARM64), so we could reverse
>> that.
> 
> As long as ARCH_APPLE selects AIC, you can make AIC selectable on
> its own. What I'm trying to avoid is people ending up with an unbootable
> system, and not having interrupts is one thing that makes it really hard
> to debug...

Sounds good, I'll flip it over.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
