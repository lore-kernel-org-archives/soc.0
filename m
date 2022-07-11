Return-Path: <SRS0=VZIs=XQ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8ADC433EF
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 10:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DF8FC341C8; Mon, 11 Jul 2022 10:44:32 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8ADEC34115;
	Mon, 11 Jul 2022 10:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C8ADEC34115
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f175.google.com ([209.85.128.175]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MsZif-1nGoVD1v7z-00tyEQ; Mon, 11 Jul 2022 12:44:28 +0200
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-31c8a1e9e33so44492787b3.5;
        Mon, 11 Jul 2022 03:44:28 -0700 (PDT)
X-Gm-Message-State: AJIora/fYBmgv7LhP41XMRVzguGHB0YsRWE5AICURT1SgN22SP8Sl6RC
	thjarziUapwxqE/YRg7PcG4QeKpP5qiPLLS9cAE=
X-Google-Smtp-Source: AGRyM1vvpnydJuBuZ35e57VYKLYJlK3F9wmwi5iEtf6XXv1REA+2TljVDJkpWUvo95W6zxTJYTwcZkl0b9VfsC7j7ms=
X-Received: by 2002:a0d:df0f:0:b0:31b:e000:7942 with SMTP id
 i15-20020a0ddf0f000000b0031be0007942mr18059301ywe.320.1657536267137; Mon, 11
 Jul 2022 03:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZh8GdZzGsJ=h_E8RPgAHX8HqXs1871w95TVZD0SXHbkA@mail.gmail.com>
In-Reply-To: <CACRpkdZh8GdZzGsJ=h_E8RPgAHX8HqXs1871w95TVZD0SXHbkA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Jul 2022 12:44:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2fXtAHJL7-Qs0dm3fwjFn0NvmotfpeW2zUOqh9ymK2cw@mail.gmail.com>
Message-ID: <CAK8P3a2fXtAHJL7-Qs0dm3fwjFn0NvmotfpeW2zUOqh9ymK2cw@mail.gmail.com>
Subject: Re: [GIT PULL] Delete two DaVinci boards
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Sekhar Nori <nsekhar@ti.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jJnlq0NOv4LTmJoyVt8U7iOKUSuR1h73ZPdYU1+Rya6a3B141Bn
 ux5eXis4EsYtHbY0o/Y8T4L/CBahR0zuxh5JlH/YOTMVoJ1y7eDZHIlA0rIgfMoNo6DENgT
 NBJffh0eXufrn/A878s39L4/y1+3tBtTKv1S1hPGadlhMdA0MEjGnrrKt7/LBoALDZsCl+j
 tw64zuKb5RxL69RRwsWOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NP/3XVmFUw0=:xUslaVSG5mDENWmMKLhpA9
 tn9bcJccOQvreGmrRH/nj6uuPey+4iz+MMTmYRhOB0kwTWC/l58pPQazpDDx2p0CsWiRg88T7
 H5APJPdcmvfP639RyXL18JdiAOVaMNt/xQCNNFoMzQkKUftcu2A6i1ywrtKj6ABXCY3YnK98B
 ZtdznE337driEGAZH7W2IuTFjD+ySPM0ghKRGmPpD3GfL3Ga6YrASF/qGhAWKJdFT8KhcxMOp
 m63zvso1T20X27RtY/3NHqBGDRY52L4iY7U0u2Jnr6hYAqHJs7sXfHl4KSLJ+6kXh8Z1fhcj6
 3ihxfhxrJlvZos/OPZ1MJRBqfIIa88RvYL3Ickd+hUubE0cVNmzXozQyeK4CtcbNs+9qKK39Z
 lo7taq/gPyTaW6EDn4kT/MgoSM7EVX96GPykEdrIpixsu3MC8OAEFpXFJJStUrmHlAEd9xw/R
 ivEpjVj0FrRXBgYV0FvLAQNX2EnNCQ1Ok1ZnLh6JwmbRsjKTc0B3x5txWyNHKuAomUxQaqJcv
 mnWTLLmLCrMMsdRI37XriLabDClqoFU0kAK91TSZ1jSRdP1UkHizzXpouGtlQHbzORa8Ex81H
 hkC8i4jVCBaPbn9TJgZzWhK+FT1JEehZxCQQBGPGumY2ocd14nG+uSXorTIUDraPN/HCxu2r3
 5iVvetJjROdsy/x2Haf0Pp9fJyomxpRNM4j7KpvdCi51+LSaHHAnEP1NGM3HLst1aHzY58aZ6
 Xxlfn8YgRPdRx4zhyyzGqsE8G4p+u9noC2WlsQ==

On Mon, Jul 11, 2022 at 10:11 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi SoC folks,
>
> two patches deleting two unmainatined DaVinci boards.
> The patches describe how I tried to update these boards
> but there is no interest in that so now I am deleting them
> as unused and unmaintained,
>
> Please pull it in unless the DaVinci maintainers step in
> and says no.

I'll give them a few days to reply. In the discussion about deprecating
board files we already decided that only the DT-based davinci
machines are really needed, so I don't expect much objection to
removing them now, but otherwise they are going away in six months
anyway.

Your git tag description however needs a little more background,
I don't want to pull this and bypass the maintainers with a one-line
commit text. Can you update the tag to describe more about why
speeding up the removal is important to you?

       Arnd
