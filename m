Return-Path: <SRS0=ubZ2=FZ=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFD8CDB465
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 23:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20E5AC433CD; Wed, 11 Oct 2023 23:06:44 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA953C433C9
	for <soc@kernel.org>; Wed, 11 Oct 2023 23:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA953C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-565e54cb93aso273147a12.3
        for <soc@kernel.org>; Wed, 11 Oct 2023 16:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697065602; x=1697670402; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=830+T/xr9uEn4yhzfFmm+l2X0cKAII88KMLpZDMLLPE=;
        b=aiwtVi2YmmrXTeJEdHGslU7t8ecCJb+Z234FLtgfLcgv7GwaGQTExK5DG1c1AgQDZJ
         /KLeYQ7u5VaJB7QrUvKtHE1RFWE6P8pmbkPibGKZ50G5H5BLYW/QvEUpMmlCZOPIIM5O
         IKW/qZUsfmBOh5D+iscB8f174wpoL1QOjLIetlsN8J3dxsSN9kHKj8wQXBnnyHaicrqU
         AUprnQr5EclAHTvXZACqzSFqTM3J7n+6wcoziCXPnFwjnZYQmWboOpiFelOOg1RBIJh7
         N7kpSAPS2vyBgzD2i8Y4JAzmD/RiH/Yos4kvK7jYILtehatOdYq5YB/KBddwp3eBzesx
         2DqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697065602; x=1697670402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=830+T/xr9uEn4yhzfFmm+l2X0cKAII88KMLpZDMLLPE=;
        b=K9xht/wa17fFlQYDp9gSNewE8LFF+ihGC4e6WwhWld9FJqJ+FGzBJZD/BcbemUSS1n
         EhZzw+SwsxU8AelNA36RVJDmvs7neFlYgqlAMvU6GNjDuuwNeJjw0c8B+ndCJLYPohLH
         hmdK7q+UZNY05xwdD1dqhhjcb7p1ozRolvdGhU8fmyKAGMt8PCSMVD+YD0ZKXp1rgT6G
         zzgokhWY2HZdnl1QYc0qDI0QD2xn9yGvBS3FMWa+bZ52zFwLu1o8xqDf2sRflBuqwS+b
         EtlBOjY+p9g0NPzBaNeF/m+lOpNxVFxnUt/TTs65L+kO+AbvUwFFH0MYEwFj7mtMciue
         u1VA==
X-Gm-Message-State: AOJu0YwzSluJ/KzpHl8R6y8UW2GlJBPS3V+rlmgMQydrSXzIID0Biwra
	R3IC+xhzO80s/CSTpLfgLNPcB1E1ZQRVz260KpaT/Q==
X-Google-Smtp-Source: AGHT+IFkrUQFnZd9m9zomJjfToUWFrobK9kapcqFNH2fBvaJKzZmviD5aTDDF66CYAN9UuRyUiHFrGqywS2lm3wpxuY=
X-Received: by 2002:a17:90a:8b13:b0:274:e8e0:1503 with SMTP id
 y19-20020a17090a8b1300b00274e8e01503mr19230372pjn.16.1697065602253; Wed, 11
 Oct 2023 16:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-6-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-6-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 11 Oct 2023 18:06:31 -0500
Message-ID: <CAPLW+4kK_hhkht7OPgyUCinwaEPMyVq3DJ4mnbRVkGXJvPWbwg@mail.gmail.com>
Subject: Re: [PATCH v3 05/20] dt-bindings: arm: google: Add bindings for
 Google ARM platforms
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
	kernel-team@android.com, linux-serial@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> This introduces bindings and dt-schema for the Google tensor SoCs.
> Currently just gs101 and pixel 6 are supported.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/google.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Document=
ation/devicetree/bindings/arm/google.yaml
> new file mode 100644
> index 000000000000..167945e4d5ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/google.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/google.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor platforms
> +
> +maintainers:
> +  - Peter Griffin <peter.griffin@linaro.org>
> +
> +description: |
> +  ARM platforms using SoCs designed by Google branded "Tensor" used in P=
ixel
> +  devices.
> +
> +  Currently upstream this is devices using "gs101" SoC which is found in=
 Pixel
> +  6, Pixel 6 Pro and Pixel 6a.
> +
> +  Google have a few different names for the SoC.
> +  - Marketing name ("Tensor")
> +  - Codename ("Whitechapel")
> +  - SoC ID ("gs101")
> +  - Die ID ("S5P9845");
> +
> +  Likewise there are a couple of names for the actual device
> +  - Marketing name ("Pixel 6")
> +  - Codename ("Oriole")
> +
> +  Devicetrees should use the lowercased SoC ID and lowercased board code=
name.
> +  e.g. gs101 and gs101-oriole
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +

Is that empty line is actually needed here?

> +      - description: Google Pixel 6 / Oriole
> +        items:
> +          - enum:
> +              - google,gs101-oriole
> +          - const: google,gs101
> +
> +additionalProperties: true
> +
> +...
> --
> 2.42.0.655.g421f12c284-goog
>
