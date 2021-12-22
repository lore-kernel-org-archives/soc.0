Return-Path: <SRS0=JomN=RH=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF514C433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 02:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99C1DC36AEB; Wed, 22 Dec 2021 02:31:24 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17CFCC36AEA
	for <soc@kernel.org>; Wed, 22 Dec 2021 02:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17CFCC36AEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f172.google.com with SMTP id v6so1654256oib.13
        for <soc@kernel.org>; Tue, 21 Dec 2021 18:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WVVTT3vmCo0q+zp9wFYRPgJeYzCdgYYZVxCTfsBXpCo=;
        b=mKsAMnpFxty/J3lsRPATdg9Gs0N+0Z+X2GBXtJSBuv5AtGMYxzkOAILiIvTERYbCez
         pR66vqnBgCquTFG1zBdeZTNQrJjVAlqtkBYUOlLsXnmuyBJCfirNpdTy92WUoJBD5pwZ
         OAUp1QhNYTo2E81BaaQoSagyvrf50+EhZawqS9QylSDjPy+3tMpH2nOKqN8MXOBHAlHe
         2s2RzTamSMr/f51jBQh1gq6V7D/3JOGYJD4b7Gh4zgqqO11mO+a22GJEDNG+NyZZLhBO
         9anAtrucLwlGE5/9E4rUVk5l0lgrIfMJN+hqeBRIJnYCogm4uY5D2faHxEWOaEv5M9kp
         AiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WVVTT3vmCo0q+zp9wFYRPgJeYzCdgYYZVxCTfsBXpCo=;
        b=4Rckbz+kfm2T2NESDfxdlSVgGHbY1KgcFBGNHImy7CIptQ+O4tPWM+Omrsiu2ycO2+
         mUOU93vCPClj0vUYWEmZnvDNohTboVsPMtB6Jt1nNkLspOA3sBdJ/tGLkM9blW0dSo11
         w35+1FisrNXgxhtl8MWHfEUQ3sJ9Ew37euBDerZitz/G+3R00GuVh18XnJ6DzBfpCoFb
         LItePeEsWY60A+WASYL1S3K04aZHp6AkXCWI41DSA4cUXnNgFK6gCAhCTP1c6UvGz4Vb
         5y5loMzezYfMFmZz3se7/KqKHrngMY2IZvaJxTrkJqwCktJVN0VxBZIp0rUCSyzJ2pKG
         4pPA==
X-Gm-Message-State: AOAM5326EG/cl8d22w+uLwRUB2zxvvp32r3hvH62Yo2q7JpJ6YiFNktP
	wbaBWJ3p8w3chZtjmKyIGnvaoFQBU+yJqoRpxoFSrw==
X-Google-Smtp-Source: ABdhPJyQw6pAlcKRGCxrInfNKU8CpUScnbM1HMPt/NrRC5sZMLlmMoxRq9pY61m6usNkXlYoPEcqNzn8/ggSyYEYD0U=
X-Received: by 2002:aca:5a87:: with SMTP id o129mr754536oib.114.1640140281901;
 Tue, 21 Dec 2021 18:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20211218085843.212497-1-cuigaosheng1@huawei.com>
 <CAK8P3a1-0u4VCCfgc7tjmnANM0yr7oUrQX2y-ZSVvZHDN191BQ@mail.gmail.com>
 <dfc25b22-2f66-4404-66c4-44c9c8c3bab4@huawei.com> <CAK8P3a0aNoU693ft3pHCPJOcGubZ1dMFyOmWozO0N_8-F_JkLQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0aNoU693ft3pHCPJOcGubZ1dMFyOmWozO0N_8-F_JkLQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Dec 2021 03:31:10 +0100
Message-ID: <CACRpkdaNv7850mOyXRMgmPf8TQxiM-C5VEkGnLfd+wvffW8FAg@mail.gmail.com>
Subject: Re: [PATCH -next 0/3] replace open coded VA->PA calculation
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: cuigaosheng <cuigaosheng1@huawei.com>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, SoC Team <soc@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, gongruiqi1@huawei.com, 
	wangweiyang2@huawei.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 21, 2021 at 10:16 AM Arnd Bergmann <arnd@arndb.de> wrote:

> I think for CPUs that can use LPAE, we want to eventually move to the 4G:4G
> memory model, which in turn depends on having the kernel in vmalloc space, as
> implemented by Linus Walleij in
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/log/?h=kernel-in-vmalloc-v5.14-rc1

Yeah I'm still working on this series. The 4/4 split works pretty well,
but it breaks KASan and I was in the process of fixing that when I left
for parental leave.

The reason it breaks would be related to KASan not expecting
executable code in the vmalloc area, and since the shadowing
algorithm is a simple pointer offset, and since we go to lengths
to chisel shadow memory out of lowmem at a fixed offset from
TEXT_OFFSET, we have a problem.

The patch "KASAN horror" shows what I am trying to do to fix it,
it's "just" some hard work missing.

Yours,
Linus Walleij
