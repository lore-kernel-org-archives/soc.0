Return-Path: <SRS0=6P7a=VT=nuvoton.com=YCHuang3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0B8C433EF
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 02:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85707C385D4; Wed, 11 May 2022 02:31:45 +0000 (UTC)
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
	by smtp.kernel.org (Postfix) with ESMTP id B1947C385D8;
	Wed, 11 May 2022 02:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1947C385D8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
	by maillog.nuvoton.com (Postfix) with ESMTP id 222F31C80D1F;
	Wed, 11 May 2022 10:31:41 +0800 (CST)
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 11 May
 2022 10:31:40 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Wed, 11 May
 2022 10:31:40 +0800
Received: from [172.19.1.47] (172.19.1.47) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 11 May 2022 10:31:40 +0800
Message-ID: <f4d77335-262e-479f-3fec-b68ec19a51c4@nuvoton.com>
Date: Wed, 11 May 2022 10:31:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH V4 0/5] Add initial support for MA35D1 SoC
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML
	<devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "Linux
 ARM" <linux-arm-kernel@lists.infradead.org>, <ychuang570808@gmail.com>, "Rob
 Herring" <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Olof Johansson <olof@lixom.net>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, SoC Team
	<soc@kernel.org>, <cfli0@nuvoton.com>
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
 <CAK8P3a1k8y8U99bBmqBYE1vYAc0q-UeaM0oLP4tTHZCpyYNOgA@mail.gmail.com>
 <d64f260d-8ee6-808a-5725-e1181f104dfe@nuvoton.com>
 <CAK8P3a3UZ_thp=CVeXYwJ57MXxsurr+Y9Ad0bv0EOi4Jn=S+eg@mail.gmail.com>
From: Jacky Huang <ychuang3@nuvoton.com>
In-Reply-To: <CAK8P3a3UZ_thp=CVeXYwJ57MXxsurr+Y9Ad0bv0EOi4Jn=S+eg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2022/5/10 下午 08:45, Arnd Bergmann wrote:
> On Tue, May 10, 2022 at 10:40 AM Jacky Huang <ychuang3@nuvoton.com> wrote:
>> On 2022/5/10 下午 03:07, Arnd Bergmann wrote:
>>
>> MA35D1 is target at consumer application, while NPCM is for BMC.
>> MA35D1 is equipped with ARM Coretx-A35 dual-core with the M4 co-processor.
>>
>> Our team has developed Linux application on MA35D1 test chip in the last
>> year, and
>> the mass production version is wafer-out in last month. It will be
>> announced soon.
>>
>> We have ported TF-A, U-Boot, OP-TEE, and Linux 5.4.y to MA35D1 platform, and
>> have provided Yocto and Buildroot distribution for beta site evaluation.
>> All the source
>> code can be found at https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FOpenNuvoton%2FMPU-Family&amp;data=05%7C01%7Cychuang3%40nuvoton.com%7Cf65d464391574dcf60af08da3282f453%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637877835284415849%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=b6sopMTwT8XT%2FR76qASvOtqw7zs9Kcp7lIxDw4O9%2FT8%3D&amp;reserved=0, include the
>> Linux 5.4.y porting on MA35D1 platform.
> Ok, thanks for the information, this is exactly what we need in the
> changelog text for the platform, and (if you send a pull request)
> in the tag description.
>
>> Yes, we have console device driver ready. Please refer to
>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FOpenNuvoton%2FMA35D1_linux-5.4.y%2Fblob%2Fmaster%2Fdrivers%2Ftty%2Fserial%2Fma35d1_serial.c&amp;data=05%7C01%7Cychuang3%40nuvoton.com%7Cf65d464391574dcf60af08da3282f453%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637877835284415849%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ULfLkju2X98pXn%2BeCWGrvEgRchIAlv%2FSECx%2BoJzSdWI%3D&amp;reserved=0.
>> But I think we have to fix coding style and have more review on it. Is
>> the console driver must for the initial support submit, or can we submit it later?
> I would prefer to have it included, but it looks like this has never been
> reviewed, and I can immediately see a few things that need changes
> before it can get included, so I suppose we could merge the platform
> without it.
>
> The reason I'd like to have it included is that without any I/O devices
> it is obvious that the code you are sending has never been tested
> on the kernel version you are sending it against, and that makes it
> more likely that there are bugs.
>
> If the platform for some reason does not make it into v5.19, I would
> ask you to include the serial driver in the series so we can merge
> a working initial branch for v5.20.
>
> In the meantime, please post the driver for review to the linux-kernel
> and linux-serial lists by itself, and keep me on Cc.
>
>> And thank you to remind us to create an entry in MAINTAINERS file. I
>> will add the patch in the next version.
> Ok.
>
>         Arnd

Hi Anrd,

Thanks for your kind help.
Sure, we will have review on the serial driver and include the serial 
driver in the next submit.


Best Regards,
Jacky Huang


