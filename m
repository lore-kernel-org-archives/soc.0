Return-Path: <SRS0=uBN8=OE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DAEC433EF
	for <soc@archiver.kernel.org>; Tue, 14 Sep 2021 14:26:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A0E04604DC; Tue, 14 Sep 2021 14:26:38 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E256F60724;
	Tue, 14 Sep 2021 14:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E256F60724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M9WiK-1mVf5t2PeG-005Vfp; Tue, 14 Sep 2021 16:21:33 +0200
Received: by mail-wm1-f45.google.com with SMTP id d207-20020a1c1dd8000000b00307e2d1ec1aso2691631wmd.5;
        Tue, 14 Sep 2021 07:21:33 -0700 (PDT)
X-Gm-Message-State: AOAM533Sv9X9+4PKv6oFdV/LushsW1QuaN0qMTTvKTE1S1A+ICTayG4J
	LBALl8xmc6EU0JhLzxzr7pBda6BxjRaAXGRg3+Y=
X-Google-Smtp-Source: ABdhPJzsnHjbt0T2O6A1tAPKb2ZtmS1EUv+XyLnX5qis1Ech799gfBf55P60cRjqpvASf3hbGrRvpGw6iLcGZopkgr8=
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr2482104wmj.1.1631629293220;
 Tue, 14 Sep 2021 07:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <cec98151-d7a9-3fdb-ba5c-dc1fd182c2c4@monstr.eu>
 <163010220873.19400.3396594122611634350.git-patchwork-notify@kernel.org>
 <CAK8P3a38ZeKhg07Ed3fh2puouNKwXjRvosJaf5zWaKqF6x5+7g@mail.gmail.com> <0a30a2dc-047c-94d1-9714-4c2cb70539d7@monstr.eu>
In-Reply-To: <0a30a2dc-047c-94d1-9714-4c2cb70539d7@monstr.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Sep 2021 16:21:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ZWxsUrGA2J8d=M-G=0Bbw16XfxuL=Uu=cXvPpMyQkgQ@mail.gmail.com>
Message-ID: <CAK8P3a0ZWxsUrGA2J8d=M-G=0Bbw16XfxuL=Uu=cXvPpMyQkgQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.15
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, patchwork-bot+linux-soc@kernel.org, 
	SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ILs29pzn5S3wUV3jEJVJPEknhrhgPs8RnHAxtJnOYlq47pwX7zL
 +LcoGH3OSHBne6D1nrAHzOpzperytbmZ+trMil3i4xKjBlXMOdfcxVdMRqm2VZpISXeF1Kq
 A5fKjRCNWri5VlwCd77cicIuH4tdMfqhcRaTvl15F/+v1Vr/vi3eijNGc9lm0mpuvagEDJi
 GZI7Bflb30t4OJDwa6ziQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j1po1kFDGeI=:UFtvJ9/aLgbyusLRgLJr8z
 oLVvwkNPEiDbqkfLPoejrkDr+CzPnENJvlrM1lQOOsrmqfLI2HqEzHEn8JmrPF9SuioaWeTFo
 T+j/7Lv/QvNYyMc/CvhCLano1CeNM7hBjeZ8O4yoM6Wdm+bYObb77pjZ3alg7HGm4FXR/TT7Y
 zBQe9hpWHWwrXERPyk8O7XWjWxyscf2gYeS5+xmSfRP4GQpk5zv0KvdWqlB9AOweLoRpdxZqS
 J90HAYFN7Agct9kGoPEugyODqETR30vvmX3RYrBGU1hCfQW2AWutvYaEs+OoFrKmv66PL8vK9
 0Ck5tsWEMpw7trIc0pKwjn6z54TRXHs4IZ3NrcfGmwL4c0H06nrY5qoXv3FG0kFnKjNkxZ510
 LURLBVsb+UlFPcQD1xUgxplRZT1U4nvqHvFWDFEGwliEsK+IwqO/iuzQ1sgGV/+T16jKuO6UN
 M9Kw3Gz2eD4MzabC7gKu67avK+bLiX4d9ZtzQLGnuDbqJ8Gg1v2tCQ+Kl6h/GmL+PjGzttbzh
 EBPQAo+E6aYNMfO6fL3tMFmPE0IS044kdFT68jadFfpzqzMYeA7TsUtnwug8+LYhDdJdaC8TP
 VDtV415Dn8sRbrpfWcMqo/rtRVQBCRb4t3imG1cmzSNUSmZKOQP/lJ2e/EObzuswlfyf1ENpf
 qsARbvjj9FVIgXajahjYVYJXqPD/TfVFxkwRUFB2sUyMZDr0uFnTIEbjwVrCNHcG0BKIlP7fU
 /mFx5CFsuvCtPXh8szX/2L9uQO9VRovmHll8LelccjXE3OLJcxd9tV5E9/ZGM/5ttS4MfUNr8
 DUjUCYTwo8qSGqK2FzaHNLlETeCY8I/sojnh6ZiXNz76tNajoCrb+B59zyUS5ae22yso2cHhn
 xS4vQqsC+IUmCyTTfLpQ==

On Tue, Sep 14, 2021 at 4:04 PM Michal Simek <monstr@monstr.eu> wrote:
> On 9/14/21 3:58 PM, Arnd Bergmann wrote:
> >
> > I don't see anything wrong with the contents though, so please rebase on
> > top of v5.15 and resend the branch for 5.16. If there are bugfixes that you
> > want in v5.15, maybe split those out and send them separately for the
> > fixes branch.
>
> ok. Not a problem. When do you start to accepting patches for 5.16?
> Around rc5 or even earlier?

As early as possible, feel free to send the rebased branch right away,
and then send a follow-up for new material later.

I generally prefer to have most of the patches in my tree early on to
avoid the situation of getting too much stuff late during the cycle.
If you have a ton of early patches, and then a few more just before
the merge window as fixups, that's usually fine, but if you
send all the patches late, there is a danger of them missing out.

       Arnd
