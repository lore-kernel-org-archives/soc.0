Return-Path: <SRS0=+ipK=R5=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125D0C433EF
	for <soc@archiver.kernel.org>; Thu, 13 Jan 2022 13:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CBF70C36AED; Thu, 13 Jan 2022 13:32:18 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 217E9C36AE3
	for <soc@kernel.org>; Thu, 13 Jan 2022 13:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 217E9C36AE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 94B0D4074F
	for <soc@kernel.org>; Thu, 13 Jan 2022 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642080736;
	bh=t1fGsqpmZOTRML60TK0WG2DkdgMd68nNzRyjYpnjGrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=q4U947S+xXjiVgn9EudUGrn1j1lymfHBpYvE2I+4pMMHnN8xEnQof/YDWAym4QN7Y
	 ILYs9GV1KVK3jL35L9UzE9WXzcJzUMpFGwc1Qlw34wivqTK3ufPu5Voj9qTmjGp7xo
	 AVVHAvDm8QqRNM2hnzJ/dKkceIF95gi0D+BNzWAS4eODfUkqQoFcRAYL1iBUlNVMw3
	 GIeJ5HaBygClwrC41ZtjU+VkvYf6h5qhmnPSPxBJtfnQjkK0mZxNw3N4kFVJQvX7rA
	 FVg2BX7bxtJSYK0XqTYyz7nkiOxS5irGAwqm2wt66giN0AmOQJMTtWos8PUIPrHfix
	 bF/+UWKrRJjxw==
Received: by mail-wm1-f69.google.com with SMTP id 14-20020a05600c024e00b0034a83f7391aso2312825wmj.4
        for <soc@kernel.org>; Thu, 13 Jan 2022 05:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=t1fGsqpmZOTRML60TK0WG2DkdgMd68nNzRyjYpnjGrc=;
        b=7I6/J8FLD5yaDtwBg8s223zexzTrkWThnmFo6VFrCWuk9Zv9ZTHLZF4vpC67XTfIkA
         vyBDMBUUKvm3iWoIyXU5x+Q+AAlX2jdc6aRLtW5hVBJpqMCotYZ1njDoL9mcBUeph1T4
         Y1CSEAWcddbU4om8TTeE8vSexa3p6eM+DCht0VL7rVFbIU2T2iaQOx/7DYfOLBnmsUEL
         X1aY9LjMiIZYsWwRNphKZb8vym+0C/E+5BKngw6tHJpr0egB7cyqNCNm7MhBvXPuD75k
         ucHAXiMk2P/C7cuOtjoQyN9QtNhKuD9+X6EziCDUCOjOa2A2LsAzXZfTtxKBPI81am47
         zFKQ==
X-Gm-Message-State: AOAM532o6sktMV8tu/9FJH1v2NQPnUQ693nQtcoUUH51R4pj6QHlzlXC
	FDMt7S493YsuDGivKvA6tREDL6NvxCuULcBQic1/tB3crSVlx4jdXcqBdfjHQAcbTizP7iQo9gI
	KLyeRUlUZjnBmtK7hwdRDWy4=
X-Received: by 2002:a05:6000:18af:: with SMTP id b15mr4109168wri.616.1642080733761;
        Thu, 13 Jan 2022 05:32:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGbdSMulTQPsY60UuoLAuZAuY6P+aX+jB+ZR3YiMMLRRXKaWDybBcgGidUepwKg+fmquMeJg==
X-Received: by 2002:a05:6000:18af:: with SMTP id b15mr4109138wri.616.1642080733499;
        Thu, 13 Jan 2022 05:32:13 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h10sm3615799wmh.0.2022.01.13.05.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:32:13 -0800 (PST)
Message-ID: <75ae8b8c-e416-5007-b995-f1317ef207d4@canonical.com>
Date: Thu, 13 Jan 2022 14:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 20/23] dt-bindings: iio: adc: exynos-adc: Add ADC-V3
 variant
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, linus.walleij@linaro.org, catalin.marinas@arm.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com, Tamseel Shams <m.shams@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122447epcas5p266d44c8df143229d22dfa700c285a786@epcas5p2.samsung.com>
 <20220113121143.22280-21-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-21-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2022 13:11, Alim Akhtar wrote:
> This patch adds a new compatible string for exynos's ADC-V3 variant.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Tamseel Shams <m.shams@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index 81c87295912c..9303053759ca 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - samsung,exynos-adc-v1                 # Exynos5250
>        - samsung,exynos-adc-v2
> +      - samsung,exynos-adc-v3

Please use SoC-specific compatible. IP block versions are tricky because:
1. Documentation/datasheet mentioning which SoC has which block version
are not public.
2. Neither are public the datasheets for ADC blocks.
3. The versioning of IP blocks can be inaccurate.


Best regards,
Krzysztof
