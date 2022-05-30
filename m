Return-Path: <SRS0=vHxv=WG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F36AC433EF
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 13:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 163A2C3411A; Mon, 30 May 2022 13:27:26 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3674C385B8;
	Mon, 30 May 2022 13:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3674C385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f182.google.com ([209.85.128.182]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mhl0I-1nHwxA37AW-00dmXU; Mon, 30 May 2022 15:27:16 +0200
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-300628e76f3so109700147b3.12;
        Mon, 30 May 2022 06:27:16 -0700 (PDT)
X-Gm-Message-State: AOAM532QsRoTrSn4IbUwh8p/YEFBz3arr4w07xy8gT1sPCZ81H3wVUV1
	vbYitxjpxAXOmi0zuM/bIdt38t2RudpWAQDBzUQ=
X-Google-Smtp-Source: ABdhPJzhFSGg2w/8ZGCTnRd3eo/K+0TESAOoljCU1poY/jQ3ltF9m1UCs/H2BhLsNUV4//0jprJWNAAdam+fS4ulT30=
X-Received: by 2002:a81:488c:0:b0:302:549f:ffbc with SMTP id
 v134-20020a81488c000000b00302549fffbcmr22682224ywa.495.1653917235399; Mon, 30
 May 2022 06:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <YpRiZpZU3kH2xprC@linux-8mug> <CAK8P3a2A_KHKWN3O2Wcy66yCC+T0eBsK8pNcGuLHN-BVeQ1ymw@mail.gmail.com>
 <YpS/jhQf6zLXZSvy@linux-8mug>
In-Reply-To: <YpS/jhQf6zLXZSvy@linux-8mug>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 May 2022 15:26:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3CuFOAPkk89i+tPgGa3xzPhB=bftQw6QW=hMaqK3-2AQ@mail.gmail.com>
Message-ID: <CAK8P3a3CuFOAPkk89i+tPgGa3xzPhB=bftQw6QW=hMaqK3-2AQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: s32g changes for v5.19
To: Chester Lin <clin@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Matthias Brugger <mbrugger@suse.com>, s32@nxp.com, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:3+WGtYg1hYsbqix+cPUVvlEBmL8lEfrC+9fSpDDVvmxgq/w+EQ7
 izjHvWdNVIesnR0ItA/xjH3yhj5cydge2oL5UQ9N45rMcGuh1tIG7+HYMo2z17r9Xt3T7am
 knXW7EakNdPnp6bZFLlKl5sgNJG+MRYf63vsgAOxQhvE+SrVmKN0vcX3oREZnalEBj9F2Nc
 CNHkhgQwi3dVJHZPxvK+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MtIoWRIlbs0=:tPiHUTDZY0R9kI7b9y7FPA
 +bvydAGoWYawYtrciKncNfrlUYP3H+mMJxMB0vTBnak83TeE/08zDIVwlbJ1OtRD9EL1YRTei
 WxDdnG7twSH8rocIr39w8Q1b0Z0mhzLOHbOT3Lg1KUSGh+QvQh2J64X01vNMDiX+JInGW74P1
 St3DOu/JDa5WzsdC7hPrv7GNa0GU9ACKIWQOwSqF6RoDfYHhqMeov+Mra1tQalEtyevDhvyZ6
 Gab4ZYduO+zzA/j8sR4InrE1WFFJX6PgTmLKky9JKWpRMucFkbfVn7W8kRd67zeKGR9Az0cnV
 hqnjwwfdIwjU6ZjP9WUiUsKg4P6j2igj9FL5R8MLYcURMlv4HbVw/eUwSeVHeTUNGw42pC9EU
 yD07uCGsWMC3qmN0CEFoMnAZSRhdID30dwQFR6WPZlY8C8V6Tw0U/425urWfry+JNHq3cHakd
 9CVQU1AyVlhKFO6eVMbvO4i3GnFN493g0xgLjttQT6EFsMAUmJvsJdK+QEHRuOEQSKmfWTfqX
 AWdyY2jmBw12jx8W8+rLhhQR6TLB6bPSIJ+f8/tL1MdPRpgAggrB7B7epkOkf1HlQYAyOeh08
 mXMA455cLiMeAaFr8++YLTV/5JJm8Zk6oDMzXXkev06/a4HZPcz0K5z7Lze7/Ff0DDK3nlKGQ
 zT1Hr4F+zLKFQfrgdvwFQGd6B7WzUdb1PxvDI6WLsqZGKWVZ2C8t/xgT1PKHT9nngQArKTnEm
 YX/zGvFADNbDAtepMwyHLLpkDpTu35uPXW17p2N8zXcNKwIm5TY8e0eaI76azsnoUP066LQle
 2jtwJA2MAljrnRFcosnNirRdeU5EfKIzATN9Mb8GDhCV6QgjzlfUg7CciLsbxCPo0wS+873+S
 2dcgFtfMiePleOFI3zyqeaTGV3zgmFsVcY6nu8kJs=

On Mon, May 30, 2022 at 2:58 PM Chester Lin <clin@suse.com> wrote:
>  On Mon, May 30, 2022 at 08:58:47AM +0200, Arnd Bergmann wrote:
> > - The branch is based on top of a random commit from the mainline repository,
> >   you should instead always base this on top of an -rc tag in order to not
> >   clutter up the git history or make bisection unnecessarily hard. My 'arm/late'
> >   branch is currently based on a random commit 16477cdfefdb ("Merge tag
> >   'asm-generic-5.19' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic")
> >   as well, but this is an exception and I will explain it when I send the pull
> >   request ;-)
> >
>
> Thanks for your guidance and sorry for any inconvenience this causes. I will
> wait for the next cycle.

Just to clarify: both of the patches you sent are good, and I want to apply
them for 5.19, so please send them as a bugfix pull request.

      Arnd
