Return-Path: <SRS0=7Fo6=FZ=linaro.org=tudor.ambarus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9D9CD6E43
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 08:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 476ADC433CC; Wed, 11 Oct 2023 08:49:14 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4255CC433C8
	for <soc@kernel.org>; Wed, 11 Oct 2023 08:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4255CC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9b2cee55056so1194428966b.3
        for <soc@kernel.org>; Wed, 11 Oct 2023 01:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697014151; x=1697618951; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=goU66zG1Z8ZGxlkEzc0eoZzJ+tEswmSUbrbJMfgUSLU=;
        b=AugATaHM7K3XUB3Xm6HnBkaLXMHcWQHeZzlZMtcyKF9fHrpNRDlwNMklkjAB4n3hgs
         O2fiqJAiIHuvwnP0G3J+6/gbmTdovTJOBmeqJwR8On0ZDFDZlp5XlvVd6nU6gAFs/Kyl
         VAydojUkj3bTuvUATbEo2SrWo1lA/eFNOvY5wkaV3ROzwVdGcAL3chxMa4v3CqyL7yvc
         mDz7jrsh2OX/7y+Z61IAfFHVseZMw6QIRC8nNPniDPvWaOEIn6JusfC8RkQ3xboDJuTd
         AghYWHZDz8g+Q00x0KEAq+INH5E4v5B7L80TRf/Q3I2/LWEMSx8ffqVUfB/nK0WaazP4
         563Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697014151; x=1697618951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=goU66zG1Z8ZGxlkEzc0eoZzJ+tEswmSUbrbJMfgUSLU=;
        b=ggRFNjNmnzJiv19fRGF+Dl/9TvDU9Hnt6Rkk5BCcE5pB/IDBawIhkRgfeiJ69GjhCQ
         PXLsfbFtwGMr3orB8T/FbcbZKG3XbTOeG1VSH6pMdNluf2HKl+9gb+Epq/sblDLcIBfR
         EqJvMtEhXF80bkQKhjsoUH7WyjGdkvykPR6rIuAoVWDkus/tsS5phvwYZc2V9h1zCVAn
         yJwxq8EouuNRdrhTEJ1tj2WEDOR0Ud0C/xD8mMBPGR990xaJ7b9uCKwD8KPDPj0TAqP1
         O4Eq1BDM3HWk2AODUc8dLAjduY0fpWn3LA51FXsqzyh+Gx+qQgDsanpKR1y8wkcXKtEb
         bTCg==
X-Gm-Message-State: AOJu0YzRqSWqF5wcxRMcs4Oxrfvn1WB0NM6YI00eYDKF182pKriU0NOW
	O7eLZp87nVcuv+n71sOtSqG4JQ==
X-Google-Smtp-Source: AGHT+IExnFJCom6CH9oUPktlA1Qk1vtPOJTjoCod0Pf9vHRdBJj4j6vUQMY9Dt2O6Rng+8xy+rHUpA==
X-Received: by 2002:a17:906:844a:b0:9ae:73ca:bbae with SMTP id e10-20020a170906844a00b009ae73cabbaemr15809476ejy.62.1697014151564;
        Wed, 11 Oct 2023 01:49:11 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id dc4-20020a170906c7c400b0098e34446464sm9555049ejb.25.2023.10.11.01.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 01:49:10 -0700 (PDT)
Message-ID: <a6c57156-d3a5-4524-8ef8-6f27cf0a2c97@linaro.org>
Date: Wed, 11 Oct 2023 09:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org,
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
 will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
 andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com,
 willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org>
 <2023101111-banknote-satin-1f77@gregkh>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2023101111-banknote-satin-1f77@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Greg,

On 10/11/23 08:48, Greg KH wrote:
> On Tue, Oct 10, 2023 at 11:49:16PM +0100, Peter Griffin wrote:
>> Add dedicated google-gs101-uart compatible to the dt-schema for
>> representing uart of the Google Tensor gs101 SoC.
>>
>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
>> index 8bd88d5cbb11..72471ebe5734 100644
>> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
>> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
>> @@ -19,11 +19,13 @@ properties:
>>    compatible:
>>      oneOf:
>>        - items:
>> +          - const: google,gs101-uart
>>            - const: samsung,exynosautov9-uart
>>            - const: samsung,exynos850-uart
>>        - enum:
>>            - apple,s5l-uart
>>            - axis,artpec8-uart
>> +          - google,gs101-uart
> 
> These shouldn't be needed, just declare the device as the same as what

We should have SoC specific compatibles so that any further quirks or
incompatibilities can be easily addressed. It's not only the IP itself
that can differ, it's also the integration of the IP into the final
product that could have an influence on the behavior.

Cheers,
ta

> the chip really is (i.e. a samsung uart), that way no .yaml or kernel
> driver changes are needed at all.
> 
