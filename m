Return-Path: <SRS0=0UKj=FT=google.com=willmcvicker@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A29E92719
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 17:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16C75C433CD; Thu,  5 Oct 2023 17:37:19 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CA34C433C8
	for <soc@kernel.org>; Thu,  5 Oct 2023 17:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CA34C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c6193d6bb4so16025ad.0
        for <soc@kernel.org>; Thu, 05 Oct 2023 10:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696527437; x=1697132237; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C4e9Kg23SHZu+vjVtfxzHNoF3HFL3xTDkE0f1jaHYfI=;
        b=V8NWYuk9ngZ9xXdFJnrfvtKFOpX6BBdgONovHI0IGnqLPyBjxh+j6QC5819mFXXTVh
         vVv7xo4SDctceeCP/WzuCk9Gy3Vzun0qYpLZHyjbRcWCznQSaEW8nNQnVXKtEyxbrXdD
         bplUCjsN4m6UlSIUjnOW7Ti7NCk74e4+7SKdTHz+3Rs0t+X4Gh8ghHWsinGP6RxygR8t
         2AKoqlQV6+/GFpCPn4RhGyo7DRZ5nXHyzD4Z7dV5xz8xbf3rHL3RON51Pl5mJybDD0B5
         lbjgh+ZcOBfnggmuVODdMXFNIeJ2NzGC3jdVZ5enX/BOYm2Sz/N0T8jtsZxWqjz1JPg7
         1Knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696527437; x=1697132237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4e9Kg23SHZu+vjVtfxzHNoF3HFL3xTDkE0f1jaHYfI=;
        b=eEr/58cNhMk6AIXXilIe2kra0CmimtfIdJX0ek40GPYBo8DYG9wxz2Squj+u4BrKuy
         dGDyVdPIuuJ4N9WqQynWXZ2CBB45IWi07L5W6W9bdbYf8RhfFj76s0naarsBKOf21uSp
         URFc18HNCVH1+l3Q62agADL0Yev1Mn4urG0pc1hAMH8L/sqgqC+QrmBOPlDCNGmotJ3m
         GX71m/oPQRajhcWPOym26x4G3oawPY3chwRgC9iF6bz348N3iGvqNdU6FnxctZWXE815
         O1AGecCrfh27sqoCw0RpGB3sDb6Gs69DMI2yfqqiE8pPcjR7kCwKxHPoth7eCy2Bw319
         4EyQ==
X-Gm-Message-State: AOJu0YwGgUx0k884Tk3e468lOzG2UAjD4xgQG9K71Gyx1EUFcLUSf2PI
	SYW9hgO3A0IqJghF4wFleKVC2Q==
X-Google-Smtp-Source: AGHT+IGQkqtkzOoEy8CUfeYOTGtNX1HN2CAYrTFP+QCLuLZnKQCDyDPhpX/WLtfxTO55ITdGr9wWng==
X-Received: by 2002:a17:903:18c:b0:1c7:5627:2053 with SMTP id z12-20020a170903018c00b001c756272053mr158309plg.18.1696527437142;
        Thu, 05 Oct 2023 10:37:17 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id bo4-20020a17090b090400b0026971450601sm1890158pjb.7.2023.10.05.10.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 10:37:16 -0700 (PDT)
Date: Thu, 5 Oct 2023 10:37:13 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	semen.protsenko@linaro.org, soc@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH 05/21] dt-bindings: watchdog: Document Google gs101 &
 gs201 watchdog bindings
Message-ID: <ZR70SdvjY6JskvWD@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-6-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-6-peter.griffin@linaro.org>

On 10/05/2023, Peter Griffin wrote:
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
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 8fb6656ba0c2..30f5949037fc 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -24,6 +24,8 @@ properties:
>        - samsung,exynos7-wdt                   # for Exynos7
>        - samsung,exynos850-wdt                 # for Exynos850
>        - samsung,exynosautov9-wdt              # for Exynosautov9
> +      - google,gs101-wdt                      # for Google gs101
> +      - google,gs201-wdt                      # for Google gs101

For "google,gs201-wdt the comment should be "for Google gs201".

Regards,
Will

>  
>    reg:
>      maxItems: 1
> @@ -42,13 +44,13 @@ properties:
>    samsung,cluster-index:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      Index of CPU cluster on which watchdog is running (in case of Exynos850)
> +      Index of CPU cluster on which watchdog is running (in case of Exynos850 or Google gsx01)
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
> 2.42.0.582.g8ccd20d70d-goog
> 
