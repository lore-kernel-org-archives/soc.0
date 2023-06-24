Return-Path: <SRS0=mqJN=CM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC26EB64DC
	for <soc@archiver.kernel.org>; Sat, 24 Jun 2023 08:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81100C43397; Sat, 24 Jun 2023 08:24:47 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B65CFC433CD
	for <soc@kernel.org>; Sat, 24 Jun 2023 08:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B65CFC433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso1702873a12.0
        for <soc@kernel.org>; Sat, 24 Jun 2023 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595076; x=1690187076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9m88tdrjltI5afqB2y4W0GvMxnga3YhkyI5zgzVbcGE=;
        b=Xq63fn/XWemDzkx3c0aeAAWnkqQM+vMTmqJyDMM+c8xqtOklqM5UVjx/QJRBSnWaqw
         jrvpmmv7+n1h1fwYvqTDppb7q3v4CxpcBFLat2c8scG7YJTYn2RmymqLDDJsDvPD7ylE
         rE42LjjD4p8GfEZlnyuM6Y+bxAwhLcTrcE5m6SXqpdYJPckhjxHR3sa7nsmPaHTOo4bo
         QG1MD5s2ZYzijyxmfTee6mNrCmD3Uj2fs3fB+ZiZj7XCg9jNuU7jC6SzGnlAVZ1GVS9s
         eCF8jLAK5vJGcqxv1zMzR0xfIlnd31mZdDJeDioTtl88mW/oLVOMCuZtZlIjCR83PEas
         8/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595076; x=1690187076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9m88tdrjltI5afqB2y4W0GvMxnga3YhkyI5zgzVbcGE=;
        b=PzD4w9l5g28C8QZnrv08SmgHkYI1Vet6CB+TDiKaYQPwKH0Ku31kaLzDieEewxgTXO
         2VvxzjDx0WtKArbLD8JC49a56zDcoEvW3Jk67fo9+Ou6c0cjOYy41UBcJeQJat64zoh4
         GED/eMH+esC2suy6fib3hxuhtAbxBbXZp9rk08rFTyFfvBvmhqVvYIdYDV7p8LYxDDEh
         ytnlALeC0aEkzaQw6B1Hq8heKKOZggtGivV2fS8stZGHPM6DWGSIDliy/q6cc/g77Zvh
         UVbAu/7YStDANJwI5rBlod5DXyD9VQ7Z1Hn0gvNQuLo10Zyt0gj7A/CQhCCGzqAspmBu
         Mzkw==
X-Gm-Message-State: AC+VfDx1owwLP12vm/mqYdUDMQFJc9opdW7QCpBj7ii06vvnWIiPBCfd
	/jB8U5y8lORSa5tT5ap8oEaCBg==
X-Google-Smtp-Source: ACHHUZ4kfvWWOU4PQnvhhihUyXC/j4nl3PRhbWc6xuByephTLC+3tBRktkXGlK7+K+j6XrtjsNoPmg==
X-Received: by 2002:a17:907:3e16:b0:978:a186:464f with SMTP id hp22-20020a1709073e1600b00978a186464fmr23817557ejc.39.1687595075771;
        Sat, 24 Jun 2023 01:24:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u7-20020a170906654700b009875a6d28b0sm626289ejn.51.2023.06.24.01.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:35 -0700 (PDT)
Message-ID: <769b5cf3-0182-d046-a56d-c3a076249c57@linaro.org>
Date: Sat, 24 Jun 2023 10:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 25/45] dt-bindings: atmel-nand: add
 microchip,sam9x7-pmecc
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
 <20230623203056.689705-26-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-26-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add microchip,sam9x7-pmecc to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mtd/atmel-nand.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index 50645828ac20..9c9dfab38fdf 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -56,6 +56,7 @@ Required properties:
>  	"atmel,sama5d4-pmecc"
>  	"atmel,sama5d2-pmecc"
>  	"microchip,sam9x60-pmecc"
> +	"microchip,sam9x7-pmecc"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

