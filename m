Return-Path: <SRS0=Yznt=3L=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E8CC43217
	for <soc@archiver.kernel.org>; Fri, 11 Nov 2022 14:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8038EC433D6; Fri, 11 Nov 2022 14:40:08 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D18EC43144
	for <soc@kernel.org>; Fri, 11 Nov 2022 14:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D18EC43144
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id be13so8625854lfb.4
        for <soc@kernel.org>; Fri, 11 Nov 2022 06:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ps6+CrFrf1G8yxoOGed9ZXoVR3hjv0NG/3mQJo+Ut9Q=;
        b=oGx3VkoPSO2ZKYabYiWWOTYN53Hpr4zaQMnkzolc249rz0cPeC88yNt1bYNVrAPS8r
         AIYiVqED1zrsePxKZtPycqKpNFePYaKpXnSxy7apkC0UMcNcV9kEAmATmWglnJ9JEOtJ
         3AXJYOGv9d3kY1Nl65rE1djkxjc6pv3eWx3WdwMXLOBXxLfcJrtr4cGmIvi10Xehpk5K
         VLSvq/8EIoiY85GIPy77R273rffBqeBLLvAcayCqMI3BB7LMofgPHCOV0JfV6I8Stkuj
         fvyf8gQvjW1oPqSZigjRZ4+bezCnTO/Yw9d+ZehIDA/GLuF33PzcLyyOorc3e3VKo8uu
         vZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ps6+CrFrf1G8yxoOGed9ZXoVR3hjv0NG/3mQJo+Ut9Q=;
        b=aT36ljk26N0qKeWh+/0DDgO+vkwqQkEJyJTWyRpnpMMXMx5uQ+QDNRJpWpr97FRrSh
         hB73sHymcOIWGz6Oi7GS3cXqfY7A557lMBOgYkUWQRSzgfcQJkGnqT0Ub/yOTFyM5m29
         K5ppS11K7KWukyCh6dZBpn93icg27O684jHzN019HSnW9EkoKANK4X5NQMHeu/kczNh6
         yIV+Kileuvm7f7GlCTAT/Ro/Pw0gPN6YYuCNnmcwREqN2HvodolsVDn4E8P+uaYUz4Ec
         xYKSJGb7ETG7zp9DT4jfeSl9ErGQKSX5N8Z2IH9YMMWipD1ovCYiFQiJqux/I6a5AcIl
         D0Ag==
X-Gm-Message-State: ANoB5plHV9VkJUEgQJmKlFVyk+SS/V+Xu0+HXHAuxaVpbc0ME/0Q74dR
	oqS2kby+wdQin3peR6H34r4o4w==
X-Google-Smtp-Source: AA0mqf70IVc17pOFBXcRbcVopq4rQFE6Z5pSqKrcFJi6790TOHWOmuJf3IppF3ixjppkrhD1p+EB9Q==
X-Received: by 2002:a05:6512:3581:b0:4a8:41b8:5cb7 with SMTP id m1-20020a056512358100b004a841b85cb7mr777625lfr.61.1668177604331;
        Fri, 11 Nov 2022 06:40:04 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id q28-20020ac2515c000000b004a8f824466bsm358339lfd.188.2022.11.11.06.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 06:40:03 -0800 (PST)
Message-ID: <36680a5e-7b0c-4d7e-f039-734e9304dc18@linaro.org>
Date: Fri, 11 Nov 2022 15:40:02 +0100
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
 <a1e4a039-3b65-2f2b-2196-340cc754b1c1@linaro.org>
 <afdb63d2-217b-1ed5-3398-3e610bce8ecb@socionext.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <afdb63d2-217b-1ed5-3398-3e610bce8ecb@socionext.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2022 09:48, Kunihiko Hayashi wrote:
> Hi Krzysztof,
> 
> On 2022/11/09 0:11, Krzysztof Kozlowski wrote:
>> On 08/11/2022 15:30, Kunihiko Hayashi wrote:
>>> Hi Krzysztof,
>>>
>>> On 2022/11/08 20:13, Krzysztof Kozlowski wrote:
>>>> On 07/11/2022 11:34, Kunihiko Hayashi wrote:
>>>>> Initial version of devicetree sources for NX1 SoC and boards.
>>>>>
>>>>> NX1 SoC belongs to the UniPhier armv8 architecture platform, and is
>>>>> designed for IoT and AI/ML application fields.
>>>>>
>>>>
>>>>> +
>>>>> +		soc_glue: syscon@1f800000 {
>>>>> +			compatible = "socionext,uniphier-nx1-soc-glue",
>>>>> +				     "simple-mfd", "syscon";
>>>>> +			reg = <0x1f800000 0x2000>;
>>>>> +
>>>>> +			pinctrl: pinctrl {
>>>>> +				compatible = "socionext,uniphier-nx1-pinctrl";
>>>>
>>>> So instead of documenting the hardware precisily, you have one big bag
>>>> for everything under simple-mfd. This is not how the SoC should be
>>>> described in DTS.
>>>
>>> Sorry I don't understand. This is inherited from the previous
>>> descriptions,
>>> but is there some example to express DTS correctly about that?
>>
>> I think yes, although it actually depends what is this hardware.
>> Generally speaking, do not use simple-mfd and syscon when these are not
>> really simple devices. There are quite many in your DTS, which got my
>> attention. Instead - have regular device with or without children.
>>
>> There is no real need to have this a simple-mfd with one children
>> without any resources (no address space, no clocks, no interrupts, nothing).
>>
>> Why this syscon/mfd and pinctrl is not a regular, one device?
> 
> The mfd/syscon.yaml says:
>    System controller node represents a register region containing a set
>    of miscellaneous registers.
> 
> The "soc-glue" is exactly this, it contains various register functions
> and might be referred to the drivers.
> 
> For example in this NX1 dts, ethernet node points to "soc-glue" node.
> 
>      eth: ethernet@15000000 {
>          compatible = "socionext,uniphier-nx1-ave4";
>          ...
>          socionext,syscon-phy-mode = <&soc_glue 0>;
>      };
> 
> Since such register region is not often systematically designed,
> it is tough to cut out as specific memory region for "pinctrl".

So your choice is instead use entire address space as pinctrl - as a
child device without IO address space. That's also not a good solution.

> 
> And more, the existing pinctrl driver uses of_get_parent() and
> syscon_node_to_regmap(), so this change breaks compatibility.

This is a new DTS, so what compatibility is broken? With old kernel?
There was no compatibility with this Devicetree. Anyway using driver
implementation as reason for specific hardware description (DTS) is also
not correct.

> 
>>>>> +			};
>>>>> +		};
>>>>> +
>>>>> +		soc-glue@1f900000 {
>>>>> +			compatible = "simple-mfd";
>>>>
>>>> No, it is not allowed on its own. You need a specific compatible and
>>>> bindings describing its children.
>>>
>>> I saw the definition of "simple-mfd" itself is only in mfd/mfd.txt.
>>>
>>> Currently there are only efuse devices as children, and this space means
>>> nothing. I think it had better define the devices directly.
>>
>> You need to start describe the hardware. efuse is an efuse, not MFD.
>> pinctrl is pinctrl not MFD + pinctrl.
> 
> This region also has multiple functions, though, the efuse might be
> cut out as specific region without "simple-mfd", unlike pinctrl.

simple-mfd itself does not mean region has multiple functions, but that
children do not depend on anything from the parent device.

You over-use syscon and simple-mfd in multiple places. of course some of
them will be reasonable, but now it does not.


Best regards,
Krzysztof

