Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AC8C4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 11:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FD0EC433CC; Mon, 11 Dec 2023 11:35:54 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B943AC433CD
	for <soc@kernel.org>; Mon, 11 Dec 2023 11:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B943AC433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6d9dbe224bbso3105935a34.2
        for <soc@kernel.org>; Mon, 11 Dec 2023 03:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702294550; x=1702899350; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3+ol3M0pI923ab1AudTOkH9Yk0elXff3QjFR/FfpQ+Q=;
        b=E16/hPMKDIDfVAPSO99r7wV/llWa7mFCYnl7TAjTFqSWJWNitc/vwS8pRKrRdYGgh4
         6zbZWIebU0jkTRaBdt0NF4xf7pKunJfcBiwuynoGtoq/3+1p2KKvgcWX3OQUjjge538C
         Di2IAomsgTeJC5IES1uZjiJ/xZq0q4jZ446imLVrKucgi1Gs+X3Khot2D0RY63yg5gxT
         FCHBn27XqiOlNYpwnkhOxByAR/PpoPHwXZiQkbxNpDvn56PoyzVd3S6YeTV603SOTXjI
         fEIqpWMLO5YR1yCa/HL6DGS8OS5PZhLt2EnWoepQ10qQJKP1/iuNhm3lV8ShkLphYKY7
         CZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702294550; x=1702899350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+ol3M0pI923ab1AudTOkH9Yk0elXff3QjFR/FfpQ+Q=;
        b=LdYV1gCQNTqYI+3obRvDnEmcvbDy9LaXazTFSeQsvWAky+jQhxn1DPl6KnIHKP5GBr
         Ps56B8sVXGyZm9oUfhM7k/hfqzAfKcHl5FA3k/hKmoGyA7rkzm5jvPOjd4vod2Kkn3sL
         ltzE3cjdeFXzl+YZmlRntH5e5eJv/sfK/KSBVDtS5cpiX7A9/JL7xLKnH67ijRT/Z+SF
         Uh/17gCDM7YiXoGPdtJgL2SZ448VHOUymy5xhQQfWkYoPxgWJD1ArVNtiRP0s2jKlMwd
         yZP6xiCqbE+d/jMwQos+1ljvNJY0sO/Xk9W+oitepB4D4kLL2Ny3poXDmiz/Blyq78sY
         YBGw==
X-Gm-Message-State: AOJu0YzkVrilPJtjqnq8M118mVXrCMp76MsZET5rPOmkTp1Opyi9N2eN
	jCYPtbjyNpbT9/TA54ga58ZanwwNffm9opbrNIq7PA==
X-Google-Smtp-Source: AGHT+IHTYmAfw9EOKQEvoYukSWVGhGDG8tJXoV6ZROee3fmhULu+p3ewmCTzn6+wQmwMRXs/CvGuxxavXhD0mKv36pQ=
X-Received: by 2002:a05:6830:c7:b0:6d8:74e2:7ccc with SMTP id
 x7-20020a05683000c700b006d874e27cccmr4344434oto.39.1702294550628; Mon, 11 Dec
 2023 03:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-14-peter.griffin@linaro.org> <46c9c8b4-942d-4f6f-a6cc-00158314d5e5@linaro.org>
In-Reply-To: <46c9c8b4-942d-4f6f-a6cc-00158314d5e5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 11:35:39 +0000
Message-ID: <CADrjBPr6k-j=swq8zJfOjaYQW7hvWCTXj2ZZQT6V+QUtjEYOcg@mail.gmail.com>
Subject: Re: [PATCH v6 13/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review.

On Sun, 10 Dec 2023 at 13:56, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:30, Peter Griffin wrote:
> > Add support for the pin-controller found on the gs101 SoC used in
> > Pixel 6 phones.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
>
>
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > index 6b58ec84e34b..3834bf953178 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > @@ -468,6 +468,8 @@ static const struct of_device_id exynos_wkup_irq_ids[] = {
> >                       .data = &exynos7_wkup_irq_chip },
> >       { .compatible = "samsung,exynosautov9-wakeup-eint",
> >                       .data = &exynos7_wkup_irq_chip },
> > +     { .compatible = "google,gs101-wakeup-eint",
> > +                     .data = &exynos7_wkup_irq_chip },
>
> You don't need it.

OK will drop

>
> >       { }
> >  };
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > index 79babbb39ced..b8d549fe38cb 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1321,6 +1321,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
> >               .data = &exynosautov9_of_data },
> >       { .compatible = "tesla,fsd-pinctrl",
> >               .data = &fsd_of_data },
> > +     { .compatible = "google,gs101-pinctrl",
> > +             .data = &gs101_of_data },
>
> Place it somewhere alphabetically. Probably before tesla.

Will fix. FYI I was intending to put it at the top ('g' before 's')
that also matches the ordering everywhere else e.g. in the YAML docs
etc.

regards,

Peter
