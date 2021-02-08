Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6451C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 15:32:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CFFA64DFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 15:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CFFA64DFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hUvmk3GAVQLu6fTEAzBJj+2eLwSn47nurDT78/vQBDE=; b=rkgq+GSpkdDS/KF4tN/SNrLZd
	SYd059i7f2NH43QPdbzAA9FfiJMeOtPQDewcwFnRU5dUQyCuHWiAI/rkwKLMwTn13Le5neYPgeaVF
	PSv3dAdrYdA9OXjl2w0LqvRgsYnxt6WkKrlzTRG3NhJMAAaODH74c7ABSL3Sj0zStNRdThFYDtx3E
	iyaV+EzV/d0dZsy5MPLp9YkEsB2TokNKHpi9e1DCKW1LpLpr4zUSoSQrjiH/PFWYb3Oh4sevORySz
	SolxZzGf6bnIacBDj3q9pTvMTa09P/o4ODU089Eo0+QgL3mceZ1gLI4l5COIH/LFaqyUU4tcq26me
	OpsnQtU9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l98Vd-0002Xe-Us; Mon, 08 Feb 2021 15:31:30 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l98Va-0002Wt-Lc
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 15:31:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id D408541F47;
 Mon,  8 Feb 2021 15:31:20 +0000 (UTC)
To: Marc Zyngier <maz@kernel.org>, Arnd Bergmann <arnd@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-16-marcan@marcan.st> <87eehqlxlr.wl-maz@kernel.org>
 <CAK8P3a25eFFrMG-9QknFZ6Ckc3-gkiLK=jQdnyTMgn-z4X0RHQ@mail.gmail.com>
 <87a6selrkt.wl-maz@kernel.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
Message-ID: <c699ab0c-39a0-6b0a-9409-db506ac6f824@marcan.st>
Date: Tue, 9 Feb 2021 00:31:18 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87a6selrkt.wl-maz@kernel.org>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_103126_826172_01B266AD 
X-CRM114-Status: GOOD (  19.41  )
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
Message-ID: <20210208153118.uPL2Ahmaw9ywofx7H_HUELJhoKcI7mEfx-_7I0nC-n0@z>

On 08/02/2021 20.36, Marc Zyngier wrote:
> On Mon, 08 Feb 2021 10:29:23 +0000,
> Arnd Bergmann <arnd@kernel.org> wrote:
>>
>> On Mon, Feb 8, 2021 at 10:25 AM Marc Zyngier <maz@kernel.org> wrote:
>>> On Thu, 04 Feb 2021 20:39:48 +0000, Hector Martin <marcan@marcan.st> wrote:
>>
>>>> +{
>>>> +     return readl(ic->base + reg);
>>>
>>> Please consider using the _relaxed accessors, as I don't think any of
>>> these interacts with memory (apart from IPIs, of course).
>>
>> MSI interrupts require serializing with DMA, so at the minimum I think there
>> needs to be something that ensures that DMA from device into memory
>> has completed before delivering the completion interrupt to a driver. This
>> may already be implied when the AIC is entered, but this is hard to know
>> without actual hardware specs.
> 
> If there is a sync with memory required, it should happen at the point
> where it is Acked, not when masked/unmasked or anything else. And
> given that you want to sync with an external agent (the DMA producer),
> the DMB generated by readl won't save you, as it only orders CPU
> accesses AFAICT.

Found an doc that talks about this, but then... how does the current 
Linux code work anyway for normal use cases?

https://elinux.org/images/7/73/Deacon-weak-to-weedy.pdf

That says dmb is not enough for DMA-control to DMA-data dependencies due 
to speculation, which is what we have here and the situation I described 
(with an IRQ along the way, but that's irrelevant). But that's what 
readl does: a read followed by a dmb(oshld) followed by a control 
dependency (but that needs an isb to take effect). How does this not 
break drivers that read DMA-accessed memory after a readl of a status 
register? I thought that was the point of the non-relaxed functions.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
