Return-Path: <SRS0=QEF6=24=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9251FFA3740
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 21:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 554CFC433B5; Thu, 27 Oct 2022 21:15:26 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4B3EC433D7
	for <soc@kernel.org>; Thu, 27 Oct 2022 21:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4B3EC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f182.google.com with SMTP id b25so2121859qkk.7
        for <soc@kernel.org>; Thu, 27 Oct 2022 14:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xea8RVcPNPBnXgY0x+RiV5o0A4N7mtMx4Y8u2uRfkrQ=;
        b=nQUQjvLYMTD84uU2F9PgRldjfqQTPUTHH+mf6gbHAUmVg7DAOVggRVtbNvj+NWLvAW
         eaVtkptOwlJ03XRpulAJM0eZT/0XTZNR/fNOpLv+DnaOuW4yr2F7h7b5t94tNDC9g888
         /ieel8CqluCus7O4rbZ0E7pUJd7A7wLYgPovTO4yg2obI0VX4v4YknLuKAv3Eu5AbD3q
         raNo2hy1xysut0vgPV0US8bcmujP8s8wJMOBpUIgdK5b8zbqgFCYBFXzPChh1sbxeMQz
         GV3aFCoRRy+bk0n7L+JhM6yD6iKz11vcpCz0RvGmIzKdJ0cUlVLToofDTNhyYU2OqQog
         3HQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xea8RVcPNPBnXgY0x+RiV5o0A4N7mtMx4Y8u2uRfkrQ=;
        b=sw2l0k1bj9FXjcvn9tAOTgO5VErSyCzSlUDp76KOsTXAnKEo2ahTh7MVfEXd0COT8B
         zbJUoKfAJ8kfO3CD3rOXZoe7NUojDu+lNIR/jAaoxQZxWUEGPIszIsUCgkoV0QtTO1Rh
         fgOBEi/3y2IaqEZeynXxbUVZWhUfw+EPxnzp3aklHWQmgtHUng7l2ivHJTDHUPVP2IB7
         /fEveds6SvVDD9CM4XTrWBgYuoKA27hpfdiMs7lXCholo2cu0UqrAmGTYx3TqS8NmMOw
         vHdSkmOj3F8PtkouwjYCA3uk8O34jTNWweUu2fCf9Ozf/vS8B/kYNc5xkLVbOlBrbvzk
         qzmQ==
X-Gm-Message-State: ACrzQf3cwgVMf+jlmfO3wIyTckUOMx6gDpb8LBzU+Tg4PjkjviKxODhc
	dCwndoZIe534SzczEqWh6IbWeg==
X-Google-Smtp-Source: AMsMyM5FHX0KhpeDbrDgVx5q3452D3FZJ/XneKMCHOcQWbPfSVBcy5pVtUirbzpZWerqiedxbojksg==
X-Received: by 2002:a05:620a:2591:b0:6c9:cc85:87e3 with SMTP id x17-20020a05620a259100b006c9cc8587e3mr35994050qko.577.1666905323709;
        Thu, 27 Oct 2022 14:15:23 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id q21-20020a05620a0d9500b006eec09eed39sm1683134qkl.40.2022.10.27.14.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 14:15:23 -0700 (PDT)
Message-ID: <f2652e0e-fb08-efb4-e25a-36a335f0c457@linaro.org>
Date: Thu, 27 Oct 2022 17:15:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 3/4] ARM: dts: rockchip: add rk3128.dtsi
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com
List-Id: <soc.lore.kernel.org>
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, zhangqing@rock-chips.com,
 hjc@rock-chips.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <da1252eb-85e9-bdb8-0542-207173523523@gmail.com>
 <2dc46681-894d-4521-bfa7-3e9209691e0a@gmail.com>
 <6fbb01f0-d0d2-bb06-a160-2f8f91ac68ca@linaro.org> <22076018.EfDdHjke4D@diego>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <22076018.EfDdHjke4D@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/10/2022 16:02, Heiko Stübner wrote:
> Am Donnerstag, 27. Oktober 2022, 21:43:43 CEST schrieb Krzysztof Kozlowski:
>> On 27/10/2022 13:53, Johan Jonker wrote:
>>> Hi Krzysztof, Kever, Heiko and others,
>>>
>>> On 10/27/22 16:58, Krzysztof Kozlowski wrote:
>>>> On 26/10/2022 20:53, Johan Jonker wrote:
>>>>> Add basic rk3128 support.
>>>>>
>>>>
>>>> Thank you for your patch. There is something to discuss/improve.
>>>
>>> Thank you for your review.
>>>
>>> Some more questions/comments below.
>>>
>>>>
>>>>> +#include <dt-bindings/clock/rk3128-cru.h>
>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>>>> +#include <dt-bindings/pinctrl/rockchip.h>
>>>>> +
>>>>> +/ {
>>>>> +	compatible = "rockchip,rk3128";
>>>>> +	interrupt-parent = <&gic>;
>>>>> +	#address-cells = <1>;
>>>>> +	#size-cells = <1>;
>>>>> +
>>>>> +	aliases {
>>>>> +		gpio0 = &gpio0;
>>>>> +		gpio1 = &gpio1;
>>>>> +		gpio2 = &gpio2;
>>>>> +		gpio3 = &gpio3;
>>>
>>> Is gpio OK here?
>>
>> Could be, but let me rephrase it - why do you need aliases in DTSI? What
>> do these aliases represent?
>>
>> The SoC pieces (nodes in DTSI) do not rely on aliases.
> 
> Subsystems use the aliases for numbering their instances.
> So the i2c0 alias causes the i2c bus getting the number 0 in the operating
> system as well - making it i2c0 there too.

No one argues with these...

> 
> 
>>>>> +		i2c0 = &i2c0;
>>>>> +		i2c1 = &i2c1;
>>>>> +		i2c2 = &i2c2;
>>>>> +		i2c3 = &i2c3;
>>>>> +		spi0 = &spi0;
>>>>> +		serial0 = &uart0;
>>>>> +		serial1 = &uart1;
>>>>> +		serial2 = &uart2;
>>>>
>>>> Bus aliases are board specific and represent what is actually available
>>>> on headers/pins etc. These do not belong to SoC DTSI.
>>>
>>> I just follow current Rockchip DT common practice.
>>>
>>> Do we need to change all Rockchip boards?
>>> Would like to hear from Heiko what's the plan here?
>>> Syncing to U-boot is already a mess...
>>
>> Heiko might have his own preference which then over-rules my
>> recommendation here. But in general this applies to all boards, so other
>> boards could be fixed as well. Different point is whether it is actually
>> worth fixing them...
> 
> I remember only parts of the discussion for the previous socs. Back then
> Arnd was advocating mainly for moving the mmc aliases to boards.
> 
> As the aliases in general also determine the naming of the bus instance,
> I'm very much in favor of having the hardware-i2c5 being named i2c5
> in all cases ;-) . Having these hardware busses getting random numbers
> really calls for chaos.
> 
> So I'd really like us to continue the way we arrived at with the previous
> socs now :-)

No, not only mmc. UART, I2C, SPI - all of these should go to the board.

https://lore.kernel.org/linux-rockchip/CAK8P3a25iYksubCnQb1-e5yj=crEsK37RB9Hn4ZGZMwcVVrG7g@mail.gmail.com/

No one here discusses whether ordering should be random or not.

We discuss that this is a property of the board, not of a SoC.

> 

Best regards,
Krzysztof

