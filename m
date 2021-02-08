Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC72DC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 11:14:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EFC064E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 11:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EFC064E79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=98ls/ZYyW153+S/i6OLgDkuyIkbBak6py+QJ1mi9ADI=; b=mcpfnaEFyVyVPGnBhb02CLUt2
	rN/RVCxGswA5uLvu/G6PtEoINv6npgdO7Nmqeh+LebpXFoI7i1PIj9Z63p949p2maek4dFDK6qTqt
	tK4VBNHFbmpAP5kC31tOLOn3YArpZeP4s0quNaY8ytni0VPaukNqaN9Ofw4w44qe98hvgQvsDnsrg
	pLCmS8mT/2zLkduECNQOxPbY7HX7rQ22ZPhB7zpLJwPGrmOuQgHnctxi86BNvmu+SlI51Khd98Vjm
	c9/xvX4OLBlb/cR0kTAKHL4eRxUCDVhkWm3X0TvedW5OsRH8C4xB2d3OuQIGHUsCBwawxwrFJscmn
	l6kDAiw6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l94U1-00056h-Pv; Mon, 08 Feb 2021 11:13:33 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l94Ty-00056M-Sn
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 11:13:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 4CE7A41EE3;
 Mon,  8 Feb 2021 11:13:25 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>, Marc Zyngier <maz@kernel.org>
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
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_061331_055366_F5408650 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208111322._PCsW11VelV7tLJHluR53lORzADdEBk3oZzM4BpRyLo@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
