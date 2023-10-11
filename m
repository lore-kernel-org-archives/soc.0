Return-Path: <SRS0=LTny=FZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE5DCD6E5D
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 12:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 136F1C433C8; Wed, 11 Oct 2023 12:07:58 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48DD8C433CA
	for <soc@kernel.org>; Wed, 11 Oct 2023 12:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48DD8C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so66718295e9.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697026074; x=1697630874; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zXRuIlwacuOdYyOFKIMg2z15au/UO9GrOGt9xxSfLUg=;
        b=aoTiSZTzuXA03gEZt9/qybVELsndu1DCHsFP4jtYD4FvkrywSL/NI6GAWsH2D53pwu
         Qjr4Q+r76glZnIFmODqhQ7FWIxyCo3L8Km1jLmVDAquk8oNJrdkgfvrIHstQRC6EO3NV
         imf4F08rBuwYaxHlXG44qdnXmbBk2OXL4lfKZ15h669uZGJfzX6ESXlw+kC0/xOjSqbl
         ruRs71qvsx3mZLAyl7QyEYB2QFeRAavPmhg+yvYogUAXJOqXxeyyURzPOYWbfiHoOmdc
         F1Rsy5C0jdyQcnXLZprUFZ31IH8W2IqzEV56Wa1/pYJ6CJ7qedB7/1XoDubIVTy6tqXc
         +wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026074; x=1697630874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXRuIlwacuOdYyOFKIMg2z15au/UO9GrOGt9xxSfLUg=;
        b=qcEZDKD1WmmdPj3JQBO0E1n0UNXZdxkQxOgxo8THGrdvNIM3WUKpfNG7PYYi4UNR9i
         bbO2feCfdunxEuOrnydaZLQGx1K8DvrkLSP8MxBKVGI9/2K22UWC5Ea142eYUWvVIQmB
         VRnJQKhaL4NedvDFQnK62YuyjcuOIEK4NvtAw5jbEXxUxRZPXt5hx+TyApvIRvDbKVPS
         KI299FbVpWMhO3ovhST+F6IubulmySZ0HZDastZsXgvVn4H7JquVRynkoXaX7288qwXO
         YGir2nFDyT1ni9nVORKqwoMwSY/UjC/EjOYiyGgtVTYQPNgBhTJlkFDv6blEwwIXOWC/
         QWmw==
X-Gm-Message-State: AOJu0Yz6nj3G+R79Yc/8Ce+hZ7kxvxVRtXh4JCwy25t7i+xGkK557Chq
	IeXtRcXfG6ZjJVueDUHR867AGg==
X-Google-Smtp-Source: AGHT+IGjEutPppYkL0YhjPcCtpI9vIs+tY+Thj66MkeS8HxckWZbm+0GoHU8ZWsKs4frxVPm/OnS0Q==
X-Received: by 2002:a7b:ca57:0:b0:405:34e4:14cf with SMTP id m23-20020a7bca57000000b0040534e414cfmr18886359wml.4.1697026074383;
        Wed, 11 Oct 2023 05:07:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b004013797efb6sm18902138wme.9.2023.10.11.05.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 05:07:53 -0700 (PDT)
Message-ID: <513b1049-3cc5-43ad-9ab4-8b90d79d13e8@linaro.org>
Date: Wed, 11 Oct 2023 14:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
To: Greg KH <gregkh@linuxfoundation.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 olof@lixom.net, cw00.choi@samsung.com, andre.draszik@linaro.org,
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org>
 <2023101111-banknote-satin-1f77@gregkh>
 <a6c57156-d3a5-4524-8ef8-6f27cf0a2c97@linaro.org>
 <2023101137-fester-rerun-5c39@gregkh>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2023101137-fester-rerun-5c39@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2023 10:57, Greg KH wrote:
> On Wed, Oct 11, 2023 at 09:49:07AM +0100, Tudor Ambarus wrote:
>> Hi, Greg,
>>
>> On 10/11/23 08:48, Greg KH wrote:
>>> On Tue, Oct 10, 2023 at 11:49:16PM +0100, Peter Griffin wrote:
>>>> Add dedicated google-gs101-uart compatible to the dt-schema for
>>>> representing uart of the Google Tensor gs101 SoC.
>>>>
>>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>>> ---
>>>>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
>>>> index 8bd88d5cbb11..72471ebe5734 100644
>>>> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
>>>> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
>>>> @@ -19,11 +19,13 @@ properties:
>>>>    compatible:
>>>>      oneOf:
>>>>        - items:
>>>> +          - const: google,gs101-uart
>>>>            - const: samsung,exynosautov9-uart
>>>>            - const: samsung,exynos850-uart
>>>>        - enum:
>>>>            - apple,s5l-uart
>>>>            - axis,artpec8-uart
>>>> +          - google,gs101-uart
>>>
>>> These shouldn't be needed, just declare the device as the same as what
>>
>> We should have SoC specific compatibles so that any further quirks or
>> incompatibilities can be easily addressed.
> 
> "further" work on quirks or incompatibilities can be added when they are
> found and needed.  We don't add stuff for no good reason to the kernel.

With a Devicetree bindings maintainer hat:
We expect the device-specific compatible in all bindings, followed by
fallback. The fallback is used by the driver, the device-specific for
any future needs.

This is the practice we follow everywhere and recommend everywhere since
some time. It is also documented here:

https://elixir.bootlin.com/linux/v6.6-rc5/source/Documentation/devicetree/bindings/writing-bindings.rst#L42

Best regards,
Krzysztof

