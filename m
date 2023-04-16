Return-Path: <SRS0=JHH0=AH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C302FC77B61
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 07:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EC3FC4339B; Sun, 16 Apr 2023 07:18:51 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27A8CC433D2
	for <soc@kernel.org>; Sun, 16 Apr 2023 07:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27A8CC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id vc20so1353324ejc.10
        for <soc@kernel.org>; Sun, 16 Apr 2023 00:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681629528; x=1684221528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shJMfgVoZ/Uf3DZ3zDo9afK/q9xkXpJiFnl//R92tvI=;
        b=vMgoignxc+Q8AEpA4YE2dH/3yZVV3lffJ1FRQE9sikuR/9fZKeXb0kGHtxa2axg7zN
         ksUaFg+6EdXWnjIpU18LyXuUCXlB4yUwk8HOr32sDJXkt4St3DAYp+Gu9SDHsvHWXdsm
         ULLaD7AhrF8FPwC4A5c8OkHnFExvpJ0SQpCjrVZ56oLqds63/huuHH2rCym4JNVlkTeW
         QS9/XLLBrCovAHmFJSAgMP5MEyR7sGhQfKH8mwG2hP/DfpMj/nEz4ZtGPL+XHfxjVlwT
         1qmokUUJrsgQjjg0nhXaH8ZtYf9jIYU8XEmY6eGBm6Y6c72jaJGBQyEyqKbOF69/PSP2
         VFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681629528; x=1684221528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shJMfgVoZ/Uf3DZ3zDo9afK/q9xkXpJiFnl//R92tvI=;
        b=Z9uz0YDSqEpXLL2fiz25g1ILkg0tNfnKUgvpYkhDnKrYgdjrh+mrBOMG5sZjlE2+j7
         lBmnZ57RSivjW4+jSfrjaxLuYwUJ5hdSt8m0gRSsIlkTZhVXYv8I/dFaws9S5j0HEQin
         lBgmUmhPLlD+nWnTClqIByVC01gh6+LBgj+S0mvFU6ibqzuWqWzP4B+cLUf/Qju01x+6
         3/QE6SEs8+d0VRi/zwig2tybKXYKo7b+jlIsd7pJ+Atao5jVwdW5nNKMLpF68nzWiYnF
         dfaMKSjrllJaTeb+JbmcYwLdx16qPBlHPXG9gOPQEL5zuA2M+vrMHfJINqad+mcFdWc3
         aegw==
X-Gm-Message-State: AAQBX9dczYezty7qmfjADjej5DePtvV6mgBECT6lxCj2ho8FI1BiUwVT
	XmQ+6Jo/A3amPuL51E3YC6bdTA==
X-Google-Smtp-Source: AKy350bA0/Hj6WBxqqB7KTZIkvmNM4AjQoPUWqFuSeSMCMxymM3HjpocW0nSNIIk9qGyg6Junh5DTA==
X-Received: by 2002:a17:907:9908:b0:885:a62c:5a5c with SMTP id ka8-20020a170907990800b00885a62c5a5cmr3209036ejc.46.1681629528314;
        Sun, 16 Apr 2023 00:18:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db? ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id xb9-20020a170907070900b0094e6a9c1d24sm4817719ejb.12.2023.04.16.00.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 00:18:47 -0700 (PDT)
Message-ID: <c21d1af9-41e4-34aa-8596-ed1c2accd13a@linaro.org>
Date: Sun, 16 Apr 2023 09:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/4] w1: omap-hdq: allow compile testing
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
 <20230415104304.104134-5-krzysztof.kozlowski@linaro.org>
 <2023041542-arrogance-jury-ccf1@gregkh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2023041542-arrogance-jury-ccf1@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2023 17:18, Greg Kroah-Hartman wrote:
> On Sat, Apr 15, 2023 at 12:42:53PM +0200, Krzysztof Kozlowski wrote:
>> omap-hdq does not depend on anything from ARCH_OMAP for building.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/w1/masters/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/w1/masters/Kconfig b/drivers/w1/masters/Kconfig
>> index 692cac3ff0ee..ad316573288a 100644
>> --- a/drivers/w1/masters/Kconfig
>> +++ b/drivers/w1/masters/Kconfig
>> @@ -53,7 +53,7 @@ config W1_MASTER_GPIO
>>  
>>  config HDQ_MASTER_OMAP
>>  	tristate "OMAP HDQ driver"
>> -	depends on ARCH_OMAP
>> +	depends on ARCH_OMAP || COMPILE_TEST
>>  	help
>>  	  Say Y here if you want support for the 1-wire or HDQ Interface
>>  	  on an OMAP processor.
>> -- 
>> 2.34.1
>>
> 
> I'm guessing this shouldn't be part of this series?

Yes, a git format-patch glitch. It's included in the series as 12/15.

Best regards,
Krzysztof

