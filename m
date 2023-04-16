Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CBFC77B61
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 12:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 180F6C433A4; Sun, 16 Apr 2023 12:37:07 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 054B2C433D2;
	Sun, 16 Apr 2023 12:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 054B2C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f66.google.com with SMTP id sz19so184159ejc.2;
        Sun, 16 Apr 2023 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681648624; x=1684240624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDa2GFtYkfWVlc8ZTMskD2bfRssb3+wPHR9VnWdgQkk=;
        b=Ye4lxVUXva7hfPvirb5EICjV7mvCIR+LZoN3QkH/Aa9mcMNRKXRHXY7XX9YxfQiM4d
         UHF+N75fqf6yWUywGE72iYA9LGogaxALspplCNngKKlCEiNB/KHmYLhX5s9kFNdrJlgm
         Ps5No9KHIl4sEN/LvkdFDyEuljHQ2Yb4FiMA1QptZREt1Bp0QkaLum68LKPqGSisGWmj
         02RcdFqsq/361uqczbuNL3um2U2cyI0NQiD7Oc40B1PwxsMYtEbKZYmC5yPD3d1E2/Ce
         TzkSQIRiqBSrM/faDZ7/OC9IJha+EfIshOaH1OD3tv+CNbl5x1Wr5b1zwVnYnEvDen3x
         FaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681648624; x=1684240624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDa2GFtYkfWVlc8ZTMskD2bfRssb3+wPHR9VnWdgQkk=;
        b=CoF0i1UkaNWDCclRf4h6drKDzEmN2i3w7zbtst9wQXZm74Z1SdVmPXsto8XOlv3ht/
         34gCFegvAIprEu9PG3IF3wt9F0SVZK1Z1ArxJ69B+m4m5MMMxZFEC6XdIhk0FVyEKhkE
         iCMIoGKYgqX7MHbYuhHSkCxuQleKIAdqOVMUv9zZakMe4JAeqKswYovL2tBcWPFKIB3H
         EbXf5d0yEWnsDZXEvoUdyZKn0swyunpq2SOqCUEvOn82Si+E4wpobNQpirtH2q0b7lPd
         7GS8QDoAKGywWOaH3dX5cQCEQba9oTpfWZZx/XPB9iL+4wiETqAAnmxE2cH5CqLh5uMu
         hZ2Q==
X-Gm-Message-State: AAQBX9eK5VP2vDkXE/B8UJL/WCxUDAde820PXQtW0Fd6vQaMSL3Q0CYB
	itHH5SkaKZavOTG0tdtRPwk=
X-Google-Smtp-Source: AKy350Z9RmwvdFDkqAGZQeSDhkrMeMTMfOfNN8b8VmhaRJ5qZRpnoXUSxR2zWJy9cKGKUWb33636uQ==
X-Received: by 2002:a17:906:82c5:b0:93f:2256:fc05 with SMTP id a5-20020a17090682c500b0093f2256fc05mr4820249ejy.55.1681648624015;
        Sun, 16 Apr 2023 05:37:04 -0700 (PDT)
Received: from [192.168.50.244] (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id i3-20020a1709061e4300b0092b8c1f41ebsm4999772ejj.24.2023.04.16.05.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 05:37:03 -0700 (PDT)
Message-ID: <8bb6e9a6-0143-3627-14c4-285ce2632070@gmail.com>
Date: Sun, 16 Apr 2023 14:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 00/12] Re-introduce Exynos4212 support and add Samsung
 Galaxy Tab 3 8.0 boards
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230416101624.15866-1-aweber.kernel@gmail.com>
 <3e513119-4d6a-18ec-aaec-1c6b2b7e35b4@gmail.com>
 <ba148e6c-1685-f6d4-458f-bbdf1dd674cf@linaro.org>
 <36287654-c6e6-f4bd-320c-866bef692d2f@gmail.com>
 <d0b2868f-cade-feb1-52cd-2aacd537c9c6@linaro.org>
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <d0b2868f-cade-feb1-52cd-2aacd537c9c6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2023 12:53, Krzysztof Kozlowski wrote:
> On 16/04/2023 12:49, Artur Weber wrote:
>> On 16/04/2023 12:34, Krzysztof Kozlowski wrote:
>>> On 16/04/2023 12:26, Artur Weber wrote:
>>>> On 16/04/2023 12:16, Artur Weber wrote:
>>>>> This patches re-introduces the Exynos4212 platform and adds support
>>>>> for the Samsung Galaxy Tab 3 8.0 series of tablets that uses it:
>>>>>
>>>>>     - Samsung Galaxy Tab 3 8.0 WiFi (SM-T310/lt01wifi)
>>>>>     - Samsung Galaxy Tab 3 8.0 3G (SM-T311/lt013g)
>>>>>     - Samsung Galaxy Tab 3 8.0 LTE (SM-T315/lt01lte)
>>>>>
>>>>> What works:
>>>>>
>>>>>     - Display and backlight
>>>>>     - Touchscreen (without touchkeys)
>>>>>     - GPIO buttons, hall sensor
>>>>>     - WiFi and Bluetooth
>>>>>     - USB, fuel gauge, charging (partial)
>>>>>     - Accelerometer and magnetometer
>>>>>     - WiFi model only: light sensor
>>>>
>>>> This patchset depends on "[PATCH 0/3] Add Samsung S6D7AA0 panel
>>>> controller driver" for the display panel support for the Samsung Galaxy
>>>> 3 8.0 boards.
>>>
>>> Why? DTS and ARM code cannot depend on driver changes. Please rework
>>> your patchsets to remove any of such dependencies.
>>
>> Ah, that makes sense. I'll re-send the patchset in a second with the
>> panel node removed.
> 
> I am sorry, I don't understand. Why would you remove anything from DTS?
> Are bindings NAKed?

The dependency display panel patchset introduces the panel and its 
bindings, which in turn are included in the Tab3 DTSI. It was submitted 
at roughly the same time as this series, and hasn't been fully reviewed 
or merged as of writing. (I have seen your comments on that patchset, 
and I will be addressing them shortly.) So the bindings haven't been 
explicitly ACKed yet (assuming you mean the Acked-by reply).

In response to:

 > Please rework your patchsets to remove any of such dependencies.

I suggested that I could remove the panel node from the DTSI for the 
time being. The intent was to submit it in a separate patch later, once 
the display is reviewed/merged, and thus actually available in the 
kernel; this way, the two patches could be reviewed and merged separately.

I could instead wait for the display patchset to get reviewed/merged 
first, then resubmit this series, if that's preferable.

I apologize for the confusion.

Best regards,
Artur Weber

