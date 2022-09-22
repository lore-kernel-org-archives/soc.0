Return-Path: <SRS0=uPeQ=ZZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2567C6FA82
	for <soc@archiver.kernel.org>; Thu, 22 Sep 2022 06:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99C19C433D7; Thu, 22 Sep 2022 06:47:19 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60C38C433D6
	for <soc@kernel.org>; Thu, 22 Sep 2022 06:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60C38C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id s6so13077655lfo.7
        for <soc@kernel.org>; Wed, 21 Sep 2022 23:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=pxOUMi2UlNuNZNBfBYrU6Nf39rmJtF0e2MNNct3zImo=;
        b=vk1GuB2k4kmJdpMkTG4B7+OVahxU0ZUd6kIXxWgoP9V42D5i1SrhBqxiirtcRKcZqq
         BCbNctyioKxFEQAhmXvM+E5clDZZAoicbDe/x+7/FaVBK6oo9OxDaYiWT4kwClcRE2So
         63ggoSk6jAnUJECMY45z97Kju1xzn8lzGPW0+xRR/Zq7GW1+Xa93ySFNLxSaajG9z3J/
         +meywODDAS6WPee4PcMaG3eaevESx0+1gmFJlv/hBVZC60i1RTvOpMUSlYIGNZEGeCRL
         kFIg9d6WpWgMt6wj7KISVouHHkxaCMC4HvK1W+6qeI2odLKuNczX3fAZsoiDvTdtqEag
         yuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pxOUMi2UlNuNZNBfBYrU6Nf39rmJtF0e2MNNct3zImo=;
        b=WHlIJWQZPWcbBLOECNjKKmu9GoIz+Iy2R2Oor4q707GIvjc6NOY4mAa+io487CDJSz
         ok9wotDdFGnSJkyGRJ2clTjwXN8ZYX39dSFsJg3YOR4OgdYl/gzqGRrzWiRyS0TPZZOm
         r4owS3ojj67Ybob8eJzWrYArzrdovZXIW7Q2YGlajeLDHcITOueGXbxOYO8Z5pvn4TSE
         xlal7BCK6n3pAU6V0x3yjwuppjunJtPxj2uBHqfoFCKQtGgPMIT5e7QKWxEHl36E6hhX
         LxKhLpqnDwbHhuDNr7yJ/FtwXLlpvibYYq9Gro9rE1cgQNSeXj/g8SB9Iomu1lwcSQBi
         VlMg==
X-Gm-Message-State: ACrzQf04NwARmqr5ZCsBLIJYPBN61aiD9tx8MbxMms0KsWFyAgC3SqoC
	vPODjSyHo+Cw2mhnQaW/OIK7hw==
X-Google-Smtp-Source: AMsMyM4MYGSd6TlYxlHDNat+xh7DY9HHdMhnES4FG2AUReeGbG1VnfcySuyKxUSSFKjCwz1VpzjPRg==
X-Received: by 2002:a19:dc1a:0:b0:494:903a:1fa8 with SMTP id t26-20020a19dc1a000000b00494903a1fa8mr660247lfg.55.1663829235551;
        Wed, 21 Sep 2022 23:47:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a2-20020a056512200200b0048cc076a03dsm778352lfb.237.2022.09.21.23.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:47:14 -0700 (PDT)
Message-ID: <035f5834-6fb7-95ba-1569-6dbf8eface49@linaro.org>
Date: Thu, 22 Sep 2022 08:47:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: document AMD DaytonaX
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, soc@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
References: <20220920165404.14099-1-aladyshev22@gmail.com>
 <20220921210950.10568-1-aladyshev22@gmail.com>
 <20220921210950.10568-2-aladyshev22@gmail.com>
 <20220922063514.f6euqlw35jrkpee4@krzk-bin>
In-Reply-To: <20220922063514.f6euqlw35jrkpee4@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/09/2022 08:35, Krzysztof Kozlowski wrote:
> On Thu, 22 Sep 2022 00:09:46 +0300, Konstantin Aladyshev wrote:
>> Document AMD DaytonaX board compatible.
>>
>> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1680833
> 
> 
> /: compatible: 'oneOf' conditional failed, one must be fixed:
> 	arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dtb

Ignore, this is not related.

Best regards,
Krzysztof

