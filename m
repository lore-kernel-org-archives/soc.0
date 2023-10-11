Return-Path: <SRS0=ubZ2=FZ=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB50CDB46E
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 22:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9819BC433C9; Wed, 11 Oct 2023 22:58:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BC84C433CA
	for <soc@kernel.org>; Wed, 11 Oct 2023 22:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BC84C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-565e54cb93aso267710a12.3
        for <soc@kernel.org>; Wed, 11 Oct 2023 15:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697065085; x=1697669885; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYWR/2v3Fd1MoRhNjm1nMoJPUsc+Tcv+RBee2GjvOUk=;
        b=WtAPR1l4HJXMvkcziH/b519iRjrWGOwon8zO0q2dgHb5iIq1f+51zjZrytHcMDVoVu
         V4a4GUheX91A+nZKmOPI+GC7FUjRIBjs1hMk1vuJVT/0xed6EWwKm441FzFowIrrvkKD
         VhxyAppbOhUbA8t8PMIBNs+Shhr7Of8zD+sX2m+cxfJHRShkUeKe8HhnnZUk9f9sYHCr
         aKRXzMnj2fluMblMWQJZhmcIuYvdW5VXVkbuk65qHQtG8EP6bT7AN7OyxRpvrZ1a0beA
         jdLTbacy6Wech9O8BYrdkhKcLYiFiDw18nY4FF+9M7Cxjtco92XBY65X0Ch+jXHkxpZr
         Sejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697065085; x=1697669885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYWR/2v3Fd1MoRhNjm1nMoJPUsc+Tcv+RBee2GjvOUk=;
        b=Rc5FmSDp6dwtzTKBSgnPht4OXkZjbeTtKe1zmXBOmLMaQO+NVXBtN+xAzSc72cAAeE
         H7Reh3KOmz9oeH8PbGr434CdWEFiLtUKNGnAXVt3SHxi8eluznvX/IBcY/wRH+LD3hWX
         5vNGpq8Ob67ORY10S199B1PFAF3WqDG8vv5ZGQ3FsjfX3UxJy5I3JBsHOPAvt42p6Kts
         wFR4rPSSMMblMvDBtRepkzw7ezulBzGs8FtZk1IWcgrQygkyTvZ7jFYlJvqdGGPcQSFL
         oCdIAHYiCvvSo8Q2A2KPK/LYxkwJvxBKYVAU2OXjuAS7RKIkBBwy5JVGeAIBTZRhgwTH
         00PA==
X-Gm-Message-State: AOJu0YyMam0l/QLTEN1xrCDfrrJkC3l5b/zYow2/s+SfFxUew6xFnKN5
	VTBPiVXOvxDkNdlQGhFZ17rHJQTClNB7q4Hu4R6F3g==
X-Google-Smtp-Source: AGHT+IEJWmglU1/rKohd2ItY6wv1Qku3KrD7vpBLL7BDiUXScJ4VqWtMu4B/i5Qi0h72Dw0/+UcqwB+9IoDs4GWrwmk=
X-Received: by 2002:a17:90a:9f46:b0:27d:bc2:7c6e with SMTP id
 q6-20020a17090a9f4600b0027d0bc27c6emr2337631pjv.20.1697065084819; Wed, 11 Oct
 2023 15:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-5-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-5-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 11 Oct 2023 17:57:53 -0500
Message-ID: <CAPLW+4m4zUFfRWMo+KC1ymGAgHtbLxyx6L99Qd0vJYQXmmCvbw@mail.gmail.com>
Subject: Re: [PATCH v3 04/20] dt-bindings: watchdog: Document Google gs101 &
 gs201 watchdog bindings
To: Peter Griffin <peter.griffin@linaro.org>
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

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add the "google,gs101-wdt" and "google,gs201-wdt" compatibles to the
> dt-schema documentation.
>
> gs101 SoC has two CPU clusters and each cluster has its own dedicated
> watchdog timer (similar to exynos850 and exynosautov9 SoCs).
>
> These WDT instances are controlled using different bits in PMU
> registers.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.yaml      | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 8fb6656ba0c2..67c8767f0499 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -17,6 +17,8 @@ description: |+
>  properties:
>    compatible:
>      enum:
> +      - google,gs101-wdt                      # for Google gs101
> +      - google,gs201-wdt                      # for Google gs201
>        - samsung,s3c2410-wdt                   # for S3C2410
>        - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and=
 Exynos4
>        - samsung,exynos5250-wdt                # for Exynos5250
> @@ -42,13 +44,13 @@ properties:
>    samsung,cluster-index:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      Index of CPU cluster on which watchdog is running (in case of Exyn=
os850)
> +      Index of CPU cluster on which watchdog is running (in case of Exyn=
os850 or Google gsx01)

Please stick to 80 characters per line when possible.

>
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (in case of Exynos5250,
> -      Exynos5420, Exynos7 and Exynos850).
> +      Exynos5420, Exynos7, Exynos850 and gsx01).
>
>  required:
>    - compatible
> @@ -69,6 +71,8 @@ allOf:
>                - samsung,exynos7-wdt
>                - samsung,exynos850-wdt
>                - samsung,exynosautov9-wdt
> +              - google,gs101-wdt
> +              - google,gs201-wdt
>      then:
>        required:
>          - samsung,syscon-phandle
> @@ -79,6 +83,8 @@ allOf:
>              enum:
>                - samsung,exynos850-wdt
>                - samsung,exynosautov9-wdt
> +              - google,gs101-wdt
> +              - google,gs201-wdt
>      then:
>        properties:
>          clocks:
> --
> 2.42.0.655.g421f12c284-goog
>
