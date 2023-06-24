Return-Path: <SRS0=mqJN=CM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421D1C0015E
	for <soc@archiver.kernel.org>; Sat, 24 Jun 2023 08:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29684C433AD; Sat, 24 Jun 2023 08:24:21 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A3E5C4160E
	for <soc@kernel.org>; Sat, 24 Jun 2023 08:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A3E5C4160E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9875c2d949eso192366266b.0
        for <soc@kernel.org>; Sat, 24 Jun 2023 01:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595053; x=1690187053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUb+krGwN/aq//L4Czp4P4ZaV1gvYMjmNFcm0YMeIks=;
        b=eYA3UJqMnYNFBT5YZIdndLK6CYo10TAEJUhO1rkDE5wRgXG7Ro1wa+qDplNjiUeBFI
         nBfpUZwFUh5v9V0WrZrJeifCf1f/b6uFDUFZoPQm9zNraIfrLhlrbVS80/F2KZEqy4bP
         7hXfD0f97dggnTdpI+BcBXGROELwxH6n+nxaqPqwOd5nSUDFjPdenNs2GXZVqoCsfhQv
         5/Sak6C33KxreCsmFuTYXzOnBrOxrQzvQIcDIM/M2Ps1qpkZI93NLRAvWZzSKar82V1/
         ccuWAs8GicSYXSdAi7pIE82U6LX24WK5SjWwFbkXh6T0cFvSd7CU0QGDwwXBNlDsqGUb
         tV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595053; x=1690187053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUb+krGwN/aq//L4Czp4P4ZaV1gvYMjmNFcm0YMeIks=;
        b=XA7iWG9p6eZRmE2N0EYSDJ2UoS3eqPt7u5KzSE4W7LyjkINw96V3u74BjhQ693w+Cs
         BXNMW9JtyzNMllvRbrJS6qsLpNz0fjQf2KSUUsd6+RBTq36mi01vT8vbqUi92Hlux/vx
         WEUjUsOjRaydRvEMa03Q8IgL5GSGkfjOd09JZ5oaV769fM5TWmLrbwYaBnFrEmzaJ0Ot
         GmW/m7kYcXx4tHyYisSP6orgy4rszMCUMRoxRa3hXZAQgHHch1FLndh4dBS8EH10grWv
         qgWw13qxsS6bqXrT3WQ27iRSFzmUWvMnwED5HryteLpJ9VokJlZ8pC0KkBKKUTWAoX6e
         sjFg==
X-Gm-Message-State: AC+VfDyVp7QTZVvgXMgdToLUS+ZIQS+5ZE8V2u4HX/2JWw8Yq3Uip/Jg
	rNNKNCg2w8FgUfibORnDXCJGXA==
X-Google-Smtp-Source: ACHHUZ633G3vozqxhYSlb2/G6s1lR3tDI248WrtY+qSGpfA/pYjsCnzPQDLjOoJSYY1d4qs/oFcuJA==
X-Received: by 2002:a17:906:da84:b0:988:f307:aea7 with SMTP id xh4-20020a170906da8400b00988f307aea7mr14027159ejb.7.1687595052667;
        Sat, 24 Jun 2023 01:24:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id c15-20020a170906528f00b0098866a94f14sm610407ejm.125.2023.06.24.01.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:12 -0700 (PDT)
Message-ID: <8f231d42-1022-0595-2dc6-24817a7495b4@linaro.org>
Date: Sat, 24 Jun 2023 10:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 22/45] dt-bindings: atmel-smc: add microchip,sam9x7-smc
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 tglx@linutronix.de, maz@kernel.org, lee@kernel.org, ulf.hansson@linaro.org,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, p.zabel@pengutronix.de, olivia@selenic.com,
 a.zummo@towertech.it, radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, linux@armlinux.org.uk, sre@kernel.org,
 jerry.ray@microchip.com, horatiu.vultur@microchip.com,
 durai.manickamkr@microchip.com, andrew@lunn.ch, alain.volmat@foss.st.com,
 neil.armstrong@linaro.org, mihai.sain@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
 balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-23-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-23-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add microchip,sam9x7-smc to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-smc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-smc.txt b/Documentation/devicetree/bindings/mfd/atmel-smc.txt
> index 5696d9fcb5dc..1eb2606820a5 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-smc.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-smc.txt
> @@ -10,6 +10,7 @@ Required properties:
>  			"atmel,sama5d3-smc", "syscon"
>  			"atmel,sama5d2-smc", "syscon"
>  			"microchip,sam9x60-smc", "syscon"
> +			"microchip,sam9x7-smc", "syscon"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

