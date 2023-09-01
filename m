Return-Path: <SRS0=edI6=ER=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1ACCA0FE6
	for <soc@archiver.kernel.org>; Fri,  1 Sep 2023 11:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB8EEC433CD; Fri,  1 Sep 2023 11:44:29 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F163CC433C9
	for <soc@kernel.org>; Fri,  1 Sep 2023 11:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F163CC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52a3ff5f0abso2537584a12.1
        for <soc@kernel.org>; Fri, 01 Sep 2023 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693568666; x=1694173466; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccQYapkyLHudPKqBjBN4Jee+XKRx/affoccRGde5aC4=;
        b=P1921Lr1jp9KlxHAc4co9lk7YtGp39h5DGg+Yp3NWKGNI6VEQzbLDbaeynyhGvZ2nK
         idUfd1qPtDyiKywwUhnMfHTOkw+XVKIvijdGndiHFD4N95qdLTjbvEKxJkPHLzWAQMon
         0FN49GOQ2sYOA4kdl2TPMagMg9z1lYjwXzSP/WuEGb/TXVlvFy7vIT1h6YfbU7Kdx1bl
         JPcBu77OR1hXXwEQ+e1hF0qVx4jog8uTJZwscdGkMdUOZXzYMwiT5SeOEci1IZuHgVrV
         08Sk0jaEt6yYHa2KHvFQZZiVGmCa0yzEUR82TTfeg2zoxJZl7OGF3EnEHEDeT5mkqI2z
         1ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693568666; x=1694173466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccQYapkyLHudPKqBjBN4Jee+XKRx/affoccRGde5aC4=;
        b=B1pAqCo1C9LMAcCM/G62yQXEfxJIcX5I9Ga3gtdLcfud8Cl6RQgLCLjH4ZjoRFQXAZ
         vz/PLyCmw9OV+CNMJ9LOcUN8+4rDEqWOaCg+aLxQh34wtWfVJuWqTeMA7FcJ2LhIQ6kF
         pQx7rXlwKlCVAUpLwcr/zJIRrM19JKXs9UuNbQtb8JAOIOD9cYHro7QYO2uHM4xxviCG
         nUjC221n/LGqR8TTQj3nRvJktPx9Lg9XedbLNYScytKuEp3JvM7v8ttRbchfTUU0FNye
         LMH12WGhH7qc1EsLiTyg8vd5Z4yfCc5ikAgfpFWXwa7ee1XK0eNy2cLTgkaJpvPchAMk
         lotw==
X-Gm-Message-State: AOJu0YwEnthuRG1eZJ0WmwW+2tpbMeboJu16N+gxnyPT6YR1v6yaYC7s
	oYOnytYzgZxpXY7Vnnhr028THw==
X-Google-Smtp-Source: AGHT+IF3f42PZsx9Wukf/yRVc3BWJ32P+eejGXCQuTJM1PrdyFFe4dk1dU4UWk7fw7dwwyBWpvA+RQ==
X-Received: by 2002:aa7:d513:0:b0:52c:164:efe9 with SMTP id y19-20020aa7d513000000b0052c0164efe9mr1648382edq.29.1693568665864;
        Fri, 01 Sep 2023 04:44:25 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id a9-20020aa7d749000000b005257da6be23sm1985731eds.75.2023.09.01.04.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 04:44:25 -0700 (PDT)
Message-ID: <db785937-1a71-7596-aab4-1c698a632211@linaro.org>
Date: Fri, 1 Sep 2023 13:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 4/5] dt-bindings: soc: loongson,ls2k-pmc: Allow
 syscon-reboot/syscon-poweroff as child
Content-Language: en-US
To: Binbin Zhou <zhoubb.aaron@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongson-kernel@lists.loongnix.cn, soc@kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
References: <cover.1693474728.git.zhoubinbin@loongson.cn>
 <38e811816c37a2d52374fa04864654ff1e9b4dc8.1693474728.git.zhoubinbin@loongson.cn>
 <cfa55813-946e-7aad-b7a4-54450a1ea5d5@linaro.org>
 <CAMpQs4Jrvd=KAXUBYYdixvvhBx1hAXxECUhGVsuEED1Jp9SPDA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMpQs4Jrvd=KAXUBYYdixvvhBx1hAXxECUhGVsuEED1Jp9SPDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/09/2023 11:27, Binbin Zhou wrote:
> Hi Krzysztof:
> 
> 
> On Fri, Sep 1, 2023 at 5:06 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 31/08/2023 13:43, Binbin Zhou wrote:
>>>  required:
>>>    - compatible
>>>    - reg
>>> @@ -54,4 +66,18 @@ examples:
>>>          interrupt-parent = <&liointc1>;
>>>          interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>>>          loongson,suspend-address = <0x0 0x1c000500>;
>>> +
>>> +        syscon-reboot {
>>> +            compatible = "syscon-reboot";
>>> +            offset = <0x30>;
>>> +            mask = <0x1>;
>>> +        };
>>> +
>>> +        syscon-poweroff {
>>> +            compatible = "syscon-poweroff";
>>> +            regmap = <&pmc>;
>>
>> ???
> 
> I did notice that commit [1] changed "regmap" to "unrequired" for
> "syscon-reboot", but "syscon-poweroff" did not do the same.
> So, at least under the current "syscon-poweroff" rule, "regmap" is "required".
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/power/reset/syscon-poweroff.yaml?h=v6.5#n41
> 
> I had my doubts before, but seeing that some dts do have
> "syscon-poweroff" as a separate node, I assumed there was a
> difference.
> 
> commit[1]: 2140d68d69d4 dt-bindings: power: reset: Unrequired regmap
> property in syscon-reboot node
> 

You are right. I wonder why Serge did not change others.

Looks good, thanks for clarification.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

