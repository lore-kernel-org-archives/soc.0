Return-Path: <SRS0=zMYq=JH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D770C47DB3
	for <soc@archiver.kernel.org>; Mon, 29 Jan 2024 15:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E815CC433C7; Mon, 29 Jan 2024 15:25:08 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31B8FC43394
	for <soc@kernel.org>; Mon, 29 Jan 2024 15:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31B8FC43394
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a35e0532900so95919766b.2
        for <soc@kernel.org>; Mon, 29 Jan 2024 07:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706541905; x=1707146705; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44CBuTgJQlwF0eeHJK4F2hy8sbbLi79OkGf8Y8hJ+fY=;
        b=CjUnx0JZFM6E7ga9B2g2E6Fg4btplwZmX47CoHuahk9CvOtIa5RZeO1xmVfKJAs2EW
         i2YlEyMQ01sdW+ltMznB7wexef3jlK8IegtjYDyL7lMDFDCzZWSmqXNvKhgT7USbNGPx
         Z/2R/N10RdvqPV6ZQqhE9XZWccaMUrD+Ey7KHjyYprz+vA5ZQ0jhRh+Lv/DpDCFQT81X
         4Y+BNVeaJGiqO4QqxYX68NHJxgnB0f7POETt5+NfrzFH8yl6eqvyiEGm7Vk4fLe8rN9S
         qrmp3xgNs4AKC3lyRgmaqyUN/TdacWlbqQ5/EFIEZyhByAdS5Ks02QxR8noYyk814Qhw
         0Lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706541905; x=1707146705;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44CBuTgJQlwF0eeHJK4F2hy8sbbLi79OkGf8Y8hJ+fY=;
        b=anoxjT5KuS6j2E9ICCznEjfCyNgq79z+6nRiNlashyfyuTqVg7Sui0PUgHbXtx3/wP
         Yj5MeOGobzowFPSYDGJEK7dvhERV0ctm4h+K9eeTxGzQk9lV8nFSSXr/fj12Gb2BQ9JT
         RezIbvLUIhgCgDZp9pSjkqPacazkA+bd6JUWaxXG5Psjmw2ek+IPYNlzpv/3KoHuJUIZ
         AFQb3HPaD4CmFrTqRCGuLKpUcxqhX8syCOyHMUJEUlX0KPyobbmQGGhMyYgQ9XABPyXj
         z+ktSnZKpCnnralV27yp2DJpHdRD7+3mprvgzx44bKfqObEMfywyIEk/1OHhb2xVy8Rd
         7L0A==
X-Gm-Message-State: AOJu0Yzg5JhuXGd4IbPyOiEtywraeIwoo4QK7F6iFl9HIkqaeVQigg6Y
	qKNtZt0OihvpqNJ1SLoCBroGVW1LiXJeu1pklfn874RHbveo1l0s1xyg+Oax1So=
X-Google-Smtp-Source: AGHT+IETxm9r/gSHYw+crnwleP4o4ZcGNgP+EzTfNyVJZbI1J6m8c/SvTC8UEDFFomj6K4rhGDAh6Q==
X-Received: by 2002:a17:906:ca52:b0:a36:416:6c18 with SMTP id jx18-20020a170906ca5200b00a3604166c18mr99090ejb.75.1706541905265;
        Mon, 29 Jan 2024 07:25:05 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id xa14-20020a170907b9ce00b00a34ae71e58dsm4084647ejc.147.2024.01.29.07.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 07:25:04 -0800 (PST)
Message-ID: <222f72ba-291a-4e16-855d-b873ec08494d@linaro.org>
Date: Mon, 29 Jan 2024 16:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support for airoha en7581 Soc
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dd@embedd.com
References: <ZbeJ5okKQ66FXGxP@lore-desk>
 <9e1ad877-f55c-4045-bb92-c30614d6c1ff@linaro.org>
 <ZbfCO5-RoOG902e2@lore-desk>
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
In-Reply-To: <ZbfCO5-RoOG902e2@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/01/2024 16:20, Lorenzo Bianconi wrote:
>> On 29/01/2024 12:20, Lorenzo Bianconi wrote:
>>> Hi Matthias,
>>>
>>> I was wondering about the status of the following patches:
>>> https://lore.kernel.org/linux-arm-kernel/20231001122418.2688120-4-dd@embedd.com/T/#rbafabf4bf2473327f35ce7d79623f63838630537
>>>
>>> Do we need to respin them? Thx in advance.
>>
>> I don't see anyone from SoC maintainers CCed on that patchset, so no one
>> will pick it up. Pinging makes sense if maintainers missed/ignored your
>> email. But if you do not send stuff to maintainers, you need to resend
>> to proper people, not ping.
> 
> I can't find any entry for airoha architecture in MAINTAINERS. Who is the
> expected maintainer? (e.g. ARM variant)

SoC maintainers are expected to be Cc'ed, even if they do not become
final maintainers. Get_maintainers, which should have been used there,
points it.

New platform should come with a new maintainer or should attach itself
to some existing platform. In both cases maintainers file will point to
platform maintainers...

> 
>>
>> Additionally, this is a new arch, but it seems to miss any maintainers
>> update.
> 
> I am not the original author of the series, I have just seen it on the ML and I
> was wondering about the status since it seems there are no replies.

Right. Lack of replies is the result of not Ccing anyone who would care.
get_maintainers.pl is the answer here.

Best regards,
Krzysztof

