Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0A8C433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 23:08:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 22A3464FB3; Thu,  4 Feb 2021 23:08:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E636D64FAE;
	Thu,  4 Feb 2021 23:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612480104;
	bh=lGAiTppQQ/0C6EUbyqXF6XF9gQYyK5MEz4wybY4KmSo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=r8G7A8jHN6cRgolLUzhjA9OyGgKp87gpP/R7cV7sOKiJHoJ8uGJhXbK7cu1cr8fI9
	 qLlmthmlfU58UFENsenUNbttptMFhrMlUmPL4FuBoOxpGql0ABnCSlwfKXlv+dmV9s
	 TvdG+KPLoxmKYt69hZMz9WUpOXbEkfxQyffrYq2pd5+tXusvsc6xSd6Ek4brb2Bqd7
	 r3W2QvTptUy4eCnM8ux/2yx7gO5kSDAsiAxIN2enZM1RcaWX+N7HHURRnVFq4mGVcL
	 RwVr7I3FxvjA2Rwqij2GICZFP41U94hwtLO2dcafrox1GJcQktr2ttlrZYt4IERLgq
	 tJFCuc3ItZCrA==
Received: by mail-ot1-f41.google.com with SMTP id k25so3023101otb.4;
        Thu, 04 Feb 2021 15:08:23 -0800 (PST)
X-Gm-Message-State: AOAM532h7ynYjxvbpnbBI/6J/tJitA1vzJeQzVxJ5aiokhE/jVQ57zJz
	6nmgXiEJJchnyJKAG4cLnBFSUqo/Jy8+3Xs+t2I=
X-Google-Smtp-Source: ABdhPJyAtb8VtJYcphzzBXiGxDDtreYAG0q01vcVCWQSQA45vFgL+t+pPaoS4Lt1cl6LfRdRy5YIrtyl+QSYZILiN1s=
X-Received: by 2002:a05:6830:139a:: with SMTP id d26mr1248095otq.305.1612480103175;
 Thu, 04 Feb 2021 15:08:23 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-19-marcan@marcan.st>
 <CAK8P3a3v6emxavbyjFhY+WdvH1t4EPMZSjEsSx0M+cRqjRCO1g@mail.gmail.com> <de236d0c-579d-c0d9-8d60-77f30889f50c@marcan.st>
In-Reply-To: <de236d0c-579d-c0d9-8d60-77f30889f50c@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Feb 2021 00:08:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2DawQA-PD5aqbkVPB7UxuohN0oe9mJPe8488pUryotJQ@mail.gmail.com>
Message-ID: <CAK8P3a2DawQA-PD5aqbkVPB7UxuohN0oe9mJPe8488pUryotJQ@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1) devicetree
To: "Hector Martin 'marcan'" <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 10:44 PM Hector Martin 'marcan' <marcan@marcan.st> wrote:
> On 05/02/2021 06.29, Arnd Bergmann wrote:
> > On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:
> >
> > We tend to split the dts file into one file per SoC and one for the
> > specific board. I guess in this case the split can be slightly different,
> > but it does feel better to be prepared for sharing a lot of the contents
> > between the different products.
> >
> > In most cases, you'd want the 'aliases' and 'chosen' nodes to be
> > in the board specific file.
>
> I thought about that, but wasn't sure if splitting it up at this early
> stage made much sense since I'm not sure what the split should be, given
> all supported hardware is the same for all 3 released devices.
>
> I'm happy to throw the aliases/chosen nodes into board specific files if
> you think that's a good starting point. Perhaps /memory too? Those
> properties are filled in/patched by the bootloader anyway...

Yes, I think that would help make it more consistent with other
platforms even if we don't care too much here.

> There are also DT overlays; I was wondering if we could use those to
> keep the hierarchy and avoid having many duplicate trees in a
> hypothetical bootloader that embeds support for a large set of hardware,
> having it construct the final devicetree on the fly from SoC + a board
> overlay (and possibly further levels); but I'm not sure how that ties in
> with the device trees that live in the Linux tree. Do you have any
> pointers about this?

We don't really have overlays in the kernel sources (yet), though it
is something that keeps coming up. For the moment, I'd just
assume you can have one .dts file for each thing you want to
support and keep the shared bits in .dtsi files.

> >
> > Did you see the discussion on the #armlinux channel about the possibility
> > of moving the cpu-enable method to PSCI based on a UEFI runtime
> > interface?
...
>
> I saw it go by but need to review it again; I've been missing too much
> sleep this week :) thanks for the reminder.
>
> I think we might want to start with spin-table for now, given that there
> are no kernel changes needed anyway, but I'm happy to take the protoype
> for a spin (:)) and try implementing it in m1n1.
>
> I do think it's valuable for whatever we do, at this stage, to not
> require u-boot; having that be an integral part of the boot chain is
> perfectly fine in the future but right now it helps to have a simple
> boot chain while we work out the early bring-up, and while u-boot grows
> the required support.

Agreed.

       Arnd
