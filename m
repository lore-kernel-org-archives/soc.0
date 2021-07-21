Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D410C6377A
	for <soc@archiver.kernel.org>; Wed, 21 Jul 2021 19:59:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 501896124B; Wed, 21 Jul 2021 19:59:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3930B6121F
	for <soc@kernel.org>; Wed, 21 Jul 2021 19:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626897586;
	bh=wlTPgqRNdyfSndBBg+ZDn4qkR+SwOI+M+YGpX3Y9Cz0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kwz3KTPan65MwKr7SkbvYb7wAb0bEl/Jk4cMw4JvCs5Xzn3VOzBMEciwBpiJxgZ1z
	 5cTvWrNMxO6GgEY7oT2BW6kelxTPNUFB6BCnCGvn8U130+xWYhSvoI7j3pbmF7WBSU
	 mmAAXsWShJWQB388b/TagKLmKdGvO0jF/0Kafuu7chb8SxW+R+GRdYjVb/C8qkH8AR
	 U8iQJZA0dQwGQOWqIdSqrB6Qg57LGWhGRorf+tOMGsRwGwzsHdJypPRtsW69ADvnvA
	 Z8XGlYt/hXPG1s+miCbGajbCVjTgC/OWeauNpAcAjARMpfb9EMQ0bSKAo4Xh2XhuNl
	 kHEyMt0nLo5jQ==
Received: by mail-wm1-f47.google.com with SMTP id 14-20020a05600c028eb0290228f19cb433so243299wmk.0
        for <soc@kernel.org>; Wed, 21 Jul 2021 12:59:46 -0700 (PDT)
X-Gm-Message-State: AOAM531UbAXSyHF7Fq96q4PuLoVOdWGTwegxPNBiBGM+wAfDcuf9P0aJ
	QOkLgl/mVFYsx4eMK6LciCWBcgHGeccsbK3uROQ=
X-Google-Smtp-Source: ABdhPJzyL50Dh8OOHmepowDDcih1qE0cwK3lajVQJev00+iVEeEliijxdrTGy/wa+5Gx37+0kdEMuVFl2xD3uBGz448=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr5734852wmb.142.1626897584841;
 Wed, 21 Jul 2021 12:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210721151457.2285669-1-arnd@kernel.org> <c9968f90-0633-9467-a3fb-725b92116fe2@gmail.com>
In-Reply-To: <c9968f90-0633-9467-a3fb-725b92116fe2@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 21 Jul 2021 21:59:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0PFcEk5T7Ym+u+8PuWEyyZoZPkv5S5uP-mrBZ4NDZf0A@mail.gmail.com>
Message-ID: <CAK8P3a0PFcEk5T7Ym+u+8PuWEyyZoZPkv5S5uP-mrBZ4NDZf0A@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: add regulator dependency
To: Dmitry Osipenko <digetx@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 5:29 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 21.07.2021 18:14, Arnd Bergmann =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
> [1]
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20210621160739.224=
48-1-digetx@gmail.com/
>
> It looks like my variant of the fix should be a bit more correct since
> it won't build the regulator drivers if both TEGRA=3Dn and REGULATOR=3Dn.
>
> I guess it should be fine if you could take the patch directly, perhaps
> Jon could ack the patch for that. Otherwise we could wait for Thierry to
> return.

Sounds good to me. Please send your patch to soc@kernel.org (with everyone
on Cc) so it lands in our patchwork, and if Jon or Thierry acks it that mak=
es it
there as well.

        Arnd
