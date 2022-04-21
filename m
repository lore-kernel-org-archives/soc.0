Return-Path: <SRS0=o6Q+=U7=nuvoton.com=YCHuang3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0992CC433EF
	for <soc@archiver.kernel.org>; Thu, 21 Apr 2022 08:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB764C385A9; Thu, 21 Apr 2022 08:13:22 +0000 (UTC)
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
	by smtp.kernel.org (Postfix) with ESMTP id 6BCD8C385A5;
	Thu, 21 Apr 2022 08:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6BCD8C385A5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
	by maillog.nuvoton.com (Postfix) with ESMTP id 4123D1C810EE;
	Thu, 21 Apr 2022 16:13:20 +0800 (CST)
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 21
 Apr 2022 16:13:19 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Thu, 21 Apr
 2022 16:13:19 +0800
Received: from [172.19.1.47] (172.19.1.47) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 21 Apr 2022 16:13:19 +0800
Message-ID: <257d878e-8455-2770-7868-c9445b0eabba@nuvoton.com>
Date: Thu, 21 Apr 2022 16:13:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 5/5] dt-bindings: arm: Add initial bindings for Nuvoton
 Platform
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
CC: <robh+dt@kernel.org>, <sboyd@kernel.org>, <krzk+dt@kernel.org>,
	<arnd@arndb.de>, <olof@lixom.net>, <will@kernel.org>, <soc@kernel.org>,
	<cfli0@nuvoton.com>
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-6-ychuang3@nuvoton.com>
 <fd9316a6-7df6-e1fa-50dc-ff50934afb5c@linaro.org>
 <caf4867f-7f71-9262-f190-463325eb13ab@nuvoton.com>
 <4e9eaede-2208-bd73-35ae-89e128562653@linaro.org>
 <80994f4b-136f-7669-4674-0c9826e88248@nuvoton.com>
 <43cb61ac-461f-e6ff-b495-44f8befde79f@linaro.org>
From: Jacky Huang <ychuang3@nuvoton.com>
In-Reply-To: <43cb61ac-461f-e6ff-b495-44f8befde79f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2022/4/21 下午 04:05, Krzysztof Kozlowski wrote:
> On 21/04/2022 10:04, Jacky Huang wrote:
>>
>> On 2022/4/21 下午 02:56, Krzysztof Kozlowski wrote:
>>> On 21/04/2022 08:39, Jacky Huang wrote:
>>>> On 2022/4/18 下午 08:11, Krzysztof Kozlowski wrote:
>>>>> On 18/04/2022 10:27, Jacky Huang wrote:
>>>>>> +properties:
>>>>>> +  $nodename:
>>>>>> +    const: '/'
>>>>>> +  compatible:
>>>>>> +    items:
>>>>>> +      - enum:
>>>>>> +          - nuvoton,ma35d1
>>>>>> +          - nuvoton,ma35d1-evb
>>>>>> +          - nuvoton,ma35d1-iot
>>>>>> +          - nuvoton,ma35d1-som512
>>>>>> +          - nuvoton,ma35d1-som1g
>>>>> This does not match your DTS and does not look reasonable (SoC
>>>>> compatible should not be part of this enum). Check some other board
>>>>> bindings for examples.
>>>>>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>> I would like to modify it as follows:
>>>>
>>>> description: |
>>>>      Boards with an ARMv8 based Nuvoton SoC shall have the following
>>>>      properties.
>>>>
>>>> properties:
>>>>      $nodename:
>>>>        const: '/'
>>>>      compatible:
>>>>        oneOf:
>>>>
>>>>          - description: MA35D1 evaluation board
>>>>            items:
>>>>              - const: nuvoton,ma35d1-evb
>>>>              - const: nuvoton,ma35d1
>>>>
>>>>          - description: MA35D1 IoT board
>>>>            items:
>>>>              - const: nuvoton,ma35d1-iot
>>> Instead just enum with all board compatibles.
>> How about to modify it as the follows:
>>
>>     compatible:
>>       oneOf:
>>
>>         - description: MA35D1 evaluation board
>>           items:
>>             - enum:
>>                 - nuvoton,ma35d1-evb
>>             - const: nuvoton,ma35d1
>>
>>         - description: MA35D1 IoT board
>>           items:
>>             - enum:
>>                 - nuvoton,ma35d1-iot
>>             - const: nuvoton,ma35d1
>>
>>         - description: MA35D1 SOM board
>>           items:
>>             - enum:
>>                 - nuvoton,ma35d1-som512
>>                 - nuvoton,ma35d1-som1g
>>             - const: nuvoton,ma35d1
>>
> It's still almost the same. All boards together. You can add a comment
> next to the compatible if you want some user-friendly name.
>
>
> Best regards,
> Krzysztof

OK, I got it. Like this,

   compatible:
     oneOf:

       - description: MA35D1 based boards
         items:
           - enum:
               - nuvoton,ma35d1-evb
               - nuvoton,ma35d1-iot
               - nuvoton,ma35d1-som512
               - nuvoton,ma35d1-som1g
           - const: nuvoton,ma35d1

Sincerely,
Jacky Huang


