Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4483C433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 22:43:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A6A9164FB0; Thu,  4 Feb 2021 22:43:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A29B64F9C;
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
Received: by mail-ot1-f54.google.com with SMTP id e70so5036806ote.11;
        Thu, 04 Feb 2021 14:43:26 -0800 (PST)
X-Gm-Message-State: AOAM531153W4Gzk/oHAmBFTMLQU1ZaF6rovW/O8v6KnTeV4/7Ie8nG9W
	hE+T/vqBfpSOmkkHF8I3Y7GDkSE5Y/f+9fW3guo=
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
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

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
