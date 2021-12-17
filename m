Return-Path: <SRS0=XNqx=RC=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE99C433EF
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 10:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB780C36AE9; Fri, 17 Dec 2021 10:29:03 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51CB9C36AE1;
	Fri, 17 Dec 2021 10:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51CB9C36AE1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4K6z-1myRbB0iLx-000MJ0; Fri, 17 Dec 2021 11:29:00 +0100
Received: by mail-wm1-f52.google.com with SMTP id a83-20020a1c9856000000b00344731e044bso1275838wme.1;
        Fri, 17 Dec 2021 02:28:59 -0800 (PST)
X-Gm-Message-State: AOAM531m4OEcDxx2jM/lodtt9+fSL4/rjaOrUkbUCCYabgYhe8aTB7uq
	oHH0AInDWIu8IrVtmOl2NUaI+TDFWhTMAz5+g40=
X-Google-Smtp-Source: ABdhPJzt5zYuPDN2kyerQhSiMM2qDbHR33/fmfF5ts41gKt3J8mLkHRysVIEdlJk2pNUlh3mDSd/3MBFVv8V8UNy0j0=
X-Received: by 2002:a05:600c:6d2:: with SMTP id b18mr2096113wmn.98.1639736939561;
 Fri, 17 Dec 2021 02:28:59 -0800 (PST)
MIME-Version: 1.0
References: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
 <CAK8P3a29tzgd_4WncippZBEJra9n0bQTysBkPBp_WA0sb28gTg@mail.gmail.com>
 <1360c4fe-4a09-a8a1-3224-7f1d4af59f6f@benettiengineering.com>
 <CAK8P3a1oZK1qMRBE3D8otCTY6Lg4jMXxVpAZHQzLTA8woA3_UQ@mail.gmail.com> <634e9304-2eba-4ea9-65ac-5d4f5d011b70@benettiengineering.com>
In-Reply-To: <634e9304-2eba-4ea9-65ac-5d4f5d011b70@benettiengineering.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Dec 2021 11:28:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3kpzi6ozLkTH9GtWqvs=JHkm6mp=dLs2vOHjrW=FoYdw@mail.gmail.com>
Message-ID: <CAK8P3a3kpzi6ozLkTH9GtWqvs=JHkm6mp=dLs2vOHjrW=FoYdw@mail.gmail.com>
Subject: Re: [RESEND in plain-test] Re: [PATCH v5 0/9] Add initial support for
 the i.MXRTxxxx SoC family starting from i.IMXRT1050 SoC.
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jesse Taube <mr.bossman075@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, gregkh <gregkh@linuxfoundation.org>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk <linux-clk@vger.kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:uPbSySKfKcb0X+ougu+dx+pZK+NSds5PQAn5PqOOhM2iEvSTX2C
 1L7WobPI1HSlHfhHifPFHKR3mM/3FO+oJRZ03j8SRp2Kk0SjklxH0VWdATdmCh0FRjoY7pG
 I/9yAgolq0tge4mCpGuvO3witdtH3D37utXmYVl4II8EoxCyBZ0/2WhMGiykziCC8GN0dnD
 +5zOcxkTaODkPyM+wmg9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2DQ5c1pvmvU=:3ynSyw+bzDT9dxBp3pK9Ik
 rFjfNlZVZuSf9A0PChRoATpXqbAA8fUJMlnWxrZA/UfLfW42Yy02Gfme3gEkXEbEKtOkRLdY6
 RjWxGc/xS1dkRfkIl3QUzZVfF06lueE8QXLrCIkwNy1zkLv4l7TcT4QWHg/dWo5dlp/FIxYbp
 jQ7f3Sq14bNxgPUUtCPuXT/bvNW2czP+g3KGrbLC5X9Bt4CXvLsOzjmSNDq+Bo9V4P6a2LGGW
 /ytweSOzY7k6rAq/Igm33rkfnxy/jwqHUOky7QnmigLIIzCch4p8zXqFjYB1r+K/qjal9AhTf
 dLC/4S6E/B15+1du3qbw0iPHKssPkNmXgLC6jX05Uj3cVfmSCN/bSOAkEL94xPfEriWgAW8Hu
 fVeSGoH1h+AjIebQeDsWjRxUmfOwP81ckUEzxyiBIgt1nQPKSDBew7whjb14XiOGImOE1PdLM
 EJebWGgy7Ry0o1Ld9vsof5eojKbQXfEZBsV3K4wJZmpU3Vejfq0RL9xPosmFGupE4b8i1K2IL
 q84j7IfqBYsTlR+qnZGYlVeirzNvkHcxfNfPH0xKLkWUotAE21KpN8JW3GfjggiFu9wAuix6c
 arvJ0l5t/sg4MBsD9k0RJsEdqkuGQo1UsX5fKr0gBaFhQEb1d7qZrLoQfQvKsZAk3T0KpI+aD
 iZ5lf2nv+8QPmB6kEOpMvjosNZLzQvoobcb1LnrIQHD9KHSlP5QZZ/vpOV4I3A8Qqv6IVkAjl
 ZrIqpKaiDjH6GAv86Us7By+GWeD5Z1nBIKxt2p0myWPXTdcNztULsTeh9otpaFlqN6MgUKW8g
 UgZVofYFI+i+7PpyZUxCp0JvnjfoS6bzlIWrVU7HihNdU8bEvg=

On Fri, Dec 17, 2021 at 10:54 AM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
> On 16/12/21 22:13, Arnd Bergmann wrote:
>
> > Vladimir has put some work into making Cortex-R work in the kernel, and
> > he may have some other thoughts on this question.
>
> I'm curious if he has something specific to Cortex-R to tell.
>
> I've found that Cortex-R82 has a MMU:
> https://www.arm.com/products/silicon-ip-cpu/cortex-r/cortex-r82
> but I can't find any SoC that uses it. Also, I don't know how many
> people could use it honestly.

R82 is fairly new, but I expect that we will see support in Linux in the
future. Aside from having an MMU, it also 64-bit-only, so we'd treat
it like a normal ARMv8-A core in arch/arm64.

        Arnd
