Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C07C433E0
	for <soc@archiver.kernel.org>; Fri,  5 Feb 2021 10:33:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 92C2A64F3B; Fri,  5 Feb 2021 10:33:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 639A864F41;
	Fri,  5 Feb 2021 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612521221;
	bh=vgXds0QGocK6w6/E/vlEWbn7ODL5JMFTg0TABymV1QM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DTLhi+3UG+5sqciBVtRbliGoo//g3Sv8NqQnDu8TFpGy3sTHPoAFGkbs5h3ZzXSbV
	 aHJl+PIhXWoJwYYccXLiN6dNsyScL6+Ks5QeqiiEsB6n7VpwcpaHdmHcZBQMPrrDoK
	 SMDarUm1t/BFMv1vbkfh1Yz6oMuVLLAAyQOC1FngBmymb+6nMhDy9RQkdM0tJDxpP9
	 1YHmWdn4PbdSOKyQ0u0g2s4dTRsqeMiRXdgV/EX+iDI3K/82SZtHV3hSZA9Zso891q
	 w6FFkDkiW1cn5xgF2B9GzcPHz6sdmz2LEx1RY5NNz8+xRm5tpP1vwXTPF9lxuCF9mP
	 30qmGa7xPmZ0A==
Received: by mail-ot1-f43.google.com with SMTP id o12so6370375ote.12;
        Fri, 05 Feb 2021 02:33:41 -0800 (PST)
X-Gm-Message-State: AOAM533P5All8/sT5C2QKV881F8KXcD9Yy4ai80v5+E5qRDBK/h2niZq
	IW5ke5+ix9yT+DcY1JdLQZLCwdnZJvwvxoAIe2U=
X-Google-Smtp-Source: ABdhPJzPYskcC90/zADjXOMBlboWtwZ3v91cEJ2E49yUlJtBBXIwl8x+Po8m9rw5tq+UxYLgHi/BBCFJWvaluWKDLic=
X-Received: by 2002:a05:6830:1256:: with SMTP id s22mr3000271otp.251.1612521220523;
 Fri, 05 Feb 2021 02:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-16-marcan@marcan.st>
 <CAK8P3a1zbLM0s_GwkJ0AJQ8cocS-zcsWWKhOB7B99OtRYyDE7g@mail.gmail.com>
 <8adb1047-2b1a-9cfc-c906-3c369a8e494f@marcan.st> <CAK8P3a14vsLkCujd_XBAOAjL2h878gxkaoKPpaxL4jddZZcc-A@mail.gmail.com>
 <06620a31-ed81-5e3e-c81a-047d986769fd@marcan.st>
In-Reply-To: <06620a31-ed81-5e3e-c81a-047d986769fd@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Feb 2021 11:33:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3JRQoHJWzSTaNp4rp-Aed6Z2b+LNev1YJWXjmuCS2G_g@mail.gmail.com>
Message-ID: <CAK8P3a3JRQoHJWzSTaNp4rp-Aed6Z2b+LNev1YJWXjmuCS2G_g@mail.gmail.com>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
To: "Hector Martin 'marcan'" <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 5, 2021 at 8:41 AM Hector Martin 'marcan' <marcan@marcan.st> wrote:
>
> On 05/02/2021 08.04, Arnd Bergmann wrote:
> > On Thu, Feb 4, 2021 at 11:06 PM Hector Martin 'marcan' <marcan@marcan.st> wrote:
> >> If we split it up again, one of the two still needs to be the root,
> >> decide whether what fired is an IRQ or FIQ, and dispatch accordingly. Or
> >> we could have three nodes and have one root handler dispatch to IRQ and
> >> FIQ nodes, but that sounds like overkill... (?)
> >
> > Maybe I'm misreading the low-level entry code, but my impression
> > was that the fiq and irq exception vectors could just be pointed to
> > two different root drivers from the code in kernel_ventry
>
> Certainly, but we'd have to introduce a fiq handler global and duplicate
> the handler code; this is what was done in the previous submission, but
> I seem to recall someone (Marc?) mentioned it would be cleaner to just
> merge them into the single IRQ path and discriminate in the irqchip,
> which is what I did here.
>
> I can certainly go with either solution; I don't have a strong
> preference here.
>
> Advantages of split path:
>
> * More orthogonal
>
> Advantages of merged path:
>
> * Minimizes common vector changes needed for a single platform
> * Keeps FIQ/IRQ code common, so FIQs are less likely to be accidentally
> broken by people not testing on Apple platforms.
>
> Unclear:
>
> * Performance. Split path runs less code, merged path has lower icache
> pressure.
>
> >> Are you proposing just having different drivers/nodes in the same file,
> >> or implementing these as separate drivers in separate files?
> >
> > I was thinking of separate driver files.
>
> That's what I previously had then :)
>
> If this is the way to go I can certainly go back to that.

Marc is the authority on this one. I would prefer the split code
path, in particular if we end up using the FIQ just for the timer,
but if Marc (or Thomas, or the arm64 maintainers) has another
preference, do whatever they say.

> > I looked at other architectures, and found that at least powerpc
> > and sparc64 have a really minimal timer tick, with their timer_interrupt()
> > function getting called directly from the exception vector, and
> > doing a minimum of accounting (irq_enter(), statistics, ...) manually.
> >
> > It's a different question if we want to do that, or if there should always
> > be an irqchip for consistency.
>
> I think the issue here is that those platforms presumably have *one*
> timer hard wired to a specific exception vector (e.g. on PowerPC that's
> the decrementer). So, that setup is shared by all implementations in
> that platform.
>
> But on ARM64, the architectural timer is supposed to go through an
> irqchip (GIC in normal platforms), it's just that here it ended up
> hard-wired to FIQ - though not alone, since fast IPIs are also there, so
> we can't treat it as a strict "timer vector" either.
>
> So even if we could do this for Apple SoCs, it would be a non-standard
> setup, since every other ARM64 platform puts the timer behind an
> irqchip. Therefore, I think it makes sense to always go through an
> irqchip, rather than introduce a bypass for these SoCs.
>
> Also worth noting that we have at least two functional hardware timers
> here (not sure if there are more, we run with HCR_EL2.E2H=1 in m1n1
> which maps the EL2 timer to be the EL1 timer; I'm not yet sure if
> setting that to 0 will expose extra HV timers or not) wired to the same
> FIQ. I confirmed that both the virtual and physical timers function
> independently in m1n1.
>
> I did confirm there are no secure timers, which is expected given that
> there is no EL3 on these chips.

I think the simplest implementation would be for the top-level fiq
handler to default to whatever it does today (complain, I suppose),
but have the arch timer call set_handle_fiq() in order to redirect
it to a custom entry point that does the irq_enter() etc bits and
then calls arch_timer_handler_phys.

Whatever solution we pick will end up weird and ugly, so why not
pick the one that takes the least amount of code ;-)

> I think this shouldn't pose much of a problem, since IPIs aren't exposed
> in the DT anyway. As long as we decide how we're handling IRQs vs FIQs
> (one or two nodes/drivers), then either of them could take
> responsibility for handling IPIs depending on the platform. We should
> probably just add a "fast-ipi" property to both nodes on platforms that
> support that, so that the drivers can make the decision based on it. Or
> perhaps that should be done with different compatibles?

If it gets modeled as a separate irqchip with a separate driver, I would
also use a different compatible string for the fiq. If it gets integrated
straight into the timer code, that would be a custom compatible string
for that timer.

        Arnd
