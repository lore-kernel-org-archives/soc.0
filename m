Return-Path: <SRS0=mqJN=CM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABB1EB64DD
	for <soc@archiver.kernel.org>; Sat, 24 Jun 2023 08:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 219FCC433C8; Sat, 24 Jun 2023 08:24:52 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AF84C433A9
	for <soc@kernel.org>; Sat, 24 Jun 2023 08:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7AF84C433A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so30566066b.2
        for <soc@kernel.org>; Sat, 24 Jun 2023 01:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595085; x=1690187085;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/1MyAMnY+Za4p1Z3b6q8vQY3JjDEV6jQ0tLk7ro11c=;
        b=vEp3OTxw3d1bxXmcrGbjPTZvGdATt4kPb7wTR8P+STWcYy+IGxBjmsrwXHlsdl+475
         D3HkXaVWkfKkJd8Y1v8mJIJNd7MKu+DSOBpGH1R/wozFufpVZ4WggR5v+D40MBe1DSSC
         xIxqP9drpnReATR6sXOtXazHadpPvVE4WXYIX8p8txCkuf3z8X9pyH76wlzCm+qOtyk4
         gvPYv/GZefHyoz4e7fucZIFONAUje8+rTmDzHlmEROrBOi8nsQuF66lLuDZBLi0jIYoP
         HsEXJZtaKyd0E+mlUCbFPj9PypWzwjLssl0KqaqVaVTXlEmAzs4cO8YEpP6UmKpo1O/B
         OPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595085; x=1690187085;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/1MyAMnY+Za4p1Z3b6q8vQY3JjDEV6jQ0tLk7ro11c=;
        b=KqW3jsdYbJogV+vaqZpzUz8fym/TjD/eRMHJA0YVwhZVd9pqBu/2Tagrox99dM/his
         Cy7ciY++5Ful5rDAM73V+PtcZA2aoTQQBk3otVbIBV+r8bMdHjnnihsWDKC1Kj0w+I9d
         a+44jKqE40dGUSGtjFB7qKnJm+oVO8JPCeamhG9mzREBc+8mtCbtlM3+pxNRwqG3GnJa
         RixKRbvMi5zjh8XOssn4zXiOm8ChG+JsSR51Q1ugZ5FFjUiDwqQaYWKLcHhnNZoMN3dK
         9AIlEOOb+KmF7PYnpY7s/7fI5p1ytwM99Z0xWPtlaIdtVDFqrO3CYzHxLsw/SBAT1iDx
         RLww==
X-Gm-Message-State: AC+VfDwD21QJNp7wvlZBaXogPLsrTtNG+KYToUUnopueFf8GOoVENO+7
	ZVJPeUNgbWzSstm21Ck/z4p6Wg==
X-Google-Smtp-Source: ACHHUZ6cYsMw0LIHQWddUSwohWm7hR0wZwIOc//Ha6WVz0kylI9t5vWz4f/hmDOCHTFgPVqzAQ5yVQ==
X-Received: by 2002:a17:907:3f87:b0:965:6075:d100 with SMTP id hr7-20020a1709073f8700b009656075d100mr20942422ejc.39.1687595085678;
        Sat, 24 Jun 2023 01:24:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id re3-20020a170906d8c300b00977ca5de275sm639460ejb.13.2023.06.24.01.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:45 -0700 (PDT)
Message-ID: <c9cbac9c-40dd-bb40-0d92-e25e767f486c@linaro.org>
Date: Sat, 24 Jun 2023 10:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 26/45] dt-bindings: pinctrl: at91: add bindings for
 SAM9X7
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
 <20230623203056.689705-27-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-27-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add device tree binding for SAM9X7 pin controller.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> index e8abbdad7b5d..5a3be10dcbfb 100644
> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> @@ -20,6 +20,7 @@ such as pull-up, multi drive, etc.
>  Required properties for iomux controller:
>  - compatible: "atmel,at91rm9200-pinctrl" or "atmel,at91sam9x5-pinctrl"
>  		or "atmel,sama5d3-pinctrl" or "microchip,sam9x60-pinctrl"
> +		or "microchip,sam9x7-pinctrl"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

