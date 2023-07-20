Return-Path: <SRS0=8xwM=DG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8F7EB64DA
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 06:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48860C433CB; Thu, 20 Jul 2023 06:10:34 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2518BC433C8
	for <soc@kernel.org>; Thu, 20 Jul 2023 06:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2518BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fd0f000f1cso2432245e9.1
        for <soc@kernel.org>; Wed, 19 Jul 2023 23:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689833431; x=1692425431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FpwiEpwGN8y+xovE4mKCXxps5VNG9/n20Ieq6eiPqzA=;
        b=qkGS9umnljS3kdKjIQuojE0tAbfxQfUlhFeuot80GZluJt97aGuZZp3lhyxgrLc3eA
         YIL3NT+IeKcW/Rv6fekthOUNZaDlOXf8CghId3NeVhfbgBgF8PVgg1h38DwsgnsmwlGV
         fnDQoHX5H+aIB7s9BxBYaEJBBHXOB0N/LONQ4d5mCkWwOHnXzeAU+NZSHTs9F77jacvl
         xCdQHLcGjFk5Zh1TxNfnM+ZIlPW+5uvYnQCTM7nnmnNQlRFqSdQwchnkqsxPN/cqtIbs
         /+4cUNjc4YS8VeQVJknp4RHx2qp+hHu5pGq+KMMg25K/3ZJvNXPaQfziTnYvCNAqmQE0
         oBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689833431; x=1692425431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpwiEpwGN8y+xovE4mKCXxps5VNG9/n20Ieq6eiPqzA=;
        b=ZRIIV7a/Pv+62WcEP4r8lZdoX5KNq/H/s+W3KfyklQernt1Hi1U1O0IBjsDyFopxgu
         MDceVGFyrrTnlWfyuVSxPW3Y2AAYRojg1hYqs6/Sm3ZPSGkYFgW5ea0vd7BVFd6jtVQq
         2DWjBmtUBhOAkDV6fkZFcsj/v4NFbC+GMqnKATTLSKkaE+OL5tBiSR51c6oium1lrezB
         kJA0h3RLTS8+1n3cazCs69569IsdBz91diTksGg2chCRsLwsRU8R8q63SpdDXFxq/cdZ
         Fpbo9T93imBgAoIQCSVauz69lqtO6Oy2rC8AR7axFzfiSFLHQODwvYQaf+hr+EVlnr+J
         nU9g==
X-Gm-Message-State: ABy/qLZHX4sjvq382vFVEAhhOaL8taEdsds+KU0h4pN9NMS47X4I4C+1
	jt0+U8HIiuxhmR4blHtGJ0mt3g==
X-Google-Smtp-Source: APBJJlFtLga5FHzClZTE6RYqbVdAQwZvzfYfA+aMitkMLEwtJitrvBM0xwRGH93LMaMYXjWJKgl55Q==
X-Received: by 2002:a05:600c:3797:b0:3fa:9741:5b73 with SMTP id o23-20020a05600c379700b003fa97415b73mr3503203wmr.10.1689833431076;
        Wed, 19 Jul 2023 23:10:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w9-20020adfd4c9000000b0031423a8f4f7sm246126wrk.56.2023.07.19.23.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 23:10:30 -0700 (PDT)
Message-ID: <7889ef36-90ee-222b-fe67-ab4e127d1df6@linaro.org>
Date: Thu, 20 Jul 2023 08:10:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Document nuvoton ma35d1 rtc driver
To: Jacky Huang <ychuang570808@gmail.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@kernel.org, mjchen@nuvoton.com, schung@nuvoton.com,
 Jacky Huang <ychuang3@nuvoton.com>
References: <20230720012826.430026-1-ychuang570808@gmail.com>
 <20230720012826.430026-2-ychuang570808@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230720012826.430026-2-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2023 03:28, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add documentation to describe nuvoton ma35d1 rtc driver.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  .../bindings/rtc/nuvoton,ma35d1-rtc.yaml      | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
> new file mode 100644
> index 000000000000..08c30f3018fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nuvoton,ma35d1-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Read Time Clock
> +
> +maintainers:
> +  - Min-Jen Chen <mjchen@nuvoton.com>
> +

Missing ref to rtc.yaml.


> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,ma35d1-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false

And then use unevaluatedProperties: false instead.


Best regards,
Krzysztof

