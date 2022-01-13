Return-Path: <SRS0=0T2f=R5=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D31C4332F
	for <soc@archiver.kernel.org>; Thu, 13 Jan 2022 18:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6730C36AEF; Thu, 13 Jan 2022 18:54:09 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0037CC36AEB
	for <soc@kernel.org>; Thu, 13 Jan 2022 18:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0037CC36AEB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pf1-f171.google.com with SMTP id p37so688030pfh.4
        for <soc@kernel.org>; Thu, 13 Jan 2022 10:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tb5858QqXIcL5etsmWCS0ZKhHGEgdWFwctSsz78MvDI=;
        b=UK7Pq02IigfJ4UwrZ8hJfii4Xs3neqjQIZcCnn8iEJ2HaSzAsOFfNWUOvyqHby6xZ3
         RPlt+Q9ETiZ57YNEA2lks/Dmj+Yk5qVw6hReh/CyXQxkUhA9iluXR8+lFYLBQ6QHkhM/
         n2ilJTcMm9FfoIvY9Pc/SVqd5ihJfZNoRu56K6O5UOOWWjHBbiczhjlaF92FQkLDeZZm
         Na/p4eIaTEnhyy5sMOVTJTMbbIUFAHYkfchs8yApFNnFluEjW71UU0DvNSBgg1u1x70O
         rdrXoDDPa4vNGbC08xoLC6Fkxa2SJR0HokkgcJz1d/qarYXgH+CmInrAtTcqudfn2bNH
         TnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tb5858QqXIcL5etsmWCS0ZKhHGEgdWFwctSsz78MvDI=;
        b=D6SvqR7fTjZjaeRqJvtkBqgCRLQ4ravQfM1JKI1ccmfI8A/CAjKYYVeiL5S+aLjE/D
         RMRXO80+laeL1KcfF2EaUhiJWBS3oCjVM3bNCOWzCbZTI/loB3p4xDQ7r54ftl1x5mqX
         eqfpbUDCaXliXyS5hFOKXxo1IfrHMTI7dIvnmDtfcsU/1PLga/giAwCjwcSqNt88zGzY
         1xEy8DO6HItzpMrOqny0ftvOZOdQzysZiq70I9loKf1f8zdfDhMVMb9k369r+aH0lRgR
         B+eymJ9OxFHFieH+9I1J89aj1m6TNeFkvg9rbuQgR28V/Ku3fSx6Uf/i3yzo/wm2ZeUn
         oZkA==
X-Gm-Message-State: AOAM533gU7pb3huEP148duDjMcdM2NFOIz9UjniyI7ThFyAhBi4+2xV2
	vjmhLOUevjseQgTJLUBoA4ujT/+8B3ZfvBwfuuZmzg==
X-Google-Smtp-Source: ABdhPJzXlahtnsFy6IBae/4XXtwKfp3ieNHsHEWW/ixmJdS+WTYxk6qaqsRZoeKRiQr50fLtEznw6+6eMB/iQsmKuX4=
X-Received: by 2002:a05:6a00:16c7:b0:4a5:d9c1:89da with SMTP id
 l7-20020a056a0016c700b004a5d9c189damr5491085pfc.34.1642100047311; Thu, 13 Jan
 2022 10:54:07 -0800 (PST)
MIME-Version: 1.0
References: <CGME20220113122302epcas5p1d45c0714fe286f8f91d0f28c3fad86e4@epcas5p1.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com> <d1a852e1-c4c2-b7c4-ddeb-7fbcfd9b4e58@canonical.com>
In-Reply-To: <d1a852e1-c4c2-b7c4-ddeb-7fbcfd9b4e58@canonical.com>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 13 Jan 2022 10:53:55 -0800
Message-ID: <CAOesGMjZ8X3r2KvPLWWwJj1ckTruiGOjx9wLyu8YbCxW+OaZgQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] Add support for Tesla Full Self-Driving (FSD) SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	LinusW <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 4:32 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 13/01/2022 13:11, Alim Akhtar wrote:
> > This patch set adds basic support for the Tesla Full Self-Driving (FSD)
> > SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
> > as well as several IPs.
> >
> > Patches 1 to 8 provide support for the clock controller
> > (which is designed similarly to Exynos SoCs).
> >
> > The remaining changes provide pinmux support, initial device tree support,
> > and SPI, ADC, and MCT IP functionality.
>
> Does FSD have some version number? The FDS, especially in compatibles,
> looks quite generic, so what will happen if a newer SoC comes later? You
> would have:
>  - tesla,fsd-pinctrl
>  - tesla,fsd-xxxx-pinctrl (where xxxx could be some new version)
>
> This will be extra confusing, because fsd-pinctrl looks like the generic
> one, while it is specific...

The public sources from Tesla on github uses "turbo,trav" here, but
that's also not a versioned name. The platform itself (hw3/hw31 -- 3.1
I presume?) has numbering, but that's system and not SoC:
https://github.com/teslamotors/linux/tree/tesla-4.14-hw3/arch/arm64/boot/dts/turbo

It would be easy to do "fsd2" for naming/numbering if needed for
future versions, for example. I'm not so worried about this,
especially if there's no corresponding internal version numbering that
this would map naturally to.


-Olof
