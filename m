Return-Path: <SRS0=HpX/=3I=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834F5C4332F
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 15:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 689ADC433D6; Tue,  8 Nov 2022 15:12:05 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9839C433B5
	for <soc@kernel.org>; Tue,  8 Nov 2022 15:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A9839C433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id g12so21653506lfh.3
        for <soc@kernel.org>; Tue, 08 Nov 2022 07:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yke8ySwFT8yI9hYAW7UzkJ/JFVT+jZWZcHr39eO1G2w=;
        b=yznuQ4k9GcH2KW7oxpjxJR1K/7uJiGBHPT8KXuTERVcAaUvEdVD8/KnbJvhli6Ohvj
         MCuhUuInk8vWV+vJSKifas1QsDcOeUhbxkuqxFS0pA40drK7D8WcE3LsGRQq7wLnXKc1
         jXLo+y34Gu/k3ZsKcyO5MtBFmtzV+EiWzKD55qeqrwNigXyiVlGLOFXYMj5jUwa6TivU
         03RD4Y+FsglqWVoi/27DS9WxUYWuMxES7tzm50RKYonJ+irbedvPk9hUPhLgn6Y8keES
         6+Ud4rL8mCGk+jwH5PX0BfqPTlLLPgRBm0MFw71uYZXG3KwX4UEZZ+J1exdxczlzs+WG
         upFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yke8ySwFT8yI9hYAW7UzkJ/JFVT+jZWZcHr39eO1G2w=;
        b=KMou1z86ZvnFPr9uVZoWwi9F6h4gQ0g9U7i1oF7XfaWVDAR7G1WAamBMrf9cNcS7T4
         5NdKmPph5gD2A3e+AG2DqHIwGVtw6vQXjEEa+RuiaRAMsoI9uSy6BN/kQqayRVKridLn
         qHfEdvCt0bcbLpNrXhKFJVCH0Z2KNyGmEbnl/jZDgXERMqDaunkyE3pmiQTl7Ye5LYtu
         NGEt2gSF30qHb+S1cFxrmYImL1lXl4Kmo7sLsOkC7mnRWazAqIf4e1tr9HvJCtvZ7WkM
         O1Jp2onslJ5eGBCPs8BFl1mvdm89FhjJP0avsHfV4kaarxHatTd6xkJZ34tnZYtrvFxE
         vA9Q==
X-Gm-Message-State: ACrzQf1lVD7TZ3hR1zIV1y8rAb2TfDYaKFeD1Ao1SUCTTjWlNV6+/ORv
	OsVNyL4t7gG69eZZjdLLPeuSGQ==
X-Google-Smtp-Source: AMsMyM4Fi4XBlVQ4IJL2tNhKzXZ0y7c1f5CuFDM4E4y+/EYUr9aQPreBzZeARcVapFm76Z2e7MXQ5g==
X-Received: by 2002:a19:6712:0:b0:4b1:b061:480e with SMTP id b18-20020a196712000000b004b1b061480emr8408066lfc.624.1667920321609;
        Tue, 08 Nov 2022 07:12:01 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id p22-20020a2eb7d6000000b002774e7267a7sm1761146ljo.25.2022.11.08.07.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 07:12:00 -0800 (PST)
Message-ID: <a1e4a039-3b65-2f2b-2196-340cc754b1c1@linaro.org>
Date: Tue, 8 Nov 2022 16:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/5] arm64: dts: uniphier: Add NX1 SoC and boards
 support
Content-Language: en-US
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221107103410.3443-1-hayashi.kunihiko@socionext.com>
 <20221107103410.3443-6-hayashi.kunihiko@socionext.com>
 <f8f83839-2e76-e500-a16e-5fd2985a278d@linaro.org>
 <df21cfca-67ed-0c78-7f1e-13e321edabe1@socionext.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <df21cfca-67ed-0c78-7f1e-13e321edabe1@socionext.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2022 15:30, Kunihiko Hayashi wrote:
> Hi Krzysztof,
> 
> On 2022/11/08 20:13, Krzysztof Kozlowski wrote:
>> On 07/11/2022 11:34, Kunihiko Hayashi wrote:
>>> Initial version of devicetree sources for NX1 SoC and boards.
>>>
>>> NX1 SoC belongs to the UniPhier armv8 architecture platform, and is
>>> designed for IoT and AI/ML application fields.
>>>
>>
>>> +
>>> +		soc_glue: syscon@1f800000 {
>>> +			compatible = "socionext,uniphier-nx1-soc-glue",
>>> +				     "simple-mfd", "syscon";
>>> +			reg = <0x1f800000 0x2000>;
>>> +
>>> +			pinctrl: pinctrl {
>>> +				compatible = "socionext,uniphier-nx1-pinctrl";
>>
>> So instead of documenting the hardware precisily, you have one big bag
>> for everything under simple-mfd. This is not how the SoC should be
>> described in DTS.
> 
> Sorry I don't understand. This is inherited from the previous descriptions,
> but is there some example to express DTS correctly about that?

I think yes, although it actually depends what is this hardware.
Generally speaking, do not use simple-mfd and syscon when these are not
really simple devices. There are quite many in your DTS, which got my
attention. Instead - have regular device with or without children.

There is no real need to have this a simple-mfd with one children
without any resources (no address space, no clocks, no interrupts, nothing).

Why this syscon/mfd and pinctrl is not a regular, one device?

> 
>>
>>> +			};
>>> +		};
>>> +
>>> +		soc-glue@1f900000 {
>>> +			compatible = "simple-mfd";
>>
>> No, it is not allowed on its own. You need a specific compatible and
>> bindings describing its children.
> 
> I saw the definition of "simple-mfd" itself is only in mfd/mfd.txt.
> 
> Currently there are only efuse devices as children, and this space means
> nothing. I think it had better define the devices directly.

You need to start describe the hardware. efuse is an efuse, not MFD.
pinctrl is pinctrl not MFD + pinctrl.

Best regards,
Krzysztof

