Return-Path: <SRS0=yfNB=QV=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B21C433EF
	for <soc@archiver.kernel.org>; Sat,  4 Dec 2021 23:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC348C341C8; Sat,  4 Dec 2021 23:36:53 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 368E2C341C0
	for <soc@kernel.org>; Sat,  4 Dec 2021 23:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 368E2C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso8587443otj.1
        for <soc@kernel.org>; Sat, 04 Dec 2021 15:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NuW/fbIz0j4mSyCSfNd6qMqzZTl35SAyBw4Kyu5HiPA=;
        b=iFbmdA1TsAivA5FbFGUBriHLHlUT75w9xDbOkgIWR5o158RgJ70WSafgXYLVZVCtYh
         JbW+i/OT9oGX6cLrJjAurb4KM4XI0qhxiDyyGXjSkJsmioqwUyRLRbvbYenRvTbTwXpB
         Gi7ifeCLnLESst4k1++JcqYERHLsr7rnPGXORK/0lbRodkCHjQW3QLDob1VGDc4DquBy
         O5PhoQd37dN8UCwebSIoifubCOm4CPIYiM6iQDWrH6vZW93Z/SLd6B9FoDubK07nv38z
         tMUWwt0UntbeEPHP/RcRXrqrmd4I+DBrvxqdxeshQJyRwlsVJAV8qczxssO/yiy+u3VW
         cVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NuW/fbIz0j4mSyCSfNd6qMqzZTl35SAyBw4Kyu5HiPA=;
        b=yveDbN13gSju2m4JWdqP+An4MFLTI766y+ozhKjUASSsNa4f7KJZe5OaV5b1IpTDWM
         KWBPw6oG+I3j+RNM0/K3srSX8/qnHVK6i9Ob4WM3QulLCHnO80aSRMmAh9z+XJqjJHTX
         4B2yRiR024drfDem5XefPaQZqCPgt+/HYOxikgFflnWpdm51AVkMwkOrdPM83lxCP7ba
         DZMSVewMx0OCjzw5NJLXvst0gQx6PH6rmEUwJqznX4+sZ6Bbpwps9N403TKmkgc8jzxk
         yiSWJUzHFjcRR4tQnDiI0nMCs0jC5fPl3yQywMDu7B918SgMRfaOQRMi5FcUH1u6/NOZ
         X5jg==
X-Gm-Message-State: AOAM531rkBdgcfJ6GM8CZAYXxdA36jutfBTu//jsg+qwdiB25eP1rP3R
	/spjOXggFXSgaXlSbKiFk8jRpVJdL0LcA+WO3hLjmg==
X-Google-Smtp-Source: ABdhPJy/YkD5Lpp/kh/+b64tVyaKjWYz3dLa+2TfJuzuzRee3iC2k5N/5GhHPgwu4UeTgAhYUNIO+l5Lt4i9ercDe74=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr23684363otg.179.1638661012313;
 Sat, 04 Dec 2021 15:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20211202095255.165797-1-herve.codina@bootlin.com>
In-Reply-To: <20211202095255.165797-1-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 5 Dec 2021 00:36:41 +0100
Message-ID: <CACRpkdZPO7HOAGwV1iU+z047EFWCRbsrOjNV5o9s4dzPsT1H5w@mail.gmail.com>
Subject: Re: [PATCH 0/6] spear: Fix SPEAr3XX plgpio support
To: Herve Codina <herve.codina@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 2, 2021 at 10:53 AM Herve Codina <herve.codina@bootlin.com> wrote:

> Herve Codina (6):
>   pinctrl: spear: spear: Convert to regmap
>   pinctrl: spear: plgpio: Convert to regmap
>   pinctrl: spear: plgpio: Introduce regmap phandle

These three applied to the pinctrl tree.

>   ARM: dts: spear3xx: Use plgpio regmap in SPEAr310 and SPEAr320

Please apply this to the SoC tree.

>   irq: spear-shirq: Add support for IRQ 0..6

Please ask Marc Zyngier to apply this to the irqchip tree.

>   ARM: dts: spear3xx: Add spear320s dtsi

Please apply this to the SoC tree.

Yours,
Linus Walleij
