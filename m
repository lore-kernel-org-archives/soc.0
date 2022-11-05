Return-Path: <SRS0=2Qxn=3F=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2838C433FE
	for <soc@archiver.kernel.org>; Sat,  5 Nov 2022 18:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76EF4C43470; Sat,  5 Nov 2022 18:44:11 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E9B8C433B5
	for <soc@kernel.org>; Sat,  5 Nov 2022 18:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E9B8C433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id h12so10671727ljg.9
        for <soc@kernel.org>; Sat, 05 Nov 2022 11:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqM95oaPnJH5MWhlRXsh/pWYkhJUcy6fi/S/KLDeWUY=;
        b=i8fgFmifmE2Phhsq1JPfWQNpmrQX0+ooyicsgoxgtQAmqDeRap3MBc7AoGm0MJ7M3M
         Har1YTulusg/2t3IN/iBpL3sK3EsnGVE/pGFJlCjTe1xrZb46hVwZKzfz65FOmc1Uz8R
         rmwsRRKwlnbGBfN4dYB1qptl5Yfu1PNVZV9rOH4zQFXNYqjRBCMOwVBHgUW+Vrfxawt6
         wGf/Q0BoF2U23YLWy0YQVKf3Q2oRqK1PrEldxJ1zHXSS6wPpoq7WK/wC/qjetG32yN47
         Q1lq/MB7nBpivCwjpjVYSsbjan0knjOuKIqeZZPKM6PNmY0W2Voove26aW731rivYfKm
         nmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqM95oaPnJH5MWhlRXsh/pWYkhJUcy6fi/S/KLDeWUY=;
        b=OoSf7WmVczBHOtmRtMaj5kreYC4BDp0HEDL+nadg+/LxwYBWyIaOXNGgzNsMTXu2Bg
         xrjerYO+P0yGrYshwhF8wq+lqNP0dI7sqBxX4/ZDl8QSzjbZIBX1ACAi2CbeE7u8Hgev
         En8X2UFiWPA3W2ckz+lU6IPQ/y+JgUtp3d+OTDMzVeYCYYmX4xAtDZ54eVWS7g0fXsLb
         OtXmQt45E5Aun3qvftakP8sxWBpHCy+1YGQRj5UxK71QKH6vbIRAxjYQqj9ln3oOGy1L
         UXbH9LrZBfv3Bxcs18dNsRjzMM1+EW5inFWBk3rap6EtW9uRUpFmuZmP5mfKEE1CDPYp
         tQ8w==
X-Gm-Message-State: ACrzQf0+EXAbXJQHOSQDRM6LM8A26gBxJ+P5+QRDCMHjW7OJwazQdG8u
	lpjtjD5zTN2qX+dyNOKjFEaWaw==
X-Google-Smtp-Source: AMsMyM7OO4zYB/vcy8i1R2jRRjgDN+xMBxQNR3RbzhMCOaS4aSSPJtSTQhnXBAgmsT65yZmr79W0Ng==
X-Received: by 2002:a2e:91c4:0:b0:277:e53:151a with SMTP id u4-20020a2e91c4000000b002770e53151amr15950844ljg.81.1667673848114;
        Sat, 05 Nov 2022 11:44:08 -0700 (PDT)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id a21-20020ac25e75000000b004991437990esm386360lfr.11.2022.11.05.11.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Nov 2022 11:44:07 -0700 (PDT)
Message-ID: <35b095a0-6bda-32c2-99e2-6815a852f9f0@linaro.org>
Date: Sat, 5 Nov 2022 19:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
List-Id: <soc.lore.kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, soc@kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20221105013321.2719-1-zev@bewilderbeest.net>
 <20221105013321.2719-2-zev@bewilderbeest.net>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221105013321.2719-2-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/11/2022 21:33, Zev Weiss wrote:
> Document Delta AHE-50DC BMC board compatible.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

