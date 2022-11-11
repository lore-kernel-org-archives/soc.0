Return-Path: <SRS0=egZ4=3L=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEB1C433FE
	for <soc@archiver.kernel.org>; Fri, 11 Nov 2022 08:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6DD1C433C1; Fri, 11 Nov 2022 08:48:57 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id B6B5CC433D6;
	Fri, 11 Nov 2022 08:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6B5CC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 11 Nov 2022 17:48:54 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 4ECE42059027;
	Fri, 11 Nov 2022 17:48:54 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 11 Nov 2022 17:48:54 +0900
Received: from [10.212.156.100] (unknown [10.212.156.100])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 63B18B62AE;
	Fri, 11 Nov 2022 17:48:53 +0900 (JST)
Message-ID: <afdb63d2-217b-1ed5-3398-3e610bce8ecb@socionext.com>
Date: Fri, 11 Nov 2022 17:48:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/5] arm64: dts: uniphier: Add NX1 SoC and boards
 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <a1e4a039-3b65-2f2b-2196-340cc754b1c1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 2022/11/09 0:11, Krzysztof Kozlowski wrote:
> On 08/11/2022 15:30, Kunihiko Hayashi wrote:
>> Hi Krzysztof,
>>
>> On 2022/11/08 20:13, Krzysztof Kozlowski wrote:
>>> On 07/11/2022 11:34, Kunihiko Hayashi wrote:
>>>> Initial version of devicetree sources for NX1 SoC and boards.
>>>>
>>>> NX1 SoC belongs to the UniPhier armv8 architecture platform, and is
>>>> designed for IoT and AI/ML application fields.
>>>>
>>>
>>>> +
>>>> +		soc_glue: syscon@1f800000 {
>>>> +			compatible = "socionext,uniphier-nx1-soc-glue",
>>>> +				     "simple-mfd", "syscon";
>>>> +			reg = <0x1f800000 0x2000>;
>>>> +
>>>> +			pinctrl: pinctrl {
>>>> +				compatible = "socionext,uniphier-nx1-pinctrl";
>>>
>>> So instead of documenting the hardware precisily, you have one big bag
>>> for everything under simple-mfd. This is not how the SoC should be
>>> described in DTS.
>>
>> Sorry I don't understand. This is inherited from the previous
>> descriptions,
>> but is there some example to express DTS correctly about that?
> 
> I think yes, although it actually depends what is this hardware.
> Generally speaking, do not use simple-mfd and syscon when these are not
> really simple devices. There are quite many in your DTS, which got my
> attention. Instead - have regular device with or without children.
> 
> There is no real need to have this a simple-mfd with one children
> without any resources (no address space, no clocks, no interrupts, nothing).
> 
> Why this syscon/mfd and pinctrl is not a regular, one device?

The mfd/syscon.yaml says:
   System controller node represents a register region containing a set
   of miscellaneous registers.

The "soc-glue" is exactly this, it contains various register functions
and might be referred to the drivers.

For example in this NX1 dts, ethernet node points to "soc-glue" node.

     eth: ethernet@15000000 {
         compatible = "socionext,uniphier-nx1-ave4";
         ...
         socionext,syscon-phy-mode = <&soc_glue 0>;
     };

Since such register region is not often systematically designed,
it is tough to cut out as specific memory region for "pinctrl".

And more, the existing pinctrl driver uses of_get_parent() and
syscon_node_to_regmap(), so this change breaks compatibility.

>>>> +			};
>>>> +		};
>>>> +
>>>> +		soc-glue@1f900000 {
>>>> +			compatible = "simple-mfd";
>>>
>>> No, it is not allowed on its own. You need a specific compatible and
>>> bindings describing its children.
>>
>> I saw the definition of "simple-mfd" itself is only in mfd/mfd.txt.
>>
>> Currently there are only efuse devices as children, and this space means
>> nothing. I think it had better define the devices directly.
> 
> You need to start describe the hardware. efuse is an efuse, not MFD.
> pinctrl is pinctrl not MFD + pinctrl.

This region also has multiple functions, though, the efuse might be
cut out as specific region without "simple-mfd", unlike pinctrl.

Thank you,

---
Best Regards
Kunihiko Hayashi
