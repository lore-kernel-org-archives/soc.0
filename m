Return-Path: <SRS0=unKo=57=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BD6C636CC
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 08:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50D34C4339C; Fri,  3 Feb 2023 08:12:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49E3CC433EF
	for <soc@kernel.org>; Fri,  3 Feb 2023 08:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49E3CC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id k16so3235781wms.2
        for <soc@kernel.org>; Fri, 03 Feb 2023 00:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IC0G1L6NjMoqGQD1cOuly4Kpy7+rsQRjwMtomVmlm3o=;
        b=xD72h3qJGE8pRy1Boa9QLWM3iuOgPxAFkfdvyEux2CoizMWlA590ACWFNz/K80PAZZ
         Sw9YIc8ZAA1bUthZam/m+Eeba5+E4myAXIVrE36mqP39bF1Jtw29mQ66qEQcqv2bp4p1
         6cKoRzu44Alj6AZi966ZhxHIRuzmQr6hAewC1bIN7jeDZt8wONW5oMbHQOv7kLq7Wu3C
         vKcF47She/EjkhgaNzgvU1femR9xaJmeLCSiYnyS9GUb1AJZeNYGNwbtReeChHHP+li1
         MoZjkm10tpOCl2Ou35pP15Vg/cufTOjE9R35Zt9fxU2S0cN4KfeNZivCAHPUfpfCZNOh
         uN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IC0G1L6NjMoqGQD1cOuly4Kpy7+rsQRjwMtomVmlm3o=;
        b=eQhCgvrihqyLLkQIPccvemaqv8oBWYPUN3acqED6euA3dF6+5HoqTQUtsqMJQ0O2Fu
         AbdsRe7fnSNURJhYTXGS6ILYtYOmLLeMX2+jcM/NsUwDuJqweSOTM7C+bzXWKrRo6dr/
         6+O2CujGX7BgLnxSpO0TRFYTea6C28aBk2A468DVY+KxRSspgZi7U3Br5HCk+dvnRJ2c
         /rmHX1Bsa5GsbtMp5kQTCzvlkNDD30y313nO0T6mEqojyM8AIiXhInCRrvBek0tZG2XN
         jBDPeC8mRYSA0GQjCT+wymZ5fKCPBiU+FmqkFkGIoK0JzrglI3325gkoKypsZZL2yF+d
         WP/A==
X-Gm-Message-State: AO0yUKUTAA8lYWqnFbDlCQ04mh00CukUmYgYw0yZ32zLDRGwsQAivtrc
	OfGXXA0gbYnhMYB6qvKVuzmzAQ==
X-Google-Smtp-Source: AK7set+phGji+2ms+lZQhTPHJqeuo6ybtY3qprxpSEW2BSt4H6ct/ep5PFnZxnSNGDJ5ocOKtPFVtA==
X-Received: by 2002:a05:600c:1e13:b0:3d9:f836:3728 with SMTP id ay19-20020a05600c1e1300b003d9f8363728mr9020715wmb.11.1675411940532;
        Fri, 03 Feb 2023 00:12:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x14-20020a1c7c0e000000b003daffc2ecdesm6983987wmc.13.2023.02.03.00.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 00:12:19 -0800 (PST)
Message-ID: <70f6e477-86e2-5d71-49be-3c96265c82be@linaro.org>
Date: Fri, 3 Feb 2023 09:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 7/8] dt-bindings: arm: at91: Add info on sam9x60
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
References: <20230203034833.451461-1-durai.manickamkr@microchip.com>
 <20230203034833.451461-8-durai.manickamkr@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203034833.451461-8-durai.manickamkr@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2023 04:48, Durai Manickam KR wrote:
> Adding the sam9x60 curiosity board from Microchip into the atmel AT91 board
> description yaml file.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Best regards,
Krzysztof

