Return-Path: <ardb@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5491CC433EF
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 09:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A3ADC36AF1; Wed, 22 Dec 2021 09:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0408BC36AF3;
	Wed, 22 Dec 2021 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640165404;
	bh=18Hp4ExwA1vlFrYaDovAK1d/B/IE/iE/hXlVIPGe0Sg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lXEGz4zEwY1FC97jpGyPwu78F3rTNXj5IdADfU0Hvfl0PJaMR8vCBDlSpqiQTrRPH
	 Xj8UBQzn+y5S3+zTU0cVp6aP/xmREiTzo9tL3gmclTFBjYXy96UDjrT5yX2D8uPVrs
	 XqRfHkJLbFAwfodxC+b8wLIyHhibKSL0WPEiumNuIeK0MLTweM2y2i51btjLYpIuq6
	 Pma/gLjbpPUu7QpZsGjJaXeSfsSTgKfuAciWCdjkqvHrCw0xvGk8BOcBK3raoI4yw9
	 UkR+80E3wzeQcZYHeIRe+ZtTd7EPeE+ej3DeKPPj17yCvcizneJRa+i1VvSTOxIL0d
	 SkvAm1RD5PePg==
Received: by mail-wr1-f50.google.com with SMTP id j18so3633310wrd.2;
        Wed, 22 Dec 2021 01:30:03 -0800 (PST)
X-Gm-Message-State: AOAM531qpcdmpt4WWo6Iyc6IRrWMl05zivxsJQEbCzBio0Sh7C5cqh9K
	JulE1cPdO/ISaV8evxoaemT9WOq7Bggx2SI74K0=
X-Google-Smtp-Source: ABdhPJyBP2vG/SUywNl/rFxI+D1j3RlcIYqKGkHbSd5rLc+rB2eorULfLkJn6sNS7oHTPZ7foGt0li5UePf6XlvadgA=
X-Received: by 2002:a05:6000:154c:: with SMTP id 12mr1485916wry.447.1640165402031;
 Wed, 22 Dec 2021 01:30:02 -0800 (PST)
MIME-Version: 1.0
References: <20211218085843.212497-1-cuigaosheng1@huawei.com>
 <CAK8P3a1-0u4VCCfgc7tjmnANM0yr7oUrQX2y-ZSVvZHDN191BQ@mail.gmail.com>
 <dfc25b22-2f66-4404-66c4-44c9c8c3bab4@huawei.com> <CAK8P3a0aNoU693ft3pHCPJOcGubZ1dMFyOmWozO0N_8-F_JkLQ@mail.gmail.com>
 <CACRpkdaNv7850mOyXRMgmPf8TQxiM-C5VEkGnLfd+wvffW8FAg@mail.gmail.com>
In-Reply-To: <CACRpkdaNv7850mOyXRMgmPf8TQxiM-C5VEkGnLfd+wvffW8FAg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 22 Dec 2021 10:29:49 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHgptq47g3mSPTKW9KMnqTH4K2Q7riBVwX4iA1V9YWYiA@mail.gmail.com>
Message-ID: <CAMj1kXHgptq47g3mSPTKW9KMnqTH4K2Q7riBVwX4iA1V9YWYiA@mail.gmail.com>
Subject: Re: [PATCH -next 0/3] replace open coded VA->PA calculation
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, cuigaosheng <cuigaosheng1@huawei.com>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, gongruiqi1@huawei.com, 
	wangweiyang2@huawei.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Dec 2021 at 03:31, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Dec 21, 2021 at 10:16 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> > I think for CPUs that can use LPAE, we want to eventually move to the 4G:4G
> > memory model, which in turn depends on having the kernel in vmalloc space, as
> > implemented by Linus Walleij in
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/log/?h=kernel-in-vmalloc-v5.14-rc1
>
> Yeah I'm still working on this series. The 4/4 split works pretty well,
> but it breaks KASan and I was in the process of fixing that when I left
> for parental leave.
>
> The reason it breaks would be related to KASan not expecting
> executable code in the vmalloc area, and since the shadowing
> algorithm is a simple pointer offset, and since we go to lengths
> to chisel shadow memory out of lowmem at a fixed offset from
> TEXT_OFFSET, we have a problem.
>

Vmap'ed stacks actually has a similar problem, which is why it is
disabled when KAsan is enabled. But this can be fixed by enabling arch
support for KASAN_VMALLOC, and I suspect it may address the vmap'ed
kernel as well.
