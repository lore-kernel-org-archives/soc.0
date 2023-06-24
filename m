Return-Path: <SRS0=mqJN=CM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8469BEB64DA
	for <soc@archiver.kernel.org>; Sat, 24 Jun 2023 08:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 639A6C433CD; Sat, 24 Jun 2023 08:01:49 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 004D8C433CB
	for <soc@kernel.org>; Sat, 24 Jun 2023 08:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 004D8C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-98e0c1d5289so2154866b.2
        for <soc@kernel.org>; Sat, 24 Jun 2023 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593702; x=1690185702;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9HaHZDehClxR9T/qxmaslajrl1EPqKVL0R9NY/jGTsg=;
        b=F3QDL4q8VywBoEOgLA003XEmcfdYtm3Ea0matX93IHzoJEv8hWPz4+c37arSFLlHPJ
         KJiKcZZsCJW3EISQa/0WZr7GmFkHehvHcqCTL77aPrpRtf7wWxpMpUHHteIIi/i6WgrA
         P+PyBeA1xhafgy3H/e2UWInSjheEjPAhT1BMP3IiTNbjmRYdvtR5v1zPluKBxz0S3DCW
         wy2fTJI3bg3cbA/DNbDMu9pAzD0bF/mNG4WsH3QsxXMLCCGLPK6NC8MJ9l8TNSf1hLUM
         58xmuXiAu9nxjdyxt5KPAyhabLHOsvTKYI7E3U6I1s7LAWe0FlD5wup3cDa7Ngf3ArIy
         5drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593702; x=1690185702;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HaHZDehClxR9T/qxmaslajrl1EPqKVL0R9NY/jGTsg=;
        b=aFFZPsiwXEv5m/oJ0+KBYQ+Xl/5QkCfLlQlATE+4pXLiOvg5mEbpF1WrXyf3k/rhPy
         8b7MbXazQPX/tdaNswIkFsHohijeaaLlfHAvdnP98TcvJre+sNLfWlrqt1FuO5BNtJHr
         AibX3ctVXm8/Yy8oa1aDv7dM8zWAyzs3K55P/sXo02T9hCBsM+aac0lkxoqrD4dEBCQ1
         g92lnfRPhKdof+kY2U4ja1fzhGK9H1IZZTFu2y3RMt2QQzpyAqgtJCsti2I6aSZbXFxO
         zlpUFfC/KQLRXkYHdDD7DUuv5hyvg2ZAohkHgl2Nn6Z0reY7DI392uiYpVQJAuhxmNT5
         ev3Q==
X-Gm-Message-State: AC+VfDxk9xmD4sEuT15pHQ4ke0/28mPOYMn0x/vVeRRNjxOUvL22N4cI
	BffC1JqsWKkVDO6Sa4t/OUHb7g==
X-Google-Smtp-Source: ACHHUZ7LZUuSsLPmwaJcMGBzTaxcrMKmP11V5Fuvqcxhksu+1Vgcylqr7l5RCc1ndNOBQHLG9wFOKg==
X-Received: by 2002:a17:907:3f18:b0:978:6e73:e837 with SMTP id hq24-20020a1709073f1800b009786e73e837mr23104557ejc.4.1687593702085;
        Sat, 24 Jun 2023 01:01:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qh15-20020a170906ecaf00b009885462a644sm587108ejb.215.2023.06.24.01.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:01:41 -0700 (PDT)
Message-ID: <44780d35-5c90-7195-1dc6-019e54944af0@linaro.org>
Date: Sat, 24 Jun 2023 10:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 27/45] dt-bindings: rng: atmel,at91-trng: document
 sam9x7 TRNG
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
 <20230623203056.689705-28-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-28-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add compatbile for Microchip sam9x7 TRNG.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> index 3ce45456d867..7e4dbf5e22b4 100644
> --- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> +++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> @@ -17,6 +17,7 @@ properties:
>        - enum:
>            - atmel,at91sam9g45-trng
>            - microchip,sam9x60-trng
> +          - microchip,sam9x7-trng

Same as in other cases, so just to avoid applying by submaintainer:
looks not tested and not working.

Best regards,
Krzysztof

