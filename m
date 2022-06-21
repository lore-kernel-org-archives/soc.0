Return-Path: <SRS0=y8cl=W4=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD75EC43334
	for <soc@archiver.kernel.org>; Tue, 21 Jun 2022 02:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95807C341C4; Tue, 21 Jun 2022 02:29:28 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22F5CC3411B;
	Tue, 21 Jun 2022 02:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22F5CC3411B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LRr5X3FcNzkWPK;
	Tue, 21 Jun 2022 10:27:44 +0800 (CST)
Received: from [127.0.0.1] (10.67.102.125) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 21 Jun
 2022 10:29:23 +0800
Message-ID: <62B12D02.8000707@hisilicon.com>
Date: Tue, 21 Jun 2022 10:29:22 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <arm@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>, Olof
 Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
	<soc@kernel.org>
Subject: Re: (subset) [PATCH v3 09/40] arm64: dts: hisilicon: align gpio-key
 node names with dtschema
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-9-krzysztof.kozlowski@linaro.org> <165572367262.35195.16654742647500367074.b4-ty@linaro.org>
In-Reply-To: <165572367262.35195.16654742647500367074.b4-ty@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi Krzysztof,

On 2022/6/20 19:14, Krzysztof Kozlowski wrote:
> On Wed, 15 Jun 2022 17:53:02 -0700, Krzysztof Kozlowski wrote:
>> The node names should be generic and DT schema expects certain pattern
>> (e.g. with key/button/switch).
>>
>>
> 
> Applied, thanks!

Thanks!

Best Regards,
Wei

> 
> [09/40] arm64: dts: hisilicon: align gpio-key node names with dtschema
>         https://git.kernel.org/krzk/linux/c/111b4da2c2fc2551ecfe466616089e1223dc7ac1
> 
> Best regards,
> 

