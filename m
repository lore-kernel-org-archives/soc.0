Return-Path: <SRS0=4T9+=RJ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7878DC433F5
	for <soc@archiver.kernel.org>; Fri, 24 Dec 2021 04:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30799C36AEA; Fri, 24 Dec 2021 04:06:01 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E9DDC36AE8
	for <soc@kernel.org>; Fri, 24 Dec 2021 04:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E9DDC36AE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f176.google.com with SMTP id t204so5958755oie.7
        for <soc@kernel.org>; Thu, 23 Dec 2021 20:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AK/GoBD4NSOHwSVqZthu2O08Jw7u+mwsxqJi3Ry3nKc=;
        b=gq2yQoCaJnKxdj0aHEXvs8IGPBaDHeTzTaYt/ryWsKz+mIDvAu9iIBhc2ZkzWM1dOD
         tEu2K97Is8ypqo+4uHCIyWDHFikuEd0awybqFuyTHjZE7wnwRhO2UE9ryQXiKxIKfuna
         cqjppHyaaZXsq3bFvQROZpaikTDEru/hXH3SUQgRMUbQ1JXiw5+qJGPvOxtocEarf1Ty
         Ie66oOBvLSZ9QlTXAcC1gqlUQ+xQGNm/iYsoWS5WzMaqaHJ0BptL1180107BLwHzx7Ad
         uZBNx6khDhyGorIvjqLJTFeFxkGm4BVRqnw2F6ut+jL0OP4JXOozlmYqtzsB5HLe6GRL
         RNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AK/GoBD4NSOHwSVqZthu2O08Jw7u+mwsxqJi3Ry3nKc=;
        b=HNDN6frbmYiavuVMTGGoAHXREdNLf8NjwAa3j4GSPvVgHrw7yFcV6cXs5ZN4aWh8m8
         ONottSD0GAEIkr2RxQwhVfitFBMrVy2JuTz6ZvuSlIiDvJ+Ar8ozPUPJbBeoto4obmjA
         NhMw8XwzxGfOs/JykyBo5OFaWzTYcjDG9+TIQ7wCG9tFr0eU0xYeY2Pf9oSWIOLhJpOV
         Dwk54oYmyh6h2S1YmnFToEsPG1r0UYTBD6tmoNYOu431fAOzxg+5Sc91JO4AIf2zYdc5
         TwRfiFXoIG3bzD8JoQM/Z0O4nG5WSTnNFvJWRM0jTiHXgk2Bmkdnn9Ryh7z+kbAdZqJj
         Y51A==
X-Gm-Message-State: AOAM530ZsUGK0rUK/lDyvuHu24RISjwP8sWr9KiWWnI2c2OuD1RQembm
	F/+k28tzlFuXdWndamrlFjgy7lbHCrsg51jRak+KPg==
X-Google-Smtp-Source: ABdhPJxQOSzC8McVfBe3KmWsuME/BKDeKWRpaj/52MKdPsPCfZWTUeKA3YUfD7+a3GmNhmxsLircXMO8+Vb1K/pQrgM=
X-Received: by 2002:a54:4613:: with SMTP id p19mr3662521oip.162.1640318758486;
 Thu, 23 Dec 2021 20:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20211218085843.212497-1-cuigaosheng1@huawei.com>
 <CAK8P3a1-0u4VCCfgc7tjmnANM0yr7oUrQX2y-ZSVvZHDN191BQ@mail.gmail.com>
 <dfc25b22-2f66-4404-66c4-44c9c8c3bab4@huawei.com> <CAK8P3a0aNoU693ft3pHCPJOcGubZ1dMFyOmWozO0N_8-F_JkLQ@mail.gmail.com>
 <CACRpkdaNv7850mOyXRMgmPf8TQxiM-C5VEkGnLfd+wvffW8FAg@mail.gmail.com> <CAMj1kXHgptq47g3mSPTKW9KMnqTH4K2Q7riBVwX4iA1V9YWYiA@mail.gmail.com>
In-Reply-To: <CAMj1kXHgptq47g3mSPTKW9KMnqTH4K2Q7riBVwX4iA1V9YWYiA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Dec 2021 05:05:46 +0100
Message-ID: <CACRpkdafoc_erHyfkby9X1LhkYgkBQsad=qNyXh+Tq_32zr_yg@mail.gmail.com>
Subject: Re: [PATCH -next 0/3] replace open coded VA->PA calculation
To: Ard Biesheuvel <ardb@kernel.org>
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

On Wed, Dec 22, 2021 at 10:30 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Wed, 22 Dec 2021 at 03:31, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Dec 21, 2021 at 10:16 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > > I think for CPUs that can use LPAE, we want to eventually move to the 4G:4G
> > > memory model, which in turn depends on having the kernel in vmalloc space, as
> > > implemented by Linus Walleij in
> > > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/log/?h=kernel-in-vmalloc-v5.14-rc1
> >
> > Yeah I'm still working on this series. The 4/4 split works pretty well,

Actually it's just kernel-in-vmalloc, 4/4 comes after that.

> > but it breaks KASan and I was in the process of fixing that when I left
> > for parental leave.
> >
> > The reason it breaks would be related to KASan not expecting
> > executable code in the vmalloc area, and since the shadowing
> > algorithm is a simple pointer offset, and since we go to lengths
> > to chisel shadow memory out of lowmem at a fixed offset from
> > TEXT_OFFSET, we have a problem.
> >
>
> Vmap'ed stacks actually has a similar problem, which is why it is
> disabled when KAsan is enabled. But this can be fixed by enabling arch
> support for KASAN_VMALLOC, and I suspect it may address the vmap'ed
> kernel as well.

Yep after seeing the other convo on the topic I realized that this
is indeed the same as I'm seeing. I can't disable KASAN just
because the kernel is in VMALLOC though, so I suppose when
I finally get back to this I have to fix KASAN_VMALLOC too
if noone beats me to it.

(It'd be great if someone could beat me to it...)

Yours,
Linus Walleij
