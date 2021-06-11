Return-Path: <SRS0=FjKb=LF=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4170C4743D
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 06:43:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ACD136136D; Fri, 11 Jun 2021 06:43:31 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67FCB610A2
	for <soc@kernel.org>; Fri, 11 Jun 2021 06:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67FCB610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wm1-f72.google.com ([209.85.128.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lrat7-0000dl-Jg
	for soc@kernel.org; Fri, 11 Jun 2021 06:43:29 +0000
Received: by mail-wm1-f72.google.com with SMTP id v2-20020a7bcb420000b0290146b609814dso4066513wmj.0
        for <soc@kernel.org>; Thu, 10 Jun 2021 23:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C6gfNxumQvAauUH0UC3BQ6OzW6ImVhOU0dXOw2iPMH4=;
        b=hvOb9Bok+ZcxtPsMBGAKXWbUt3VnyuAipp241TN6+tUZZQwd4s3MDJwJotqU5Getip
         J8yABpe7YNC6CSiMJVbYe3rh/0+Qk8G408D3O3XZxAVPN+rMDELIDAmJLEU8HJD7VZp0
         DCrYxOUiM284rmJh1+00iqTkj4Crx/irbbtDEALmha9W/HbVSORF7Pl8kclk4JUeHyzA
         WhoN1aGknb6RmIvsy+RQf7bTPl8ug6On42B6PyWeTgl4OEaYlkwdJyfgzlKTm0YuM9B9
         KRdp1wNAiAaFfBd+9Lgp9e8EF+ndr6qtpWmj0qyu5BEmRzPqSh0Zsmq6ogW8/UoMryKT
         YXRA==
X-Gm-Message-State: AOAM530U6XxOrp01nhxssoJrsTZhybqIQEOKIX0KXw8/rTjyHC+0FSsw
	sWOFYsbW7duj7ugUjvQdXgOCxnGgVAzAuRmlYCi5onbiG69t8kxWWNuoxsEq/80tx4V/UaSwT8a
	QSU+PlJ99xcf1rMbmMwKNGh4=
X-Received: by 2002:a5d:4903:: with SMTP id x3mr2088761wrq.376.1623393809261;
        Thu, 10 Jun 2021 23:43:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHIHXoAf7h4WnhTsz2rFmYQsfMYz4c84IeQVys+BC1mK1A1qd9wPsV+eWGDJaHAx4PsGcQwA==
X-Received: by 2002:a5d:4903:: with SMTP id x3mr2088742wrq.376.1623393809106;
        Thu, 10 Jun 2021 23:43:29 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id z5sm6018735wrv.67.2021.06.10.23.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 23:43:28 -0700 (PDT)
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
To: Will Deacon <will@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jon Hunter <jonathanh@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 Dmitry Osipenko <digetx@gmail.com>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
 <20210608120128.GB10174@willie-the-truck> <YL+A+MPjjaa3nSwq@orome.fritz.box>
 <20210608164851.GB10994@willie-the-truck> <YMHZCaRiQNQCSsVr@orome.fritz.box>
 <8c18edeb-2e3e-9072-6bb4-11637d0ca3e5@canonical.com>
 <YMIqNynz29Z9fYi3@orome.fritz.box> <20210610172958.GA14188@willie-the-truck>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <583c33e7-562f-0b1c-72b7-71f008a721f4@canonical.com>
Date: Fri, 11 Jun 2021 08:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610172958.GA14188@willie-the-truck>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/06/2021 19:29, Will Deacon wrote:
> On Thu, Jun 10, 2021 at 05:05:27PM +0200, Thierry Reding wrote:
>> On Thu, Jun 10, 2021 at 04:23:56PM +0200, Krzysztof Kozlowski wrote:
>>> On 10/06/2021 11:19, Thierry Reding wrote:
>>>> On Tue, Jun 08, 2021 at 05:48:51PM +0100, Will Deacon wrote:
>>>>> I can queue as much or as little of 2-6 as you like, but I would like to
>>>>> avoid pulling in the memory controller queue into the arm smmu tree. But
>>>>> yes, whichever of those I take, I can put them on a separate branch so
>>>>> that you're not blocked for the later patches.
>>>>>
>>>>> You have a better handle on the dependencies, so please tell me what works
>>>>> for you. I just want to make sure that at least patch 3 lands in my tree,
>>>>> so we don't get late conflicts with other driver changes.
>>>>
>>>> Yes, if you could pick up patch 3 and send out a link with the stable
>>>> branch, I think Krzysztof or I could pull in that branch and pick up the
>>>> remaining patches. It'd be good if you could also ack the remaining SMMU
>>>> patches so that ARM SoC knows that they've been sanctioned.
>>>>
>>>> Krzysztof: would you be okay with picking up patches 2 and 4-6 on top of
>>>> your memory branch for v5.14?
>>>
>>> You mean the iommu patches? Yes, I can take them and later explain to
>>> Arnd/Olof why they come through me.
>>
>> Okay, great.
>>
>> Will, can you provide that stable branch? Or would you prefer if I
>> prepared it and sent you a pull request? We're kind of running out of
>> time, since for ARM SoC the cut-off point for new material is usually
>> -rc6 and that's coming up pretty fast.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-thierry/arm-smmu

Merged, thanks.

I'll take ARM/SMMU patches from Thierry's patchset: 2, 4-6.


Best regards,
Krzysztof
