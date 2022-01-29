Return-Path: <SRS0=uIQD=SN=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CCCC433EF
	for <soc@archiver.kernel.org>; Sat, 29 Jan 2022 01:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6092EC340EB; Sat, 29 Jan 2022 01:53:43 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F2E5C340E7
	for <soc@kernel.org>; Sat, 29 Jan 2022 01:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F2E5C340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id i10so23645858ybt.10
        for <soc@kernel.org>; Fri, 28 Jan 2022 17:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HZeBPf4FWmMWEAA75U+2zfHoRz8ztsSomUo5httipXs=;
        b=nqKX4wkSst9GeerM4nOCf/vzcWrSonrEHusl2jkdf6JPbXSJq+BxWymEiL4T3uY8Ik
         4x8dW5ayjyNSQpzHGdBXBwgUR3/i7QbntH1DGpiG1VSo/qONG1dEHjk7eQ7vUZWuTZcB
         sjeGkl7Rxz21f045e0BYhUjLOx+j4CUZqFwX2B6eJp8vesd3WG6mx2xDKwUT/ZySaf4/
         S1/TI9gInNa8Zfx1tUHqgbcs4m8APeF5EQfIi/DnbDv9oVHQSi9bqB1DPhkGLsG0Glc8
         IzQ6dbpda1kxUaMwyRXK27ASejJ7TZq97LYZRHTosEUxPim+HBln40aZzLwhZ55NRmD4
         D9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HZeBPf4FWmMWEAA75U+2zfHoRz8ztsSomUo5httipXs=;
        b=5GA1WyZblDVJ7wCA2GlOsPYTtuPrhVrroxo8xoIJz7e+V37iRgRaShV04ewThMpGqh
         YepVsDrIu4aHXUlr8XR9cxYKd1Yek3WIL/rVBXiQir33HWDm3cfbj0dyP0lnB9eTTra6
         DvAMsBoCQiNJGz78Nx3s0kwW86sn0RzIhPc0yeudIadvdOMeJHoFtLz0w3kSE9nZuDbI
         riCPCr1dTMm2EUMqJg6k5UjZTYSV52IiYqcZEJDXI7MP2CHArJq7f8/I4HN0e1Fn3qXj
         x64arxgb9eOGLQRepg/Dmdd5+rGq3j3woTE/+1ctr1favMoLEDbKVnaSObdMZCai1w1K
         3Fig==
X-Gm-Message-State: AOAM5301a0h1Odih/thpE8fgn7fR0BaiJl/0MY2EJRrXvqEOReNXBAQ6
	j7aLV9k6NNE2z27t6rlCiHf9DI8hcM2u5RbSjwhxaQ==
X-Google-Smtp-Source: ABdhPJz1SUkhXX0nFJpMY927BG9OfI05xq6GzmRY0qwKjjcY4yGG/+NV86N6iZNmb0K0+pJBgyraSskIt/tK1DfJS44=
X-Received: by 2002:a25:8011:: with SMTP id m17mr16390132ybk.284.1643421221603;
 Fri, 28 Jan 2022 17:53:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643075547.git.benwolsieffer@gmail.com> <9f19df2a0017b71547445ac34df221e827c45bd0.1643075547.git.benwolsieffer@gmail.com>
 <YfDKTGQDh3tDMECz@builder.lan>
In-Reply-To: <YfDKTGQDh3tDMECz@builder.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 29 Jan 2022 02:53:30 +0100
Message-ID: <CACRpkday7mRWPfirjY+VcS-tB8CwqWQCyunkTUh0om9DXF4F3g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: qcom: basic HP TouchPad support
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Ben Wolsieffer <benwolsieffer@gmail.com>, Andy Gross <agross@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 26, 2022 at 5:13 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> @Linus, please take a look at the regulator question below.

OK!

> >  arch/arm/boot/dts/qcom-apq8060-tenderloin.dts | 549 ++----------------

Nice to see some use of all the work put into the APQ8060 support!

FYI: if you want graphics, this work may need to get finished:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/log/?h=apq8060-dragonboard-graphics
(mainly the MMCC)

> >               pinctrl@800000 {
> > -                     /* eMMMC pins, all 8 data lines connected */
>
> It would be nice if you could throw a separate patch on the list that
> fixes this spelling mistake in the original as well.

Yes pls.

> >                               l21 {
> > -                                     // 1.1 V according to schematic
> >                                       regulator-min-microvolt = <1200000>;
> >                                       regulator-max-microvolt = <1200000>;
> >                                       bias-pull-down;
> > -                                     regulator-always-on;
> > +                                     /*
> > +                                      * RPM driver can't handle always-on regulators that are
> > +                                      * supplied by regulators initialized after them.
> > +                                      */
>
> That looks like an oversight that should be corrected, perhaps it needs
> similar attention that was given to the smd-rpm driver recently?

Indeed

> But this makes me wonder, how can this work on the other board? Linus?

I suppose these don't supply anything vital?

I know I have seen some regulators switch off and on but I
may have been confused.


> >                               s0 {
> > -                                     // regulator-min-microvolt = <500000>;
> > +                                     // regulator-min-microvolt = <800000>;
> >                                       // regulator-max-microvolt = <1325000>;
>
> This looks like the full range the regulator could do, do you see a
> reason for documenting that here? Unless there's a good reason I think
> you should leave the commented min/max out.

Yours,
Linus Walleij
