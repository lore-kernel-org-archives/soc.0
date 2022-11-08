Return-Path: <SRS0=aeco=3I=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F490C4332F
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 14:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13735C433C1; Tue,  8 Nov 2022 14:30:29 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 4E14AC433D6;
	Tue,  8 Nov 2022 14:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E14AC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 08 Nov 2022 23:30:26 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 2077220584CE;
	Tue,  8 Nov 2022 23:30:26 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 8 Nov 2022 23:30:26 +0900
Received: from [10.212.157.169] (unknown [10.212.157.169])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 45D44B62A4;
	Tue,  8 Nov 2022 23:30:25 +0900 (JST)
Message-ID: <df21cfca-67ed-0c78-7f1e-13e321edabe1@socionext.com>
Date: Tue, 8 Nov 2022 23:30:24 +0900
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
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <f8f83839-2e76-e500-a16e-5fd2985a278d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 2022/11/08 20:13, Krzysztof Kozlowski wrote:
> On 07/11/2022 11:34, Kunihiko Hayashi wrote:
>> Initial version of devicetree sources for NX1 SoC and boards.
>>
>> NX1 SoC belongs to the UniPhier armv8 architecture platform, and is
>> designed for IoT and AI/ML application fields.
>>
> 
>> +
>> +		soc_glue: syscon@1f800000 {
>> +			compatible = "socionext,uniphier-nx1-soc-glue",
>> +				     "simple-mfd", "syscon";
>> +			reg = <0x1f800000 0x2000>;
>> +
>> +			pinctrl: pinctrl {
>> +				compatible = "socionext,uniphier-nx1-pinctrl";
> 
> So instead of documenting the hardware precisily, you have one big bag
> for everything under simple-mfd. This is not how the SoC should be
> described in DTS.

Sorry I don't understand. This is inherited from the previous descriptions,
but is there some example to express DTS correctly about that?

> 
>> +			};
>> +		};
>> +
>> +		soc-glue@1f900000 {
>> +			compatible = "simple-mfd";
> 
> No, it is not allowed on its own. You need a specific compatible and
> bindings describing its children.

I saw the definition of "simple-mfd" itself is only in mfd/mfd.txt.

Currently there are only efuse devices as children, and this space means
nothing. I think it had better define the devices directly.

Thank you,
---
Best Regards
Kunihiko Hayashi
