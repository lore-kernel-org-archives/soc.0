Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E22C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 12:19:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0AD964E27
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 12:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0AD964E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=huLQokE2E4P3FbhPeQdGmrpHnGa3gcUDcWbB3kKJ47E=; b=IpwjbuYPaqr7C7UZoreyq3kUY
	F/X+NdoQ1ROczYA3S55hhJXdaagssaYruK4/KJjeAPvAmVqoggQtWJvfvRv7MWiPkjyMYh6hw1Bu7
	cv53wc9gz8tmh1voTUW5S9zZIywSfV2DkAeY1rG7D/SoaSqeeFXV1C5vtfmMM1DTZEH8Fr3XXi91E
	LhtdnUYPy5Ko1J+pm4B4wpvGQ2PZCSCNFthLI4E43j/jsSubS25jc368XY/w83Tx+L1fBmUdI77X2
	aklrjZ/pzxBYbLPDyKALsTFLfLwV8ykw0RuJJXsgcP65gAcG0ynfbHyEeAsIOlO+gAIt+nZ9dXeWR
	tIi2Vr4EQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l95UE-0006uP-6Y; Mon, 08 Feb 2021 12:17:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l95UA-0006tB-Nz
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 12:17:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B271B64E29
 for <linux-arm-kernel@lists.infradead.org>;
 Mon,  8 Feb 2021 12:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612786665;
 bh=NWRUvqILU3TC4V99S41Wvy55h3VRfH2iD5z8cWzFHuE=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=QtvpiPHfCL14NNE/fZexhDCWeak/RjjpDOmDfIgE3Kl6WYVArKLnLx39MKIFkGN3q
 EeBWkfvnhfZk/nGdT9xJP5OeOqVS0Tv6i5/0Mg+Dr939RIdh8paU5Iu1uiI2354C9N
 bkBeTMt857DCV2MM8JPVcbKHpXAIaM2/vxtk3x4rTpScMpLeKdSVKgdsGXb0xDm7hj
 BB5hrMrOV1fENOqH1GO6Xdy6oVvkBWErs67nccFQEGOp2ZTuOMgicgLw1qM60HR/YL
 lIyIXRQy/JnL0qvdK49RiLAnL7ZchGZqm3kxh6NEHcJSFWf8bh8dGbG1/R/XadfkmZ
 piLxthF1cMNEA==
Received: by mail-ot1-f49.google.com with SMTP id l23so2301059otn.10
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 04:17:45 -0800 (PST)
X-Gm-Message-State: AOAM531ehxJHjrx8Y1MEzV8hmF529fwTSDOCJT2Fnx2KMjCzKhtJ8nMZ
 V9JfXnrOT9O7PCtjJfP4hUqPSPba+X1k0II+evU=
X-Google-Smtp-Source: ABdhPJx0mznwM3rQzniWbST+vBItl/qAX7vYiZqRSbpIYiu8Tqx4QFqeO+SHRgle4AvJ8oIe+HPeQZloOkEYAWSf9LM=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr3669989otb.305.1612786664913; 
 Mon, 08 Feb 2021 04:17:44 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-16-marcan@marcan.st>
 <87eehqlxlr.wl-maz@kernel.org>
 <CAK8P3a25eFFrMG-9QknFZ6Ckc3-gkiLK=jQdnyTMgn-z4X0RHQ@mail.gmail.com>
 <87a6selrkt.wl-maz@kernel.org>
In-Reply-To: <87a6selrkt.wl-maz@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 13:17:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1MuWWQM5FApQcqEtpKpcVOxh5nd=dV6E9qnb4oi=QvYg@mail.gmail.com>
Message-ID: <CAK8P3a1MuWWQM5FApQcqEtpKpcVOxh5nd=dV6E9qnb4oi=QvYg@mail.gmail.com>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_071746_947777_736E65F4 
X-CRM114-Status: GOOD (  22.50  )
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
Cc: DTML <devicetree@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208121728.aqnoZwyWP35ZRp501LGwcQV0_BR0e4eVwrvDhWqpMEQ@z>

On Mon, Feb 8, 2021 at 12:36 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 08 Feb 2021 10:29:23 +0000, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Mon, Feb 8, 2021 at 10:25 AM Marc Zyngier <maz@kernel.org> wrote:
> > > On Thu, 04 Feb 2021 20:39:48 +0000, Hector Martin <marcan@marcan.st> wrote:
> >
> > > > +{
> > > > +     return readl(ic->base + reg);
> > >
> > > Please consider using the _relaxed accessors, as I don't think any of
> > > these interacts with memory (apart from IPIs, of course).
> >
> > MSI interrupts require serializing with DMA, so at the minimum I think there
> > needs to be something that ensures that DMA from device into memory
> > has completed before delivering the completion interrupt to a driver. This
> > may already be implied when the AIC is entered, but this is hard to know
> > without actual hardware specs.
>
> If there is a sync with memory required, it should happen at the point
> where it is Acked, not when masked/unmasked or anything else. And
> given that you want to sync with an external agent (the DMA producer),
> the DMB generated by readl won't save you, as it only orders CPU
> accesses AFAICT.

If the dmb in readl() is not sufficient for preventing the speculative read
on DMA data from a device that sent the MSI, why is it sufficient for
the case in which any device driver relies on readl() from a device
register to ensure that DMA is complete?

I had expected those two cases to be equivalent.

> So if MSIs require some additional synchronisation we probably need a
> DSB somewhere if the HW doesn't guarantee ordering of DMA vs
> MSIs. Whether it does or not is anyone's bet.

Right, for all we know it could require a much more heavyweight barrier
as it does on certain broken SoCs, or nothing at all.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
