Return-Path: <SRS0=rPDZ=GS=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7268BC4332F
	for <soc@archiver.kernel.org>; Sun,  5 Nov 2023 12:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37D63C433CC; Sun,  5 Nov 2023 12:52:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CFC9C433C9
	for <soc@kernel.org>; Sun,  5 Nov 2023 12:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6CFC9C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40859c46447so23062145e9.1
        for <soc@kernel.org>; Sun, 05 Nov 2023 04:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699188745; x=1699793545; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6Ws5fasEZRSyu0hAsK2i2tL+g26EZkfruEDDht/rZ4=;
        b=D/JHGaCcQtrm6+8BHtIoo9hwFrO1X15fuM1iWG1sHcfzzmO4S9HxiJ4/SplihVf5++
         jlgE/Scs0Uu0fybqZrdXI2/21V5pbirF986PvDpt94hfrrtO9dkl+uwVKq5+AfBXWs/O
         wRKbMjYnk7wdfnVULCzeXa8ZHCNgR367hTg/i0z40OzD1yQvoNny5s55qbPDuf0RflEZ
         /DX61HIIrA+sNqCwptRsnSd1OCp2SAMS+J2TyiL3KRN6jYdc0G22+A6/T9kD57VCH1uY
         J/3uDOdxvDUqcCiHhM1ZuvZHMm4TY8ValFHsYYbWRiIQ4+CN/Z9QmHvr4uX8ojEixd0C
         0MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699188745; x=1699793545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6Ws5fasEZRSyu0hAsK2i2tL+g26EZkfruEDDht/rZ4=;
        b=fb1L5F1Ppgz4tEPhfk8VHnibdqBG82hSLnPKp3y5rBP/ygfcqqqPfhh+dgUpRF47re
         +BQky3QDSYBmAeS8soDpmG1QCo0KbSTzSd9n1uqtQqvs483cu+xhOWTp9HIy96UduhED
         t8jlNgYlY+3aWv425kCIvVvGvWux7mD83w9/Q1RFm/ZXI7jpWd13ddzEfelpBXOYqhiA
         LwKXRNPj3vjxQM+OWRxfJ1kvupq4FYemB3GrtsHhlGkE/+AYgIxNPgqIaDOX759t5tvV
         OZeBlbzCG3jXWit5cXEKhcdGVk47avwfpxSuYxQn36bq7eWp0FG2iK6ykSPTIjgNVHlD
         jHqQ==
X-Gm-Message-State: AOJu0YwZeW4oYT5yqw6a9WyIHPgpZ07swbMP6r/WW4PLtnut3S2EodVi
	OOqjVgFXO8XGqcXQCz03FXbUbg==
X-Google-Smtp-Source: AGHT+IFIoSYERlOtxkCbopDwJv3f3AmYqItz+jjn7M2N4vnCCxyJvTlh9wlSBGFIwO8BLoYs2JurTw==
X-Received: by 2002:a05:600c:524a:b0:408:4160:1528 with SMTP id fc10-20020a05600c524a00b0040841601528mr22116065wmb.30.1699188745125;
        Sun, 05 Nov 2023 04:52:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c4e8600b003fefb94ccc9sm9046377wmq.11.2023.11.05.04.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Nov 2023 04:52:24 -0800 (PST)
Message-ID: <cee1b28d-5bd9-46eb-b9f4-facbad10b5d7@linaro.org>
Date: Sun, 5 Nov 2023 13:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Content-Language: en-US
To: William McVicker <willmcvicker@google.com>
List-Id: <soc.lore.kernel.org>
Cc: Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>,
 Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
 andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
 <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
 <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
 <c0b8f356-0f26-459d-850d-ec0fa1fd3987@linaro.org>
 <ZUUvp3kqM7NPlyZ_@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZUUvp3kqM7NPlyZ_@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2023 18:36, William McVicker wrote:

>>
>> That's indeed a problem. Future Tesla SoC might have just few pieces
>> similar to FSD. There would be no common SoC part, except the actual
>> Tesla IP.
>>
>> Same for Google. Future GSXXX, if done by Qualcomm, will be absolutely
>> different than GS101 and the only common part would be the TPU (Tensor).
>>
>> So now let's decide what is the common denominator:
>> 1. Core SoC architecture, like buses, pinctrl, clocks, timers, serial,
>> and many IP blocks, which constitute 95% of Devicetree bindings and drivers,
>> 2. The one, big piece made by Samsung's customer: TPU, NPU or whatever.
> 
> As mentioned above, I think this should be based on how the DTBs and DTBOs are
> used and distributed.

None of existing platforms do it. Nowhere. All chromebooks are split per
SoC, not "how DTBs should be used and distributed". There is no google,
no Chromebook directory. None of Samsung phones have it. No
Samsung-phone directory. None of Google phones have Pixel directory.

You are now trying to introduce completely new rule, not existing in any
upstream platform.


> What is the benefit of adding the gs101 board files under
> the exynos folder?

To make it easier for us to maintain. You won't be maintaining any of
these platforms. None of Google folks contributed patches or maintained
any of these platforms so far, so it is up to upstream community to
decide what is the most convenience way to maintain the kernel sources.

Best regards,
Krzysztof

