Return-Path: <SRS0=mqJN=CM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DB0C0502B
	for <soc@archiver.kernel.org>; Sat, 24 Jun 2023 08:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 504A6C433C8; Sat, 24 Jun 2023 08:02:49 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D637C433C9
	for <soc@kernel.org>; Sat, 24 Jun 2023 08:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D637C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-988b204ce5fso164340166b.3
        for <soc@kernel.org>; Sat, 24 Jun 2023 01:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593762; x=1690185762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jaGxY+NnkNtbiINqgZVIrn7LMLj+M5ushBYs/d6ygok=;
        b=wqE78Bjpv1t5dKFhHhDhMoV92aYtCYguhWZl46HmIFMY/ZYzcQ7nxZMVPgCUgGB8xg
         iEYx7lVP7Dh+5WNSPUcyPx3XUZtjuz1PKQ/7vup1QbkdYdyxiJFZQ78lEtuLCrJnlqzZ
         ogwVFrABwuW93fytr1BdboR07q3DiERXys4iP9Xd2S+9gtE6BZEkuX0OOnulaSmEknOR
         bb4dEcYg51TVvI0TN1VqycWE5eX6gP9xuB51AuUVCy2TD1yfN2Kowa0XBnrxBlP/+rEZ
         Wyc8CHxadG5JMLVAOsXqHZ53ZWZxJr7WyTvXZ0MuPxgWt2EG+GtX7XHYBQ+aZaSKTevV
         TssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593762; x=1690185762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jaGxY+NnkNtbiINqgZVIrn7LMLj+M5ushBYs/d6ygok=;
        b=IhdvX7varBzG+g8iDrhNcTnOvS1msU7Zwq4BHs2VbB0Icc2MhqOCNl7hUXMEq6HYYT
         99xKdjQxo0X+Sd7hDltHZy6LS6jX27UbGdTSeift7FQyv6aggYctTzkAnV0yE5iQbIXJ
         m5N96lvbDvXBH8ORSvyP/L7UfHsnxSnjKhru08f8C60Rltdq113tst0VgUorcl+z6ln4
         eqgyjOnvj8aDY5/m/3i3UZgrG4E2lHosQUMb8PDiFTHWqhhKaF7ZQsNttJpKSnZPlSJX
         x+yv/4g/QiZsn0IzxTH0cXw9AqTd018hITgV9nKnsp7uKnJkXxkbckPqx+vOgBqrMIz+
         d/8w==
X-Gm-Message-State: AC+VfDzm5sNN6WKmgbZ5esd5zv0PDsj6rN1QBVt7ply1NL4XYa3xmuiL
	8hj1bXb+MUGLPfr8yl7uXV7BxQ==
X-Google-Smtp-Source: ACHHUZ6vL+lt0p59DekkavEVRdH+VurtmvBUx/CDPLLIsizULEgMBaYfOxG9eWuvaLpHLjFTBqHNMQ==
X-Received: by 2002:a17:906:5d0d:b0:988:cbf5:3a80 with SMTP id g13-20020a1709065d0d00b00988cbf53a80mr15099774ejt.62.1687593762629;
        Sat, 24 Jun 2023 01:02:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a2-20020a1709065f8200b009878b0b5302sm619453eju.98.2023.06.24.01.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:02:40 -0700 (PDT)
Message-ID: <2d3f27ba-62ce-b37f-3672-df8ee58cdcc0@linaro.org>
Date: Sat, 24 Jun 2023 10:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 31/45] dt-bindings: atmel-classd: add sam9x7 compatible
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
 <20230623203056.689705-32-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-32-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add sam9x7 compatible to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/sound/atmel,sama5d2-classd.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> index 43d04702ac2d..d53addbcd41b 100644
> --- a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> +++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> @@ -18,7 +18,10 @@ description:
>  
>  properties:
>    compatible:
> -    const: atmel,sama5d2-classd
> +    oneOf:
> +      - items:
> +          - const: atmel,sama5d2-classd
> +          - const: microchip,sam9x7-classd

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.

Best regards,
Krzysztof

