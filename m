Return-Path: <SRS0=Bjy1=R5=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C76C433F5
	for <soc@archiver.kernel.org>; Thu, 13 Jan 2022 14:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9ACE7C36AEC; Thu, 13 Jan 2022 14:24:17 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3990EC36AE9;
	Thu, 13 Jan 2022 14:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3990EC36AE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N5VPe-1mFjO807SM-016tRL; Thu, 13 Jan 2022 15:24:14 +0100
Received: by mail-wr1-f50.google.com with SMTP id s1so10404682wra.6;
        Thu, 13 Jan 2022 06:24:13 -0800 (PST)
X-Gm-Message-State: AOAM53048jUpSQpvqvGFoT8Hmx+4OXEfqBnodH+it4fIGf+GcBtnN1Cg
	DlO8xc2MFGvCgvrtKcBEX6AlRBJB3apEAi+WfIE=
X-Google-Smtp-Source: ABdhPJzwdYNeuVL1yYVlSfvEK+FTNzOKpNJueoBQfapcDBGMQlXdww3vJ6mdjQ5Vf5ltdNIbHFcn1y8+QiEEWUP219Q=
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr4238291wrw.219.1642083853640;
 Thu, 13 Jan 2022 06:24:13 -0800 (PST)
MIME-Version: 1.0
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122413epcas5p46cb2cafb73936c423017240f98f72845@epcas5p4.samsung.com>
 <20220113121143.22280-15-alim.akhtar@samsung.com> <55c22c3a-57ea-3320-ccb9-f03643563235@canonical.com>
In-Reply-To: <55c22c3a-57ea-3320-ccb9-f03643563235@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 13 Jan 2022 15:23:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0etf+AybUe5O9uRLAbo4J145t0-ThkEccNtKzue+0-qA@mail.gmail.com>
Message-ID: <CAK8P3a0etf+AybUe5O9uRLAbo4J145t0-ThkEccNtKzue+0-qA@mail.gmail.com>
Subject: Re: [PATCH 14/23] arm64: dts: fsd: Add initial device tree support
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Rob Herring <robh+dt@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, 
	linux-fsd@tesla.com, Arjun K V <arjun.kv@samsung.com>, 
	Aswani Reddy <aswani.reddy@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, 
	Sriranjani P <sriranjani.p@samsung.com>, Chandrasekar R <rcsekar@samsung.com>, 
	Shashank Prashar <s.prashar@samsung.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PAPPMekJJO0CQ8PUAVRyUKM+ilODNyQ9/WnH7dKtzWSr2UuEaWp
 nJlrEk8gEFZwvVqcPuiyVv4Vv8WIkZhnKZo8Ub8HETB1WhX5HlaCcIJlwimmFpYttj4DR30
 j4PK67dljDXMPt6pGlYNU+DmkigHDf5ObyaKEr8UdqRmyEf6u+LGcdi3siPXJC9cJtai902
 xvd8Ggt6QlmTAL0yHEKIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:803xCSO5KO4=:bxONj2saW1vKPD/acUL2pg
 eGI5dc9Ho53A7pML7JljY6AwSRxxS71oJQzEPvs20GuzBfmnAqED9AhB1PUegkxtkM0Sb39BY
 SIVEAgqMFljHpqV+fXQdaD5mx5QEh3qhqvEDvPLZkyakJa8M+PTpJLB3SK4rOnwVHePZ6Wsu4
 +zDse/vAoTjGDanUe8g9gYIckJsndNvbgfupYnhb3ePOT2hf/w1dVKxGiL50iy/oQ03mclz0q
 iRW8TloRK0zKbQi2tlXfgRJWamtMklzbd8koWEb/qGfg6H2H6l5391A0KV1iebNtQXc0cCJza
 5Zp/JPhT08jK6uGJU948Ea88ji1uSoZidJKqwIXDpyadIW2G+1EIpY6v1Bw1geUTx7pEPsp4B
 0k9IoWVXBuW69pEM25lbSxDqjdbrAamVEX6cB0BwlZYb6HC4PPt+JtrfmMxtfRHNPoYvhx6mD
 CWRKUHtGBgguWiGo9UWb2vuA9ZchFGzR7ORSsoedcrfpPuOLmMsDz/TqEpQt70l9b4p85+Cll
 /2RVTPNhiQJHLXsLU/CXEvDUQHQWdxcecDC7ahnZXnPzEQD8ws4Js/7s0prlQOUf8dbC6EzlR
 v3/pEeKlZxrb24CYBv4CBkx1+YW99OGoAJFPR2z68q9++6lJM7hBNqVOo3B0mVxy95iKo/X+A
 y34g6wobDsTCdBkAnKuSEXMUvrTGhQ5gBH4Jacx6lGNLSdT/pdvgKdGsMmxRMEH08UDU=

On Thu, Jan 13, 2022 at 2:16 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> >  ARM/TETON BGA MACHINE SUPPORT
> >  M:   "Mark F. Brown" <mark.brown314@gmail.com>
> >  L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index 54e3910e8b9b..bb8a047c2359 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -267,6 +267,12 @@ config ARCH_TEGRA
> >       help
> >         This enables support for the NVIDIA Tegra SoC family.
> >
> > +config ARCH_TESLA_FSD
> > +     bool "ARMv8 based Tesla platform"
> > +     select ARCH_EXYNOS
>
> How similar it is? I think it is better to duplicate Exynos
> selections/options here, instead of selecting entire ARCH. If this would
> require "depends on ARCH_EXYNOS || ARCH_TESLA_FSD" everywhere in the
> drivers, it's a hint that it is not a separate SoC but it is an Exynos,
> so it might not need a new sub-architecture.

Agreed, the SoC family options mainly exist so we can quickly enable or
disable drivers based on what a kernel is built for. If most of the drivers
for this SoC are shared with Exynos, I think having a single option is
sufficient, but it may be worth pointing out both in the help text.

If we want to have a separate option (mainly to help users find it), maybe
a 'depends on ARCH_EXYNOS' would be better. How many uses of
ARCH_TESLA_FSD are there?

        Arnd
