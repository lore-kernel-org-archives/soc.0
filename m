Return-Path: <SRS0=tuuZ=NO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D356C27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E7F8C4AF49; Wed, 12 Jun 2024 13:43:24 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BAC2C4AF1A
	for <soc@kernel.org>; Wed, 12 Jun 2024 13:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2BAC2C4AF1A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6ef8e62935so306640566b.3
        for <soc@kernel.org>; Wed, 12 Jun 2024 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718199801; x=1718804601; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tw/7zGdTsSeZNmEJkjTPH0b3j/r5J+D7HHf+/YeS7UQ=;
        b=wc5eECd9VD+pdsAxrWv9slV0Cu5saLFuMfPM+ZS77bHhsk5DjCYkXcU2SSF4dgPgYy
         36k+IvkuxDrXS2Jy+BA4ISR4hMcSUYPCyjN1I1wBWh4VEAmUrsVKKExcZEi7owDnRjFj
         RSRior1Px528LeyJYYzn942XF6v2FRpsCEKNc+rSTS/Z/h862S3w5i8IPkLrO2Hp0Kc8
         5pDeU27AhlceF0ZNG7VUKbiAWE6b0lwFgLYYcBWRu/5X7ldpVg8JmJhJuciZpbdUS3cp
         qyR3QaWf7Jx0Q+PI3ViMwGzBCEGyQFt8+oAs9kNxK0fCpcb3RhbBkelPAzuaCjff8LGL
         bfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718199801; x=1718804601;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tw/7zGdTsSeZNmEJkjTPH0b3j/r5J+D7HHf+/YeS7UQ=;
        b=sH7BkIUaHYb1nrvRI1vAmW9DreuV+IGCzjXdDu+4NBqzNe4V4NQDsArq3PIYHJoDty
         uIeeKE+UOc56CGM/kHAfMcArSUeKGNlOAwIuY4ZjCJZIpmE+Fy04GT5r6SXLX6MjyqfO
         Yk8cVASaEosXAihuiFLopwkey243zqAAkezBFn9EDnlXf9gloeNHBbN7bkbT0iG9WNle
         OY1AIWGxx/sIokvpsroj3GNj4H2nRQqyDEBnxrvEHpEAF6Bm73+pEwIrPR7S9ogU/PY5
         ph4ypvCbGtdleyyxzM2W/iFAzf8A9eNPLckfToojCVoH5olPqsGmPQP5/B503FSQUPly
         8NSg==
X-Forwarded-Encrypted: i=1; AJvYcCXPxLVlY+5UQLDhYpqlAbbk9cUtOKg9VVW2yTQnPV6rkC1DRkSeQRejIsw5HPXI5TQJ7DauxjP+AN7B0+NHng==
X-Gm-Message-State: AOJu0YxhfVBdsV2Fis2UKs1l0v0vVT7aRGsjQMZSXRHYTz98SZevdEoq
	BJIAG/Ok4FACoMDAEGlEGpsjOk1v7cZGF1EoTOUbKWPgISOsP6aWOMz6bSvc/ck=
X-Google-Smtp-Source: AGHT+IHasYGYvCuR/gsemBMGOL3ZriQj+qaAAw0drH8GGQv4k/nCBqBPPkv10ZqO1bYW25jArgP9UQ==
X-Received: by 2002:a17:906:3e4a:b0:a6f:1a1a:d3f5 with SMTP id a640c23a62f3a-a6f47d4ef5emr140675366b.8.1718199801286;
        Wed, 12 Jun 2024 06:43:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0a4c4c72sm570792366b.193.2024.06.12.06.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 06:43:20 -0700 (PDT)
Message-ID: <82482ddc-9f0f-45b6-b1a1-6de2617b6980@linaro.org>
Date: Wed, 12 Jun 2024 15:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: ARM: vt8500: add Krzysztof Kozlowski as
 maintainer
To: Alexey Charkov <alchark@gmail.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm <arm@kernel.org>, soc@kernel.org,
 Olof Johansson <olof@lixom.net>
References: <20240612111623.102868-1-krzysztof.kozlowski@linaro.org>
 <b1f14e92-4491-45f5-90ca-cc3d5ceea81f@app.fastmail.com>
 <CABjd4YxxmNqDXe7SSzTpr4gsf4-Rp4sgB8x2sYSGzDDx5CWo2A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CABjd4YxxmNqDXe7SSzTpr4gsf4-Rp4sgB8x2sYSGzDDx5CWo2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/06/2024 14:57, Alexey Charkov wrote:
> Hi Arnd, Krzystof,
> 
> On Wed, Jun 12, 2024 at 3:43 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Wed, Jun 12, 2024, at 13:16, Krzysztof Kozlowski wrote:
>>> The ARM VIA/WonderMedia VT8500 platform became orphaned in
>>> commit 8f1b7ba55c61 ("MAINTAINERS: ARM/VT8500, remove defunct e-mail")
>>> and clearly it is on the way out of the kernel.  However few folks send
>>> patches to it and it is nice to actually take them, till the platform is
>>> in the kernel.
>>>
>>> I do not plan to actively support/maintain ARM VT8500 but I can take odd
>>> fixes now and then.
>>>
>>> Extend the maintainer entry to cover also VT8500 DTS.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Cc: Alexey Charkov
>>
>> Thanks for stepping up. A few years ago, Alexey also had
>> some interest in this platform and knew some other remaining
>> users.
> 
> Indeed, I'm still interested in getting it up and running, and even
> got my good old WM8950-based APC Rock board out of storage for it
> recently. I also have a WM8880-based laptop and another WM8850-based
> one at hand, but need to bring them up to speed. Should also have a
> number of older WM8750, WM8650 and VT8500 (but not WM8505) devices
> somewhere deeper in storage.
> 
> I haven't touched the related code in a while, but as the original
> author of VT8500 and WM8505 support code from over a decade back I'd
> love to keep it all alive and functional, including reviewing and
> testing stuff as well as (hopefully) adding extra functionality that's
> been on my backlog for years. Does that count as support/maintain?
> Happy to be listed in maintainers and be in the loop if I qualify.

You can take the sole maintainership thus handle patches/pull requests,
or become added as a co-maintainer.

Best regards,
Krzysztof

