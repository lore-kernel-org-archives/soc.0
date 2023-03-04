Return-Path: <SRS0=+vxD=64=gmail.com=musashino.open@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF06BC678D5
	for <soc@archiver.kernel.org>; Sat,  4 Mar 2023 04:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8AE5C4339B; Sat,  4 Mar 2023 04:57:53 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A496AC433D2;
	Sat,  4 Mar 2023 04:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A496AC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so8195123pjb.1;
        Fri, 03 Mar 2023 20:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677905872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRxpRdlK2jl6m8hyYvsRgvlh56HhzD9eeLBRTxoUNp0=;
        b=TKR6FBHWRY8aaySkjDx0IT8iSSukPC/ifargj8uPi5r38Q9proVjISHxY8DjcV9bJU
         EPm8YPBySR5DzYmeKqo7j6K6Lo87svrh5rHhw5nAzNpZbgUfhks8ED62mAZJn1FMqtUR
         jLDLgw7Dx8U5Ph6R5yHsNC19dskwemWKesu+BtIIB0ZZhJHMBDiBFMnsbaUyKbtm+qyk
         7ibJn0NDe0NTFirxAJd1aukPVd4OZmy/Gq3HDzExIcBbZXulTKaVI62HeMohaG5r9ua3
         KPp1WV5ZiImdIfQGSQa3tBa4ny0Lftzh7E6VHxdeTyilo8F5Fyi68eHs16Vu5kZqg9Wk
         yGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677905872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRxpRdlK2jl6m8hyYvsRgvlh56HhzD9eeLBRTxoUNp0=;
        b=xVRk2Kv/7eden9M3VQzNau8zryfogR1nzkBDsnakzQSHOIbL3RkSFjsuYbhNhvp2bO
         fwADUWwuVCj4GoGP22CivIZofkDTlSNo8Ml4oqjncNcfPUs6kYCxV+BLyHV7oRWXAN7p
         IDwmwl6k3Z4I6+IT/lu6z+MHlngeHVPenQiZ5w2y/PwxdlL8YhldFTCGH4FPbitj1km5
         YVfFkJt1ZkDzAjd6ejY69t5IE/XGZkzdnFY8C07D1aafMNRcpYlPzjg+kZnWl7HaarbQ
         aFhUJ5fe9FJp6NwSuwTDF7dcWfTmCa/EaC2xBGWKiy0pRZFsDspynfgRz70d5AbB5VWZ
         yVEA==
X-Gm-Message-State: AO0yUKXWJ7Njg8v6DWvQE/+54IkYjZPfKMKpWSbgdCJ3/mhXvUCG3YA3
	lBhuMMsSDcjJ+wCUXNE5tZA=
X-Google-Smtp-Source: AK7set/iGlOQtOS7+sXLmSyogWn28+60eHroAi/pSlhfSGLhx1SFafe+FjnqaT0zTNDPOWOh7X28Ow==
X-Received: by 2002:a05:6a20:9149:b0:cd:83b1:420e with SMTP id x9-20020a056a20914900b000cd83b1420emr5103104pzc.50.1677905871919;
        Fri, 03 Mar 2023 20:57:51 -0800 (PST)
Received: from [192.168.1.39] (M014008005000.v4.enabler.ne.jp. [14.8.5.0])
        by smtp.gmail.com with ESMTPSA id g23-20020aa78197000000b0061949fe3beasm250454pfi.22.2023.03.03.20.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 20:57:51 -0800 (PST)
Message-ID: <0fd898ed-9288-2030-956a-0fa4d1afc3b5@gmail.com>
Date: Sat, 4 Mar 2023 13:57:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230223132502.2045-1-musashino.open@gmail.com>
 <20230223132502.2045-2-musashino.open@gmail.com>
 <76395d89-1c56-12b2-b6f7-e77603019b70@linaro.org>
 <e9da7a1e-d48f-014b-a0a7-841c77feb12f@gmail.com>
 <9a25020c-de26-5c1d-f7ff-c2dbb38d3872@linaro.org>
 <473e0ac5-f12a-c66f-6696-8b7fe6e540f0@gmail.com>
 <23f7e0d9-32e5-654d-9b4d-84c91f833b2f@linaro.org>
Content-Language: en-US
From: INAGAKI Hiroshi <musashino.open@gmail.com>
In-Reply-To: <23f7e0d9-32e5-654d-9b4d-84c91f833b2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 2023/02/25 22:11, Krzysztof Kozlowski wrote:
> On 25/02/2023 13:48, INAGAKI Hiroshi wrote:
>> Hi Krzysztof,
>>
>> thank you for the response.
>>
>> On 2023/02/24 21:53, Krzysztof Kozlowski wrote:
>>> On 24/02/2023 13:28, INAGAKI Hiroshi wrote:
>>>
>>>>>> +
>>>>>> +/ {
>>>>>> +	model = "IIJ SA-W2";
>>>>>> +	compatible = "iij,sa-w2", "marvell,armada380";
>>>>> It would be nice to start documenting the board compatibles, at least
>>>>> for new boards.
>>>> So...how do I do that?
>>> Start with something like this for Marvell:
>>>
>>> https://lore.kernel.org/all/20230222203847.2664903-2-colin.foster@in-advantage.com/
>> Oh, got it. So marvell/armada-38x.yaml needs to be created from
>> armada-38x.txt like armada-37xx.yaml.
> I don't understand why we need three or more files... all or almost all
> platforms are having them in one file. So just merge them to one.
>
>> Questions:
>>
>> - who should be assigned to "maintainers:" in new yaml?
> Maintainer of platform.
>
>> - should the old text file be deleted when new yaml is created?
> If you convert, then yes, but we did not talk about conversion but at
> least starting documenting the new ones.

thank you for your answers and sorry for my misunderstandings...

So, (to organize my thoughts and understand correctly)

- what is the optimal solution for "documenting the board compatibles" 
of Marvell platforms in the current state?
- What should I do in this contribution of SA-W2 for "documenting the 
board compatibles"?

>
>
>
> Best regards,
> Krzysztof
>

Regards,
Hiroshi
