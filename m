Return-Path: <SRS0=dFf3=F2=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C58CDB47E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 10:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E70DC433C8; Thu, 12 Oct 2023 10:57:11 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25D50C433CA
	for <soc@kernel.org>; Thu, 12 Oct 2023 10:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25D50C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d9a7a3e17d1so864170276.2
        for <soc@kernel.org>; Thu, 12 Oct 2023 03:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697108228; x=1697713028; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXsH2wAbuu1LZ+xVuXFZUVdPOgCW2cpv03v3rr+MUKM=;
        b=u6Ga6uSk/YiCmGi4EaVaPYzxpZTQxM9L6+3Q/Egd8cxaa6e+tz4RiHzsffK0DhGSmV
         AFAZPnXoaRKBm6CQ1iWDSJFOOJA8ZdlT4xeDDd7m24C150mZzoCTMhkJAswEzP5Ae1ng
         hEBgFWw0xzhSiCNJADwJLsZ0u6JcuDD0ta4OE2mYKAjT478T2QIT4C/43G/J0mD4mMbR
         gcI7AWY4wEqwVJr5TATTHVd9KkM8MpPD1NktQoqbL0vqrCPSnI+Z7wjhd6wuhbnVxB/j
         8YLXrpuNpIg0mIoxdNeKhLPmOcCFJu3b5hAO+e+Jkk5/zUhdyVgsXS9oKMS38UoAzOq/
         RC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697108228; x=1697713028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXsH2wAbuu1LZ+xVuXFZUVdPOgCW2cpv03v3rr+MUKM=;
        b=kZJkCLNTdkv2Do5XsS3LMvkpSErG6eEsvU7Mt29TymOwJBibb6PVaYbsPbhHo6q911
         kb6xXGb7Apu+nEH2SMWLrYEgdojpvv1cjk8hvsH9+N5C2Z+29HnfkQhHPIKXjh85Mi0K
         m90IwRPDPS+6RFpjrapQITU1+YkeXDO7Y8Mm+ctJGltxCFw803WPmzLLBQbgeOnL3CQv
         ah/NkWQzMwIvloHwv8o7v7V8FBw41eTA7M5mOJGW+XhVS5z+/G79V/eUoSSnAQcJHZWz
         9CCfWiIud7IszaVRlgLFlibw846YOid+5DZrOtO6EJaEyaV0jiQyWOjzU9uI9h6HhI7b
         X0AQ==
X-Gm-Message-State: AOJu0YzDIHge9YJ3hoNH8RFkr6V6jf3AM0mDPcj+FgnNwuJF5m2TF1x1
	/WrqVqan8TbP6+iPGhlNMaKDyADJjmA4Id5l5NR4lw==
X-Google-Smtp-Source: AGHT+IHoONc3hJii7RYcVkxb1UvFrk39Aq1j5ObRTTPqLaWzUuSZjNk8uWTkxQSzrzNgSo8ZjFPFsI+716xNwL6U+X0=
X-Received: by 2002:a25:d48:0:b0:d9a:4e29:6354 with SMTP id
 69-20020a250d48000000b00d9a4e296354mr8267648ybn.39.1697108228053; Thu, 12 Oct
 2023 03:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-5-peter.griffin@linaro.org> <CAPLW+4m4zUFfRWMo+KC1ymGAgHtbLxyx6L99Qd0vJYQXmmCvbw@mail.gmail.com>
In-Reply-To: <CAPLW+4m4zUFfRWMo+KC1ymGAgHtbLxyx6L99Qd0vJYQXmmCvbw@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 12 Oct 2023 11:56:56 +0100
Message-ID: <CADrjBPpgPKO49Ndtu=L30iqidpfZO8hUZKQrorZGzsb7tztDhg@mail.gmail.com>
Subject: Re: [PATCH v3 04/20] dt-bindings: watchdog: Document Google gs101 &
 gs201 watchdog bindings
To: Sam Protsenko <semen.protsenko@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Thanks for the review.

On Wed, 11 Oct 2023 at 23:58, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Add the "google,gs101-wdt" and "google,gs201-wdt" compatibles to the
> > dt-schema documentation.
> >
> > gs101 SoC has two CPU clusters and each cluster has its own dedicated
> > watchdog timer (similar to exynos850 and exynosautov9 SoCs).
> >
> > These WDT instances are controlled using different bits in PMU
> > registers.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../devicetree/bindings/watchdog/samsung-wdt.yaml      | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yam=
l b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > index 8fb6656ba0c2..67c8767f0499 100644
> > --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > @@ -17,6 +17,8 @@ description: |+
> >  properties:
> >    compatible:
> >      enum:
> > +      - google,gs101-wdt                      # for Google gs101
> > +      - google,gs201-wdt                      # for Google gs201
> >        - samsung,s3c2410-wdt                   # for S3C2410
> >        - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 a=
nd Exynos4
> >        - samsung,exynos5250-wdt                # for Exynos5250
> > @@ -42,13 +44,13 @@ properties:
> >    samsung,cluster-index:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> > -      Index of CPU cluster on which watchdog is running (in case of Ex=
ynos850)
> > +      Index of CPU cluster on which watchdog is running (in case of Ex=
ynos850 or Google gsx01)
>
> Please stick to 80 characters per line when possible.

Will fix in v4.

Peter
