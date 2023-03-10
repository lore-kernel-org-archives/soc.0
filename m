Return-Path: <SRS0=irnz=7C=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE9DC64EC4
	for <soc@archiver.kernel.org>; Fri, 10 Mar 2023 10:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BD09C433EF; Fri, 10 Mar 2023 10:09:23 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F63AC433D2;
	Fri, 10 Mar 2023 10:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0F63AC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from [192.168.1.141] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M3UEW-1pa1iL1EO2-000brJ; Fri, 10 Mar 2023 11:08:51 +0100
Message-ID: <3c5992f3-269f-8af5-0062-7653c53feffb@i2se.com>
Date: Fri, 10 Mar 2023 11:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/8] dt-bindings: ARM: fsl: Add chargebyte Tarragon
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, Li Yang <leoyang.li@nxp.com>,
 Denis Ciocca <denis.ciocca@st.com>, soc@kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <stefan.wahren@chargebyte.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
 <20230306172249.74003-7-stefan.wahren@i2se.com>
 <a38cb5d4-91d3-0d9a-41d3-44fed9d39512@linaro.org>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <a38cb5d4-91d3-0d9a-41d3-44fed9d39512@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Yab78HLcW38z97dZXDiHJYvgDjmQKxZOV7txq5k0FzHEPtlAm2X
 94lggD0+R3CkrZRs4t5PeeIgmB1+1zKAccV732G8LShJ0PvgxU37GFJeD3PMxWSKLMZybzh
 B2XpKMGuxqWfcjKRYao5A6rLQbNgC/EgraYZg6xBZX6OqYjzCYEA+eH9CtZKOU+V0gWoCRu
 wSB40w2QBfE4MeRYSjRAw==
UI-OutboundReport: notjunk:1;M01:P0:s0ssaSTMLFY=;GrlyPSiqEh7VC9OtMKWngRed66k
 biuAJeQu5z5MRCKr2rSsNyhICprWu6j9FJ/t++o5vE03sxB46f0yF/22WA7Z6hvmOaTOvn8TV
 8kq6BIT2kJawQwqN6VnuG3xjubNb37Fdy5YbzZUO/kCerr6juaaE1wJvGVs9WuKONjAPYanVP
 9D+HfV3+N6o1PYkooGcEJrpzftK+zZ9roOfj30DA59aqUozAxN/ROh7p9K70LwwuQ+viVKU06
 znPjJRtPXz8cdO5/3Loc2FDSWmFPNRER3FHmWpSofmKamYIQtA84DfJZtlUWC/OeDYaMdHrun
 w5hkr+3HfisTGCaOmFvaIPywww5QQoci5BNWSTj9/kMZfyInqCqoPiYzNQ7vEWHvI5/zMrFo0
 SEx1q/iIIkpIKOzNsAU+IGP1ZZMIJRt14uKhcI6z5L2dC/HoDpgFDGeTJQjw9N0KpoMRbBV5N
 kCwIDPpeAti3b+13UBAIPiZPbO1tlvGfx7PUU63E3Xv6rvV89zs/8GIBKZze32Ug5lFkHUFr8
 4c7tbuLGvkJ+yrq8vsCICX+QZSaUFYICu9/HE5O9eagwXRyp/BoTGFWUS7Dt3YlMOXRGogndZ
 Ehwwe7w8vUDSANeyRlhCccDuUjvndVGqDjtzb9s/Wrr0/n4dwWKnYqXa2p1/HLrlbXtPD3UDj
 eR93AAjGNBPHf+jGLrE0IWbftF/ZcVx3X+EvV6KqLw==

Hi Krzysztof,

Am 07.03.23 um 09:24 schrieb Krzysztof Kozlowski:
> On 06/03/2023 18:22, Stefan Wahren wrote:
>> From: Stefan Wahren <stefan.wahren@chargebyte.com>
>>
>> This adds the compatibles for the chargebyte Tarragon boards.
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>> ---
>>   Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>> index dece3e9ba7fd..2b430e20a7a6 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>> @@ -781,6 +781,15 @@ properties:
>>             - const: tq,imx6ull-tqma6ull2l      # MCIMX6Y2, LGA SoM variant
>>             - const: fsl,imx6ull
>>   
>> +      - description: chargebyte Tarragon Boards
>> +        items:
>> +          - enum:
>> +              - chargebyte,imx6ull-tarragon-master
>> +              - chargebyte,imx6ull-tarragon-micro
>> +              - chargebyte,imx6ull-tarragon-slave
>> +              - chargebyte,imx6ull-tarragon-slavext
>> +          - const: fsl,imx6ull
> I don't think you put it in correct place. Didn't you just stuff it at
> the end?

Yes, i just put it at the end. But to be honest, i'm not sure about the 
order:

armadeus,imx6ull-opos6uldev
..
dh,imx6ull-dhcom-drc02
..
phytec,imx6ull-pbacd10-emmc
..
toradex,colibri-imx6ull-aster
..
kontron,bl-imx6ull
..
tq,imx6ull-tqma6ull2-mba6ulx

Does the order depend on the compatibles and vendor is relevant?

So your expectation was between armadeus and dh?

>
> Best regards,
> Krzysztof
>
