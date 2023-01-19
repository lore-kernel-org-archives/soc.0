Return-Path: <SRS0=xk3N=5Q=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC624C004D4
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 16:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8CD3CC433D2; Thu, 19 Jan 2023 16:59:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6B40C433F0
	for <soc@kernel.org>; Thu, 19 Jan 2023 16:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6B40C433F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so1744313wmc.1
        for <soc@kernel.org>; Thu, 19 Jan 2023 08:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LV44S3ldv5lygu/CrHxyQKU6fhqqXWCsofGRUG99bnY=;
        b=prpXlF7WmAli9rpBOLUhG4QAYljIVzqJ4+dH33WiBEjsX7Qjru2HyIGh6kMkIRzOf2
         xraiRgLXpIN3jVl4GZNnLnr7NdQeZWZuV9BMmW+RXQDASjr2IEekgpM1eww9+qNIfhDD
         L/a6EHN+UZsVa5NJgAvsxv7F44sKHDibD84/sQ/BxRZu1U31NElF4umC30BYizQQwzm2
         EdXGHjbTZAZ2GklYCexv0C3rQQnfAkCqw9FKtRm4eHmAAeZ+Jhn9W6Jo7GJOuNuwq46G
         5Y5iG6pc2N3YKdtPedfy7jVaVo5zIbgUsKSPTlpNLN/Qgd5cywfofHxDNLt+vWvlYFtH
         klsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LV44S3ldv5lygu/CrHxyQKU6fhqqXWCsofGRUG99bnY=;
        b=uVAH777GIGvD5hk0OvpekcwdgZD0ppncxHcwqi6Dm0FVp7bRPXoI0fBOhk6FSVjchQ
         dSu9xiGUfPskndS19PNnEyBha5Uq4Az3oqRuIZX1TQ1uikvw1eDMt8nanat5HCuiEl3T
         knk7Fdpeijp0DtaESu8AyMrtZbO6KgzTmBbMC1hzm3oAri2Oxm7EUlNKtjNyRC6BFa8N
         lbuwU23xNmYRhQSrumnP3m3/4qeuOA138jPgX6aKFTWA2vzgh1CdFCsqg7QX7Q0k8X+8
         mchRDIXRPXB/+wwr/NqYFbff8AuTtl1Dx8VZU/AL3kuZuJrEEIAi6c4oq+LL4rh/OQ7S
         uY7w==
X-Gm-Message-State: AFqh2kqHyDKCA+s089Q1ssWoegojqi/UHOb0/6OskxDqYtvNGxxF9QoQ
	LxrWbf1DppzyOhv6ZSIojy+TqA==
X-Google-Smtp-Source: AMrXdXsRTt+geOGIxIMsm3W7L5TK1nf235RxWM7ZwHxugRJoVkLBxcHH9DXQGDgGXdyYF+oAG1hCgA==
X-Received: by 2002:a05:600c:c05:b0:3db:2252:e50e with SMTP id fm5-20020a05600c0c0500b003db2252e50emr2707012wmb.24.1674147562058;
        Thu, 19 Jan 2023 08:59:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b003daff80f16esm7341494wmq.27.2023.01.19.08.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:59:21 -0800 (PST)
Message-ID: <3c1b8078-1f23-aba7-f3b6-ddead64e85c8@linaro.org>
Date: Thu, 19 Jan 2023 17:59:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/9] dt-bindings: arm: fsl: add TQ-Systems LS1021A board
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Marek Vasut <marex@denx.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
 <20230119144236.3541751-2-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119144236.3541751-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/01/2023 15:42, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> TQMLS102xA is a SOM family using NXP LS1021A CPU family.
> MBLS102xA is an evaluation mainbord for this SOM.

typo: mainboard

> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 3ba354578e8f9..b54a920934c9d 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1164,6 +1164,13 @@ properties:
>                - fsl,ls1021a-twr
>            - const: fsl,ls1021a
>  
> +      - description: TQ-Systems TQMLS1021A SoM on MBLS102xA board
> +        items:
> +          - enum:
> +              - tq,ls1021a-tqmls1021a-mbls102xa

Can mbls102xa come with something else than tqmls1021a?


> +          - const: tq,ls1021a-tqmls1021a

Why duplicating ls1021a? Can tqmls1021a come with something else? This
is redundant.

> +          - const: fsl,ls1021a
> +
>        - description: LS1028A based Boards
>          items:
>            - enum:

Best regards,
Krzysztof

