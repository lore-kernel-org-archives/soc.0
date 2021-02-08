Return-Path: <SRS0=ELH+=HK=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872F8C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 16:14:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3B9A464E88; Mon,  8 Feb 2021 16:14:38 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54E864E85;
	Mon,  8 Feb 2021 16:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54E864E85
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id C510B4207F;
	Mon,  8 Feb 2021 16:14:32 +0000 (UTC)
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st> <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
 <e2bd8f99-58db-4cae-30b3-6fa608bc76dd@marcan.st>
 <20210208093625.trpm3tte2gw24w4l@kozik-lap>
From: Hector Martin <marcan@marcan.st>
Message-ID: <9d395524-7aa9-0c6f-33a8-0cd47f0a7633@marcan.st>
Date: Tue, 9 Feb 2021 01:14:30 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208093625.trpm3tte2gw24w4l@kozik-lap>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

On 08/02/2021 18.36, Krzysztof Kozlowski wrote:
> Please use the scripts/get_maintainers.pl to get the list of people to
> Cc. The script would point necessary folks.

I thought I'd try Thomas first since he introduced the IRQF_SHARED 
specifically, but I should've gone straight to maintainers (I did use 
get_maintainers.pl to find you).

> A different issue is that all your emails from this thread were marked
> by Google as spam.  I don't see any particular warning signs in the
> header so it looks more of content-based match for spam.

That's weird. Maybe it's because my server doesn't do DKIM yet, and they 
went through a mailing list? It's probably time to set that up...

>>> Either way, certainly not for Apple SoCs; I'll get rid of IRQF_SHARED
>>> for v2.
> 
> Please send a v2 after fixing issues pointed out by kbuild.

Will do, already have those fixed in my WIP tree.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
