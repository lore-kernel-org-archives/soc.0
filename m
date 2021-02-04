Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BEFC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 22:45:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD31364FA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 22:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD31364FA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xCZ+0usdY8YG3Ad4qtsl7Xzb26BOZIjOB+24fuNJ3Bw=; b=gvTexByTNQkNmAO4h4kWJJVJz
	iBBI+ugwSrLkhKlYqtZf+QEmWgBZKqLY/wKcGflhq+Ae9CoP4hWILtqnHGqIoWfHfphhWLo9J+lIH
	Lm6c/6fAsaZu+puAOr6kzvHqmEEjjmKdvphMWPPBJ5FqmPYoWOi5CKwnPx81SifWApozQMoj1TX/d
	PPHhPSpEFK3YrGuuzABFaf61bcIRJddHjuSICu9/L3xv7RVFcVFKxQNHSzXl7VpQ33dnREdTJepqT
	bbLGfYT4YyZZwPx9dvunx4ok4jPoLocm9YcMHNye6UAM1oFGIjw+wr6PHFdS1U68zqL4qNFKFRXcj
	cqPZbYSsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7nLW-0001vH-Oe; Thu, 04 Feb 2021 22:43:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7nLT-0001ug-KO
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 22:43:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8062364FAA
 for <linux-arm-kernel@lists.infradead.org>;
 Thu,  4 Feb 2021 22:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612478606;
 bh=e/9zh2CsuoUsEVu7An8X+JK+FFMiI5Q34YnmGfItAJI=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=H7FzlsyePJgvO7eCuKnKcgV7N0R1AhSb+a0Vfp8q/foork7rp8hUthudZg/4763b4
 tB0LLYgDowS4nuEF2j7eg+y78uDJ7fovDdJq3gu9LzJLHLzfLiHPHLEGwTrztq39G0
 FgSczjy1ltAtxVpvKjgVLqZO/R2wPPS3wtXb8c5ToKcd1yGP3qgqsuyEteVAecN+fJ
 AweCNVKqqegTEk3gdzJn/rbgMKTVixtyG6HlSdYPm+R7tRhtSldO72eChSu1lu7yDN
 IUYa1E1I5lyh0VbtU0H+X40vDt7Ru8PHTmR3uvsEIPULba57ib0EFqLh/PwY047cU6
 AaPSvaX/n9+eA==
Received: by mail-ot1-f47.google.com with SMTP id f6so5059513ots.9
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 04 Feb 2021 14:43:26 -0800 (PST)
X-Gm-Message-State: AOAM530cZP+UUxM56N5pM0RluezA/61wZvBnNF0vt65HLTxdvKY+28mK
 8tseiS5lsztZ6/mz7iq84gyui+HNAu20wudn6IQ=
X-Google-Smtp-Source: ABdhPJxA94SY7Aqy8BVsehX47e6XMhYLqLdg6UNVt1sfx5we4WzYHWl3ShMWqtP61czb/qPG9wH2fB8PhktTCyAUW5g=
X-Received: by 2002:a9d:741a:: with SMTP id n26mr1233804otk.210.1612478605704; 
 Thu, 04 Feb 2021 14:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 4 Feb 2021 23:43:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0an_b=xkVkGGPaHuXKxYCfJK0McZWXmOa_Zokz=SYpyw@mail.gmail.com>
Message-ID: <CAK8P3a0an_b=xkVkGGPaHuXKxYCfJK0McZWXmOa_Zokz=SYpyw@mail.gmail.com>
Subject: Re: [PATCH 00/18] Apple M1 SoC platform bring-up
To: Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_174328_347973_74BF50BC 
X-CRM114-Status: GOOD (  23.43  )
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
Message-ID: <20210204224309.kwRmzECDTotgWs-lGSo2Ebj4ZaoKkTpkyEe-4tiXPNs@z>

On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:
>
> This series brings up initial support for the Apple M1 SoC, used in the
> 2020 Mac Mini, MacBook Pro, and MacBook Air models.

I like this a lot overall, great work!

As you probably know, the timing would be really tight for a merge
in 5.12, but if we can work out a solution for the FIQ and MMIO
problems quickly and you get Ack's from the relevant maintainers
(arch/arm64, serial, irqchip), I'd be happy to merge all of it through
the soc tree even fairly late this cycle.

> The following features are supported in this initial port:
>
> - UART (samsung-style) with earlycon support
> - Interrupts, including affinity and IPIs (Apple Interrupt Controller)
> - SMP (through standard spin-table support)
> - simplefb-based framebuffer

Side note about simplefb: Ard mentioned on IRC that there is
earlycon support in efifb but not in simplefb. Once we have
a u-boot based boot flow, it would be a great help for boot-time
debugging to use earlycon on the framebuffer for those that don't
have a special uart cable.

An alternative would be to rework the simplefb driver in some
form to allow earlycon without efifb. The earlycon support there
is actually fairly simple, but doing this would raise the question
of whether it can be shared between the two and possibly the
drm/kms based drivers.

> - Devicetree for the Mac Mini (should work for the others too at this
>   stage)
>
> The primary pain points of this port are:
>
> - Apple SoCs require FIQs, as the timers and "fast" IPIs are hardwired
>   to the FIQ interrupt line. This patchset introduces FIQ support through
>   the alternatives mechanism, so as to not affect other platforms,
>   implemented as simply merging IRQs and FIQs. The AIC driver takes care
>   of discriminating and routing IRQs to the right users.
>
> - These SoCs blackhole nGnRE writes to internal MMIO ranges, and require
>   nGnRnE. There is no obvious right solution to solve this. I do not
>   expect the two patches for that in this series to be merged as-is, but
>   the commit messages describe the problem and potential solutions. I
>   hope we can have a discussion and converge on the right approach to
>   solve this problem in the sanest way.

I would add here the cpu enable-method as a third point that needs to
be decided on before we can consider merging it. As I commented
in patch 18, staying with spin-table would be the easiest way to start,
but that means the risk of an incompatible DT change later on.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
