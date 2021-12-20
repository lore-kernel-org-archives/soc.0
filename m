Return-Path: <SRS0=iQxS=RF=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EEEC4332F
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 15:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9C27C36AEC; Mon, 20 Dec 2021 15:40:03 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08FB4C36AE7;
	Mon, 20 Dec 2021 15:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08FB4C36AE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N6KML-1mO8GM3bth-016icC; Mon, 20 Dec 2021 16:39:59 +0100
Received: by mail-wr1-f44.google.com with SMTP id i22so20869119wrb.13;
        Mon, 20 Dec 2021 07:39:59 -0800 (PST)
X-Gm-Message-State: AOAM530Fmy5+PJu4ZE/7urAJAuf+2TCm0An1a6I2dRq8HAzjkBRgHkOY
	rYEXFBo2p0Yc5RNHZCmijxf/J6eZhs9U92ZNkm8=
X-Google-Smtp-Source: ABdhPJwyf1gl42e1+1ii3zT0maFx9sw6pqM+dmpJrc6Cp5f8QnUR5djHD7r/X/OWPoyaJf/hbjF5DreC2K3feE7WjvE=
X-Received: by 2002:adf:f051:: with SMTP id t17mr13408714wro.192.1640014799482;
 Mon, 20 Dec 2021 07:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20211218085843.212497-1-cuigaosheng1@huawei.com>
In-Reply-To: <20211218085843.212497-1-cuigaosheng1@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Dec 2021 16:39:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1-0u4VCCfgc7tjmnANM0yr7oUrQX2y-ZSVvZHDN191BQ@mail.gmail.com>
Message-ID: <CAK8P3a1-0u4VCCfgc7tjmnANM0yr7oUrQX2y-ZSVvZHDN191BQ@mail.gmail.com>
Subject: Re: [PATCH -next 0/3] replace open coded VA->PA calculation
To: Gaosheng Cui <cuigaosheng1@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, 
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
X-Provags-ID: V03:K1:wPMibfPqHRzMDotrY6bovc9R5S+GHoF6fCFMfnyjcPyqlsgUPLO
 /frYcdGuaYhLweOyuT2nxdrJwBSZ7WV+FrvNdudxOoCnpbsJbyzxI/QFftoldgAefCpctrT
 /C80QRjP4WSMAmcEEazUd43QUhZF6uPDqsWX3bxNRRgSdkY3nyC7eIgeLTaB0o4ouFXuL1F
 XNKwEm0v8aISRWCx7a4LQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sp2OZoKdhqg=:zuHN8Bu6O+0ieQtQinnabG
 tZJgwdp0UfWPgKaEHbVjEP9rW9nhSXLc2/t/GZ9mwEjtKh1RCZ55hY9nY4ha3JJ2I6ym+YdAS
 s9IyBc+SwlsvENkJQyPIp7+hZjzd5ShvMcEGMo5nCvzBCns9hbUziYpPRFtrhKG4oKiPqLcxZ
 GnWhWusVmJumzJJAoPacH+U3teG32v5rVapaXxS7jW03Z0bO3OrprVTOzDNaPDrbJwIjE8uPk
 hwHxAV99Naje2T4WBwBopZ4FhDm2Np+1A4BOViy0zGfEwKia/zzD9Mn4c5+BgIcvf2VnixajG
 0OyqXbq6PwkZz303gY6vrpnEBh9VRLcrr9isBklErv0r/0IEkwDUyAH3JbuWsNdIuAouCueTa
 1H1TifeBA9mDEnGR53vK5/QrAvTLkfAj//Iy0kLDl77qmndfRuUd1MPqgF33XEWUQorNCeNjo
 Ht6WgYpp2Cu/Ut8YRR/dMSDaijFdIjCB/yof3j2oXZ5w7DpYbHLzAuEYgmHAXHgoB1Bk4iazw
 oUPqGxrSTo/+VEAbTzT1kfbR5b7Yn+u4sFpVd1Px2WspDBSLfNlrMtiCvACXGGeyStdqpVgL8
 M4nqVrX2c5Sgq71DEdoaVk5gkJvL5gZ6+65qK1jCVhQw6wN4bl7le4l6YtqMqfB18fyhXt9yF
 l4BxSCujll3fY8gbtDcADy8BYt4zeNqv8YhxQVDz+cSE12W5W8Pmi8z/+PeefQa7hKYxJQuFU
 ezpO7kaqD/pPv8beipmQF9bX0WXyYXtg0UrThowVOL7j76dvSpHyTtCCLcuEb2S4WrIr9Y/CI
 83J7P8leyD+NdT4pRsQP2TAXJYUT0OuZqB4IM2JseospSd6tNg=

On Sat, Dec 18, 2021 at 9:58 AM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
>
> These patches replace an open coded calculation to obtain the physical
> address of a far symbol with a call to the new ldr_l etc macro, and they
> belong to the kaslr patch set of arm32.
>
> Reference: https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=arm-kaslr-latest
>
> Ard Biesheuvel (3):
>   arm-soc: exynos: replace open coded VA->PA conversions
>   arm-soc: mvebu: replace open coded VA->PA conversion
>   arm-soc: various: replace open coded VA->PA calculation

Usually these patches should go through the respective platform
maintainer trees,
and from there into the soc tree, but time is a little short here.

I could apply them directly with the maintainer Acks, but I don't understand
the significance of you sending them now. Is something broken without the
three patches? Are these the only ones missing from Ard's original series,
or is this preparation? Would you expect the patches to get backported to
stable kernels?

       Arnd
