Return-Path: <SRS0=eMXW=HH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F9AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Feb 2021 10:35:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5895E64F3F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Feb 2021 10:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5895E64F3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6vdPvxhDKqdUBFvwL9FKyRYnrx4o/1YndZVUh7CmJsU=; b=CktzIdo/UwmmugWWdEGYLpF4d
	vDG8zqhzDJeQmEeMuTwbWtEeVddQsJEQfTviJg5I5KtSzHLWb/ASF3jQd/vj2jbQDcd65voRljtAA
	AGDyqhyHVhr9/R/rvl1hakKn5srD+nI05E3ubg0XCyvXn1esQ6NlE8stF700ly2Mfy3XLjDdEFBVk
	87AKdblva6OxDe/dGvx0lTe3y7wIMQqgclh52UYPFLaGrMTVuXTeosGx4t1E3lrXoobQXhAvP652v
	6uxFGhl02MU+DfD8jzIa5Yp71goSyypUasc8/Cwl2GlI1GJwh9Lm05OjeM5CiRhPHSD+G7QdynekP
	oNcdJ8lTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7yQr-000155-5c; Fri, 05 Feb 2021 10:33:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7yQo-00014j-Hl
 for linux-arm-kernel@lists.infradead.org; Fri, 05 Feb 2021 10:33:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B2F864F3F
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-ot1-f42.google.com with SMTP id k25so4310073otb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 05 Feb 2021 02:33:41 -0800 (PST)
X-Gm-Message-State: AOAM530FBe9Z51WlTYGuHoJNedGpuzhmyrPEeWS8lBGZiqyBpOBxWJ9x
 HxOi6a9oITsZtU1U7pkRmMiDLoO2E6PpilU07MU=
X-Google-Smtp-Source: ABdhPJzPYskcC90/zADjXOMBlboWtwZ3v91cEJ2E49yUlJtBBXIwl8x+Po8m9rw5tq+UxYLgHi/BBCFJWvaluWKDLic=
X-Received: by 2002:a05:6830:1256:: with SMTP id
 s22mr3000271otp.251.1612521220523; 
 Fri, 05 Feb 2021 02:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-16-marcan@marcan.st>
 <CAK8P3a1zbLM0s_GwkJ0AJQ8cocS-zcsWWKhOB7B99OtRYyDE7g@mail.gmail.com>
 <8adb1047-2b1a-9cfc-c906-3c369a8e494f@marcan.st>
 <CAK8P3a14vsLkCujd_XBAOAjL2h878gxkaoKPpaxL4jddZZcc-A@mail.gmail.com>
 <06620a31-ed81-5e3e-c81a-047d986769fd@marcan.st>
In-Reply-To: <06620a31-ed81-5e3e-c81a-047d986769fd@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Feb 2021 11:33:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3JRQoHJWzSTaNp4rp-Aed6Z2b+LNev1YJWXjmuCS2G_g@mail.gmail.com>
Message-ID: <CAK8P3a3JRQoHJWzSTaNp4rp-Aed6Z2b+LNev1YJWXjmuCS2G_g@mail.gmail.com>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
To: "Hector Martin 'marcan'" <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_053342_741731_F9473552 
X-CRM114-Status: GOOD (  42.21  )
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
Message-ID: <20210205103324.u9NGWpwW8aixV74jBYcU2R4XvkJtljSON_Q-woWultc@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
