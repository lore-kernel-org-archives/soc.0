Return-Path: <SRS0=hwAr=VX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA67BC433F5
	for <soc@archiver.kernel.org>; Sun, 15 May 2022 09:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A53BEC34118; Sun, 15 May 2022 09:54:43 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1174C34119
	for <soc@kernel.org>; Sun, 15 May 2022 09:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1174C34119
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id p26so21254016lfh.10
        for <soc@kernel.org>; Sun, 15 May 2022 02:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gQEfQ5vJQL6jpC1Tvs1WzVX7/mZ31DOC5y2HUnjzALI=;
        b=xS7pUV/3EkrxlycX0L6/FEA6iJPGxOoiDzuzWU3a1KmAOMiEyAhmSQGQRXrb35Yzt9
         zqTlWpN3qcThnhAFGsRCEPaN5aF7968EHYnTZaiIpmzmbuAjHUXpsHyF7lfYTl6V2i50
         rVhOXY2NzeI0vMCPQZWMBC/s5aEkH7pes1lAmxtw5aW9jGWK1pfS3qYXrjyf1Gsq40Q0
         fJvozTUM1W2RvfsErXyZEdMPvGhRvx+Ad3d9f4152J5VJL94ks4Weyn0miOBARtKis5u
         xuKbum/TRUKnk+0+YCDWObPH1VvS24mPFOKN1uKB1oSL6oMiuXXRxCwx9Ai3erRqJIIy
         NWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gQEfQ5vJQL6jpC1Tvs1WzVX7/mZ31DOC5y2HUnjzALI=;
        b=nR+RVOxDbJqgHUP+Oo7iiUcVS3fMauSf3ckwh6ezRSfLRjgul4XfR+NxOdzLG6hbOp
         L7gBlHX5+NLkZFPMfQgRMx8qLuhObL30nwA1ZgtnSMDO7B4S5qwGaJ1NMmxr1YeJdtGu
         DNdx8kG8vRJ81qcvxKntLo/Hn/GkY944TbrkcCjH7loQDJrtMyCkZz/CUTK3MNHMg7Es
         iXZ5u+uDdXuPuUf0/Pgsr10Pbvy8VOACaB9ZbnMMt1d+fH8kE2i/8iJ/mNsrgYbqYahs
         Sh1TI/DTq6IP3eTXK+3TeX9Xs6+hXAsFX4bGgGUDnCus7GtWH53WN4Fls8jdHyC4GpFH
         l0NQ==
X-Gm-Message-State: AOAM532EvAkrteutdmqcKMHXG78RMBMPDhcwvCSC+4iDc5BX5Syxi84D
	6ylFLhvhHp+QEiKroz4legUuvw==
X-Google-Smtp-Source: ABdhPJxcWukAIjcjb8gEHeipeH5rLBbB9Ymlx5x3k+a5VGCaBreyrDbuRJ5b5csmpQ8av1yz5XbC3Q==
X-Received: by 2002:a05:6512:3048:b0:473:a3d4:5252 with SMTP id b8-20020a056512304800b00473a3d45252mr9274506lfb.50.1652608480591;
        Sun, 15 May 2022 02:54:40 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y4-20020a2e9d44000000b0024f3d1dae9fsm1133677ljj.39.2022.05.15.02.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 May 2022 02:54:40 -0700 (PDT)
Message-ID: <c3b8a28d-087f-f973-17db-da9c0fed10dd@linaro.org>
Date: Sun, 15 May 2022 11:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH V4 3/5] arm64: dts: nuvoton: Add initial support for
 MA35D1
Content-Language: en-US
To: Jacky Huang <ychuang570808@gmail.com>, Jacky Huang
 <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, catalin.marinas@arm.com, will@kernel.org, soc@kernel.org,
 cfli0@nuvoton.com
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
 <20220510032558.10304-4-ychuang3@nuvoton.com>
 <03ac0a67-bd1f-12ca-74f7-8d5b05857ea7@linaro.org>
 <46a55b01-ee9f-604f-72c9-916bc2f02a09@nuvoton.com>
 <0e72e176-d7b0-ed10-08f3-ba7d4729a931@linaro.org>
 <db333ce4-6b21-7807-15fa-384619cde6f8@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <db333ce4-6b21-7807-15fa-384619cde6f8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/05/2022 07:53, Jacky Huang wrote:
> 
> On 2022/5/13 下午 02:57, Krzysztof Kozlowski wrote:
>> On 13/05/2022 08:48, Jacky Huang wrote:
>>>>> +
>>>>> +	hxt_24m: hxt_24mhz {
>>>> No underscores in node name. Generic node names, so "clock-X" or
>>>> "clock-some-suffix"
>>> OK, I will modify it as
>>>    hxt-24m: hxt-24mhz
>> No, it is not a generic node name. Please read my reply again.
> 
> I  would modify it as
> 
>     clock-hxt: clock-hspd-ext-crystal
> 
> 
>>
>>>>> +		compatible = "fixed-clock";
>>>>> +		#clock-cells = <0>;
>>>>> +		clock-frequency = <24000000>;
>>>> This does not look like property of SoC. Where is this clock defined? In
>>>> the SoC or on the board?
>>> It's an external crystal on the board.
>>> I add this node, because it's the clock source of clock controller.
>>> It always present on all ma35d1 boards.
>>>

Then such clock is not a property of a SoC, but a board. Feel free to
simplify DTS by storing most of the clock node in DTSI, but frequency
should be defined by each board.



Best regards,
Krzysztof
