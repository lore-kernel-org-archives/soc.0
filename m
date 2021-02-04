Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D7BC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 22:27:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7FED64DC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 22:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7FED64DC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mdSNkuHwsANqerRUWKZjQ+A6NOaIQQnI0ZzGARKPJDc=; b=JLH7CnkX8Vd6SoIaWDnuP4M5v
	6v6XMTdXStTa2eW4qHio4OAzc2jCmtUPiGNLZqgsRH1KzERx6w094YjWdmIoWaAVg50YkNyaKumPT
	LWCueoPgbGlWhBHMTbMJL5MZOsQweF1DH+VeT76+KMpFyYQVeVDm8U6inEDWJw8HLQEXjGbitjmR/
	+2ispcRf7p2OMlu030TLZfKq9dz31GifxWVDw60V0C3umyElj67MMXcMNDJaOmlLOCU2jzDeJyaZn
	BVXE/xhXaZal/Lr05RMjzZZhiO9jYQ04or4rqcDlBONWr6hKdR6iHoNExI1ZopihEqxDZdKBZpHOZ
	FhW6At8cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7n4s-00017i-8Z; Thu, 04 Feb 2021 22:26:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7n4o-00017L-JK
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 22:26:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9013264FB3
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-ot1-f43.google.com with SMTP id t25so5043225otc.5
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 04 Feb 2021 14:26:13 -0800 (PST)
X-Gm-Message-State: AOAM533ygOU7Z3WO61TvSMjqgja6tB8PY4KLvWev8mXejgi5ZxvpBS1P
 Rn3VeTiFOK+zdORpONyOZAq3pf9wpuiW3PVbB0s=
X-Google-Smtp-Source: ABdhPJzOHiGdUx2cu9wuOAFq0/n6sFfEAEZ9TgloKQwTcLdepLtlh7n1wUoJ4/+JPpNwwWFidFHieWop7No60XwJoY0=
X-Received: by 2002:a05:6830:139a:: with SMTP id
 d26mr1141432otq.305.1612477572788; 
 Thu, 04 Feb 2021 14:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-13-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-13-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 4 Feb 2021 23:25:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0yAowwZ4fpgR10MQ-c7-84BK+M9+pbmcQ5tKgw-YFabw@mail.gmail.com>
Message-ID: <CAK8P3a0yAowwZ4fpgR10MQ-c7-84BK+M9+pbmcQ5tKgw-YFabw@mail.gmail.com>
Subject: Re: [PATCH 12/18] arm64: setup: Use nGnRnE IO mappings for fixmap on
 Apple platforms
To: Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_172614_744034_78FFF87A 
X-CRM114-Status: GOOD (  20.88  )
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
Message-ID: <20210204222556.YmOYsgTFluZ9Eug3-iHmnh3Ppn2-K4PYyF3F_xdVzxY@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
