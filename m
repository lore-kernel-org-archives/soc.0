Return-Path: <SRS0=wmLW=C7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9170FC0015E
	for <soc@archiver.kernel.org>; Thu, 13 Jul 2023 10:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50B03C433C8; Thu, 13 Jul 2023 10:02:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C61AC433CA
	for <soc@kernel.org>; Thu, 13 Jul 2023 10:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C61AC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-313e742a787so290048f8f.1
        for <soc@kernel.org>; Thu, 13 Jul 2023 03:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689242574; x=1691834574;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24N6QIJfw8vnZ0z26iuUATuQsDpghCwf/j1TkIoQh/Y=;
        b=ClZzo/bCy2XliMbqG3GS5vec6HVRguyhE0iR5eB0wXIy/CgFmC7TYazGqT7MraSL1m
         ccZRcdih5Mqch2b1VS66B34Z3tao9R6Nz6hOgIV8S+q9/kX13cTm/di4MI6r2Xd0YHCJ
         1Ldq/fTXAdlYioEp4nmdfuMBwChXtc8CvmATe/VK8XiksxyZQJqH3PrV8ybIP2UqtwrK
         oxQfT1neQGeqxwA9ZgQrT228AoDxN1Zwb2613qw09m1VdHCilNfKVdVwnOpGueLo6kB0
         O7Hb9aQrpv2enxm5mdkCP5lu/F7UE/ioEVEVmISVWdgLp88qWApT2ISoFu8JtEExhONi
         x6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689242574; x=1691834574;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24N6QIJfw8vnZ0z26iuUATuQsDpghCwf/j1TkIoQh/Y=;
        b=Ji/M8o91Bh/jnsROb9GyFDgp34N0IoaKmYZkw4i/59iZgLf8b8zPpmtkeKVSzFg2ZW
         A1xVF+xUcmxk1HVVYF+Y5OtWLBOYHpBXmdgaycpGeRBuSFMch9MKyuj3QHDZU511fBpW
         Sk/4dcBi23UgtR6+1+l/6BE3BRFMTst7++kVS5BsUYOfow1jh3SSZdCh+Dsrp90ZU4cP
         ZgNXuV8sGSUJfenpyeoFaFSwyuUMVXJFe04RLr4UMODR6nNTPtaJOsFbJ3GeFHNKQwo0
         cIWwq5OSn4mGrA54yem+qcgbtrnvl3fUoCFVgHGVREqwrwBPwsPLO/1dCJcXMTq7Uz8i
         JXdg==
X-Gm-Message-State: ABy/qLbrOqW7gcJJqCwn4EuktTwUH3htpLtGuGTBYTxEYq4IkzWOGbI+
	eh17IW2tE0lUtLv/rsnPi4C+tA==
X-Google-Smtp-Source: APBJJlFtt8ebDSbwMjmV/fHwToHgVyDwZ1DvTZK1G7a5UTKK0RsrpDpB7V1RLGiAYj/n8+foNZPK9w==
X-Received: by 2002:adf:d0c3:0:b0:314:323b:9d3b with SMTP id z3-20020adfd0c3000000b00314323b9d3bmr3835181wrh.32.1689242574306;
        Thu, 13 Jul 2023 03:02:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s15-20020adff80f000000b00313f9a0c521sm7539831wrp.107.2023.07.13.03.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 03:02:53 -0700 (PDT)
Message-ID: <1dddf0b5-c47e-4d80-7126-b9563e972927@linaro.org>
Date: Thu, 13 Jul 2023 12:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv2 1/2] dt-bindings: serial: atmel,at91-usart: add
 compatible for sam9x60
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Durai Manickam KR <durai.manickamkr@microchip.com>,
 Hari.PrasathGE@microchip.com, balamanikandan.gunasundar@microchip.com,
 manikandan.m@microchip.com, varshini.rajendran@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com, cristian.birsan@microchip.com,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 davem@davemloft.net, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kavyasree.Kotagiri@microchip.com,
 Horatiu.Vultur@microchip.com, robh+dt@kernel.org, andrew@lunn.ch,
 michael@walle.cc, jerry.ray@microchip.com, conor+dt@kernel.org,
 jesper.nilsson@axis.com, andre.przywara@arm.com, ada@thorsis.com,
 radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20230713095111.335346-1-durai.manickamkr@microchip.com>
 <20230713095111.335346-2-durai.manickamkr@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230713095111.335346-2-durai.manickamkr@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/07/2023 11:51, Durai Manickam KR wrote:
> Add sam9x60 compatible to DT bindings documentation.

Unfortunately, I don't understand this commit msg with patch. You say
you added a compatible, but the compatible was there before and your
diff moves it to a list.

Explain in the commit msg what is the real problem.

> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> ---
>  .../devicetree/bindings/serial/atmel,at91-usart.yaml          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
> index 30b2131b5860..65cb2e5c5eee 100644
> --- a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
> +++ b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
> @@ -16,13 +16,15 @@ properties:
>        - enum:
>            - atmel,at91rm9200-usart
>            - atmel,at91sam9260-usart
> -          - microchip,sam9x60-usart

It's here, look ^^.

Best regards,
Krzysztof

