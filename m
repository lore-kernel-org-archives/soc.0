Return-Path: <SRS0=5dap=HY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79BEC4332F
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 19:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D50B8C433CA; Wed, 13 Dec 2023 19:19:15 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD02EC433C8
	for <soc@kernel.org>; Wed, 13 Dec 2023 19:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD02EC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a1c7d8f89a5so970448866b.2
        for <soc@kernel.org>; Wed, 13 Dec 2023 11:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702495152; x=1703099952; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IyLZK0Q4UUy3edVFbbE5taYf3vBAb4m9JmdYBi1zuXg=;
        b=h8/4f+439cUJfdZc+IfzqczjuXIeZMYI1dt9NJzWc7oP6ZgxOfEtcIF9r6pEuarneU
         caHqwB7DEJYcUT6EJnKsjkojPudr5C+cth4/M4T3d0srgwm9tYLb3uOqWp4k9mulVDZe
         OlV9BXaomLaIqHRZIclk6it7k0VxwhRqXm1NenCLX7GImAXkF64RuFcRe4pDmY2c5qXR
         vxyaAbOYMLfUylZIH+beDb00V+Kkum4CBtTizOHlxyFpGVMbyERu0TSuXRai2RqxcU43
         jVQGvAQLCih3xU/8QU05bop/uI1gOmkreHu4vS4JCNwW/sN2jBV7REdgUSlbbHUbxbQ6
         MHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702495152; x=1703099952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IyLZK0Q4UUy3edVFbbE5taYf3vBAb4m9JmdYBi1zuXg=;
        b=iJmTPH3mcq/AL9v6PNfE9NDo/ukGJmBiR7l//3aTj2usuqmAWqF3HKbz1g1JSO6RKU
         GwbQFHgnLpnDbmXsMcJdL0BwugzIOwgrYJlbO+e7JR+W8EdBr7RD3wfj4iFgEzpGfo4i
         xS7N3tTzJUmqCnggVFe/CXQAQM2z5NVls19O6nKHXnwvbC/zr/TwKWS2vCI16+XbwCFH
         pm6LxR51EaLOIdVYoO7sDBbYb4tG4608QwIpWhRWESIei1WMssk3sQk9ZLZ8HK1CTcQv
         g1Wz69E69EGLAs3UO4bVEgz69j5UPydyX/p4XCM+Ly1KVp5KTmt3aQVuJXRwIqvvG2Nc
         gJDg==
X-Gm-Message-State: AOJu0Ywa0x1f4PVSaIImYm8YEnoZVXtFKI68cGy3xm7OHL5M73HXq5oo
	7HRArUWfS1mJH3DQ34mS0gS+XA==
X-Google-Smtp-Source: AGHT+IHe2oCpE5hoLsQtZOhOSa1CS6LxlkW89vAba1gSe/+elhIewojVPC1i7xpMFADBhxh+BtIu6w==
X-Received: by 2002:a17:906:5346:b0:a02:a2cc:66b8 with SMTP id j6-20020a170906534600b00a02a2cc66b8mr4165386ejo.14.1702495152178;
        Wed, 13 Dec 2023 11:19:12 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vq6-20020a170907a4c600b00a19b7362dcfsm8330910ejc.139.2023.12.13.11.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 11:19:11 -0800 (PST)
Message-ID: <8099aabc-a98e-444b-862f-72845e03476d@linaro.org>
Date: Wed, 13 Dec 2023 20:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK macros to
 use BIT macro
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org,
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
 andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com,
 willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <CGME20231211162434epcas5p485e7b2edbb02a1b6ea04ff5cc758f5db@epcas5p4.samsung.com>
 <20231211162331.435900-12-peter.griffin@linaro.org>
 <017401da2de2$400ec6e0$c02c54a0$@samsung.com>
 <CADrjBPoFu8azjZ65RGqae6HSCCoHQuhcBHNO_Fo0nVsE9pYGaA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CADrjBPoFu8azjZ65RGqae6HSCCoHQuhcBHNO_Fo0nVsE9pYGaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2023 20:13, Peter Griffin wrote:
> Hi Alim,
> 
> Thanks for your reviews.
> 
> On Wed, 13 Dec 2023 at 16:34, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>>
>>
>>
>>> -----Original Message-----
>>> From: Peter Griffin <peter.griffin@linaro.org>
>>> Sent: Monday, December 11, 2023 9:53 PM
>>> To: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>>> mturquette@baylibre.com; conor+dt@kernel.org; sboyd@kernel.org;
>>> tomasz.figa@gmail.com; s.nawrocki@samsung.com; linus.walleij@linaro.org;
>>> wim@linux-watchdog.org; linux@roeck-us.net; catalin.marinas@arm.com;
>>> will@kernel.org; arnd@arndb.de; olof@lixom.net;
>>> gregkh@linuxfoundation.org; jirislaby@kernel.org;
>>> cw00.choi@samsung.com; alim.akhtar@samsung.com
>>> Cc: peter.griffin@linaro.org; tudor.ambarus@linaro.org;
>>> andre.draszik@linaro.org; semen.protsenko@linaro.org;
>>> saravanak@google.com; willmcvicker@google.com; soc@kernel.org;
>>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>>> samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
>>> gpio@vger.kernel.org; linux-watchdog@vger.kernel.org; kernel-
>>> team@android.com; linux-serial@vger.kernel.org
>>> Subject: [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK macros to
>>> use BIT macro
>>>
>>> Update the remaining QUIRK macros to use the BIT macro.
>>>
>> Ah! I see you have change use BIT here, so you can squash this patch to
>> patch 10/16 or
>> Move BIT change from patch 10/16 to this patch. Either way is fine.
> 
> I actually kept them separate deliberately to avoid conflating adding
> of the DBGACK quirk with cleanup of the driver to use BIT macro.
> 
> As such one patch adds the QUIRK and only updates the macros that were
> touched by that patch (to avoid the --strict warnings), and the second
> patch cleans up the rest of the macros to use BIT macro for
> consistency.

Yeah, the defines are from existing code, so not really related to GS101
patch. Keeping it as separate cleanup is fine.

Best regards,
Krzysztof

