Return-Path: <SRS0=f+8Q=H5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BB6C46CD3
	for <soc@archiver.kernel.org>; Mon, 18 Dec 2023 14:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 536CAC433C7; Mon, 18 Dec 2023 14:39:11 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F16CEC433C9
	for <soc@kernel.org>; Mon, 18 Dec 2023 14:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F16CEC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a2369d9b04aso51133166b.1
        for <soc@kernel.org>; Mon, 18 Dec 2023 06:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702910347; x=1703515147; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0D9Bghj68RFZk0N72BDv6St5IxDAu55zRykcqXW6rA=;
        b=CcjaNk2RbvjM+2D8cq4L9ckHhEm0/EyxyRLsbsB5IBbkyeBKzhMOO+BaxRatN9kD8i
         Ie70f/Q7YOI+iH7c9wg/UBG0SZLAQs35nupA5MCg7MpvDcm2tXItE1lx48AB5SgKIdpP
         iob8v6upwV63DCxfsDTlepZWTosa4yasA6/aqRS7Wo73ivG/VNnbNl5UeadwBxeufuQU
         O7clYZrCt4/wQjCb0WHlhfPUoRWCUbgrGxoc/Lo2fEFBc0aUeQ+DeLfCLa0bHyR+1J8k
         EXaHy6aYf1ZfN6DT7s9Nh3gPbPrrnbO1o49HqSLVhqC0Y1uVd1QHCwDSh+LyLB3HrvXY
         zCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910347; x=1703515147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0D9Bghj68RFZk0N72BDv6St5IxDAu55zRykcqXW6rA=;
        b=azKhy0LssO6qANYSIPI0hlxhoAkAaSuPtob8tuqb8QXSQmc1jhOUvAkvPjhiQ/czcU
         yDAv7CUFo6deNFNL7QZPuEckm2nHtdZXjw9u6vIG41RPZzmmTW5UDaSr3XdS7O1KkZDZ
         blR64pluDEBTHV+uzCqyn4OPmB5FK3LKaYSD/npDoTtBADEXxvvHLO3JKlJ8L3oYhEcG
         SqhBeCXOsBS0GsZNKWSi98wZCqdkLU5LHScWFfG2ypSrDrbh876aBHN5rIo31+uEMjLU
         xT3P9LGIH2z1DsxXxtPf/+BajeeH3YNMXrJQhuMBJ24pW6lYLnd7H9g6yoHQTG0oMSBu
         VkmA==
X-Gm-Message-State: AOJu0YweRhkyup0ow8n/DAOKjBtFjS1GS1bTgJt/UznHawbz0OEMJ3NJ
	E19K8z4wsykgOmB4eBkmCc54nw==
X-Google-Smtp-Source: AGHT+IEeTtmIhd8DTZtlL0Swnu6COI7ZxlJ1QjcRcA5HggMaslGc6xfPjjKmUdADt9j3W2SSOYYRnw==
X-Received: by 2002:a17:906:5c:b0:a23:660:ec5c with SMTP id 28-20020a170906005c00b00a230660ec5cmr3480240ejg.40.1702910347511;
        Mon, 18 Dec 2023 06:39:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tk7-20020a170907c28700b00a1d1ebc2206sm14209619ejc.72.2023.12.18.06.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 06:39:07 -0800 (PST)
Message-ID: <aaeb97f1-075e-44b9-874d-f66763ef8866@linaro.org>
Date: Mon, 18 Dec 2023 15:39:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: MAINTAINERS: drop empty entries for removed boards
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, arm <arm@kernel.org>, soc@kernel.org,
 Olof Johansson <olof@lixom.net>
Cc: Lennert Buytenhek <kernel@wantstofly.org>,
 Steve Sakoman <sakoman@gmail.com>, "Mark F . Brown"
 <mark.brown314@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Florian Fainelli <florian@openwrt.org>,
 Simtec Linux Team <linux@simtec.co.uk>
References: <20231218134532.50599-1-krzysztof.kozlowski@linaro.org>
 <24e92cfc-8dc8-47b8-b379-ed8b1b776fba@app.fastmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <24e92cfc-8dc8-47b8-b379-ed8b1b776fba@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/12/2023 15:21, Arnd Bergmann wrote:
> On Mon, Dec 18, 2023, at 13:45, Krzysztof Kozlowski wrote:
>> Drop empty and redundant maintainer entries for boards which were
>> removed to fix `scripts/get_maintainer.pl --self-test=sections` errors
>> like:
>>
>>   ./MAINTAINERS:2021: warning: section without file pattern	ARM/CIRRUS 
>> LOGIC EDB9315A MACHINE SUPPORT
> 
> Good catch, I wonder if I missed these in last year's board removal
> or if they were already broken back then. Some of these 
> 
>> @@ -2171,11 +2166,6 @@ T:	git 
>> git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
>>  F:	arch/arm/boot/dts/nxp/vf/
>>  F:	arch/arm/mach-imx/*vf610*
>>
>> -ARM/GUMSTIX MACHINE SUPPORT
>> -M:	Steve Sakoman <sakoman@gmail.com>
>> -L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>> -S:	Maintained
> 
> I don't know if Steve still cares, but the board is still there
> in arch/arm/mach-pxa/{gumstix,am200epd.c,am300epd.c}

I did not dig that deep before, but since you insist let's take a look:

Entry was introduced in 90b8fc34968d ("[ARM] 4867/1: Adds flash, udc,
mci support for gumstix F boards") and it did not cover board files.

>  
>> -ARM/INTEL XSC3 (MANZANO) ARM CORE
>> -M:	Lennert Buytenhek <kernel@wantstofly.org>
>> -L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>> -S:	Maintained
> 
> Same here, the code is still there and used by pxa3xx:
> 
> arch/arm/mm/*xsc3l2*

Similar see: 2b7a52a459cb ("[PATCH] Update CREDITS and MAINTAINERS
entries for Lennert Buytenhek")

Adding the files to these entries would be actually changing status quo.


> 
>>  ARM/LG1K ARCHITECTURE
>>  M:	Chanho Min <chanho.min@lge.com>
>>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>> @@ -2840,11 +2825,6 @@ F:	arch/arm/boot/dts/synaptics/
>>  F:	arch/arm/mach-berlin/
>>  F:	arch/arm64/boot/dts/synaptics/
>>
>> -ARM/TECHNOLOGIC SYSTEMS TS7250 MACHINE SUPPORT
>> -M:	Lennert Buytenhek <kernel@wantstofly.org>
>> -L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>> -S:	Maintained
> 
> arch/arm/mach-ep93xx/ts72xx.c is about to be obsoleted by the ongoing
> DT conversion.
> 
> 
>> @@ -17674,14 +17649,6 @@ L:	linux-gpio@vger.kernel.org
>>  S:	Maintained
>>  F:	drivers/gpio/gpio-pxa.c
>>
>> -PXA MMCI DRIVER
>> -S:	Orphan
>> -
>> -PXA RTC DRIVER
>> -M:	Robert Jarzmik <robert.jarzmik@free.fr>
>> -L:	linux-rtc@vger.kernel.org
>> -S:	Maintained
>> -
> 
> drivers/mmc/host/pxamci.c and drivers/rtc/rtc-pxa.c
> are still in use.

MMCI does not have maintainer.

For the RTC, I guess the intention of 57f63bc8fe79 ("rtc: update
maintainership of pxa rtc driver") was to maintain the driver.

The actual problem is that all of these entries (and R-321X below) come
from the times people were not putting any file paths to MAINTAINERS.
They stayed like this for 15-17 years, thus being effectively noop.

Let's maybe wait till any of Cc-ed people respond and confirm they want
to grow the maintainer entry to cover the files? If they don't come, I
propose to remove them.

> 
>>
>> -RDC R-321X SoC
>> -M:	Florian Fainelli <florian@openwrt.org>
>> -S:	Maintained
>> -
> 
> This is still supported and it's x86 rather than arm.
> 
> There is a good chance that we /should/ remove it for being obsolete,
> but that has to be a separate series and remove the drivers and
> architecture support if we decide to go that way.

Sure.

> 
> I'm fairly sure this platform was originally added for use with
> OpenWRT but not everything was merged and OpenWRT stopped
> carrying the required patches in 2016:
> 
> https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=fed29fa36bf9ff387ff6e96522b1b5423fed3581
> 

Best regards,
Krzysztof

