Return-Path: <SRS0=dQCH=VE=nuvoton.com=YCHuang3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2F6C433F5
	for <soc@archiver.kernel.org>; Tue, 26 Apr 2022 00:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD0DAC385AD; Tue, 26 Apr 2022 00:47:20 +0000 (UTC)
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
	by smtp.kernel.org (Postfix) with ESMTP id E8B9FC385A4;
	Tue, 26 Apr 2022 00:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8B9FC385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
	by maillog.nuvoton.com (Postfix) with ESMTP id B144C1C803AA;
	Tue, 26 Apr 2022 08:47:10 +0800 (CST)
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 26 Apr
 2022 08:47:10 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Tue, 26 Apr
 2022 08:47:10 +0800
Received: from [172.19.1.47] (172.19.1.47) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 26 Apr 2022 08:47:09 +0800
Message-ID: <363b08bd-098d-5c6b-eebd-6740aeb70f29@nuvoton.com>
Date: Tue, 26 Apr 2022 08:47:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 5/5] dt-bindings: arm: Add initial bindings for Nuvoton
 Platform
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ychuang570808@gmail.com>, <sboyd@kernel.org>, <krzk+dt@kernel.org>,
	<arnd@arndb.de>, <olof@lixom.net>, <will@kernel.org>, <soc@kernel.org>,
	<cfli0@nuvoton.com>
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-6-ychuang3@nuvoton.com>
 <fd9316a6-7df6-e1fa-50dc-ff50934afb5c@linaro.org>
 <caf4867f-7f71-9262-f190-463325eb13ab@nuvoton.com>
 <4e9eaede-2208-bd73-35ae-89e128562653@linaro.org>
 <80994f4b-136f-7669-4674-0c9826e88248@nuvoton.com>
 <43cb61ac-461f-e6ff-b495-44f8befde79f@linaro.org>
 <257d878e-8455-2770-7868-c9445b0eabba@nuvoton.com>
 <Ymc6hK0Z/t3IKF3z@robh.at.kernel.org>
From: Jacky Huang <ychuang3@nuvoton.com>
In-Reply-To: <Ymc6hK0Z/t3IKF3z@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2022/4/26 上午 08:19, Rob Herring wrote:
> On Thu, Apr 21, 2022 at 04:13:20PM +0800, Jacky Huang wrote:
>>
>> On 2022/4/21 下午 04:05, Krzysztof Kozlowski wrote:
>>> On 21/04/2022 10:04, Jacky Huang wrote:
>>>> On 2022/4/21 下午 02:56, Krzysztof Kozlowski wrote:
>>>>> On 21/04/2022 08:39, Jacky Huang wrote:
>>>>>> On 2022/4/18 下午 08:11, Krzysztof Kozlowski wrote:
>>>>>>> On 18/04/2022 10:27, Jacky Huang wrote:
>>>>>>>> +properties:
>>>>>>>> +  $nodename:
>>>>>>>> +    const: '/'
>>>>>>>> +  compatible:
>>>>>>>> +    items:
>>>>>>>> +      - enum:
>>>>>>>> +          - nuvoton,ma35d1
>>>>>>>> +          - nuvoton,ma35d1-evb
>>>>>>>> +          - nuvoton,ma35d1-iot
>>>>>>>> +          - nuvoton,ma35d1-som512
>>>>>>>> +          - nuvoton,ma35d1-som1g
>>>>>>> This does not match your DTS and does not look reasonable (SoC
>>>>>>> compatible should not be part of this enum). Check some other board
>>>>>>> bindings for examples.
>>>>>>>
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Krzysztof
>>>>>> I would like to modify it as follows:
>>>>>>
>>>>>> description: |
>>>>>>       Boards with an ARMv8 based Nuvoton SoC shall have the following
>>>>>>       properties.
>>>>>>
>>>>>> properties:
>>>>>>       $nodename:
>>>>>>         const: '/'
>>>>>>       compatible:
>>>>>>         oneOf:
>>>>>>
>>>>>>           - description: MA35D1 evaluation board
>>>>>>             items:
>>>>>>               - const: nuvoton,ma35d1-evb
>>>>>>               - const: nuvoton,ma35d1
>>>>>>
>>>>>>           - description: MA35D1 IoT board
>>>>>>             items:
>>>>>>               - const: nuvoton,ma35d1-iot
>>>>> Instead just enum with all board compatibles.
>>>> How about to modify it as the follows:
>>>>
>>>>      compatible:
>>>>        oneOf:
>>>>
>>>>          - description: MA35D1 evaluation board
>>>>            items:
>>>>              - enum:
>>>>                  - nuvoton,ma35d1-evb
>>>>              - const: nuvoton,ma35d1
>>>>
>>>>          - description: MA35D1 IoT board
>>>>            items:
>>>>              - enum:
>>>>                  - nuvoton,ma35d1-iot
>>>>              - const: nuvoton,ma35d1
>>>>
>>>>          - description: MA35D1 SOM board
>>>>            items:
>>>>              - enum:
>>>>                  - nuvoton,ma35d1-som512
>>>>                  - nuvoton,ma35d1-som1g
>>>>              - const: nuvoton,ma35d1
>>>>
>>> It's still almost the same. All boards together. You can add a comment
>>> next to the compatible if you want some user-friendly name.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>> OK, I got it. Like this,
>>
>>    compatible:
>>      oneOf:
>>
>>        - description: MA35D1 based boards
>>          items:
>>            - enum:
>>                - nuvoton,ma35d1-evb
>>                - nuvoton,ma35d1-iot
>>                - nuvoton,ma35d1-som512
>>                - nuvoton,ma35d1-som1g
> The memory node distinguishes how much memory. Is the board different
> for the SoM? If not, combine these to 1.

Yes, I can make two dts files (som512 and som1g) with binding to the 
same som board.
I will modify it as a single nuvoton,ma35d1-som board.
Thank you.

>>            - const: nuvoton,ma35d1
>>
>> Sincerely,
>> Jacky Huang
>>
>>
>>

Sincerely,
Jacky Huang
