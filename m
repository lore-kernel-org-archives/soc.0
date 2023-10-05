Return-Path: <SRS0=LOTP=FT=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECC4E92731
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 19:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48455C433C7; Thu,  5 Oct 2023 19:29:34 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C73BC433CC
	for <soc@kernel.org>; Thu,  5 Oct 2023 19:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C73BC433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9b95622c620so259585566b.0
        for <soc@kernel.org>; Thu, 05 Oct 2023 12:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696534170; x=1697138970; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8FcIrqBncC9Mrs6EWL94iGiE6FYJb1dG9INjYIsj2wg=;
        b=k+YzRPwn7rairnQdY9U25bHwYl+nuU0A8h91VhEICLTGkTxzQpbX8Od9ZhtEJCb1gB
         GRBaeJ3/Jerd9D+WMqG6hLuPqDcCBXoHnLqfxRIiFdUmNBCUSJxLgt1KTTCkaMpZOLs4
         HlUCjWD8Ym+YlX9hsuZ2/OPqawNEaZjBIlLwsIXrhaoIP83diQXtA3Jc45iewK9qEtET
         fNKtlUQ9MqOTq+IoVbOx9Qq77ZBQPtltDFLTI1pCJNTz45xd+OsWYiFV8jG7BEPC1oS1
         rND70L9eVmwQKzrTOcTnJIMxatJ4O0ogAHxbWIQICxXxUVU8bt6jRRxmiqbBJb0QhwCM
         KObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696534170; x=1697138970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8FcIrqBncC9Mrs6EWL94iGiE6FYJb1dG9INjYIsj2wg=;
        b=P1G6nIDs/GNNiafkuanHh9gEjji2l4YD4Elvnmw49KCYReWOXYWyLIPliYpTIoK4Gj
         ZwgUdqEwcyIkCTMNVhEms5OIqHU6qwjz0kV02wxlyjyLwkXYy/bd7Oq/WAhVvjrESP7z
         ECOMVaNvmXosXTdTTsgHjKwBGfNvU+mqcZcPFsCzCPObmoK0yLsGoqjXf5XR/7BGrh4e
         0PHBKF5g4QQIN55ng7n7uDx7WIhe03SR5qJ2fRX1sLNCFB06vSQpCsbzlQMgl1uZkYzB
         ChvP0YabvExnyLoVj3mrAVs1XS/2okbNC9eDHSGeUJS/Dcv/BWuoBJaVv1Llrc1yJPkm
         i2XQ==
X-Gm-Message-State: AOJu0YyPkE46Da6IJPJKpGR/CeX+UvaxW1x6de2+GKO/jA2Hq2TnXsOB
	vwVx6UJ0Iea4h9Xd4+hmP6ki1A==
X-Google-Smtp-Source: AGHT+IH5OVqZVwFMXRaCd1BDzWuuagJUNL+cVtINgJ+JuCQ4BBFliTN5odpOdP1Nfa2kVem3dld3Pg==
X-Received: by 2002:a17:906:220c:b0:9b8:a556:87a5 with SMTP id s12-20020a170906220c00b009b8a55687a5mr5241419ejs.22.1696534170424;
        Thu, 05 Oct 2023 12:29:30 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090617c200b009ad8084e08asm1640184eje.0.2023.10.05.12.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 12:29:29 -0700 (PDT)
Message-ID: <efc9f099-9c97-460b-b0c8-9891aa3b772a@linaro.org>
Date: Thu, 5 Oct 2023 21:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: William McVicker <willmcvicker@google.com>,
 Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
 andre.draszik@linaro.org, semen.protsenko@linaro.org, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel-team@google.com
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
 <ZR75cIvnQS2cqTT3@google.com> <2023100520-cleaver-sinless-fbae@gregkh>
 <99419159-cab0-4c79-a4a0-12229bfad3c0@linaro.org>
 <2023100513-mashing-scrubber-ea59@gregkh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2023100513-mashing-scrubber-ea59@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/10/2023 21:23, Greg KH wrote:
> On Thu, Oct 05, 2023 at 09:18:48PM +0200, Krzysztof Kozlowski wrote:
>>>> I'd like to bring up this thread and discuss the option of not introducing
>>>> another ARCH_* config:
>>>>
>>>>   https://lore.kernel.org/all/20200306103652.GA3634389@kroah.com/
>>>
>>> I agree, PLEASE don't add platform config options as that makes it
>>> impossible to make a unified kernel image that works for more than one
>>> platform at the same time.
>>
>> There is no single problem in making unified image as we were doing
>> since beginning of ARM64. The ARCH_* is not a obstacle for this.
> 
> Then why are the ARCH_* options needed at all?  What does this help out
> with?

It helps all the people and distros who do not want to build/package
drivers or modules for unrelated hardware or architectures.

Let's take Samsung Exynos UART driver. It will never, 100% never, work
on x86, x86_64. There is no single need to package it for kernels build
for these products. It will not work on nVidia Tegra ARM64, Qualcomm
ARM64 SoC, so if you do not want to run on Exynos, then you do no select
ARCH_EXYNOS and have significantly smaller image.

Now, there is no problem to have one kernel for nVidia Tegra + Qualcomm
+ Samsung Exynos with everything you need. The ARCH_EXYNOS or SOC_EXYNOS
or SOC_GOOGLE serves only the purpose to allow distros and people
customize build for specific hardware.

It does not limit anyone on anything.



> 
>>>> I especially don't like the "depends on ARCH_EXYNOS" because that forces one to
>>>> include all the other Exynos drivers that ARCH_EXYNOS selects that Google
>>>> Tensor SoCs don't need. Can we consider using SOC_GOOGLE instead and for all
>>>> drivers that actually depend on the SoC hardware, we can just add "depends on
>>>> SOC_GOOGLE"?
>>>
>>> Why do any of this at all?  It should not be needed.
>>>
>>>> The idea is that drivers should be tied to hardware -- not a specific vendor.
>>>
>>> And drivers should be auto-loaded.
>>>
>>> All of these drivers are not vendor-specific at all, they are based on
>>> the same IP blocks as others, so that is how they should be unified.
>>
>> They are vendor specific. All of them are specifically for Exynos
>> hardwre, because this is Exynos. We call it Google GS/Tensor SoC just
>> for fancy convenience, but this just Exynos.
> 
> Ok, then why is this ARCH_ option needed if these IP blocks really are
> from something else and are part of other drivers?

For the same reason above, because if I want to build kernel for
Qualcomm, I want to drop easily anything not related. If I want to build
kernel without I2C, I disable I2C bus which effectively disables all
drivers which work on I2C. If I want to build kernel without Exynos, I
disable ARCH_EXYNOS which effectively disables entire Exynos hardware.

Think of SoC as a bus or interface.

Best regards,
Krzysztof

