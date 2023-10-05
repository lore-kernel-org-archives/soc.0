Return-Path: <SRS0=LOTP=FT=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9ADE9272C
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 19:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DDBBC43391; Thu,  5 Oct 2023 19:21:53 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D4DBC433CD
	for <soc@kernel.org>; Thu,  5 Oct 2023 19:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D4DBC433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9b974955474so250350166b.1
        for <soc@kernel.org>; Thu, 05 Oct 2023 12:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696533709; x=1697138509; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zC5nmhOEkk98rezBT2eL5gPDYlMqNoJcj52hTWs3iUg=;
        b=rsovL8SUV2zCGtnklJ5gS+5+FlH1XaDKn1qUEH1XTwhaGg4ZqvMrwR3PI9Q6tfSGjj
         ez6ZoNv4H/u3l850zCyhoYv10geiHat05qybzNb/BXvs3GmBxLxYm4YJxwlZHilmPT7D
         bMvHwIg3IdANKlMbSnC59nRt6RPFMZEQ6A18TBN3ozzAtrs401x/kPYQEcuFLl83xNiJ
         KoE7umrG1FexeoDGKPfQFo8teqsXANB+moM4SBoelXW52Y5xhq6L3ZCXM2thedd+Df8d
         vm+ghvBMXAx2g0cV3KaXaIHfw2iylyEeS6pQ2lfXJly5lBCwDQTuaEAxmxNdV4T3Q14z
         M7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696533709; x=1697138509;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zC5nmhOEkk98rezBT2eL5gPDYlMqNoJcj52hTWs3iUg=;
        b=uXC9zDK3vW0PWUOy+O8a0YtI0XLHqGhfzT111ZNErLwIYu/fq/Ag5EYVC7cWadZcgx
         wUy6+GUu2HkYJrwsRMn8xCC54iyrLDuvFlRXOtvsGtf9l8r+TibS1QJbJkALq3qlK4fV
         36IJE3hi8W+xOv6B8Wm+0FSmv4/6Rdm86i+cI1YTvPvahiXFheQFI2+w+tyIBEObGQpn
         26Q2qt1ZxBA5ljH/wkmFxqEuIpqQHzo7ADDStGUXoTmfAIJA4G/lSlY7RSHd4Vr2yFJp
         7fPLnQZmlvF7fuJijDre4TS+IYsVPXIvrWp9ieIMUbAAJFNV6B5EJRSjIFGJCDqvSafq
         pHkA==
X-Gm-Message-State: AOJu0Yw3FEyvg4B0A0bmm1ZWXciE0S/v/ASl2deCOOfZ4C1OfkLTNtUv
	rSBgAAiC3bZGTHs4trfCvlM5CQ==
X-Google-Smtp-Source: AGHT+IEsAQS65ajEAkvqirYG2lP79o5Xp6M15XP9UKihrzfeVYblRVgcZVLCMPbVyNs07EDBpyOXGQ==
X-Received: by 2002:a17:906:31c5:b0:9a2:5bf:8b14 with SMTP id f5-20020a17090631c500b009a205bf8b14mr6089768ejf.22.1696533709605;
        Thu, 05 Oct 2023 12:21:49 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id rn4-20020a170906d92400b0099bc038eb2bsm1613889ejb.58.2023.10.05.12.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 12:21:49 -0700 (PDT)
Message-ID: <20c6070e-edeb-4a9d-863d-143abc840874@linaro.org>
Date: Thu, 5 Oct 2023 21:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Content-Language: en-US
To: William McVicker <willmcvicker@google.com>,
 Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org,
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
 will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
 tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 semen.protsenko@linaro.org, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, gregkh@linuxfoundation.org,
 kernel-team@google.com
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
 <ZR75cIvnQS2cqTT3@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZR75cIvnQS2cqTT3@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/10/2023 19:59, William McVicker wrote:
> On 10/05/2023, Peter Griffin wrote:
>> Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
>> (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
>> phones. It features:
>> * 4xA55 little cluster
>> * 2xA76 Mid cluster
>> * 2xX1 Big cluster
>>
>> This commit adds the basic device tree for gs101 (SoC) and oriole
>> (pixel 6). Further platform support will be added over time.
>>
>> It has been tested with a minimal busybox initramfs and boots to
>> a shell.
>>
>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>> ---
>>  arch/arm64/Kconfig.platforms                  |    6 +
>>  arch/arm64/boot/dts/Makefile                  |    1 +
>>  arch/arm64/boot/dts/google/Makefile           |    6 +
>>  arch/arm64/boot/dts/google/gs101-oriole.dts   |   68 +
>>  arch/arm64/boot/dts/google/gs101-pinctrl.dtsi | 1134 +++++++++++++++++
>>  arch/arm64/boot/dts/google/gs101-pinctrl.h    |   17 +
>>  arch/arm64/boot/dts/google/gs101.dtsi         |  501 ++++++++
>>  7 files changed, 1733 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/google/Makefile
>>  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
>>  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
>>  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.h
>>  create mode 100644 arch/arm64/boot/dts/google/gs101.dtsi
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 6069120199bb..a5ed1b719488 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -107,6 +107,12 @@ config ARCH_EXYNOS
>>  	help
>>  	  This enables support for ARMv8 based Samsung Exynos SoC family.
>>  
>> +config ARCH_GOOGLE_TENSOR
>> +	bool "Google Tensor SoC fmaily"
>> +	depends on ARCH_EXYNOS
>> +	help
>> +	  Support for ARMv8 based Google Tensor platforms.
> 
> I'd like to bring up this thread and discuss the option of not introducing
> another ARCH_* config:
> 
>   https://lore.kernel.org/all/20200306103652.GA3634389@kroah.com/
> 
> I especially don't like the "depends on ARCH_EXYNOS" because that forces one to
> include all the other Exynos drivers that ARCH_EXYNOS selects that Google

Since we are creating unified kernel images, having other drivers is not
a problem.

> Tensor SoCs don't need. Can we consider using SOC_GOOGLE instead and for all

SOC_GOOGLE will work exactly the same and depend on ARCH_EXYNOS or
appear everywhere as ARCH_EXYNOS. We already had this talk with Tesla.


> drivers that actually depend on the SoC hardware, we can just add "depends on
> SOC_GOOGLE"?
> 
> The idea is that drivers should be tied to hardware -- not a specific vendor.

And hardware is Exynos. Tesla FSD and Google Tensor is Exynos, even if
you do no like calling it.

> By making drivers depend on ARCH_*, you are introducing an arbitrary vendor
> dependency and not a hardware dependency.

There is no arbitrary dependency. We call it all Exynos hardware,
because this is Exynos.

I remember what you were pushing for removal of ARCH_EXYNOS and there
waas clear feedback, not only from me: this is against communities goals.

> 
> Thanks,
> Will

Please trim the replies from unrelated context.


Best regards,
Krzysztof

