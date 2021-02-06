Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF886C433E0
	for <soc@archiver.kernel.org>; Sat,  6 Feb 2021 16:22:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6764964EBF; Sat,  6 Feb 2021 16:22:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 424AD64EBC;
	Sat,  6 Feb 2021 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612628563;
	bh=bB7lIDv6NLqdI1sNli6zYhmNZmrOsw1KJg5Z86kLR2U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UGfz/5Qla8V5bHkHPqcrav35IHSlUrDQlDYapiTo1UryHkdlq44Kqovml+zHtMMmO
	 lZ9NKdtJHJjJ6tcHrkh52pFT5EhrycQwUrv+MAXD9CmwppL/2TCo7/t+88g84w/2Z8
	 zYg3R3R3613Nt1vQ1itu0WeWV/KPIIZGPl/3CQjSu0AM9c02BDc6UxU9wzadWHP+3w
	 H6PnwNd3IiMA7svoUr85E33+J59+3VhY4n27uZskjdzKoe1S+Z2DhfQ/TB7cwPD7/A
	 eyO+sMF2lIpEqz+DODHp9uQmkJ81Edw4G+NpQM0o+Oejf23QoLdm69HgQl8RGsFUCF
	 d4ZeovTLyM5bQ==
Received: by mail-ot1-f41.google.com with SMTP id o12so10018443ote.12;
        Sat, 06 Feb 2021 08:22:43 -0800 (PST)
X-Gm-Message-State: AOAM533bzmxS9oY2VMbiA28Cxs4UqK5m1kae6lyjZu3tGrdyVZek5XJm
	HCpNd7VU7mwihjQ/0tqxc0UDF4d6k2+QeD+s1Ac=
X-Google-Smtp-Source: ABdhPJyYfibIxYnxW4TQFfaGgWwDmUbkgmJFwxSr5HqEvczYz27a8FLtWimMXB2/AG4NNqjlCTV35ARHAZLMjXTdl2w=
X-Received: by 2002:a9d:6c11:: with SMTP id f17mr4068079otq.210.1612628562566;
 Sat, 06 Feb 2021 08:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-11-marcan@marcan.st>
 <87h7mpky0f.wl-maz@kernel.org>
In-Reply-To: <87h7mpky0f.wl-maz@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 6 Feb 2021 17:22:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
Message-ID: <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
Subject: Re: [PATCH 10/18] arm64: Introduce FIQ support
To: Marc Zyngier <maz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Hector Martin <marcan@marcan.st>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 6, 2021 at 4:37 PM Marc Zyngier <maz@kernel.org> wrote:
> On Thu, 04 Feb 2021 20:39:43 +0000, Hector Martin <marcan@marcan.st> wrote:

> > diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> > index bf125c591116..6acfc372dc76 100644
> > --- a/arch/arm64/include/asm/assembler.h
> > +++ b/arch/arm64/include/asm/assembler.h
> > @@ -42,7 +42,11 @@
> >
> >       /* IRQ is the lowest priority flag, unconditionally unmask the rest. */
> >       .macro enable_da_f
> > +alternative_if ARM64_NEEDS_FIQ
> > +     msr     daifclr, #(8 | 4)
> > +alternative_else
> >       msr     daifclr, #(8 | 4 | 1)
> > +alternative_endif
>
> See my digression in patch 8. I really wonder what the benefit is to
> treat FIQ independently of IRQ, and we might as well generalise
> this. We could always panic on getting a FIQ on platforms that don't
> expect one.
>
> It'd be good to rope in the other interested parties (Mark for the
> early entry code, James for RAS and SError handling).

There might be another slightly hacky but less intrusive option
that could be done (almost) purely within the aic code:

* In the fiq handler code, check if normal interrupts were enabled
  when the fiq hit. Normally they are enabled, so just proceed to
  handle the timer and ipi directly

* if irq was disabled, defer the handling by doing a self-ipi
  through the aic's ipi method, and handle it from there
  when dealing with the next interrupt once interrupts get
  enabled.

This would be similar to the soft-disable feature on powerpc, which
never actually turns off interrupts from regular kernel code but
just checks a flag in local_irq_enable that gets set when a
hardirq happened.

          Arnd
