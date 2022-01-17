Return-Path: <SRS0=GKdq=SB=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBCBC433F5
	for <soc@archiver.kernel.org>; Mon, 17 Jan 2022 20:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28A0EC36AE7; Mon, 17 Jan 2022 20:54:01 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1006C36AEF
	for <soc@kernel.org>; Mon, 17 Jan 2022 20:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1006C36AEF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pg1-f174.google.com with SMTP id x83so11901943pgx.4
        for <soc@kernel.org>; Mon, 17 Jan 2022 12:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HYpcsQcNoKf0ZAVU8M7gzKxtBSfWRJWnLsAKCpZawr8=;
        b=6M5ZHb2bzrI5rJSN5z0FqQt5lhcdEk49qd5OYp+/Bd6pv5vqb4azcjyPPzWKxdh/qU
         r1OPUm2SUVRkhVb2OzwvmmOIuc9YCi5H91S7cY2/6ls9ffl8lwZF2HTgnVGYFIO449UT
         Z/RkFkurPAWkBOf7MmI/qkkOTKLOLOxtFb+k2GFAoZl4EVtqmhfGs6ulmbEQDchwKtpM
         HwRG75TQUOkwbB3rR3av56+VuOZ4/ZEhp2ckWbq8lVEyVLh+OkhOFl9oDn9Bb8aKSXPT
         2HAZq79RkOuI+SAQMDN/yPQWq2OuFcE5L+vGItKHmAwG9zUTeUy8HFJMGJgdeR3aADOQ
         bNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HYpcsQcNoKf0ZAVU8M7gzKxtBSfWRJWnLsAKCpZawr8=;
        b=041uCEK8XYcVfWohsAePSIDorIpg3CK1wPjGxKqGy5ODzO3TtWfHhpGJueskDCvaFv
         /2BALM76Fw34IxyO7CEx6O1wYuO5pqXMuOy3WxIVK5wF2rO8qdt8B4YNkloDEfSosuQd
         sbGnSQXPtM04AIXvVd+0SbpQL81jpuVXfFnsAKEP6OValpdK5+TCS1n3sGkdmu0HO1gS
         KgFhs0ePsALKz2fiYJxcb6Z+D64/qUGNHoZVqYn4d7camJm+fDEQEazaC2FA9bd/8Vtk
         tLgITULnUHtuEXyYvWWg6jHS7ru/k6Z4tDmlBl4iQ0zabEpgZahwZjo+WH8j84R6kyof
         JG6g==
X-Gm-Message-State: AOAM530wTMXQ9HaoH03lUffYn90cvgm/RxzraAlCPKYaZNk7oMdYI7lt
	2315r1Dr3NYepGfQmZa/Vs7/kuoksFXlTMYFix5UHg==
X-Google-Smtp-Source: ABdhPJy/EjBSFJfriBqRsICfZ44KCdH2QkjcbzFwFcgd2QpOMma6ckMOY5Y6KmXc4qy/y6xO8ySgb9FwkI4g+2TNK+4=
X-Received: by 2002:a63:90c8:: with SMTP id a191mr21023658pge.622.1642452839185;
 Mon, 17 Jan 2022 12:53:59 -0800 (PST)
MIME-Version: 1.0
References: <CGME20220113122302epcas5p1d45c0714fe286f8f91d0f28c3fad86e4@epcas5p1.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com> <20220116092325.GA30745@amd>
In-Reply-To: <20220116092325.GA30745@amd>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 17 Jan 2022 12:53:48 -0800
Message-ID: <CAOesGMhpw7+5Q3MDAFQTr8-sDFgVXOE=v6h8d8pbHiZn8=3h2g@mail.gmail.com>
Subject: Re: [PATCH 00/23] Add support for Tesla Full Self-Driving (FSD) SoC
To: Pavel Machek <pavel@ucw.cz>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	LinusW <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 16, 2022 at 1:23 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > This patch set adds basic support for the Tesla Full Self-Driving (FSD)
> > SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
> > as well as several IPs.
>
> I'm not thrilled by their naming. Intel does not produce "Intel
> Fastest in world SoC"

If you say so. :)

> , and this chip is not actually suitable for
> autonomous driving :-(.

And AMD's Infinity Fabric isn't.... infinite. Things have names.

That discussion seems off-topic for this patchset. It references a
marketing name used by the company, and as such it makes sense to be
able to cross-reference:
https://www.tesla.com/support/full-self-driving-computer

Tesla seems to have moved away from the initial "Hardware 3" naming
scheme, so using this naming seems as good as any.


-Olof
