Return-Path: <SRS0=yZT9=5J=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C50C54EBD
	for <soc@archiver.kernel.org>; Thu, 12 Jan 2023 11:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5071C433EF; Thu, 12 Jan 2023 11:37:59 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5FD1C433F1
	for <soc@kernel.org>; Thu, 12 Jan 2023 11:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5FD1C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id i9so26465280edj.4
        for <soc@kernel.org>; Thu, 12 Jan 2023 03:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Xqk0NOcl6A/RFI3G2LXyDXcDGXrHqiE2kwfvu0U/9o=;
        b=L9vRIjxKsMIL8c5d5j7/HZQ5mLZTx5Sv/m3XuLHluS6N+cxAtYM3RlNkxj7F0wBQBQ
         BRReM0R8f8NHB1oWZT7FK96Yybp9nNjsAAHOkLm+avzAK5bosTh6/yZ1qE2+Xt3aiK1T
         gsk3oCrBuOBNECOAYoE778prd4qN3xnnoknxAdO0pUG5mhZuN9OsMlQ2QBO1dzjzv8+c
         rro3VK2Iq3LuBjmM6wUP0Gsft6lRWTGUG2NukuIzQCB1iyI4knDgy+ydYMYbRwdiJIdD
         jIwZfhnO8t2laeQrVT/qsXuG6UenU0LIQ29T64FrXClJQ0InoZxAxX3GeTsJw8qMq5he
         +GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Xqk0NOcl6A/RFI3G2LXyDXcDGXrHqiE2kwfvu0U/9o=;
        b=nOpDTficX/rz+DeLD9zzW8xCB04yA/8PbzeCMWIlGCeRuj8uxxJ43gUpbNOIUoY9QY
         YLA3DXelWXDzL9ZCQrThT588KChdebrdmPhr+BcaeKrydNFQ7j9G4H96TdhYqCCwf6QP
         ao2W7iWV2fcWNT7becnoCgG9MQmdN1nQuR5ZfvQjPUbGGRfy1wrGo4xlza28bJSxtI6y
         +kDmvaXvunjjN6fdLgJXIBlVpj3sipCrcnXpsvOR0uUGikjJnAHZT+NqetcCtcg6YykV
         cHPpBbw6eps4L/B0MC25oYoX1aMIwyD3O/clnKVWxPmas9jAIiv+6WxIPgAlv6FlaWA+
         nkQQ==
X-Gm-Message-State: AFqh2kqQk/MWhH9YIqw/wQn+kZzb//gbi0sXzxMym1F2o7sn1STPxY0W
	QBCgdhAjIG/DcgMhVUNoqQsGyA==
X-Google-Smtp-Source: AMrXdXtpjxltPF3O6b7QAIWvQ/ZxXjJG1nEsdgMLikuJQbu2xmqFxn6kt2Mpl/nH48pSzy8mU3k02w==
X-Received: by 2002:aa7:c046:0:b0:499:c343:30e5 with SMTP id k6-20020aa7c046000000b00499c34330e5mr8731515edo.3.1673523477033;
        Thu, 12 Jan 2023 03:37:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g19-20020a50ee13000000b0049b4711f4bdsm1146518eds.41.2023.01.12.03.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 03:37:56 -0800 (PST)
Message-ID: <870d5fc7-0533-7da2-ac31-4db02ffcc0ae@linaro.org>
Date: Thu, 12 Jan 2023 12:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 7/8] dt-bindings: arm: at91: Add info on sam9x60
 curiosity
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Durai Manickam KR <durai.manickamkr@microchip.com>,
 Hari.PrasathGE@microchip.com, balamanikandan.gunasundar@microchip.com,
 manikandan.m@microchip.com, varshini.rajendran@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com, claudiu.beznea@microchip.com,
 cristian.birsan@microchip.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, davem@davemloft.net, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kavyasree.Kotagiri@microchip.com, Horatiu.Vultur@microchip.com,
 robh+dt@kernel.org, andrew@lunn.ch, michael@walle.cc, jerry.ray@microchip.com
References: <20230112110208.97946-1-durai.manickamkr@microchip.com>
 <20230112110208.97946-8-durai.manickamkr@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230112110208.97946-8-durai.manickamkr@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/01/2023 12:02, Durai Manickam KR wrote:
> Adding the sam9x60 curiosity board from Microchip into the atmel AT91 board
> description yaml file.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

