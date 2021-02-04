Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B19EC433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 22:26:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C09E164FB8; Thu,  4 Feb 2021 22:26:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 981D564FB6;
	Thu,  4 Feb 2021 22:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612477573;
	bh=KjIBjaYHLW3RyEKLTEir+xU82zCibODHPpljfcktMGo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dNHQ/88Ky8ydAszkKtaQocwUTGGH2nRn7G0J16J1zG90/VPtNF/LtOKVG6s3kXhYM
	 enSDNhBxJsOWTfbuFh11unvif8C7jfwD62t/OT4u9+ZlKdZE346egrQH8o2YJcHwaV
	 ifRsep4cvMobYBZej3dF72dc3ceK1BISOCOO5bPb+ydfOObvIP76R1fZ+m602hrd6R
	 botOkt8FohR6I4z3kl1jVf0hRi7hxgbhlcDOKSEZXM642JeUaKBsNTO25IxIc7St4c
	 fOhQRGc1pgpOUQL6b84qcUCsZF/SFlg1pnuQTKkDfyfH3WreC2mH01FJ6Dh7ihv36k
	 /VxScsasXz1Rg==
Received: by mail-ot1-f41.google.com with SMTP id e70so4996462ote.11;
        Thu, 04 Feb 2021 14:26:13 -0800 (PST)
X-Gm-Message-State: AOAM532bLEkPi7CMRzVqWRUkiVy0NxokEsYqi5EM1VQagRPPahteseHg
	/v3v/HmovqxmScnCXgQ27ySvhkFZSA5YupSnnDA=
X-Google-Smtp-Source: ABdhPJzOHiGdUx2cu9wuOAFq0/n6sFfEAEZ9TgloKQwTcLdepLtlh7n1wUoJ4/+JPpNwwWFidFHieWop7No60XwJoY0=
X-Received: by 2002:a05:6830:139a:: with SMTP id d26mr1141432otq.305.1612477572788;
 Thu, 04 Feb 2021 14:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-13-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-13-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 4 Feb 2021 23:25:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0yAowwZ4fpgR10MQ-c7-84BK+M9+pbmcQ5tKgw-YFabw@mail.gmail.com>
Message-ID: <CAK8P3a0yAowwZ4fpgR10MQ-c7-84BK+M9+pbmcQ5tKgw-YFabw@mail.gmail.com>
Subject: Re: [PATCH 12/18] arm64: setup: Use nGnRnE IO mappings for fixmap on
 Apple platforms
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:
>
> This is a hack. I do not expect this to be merged as-is.
>
> The problem: on Apple ARM platforms, SoC MMIO needs to use nGnRnE
> mappings: writes using nGnRE are blackholed. This seems to be by design,
> and there doesn't seem to be any fabric configuration or other bit we
> can flip to make the problem go away.
>
> Particularly tricky is that this affects earlycon, which uses fixmap,
> which all gets initialized before any of the usual cpufeatures /
> alternatives stuff. So we need to take care of fixmap very early.
>
> Options I can think of:
>
> (1) Unconditionally use nGnRnE on all platforms for fixmap IO. Maybe
>     this is actually fine? I suspect it might break some PCI-based
>     earlycons?
>
> (2) Deal with this special case in the earlycon code, since that seems
>     to be the only user that matters on these platforms. Since the
>     IO mapping is done in earlycon.c, this will require some cooperation
>     with samsung_tty.c so earlycon knows when it needs to do this. Note
>     that doing it with DT properties will break cmdline-only earlycon
>     config (which otherwise works fine on this driver).
>
> (3) This patch, but do something saner, like use a specific DT flag to
>     trigger this mode instead of a platform match.
>
> Any other ideas?

I think we should decide the approach for the normal ioremap()
path first. Once we have solved that, there is likely an obvious
answer for this one as well.

My feeling is that we'll end up with (2).

        Arnd
