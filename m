Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E09C4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 19:36:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D505C23CD0; Wed,  9 Dec 2020 19:36:19 +0000 (UTC)
X-Gm-Message-State: AOAM5333EWwaO8UscCXIbVKbp6V3IlGRBHiJI9iGJFisBWG9V4g5uPsR
	dDT8YZAD/rij1AMWyXgcPrBFY699yPC7hxlKHAc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607542579;
	bh=VqGnt0gnCBq2XFTaHCtcBoF5qU7wh0Pq+jlJJEnM1D0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pCKZMZqh9+eNW1OkQlphxJG++lxcGERwyyf401tbuNyW6Ek4RG98BcdxAqlNXiME4
	 q+0yrp+rcy+41G56QmOVsFbz6zP6JWMetgVybocGNbwtAIvIXYEC6aVWcpdyuJkMPV
	 WalUL3yJ9YsLreRrlqd99UVxvs5eDh0wNBznOUoaY+eyHXyfK4i8kl3/iKhUuwJ8vy
	 gTpQ/I5frddVoBonQD6ZQATgTfwJw8vPfc/NQNbKOxouS58ltssL6hKCql+L5R0eun
	 uVDIx0mLFipPUGQMJjQck2ntCf4Sh0gEGJ/0uAzo7AREnNSzwia3DJ7N3KMa3T9eQX
	 JutQ8i6gnyfhQ==
X-Google-Smtp-Source: ABdhPJy0fnvTfPUHgyjQjSXPQbPYmkD+dDgA2AMXpY1gS7GmNLTl0gYSwe/kDO3lbQAbVZjgo4aD42ahalIRatN/waE=
X-Received: by 2002:a4a:3b81:: with SMTP id s123mr3207354oos.15.1607542578978;
 Wed, 09 Dec 2020 11:36:18 -0800 (PST)
MIME-Version: 1.0
References: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
 <CAK8P3a3J6tMELTO-Fzq_3a9mdYJ=zDDzG-0M2fUmGN8pUOjnfg@mail.gmail.com> <ee069c7c-c86d-2fa7-ab44-243483fdf108@monstr.eu>
In-Reply-To: <ee069c7c-c86d-2fa7-ab44-243483fdf108@monstr.eu>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 20:36:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1C_hrRV4WW+K_dHfnZCaC8bnteSe-a78eOM3fcoiT2Qw@mail.gmail.com>
Message-ID: <CAK8P3a1C_hrRV4WW+K_dHfnZCaC8bnteSe-a78eOM3fcoiT2Qw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.11
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	arm-soc <arm@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 7:06 PM Michal Simek <monstr@monstr.eu> wrote:
> On 09. 12. 20 18:01, Arnd Bergmann wrote:
> > On Wed, Dec 9, 2020 at 3:51 PM Michal Simek <monstr@monstr.eu> wrote:
> >>
> >> Hi,
> >>
> >> please pull the following changes to your tree. The tree is based on
> >> zynqmp-soc-fixes-for-v5.10-rc6 tag or acfdd18591ea ("firmware: xilinx:
> >> Use hash-table for api feature check") which went to v5.10-rc6.
> >
> > Is it necessary that this is based on top of the bugfix? This means
> > I'd have to do a backmerged of -rc4 into my dt tree, which is something
> > I would prefer to avoid.
>
> The patch from Zou Wei is fixing the hash table patch merge in rc6.
> If you think I should drop it and send it after rc1 I am fine with it.
> Just let me know which way you prefer.

Ah, I see. I thought you meant this was a bugfix that was already
merged in -rc6 and you based the other patches on top of the
bugfix.

Since it's technically a regression fix, I'll cherry-pick this one for
v5.10.

      Arnd
