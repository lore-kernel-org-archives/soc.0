Return-Path: <SRS0=20Fe=7T=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F57C76195
	for <soc@archiver.kernel.org>; Mon, 27 Mar 2023 10:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CB21C433D2; Mon, 27 Mar 2023 10:57:41 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13288C4339B;
	Mon, 27 Mar 2023 10:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13288C4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from [192.168.1.141] ([37.4.248.58]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MacjC-1qIqB338lW-00cC1T; Mon, 27 Mar 2023 12:57:11 +0200
Message-ID: <1585c36f-cb8e-55ee-ac30-766feceda09f@i2se.com>
Date: Mon, 27 Mar 2023 12:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2 4/8] dt-bindings: iio: st-sensors: Add IIS328DQ
 accelerometer
To: Jonathan Cameron <jic23@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Stefan Wahren <stefan.wahren@chargebyte.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Evgeniy Polyakov <zbr@ioremap.net>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
 Li Yang <leoyang.li@nxp.com>, Denis Ciocca <denis.ciocca@st.com>,
 soc@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230317103323.7741-1-stefan.wahren@chargebyte.com>
 <20230317103323.7741-5-stefan.wahren@chargebyte.com>
 <20230318155534.16b47583@jic23-huawei>
 <708b63c9-d2b6-c65f-0112-8f50173c0bca@linaro.org>
 <20230319154257.68facd30@jic23-huawei>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230319154257.68facd30@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:8JjwnMM7XnWNBJfVFVFQz/Tiu5rLOiFTcZi7M3YMwIp1TwXnB5l
 jaYyfdUHoiqK3r+fROLSqx1dkmbWgrg395NUkDbXe4OvFpOKwZODgbQNbkuBBsNbfuyRorI
 BbI845rPcLGfsvazLr4MhkeuSbTiLgUiyqo9nTyEiI+3W4Z9pdxJ4mpn6TPukr21v71IIIi
 gZ/uwEX39dqa1Yr1HlFpQ==
UI-OutboundReport: notjunk:1;M01:P0:fbuEvtqtbv8=;P7qznWhu6AaORnGTjW46eOTN7B6
 4ejWaRtPK7L2uBxDHi/sA7a8Peg7WHWAg+MRW+7CNhyKZaw2N7Z3iht4L/W9CrUPRoZ7UsvcZ
 y0SWwgHuqD+darVDWBVkn5dcNgxyUFDJFyiutTAUy74zkRrJg0vYGmJ4jSTCydlFPnR+3rFbF
 cCbgXcfmo0eWmOzEBW6aZh6rmsRg8+83iuwSxsCvOSmmoa9xJpbq7+WPP9+RBg7XGeVEhqC3l
 9P52t9SY25AF7deTIZGYhIHMP8L3Sn0HLe6DcZvnhTRxQhO2GGCp6v95T5qyiOEgMXA3sibuD
 KwAxqfFUaU/IE9RM7eOUB6NlaxE2VrqVe/UQ9Zf0hPJDPzlUxbiVjPzrPd51Mc14W7SNrHJtU
 dRBt60e6C8JrCz0wFY7gwFhp7PX5BC3HsA9sxtDKqB/Iuxph1DXMQ0Prpv9460dFoZ5RVup8q
 YrR8NyvgtXRkUKKP3XjRPpBccofwMoARRmP0FAD4zPhElqwZJM/+GHF3VtTtjcg1dfA1o63+f
 yIO3GQcb3Oi7GWtOhR9KEJBbNqy6hAtuQ03uOhBp2cU7pBYtOUDI6V/lf6dVnceqL9WAg8FJf
 FqIIYDujafOpFwwtnOx3mb/HZYstaG2LjpOe06IM/q2+qMIl+PBj243vjbaxUMYppTqdGgUHQ
 fL+dqUr6KO2vk5i/THf5WezImMK1gIfNnIst7lYiBg==

Hi Jonathan,

Am 19.03.23 um 16:42 schrieb Jonathan Cameron:
> On Sun, 19 Mar 2023 13:40:49 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 18/03/2023 16:55, Jonathan Cameron wrote:
>>> On Fri, 17 Mar 2023 11:33:19 +0100
>>> Stefan Wahren <stefan.wahren@chargebyte.com> wrote:
>>>    
>>>> The ST IIS328DQ is an accelerometer sensor, which is compatible with
>>>> the already supported ST H3LIS331DL. So add the new compatible
>>>> with a fallback to the ST sensor binding.
>>>>
>>>> Link: https://lore.kernel.org/linux-iio/2bac9ecf-9d2e-967e-9020-1c950487d781@i2se.com/
>>>> Suggested-by: Jonathan Cameron <jic23@kernel.org>
>>>> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>	
>>>> ---
>>>>   Documentation/devicetree/bindings/iio/st,st-sensors.yaml | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
>>>> index c6201976378f..5eb71b24a7cb 100644
>>>> --- a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
>>>> +++ b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
>>>> @@ -48,6 +48,9 @@ properties:
>>>>             - st,lsm330d-accel
>>>>             - st,lsm330dl-accel
>>>>             - st,lsm330dlc-accel
>>>> +      - items:
>>>> +          - const: st,iis328dq
>>>> +          - const: st,h3lis331dl-accel
>>>
>>> Hmm. So this separates the particular 'oneOf' group from the description
>>> associated with the ST accelerometers.
>>>
>>> DT experts, is there a better way to do this?  Ideally we'd also associate
>>> other similar groups going forwards so it might become less and less obvious
>>> how the groupings work. (bit late for the many groups that exist
>>> already in that list above this point).
>>
>> If by "grouping" you mean how the oneOf items are organized with
>> descriptions, I wouldn't put too much attention to it. You can add some
>> '#' comments to separate the groups, but for me this is still readable.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Works for me. Thanks for quick response!  Applied this and next patch
> to the togreg branch of iio.git

Shawn had some comments to patch #7. Just to make it clear, there is no 
need to resend patch 4 and 5 in V3?

Best regards

> 
> 
> Thanks,
> 
> Jonathan
> 
>>
>> Best regards,
>> Krzysztof
>>
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
