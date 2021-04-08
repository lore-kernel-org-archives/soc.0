Return-Path: <SRS0=yKMO=JF=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA60C433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 22:14:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7807861105; Thu,  8 Apr 2021 22:14:39 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F36C56113A
	for <soc@kernel.org>; Thu,  8 Apr 2021 22:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F36C56113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f172.google.com with SMTP id u20so4085668lja.13
        for <soc@kernel.org>; Thu, 08 Apr 2021 15:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UZYFt0LVceFfcAprXRqy7FjMz5TZMkhneNJXsWawHjA=;
        b=jh/m8+mpPAxdKJ0faiWMDsB8ThJ/bVJJ9pnV2DdOmRS9/0Oups3cMyWdWzW18R9i8j
         gbunTrdTzXj61KzAnIHGuLvJ9nkft7x+MraDzr7gFF1yaBGUjtjTTdMiYQ+PunQrg6Mq
         AHGDRg72C/ydMvv4dEfdxZRPqzyRfYLL/pSvqU735sU8zij4s5RgqNN1PZ4wS+Wdi6Ka
         AZRfpoyBNCCwQ3y+fFkFyztWzGjIj4Wpf0KA1axvxXHsmaTEVk+z8NE0++4kRHkHMHFm
         aPIVCbs0pKTV4iffO/p2kmB53EhxBPUETOwOLcv2vlxxWltOmJLjG8b2F2EkOAbgrmI2
         7blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UZYFt0LVceFfcAprXRqy7FjMz5TZMkhneNJXsWawHjA=;
        b=Uwxz38PUiBQwF5b3gHCx5bSlinM7FsHHjnpPjAieGLxdx3Dgg59dVvFSFEzXEiDBuz
         HQQ+0d21ihTA176x2R+uA1UP+1J4qZiBIcytDxwOEe8IFuXLm1WNOXGZSO32CfIasd9A
         n9QoY0hgO9PEnnOwnikS/ghQnvRCzAib0DjoKY7BLGbA2Jv0VeMPNAEDVRWSOiYZkcmQ
         R8txdy4tarDa5SF0yyhrMOyBsDZm5D5LbFT62TUBVqp2ahCuwiH/Rvw6SDym/BPk9gIK
         +1LQNTLwZKCjJ4zoXTzgDLdJP20BiMvMorcSkfV2NtLrlUCMauKPlZA74hHnT40iFlk2
         IYlg==
X-Gm-Message-State: AOAM5339RF6hDaMbx1+aG+5Eh2d+FUoqZmDZ8L0WMMAsmj3BhdVFU4ky
	kowgcatQhI+M7z7nmQxy1De30J8O0XXfT+PR8cEzYw==
X-Google-Smtp-Source: ABdhPJzWty7OkE/zjpcMz5z53ansy9SUNQ01JxDM7F1AxOx5za4NUdfe6x0onlsn7zmcaLaN2CQvWeG2UAY2qDU8U9A=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr7305898ljj.467.1617920077290;
 Thu, 08 Apr 2021 15:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <bdb18e9f-fcd7-1e31-2224-19c0e5090706@marcan.st>
In-Reply-To: <bdb18e9f-fcd7-1e31-2224-19c0e5090706@marcan.st>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Apr 2021 00:14:26 +0200
Message-ID: <CACRpkdaijbDoV2rSQsgO3XKnj_Hde8CU9JQ+V9gGePYjvCWJhA@mail.gmail.com>
Subject: Re: [GIT PULL] Apple M1 SoC platform bring-up for 5.13
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@kernel.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>, Tony Lindgren <tony@atomide.com>, 
	Mohamed Mediouni <mohamed.mediouni@caramail.com>, Stan Skowronek <stan@corellium.com>, 
	Alexander Graf <graf@amazon.com>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	"David S. Miller" <davem@davemloft.net>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 8, 2021 at 5:55 PM Hector Martin <marcan@marcan.st> wrote:

> Hi Arnd and all,
>
> Here's the final version of the M1 SoC bring-up series, based on
> v4 which was reviewed here:
>
> https://lore.kernel.org/linux-arm-kernel/20210402090542.131194-1-marcan@marcan.st/T/#u

Excellent work on this series Hector, thanks for working so hard on this!

Yours,
Linus Walleij
