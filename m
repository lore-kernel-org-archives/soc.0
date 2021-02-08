Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149AAC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 11:23:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9880064DDF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 11:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9880064DDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IQsWtthLzfwyx0BWAq4pxwS4lXhHOdIfgQlSIXYB+1I=; b=u7fxKU/Sj4lv28e9p+2l8bFUh
	pyQjj55eUUMF03JLzk+BMZqOTzM/RMwgpaqwWjfBAO7Np08e3kBVhFZHKR9XNc8azDLNARki8ZxQL
	LEf0+BzqdAzOciMo5Z4byJZLu+SrMHjj10iZuE8rY1S1JDuHsOUsdIQc8gDEsxWm5LQaT4ehRImEg
	FEnuiH6azg1Kc4HryI5kfXVxeg//QhVS11sabA8bpBgHfn3SinPR0v29yMk6y/YsmyAs/LZjpMRnK
	s6Pxs1lqUvthrb+TLSm88wBLUK8MHsZvUwK6vK6g6cnvVkggyfVvMaa978eDO8rN5Rr3rCjozbnDU
	1VNa81AVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l94cU-0006V6-MT; Mon, 08 Feb 2021 11:22:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l94cS-0006UO-GF
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 11:22:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 377A064E30
 for <linux-arm-kernel@lists.infradead.org>;
 Mon,  8 Feb 2021 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612783335;
 bh=b1txGFAdYzZ9HG1GOF6ZDGKszC6QhJbPAityc8zNdKs=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=QlqpvxAtblbM3JS3Gkw+eKew1K+1fgRsc8nMrwTzrYm11efBn3xtMSq4tGCBaVpXO
 kNbs/dzIgXv+KKnIewLWdLuhjZvYuCZL5x4ioVsJt+CO4WO/2jcmI0RqSXO6RQHmS+
 wid04rUxSZkp1SssDNKe8M+Cs+kDhZqtpgA+H6CKzdwy9g09DZ3xV+olJYTRWFR6cn
 puKwcItlSn9hauBCsx1xMCcdUfx48Wsl/mzEikeKdIhOQUFaD92lD8UqgonUsJ38Yl
 n1XhVkmV1MSt4F5BsdLHmxkHEvi98M82pBR89hEzZLFLnajv3pSP77//Vv0EhEarud
 hF/07V1OvLREw==
Received: by mail-oi1-f178.google.com with SMTP id y199so13195653oia.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 03:22:15 -0800 (PST)
X-Gm-Message-State: AOAM530ymid/gkfyxGENDzD29ILXaqXC717fJLCokQ7D9f2G1j/CGHFw
 bcexJQc63oqtGaYF4li71Ni8cJTetzZ3d01oZGU=
X-Google-Smtp-Source: ABdhPJxoXEs4lvsidmx9JghYRwAUNo2rEi8fSIBb67QJOho4aeKooaDDzWeHK7RYt9+j1p6VFopafDLNZ7LK9hY5sbc=
X-Received: by 2002:aca:d908:: with SMTP id q8mr10440873oig.67.1612783334397; 
 Mon, 08 Feb 2021 03:22:14 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-16-marcan@marcan.st>
 <87eehqlxlr.wl-maz@kernel.org>
 <CAK8P3a25eFFrMG-9QknFZ6Ckc3-gkiLK=jQdnyTMgn-z4X0RHQ@mail.gmail.com>
 <0a1a9d20-ad4e-27e8-0356-567d519653cc@marcan.st>
In-Reply-To: <0a1a9d20-ad4e-27e8-0356-567d519653cc@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 12:21:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1rKbZvKjgY5P=eWG3brVsWZgALOLR5P37aehLpqX92yw@mail.gmail.com>
Message-ID: <CAK8P3a1rKbZvKjgY5P=eWG3brVsWZgALOLR5P37aehLpqX92yw@mail.gmail.com>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
To: "Hector Martin 'marcan'" <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_062216_726542_7BDC9E05 
X-CRM114-Status: GOOD (  24.27  )
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
Cc: DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208112158.9-RDuSFTovgjTDFtD4Z55a56FEucCgl4IHEQyIo-7-Q@z>

On Mon, Feb 8, 2021 at 12:13 PM Hector Martin 'marcan' <marcan@marcan.st> wrote:
>
> On 08/02/2021 19.29, Arnd Bergmann wrote:
> > On Mon, Feb 8, 2021 at 10:25 AM Marc Zyngier <maz@kernel.org> wrote:
> >> On Thu, 04 Feb 2021 20:39:48 +0000, Hector Martin <marcan@marcan.st> wrote:
> >
> >>> +{
> >>> +     return readl(ic->base + reg);
> >>
> >> Please consider using the _relaxed accessors, as I don't think any of
> >> these interacts with memory (apart from IPIs, of course).
> >
> > MSI interrupts require serializing with DMA, so at the minimum I think there
> > needs to be something that ensures that DMA from device into memory
> > has completed before delivering the completion interrupt to a driver. This
> > may already be implied when the AIC is entered, but this is hard to know
> > without actual hardware specs.
> >
>
> I don't think this can be implied in any case, because if IRQ A fires
> and then the CPU speculates its way through AIC into the IRQ B handler,
> which reads DMA'd memory, then IRQ B fires and it has higher priority
> and *that* is what ends up getting returned from the event register
> first, the execution will commit with an ordering violation.
>
> I'm pretty sure we need *some* level of explicit synchronization between
> reading the event register and actually delivering IRQs downstream.
> Using _relaxed might be okay, but we'd still need something where the
> isb() currently is in aic_handle_irq (though I admit I don't have a
> perfect picture of the memory ordering subtleties involved here yet).

The idea of the barriers in readl/writel is to avoid having to guess these
subtleties, so maybe it's easier to start with the normal readl() and no
other barrier for an initial merge, as that should be sufficient, and then
do any optimizations in a later patch after everyone agrees what the
specific requirements are and much much time can be saved this way.

> Incidentally, just from the races and problems I've run into with
> trivial tests in m1n1, these CPUs seem to be *very* eager to speculate
> and I suspect they will help uncover race conditions in Linux...

Yes, that definitely helps.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
