Return-Path: <SRS0=dFf3=F2=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4A9CDB47E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 13:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF1B6C433C8; Thu, 12 Oct 2023 13:52:17 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEE78C433C7
	for <soc@kernel.org>; Thu, 12 Oct 2023 13:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AEE78C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7fb84f6ceso9353967b3.1
        for <soc@kernel.org>; Thu, 12 Oct 2023 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697118734; x=1697723534; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2gG3fg3q52fvlTCT+QjsQd6tuCwnP38cEJE5IRE6jM=;
        b=mGyWm6xx83WTpINnR1NRFBBzGubZbCjPRYpfO8ev+rUvyc+QFsMAvajH5Uk1JemS2x
         C9aSkj8lm3ZksYQTsVHyZbgKPGvVHM6Y1cmlF5HrakLD3hgVvrHCaTeOaKlNJDDWu0g1
         y0RwkJfUJD0tfncgIrc10owcU6rI46BrNLNDvfn2uomC0LiYOKohlIDTs3mALniZBW7H
         Ypl7KZ2y6ZQptO2cByKFXoSpFC3T4gtosvOZlVzKOxMeqpyF2vMCZqsy7Ax30lOW4qVN
         RdLXFeYsWEyeTzAgO0YzUqhO4gWAwDnBWr1cJ+fRBuVG2D4iWMUThqpLLAYcx7MZLSUY
         MEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697118734; x=1697723534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2gG3fg3q52fvlTCT+QjsQd6tuCwnP38cEJE5IRE6jM=;
        b=mSlYguQbgplsDV2SPOFwuRpQs1ibElkPdpaYnZ3qj1PKDn9HAsExpz9Q5v7JnDe1Q0
         B1dCpC58zSuOoG25I+V2zleqZnmjDpFYKUQb3mQX88E8JFWGTYJjWJQiwZeoNmzha8sF
         07YCKjcAF9HUzOlOeU4WKa5UwW8SpzTm+nhIpOGfkXPtRCzKrwDGpCx968fxM9OBqwX6
         GCn8i+wrIrE1zWjSFHQgXfStqNezUrxccpOSAcJZ6e4EHuxJdTdfTbO0ZKfTeyj390ba
         RX5zgwH7Bp2E0zwiFh00WWh4aS0dYAQ05xXmBC+e4sBLwHjWsWR8n7RIlh29iiBZ8p5X
         uCMw==
X-Gm-Message-State: AOJu0YyowLuMx//Q534sNpEo6fFvLxHHZkuFYN/5n3ZD8veq0H+KOhtZ
	sXNo+8RqEXACcGEA3hZCqeZ5iRVkSHQHRibGHhx+rA==
X-Google-Smtp-Source: AGHT+IEUixItd1kXxNUWqJ7YWtNJT7rR6hD0H/r/LT4Rvu2rvoR99SCGtsC+RPlcyYZVTc4zHe4JBltjz4OLDyvTd9I=
X-Received: by 2002:a05:6902:1507:b0:d81:917c:69b with SMTP id
 q7-20020a056902150700b00d81917c069bmr27103248ybu.10.1697118734615; Thu, 12
 Oct 2023 06:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-11-peter.griffin@linaro.org> <CAPLW+4mO1dMjh1EDPbaL0QGe4EM0GnbQ1G7NsdtBaCcPzdmkPw@mail.gmail.com>
 <CADrjBPqo8kKUr-EPay3zDQiF7XRwN+FDFN5W2tD5Aet50L2KUA@mail.gmail.com> <28bee37b-1d6d-433e-810f-da847635fcaf@linaro.org>
In-Reply-To: <28bee37b-1d6d-433e-810f-da847635fcaf@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 12 Oct 2023 14:52:02 +0100
Message-ID: <CADrjBPoHu4d-WjgO3sQb0T784QBm7S8YFUnDANmMHkZqjgv90w@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] clk: samsung: clk-gs101: Add cmu_top registers,
 plls, mux and gates
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, 12 Oct 2023 at 13:24, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/10/2023 14:06, Peter Griffin wrote:
> > Hi Sam,
> >
> > Thanks for the review.
> >
> > On Thu, 12 Oct 2023 at 01:07, Sam Protsenko <semen.protsenko@linaro.org=
> wrote:
> >>
> >> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@l=
inaro.org> wrote:
> >>>
> >>> CMU_TOP is the top level clock management unit which contains PLLs, m=
uxes
> >>> and gates that feed the other clock management units.
> >>>
> >>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>> ---
> >>>  drivers/clk/samsung/Kconfig     |    9 +
> >>>  drivers/clk/samsung/Makefile    |    2 +
> >>>  drivers/clk/samsung/clk-gs101.c | 1551 +++++++++++++++++++++++++++++=
++
> >>>  3 files changed, 1562 insertions(+)
> >>>  create mode 100644 drivers/clk/samsung/clk-gs101.c
> >>>
> >>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfi=
g
> >>> index 76a494e95027..14362ec9c543 100644
> >>> --- a/drivers/clk/samsung/Kconfig
> >>> +++ b/drivers/clk/samsung/Kconfig
> >>> @@ -12,6 +12,7 @@ config COMMON_CLK_SAMSUNG
> >>>         select EXYNOS_5410_COMMON_CLK if ARM && SOC_EXYNOS5410
> >>>         select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
> >>>         select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
> >>> +       select GOOGLE_GS101_COMMON_CLK if ARM64 && ARCH_GOOGLE_TENSOR
> >>>         select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
> >>>
> >>>  config S3C64XX_COMMON_CLK
> >>> @@ -95,6 +96,14 @@ config EXYNOS_CLKOUT
> >>>           status of the certains clocks from SoC, but it could also b=
e tied to
> >>>           other devices as an input clock.
> >>>
> >>> +config GOOGLE_GS101_COMMON_CLK
> >>> +       bool "Google gs101 clock controller support" if COMPILE_TEST
> >>> +       depends on COMMON_CLK_SAMSUNG
> >>> +       depends on EXYNOS_ARM64_COMMON_CLK
> >>> +       help
> >>> +         Support for the clock controller present on the Google gs10=
1 SoC.
> >>> +         Choose Y here only if you build for this SoC.
> >>> +
> >>
> >> Why is that new option needed? From the look of it, it could be just a
> >> part of EXYNOS_ARM64_COMMON_CLK. Like clk-exynos850 or
> >> clk-exynosautov9. Is there any particular feature that makes it SoC
> >> special?
> >
> > No, it could also be added to EXYNOS_ARM64_COMMON_CLK. I was following
> > the example set by TESLA_FSD which is another custom Exynos based chips=
et
> > that added its own config option.
> >
> > Krzysztof do you have any preference on this?
>
> Usually there is only one image for several boards so long time ago we
> stopped adding per-SoC Kconfig entries. This has its own ARCH_xxx, just
> like Tesla, thus having separate Kconfig for all Google Tensor clock
> drivers makes sense. Maybe it should be just called a bit differently,
> e.g. GOOGLE_TENSOR_COMMON_CLK

Thanks, I will update the name in v4.

Peter.
