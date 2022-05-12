Return-Path: <SRS0=vWm3=VU=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592CAC433EF
	for <soc@archiver.kernel.org>; Thu, 12 May 2022 14:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 126C9C34119; Thu, 12 May 2022 14:04:19 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5EFB8C385B8
	for <soc@kernel.org>; Thu, 12 May 2022 14:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5EFB8C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id y21so6417715edo.2
        for <soc@kernel.org>; Thu, 12 May 2022 07:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ObfwnmtrxkKT50YzmCvliwo/dT5DMiUQiO0PH0LTMx0=;
        b=PQYeTpEbK+tYHe872qmLftAqI/d4BlbDIDFQkTYjTxrBTRNjTmDJ1qyGjiB2HlDqGQ
         9xauAiYkkluMogshl7JwT76akt+9lCQyiq7k9ZN39Mu+eVSBGvX7Sn6hkPEyMdu76izm
         wyOvXOhrZ9lEzFlAztS4dKVJ8bDywjg0D9FGFCC3kiHDpyx2kLAcD60elGv8jateClaN
         jw5WlU4lTHCq2K2YK4364eAdCpSVVA4YjiBJCJYHFiqTp9DzeQMa2j+rHTGzwBm/23oi
         syJHx5eyczEpaX31duAOMQdfUm8XNHp163ZsIhJ0SkBe82I4N+8ZLekjfg3+6kgd5lA7
         FbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ObfwnmtrxkKT50YzmCvliwo/dT5DMiUQiO0PH0LTMx0=;
        b=Zm/LLAgox6/KnDOwv0zXd0aDfpVS/Cjp0znRbO0bVt2kUHq6yh8MKxWJ5j7+3DI+3y
         4azwDA6B2Gl728vJUrEGLvTG12Ma43n/xtLlX64BQFh/IfdeF4TE9VWWU5H+4999lueq
         2WuEYsFG1mefkaL4BJVSEon2yfT25x/EwqH3FdD4Vs1SgNfIysH3AhP+TMsPSH0405zq
         rEOiZ1K3d36vawtNYz9M1Clf/phAh2V0MOONC2nK/Juv6H0Lp1yh7kR667VtlQXp2ppx
         pyfrKXYIECalnUB0Km92wnNvpwTT+AOA2u4IbK/SWfBCmLweE566/vR8SXIwsOqRovAg
         J3Cg==
X-Gm-Message-State: AOAM532V4hNJY7j5T8iJuQ37kuoNDV5UaD4AGumW4i8wNfFdJmppcJxp
	bV7W96coU3qF12khzTuccOjroQ==
X-Google-Smtp-Source: ABdhPJyTJw8+7v3GXv2bh38/HEmQHaY6esp5J8bzfqvccK20LUmGMVe7oaS7gE+migdw2SOqftSY1A==
X-Received: by 2002:a50:ea8b:0:b0:428:7d05:eb7e with SMTP id d11-20020a50ea8b000000b004287d05eb7emr29484883edo.185.1652364255711;
        Thu, 12 May 2022 07:04:15 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id rv21-20020a17090710d500b006f3ef214e06sm2133546ejb.108.2022.05.12.07.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 07:04:15 -0700 (PDT)
Message-ID: <f0969769-9f24-7e48-6a60-adeea94404e1@linaro.org>
Date: Thu, 12 May 2022 16:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH V4 2/5] dt-bindings: clock: Document MA35D1 clock
 controller bindings
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, catalin.marinas@arm.com, will@kernel.org, soc@kernel.org,
 cfli0@nuvoton.com
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
 <20220510032558.10304-3-ychuang3@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220510032558.10304-3-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 05:25, Jacky Huang wrote:
> Add documentation to describe Nuvoton MA35D1 clock driver bindings.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +    clk: clock-controller@40460200 {
> +        compatible = "nuvoton,ma35d1-clk";
> +        reg = <0x0 0x40460200 0x0 0x100>;

I don't think you tested your bindings. This fails.

clock-names below as well. Please do not send untested code.

Testing is explained here:
https://elixir.bootlin.com/linux/v5.18-rc6/source/Documentation/devicetree/bindings/writing-schema.rst#L111

Best regards,
Krzysztof
