Return-Path: <SRS0=WEIr=X6=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CD3C43334
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 07:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE1E6C341C7; Mon, 25 Jul 2022 07:08:42 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76334C341C6;
	Mon, 25 Jul 2022 07:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76334C341C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ed1-f52.google.com ([209.85.208.52]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M7ehh-1o8TgA0Pe9-0080uP; Mon, 25 Jul 2022 09:08:39 +0200
Received: by mail-ed1-f52.google.com with SMTP id z22so12680454edd.6;
        Mon, 25 Jul 2022 00:08:39 -0700 (PDT)
X-Gm-Message-State: AJIora+5VWD1tNPUV8y/ehT/NDsZMW8nZLQ/LrssGwZlvKhqdYxljMSQ
	PulS2CwWx5XO3iqKUg6ZsZ7DrcA19D93GkLuWJQ=
X-Google-Smtp-Source: AGRyM1tlBDTGYGMdEtAzM8YjBusv7obdsIb0Rh2X5JBZzixsvidrbXN3KXbGdXtRFdoyYjFOeu/a5YbjrMzzkCrbpV0=
X-Received: by 2002:a05:6402:331d:b0:43b:ee33:8a5e with SMTP id
 e29-20020a056402331d00b0043bee338a5emr5364735eda.49.1658732918750; Mon, 25
 Jul 2022 00:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
 <CAK8P3a0umWWic6LAzxXJ7BACYVE--m-wbynh7Z8F+pGoUBxGTA@mail.gmail.com> <6a85baa4-80cc-a715-b5f5-fcc276d44010@huawei.com>
In-Reply-To: <6a85baa4-80cc-a715-b5f5-fcc276d44010@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Jul 2022 09:08:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2VaG1UB4pB0=9K=qfS_Mjyiiuy+ngOU4ttKMoZTQ4Tbw@mail.gmail.com>
Message-ID: <CAK8P3a2VaG1UB4pB0=9K=qfS_Mjyiiuy+ngOU4ttKMoZTQ4Tbw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64 defconfig: Get faddr2line working
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, jpoimboe@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:RxV5ym+YYXdUGorW3c6DiHlllU5jY/Pu+TO1jZgXShK4zpPcsts
 jj6TITmRR/fhynBDaHNWEK5ie6OqaMyer5JJ0W2aN5IbtL7kgLX/mw9RtcFbN7/wUTq/UDt
 xx3g9T2Pr+KOMS/2AyFFduDiwImmW+IgqegBQbaxyqowDPAH+T1J7ZFzSsLIPLFFkuWcOOo
 6lZNkhIad6fhF+41rzsZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+q9B7VGO1Gc=:o5Mkh/KNfCFAYSek+QnCgS
 YgJs8UFOJAPoi29L3kz4zVuZhHjVftsirri+VWoqLp7QPHcQmTPDO1R3AHNNV4n81yZX6ipzy
 oDMdLcI/jXqVar7dwUsBy1V6qvUOm2tX1YakPzf9pXVaXc5gzc42TVvf0CXB1+9LVM91NHLxw
 zT+lWFNGDh8yRtCQ9R388FTBm86RM274+0wqecBrQ6zzRzPaBqHEnSSVNRQYkaeUnwd/K2I4v
 EGeUeTNQzXOYiaOFIn/q7LQsDbK5rtZJo8IrC78odd3WpVURAIjDnUVJj5L4fb+y6keDezJ6i
 VpYbJKpgY8hTMPPrTxo9VVhTYa+MSmsJpPtMb/+pVttpciBN0VsMEDU3HX6W6/TK8Km5TD8cX
 RPjQZkx3kYX5aSowxgF3pAEbXLvmt0eFcDiUAG4OGyqgbvqChra0ATZGF1EU3K370pT8toT3g
 0HaA5vWmxWmcQUcw8tS1dfs6IMzlItCYAWclybywCWuuY39v/MBBtzec8//9R/ye5BIh4POjO
 Vq/9e0O/9g9PD/vLnp6ZoigU+gbYT40Db/DHxXKcGdQ6eSHw7SH26npfafTzFpts6sZabGlsJ
 jnb3M2JF0j12Z+yAXgSUgMT5ri+PI8MdpgzBkP5iquc0Df1dTTL97nZhHhSo22gUGXuRIIcXh
 We/Wy2Z3UnZH3kkiOl98J6ANleLFVP6kyZVCqEaVyFZfEJPOLmzy5MJerxStwGJ7gIiaUOyb6
 nEoYnD4gvqT9eouBv36jDVRTqTV0zQKlywrQEjkxdeeaG/L6lcGG8NwmCa78oD903a8QDOE1w
 IkPKyjMPe57AQ53ebTZH9HVU6WaCEK9w3i/nBVCc6PsNU5YkZcFP3HCt2XLUR6DoDPeC3duJF
 Ae7sWrNWIK2+V7MIZMIA==

On Mon, Jul 25, 2022 at 8:50 AM John Garry <john.garry@huawei.com> wrote:
> On 24/07/2022 21:35, Arnd Bergmann wrote:
> >> Note: this is based on next-20220722 and it may be wiser to sync the
> >> defconfig manually (instead of using 1/2). Indeed I am not sure what is
> >> the policy is of sync'ing this anyway.
> > I only synchronized the 32-bit defconfig files in my tree, not the 64-bit
> > one. However, I can't really apply your patch 2/2 because you appear
> > to  mix refreshing the order of the options with changes that remove
> > options that are gone after a 'savedefconfig', risking that we miss
> > other bugs as well, as seen from your diffstat:
> >
> >   1 file changed, 36 insertions(+), 48 deletions(-)
> >
> > I have refreshed this one as well now, which on my tree gives me
> >
> >   1 file changed, 31 insertions(+), 31 deletions(-)
>
> I am not sure what you are doing in this refresh - can you share the
> steps? I guess that you sync with the savedefconfig and then manually
> edit the resultant defconfig to restore the configs which were getting
> deleting (and not just moved around).

Yes, I did it manually using vimdiff here. I had scripted this for the
arm32 defconfigs, but my script was a bit fragile so this seemed easier.

You can find my commit at
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=arm/defconfig&id=abf73c76121d8417998356a1cccfccd17f5cfd11

> > These should be checked manually to find out why savedefconfig
> > no longer shows them, it could be either a bug (a new dependency,
> > renamed option, a driver randomly selects another subsystem, etc)
> > that we need to fix, or a harmless change (driver was removed,
> > option is now intended to be default-enabled, ...)
> >
> > If you want to help more, can you check some or all of the above
> > and send patches to either re-enable the options or remove them
> > individually with explanations about why they are no longer
> > part of the savedefconfig output?
>
> ok, I can check them.

Thanks!

        Arnd
