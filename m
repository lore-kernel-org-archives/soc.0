Return-Path: <SRS0=h8h3=HJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA91C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 08:48:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF5064E35
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 08:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF5064E35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zanBiYQaWSxo3qUNnQf5TnsQFOVvTCTXPMvMJtXLfws=; b=y2T1CK4s4IrEJNia5cwN8w6az
	/WnrSLJesR68O3KkSS64IYygfT7IOf+nVnUGBZO967KpW365xjo0iuNimJBwU/ptFvZGqgmvSO8b4
	PttCLIoZovCxgnTCNhGpUG2E7w5N+Hjumv4rVcXJhW8k86qtGKbw4VywObv1PfqCZzMzb2egjzUXe
	4R4zINZhO3qlA7ZrO70966Jr228mGQqDzQ4NfHV5t/T4Winc9Lr2vn5kGai6YWPSqOs4MqVZ5NEmC
	bRIbxi7OTiylC2tGsNH1/OkuYFtWJNLPvBLA1l42rjO62ySnsPBtGf6k0Aa+ruNJv98bmMSiVFYOQ
	MYn1IP7jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8fjB-0002Eh-LY; Sun, 07 Feb 2021 08:47:33 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8fj8-0002EM-FR
 for linux-arm-kernel@lists.infradead.org; Sun, 07 Feb 2021 08:47:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 0B62E4283E;
 Sun,  7 Feb 2021 08:47:24 +0000 (UTC)
To: Marc Zyngier <maz@kernel.org>
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
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_034730_706396_C5481891 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, James Morse <james.morse@arm.com>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210207084723.CrcUN1p_Zt5CPa1rw0eMyj4eRvP3nSG9H8y1TP6ZPw0@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
