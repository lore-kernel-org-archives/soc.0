Return-Path: <SRS0=BI6M=ZS=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781EFECAAA1
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 23:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2652DC43470; Thu, 15 Sep 2022 23:57:15 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0762FC433D7
	for <soc@kernel.org>; Thu, 15 Sep 2022 23:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0762FC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-ej1-f49.google.com with SMTP id y3so45751988ejc.1
        for <soc@kernel.org>; Thu, 15 Sep 2022 16:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=RsQe7nphqHbU0PAhl5+uvSXohwaK5GRUowgk9iZmnMU=;
        b=HzLQ0C8YNtKK238UtoGDCLXb9p2pNbvNAUaFmiJhQE2F7+LJWTIQJWfHOWC+5Pp6P2
         tfY9xMV5A0bL+psxgczMAPdBzlIOs1kcSKjYkHt1D1IyIGnPaoTcv0zbNLxBO3Uf/fTz
         GjdyS33axKfIOtI4S3iOEzeLEr+noyI5GGy+taah+z98TR1f56ys/QfjnaiuhbQj3edI
         PtcKq9vocIdQZfQVx9j9/RTRvkOdDAe9V5wNFfsm5KFOfnrOU2OrDidC8uzC+/QRp390
         kYXAtdE2kJ4jAOp+lyozMpAqMIW4Y0Rni6YtQh/QGBdxExgFIKISqmB/zsxRFxVoO7CI
         qpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=RsQe7nphqHbU0PAhl5+uvSXohwaK5GRUowgk9iZmnMU=;
        b=pcX4pgk2SJO6Y5Imrzgz0RkU8BdXydp/U0SzqUepzJGh/OnqF4m9aVjg7YQLoA/7vY
         pK78gzD8HNVZ6gyx3giWXoPF/1+kFMUUNEcRP9Ydvej4KtCgQ/gN1cLyG1tVEhsauMMF
         /lOoCLyoJ5NaMGX+emMFRtEH4Bv8vb7c/uphivZ/+C6QYmu+LDDKRrnbxIwSuqA8mhkT
         96NEglkmg3WEipvxAYh7z98KK6QrmsJ4UcBVowkOHz5YBZj41TXfjKU2UPmmocBaZRPZ
         bqJX3XDanPNDQyL/hIGswlEWloZeiP/dVlXpkf/AQ3lW+bcFviomBUfk5lTs7WXXUChD
         Obpw==
X-Gm-Message-State: ACrzQf0RMntRmAMMtuDQdtqT52N8lTortkFB4JW2SKpHTNSlRroIWQ01
	JSiyQQdb/G95zkiOjvR/8wqBSNU7eD8VRppCiFVxQdXHU8s=
X-Google-Smtp-Source: AMsMyM4Rndho8mlic/vcoNp7Cbmzxg0scU8YjgroeXWWcgexuw3ccGmisz/E1lqc7voWrBwlgj5kYWE+bMgOItYphLU=
X-Received: by 2002:a17:907:7f07:b0:779:7f94:d259 with SMTP id
 qf7-20020a1709077f0700b007797f94d259mr1584691ejc.525.1663286232160; Thu, 15
 Sep 2022 16:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220829173830.3567047-1-f.fainelli@gmail.com>
 <20220829173830.3567047-3-f.fainelli@gmail.com> <YyNN/IZgOAlbSHnF@lx2k> <3dc9d86d-7b98-33ab-880e-a9584b8fac4b@gmail.com>
In-Reply-To: <3dc9d86d-7b98-33ab-880e-a9584b8fac4b@gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 15 Sep 2022 16:57:00 -0700
Message-ID: <CAOesGMghG46a8V-VAbaR8+g2kZPDvEV3=_ejGr=14zvdWCjyfA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: Kconfig.platforms: Group NXP platforms together
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, krzysztof.kozlowski@linaro.org, 
	arnd@arndb.de, Geert Uytterhoeven <geert@linux-m68k.org>, william.zhang@broadcom.com, 
	anand.gore@broadcom.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 15, 2022 at 1:52 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 9/15/22 09:08, Olof Johansson wrote:
> > On Mon, Aug 29, 2022 at 10:38:29AM -0700, Florian Fainelli wrote:
> >> Group the three NXP platforms under an ARCH_NXP menuconfig symbol to
> >> make make selection of similar vendor SoCs visually nicer.
> >>
> >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >
> > Hi,
> >
> > While these are convenient if they're done right from the beginning, the result
> > of adding a new dependency like this is that old defconfigs stop working if you
> > just go with the default.
> >
> > Was there a reason to group these now and cause this config churn for
> > downstream users?
>
> No reason to cause churn, and no specific reason other than visually and
> logically group options from the same vendors. I had clearly not
> anticipated the defconfig breakage, too bad that Kconfig does not allow
> menuconfig items to be enabled by default, or does it?

My local workflow is normally that I update my trees, then run a "make
oldconfig" and go with the defaults on new options. When I do that,
the layerscape arch option drops off, which turned out to be
unfortunate since it was the machine I was running on.

It's less of an issue if you use an in-tree defconfig (presuming they
get updated). I worry that distros will have similar issues if they
supply their own config.

Again, this is a one-time thing but it's easier for everybody if we
find ways to avoid them. Giving these new groups a "default y" might
not help either, since that would need to come off at some point, and
at that time the same issue will arise.


-Olof
