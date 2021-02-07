Return-Path: <SRS0=h8h3=HJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D1AC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 12:26:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F13E764DF6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 12:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F13E764DF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pJ8vQEQ0TcYcR4BYfGPQu01VMn4ASv6iJ3nE1Re/tX4=; b=hdctaRnPMPN3HW24YsXjv3sn2
	/tJTLFhMhA5N9LTMQd4p4RElAGoZrP7jjk97bN/lfLJRkvwM8ag6Z5fVfiZ3aC2VjG6ZQM9mCeNG6
	8CcoUgPG97NBiRL8XnjYlP9in4zjBs/LGdYYi5zvfLhekTT8ro/zk7SkJrvdZ78G076NRfqwxYX+v
	n9vsM6IahCbgOQwt/j4x0s8cHKtX/LV9xTmsbUf3r4TInkj0aUNu7PLp6a1tNgoOdWrzDcsEV1SCC
	De2UnbAuQo7oJ1PQ1ASG4CRHMhO1So5r8NuIgtutDmEvbvzKDek9yz/uj4mz84R27w61DQifz1zbX
	ReWUZUT1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8j80-0004FV-QZ; Sun, 07 Feb 2021 12:25:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8j7x-0004Ex-GK
 for linux-arm-kernel@lists.infradead.org; Sun, 07 Feb 2021 12:25:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0502B64E4E
 for <linux-arm-kernel@lists.infradead.org>;
 Sun,  7 Feb 2021 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612700720;
 bh=XyIV0mQRY76asF3SEYLbYdKnyQG/xcH5nGqR8aL09QE=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=dWr0vbjS2hz95yn1KghsniexxA5hrho2hgnMPc5FQlxBEkGL75RnqxHV3S6Qlni80
 IuynGNgjTGBf4Mhoi69NyMTZsKvBFknA/5W5NFrrit+p6w4y3JW+SvgdiRr/nK48+D
 5ivndodJzJSHkgXu567enpc5xFuqbgRIRpjJgl/cmqCk7T7t3a2FFUhfdDsWxnE1Vh
 Zue6JD0G8TKA2ShDkwrTp0xvKwoBucoU0YgStvmPqSmgN7ep0TxciZHEJQkXYHBXOd
 NkCNDgNUANxR7JmajgFAv0TfXEfUUNEbWgN946G/qbltkflSbZlLAp5opLg2so02ER
 +f1TsK2eKONJg==
Received: by mail-oi1-f181.google.com with SMTP id 18so1676084oiz.7
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 07 Feb 2021 04:25:19 -0800 (PST)
X-Gm-Message-State: AOAM530FUvEdx25wCNQgXMAOihg0pf1693b+rALO6ma5Q4DpB53czJOp
 I7NrFJk6Ln9XpuutUKm4GJh+B9bczQp4GCi6E6U=
X-Google-Smtp-Source: ABdhPJxLK4Eh3P4gg7G+hL1MAzjTYsIn7CY2vh0qkD4hrNVz8zoUU5hpLDo+VeYS+1HxaswTc9+BVAPuAiIEqUo/imM=
X-Received: by 2002:aca:e103:: with SMTP id y3mr8152498oig.11.1612700719300;
 Sun, 07 Feb 2021 04:25:19 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-11-marcan@marcan.st>
 <87h7mpky0f.wl-maz@kernel.org>
 <CAK8P3a0-Qk1WAUaCWeX8Zypphpadan3YAOES9t7LFYBOJkXKog@mail.gmail.com>
 <cb721f28-d5e9-3381-2d04-746c0aa2a0d3@marcan.st>
In-Reply-To: <cb721f28-d5e9-3381-2d04-746c0aa2a0d3@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 7 Feb 2021 13:25:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1R51_nqfMWG7SxScJNJEQ3qvp-cynABKEDaQ4O9REM=Q@mail.gmail.com>
Message-ID: <CAK8P3a1R51_nqfMWG7SxScJNJEQ3qvp-cynABKEDaQ4O9REM=Q@mail.gmail.com>
Subject: Re: [PATCH 10/18] arm64: Introduce FIQ support
To: "Hector Martin 'marcan'" <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_072521_729218_41212AA8 
X-CRM114-Status: GOOD (  23.58  )
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
Message-ID: <20210207122503.mrKyMuNTNlZfzZ5ILkzsMRdypF5lNEc_HO7Sp4ppVIQ@z>

On Sun, Feb 7, 2021 at 9:36 AM Hector Martin 'marcan' <marcan@marcan.st> wrote:
> On 07/02/2021 01.22, Arnd Bergmann wrote:
> > * In the fiq handler code, check if normal interrupts were enabled
> >    when the fiq hit. Normally they are enabled, so just proceed to
> >    handle the timer and ipi directly
> >
> > * if irq was disabled, defer the handling by doing a self-ipi
> >    through the aic's ipi method, and handle it from there
> >    when dealing with the next interrupt once interrupts get
> >    enabled.
> >
> > This would be similar to the soft-disable feature on powerpc, which
> > never actually turns off interrupts from regular kernel code but
> > just checks a flag in local_irq_enable that gets set when a
> > hardirq happened.
>
> Case #2 seems messy. In AIC, we'd have to either:
>
> * Disable FIQs, and hope that doesn't confuse any save/restore code
> going on, then set a flag and check it in *both* the IRQ and FIQ path
> since either might trigger depending on what happens next, or
> * Mask the relevant timer, which we'd then need to make sure does not
> confuse the timer code (Unmask it again when we fire the interrupt? But
> what if the timer code intended to mask it in the interim?)

I'm not quite following here. The IRQ should be disabled the entire time
while handling that self-IPI and the timer top half code, so if we get
another FIQ while handling the timer from the IRQ path, it will lead
either yet another self-IPI or it will be ignored in case the previous timer
event has not been Acked yet. I would expect that both cases are
race-free here, the only time that the FIQ needs to be disabled is
while actually handling the FIQ. Did I miss something?

> Plus I don't know if the vector entry code and other scaffolding between
> the vector and the AIC driver would be happy with, effectively,
> recursive interrupts. This could work with a carefully controlled path
> to make sure it doesn't break things, but I'm not so sure about the
> current "just point FIQ and IRQ to the same place" approach here.

If we do what I described above, the FIQ and IRQ entry would have
to be separate and only arrive in the same code path when calling
into drivers/clocksource/arm_arch_timer.c. It's not recursive there
because that part is only called when IRQ is disabled, and no IRQ
is being executed while the FIQ hits.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
