Return-Path: <SRS0=i2pQ=PJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562EEC433F5
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 15:18:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 345D161183; Thu, 21 Oct 2021 15:18:36 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D14610A2;
	Thu, 21 Oct 2021 15:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69D14610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MC2o9-1mXqHU2gIv-00CRZe; Thu, 21 Oct 2021 17:18:33 +0200
Received: by mail-wr1-f43.google.com with SMTP id r10so12807wra.12;
        Thu, 21 Oct 2021 08:18:33 -0700 (PDT)
X-Gm-Message-State: AOAM531qHladzLRxsGBEWo6wYPEE2k/CHx87OQL+AFq2E29MGb4rhii0
	KWd0j7qr+z2cG3t/5nbxGU18AdLqdk3ijXAjX5E=
X-Google-Smtp-Source: ABdhPJzubqshEiLe+W75XqiMDuKS74vXTaVdmhaIE7BX2wz7LJCvkZXMHN8SDJ7n99D+gIARU+bX3b9fQpoTH7B8Bao=
X-Received: by 2002:adf:e292:: with SMTP id v18mr7748646wri.369.1634829513272;
 Thu, 21 Oct 2021 08:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <4a27b400-4fb1-bb7a-335a-ae1d084cdf73@canonical.com> <mhng-743556e6-a149-4301-8c4b-c14b3bf4d3d8@palmerdabbelt-glaptop>
In-Reply-To: <mhng-743556e6-a149-4301-8c4b-c14b3bf4d3d8@palmerdabbelt-glaptop>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 17:18:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0dnRE4Sr-En-hPYbRAWAYgYZ7FBtC2h39RXggy=tA_HQ@mail.gmail.com>
Message-ID: <CAK8P3a0dnRE4Sr-En-hPYbRAWAYgYZ7FBtC2h39RXggy=tA_HQ@mail.gmail.com>
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To: Palmer Dabbelt <palmerdabbelt@google.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Conor.Dooley@microchip.com, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nABv/WM4UHSMpDsEU6RWpkGilniR2tdws7Dm9jPLPRDQ6fzU0SE
 EIiS+vSxgfSaNPxpkVFjt8tCyA5G8FrHbJRNIOzLE/sQYNuabR4tiR/RxlgYDiRrcUqxUYj
 yKbbx2Av/elavZxS2I0WDD64G0J6CyrektCSLsKVYpRHzkm2Nvj0QwZiB0eRUXkK3zHZsBm
 gjJ3bSVaEwZ3RxYRinS/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TQi9kwvreX4=:laAwgF3UM4NJYlD4Ya8ASD
 NAtKc91//PjPJn9ZJq58ntbxthwrNa/ZXpgOivuSG3n9YSl7pkK6kwQuJEfB+1l073UuV/r4I
 EO/z5jAQSLS5IHLgq7sFka213EONawi4ultFigqjXO7n/mdr/XlUlxT87UbjyklPWNgPY0DRJ
 WQc4h7e9H9TVMQsZA26C5zyVJYu3wz7N3gOBzER4XsnJfzy0QWryEy4eXcTz0Umh/fBU52Llb
 VSHLx3mSj9ukyjRgNNYt0kNsXS3yoM97aiy+Qgm6J0fLAaZOOmbh1On8ArGsrRm8BmQzg9C77
 Ne9OMlrCX9MYdBNO+fYq2q3nANGk55Eakx/l1RrCzqFBiX4N97OZqC94GclVPUAOgZOXuInuj
 30s6UTdirv7KSbVn/uxFr93i0l8Wrkc3csJFcbpr1vOPvMTSIgxMNg8FF7gPc5JbQ5k0egx7c
 jguxOwc+ssV7RHU/wyGBXjHfA+n7LH20G5juL0yep1rqZM3iveLmvQCco8PFI8WAe6G5Cy5mS
 3O2e7mXXUGwRSC6tuewon5o3tX5CVv59zaHy5Ml7Q6Uhdn5ZDKwSVHGI1J8R4DZJR0m8D+NBX
 zh26Ah4cyL5eypLx79isvKHloijvo3ZtIsYTs6Lop+k8VrCCJJnb6T9aTIwz4n0mnqTSvl3ge
 wQ1ftzWhwnJIwKOdtEk9NrbLMv5EjDabZaG63oMT1FKLeYmArUwlqZB027bH4uVCwPrQ=

On Thu, Oct 21, 2021 at 5:06 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> On Thu, 21 Oct 2021 06:09:50 PDT (-0700), krzysztof.kozlowski@canonical.com wrote:
> >
> > There is only one Microchip patch here (plic/clint). Others are for
> > SiFive. All the patches are described in the pull reqeust:
> > https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/
> >
> > I had also second set of RISC-V patches for Microchip. These were picked
> > up by Palmer:
> > https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next
>
> Sorry I missed this.  If you guys took this through the SOC tree that's
> fine, otherwise LMK and I'll put it in the RISC-V tree.

I haven't merged it yet, please add it to your tree then.

        Arnd
