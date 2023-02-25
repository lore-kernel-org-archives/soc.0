Return-Path: <SRS0=WHcG=6V=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6727AC6FA8E
	for <soc@archiver.kernel.org>; Sat, 25 Feb 2023 13:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02BD1C4339C; Sat, 25 Feb 2023 13:12:02 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCD4EC433EF
	for <soc@kernel.org>; Sat, 25 Feb 2023 13:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCD4EC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so4130654wmb.3
        for <soc@kernel.org>; Sat, 25 Feb 2023 05:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=venjkIokm8GSX2ge2Rc27dt76cxYVR85slS/SbYCDaI=;
        b=KfUc2TMjMgU8j1j5SmUZ57UkfL5HxpCSKgAhZP4qQizXeVmtzxOfOOVXIQqIFzVCov
         W1t32Qi2f2NnVvw3/KA9aGL4FFk3c+lqbm9pu4B/pkzM0fT1WndSEmFTyIgDzWyCcamB
         P7Cg6CnwRv2c7yzhNoFO9W8LCjaa0WJ8qvABY4/5J2kcsnkyQhOnnzHBAWQIyfRI8eOY
         z1izimCojPZ1dlYwiIHO78xzP+lishGZ0telNVWnRI7ViLb1MVdb0JgihnpGYtwAbl1F
         xLAocLciAwklAg8tXJxbCuN81IQHpukbq9IkHQ7LxEUhcHnGqnDz3WGKx4uQ5JbnDahQ
         dXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=venjkIokm8GSX2ge2Rc27dt76cxYVR85slS/SbYCDaI=;
        b=n1arT0eFftTW+QxvZUF0yVbKiYMRfWb60kcM7S5B90E/8W5BTAKNJl7qqvu7UO0AiF
         bGjd9MIfVTM3LpCiYAc8h0GTPMlYABfXBmUrsgMWonTrGgX4Evi6iphuqTcKgpXwj5+/
         SbOIUXHdzDXkXG+Xyq6pERHJjjmKVjQilDc1kVOR3hcexaHhgucoSCY+B3sKLZPJ7u1T
         wwdd3d5E/Kzt/qYRkznkT5HMt+qPgXp1x0xqWEqMDzPPAmdOBsdmIF9HVHxLmU5SLU3N
         Mfo+IkR+63vxKYqVSfNvVYnhGkrBr7+m9EZRKr6eM++kQxBTsfn2zC/I9KAJRo3VxbAH
         uAkA==
X-Gm-Message-State: AO0yUKWb0RqszLmpe57z9kcmbFWrQuW1vw/MZdC6FIh3dpnFLYitEXo7
	hzwvGkMNFXr2/cjIMmziZaeMrg==
X-Google-Smtp-Source: AK7set8O2VSqgwAnq/imhIlGDJngF7y0agxJuG7tVFHHKetGgD5yTpJ/duKxSgrL/CZ9LsS2rTAzRA==
X-Received: by 2002:a05:600c:1656:b0:3dc:46f6:e607 with SMTP id o22-20020a05600c165600b003dc46f6e607mr13468231wmn.3.1677330718912;
        Sat, 25 Feb 2023 05:11:58 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c470700b003eb3933ef10sm823506wmo.46.2023.02.25.05.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Feb 2023 05:11:58 -0800 (PST)
Message-ID: <23f7e0d9-32e5-654d-9b4d-84c91f833b2f@linaro.org>
Date: Sat, 25 Feb 2023 14:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
To: INAGAKI Hiroshi <musashino.open@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <473e0ac5-f12a-c66f-6696-8b7fe6e540f0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2023 13:48, INAGAKI Hiroshi wrote:
> Hi Krzysztof,
> 
> thank you for the response.
> 
> On 2023/02/24 21:53, Krzysztof Kozlowski wrote:
>> On 24/02/2023 13:28, INAGAKI Hiroshi wrote:
>>
>>>>> +
>>>>> +/ {
>>>>> +	model = "IIJ SA-W2";
>>>>> +	compatible = "iij,sa-w2", "marvell,armada380";
>>>> It would be nice to start documenting the board compatibles, at least
>>>> for new boards.
>>> So...how do I do that?
>> Start with something like this for Marvell:
>>
>> https://lore.kernel.org/all/20230222203847.2664903-2-colin.foster@in-advantage.com/
> 
> Oh, got it. So marvell/armada-38x.yaml needs to be created from 
> armada-38x.txt like armada-37xx.yaml.

I don't understand why we need three or more files... all or almost all
platforms are having them in one file. So just merge them to one.

> 
> Questions:
> 
> - who should be assigned to "maintainers:" in new yaml?

Maintainer of platform.

> - should the old text file be deleted when new yaml is created?

If you convert, then yes, but we did not talk about conversion but at
least starting documenting the new ones.



Best regards,
Krzysztof

