Return-Path: <SRS0=y8cl=W4=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4904DC433EF
	for <soc@archiver.kernel.org>; Tue, 21 Jun 2022 02:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33D99C341C5; Tue, 21 Jun 2022 02:29:46 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63DFEC3411B;
	Tue, 21 Jun 2022 02:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63DFEC3411B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LRr5M4x1BzhYZH;
	Tue, 21 Jun 2022 10:27:35 +0800 (CST)
Received: from [127.0.0.1] (10.67.102.125) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 21 Jun
 2022 10:29:41 +0800
Message-ID: <62B12D14.1010003@hisilicon.com>
Date: Tue, 21 Jun 2022 10:29:40 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <soc@kernel.org>,
	Olof Johansson <olof@lixom.net>, <arm@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Rob
 Herring <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: hisilicon: adjust whitespace around '='
References: <20220526204453.832681-1-krzysztof.kozlowski@linaro.org> <165541242280.9040.2541894516124804642.b4-ty@linaro.org>
In-Reply-To: <165541242280.9040.2541894516124804642.b4-ty@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi Krzysztof,

On 2022/6/17 4:47, Krzysztof Kozlowski wrote:
> On Thu, 26 May 2022 22:44:53 +0200, Krzysztof Kozlowski wrote:
>> Fix whitespace coding style: use single space instead of tabs or
>> multiple spaces around '=' sign in property assignment.  No functional
>> changes (same DTB).
>>
>>
> 
> Applied, thanks!

Thanks!

Best Regards,
Wei

> 
> [1/1] arm64: dts: hisilicon: adjust whitespace around '='
>       https://git.kernel.org/krzk/linux/c/11357f103f2e641e2744d527886ff248dbef13d8
> 
> Best regards,
> 

