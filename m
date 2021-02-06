Return-Path: <SRS0=0nBm=HI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E8CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 16:24:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85B4664DE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 16:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85B4664DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=40QFYI6GxJtr0UVQqjM/iW3wKmhpFv2E7+nx+daRcWY=; b=bXn9NbEbqTfCMX0tdBWBXFUZe
	PhvYjRsFEw25MOCurWZKcdPHRG6r+Hli+DxBUtlfi7OICgh2zwNomePI8TmXmOaZc+AO815SQRWFp
	hTsIQgdqnKiH3sCExpcdda8pg2vOh75poLugvqDjY2q60BQC0mgOTahmtAr0QXax8lEek0J7eelaf
	GIQtkj20J84qx6NTtk20HZlbJndPVOeRlxlkn7kJnMA4049jCmuD+Mek2dh4yI6OzCze3xHB8a3LL
	SLQZbxIV4+fBItOUcLUii+N7GhNbxFgiITX1OsSUW1plkTTN1g8ZOYrO1ZvR6QgxX66U4b3CtzZJz
	BzEGuqhGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8QMB-0005lH-6W; Sat, 06 Feb 2021 16:22:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8QM8-0005kv-FG
 for linux-arm-kernel@lists.infradead.org; Sat, 06 Feb 2021 16:22:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3687164EAC
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-ot1-f50.google.com with SMTP id 100so3372176otg.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 06 Feb 2021 08:22:43 -0800 (PST)
X-Gm-Message-State: AOAM531qfp/X4c1txAI1RYeT1R1mBhOiBSz0UvSAOMgI8m8OTelLdqia
 CcE3SmYL//qp5xzEUywv+iJOGTZVJyA2OPy63Jg=
X-Google-Smtp-Source: ABdhPJyYfibIxYnxW4TQFfaGgWwDmUbkgmJFwxSr5HqEvczYz27a8FLtWimMXB2/AG4NNqjlCTV35ARHAZLMjXTdl2w=
X-Received: by 2002:a9d:6c11:: with SMTP id f17mr4068079otq.210.1612628562566; 
 Sat, 06 Feb 2021 08:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-11-marcan@marcan.st>
 <87h7mpky0f.wl-maz@kernel.org>
In-Reply-To: <87h7mpky0f.wl-maz@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 6 Feb 2021 17:22:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
Message-ID: <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
Subject: Re: [PATCH 10/18] arm64: Introduce FIQ support
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_112244_597068_8D1463B5 
X-CRM114-Status: GOOD (  16.47  )
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
Message-ID: <20210206162226.wQinUkqNyNX944GzHRW6su05AR8mb1VMAv--AXQuET4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
