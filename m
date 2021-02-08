Return-Path: <SRS0=ELH+=HK=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE00C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 15:51:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4723264E42; Mon,  8 Feb 2021 15:51:17 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D900601FE;
	Mon,  8 Feb 2021 15:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D900601FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id DE5D94207F;
	Mon,  8 Feb 2021 15:51:11 +0000 (UTC)
Subject: Re: [PATCH 08/18] arm64: cpufeature: Add a feature for FIQ support
To: Marc Zyngier <maz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-9-marcan@marcan.st> <87im75l2lp.wl-maz@kernel.org>
 <d110504f-2461-8b41-72cc-72681d775a97@marcan.st>
 <87czxalrwc.wl-maz@kernel.org>
From: Hector Martin <marcan@marcan.st>
Message-ID: <271fc761-d782-31b8-d97b-907041f15289@marcan.st>
Date: Tue, 9 Feb 2021 00:51:09 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87czxalrwc.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

On 08/02/2021 20.29, Marc Zyngier wrote:
> I'm not sure we want to trust the FW on that particular front (no
> offence intended...;-).

Hey, I don't even *use* the timers IRQs; if they are unmasked it's 
iBoot's fault! :-)

> That is my current take on this patch. Nothing in the arm64 kernel
> expects a FIQ today, so *when* a FIQ fires is pretty much irrelevant,
> as long as we handle it properly (panic). Keeping the two bits in sync
> is trivial, and shouldn't carry material overhead.

Sounds good then, and again that simplifies a ton of stuff. Will go for 
that in v2.

> Aside from the lack of programmable priority, the lack of convenient
> masking for per-CPU interrupts is a bit of an issue...

Yeah... we'll see how that goes.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
