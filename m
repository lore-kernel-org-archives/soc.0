Return-Path: <SRS0=JkaG=UR=nuvoton.com=YCHuang3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBE8C433FE
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 04:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55062C385A8; Thu,  7 Apr 2022 04:07:39 +0000 (UTC)
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
	by smtp.kernel.org (Postfix) with ESMTP id E3D7FC385A4;
	Thu,  7 Apr 2022 04:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3D7FC385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
	by maillog.nuvoton.com (Postfix) with ESMTP id 640071C810A3;
	Thu,  7 Apr 2022 12:07:29 +0800 (CST)
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 7 Apr 2022
 12:07:29 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 7 Apr 2022
 12:07:28 +0800
Received: from [172.19.1.47] (172.19.1.47) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 7 Apr 2022 12:07:28 +0800
Message-ID: <125f4a13-cd4c-7deb-6ff6-0dc2e5458bf1@nuvoton.com>
Date: Thu, 7 Apr 2022 12:07:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] arm64: dts: nuvoton: Add initial support for MA35D1
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "olof@lixom.net" <olof@lixom.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "soc@kernel.org"
	<soc@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
References: <20220307091923.9909-1-ychuang3@nuvoton.com>
 <20220307091923.9909-4-ychuang3@nuvoton.com>
 <2669852c-5bb6-1edf-bf58-ea815f54d50f@kernel.org>
 <ef8efda1-e985-0684-470f-7acf9b8a5e93@nuvoton.com>
 <CAK8P3a1Gbr4PoJbPy3BEQ=T3iJo9kQdjes7+0UK5vnc4CDckSw@mail.gmail.com>
From: Jacky Huang <ychuang3@nuvoton.com>
In-Reply-To: <CAK8P3a1Gbr4PoJbPy3BEQ=T3iJo9kQdjes7+0UK5vnc4CDckSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2022/4/6 下午 03:43, Arnd Bergmann wrote:
> On Wed, Apr 6, 2022 at 4:58 AM Jacky Huang <ychuang3@nuvoton.com> wrote:
>> On 2022/3/7 下午 06:25, Krzysztof Kozlowski wrote:
>>> On 07/03/2022 10:19, Jacky Huang wrote:
>> I would add the following to end of arch/arm64/Kconfig.platforms, and
>> add the
>> modification to this patch series.
>>
>> config ARCH_MA35D1
>>       bool "Nuvoton MA35D1 SOC Family"
>>       select PINCTRL
>>       select PINCTRL_MA35D1
>>       select PM
>>       select GPIOLIB
>>       select SOC_BUS
>>       select VIDEOMODE_HELPERS
>>       select FB_MODE_HELPERS
>>       help
>>         This enables support for Nuvoton MA35D1 SOC Family.
> Selecting SOC_BUS and the gpio/pinctrl stuff is ok, but please don't
> select the video helpers from the platform config, those should not
> be essential for building a kernel.
>
>         Arnd

Yes, I will remove  VIDEOMODE_HELPERS and FB_MODE_HELPERS.


Best Regards,
Jacky

