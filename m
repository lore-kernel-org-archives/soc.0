Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393F2C43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 15:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21026C3411B; Thu,  9 Jun 2022 15:31:57 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 550B3C3411F
	for <soc@kernel.org>; Thu,  9 Jun 2022 15:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 550B3C3411F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id o10so31680325edi.1
        for <soc@kernel.org>; Thu, 09 Jun 2022 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PeAB4WdUupDaLbzIqQrrnRA29amPQ8PYJd3E0QmEGsE=;
        b=EakJTslO6FLE81sHxNC1bk/UhJdyWwE3LaolAbYnM/XwG1uFz5Ko+NX7UNNu3tbcoN
         K4rcFigA5wVJgxMnlO7NLPQdS3C/ggA1Vn8OzBb8vvyKZFT1e8iQCHxDYA2eB8gQtft+
         7HzbxwQvQgZY6ae+bwehfzc7RnStB3PIBUZf7baw2dZU6u3EZKK9c5vh03InUK7PI/Xs
         PjArKEXUAAVAQfrkTYYW6QeCkqxbR+gH5Pemmw+ozW5iwl6YhpAMgD9p9LlKl6lrcgHH
         VT+W3GXIoaXr5Nc/REr/+pECZOjR0CqcLiiXkWlDSxBfAIMKAiL7Nj6L+FzleyxE5OcS
         rrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PeAB4WdUupDaLbzIqQrrnRA29amPQ8PYJd3E0QmEGsE=;
        b=wMI6+At2//qD1QdRo3CC2Ca16BDsSs6+h4gsOHovF9aekY9BY2AZwbJEnNrb9H1TxN
         +UM0pYe+JRv/0qHTA6AN85/sGzr6z7vPg90Tjj8AQoCDtejxUwR6tgVmzr1/Sclkl065
         eeMOTnPi7juR5Qu9szEdUL+AD2fRrk2wskPOmWS3aik/SesauxcBkW6prqj+eXaNBHNU
         TvJq4R1yCZScNKXmaXJ6P0SWr32UHkr8fZWGH7O7BkVebIAjDYyu1ZBAjK7HevC9iFtz
         t0WymJQiOJ5YFlJGP9GMYWKslNC5SENtfUgFomUpU3P1y2mYsao9XMF6ZRpaiqvPguxA
         0arw==
X-Gm-Message-State: AOAM531MViolx+c/7HJXmt3Q6z3bJLOb9W3v490O+cQhvI1U73flrjTh
	Kz6QPot8gKBIQ2l7+FilQvyEfA==
X-Google-Smtp-Source: ABdhPJwOIiJjZlxWJ8Qllh5BIHfUY6pWFLHsCbCBYUYtWh67b6d6/Fy01aSRrec+f5WJFGHljJB2KQ==
X-Received: by 2002:a05:6402:2788:b0:431:3f86:1d4e with SMTP id b8-20020a056402278800b004313f861d4emr29911904ede.238.1654788714499;
        Thu, 09 Jun 2022 08:31:54 -0700 (PDT)
Received: from [192.168.0.199] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f27-20020a17090624db00b006f3ef214dcdsm10940096ejb.51.2022.06.09.08.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 08:31:53 -0700 (PDT)
Message-ID: <6d460a14-5da3-19f8-c614-307c2e737c17@linaro.org>
Date: Thu, 9 Jun 2022 17:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 04/48] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
 <20220609113911.380368-3-krzysztof.kozlowski@linaro.org>
 <YqIP1vYuLztSQR+n@latitude>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YqIP1vYuLztSQR+n@latitude>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/06/2022 17:20, Jonathan Neuschäfer wrote:
> On Thu, Jun 09, 2022 at 01:39:06PM +0200, Krzysztof Kozlowski wrote:
>> gpio-keys schema requires keys to have more generic name.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml    | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
>> index 47a56b83a610..4c7691c38b10 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
>> @@ -152,7 +152,7 @@ examples:
>>        pinctrl-names = "default";
>>        pinctrl-0 = <&pinctrl_uid>, <&pinmux_uid>;
>>  
>> -      uid {
>> +      switch-uid {
> 
> In this example, and more importantly the original copy in
> nuvoton-wpcm450-supermicro-x9sci-ln4f.dts, I think button-uid fits
> slightly better, because it's a momentary push button. (Still arguably a
> switch, but not one that would stay in both the on and off position.)

Sure, I'll change it to button-uid.

Thanks!


Best regards,
Krzysztof
