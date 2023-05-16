Return-Path: <SRS0=P+GZ=BF=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A91C77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 10:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29C31C4339B; Tue, 16 May 2023 10:08:45 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0138EC433D2
	for <soc@kernel.org>; Tue, 16 May 2023 10:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0138EC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-96aadfb19d7so877978566b.2
        for <soc@kernel.org>; Tue, 16 May 2023 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684231721; x=1686823721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6yW3uiUU8worGAhCWTnKjolqfsTZfDHxQcGNaSZOHo=;
        b=sYbwL8NbcnUYOCmm3ua2K3PkwzXy2DvCrp/FiM1YYTZHJnS8MZ9MycZXzvPIH52y8K
         nx16349Gw5DCWd4wBnLWC5Y8MdO9Y4kq8gB8BJN4eEdU8Jr1HuHasO9Pbo9/wyo3JXnL
         mRD7nI2xPMPT48q3tiLj9YPcWj74NRWeZ0ts/t9B6c+AJgsxc+uHTabZ57oDUr2t+5Pt
         rkF2FYG4brCI76Yhjmkyumc1Ng8NtaLbtpeGolmcAcQwFQoi70V/TtQYoBdDBucgIqMM
         hePl/rbvIfVEcFSGBDQckzVh9PMMsab89cJEQ0zng/U4CHMN/uWu2vzJ7nvqzKQRBPZZ
         A2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684231721; x=1686823721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6yW3uiUU8worGAhCWTnKjolqfsTZfDHxQcGNaSZOHo=;
        b=AXPNAUcxeBnjYm7nqWWxcQHZPbX3L8tiqozmbJ1AdBw1CYB5IlHyfw3vEKZO3N0oxu
         R7034EH8s+Ra9OE82HTjO0wG1qsVM1IIHXHZhFsTY93+h0dPgZ67zXRKTkYFdFGIpeaL
         XOMDUwOffRlAQzEd9RZIQZcSVb/n6CpMl3181AT1xI4JAoh0ODxgSd+/Zpwfh5QvdxQJ
         KsmlSSKbr0SWQN902vJKB235XxE06PmeZYNfT6DwirhMwF4JcNwOkTV/b/YDghZHgvQN
         HVXQFkiSn0Ym7QAEm/UYXCY0+PHoEf0UbKogsJzs/Tkbcf+wfJt2n67vmCU4uVxED9yZ
         /VcQ==
X-Gm-Message-State: AC+VfDxT27fwgycYdfIb0L/C4m6WTMt/gAIzWxp1iDHjABr+VzYVztPx
	w+i/H8T1ag/kueEJPY1ChpmHHg==
X-Google-Smtp-Source: ACHHUZ7RsURJ0g0lVoK+1AjWAF9OygwrFW8U+HKJt4w9B64uqLEs6dlJ9LWo64bJ/UesMm7TFHjspA==
X-Received: by 2002:a17:906:db08:b0:965:fa80:bf1 with SMTP id xj8-20020a170906db0800b00965fa800bf1mr34845143ejb.32.1684231721143;
        Tue, 16 May 2023 03:08:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id jy17-20020a170907763100b00969dc13d0b1sm10311892ejc.43.2023.05.16.03.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 03:08:40 -0700 (PDT)
Message-ID: <a3c625fc-2bc0-866f-bc60-f12e887fd900@linaro.org>
Date: Tue, 16 May 2023 12:08:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] Documentation/process: add soc maintainer handbook
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, "Conor.Dooley" <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Conor Dooley <conor@kernel.org>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Olof Johansson <olof@lixom.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20230515-geometry-olympics-b0556ff8a5f7@spud>
 <cf1c6b8c-8a3f-eca1-948f-e41946d4c34c@linaro.org>
 <20230516-grader-dejected-df65cdc584b3@wendy>
 <ea4bc471-9cac-4ef1-97aa-9cf71b60c785@app.fastmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ea4bc471-9cac-4ef1-97aa-9cf71b60c785@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2023 11:16, Arnd Bergmann wrote:
> On Tue, May 16, 2023, at 10:57, Conor Dooley wrote:
>> On Tue, May 16, 2023 at 10:31:19AM +0200, Krzysztof Kozlowski wrote:
>>> On 15/05/2023 21:20, Conor Dooley wrote:
>>
>>>> + - Defer the devicetree changes to a release after the binding and driver have
>>>> +   already been merged
>>>> +
>>>> + - Change the bindings in a shared immutable branch that is used as the base for
>>>> +   both the driver change and the devicetree changes
>>>
>>> The policy told to me some time ago was that no merges from driver
>>> branch or tree are allowed towards DTS branch, even if they come only
>>> with binding header change. There are exceptions for this, e.g. [1], but
>>> that would mean we need to express here rules for cross-tree merges.
>>
>> I've got away with having an immutable branch for dt-binding headers!
>> That said, Arnd did actually have a look at this (and suggested some
>> changes) before I sent it & did not cry fowl about this section. IIRC,
>> this is actually his wording, not mine.
> 
> Yes, I merge a lot of shared branches with dt-binding changes into the
> soc/dt branch, and I wasn't aware of a policy against that, certainly did
> not enforce it.

Not as enforcement, but as your (or Olof's) preferred approach. See for
example:

https://lore.kernel.org/all/CAOesGMhfrWSvLtDtGRWBTJiAoeSwzGgsdUTm26j1mpoVu0ghDg@mail.gmail.com/

https://lore.kernel.org/all/CAOesGMi98hJnUYVLkgcbBpXsi-Xe6QPh-gtLaPWPO-EW+KcGuQ@mail.gmail.com/

I understand the "preferred approach" as part of discussions on the
patches, when the entire patchset can still be re-arranged or changed.
Not as strict policy applied on the actual git pull request from
sub-arch maintainer.

If we want to keep such recommendation, let's embed it into maintainer
handbook, so we will not have to dig the emails.

> 
> I generally object to changes touching drivers/* or anything else besides
> arch/*/boot/dts, Documentation/devicetree/bindings/ and include/dt-bindings
> in the dt branches, but I have made expections in the past when there
> was a particular important reason.

Best regards,
Krzysztof

