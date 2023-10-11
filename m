Return-Path: <SRS0=7Fo6=FZ=linaro.org=tudor.ambarus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6EACD8C9D
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 08:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91AD5C433C9; Wed, 11 Oct 2023 08:42:51 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC16BC433C8
	for <soc@kernel.org>; Wed, 11 Oct 2023 08:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AC16BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9a6190af24aso1139201966b.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 01:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697013768; x=1697618568; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQVblcaazyZyyU0Xz3jnKqUUTme4HT3sP0gqd9Rl6LQ=;
        b=YSUQozVBWSPB1ZzuO3vaEF0PE1CQgYP6kSQVvftYKmoH43oue0FBqUr6Azod/Bq5XY
         noiCqdSJn1Ykd2DjnIzkaxjQWMNiZiUTTTsULYNF/FDToW+LriPtY0DCOv2ev2jsuxWS
         nv6Co5D4B6bEssQVgEVWdNyZ2NUfSW3NOqKnJ3YqXB9Mz3ktCxg8k6fPhblAZQrKEcSl
         g97sFczJObxh1HFEoe6hMZoYGM68LxpA3OeyUkvFBWbhtExUJy7Ijco1h1zua2174Gi4
         LdJVzd/xvah43GQN7wTGVT2/fdDJqn7VyhB59CUiCdMLiz6aUNmWMsLXLFDsxuTE1rtr
         gNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697013768; x=1697618568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQVblcaazyZyyU0Xz3jnKqUUTme4HT3sP0gqd9Rl6LQ=;
        b=tCjATa6zX6MpxiHb2xZJXxRsShxzLtqKSeLhUTaqT/C6MloS3HqCYcA8sRU3/Q2vKx
         /0yIQ2IyeaPQw4qBg3nBZmU3MKn6Yh6x96xvZENT0klYW/v+z19exYBosl8pD4QmrURx
         R72toP97Gj6o49puvrnM7MBWr5jeN7wBV3n35gMmQK3ElIRXyoCt+WZ3ZfwHxG/3UriE
         LAgTblFSdBmHLgk2KOYgjKi9VWZfLgEvV57rfuzB/I0EZw7sAONaEDLIeqhLKZk2lnGW
         uW/rN2VYQdE2sumU4LW5RnqXqqSG8PU9rE28n7obwDB+3jGE6uppwLii2p485u2GUUCD
         +KrQ==
X-Gm-Message-State: AOJu0YykzjCi7DYquD/+GZsEz6PLFr+Qe6r76BO7j9Oru5jUqozq9kkl
	dQIaXavTYfC+dQ5ZIEkAmce3AQ==
X-Google-Smtp-Source: AGHT+IFFg9jr8zTjiY0TW0V0idrabs2Pvc3T+NkXfL0RZxNQvIFEQsPwLLN6izM2Z3nlnBAnK9uYbg==
X-Received: by 2002:a17:906:1097:b0:9b2:b786:5e9c with SMTP id u23-20020a170906109700b009b2b7865e9cmr17958158eju.28.1697013767910;
        Wed, 11 Oct 2023 01:42:47 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id e12-20020a17090681cc00b009a9fbeb15f2sm9536588ejx.62.2023.10.11.01.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 01:42:47 -0700 (PDT)
Message-ID: <14bb7d8d-0f99-4a5e-aee6-b0db1d17c1e6@linaro.org>
Date: Wed, 11 Oct 2023 09:42:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>
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
 <92de302a-f6b5-465c-a5da-2a711861089e@linaro.org>
 <CADrjBPqOmGEzeVEKiysxQNo9+B0=zD3Z+G24fPDKrFsgUXYJjQ@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CADrjBPqOmGEzeVEKiysxQNo9+B0=zD3Z+G24fPDKrFsgUXYJjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/11/23 09:16, Peter Griffin wrote:
> Hi Tudor,
> 
> Thanks for your reply.
> 
> On Wed, 11 Oct 2023 at 07:10, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Hi, Peter,
>>
>> On 10/10/23 23:49, Peter Griffin wrote:
>>> Note 3: In `dt-bindings: pinctrl: samsung: add google,gs101-pinctrl
>>> compatible` I tried to narrow the interrupts check to
>>> google,gs101-pinctrl but I still see a warning: gs101-oriole.dtb:
>>> pinctrl@174d0000: interrupts: [[0, 0, 4],[..] is too long If anyone can
>>> educate me on what I've done wrong here it would be most appreciated!
>>
>> I guess the initial definition of the number of interrupts should
>> include the largest min/maxItems. I no longer see the warning with this
>> change:
> 
> Yes that is how it was in v1. The review feedback though was to narrow
> the scope to just google,gs101-pinctrl compatible using if: then: else: which
> is what I can't get to work properly.
>

Right. The diff that I sent is on top of your changes (patch 6/20).
I expect that when the interrupts property is defined it should include
the min/maxItems of all the available SoCs. Then use "if Soc" to narrow
the range.
