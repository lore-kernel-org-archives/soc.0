Return-Path: <SRS0=X6Md=RB=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AB2C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 21:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28C01C36AE8; Thu, 16 Dec 2021 21:14:18 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77BA3C36AE2;
	Thu, 16 Dec 2021 21:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 77BA3C36AE2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MHX3R-1mkTg71G41-00DUXd; Thu, 16 Dec 2021 22:14:14 +0100
Received: by mail-wr1-f44.google.com with SMTP id s1so389445wrg.1;
        Thu, 16 Dec 2021 13:14:14 -0800 (PST)
X-Gm-Message-State: AOAM5319Z0ikAQ2vjrGp+RktNPf+zaqLgyA/WeKmbMpOz+DxwkHFkOB9
	3MFsp4h+KxJLdSdRakikF6p95MTdBOlB1lndN+s=
X-Google-Smtp-Source: ABdhPJx5ftEfPH4qvIzikYkTAI2QfNEBmismxp18qt3xtWOd9p6RwUc2SZYuv+4lj5MKuQ7wJcPfZffT71zk71LPRZ8=
X-Received: by 2002:a05:6000:1aca:: with SMTP id i10mr10867640wry.407.1639689253768;
 Thu, 16 Dec 2021 13:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
 <CAK8P3a29tzgd_4WncippZBEJra9n0bQTysBkPBp_WA0sb28gTg@mail.gmail.com> <1360c4fe-4a09-a8a1-3224-7f1d4af59f6f@benettiengineering.com>
In-Reply-To: <1360c4fe-4a09-a8a1-3224-7f1d4af59f6f@benettiengineering.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 16 Dec 2021 22:13:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1oZK1qMRBE3D8otCTY6Lg4jMXxVpAZHQzLTA8woA3_UQ@mail.gmail.com>
Message-ID: <CAK8P3a1oZK1qMRBE3D8otCTY6Lg4jMXxVpAZHQzLTA8woA3_UQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K/E8F6vNDTtQkdQw8ZH4ZQrBwA+b2qQyLQd6R852vCzaCs9bqco
 yanTu1g6VP1UvNXjJWnz/rTzP5d0KC+xFdU+6gNVlCgoActLceZ5nLOgdIaMMglHDXFAcqh
 OKwtT15kPWX9mDM8bdKA6rN0JqNxZJfLVK1DrhNk2IVQ7lO/SIE5bXoZlRiIWW+P8K3mqkG
 itolQqggWkmwhog1flqrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dM2Tl1SzARo=:GJ7cPmmOt5AplS9M2DPUmN
 IEW7jm4mjDkMuH2Tb7qJe7xeQ1i/sSAlNJILV8PDPSFuA4ub5HVTaiBd4x7QBaFUC/q1+u+CI
 kE0tsWlVTZffDqulL2K5Dx631Pd6fmvTDmqB2aW7cYu++XFbNB4YcvbZw8dxwHOyiYV1alO5W
 OvyPdT3hPvwUVNu1fPPCs/5FavD+aUJJQyGeOp6CMqwgRAN7z47HS+5tijOq0XZfbTes3zJ1I
 ofpyf6SfPMhNqw4q3vG8dni9TygWGvMWfl7Q7KjmwntmJGLOqchZ7fvWeoj3aORIMWR0vz+tb
 ah3nMiOfQOAfMY7cMTBB4FXAG9DPS2x6kahUqEzdsAyzINEs1gcLYBc4rGgLwfPZUvQAB0x4U
 8DDfg9ej98kZxd/xCA5ZEXp6ZEH3U4aqgEn1EOv2zHFv8YVy+gixnPV0n5vDZ4zcAER6GmL/+
 OTWMNJotDjmmn1vp0H8HAkeQozDkotPOdcTX5T5BBJNFkWcysgPFfr0Gcg3BpyH3IzcEtzKq1
 dqISPOToBoZlITho1SSw9vUEjlVaJnuq8oPC6RTvfg8v9EDJ/8NDSHo19+/Kd3RiC5ssX82+Q
 e/onPI8+Fng/uVo6rA0XNx4/xEAuihiHf1xc1BwdGapAdqbHjQ+CJoBCg3/bgSPjqUm7baRKE
 SrCFnvpQ2Qsni31OgdIYDt9GsUPQssckdoynOTLksZvs4zhDqUcPsXyFb9TNaJJ6qGMloVgYh
 qKgj7KqsUBX0VFpuYofOQ+7MCT1fHmm2A23MwRrpb1kPVOEIos1YUDu2Bs47RLkxHpOUsbL/p
 v4W5zWdUc6qFMadekKtqGp2HemPTJ5o0UY/Rvy1L0d3lUc8olQ=

On Thu, Dec 16, 2021 at 6:33 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
> On 16/12/21 09:26, Arnd Bergmann wrote:
> > On Wed, Dec 15, 2021 at 11:05 PM Jesse Taube <mr.bossman075@gmail.com> =
wrote:

> > As a more general comment, it's always nice to see newly added SoC
> > platforms, especially when they are this well implemented and done
> > by hobbyists. However, I do think you are being overly optimistic
> > as to how useful this is going to be to other people: interest in NOMMU
> > ARM platforms has dropped a lot over the past 5 years, and as far as I
> > can tell, it is only being kept alive for existing stm32 customers
> > as the economics do not favor Linux on Cortex-M for new products
> > compare to Linux on Cortex-A or some RTOS on Cortex-M.
> >
> > The existing users will inevitably stop updating their kernels at some
> > point, and then it's most likely just you and Vladimir Murzin that care=
.
>
>
> About this will you accept support for the other SoCs in the family?
> We would like to add in the near future:
> - i.MXRT1020(uboot support is already upstreamed)
> - i.MXRT1024(almost equal to 1020)
> - i.MXRT1060(almost equal to 1050)
> - i.MXRT1064(almost equal to 1060)
> And
> - i.MXRT1160/70 new family with faster core clock(1Ghz) and a cortex M4
>
> We need to add missing lcd(uboot upstreamed), usb(uboot upstreamed),
> ethernet(wip) supports for i.MXRT10xx family.

Sure, anything you want to work on supporting can be added to the kernel,
the important bit is that it's well written and can be maintained going for=
ward.

My best guess is that we'll end up ripping out all NOMMU support in
a few years, when we get to a point when both of these things happen:

- the number of actual users that still update their kernels becomes
  really low

- There is some treewide refactoring that isn't easily supportable without =
an
   MMU unless someone puts extra work into it.

At the moment, we still support NOMMU kernels on a bunch of architectures
(Arm, riscv/k210, sh/j2, m68k/coldfire, xtensa and h8300). Out of these,
Arm is by far the most active, and if Arm NOMMU support was to go away
for some reason, the others would likely follow.

> This is to organize with Jesse also about buying evaluation boards and
> timing.
>
> We=E2=80=99ve meant this porting also as an exercise to deal with Linux d=
eeper
> for us and for the other newbies.
>
> We=E2=80=99ve been also asked about a possible support for s32s(quad cort=
ex-R52)
> on initial emails but it has no mmu too.
> While I=E2=80=99m seeing that some cortex-R is landing inside Linux.
> Would it be interesting anyway?

I brought that up during the initial review, but I think this is even
less interesting
than Cortex-M support from the perspective of potential use cases. While
Cortex-M MCUs have some advantages over larger SoCs in terms of
power consumption and cost, this is generally not true for running Linux
on Cortex-R. The Cortex-R and Cortex-A cores are closely related, so
they tend have similar power/performance/area characteristics, but
the lack of an MMU makes the Cortex-R much less useful. If there was
an advantage to running with the MMU disabled, you could actually do that
on a Cortex-A as well, but clearly nobody does that either.

Vladimir has put some work into making Cortex-R work in the kernel, and
he may have some other thoughts on this question.

          Arnd
