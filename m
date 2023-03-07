Return-Path: <SRS0=G/M+=67=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345DCC678D5
	for <soc@archiver.kernel.org>; Tue,  7 Mar 2023 17:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E417EC433D2; Tue,  7 Mar 2023 17:28:25 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA695C433A1;
	Tue,  7 Mar 2023 17:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA695C433A1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from [192.168.1.141] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Ma1D8-1q3AgD15cq-00VyvW; Tue, 07 Mar 2023 18:27:57 +0100
Message-ID: <9c2d0ca3-660e-72d2-d158-5c921cd9d607@i2se.com>
Date: Tue, 7 Mar 2023 18:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/8] dt-bindings: iio: st-sensors: Add IIS328DQ
 accelerometer
Content-Language: en-US
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
 <20230306172249.74003-5-stefan.wahren@i2se.com>
 <633b1e27-d148-62d2-ef83-2d0da432c0a7@linaro.org>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <633b1e27-d148-62d2-ef83-2d0da432c0a7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:O/1gCxxJ4Mw2c/1cIrf968QzB5NcAlRw7etSNcRG5kKSxI8cG+j
 JmTbjPMIG3c+z2pw6/pb5b9VSARGq5Zt88DTdZtvbYX4jK+4AKsTwsVa3O/PB4ugfPy/EOh
 SAN1xIukGhsOhVgK9AJewTBz0SG+yfF0uCpxLbcwhpJPPIdBFq5tTAYkFyuVtiekrYxCGqh
 rxnkXEU0wokKSLutyBkDA==
UI-OutboundReport: notjunk:1;M01:P0:qIJq0AFaHo4=;vgLd/xuL9mm0K+pmb6vrKBNF7kd
 prKnd7qZcxOwDaKJJ+iC1XQHH7EO59KzsO9akK5h1/uj6Hkt4HrIen7jnS1Yn8IcA3EZJFn54
 FNsoDRyN47wBuK22WCXxlEocqvMWZfr7kbIKUUKK0ZnKN4TbLes9RM10DN3gnk7sTrD7Smpqm
 XgNY1cDB2pkGILR/x28ZuwROiZ8dtyJobq+JtXGojZU71FM39MUYsWdiXCzy7MPBwYHzqSfn9
 3ZqzCxkXc105LyN7WMsnvt7StBDB6KftgCckTOIZLNGxIWjNpHJwCJ5Ynlum6uwkw9L4OtSYf
 woVwkjFHjO0hbrOnczsKkI6eM2hXxn5kt/rGSflFnsQ+dLHuZ+l/R1IRcyM+R02ZU33R6lEzC
 zbmR2D5j65Ik6Gu/NxqCwfBEFnP13O3Id7qWUZMyh92LKZ+DU2QWpgsn0tn4o+y6NuAmQbZTb
 wW4ZY2jRcmSEUM/mnvf9jVR5spY44f/LS+iwplopGHHgocHMuoOpyZZVwt+mseMtUWIfTuy9x
 uCo0euC4GyzZpJCe1Fy3QAwqrn9XMwMWw3Dz+dCuZs0wBS40AKfoqIJ26O8ozbkSPu8ZuIMe0
 inns/O9BhtKuLog30TstP8kORE9rS3j6VtYfci36bx8nCKjf/f2GoAKzXguMgokIpubuKMgl1
 9lQm7dsi6LvfDVOWjdi+jSk+1v3m2zRHTB6SXhzafg==

Hi Krzysztof,

Am 07.03.23 um 09:23 schrieb Krzysztof Kozlowski:
> On 06/03/2023 18:22, Stefan Wahren wrote:
>> From: Stefan Wahren <stefan.wahren@chargebyte.com>
>>
>> The ST IIS328DQ is an accelerometer sensor compatible with
>> the existing ST sensor binding.
> If it is compatible with existing binding, then make it compatible.
> Although your driver change suggests it is not compatible...
since the policy is to make the compatible so specific as possible, i 
will fix the wording here.
>
> Best regards,
> Krzysztof
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
