Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B574C4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 09:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38E5BC433C7; Mon, 11 Dec 2023 09:24:37 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 842B5C433CA
	for <soc@kernel.org>; Mon, 11 Dec 2023 09:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 842B5C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4b2d6c6d28dso960986e0c.2
        for <soc@kernel.org>; Mon, 11 Dec 2023 01:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702286674; x=1702891474; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ioYDubYP3iKfHKMHSy5gra3AJi2J9HK+LXY7uK+G2MA=;
        b=oVRCeMdkVXDSJ6hf7UQ8PvpYmxuymfWSjmFFyyMb80NW9uy0rePaPuO9tYY58ncvIW
         yIIHY9jRFj1YFqZU7vPfydMSsgy5c1kH/WY3qNWdbwALoPGYY30ZpGKaDNNhpqu/MLdI
         kwTiok9hN4rX7mDEpt37mDwIW2rMogNUob++xZE/xfN7mmvSP1ksDEUZF9dAb6fDZNkH
         kUEw5neR2BSucp5TX4Q/Y5g5+woQfy3c/mpG5YrNXoS6HqjWvtZgS7Q85Ah70jfo5pgs
         mZY8Bd+t5srKc0gt/6sNQljw8CBb4J/69HhMGktkEe9mX3HJBrasaoyd3If0hm6CiWWU
         TSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286674; x=1702891474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioYDubYP3iKfHKMHSy5gra3AJi2J9HK+LXY7uK+G2MA=;
        b=pMN466HtX6ZXj56rJZ1tdqomhHehrt1uISTD4Rw52bvP9+xhc++IgH8DEWHuk+3yzi
         /I4Q0zPGUm4o9sJN7u/NV9DWz4LjmO/omQBARt6Ob5LxKXPBoFrSinjvxQEar4JQGELn
         tW5DZc/ewxNWskdoyIukbUqFfgMAPh8kQNzSuNEf+ZfGx47dtYM0TPl6m9i1WgsQI6dc
         TCAEa5T1iCJU14SDSl/8q1LXnAmFT7EI97IdR7Bu5UFnWktoFpxAkH7tWXSKXPV1u7bX
         LPz3sy2v37A7hMl1WV7GPlslbUtjqneR+odCTCJcqWsiXPauY4STttJJEk+Sbvg9UgOP
         D6+Q==
X-Gm-Message-State: AOJu0YxqbdqlUUl/exu97Zlen1wOVx/NWqKvF7oa9DbASkjHQNd9xfRR
	EPLC4Pdlt+dP2oTf7XY0SBTB4VXSRwku66SIvWnDzQ==
X-Google-Smtp-Source: AGHT+IFmqVBB1S6PPILmZng6sUl4gnE7B/ENtukMPc8F2U+pjJRlhmvt8Xvk382O4/Rc8AUY2sPYgeEL53IrvFfBTZs=
X-Received: by 2002:a05:6102:3e90:b0:464:82c0:7ed9 with SMTP id
 m16-20020a0561023e9000b0046482c07ed9mr2131634vsv.20.1702286674338; Mon, 11
 Dec 2023 01:24:34 -0800 (PST)
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-5-peter.griffin@linaro.org> <e70d516d-db24-4d79-bbd8-bb5b497a4391@linaro.org>
In-Reply-To: <e70d516d-db24-4d79-bbd8-bb5b497a4391@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 09:24:22 +0000
Message-ID: <CADrjBPrhO42-7TY0iNuRcyWj_YUwpNMWROY_6waLoVtmp7uwrg@mail.gmail.com>
Subject: Re: [PATCH v6 04/20] dt-bindings: watchdog: Document Google gs101
 watchdog bindings
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

On Sun, 10 Dec 2023 at 14:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:30, Peter Griffin wrote:
> > Add the "google,gs101-wdt" compatible to the dt-schema documentation.
> >
> > gs101 SoC has two CPU clusters and each cluster has its own dedicated
> > watchdog timer (similar to exynos850 and exynosautov9 SoCs).
> >
> > These WDT instances are controlled using different bits in PMU
> > registers.
> >
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../devicetree/bindings/watchdog/samsung-wdt.yaml         | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > index 8fb6656ba0c2..57468c2c5ece 100644
> > --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > @@ -17,6 +17,7 @@ description: |+
> >  properties:
> >    compatible:
> >      enum:
> > +      - google,gs101-wdt                      # for Google gs101
>
> I think you did not rebase on linux-next. The hunk differs.

It was re-based off 'next-20231130'. I will re-base off the current
day's linux-next for v7.

Thanks,

Peter.
