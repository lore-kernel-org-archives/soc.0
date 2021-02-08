Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF813C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 11:22:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6AB9964E87; Mon,  8 Feb 2021 11:22:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D67864E50;
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
Received: by mail-oi1-f179.google.com with SMTP id m7so15167602oiw.12;
        Mon, 08 Feb 2021 03:22:15 -0800 (PST)
X-Gm-Message-State: AOAM532Gb8iBBaeLSV7MGWk2UD4A+qztSd5GCARYBhLC27g7h37jW1Qx
	l6Yl3nvNOw6JvsYN2+VFI/9LnPNw/iidVAkhttw=
X-Google-Smtp-Source: ABdhPJxoXEs4lvsidmx9JghYRwAUNo2rEi8fSIBb67QJOho4aeKooaDDzWeHK7RYt9+j1p6VFopafDLNZ7LK9hY5sbc=
X-Received: by 2002:aca:d908:: with SMTP id q8mr10440873oig.67.1612783334397;
 Mon, 08 Feb 2021 03:22:14 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-16-marcan@marcan.st>
 <87eehqlxlr.wl-maz@kernel.org> <CAK8P3a25eFFrMG-9QknFZ6Ckc3-gkiLK=jQdnyTMgn-z4X0RHQ@mail.gmail.com>
 <0a1a9d20-ad4e-27e8-0356-567d519653cc@marcan.st>
In-Reply-To: <0a1a9d20-ad4e-27e8-0356-567d519653cc@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 12:21:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1rKbZvKjgY5P=eWG3brVsWZgALOLR5P37aehLpqX92yw@mail.gmail.com>
Message-ID: <CAK8P3a1rKbZvKjgY5P=eWG3brVsWZgALOLR5P37aehLpqX92yw@mail.gmail.com>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
To: "Hector Martin 'marcan'" <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

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
