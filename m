Return-Path: <ardb@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D44EC433F5
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 18:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCDC1C36AEB; Mon, 20 Dec 2021 18:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D28AC36AE2;
	Mon, 20 Dec 2021 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640024195;
	bh=h+NW89AGBo6EiKlAFelqirMX1MHQX+AuokpMIPahgmo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mpeddQ2YDuZMhWVtYM+PE0roUaM0uQ9YvYFpsq+Yo1ksbKsEMVoJMu5ZoFwVHgtCH
	 8JVrCrp/1UqmmwTE2sYs/o27F1nVWmxcvNbs4RyEz6u42f95fLnl+ds1dvIV/GFbhA
	 lO3lms7ZFx1U3884ZI+bgVsyAcGN6fkgVLmGTaeWXVc3D5XGfy5wGvXkKCejkGVYJS
	 gGEYPosG2IsVY9G8wF1KRDjlDkitS0hRAuN6+LrIDJCvZWIfydbdqrwzP0j2+Yh42N
	 GyQfYj144P+QdzW7Zi5laoFFRr222eHQBbsjWlSW/SoOJx82PluH9AyjXjpwv7JnwJ
	 HTaP1isrv7OUg==
Received: by mail-wr1-f49.google.com with SMTP id r17so21477356wrc.3;
        Mon, 20 Dec 2021 10:16:35 -0800 (PST)
X-Gm-Message-State: AOAM533MkIH/kanSt+dciHtPMi82uFAu7rx6KHW9w8U5UolP9zEdNERe
	VY5YZ9gTwlguVRU92daZnahxlu/Rz/Pd/XG8HPM=
X-Google-Smtp-Source: ABdhPJxy0tbabpM28cpctYqNx7As4wTx70PIRuvKXBVel3ECyk6u1sNEwOAs6oiLUfECQyOcHy15H6A9235ctQPQI/Q=
X-Received: by 2002:adf:bbd0:: with SMTP id z16mr13802072wrg.447.1640024193989;
 Mon, 20 Dec 2021 10:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20211218085843.212497-1-cuigaosheng1@huawei.com>
 <CAK8P3a1-0u4VCCfgc7tjmnANM0yr7oUrQX2y-ZSVvZHDN191BQ@mail.gmail.com> <YcDGDLScE+3ZlU8/@lunn.ch>
In-Reply-To: <YcDGDLScE+3ZlU8/@lunn.ch>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 20 Dec 2021 19:16:22 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH15CDm1no41V-VvS6-jYLv72R65SPZfBbVAeWWhmR0KA@mail.gmail.com>
Message-ID: <CAMj1kXH15CDm1no41V-VvS6-jYLv72R65SPZfBbVAeWWhmR0KA@mail.gmail.com>
Subject: Re: [PATCH -next 0/3] replace open coded VA->PA calculation
To: Andrew Lunn <andrew@lunn.ch>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, SoC Team <soc@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, gongruiqi1@huawei.com, 
	wangweiyang2@huawei.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Dec 2021 at 19:06, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Dec 20, 2021 at 04:39:43PM +0100, Arnd Bergmann wrote:
> > On Sat, Dec 18, 2021 at 9:58 AM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
> > >
> > > These patches replace an open coded calculation to obtain the physical
> > > address of a far symbol with a call to the new ldr_l etc macro, and they
> > > belong to the kaslr patch set of arm32.
> > >
> > > Reference: https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=arm-kaslr-latest
> > >
> > > Ard Biesheuvel (3):
> > >   arm-soc: exynos: replace open coded VA->PA conversions
> > >   arm-soc: mvebu: replace open coded VA->PA conversion
> > >   arm-soc: various: replace open coded VA->PA calculation
> >
> > Usually these patches should go through the respective platform
> > maintainer trees,
> > and from there into the soc tree, but time is a little short here.
> >
> > I could apply them directly with the maintainer Acks
>
> Sorry, but this is too low level for me to understand what is going
> on, and so feel confident actually giving an ACK for the mvebu change.
>
> Should the resulting assembly be exactly the same? Has the submitter
> disassembled the object code and shown there is no actual difference
> in the assembler output?
>

The assembly does not stay the same, that is really the point of these
patches: to replace hard to understand pointer arithmetic with simple
position independent macro invocations.

However, I don't think it really makes sense at this point to merge
these: the KASLR patches are ancient and never constituted more than a
proof of concept, so grabbing bits and pieces of it arbitrarily seems
rather pointless. Note that there is an effort underway to implement a
4/4 VM split for ARM, which has a huge impact on KASLR, and so those
changes need a lot of work and discussion before we can proceed with
them.

So in summary, NACK for this series.
