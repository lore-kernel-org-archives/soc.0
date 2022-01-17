Return-Path: <SRS0=OeQp=SB=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763BEC433FE
	for <soc@archiver.kernel.org>; Mon, 17 Jan 2022 14:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43D5DC36AE7; Mon, 17 Jan 2022 14:14:31 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CEFDBC36AE3;
	Mon, 17 Jan 2022 14:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CEFDBC36AE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ot1-f45.google.com ([209.85.210.45]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N1x6X-1mBoeg2egj-012FCU; Mon, 17 Jan 2022 15:14:27 +0100
Received: by mail-ot1-f45.google.com with SMTP id g1-20020a9d6481000000b00592d01f2b6eso15839474otl.5;
        Mon, 17 Jan 2022 06:14:27 -0800 (PST)
X-Gm-Message-State: AOAM530qB0GvpKgQUnXV4g1x+DiSsDT4ULRqMgdt35xuqpopkmNu7hrm
	hVVONVYyaCaPiGnybOP0cvPnjgF8EAElAWxDeaM=
X-Google-Smtp-Source: ABdhPJw1ZgWjaWLjO9h+cg20DOEimvvTBW13bNSm+HZXqb0f0qzN/HOYU/ee29hk5wVbuIP+kAiil5AV4Egwenxh/3Q=
X-Received: by 2002:a05:6830:2095:: with SMTP id y21mr14368395otq.368.1642428866253;
 Mon, 17 Jan 2022 06:14:26 -0800 (PST)
MIME-Version: 1.0
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122408epcas5p45053d1bf0acf2d8233a98b6c1abab6eb@epcas5p4.samsung.com>
 <20220113121143.22280-14-alim.akhtar@samsung.com> <53c17ddc-a049-72ed-7237-de23db7889da@canonical.com>
 <085801d80967$e4b8fe00$ae2afa00$@samsung.com> <5ab62673-8d46-ec1d-1c80-696421ab69ca@canonical.com>
 <00c901d80ba5$c9ae6ab0$5d0b4010$@samsung.com>
In-Reply-To: <00c901d80ba5$c9ae6ab0$5d0b4010$@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Jan 2022 15:14:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a31bCHNcNWrLX+QW+4RuK=DBpxLA_j5BFKxXxXKCT8PFQ@mail.gmail.com>
Message-ID: <CAK8P3a31bCHNcNWrLX+QW+4RuK=DBpxLA_j5BFKxXxXKCT8PFQ@mail.gmail.com>
Subject: Re: [PATCH 13/23] dt-bindings: arm: add Tesla FSD ARM SoC
To: Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Rob Herring <robh+dt@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, 
	linux-fsd@tesla.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:g+jCPTy3Uqml0SJv++bKfJNN2VXp2+GoyA6SEccAyqKyOCTx60o
 UBWq5xbuF+P2bDwHQZXpZOB2qRzIXrP0agAA3aB2ch0qIYGwgfY1vUyn0GOIVMigDhr/7mN
 C8vBUhIEBOBYyYiUlEDIvTQaRT3AtPmH8542qPJ6YmU/cde4EyuMMWrCSUeChJVivPkChCx
 rxscd0jtszQPkd6fpclOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yrEN+I+7DYQ=:wJ5jhZF/Tl765eTX8pQikI
 JQV/xsX4FnuBSn15l4rFbeVoI+gZvSJRInSKnnrgQpsO8qCKF+wwssrPU80ijSUw5L1EVSCZX
 5brCTowKcXPNgsU58KRHojRi3dezdqQ+8pAsPdRYglGHNLkpn8i616oBJjKkB7yxfbcjjI7td
 uCCSK5HgAUISuAP2fOc6Ljn7724bbiMLx3uB8MxNeh13jnQR0H8ufizInvlk4Aa/tSUzY2P5R
 UEmIxTm6OCxPl97dIlc3p00wskwuNVedBtv8I2nzMovA6j174c2yIBD5KywYbx4H+BOJtMt8V
 SIhJ3fspfNfLNR7oi4vrI9h1jM0X7rxjFCtNg/9gd5ElHGvnlTebsc+OwKx1PN2SnDIxNfM7W
 gN1uOkvSjuZ8gbw4WEVjy4y+fjTcbMXGaAoHHqZV50TZ2qyoU+xzg0DcZGr3KfYuy1/zQYHzY
 HGvYUJFsj07K1vvM0LsTtrKUaPYzh9Thl0SWHfwb7ZPdgNaGlejYchOSrjg5NufKcO65Udl+0
 nRUYpAVDyZgN+OYPtqAvuiv1IhKv65lXrJzfqvG29QMYCbxSFoBKrh9NL8guVEI0ZNKrJ/9pz
 tNnmX09FIwSXAlqG7aI1M6dqU7fxjY4IpInBqBSJ1RiErDeUV1gzbN9CVIY7DREYK9mHc780F
 mZp3/adyei84GmGvu93vDHsoVGGNYykgxRFUi+jlkTc5EdRTVRmGGgUgM9Q7OoRHw3H9D/3EJ
 p92wvsrdOV7xu4wlhxx0DSOL3XAz/+Em3vdUWhZLgiHmDOaEf319AIYh12Q/YI2Wwssqe7+Ja
 It7DbEvMe7ifn7F4pSYvW0wvLpROxIMuLW4V3jxYjNYtMYSgAY=

On Mon, Jan 17, 2022 at 2:26 PM Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> >I cannot judge how different this is from Exynos subarchitecture - looking at
> >patches it is not different - so I could understand a FSD sub-arch with only one
> >SoC.
> >
> I understand, it is a bit difficult to visualize it with the current patch set.
> As discuss on the other thread, FSD is different, more over the vendor is different, internal design is different.

Is it based on another SoC design then? Most new SoCs are derived from
some other
one, so it makes sense to put it into the same family. E.g. the Apple
M1 takes bits from
both Exynos and PA-Semi SoCs but has more newly added components than
either one.

I would argue that if this SoC shares the pinctrl, clock, spi, adc,
and timer implementation
with Exynos, we should consider it part of the Exynos family,
regardless of what other
blocks may exist next to those.

       Arnd
