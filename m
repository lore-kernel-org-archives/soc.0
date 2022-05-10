Return-Path: <SRS0=d6N2=VS=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61F5C433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 12:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 875D7C385A6; Tue, 10 May 2022 12:45:26 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB9D6C385C6;
	Tue, 10 May 2022 12:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB9D6C385C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f170.google.com ([209.85.128.170]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MeD1l-1oOYs91CI3-00bH74; Tue, 10 May 2022 14:45:22 +0200
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2f7b815ac06so178139717b3.3;
        Tue, 10 May 2022 05:45:21 -0700 (PDT)
X-Gm-Message-State: AOAM530zDxWdAAn4S3/aB4KmaLVEOHaJM2oKbxIWY+rmLNEr74QMIFtW
	48zSf57xxPK3QrxwVf09ylsIlJFQsng4JRfunJE=
X-Google-Smtp-Source: ABdhPJzMox01vuxEQtUfWllU9AWz/4JUx/kxnCj32RwNPwee8B5gGa7g4UyyJzXx+NUdFazIw85dXRebzWgEGBqQmRs=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr19895862ywk.209.1652186720629; Tue, 10
 May 2022 05:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220510032558.10304-1-ychuang3@nuvoton.com> <CAK8P3a1k8y8U99bBmqBYE1vYAc0q-UeaM0oLP4tTHZCpyYNOgA@mail.gmail.com>
 <d64f260d-8ee6-808a-5725-e1181f104dfe@nuvoton.com>
In-Reply-To: <d64f260d-8ee6-808a-5725-e1181f104dfe@nuvoton.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 May 2022 14:45:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3UZ_thp=CVeXYwJ57MXxsurr+Y9Ad0bv0EOi4Jn=S+eg@mail.gmail.com>
Message-ID: <CAK8P3a3UZ_thp=CVeXYwJ57MXxsurr+Y9Ad0bv0EOi4Jn=S+eg@mail.gmail.com>
Subject: Re: [PATCH V4 0/5] Add initial support for MA35D1 SoC
To: Jacky Huang <ychuang3@nuvoton.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, ychuang570808@gmail.com, 
	Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, SoC Team <soc@kernel.org>, 
	cfli0@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UK6uWrME7uMjRjKu+Db2VVMJfjSOm6LBCbZ3nAKD8+4zFLgN+Ps
 klWwo42VLyN/CbCwa9q+D0mdMkEMxlPyNdMJlDNYo8k+Zl/E3qWKPgTFx4lzP7EYzdCjxkZ
 2Q48NJbwhNj1GqC2J66dYspbbfgN43n0nyEvm2Cc+h+9fEbzz5wq9kIDgw6Xdqz/BMVnHPi
 9Kt/Y597hR+vdXc5KfJTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iqMbWXSwPbo=:jxL4YCveT54+/UQynM7Oo3
 BpFLVVimbTCDdTq89x+mn2BQoUy+QpYh65q31s7h+wV7GUJk4mzwDX4knInsBwllS6Vbjj8Gc
 VvbG7LOOZztI3yMV2BHnghp+/GYEgmuGac1ituiMzguNAAh+VQKpPqV173te7Xkn6x1ju9aEN
 bJKIi0U49860kqMXhZBbUBGWTzR1AS7V8tAMMFs9EZc257PLPnnR2sL5gQeodY7wC09BcbzJT
 f4zF3ILWUKt8By4MwEI79dzjhQfXt7VQko2A0JiKbTNBV/XR6viIYThezpoqUYqa8Wm9QM2QX
 xUEoj9cXNAZ4ci1etVpNBYCh/NgtUYcyO/E4ACAlyRWpjJVvQzLyYmmwEvALAzGopA5DpVzmq
 lObmMZQ7cZuXT+RN4aP8j2r8LTmFA98YgOcoU55uIk56ZBwupCjLT22lqvzjdgAO+xoqZZnBH
 fKJfs+GxkqkH7BJqJvupsJy6u0N1UG2SP+BiVNoXWkWDU7cpUkO6GM069ODqe48cQsOQ8qhPT
 qOvd1Tn1Y7jECxCws7tgEjFFhDDAIVrbJRVmpFboItojZAweJ6H/u/vxakesMu35PcBBC/K1+
 YV/1CepzozLfegKfzFZmTHbulREjYzctbcK3Biiu2p72YBIfL4AXH+4uGla+bz4v+dMFvX8CZ
 wbadg/fyJ1DK+qAeDSmLs+NLzQQhkInAd38CU2W4xRWXVEaLUm6PaNLmV/3n6jxRxH1Y=

On Tue, May 10, 2022 at 10:40 AM Jacky Huang <ychuang3@nuvoton.com> wrote:
> On 2022/5/10 =E4=B8=8B=E5=8D=88 03:07, Arnd Bergmann wrote:
>
> MA35D1 is target at consumer application, while NPCM is for BMC.
> MA35D1 is equipped with ARM Coretx-A35 dual-core with the M4 co-processor=
.
>
> Our team has developed Linux application on MA35D1 test chip in the last
> year, and
> the mass production version is wafer-out in last month. It will be
> announced soon.
>
> We have ported TF-A, U-Boot, OP-TEE, and Linux 5.4.y to MA35D1 platform, =
and
> have provided Yocto and Buildroot distribution for beta site evaluation.
> All the source
> code can be found at https://github.com/OpenNuvoton/MPU-Family, include t=
he
> Linux 5.4.y porting on MA35D1 platform.

Ok, thanks for the information, this is exactly what we need in the
changelog text for the platform, and (if you send a pull request)
in the tag description.

> Yes, we have console device driver ready. Please refer to
> https://github.com/OpenNuvoton/MA35D1_linux-5.4.y/blob/master/drivers/tty=
/serial/ma35d1_serial.c.
> But I think we have to fix coding style and have more review on it. Is
> the console driver must for the initial support submit, or can we submit =
it later?

I would prefer to have it included, but it looks like this has never been
reviewed, and I can immediately see a few things that need changes
before it can get included, so I suppose we could merge the platform
without it.

The reason I'd like to have it included is that without any I/O devices
it is obvious that the code you are sending has never been tested
on the kernel version you are sending it against, and that makes it
more likely that there are bugs.

If the platform for some reason does not make it into v5.19, I would
ask you to include the serial driver in the series so we can merge
a working initial branch for v5.20.

In the meantime, please post the driver for review to the linux-kernel
and linux-serial lists by itself, and keep me on Cc.

> And thank you to remind us to create an entry in MAINTAINERS file. I
> will add the patch in the next version.

Ok.

       Arnd
