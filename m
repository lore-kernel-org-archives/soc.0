Return-Path: <SRS0=DaLZ=3C=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFFBC4332F
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 20:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49FEDC433D7; Wed,  2 Nov 2022 20:18:25 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26F0EC433C1
	for <soc@kernel.org>; Wed,  2 Nov 2022 20:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26F0EC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f50.google.com with SMTP id mi9so13263844qvb.8
        for <soc@kernel.org>; Wed, 02 Nov 2022 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7qHySYZS0PwVla6hd8xMiHelx/ePWY/te6ufsokZBF4=;
        b=BJ2sE7+f0yBn9uvu92/Q+FtcoQkZAIo20XyEOQtK0/Z7LFjPplvx9+1aPEeFZ4W2Wl
         DMWZoV+O4X4HcEElq+pBevUi8tiaqsVFUz1Xju/6coMeUC5b7KqokR2Yps4vR4EtA8ro
         82GeR8WFcPuF5qITLwegn7imsB0+ekzvctadpPspYLfDvjIhho0m7JrYNdAci+21hnc6
         iUvGDvVXtRs7Woqi9kxFx8CdjtWfyTvh6uECkyMW7RnmwmN0XGUg1uEsytEDi5imnipS
         KDSGpRE9m5/CexQOAbGG5yhfahSiUs2ML5urOCvEgJjlBZbRAsMLMQ9jI3PJW+UbCkuv
         TFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7qHySYZS0PwVla6hd8xMiHelx/ePWY/te6ufsokZBF4=;
        b=f1WqkzwK7vbB1Ro/OuMkNeuo2siMTxGwGSUIs73epxGjuS2r5veZ8KAMLW/pjakNys
         Mvll6L8mM6gKWjOyer4TuXTDD+856zCay5VLJ4Q6kygCGyfmshh7MZlJcBBXY9QjSMR2
         0iEa5zTgfb5mDFbKbSpPpTpnRhW8sDLJXRPQuIpmGKi5TSEP0tP8YWRZnVnpqqx6XI9Q
         GTtxkJ/3/3Xl4QtMNweTxJlP6TPKD/E7cE0GccalBBEho0X3BAwGQ1Yb7N8VRk1zyBcm
         Y46swKBM60nrXOb5Kr6/8b8N+r51o3gm3B+rIfn1hYwgl8R047OoQldfbYIYkBtoPN25
         2Wnw==
X-Gm-Message-State: ACrzQf2SfJPfH5Z6CTcG6l9Gl7objJG6bAPGxFSdrGEtcJI3aAIcrvDQ
	/chsi09fBo+LtbEvWGte6cDnBw==
X-Google-Smtp-Source: AMsMyM6COPGJLY6ZtME4RzzhQZhXwMHalxHjg9eJIAHAf33PmoH6M4eHXss+dbvlH0mKPCx6K2vxRg==
X-Received: by 2002:a05:6214:5182:b0:4bb:a323:4ca5 with SMTP id kl2-20020a056214518200b004bba3234ca5mr22968700qvb.121.1667420303098;
        Wed, 02 Nov 2022 13:18:23 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id bp6-20020a05620a458600b006cf9084f7d0sm9085317qkb.4.2022.11.02.13.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:18:22 -0700 (PDT)
Message-ID: <f984b1b4-c9a5-bbcf-65f2-08e3f231dc96@linaro.org>
Date: Wed, 2 Nov 2022 16:18:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCHv1 0/8] Add support for sam9x60 curiosity board
List-Id: <soc.lore.kernel.org>
To: Claudiu.Beznea@microchip.com, Durai.ManickamKR@microchip.com,
 Nicolas.Ferre@microchip.com, Cristian.Birsan@microchip.com,
 Hari.PrasathGE@microchip.com, davem@davemloft.net,
 krzysztof.kozlowski+dt@linaro.org, alexandre.belloni@bootlin.com,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Manikandan.M@microchip.com, Kavyasree.Kotagiri@microchip.com,
 Horatiu.Vultur@microchip.com
References: <20221031033653.43269-1-durai.manickamkr@microchip.com>
 <2902eb0e-815a-9147-49e4-182376df378d@microchip.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2902eb0e-815a-9147-49e4-182376df378d@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/10/2022 06:20, Claudiu.Beznea@microchip.com wrote:
> On 31.10.2022 05:36, Durai Manickam KR wrote:
>> This patch series addresses the following:
>> - Moving of flexcom definitions from board file to SoC file and
>>   some minor changes to its properties.
>> - Add support for the new sam9x60 curiosity board based on the
>>   existing sam9x60 SoC.
>>
>> Changes in v1:
> 
> This series is actually v2. Also I cannot locate your patches on
> lore.kernel.org don't know why...
> 

I was not cced on this submission - I got only reply from yours. As you
pointed out this v1 which is v2 ignores several of my comments.

Best regards,
Krzysztof

