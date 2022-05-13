Return-Path: <SRS0=xiFP=VV=nuvoton.com=YCHuang3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBA8C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 06:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6185C34118; Fri, 13 May 2022 06:53:51 +0000 (UTC)
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
	by smtp.kernel.org (Postfix) with ESMTP id 79B72C34100;
	Fri, 13 May 2022 06:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79B72C34100
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
	by maillog.nuvoton.com (Postfix) with ESMTP id 7D6781C80DC4;
	Fri, 13 May 2022 14:53:49 +0800 (CST)
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Fri, 13 May
 2022 14:53:49 +0800
Received: from [172.19.1.47] (172.19.1.47) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 13 May 2022 14:53:48 +0800
Message-ID: <51ce4fca-f7b8-92ab-c9c6-1e57a2a5b5f3@nuvoton.com>
Date: Fri, 13 May 2022 14:53:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH V4 0/5] Add initial support for MA35D1 SoC
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
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
 <8be62b40-077a-7634-7d34-7776909a2abe@linaro.org>
 <CAK8P3a3=YD7WV+Www8pf+JTv14DwcnSjD+f=YFCNMxXYT9FAZA@mail.gmail.com>
From: Jacky Huang <ychuang3@nuvoton.com>
In-Reply-To: <CAK8P3a3=YD7WV+Www8pf+JTv14DwcnSjD+f=YFCNMxXYT9FAZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2022/5/12 下午 10:35, Arnd Bergmann wrote:
> On Thu, May 12, 2022 at 4:11 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 10/05/2022 09:07, Arnd Bergmann wrote:
>>> On Tue, May 10, 2022 at 5:25 AM Jacky Huang <ychuang3@nuvoton.com> wrote:
>>>> This patch series adds initial support for Nuvoton MA35D1 SoC,
>>>> include initial dts and clock controller binding.
>>>>
>>> This looks fine in principle, but we are getting close to the merge window and
>>> should finalize this quickly to make it into v5.19. I see that you don't have a
>>> console device, as commented in the .dts patch. Normally I prefer merging
>>> platforms only when there is at least rudimentary support for booting into
>>> an initramfs with a serial console, but this is a flexible rule.
>> I disagree. It does not look fine - does not pass `make dtbs_check` even
>> with Nuvoton bindings...
> Ok, thanks for taking a look. It was already late for 5.19 and missing the uart
> driver, so it was clear it had not seen actual runtime testing. Let's try
> aiming for 5.20 then.
>
>          Arnd

Thanks for your review and help.
I will run the dtbs_check, add binding document, and include serial 
driver in the next version.


sincerely,
Jacky Huang



