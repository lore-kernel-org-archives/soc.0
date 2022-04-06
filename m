Return-Path: <SRS0=A7AR=UQ=nuvoton.com=YCHuang3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3817EC433F5
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 02:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3CA4C385A0; Wed,  6 Apr 2022 02:12:01 +0000 (UTC)
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
	by smtp.kernel.org (Postfix) with ESMTP id B1F07C385A1;
	Wed,  6 Apr 2022 02:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1F07C385A1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
	by maillog.nuvoton.com (Postfix) with ESMTP id E711D1C80F56;
	Wed,  6 Apr 2022 10:11:51 +0800 (CST)
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 6 Apr 2022
 10:11:51 +0800
Received: from [172.19.1.47] (172.19.1.47) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 6 Apr 2022 10:11:51 +0800
Message-ID: <5249221d-9959-391c-8e16-91470f1a4797@nuvoton.com>
Date: Wed, 6 Apr 2022 10:11:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] arm64: dts: nuvoton: Add initial support for MA35D1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>,
	"soc@kernel.org" <soc@kernel.org>, MS10 CFLi0 <CFLi0@nuvoton.com>
References: <20220331024256.14762-1-ychuang3@nuvoton.com>
 <20220331024256.14762-4-ychuang3@nuvoton.com>
 <0c182962-0da0-c3b3-097a-090bf8d871e7@linaro.org>
From: Jacky Huang <ychuang3@nuvoton.com>
In-Reply-To: <0c182962-0da0-c3b3-097a-090bf8d871e7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2022/3/31 下午 02:32, Krzysztof Kozlowski wrote:
> On 31/03/2022 04:42, Jacky Huang wrote:
>> Add the initial device tree files for Nuvoton MA35D1 Soc.
>>
>> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
>> ---
>>   arch/arm64/boot/dts/Makefile               |   1 +
>>   arch/arm64/boot/dts/nuvoton/Makefile       |   2 +
>>   arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts |  23 +++++
>>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi    | 106 +++++++++++++++++++++
>>   4 files changed, 132 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/nuvoton/Makefile
>>   create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts
>>   create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
>> index 1ba04e31a438..87e9bda91276 100644
>> --- a/arch/arm64/boot/dts/Makefile
>> +++ b/arch/arm64/boot/dts/Makefile
>> @@ -31,3 +31,4 @@ subdir-y += tesla
>>   subdir-y += ti
>>   subdir-y += toshiba
>>   subdir-y += xilinx
>> +subdir-y += nuvoton
>> diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
>> new file mode 100644
>> index 000000000000..e1e0c466bf5e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/nuvoton/Makefile
>> @@ -0,0 +1,2 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +dtb-$(CONFIG_ARCH_NUVOTON) += ma35d1-evb.dtb
> NAK
>
> This is actually some resend, but you did not version it, did not
> provide changelog.
>
> What is more - you ignored previously received comments.
>
> We do not work like this. If you do not agree with a comment, please
> keep discussion, not resend ignoring it.
>
> Best regards,
> Krzysztof
Sorry, I am not familiar with text style e-mail operation.
I only saw the replies at bottom of mail, but not notice the replies in 
middle of mail.
It's my fault.
I will find comments from previous mail and have discussion there to fix 
all issues before sending the next version.

Best Regards,

Jacky


