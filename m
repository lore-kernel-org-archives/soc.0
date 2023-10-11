Return-Path: <SRS0=ubZ2=FZ=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3562ECDB47A
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E6EDC433CA; Wed, 11 Oct 2023 18:54:47 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06624C433C8
	for <soc@kernel.org>; Wed, 11 Oct 2023 18:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06624C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-58907163519so108676a12.1
        for <soc@kernel.org>; Wed, 11 Oct 2023 11:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050485; x=1697655285; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yAITkA43oBRq5wNnpQLBgM5d0bUs6osx3goAerw1Zs=;
        b=VEiYAV/BFXsir9T/SW+v04R7JgUGa/n7mhMrZOMmhabuo692QNSJrjEuYzgoIcATGK
         xCi0wWNdipKtnQJ/yBXqQ8z85QiCw278CYLymFgJEMiK2nat009pRO2DpL7Gi25F7Y61
         9WYeYNzGxmn/RaeCfwpBwXRp7hNXw/uGT/PWOlmg/8ZjuXXldFozTDHeBM+/w0yhFg55
         NJgf2mFxF+DHCvMJK5FUW1XUG8PWhQXjy9B2kfMdS1X6OM3gKm5gAwUsWY9TP8eGXn6L
         kFZKvB9CD68woJVKYUKAibuHiXaoV3yG6fI1ipbE5oLdLVIwZ92/BWhSQVNhp7BY/w0I
         JExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050485; x=1697655285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yAITkA43oBRq5wNnpQLBgM5d0bUs6osx3goAerw1Zs=;
        b=V2LL4or4pQ8oXnQxDhovLNxnpE7qbGFflAVnqsyy0PrtvUwob3lcv5ldyTBGiZHuTI
         cQ22IjXX1IjLRBE7gxwwSpwbtS0MRB3Piz70SajndyDSdern8Bliw/2E38V3j5YMucG5
         T8oFwdgY1je0QIKTTGbFySI9iIN+xJwFkn4lpUM0xLOCEEjd20UsdLa9lUScDF3/pITI
         SiEHRPoP6IIWTXrAtyQVOzJ5ttErkdhvuHn7Yo2rGwNgyxaqS5cqw4bTsrAsmQMcS+eY
         wDpXgzDbpvVkUFEhC6ZfB5FrqetkiDWNDUE1ys07tcBeUH7NCG+msHMb05QC9pd7w9Rm
         vtgQ==
X-Gm-Message-State: AOJu0YyhfQF52K02+WfA/F3z/g0bE8y1uXejZEmOjYHj4k9fQCFe8J69
	d8lLsjhYFiGYLaNTuKQDw2lqfJPE6wrLo5RH2baL9A==
X-Google-Smtp-Source: AGHT+IF2ZH9G5DtfhwrC1grow9snCHgNZ9i9qEm+hDBJbApMW0zlGdoIB5EmMSZ9fCki9SJLAlPeNOp5FVB21fst9pw=
X-Received: by 2002:a17:90b:46c7:b0:277:4b68:b93c with SMTP id
 jx7-20020a17090b46c700b002774b68b93cmr20814772pjb.4.1697050485416; Wed, 11
 Oct 2023 11:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-2-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-2-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 11 Oct 2023 13:54:34 -0500
Message-ID: <CAPLW+4nipk9sae2UP6Jp_XXtHQMKbNpjGC4F7RW8GTuF3EtRBQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/20] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
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
> Add gs101-pmu compatible to the bindings documentation.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index e1d716df5dfa..9e497c310532 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -15,6 +15,7 @@ select:
>      compatible:
>        contains:
>          enum:
> +          - google,gs101-pmu
>            - samsung,exynos3250-pmu
>            - samsung,exynos4210-pmu
>            - samsung,exynos4212-pmu
> @@ -35,6 +36,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - google,gs101-pmu
>                - samsung,exynos3250-pmu
>                - samsung,exynos4210-pmu
>                - samsung,exynos4212-pmu
> --
> 2.42.0.655.g421f12c284-goog
>
