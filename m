Return-Path: <SRS0=Tf5n=DL=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71470C001DE
	for <soc@archiver.kernel.org>; Tue, 25 Jul 2023 09:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A221C433CA; Tue, 25 Jul 2023 09:57:33 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81366C433C7
	for <soc@kernel.org>; Tue, 25 Jul 2023 09:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81366C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-991f956fb5aso787818766b.0
        for <soc@kernel.org>; Tue, 25 Jul 2023 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690279049; x=1690883849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wC6uOAAWWshiU7HM0RaHJ6XLqbUAShyDQVdsD3q4R3A=;
        b=mVZGMZlCiF1F6HADarxCSEJ1MaLMUtXiR3oM2qyw2oGwaGxxU7SwWx4LwS3BmlM3Bv
         ytMZ4w23uqOjuxcrrQM47eHvV4QXgFGAUoc4enoBm7nt7QMgcNB7tCVduRauDCN3uLc4
         M1D1RGNM+k21uF4lgcSf+0UCq/47yuxXI4ZbBv6LV1BPjRyUNfXu3Jv42aN2OEu34Mqs
         KKZGZ3LMkUO/0/+E+mCG3x4EhYaQbg4gVzjbjTtvd3KudbzY3uPdSyt7ApuWzO599Hfx
         scuMwYTBeVjHFfoJjHW1KVup4wWNXJ6A5LhlwkD3YcbnPra2xfDdtONBPUCGBrZITYK6
         uxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690279049; x=1690883849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC6uOAAWWshiU7HM0RaHJ6XLqbUAShyDQVdsD3q4R3A=;
        b=OL58wlqH68gsiy2LcTBajjTXdJCTAdEWvIUZRm0k6JbOL4cqjqVqhVbY0qlFU5QWm3
         65pzGK6gy2SuaYobMUj4Ts5fXfBq7fNxawLzNcA2EpvTNyp2LgqF4q28qm9PXS0X7gFK
         Ptog3ADjBwBg552ujY83+3UldI42f8EDlhf/fncL1DneOc3XwYE9XRK44F/HbmIaP1WM
         0LkiQTrJf1HbUex7TV6UrYmSvNF0aLpTsmBOgRpuZw1mFajEG8LaQ8duadROHytsRyXS
         ILOUVH+mjvUyysobsi6toDcY+QlnWBG943ZWVLfsSiS5VJ4S2zViD4Owe8XEwQefZCHF
         h9Nw==
X-Gm-Message-State: ABy/qLYEfNk9RPtyq6pfzIYmid9BClv4xZUIs3Kfv0XptuX8L1tjVcZ1
	8z6m+YqjyNRvtN+KnGuCDa/fMQ==
X-Google-Smtp-Source: APBJJlEPuZg32/18BhFO9sCz6xyx84ncx78sRSeoQ4NSWs2kTf61C9KzuN6EfDO1IbzjsJhDu7dLpg==
X-Received: by 2002:a17:907:75cc:b0:99b:4890:812d with SMTP id jl12-20020a17090775cc00b0099b4890812dmr11202687ejc.16.1690279049518;
        Tue, 25 Jul 2023 02:57:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id lv19-20020a170906bc9300b00989257be620sm7853476ejb.200.2023.07.25.02.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 02:57:28 -0700 (PDT)
Message-ID: <6f899f68-a44e-ef50-4236-007a73eb0431@linaro.org>
Date: Tue, 25 Jul 2023 11:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: Add Nuvoton ma35d1 rtc
Content-Language: en-US
To: Jacky Huang <ychuang570808@gmail.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@kernel.org, mjchen@nuvoton.com, schung@nuvoton.com,
 Jacky Huang <ychuang3@nuvoton.com>
References: <20230725094030.32877-1-ychuang570808@gmail.com>
 <20230725094030.32877-2-ychuang570808@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725094030.32877-2-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/07/2023 11:40, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add documentation describing the Nuvoton ma35d1 rtc controller.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  .../bindings/rtc/nuvoton,ma35d1-rtc.yaml      | 48 +++++++++++++++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

