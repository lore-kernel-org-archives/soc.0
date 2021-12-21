Return-Path: <SRS0=tOqj=RG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4838C433F5
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 09:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A15B6C36AEA; Tue, 21 Dec 2021 09:21:32 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A366C36AE7;
	Tue, 21 Dec 2021 09:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A366C36AE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mt7st-1mAeMb2Bdx-00tRP9; Tue, 21 Dec 2021 10:16:16 +0100
Received: by mail-wr1-f46.google.com with SMTP id t18so25457153wrg.11;
        Tue, 21 Dec 2021 01:16:16 -0800 (PST)
X-Gm-Message-State: AOAM531YmJpHxGaOGCtThdQA1kaDCZ0WstR6URllYZF6QFj+KgmxiJ3N
	oiu2Oo8w0QFBmaIzI5IY2C61A2wxCWbsdAtKzV4=
X-Google-Smtp-Source: ABdhPJx9Io4wbdq+1IzDizMc/1NQgxlt0NBkcspgb9PgBIVFPO0KlDZf3O7JLbMTa4+qFamZN9MU3ZDjBxCGAtpSd58=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr1797985wru.12.1640078175904;
 Tue, 21 Dec 2021 01:16:15 -0800 (PST)
MIME-Version: 1.0
References: <20211218085843.212497-1-cuigaosheng1@huawei.com>
 <CAK8P3a1-0u4VCCfgc7tjmnANM0yr7oUrQX2y-ZSVvZHDN191BQ@mail.gmail.com> <dfc25b22-2f66-4404-66c4-44c9c8c3bab4@huawei.com>
In-Reply-To: <dfc25b22-2f66-4404-66c4-44c9c8c3bab4@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Dec 2021 10:15:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0aNoU693ft3pHCPJOcGubZ1dMFyOmWozO0N_8-F_JkLQ@mail.gmail.com>
Message-ID: <CAK8P3a0aNoU693ft3pHCPJOcGubZ1dMFyOmWozO0N_8-F_JkLQ@mail.gmail.com>
Subject: Re: [PATCH -next 0/3] replace open coded VA->PA calculation
To: cuigaosheng <cuigaosheng1@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King - ARM Linux <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, SoC Team <soc@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, gongruiqi1@huawei.com, 
	wangweiyang2@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:DjIqWCPQcBD9nsfgzxg5kqNx2bAZH0AisHnQxBWtiDR8UT1L0fF
 c//KyNQSwT+l4XYwJGRoPB3f74oPGjAmeU6+eZuURfOsug4pPiXiCwWO+4YIIBTmJSDxbXp
 neTmegWJoN0Pkf+nP1gfl+sBDirP7p5Eongt3j2a9Zc2GfUHWq6TEDOqhcjJdCorIXz/qok
 athyMFRiD3JL4WDSzPWIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bGbK5CEWBCg=:q/0gBhxkrxIgTX8XZO7g9y
 +rmGOZTZwItdYCflzSZrEuE4Jo77Sjd9opfbTazCERiBTcyqLpD9OtssBAuoVbbkGg4S9kROR
 X3hHLkEtFM1mR73AeOV4uofuyTv7Pdv+wg+92I8jhNujhjjmo95jkRVUn+ccJgZDnl7nia6g0
 NpfNJTHU4+ef/5yfNpAZf6AoEnKBjhcnMYF8cKEAKF5GYnO9l1jaiK+Nzl7ZnrKNO5kUZ47SM
 XywD/TY1LEpcWn8FtUykSSLC+A/qyuk0YxdY5RY9+dlDFw/bSov5hS6cZgcmurb8A1Lf4tH4e
 GR1N881LycLW/USHld7ko4QLtTiH0nhpqiMg7gHh6PEWkgBxRzNRsvH0e49cWR/zxEvV1wDNV
 jn29yeRvgKaWE8fQyB0vQKGa31/aiPzaLWWmvshsljhh0NCclVsbqCkYdfsXS8fvNfRfAmtcp
 Uk+9EgkqBuhtPebGXQqGL6HWMjgmHucsUg2zbMktQP+uMgZoVxdUlgaLPLK47JVoZZW+mxSkn
 gth5HBW7Gyex6RU/Jz6+XbG1/PvBZu0PveydCCC4cq7UG1G5OpF8Lfz4gFKRdaRYBfllVanxv
 XjlGItfYLIwYcBwSfT55kAaSruNj8uOMmXh1Mzz5GKdEM5igOWas5kCVLmk1hwkrnA7VKH11T
 tARcTte2Ay6kU8scBloLItDsu1iiFf26PC4aclfLqzpzji4khsmqNUPqSg8175gVIv/KaC/Ai
 Qq0nJGF+5XWllLoLZ2IuSMqRuWJzCpkgvbpiwcZ/ify2S3LPtdcsCC3qnBVYpZmvGKHWEfWE6
 26TmemfGVdXSfBTP0gRhWPIisX/oIhja/PDh72zBerQLPGSXR0=

On Tue, Dec 21, 2021 at 2:41 AM cuigaosheng <cuigaosheng1@huawei.com> wrote:
>
> > I could apply them directly with the maintainer Acks, but I don't understand
> > the significance of you sending them now. Is something broken without the
> > three patches? Are these the only ones missing from Ard's original series,
> > or is this preparation? Would you expect the patches to get backported to
> > stable kernels?
>
> Thanks for your reply.
>
> This is preparation work for arm32 kaslr,and I want to continue to improve
> the solution based on the work of Ard. These patches are relatively
> independent, so I submit these patches first.

The approach of merging support incrementally is good in principle, but in this
case I think we first need to agree on the overall direction first.
How far have you
come rebasing Ard's patches, do you have KASLR working yet? This is information
that should go into the [PATCH 0/3] cover letter.

Do you have a particular target platform in mind?

I think for CPUs that can use LPAE, we want to eventually move to the 4G:4G
memory model, which in turn depends on having the kernel in vmalloc space, as
implemented by Linus Walleij in
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/log/?h=kernel-in-vmalloc-v5.14-rc1

With this work, the randomization will look quite different, on the one hand it
leaves less room for relocating the kernel within the smaller 256MB vmalloc
space, while on the other hand it does open the possibility of complete
randomization by scrambling the virt-to-phys mapping in vmalloc space,
using linear virtual addresses to refer to a randomized set of
physical addresses.
(this is just a wild idea that one could implement, nobody has actual plans for
it at the moment, and it comes with additional runtime overhead).

        Arnd
