Return-Path: <SRS0=4zvY=VX=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ABEC433F5
	for <soc@archiver.kernel.org>; Sun, 15 May 2022 05:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01ED5C34100; Sun, 15 May 2022 05:53:55 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A8B1C385B8;
	Sun, 15 May 2022 05:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A8B1C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id iq10so11589145pjb.0;
        Sat, 14 May 2022 22:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tRV5JE86bFuYcqLGI4iCVDOTEroMDx6x0x4YyJ/8UrM=;
        b=AMYyPpyQElOBpvPjTsf+LxUjX+KWybCUcLjfvb0RMyT7G4ZJy3mwCtkwy9RJ3/pnUi
         JxmLjX56HEkEjG8TrLHqDfGITX0RfJVNc+V4t0kcO+EPkqrL7kjHJC6Q9VLx3Y6PkwX5
         YeGIaxkLIv+kUbye8SWGw/vV1r5Vy49SBz4eIBTHPpkTU2YEHqc6wWVYmvT0deFIVTF3
         u7TzCtj1aBrK+sPzh4hzeaSDDnJDJ0n5V6rj3v7ehIVcEHR8KfQkXAJzSphYun8UdMZK
         JHBcuiTlWOrDC3Wczvjy4bQxLeerSeqnN9JOP20IOkypAw8LSWsjmAh7RXxwtt0b5A/D
         l6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tRV5JE86bFuYcqLGI4iCVDOTEroMDx6x0x4YyJ/8UrM=;
        b=aAFoWRTa7lHBzvNqbjwnDLjKBAE3kor46vWNX/rviPJufDimo1480sKlQqrRJpB+Mc
         8W6dlYrBn/n2TUPZZUjbdMAHMLh/cE35G2drBKTgyj/jCuGBSnIhmy0ak6TyH/o6W0Bz
         WzHE+b5GB4R8NL43HCs3hpIcSU/pX9FrNyyrRO97p/wB/XLOsOkua4kaC3dCacq7Gur2
         iD6TPv5vN+agbggaF/oW/sLNoVdAqnzdT/gZLmVmamPN8DEo4n+on9sOaselaXxhFL1m
         C1qW0G9ogjrE+MJw8tTC5ulR8QBHq4s/i9m4e/TfHda2M3g4vKEl9dyOMooYwjcviAfO
         VsAQ==
X-Gm-Message-State: AOAM533XwsipCHPGDY8QLc4Er0O4g/TTxHN/ADIqPKo6uauQ55/dtGsn
	QOc5Nm0yMsNmg3EdH31dU48=
X-Google-Smtp-Source: ABdhPJyTHx/aiZ+vGttnAFdGdFUHaktYoQ+Hbfk5mBlRo0sy3cyY4VbnfYfJ12sdic1i9+Xa3Orcyw==
X-Received: by 2002:a17:90b:30c3:b0:1dc:b6d7:58d3 with SMTP id hi3-20020a17090b30c300b001dcb6d758d3mr12944916pjb.172.1652594033516;
        Sat, 14 May 2022 22:53:53 -0700 (PDT)
Received: from [192.168.1.101] (1-171-27-237.dynamic-ip.hinet.net. [1.171.27.237])
        by smtp.gmail.com with ESMTPSA id g12-20020aa79dcc000000b0050dc76281fesm4399596pfq.216.2022.05.14.22.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 May 2022 22:53:53 -0700 (PDT)
Message-ID: <db333ce4-6b21-7807-15fa-384619cde6f8@gmail.com>
Date: Sun, 15 May 2022 13:53:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH V4 3/5] arm64: dts: nuvoton: Add initial support for
 MA35D1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
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
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <0e72e176-d7b0-ed10-08f3-ba7d4729a931@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/5/13 下午 02:57, Krzysztof Kozlowski wrote:
> On 13/05/2022 08:48, Jacky Huang wrote:
>>>> +
>>>> +	hxt_24m: hxt_24mhz {
>>> No underscores in node name. Generic node names, so "clock-X" or
>>> "clock-some-suffix"
>> OK, I will modify it as
>>    hxt-24m: hxt-24mhz
> No, it is not a generic node name. Please read my reply again.

I  would modify it as

    clock-hxt: clock-hspd-ext-crystal


>
>>>> +		compatible = "fixed-clock";
>>>> +		#clock-cells = <0>;
>>>> +		clock-frequency = <24000000>;
>>> This does not look like property of SoC. Where is this clock defined? In
>>> the SoC or on the board?
>> It's an external crystal on the board.
>> I add this node, because it's the clock source of clock controller.
>> It always present on all ma35d1 boards.
>>
>>       clk: clock-controller@40460200 {
>>           compatible = "nuvoton,ma35d1-clk";
>>           reg = <0x0 0x40460200 0x0 0x100>;
>>           #clock-cells = <1>;
>>           clocks = <&hxt_24m>;
>>           clock-names = "HXT_24MHz";
>> ...
>>
>>>> +		clock-output-names = "HXT_24MHz";
>>>> +	};
>>>> +
>>>> +	timer {
>>>> +		compatible = "arm,armv8-timer";
>>>> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
>>>> +					  IRQ_TYPE_LEVEL_LOW)>,
>>>> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
>>>> +					  IRQ_TYPE_LEVEL_LOW)>,
>>>> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
>>>> +					  IRQ_TYPE_LEVEL_LOW)>,
>>>> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
>>>> +					  IRQ_TYPE_LEVEL_LOW)>;
>>>> +		clock-frequency = <12000000>;
>>>> +	};
>>>> +
>>>> +	sys: system-controller@40460000 {
>>>> +		compatible = "nuvoton,ma35d1-sys", "syscon", "simple-mfd";
>>> Why is this a simple-mfd if there are no children here? What do you want
>>> to instantiate here?
>> It's not a device, but a set of registers for system level control.
>> I want to provide a register base mapping for other devices to access
>> system control registers.
> This does not explain why you need simple-mfd. simple-mfd is not for
> providing a register base mapping for other devices.


OK, I will remove the "simple-mfd" from sys node.


>>> Where is the nuvoton,ma35d1-sys compatible documented?
>> OK, I will add the compatible document in next version.
>>
>>
>>>> +		reg = <0x0 0x40460000 0x0 0x400>;
>>>> +	};
>>>> +
>>>> +	reset: reset-controller {
>>>> +		compatible = "nuvoton,ma35d1-reset";
>>> Also not documented.
>> I will also add the document for it.
> All of these should fail on checkpatch which points that you either did
> not run it or ignored the result.
>
> Please run checkpatch on all your submissions to Linux kernel and be
> sure that there is no warning or error.
>
>
>
> Best regards,
> Krzysztof


Sure, thank you for reminding.


Sincerely,.

Jacky Huang

