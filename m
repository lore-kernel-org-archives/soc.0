Return-Path: <SRS0=y8cl=W4=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86E4C433EF
	for <soc@archiver.kernel.org>; Tue, 21 Jun 2022 02:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC814C341C5; Tue, 21 Jun 2022 02:29:16 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1F02C3411B;
	Tue, 21 Jun 2022 02:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1F02C3411B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LRr6Z5t6kzDsC8;
	Tue, 21 Jun 2022 10:28:38 +0800 (CST)
Received: from [127.0.0.1] (10.67.102.125) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 21 Jun
 2022 10:29:05 +0800
Message-ID: <62B12CE5.3070605@hisilicon.com>
Date: Tue, 21 Jun 2022 10:28:53 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann
	<arnd@arndb.de>, <arm@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, Rob
 Herring <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>
Subject: Re: (subset) [PATCH v3 10/40] arm64: dts: hisilicon: correct gpio-keys
 properties
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-10-krzysztof.kozlowski@linaro.org> <165572367262.35195.3017202631161821565.b4-ty@linaro.org>
In-Reply-To: <165572367262.35195.3017202631161821565.b4-ty@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.125]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi Krzysztof,

On 2022/6/20 19:14, Krzysztof Kozlowski wrote:
> On Wed, 15 Jun 2022 17:53:03 -0700, Krzysztof Kozlowski wrote:
>> gpio-keys children do not use unit addresses.
>>
>>
> 
> Applied, thanks!

Thanks!

Best Regards,
Wei

> 
> [10/40] arm64: dts: hisilicon: correct gpio-keys properties
>         https://git.kernel.org/krzk/linux/c/717b3096da2ea205c6f31b4c2cd4485671d6ac79
> 
> Best regards,
> 

