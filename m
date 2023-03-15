Return-Path: <SRS0=9v8K=7H=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA8EC61DA4
	for <soc@archiver.kernel.org>; Wed, 15 Mar 2023 15:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C44FC433D2; Wed, 15 Mar 2023 15:30:56 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A23CBC4339C
	for <soc@kernel.org>; Wed, 15 Mar 2023 15:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A23CBC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id eh3so21176033edb.11
        for <soc@kernel.org>; Wed, 15 Mar 2023 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678894253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KClxxgRQukl7kvRgovwy9/J2dhtuP4MRXvjFVgkceug=;
        b=L/wXf5gztwqfwhlh5WQgUuPqA0Kc8XZBuYjW+UUeEUqMycvz1/pjqxEUhdOHaontfN
         A06734KLTus/PajJS7Ktyota8nvM35HdvAg+Vyu3kWf62DnqjCDIpQ6EQIKG2twFd34y
         Ncfj4UsEhe+xQeE0gXZvpvwQ5kmuATafHJLQlmQn1SeBCmHT/yY2XxP7Ujo16JhQ+VlW
         TO+e33FR2sHrs8heOWjOW1bznspMjqn+aGd/VkM3ecLxJF9OB6PP6sKLBf3t2Njuikrn
         jYOqiHRM/Zdaz6nxcFgVsjQtKisAcECWu/MoxGp0Y2Io+eWqh1u3/KxfohuUI9AI+vDK
         vvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678894253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KClxxgRQukl7kvRgovwy9/J2dhtuP4MRXvjFVgkceug=;
        b=Mi9Pints7PdDvuwQK/NWcWZfj3XPba9WDsTkwVCFbgBnqDHairdnmwxS4k/XZQO16w
         MqZ2DIxsa2FTDIk8WpqHcUQQHMScDjcAoz8/qn9qqVb41bTxkVkguE2e4XKw3Q5RPd5u
         zYwJC4c1rdVT1Y/FpJV1/LWHoxP1TsrNyjKGjCFYRzguM4Cyle7ImamtaGxiRTPN5pO9
         thK/LZMz01sIo+W5kF8d9YH0zUK685HnPCFIkziLDx9HLtbb/frX5ynNzIb1LjRhGzAZ
         o5VtK0sO1bMoVTkr4rWm47R2Jf09aGFqZt8AUFXbytFbtPUBq4QU9ZyKAmdqxxMsQPTp
         4Knw==
X-Gm-Message-State: AO0yUKU2LpTJmE0GShEnBAyHBVfq5rfKzMCGAu1zstgQIblcaAPVl69W
	OMz/TzLCJUTXiiuRdRmzhQuffw==
X-Google-Smtp-Source: AK7set8b2eblWRwblvgFpekETWIpmI2Wm7H5FUzfxTTdQp6TGeC1Z4KrokuznG5NSYOxoI/uQa4XzA==
X-Received: by 2002:a17:906:2a49:b0:8e9:afb1:65c6 with SMTP id k9-20020a1709062a4900b008e9afb165c6mr2338665eje.13.1678894252893;
        Wed, 15 Mar 2023 08:30:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id i19-20020a508713000000b004af62273b66sm2633194edb.18.2023.03.15.08.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 08:30:52 -0700 (PDT)
Message-ID: <f852216a-51ec-4c9c-19b5-7de7c9ce321f@linaro.org>
Date: Wed, 15 Mar 2023 16:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: cisco: add device tree for Cisco CrayAr
 Argos.
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>,
 "Marcin Wierzbicki -X (mawierzb - GLOBALLOGIC INC at Cisco)"
 <mawierzb@cisco.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230315010920.2473206-1-danielwa@cisco.com>
 <d6f7a967-a0ea-c5d0-93f5-683e02673ed1@linaro.org>
 <20230315144654.GY15751@zorba>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315144654.GY15751@zorba>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/03/2023 15:46, Daniel Walker (danielwa) wrote:
> On Wed, Mar 15, 2023 at 07:38:52AM +0100, Krzysztof Kozlowski wrote:
>> On 15/03/2023 02:09, Daniel Walker wrote:
>>> From: Marcin Wierzbicki <mawierzb@cisco.com>
>>
>> Also few nits: subject: drop full stop.
>  
> I don't know what your asking here.

I am asking to drop full stop from Subject.

> 
>>>
>>> This adds device tree include file for Cisco CrayAR SoC and
>>
>> Do not use "This commit/patch", but imperative mood. See:
>> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
> Ok, I'll consider it.

Use Linux coding style, not your own.

Best regards,
Krzysztof

