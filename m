Return-Path: <SRS0=5hFP=DE=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B24EB64DC
	for <soc@archiver.kernel.org>; Tue, 18 Jul 2023 11:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F01FC433C9; Tue, 18 Jul 2023 11:01:23 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F3D7C433C8;
	Tue, 18 Jul 2023 11:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F3D7C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R4wsb0svdztRTs;
	Tue, 18 Jul 2023 18:58:11 +0800 (CST)
Received: from [10.67.103.39] (10.67.103.39) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 19:01:16 +0800
Message-ID: <64B670FB.6080703@hisilicon.com>
Date: Tue, 18 Jul 2023 19:01:15 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "lihuisong (C)" <lihuisong@huawei.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "xuwei (O)" <xuwei5@huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<wanghuiqiang@huawei.com>, <tanxiaofei@huawei.com>, <liuyonglong@huawei.com>,
	<andersson@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <shawnguo@kernel.org>,
	<arnd@arndb.de>, <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 0/2] soc: hisilicon: Support HCCS driver on Kunpeng
 SoC
References: <20230424073020.4039-1-lihuisong@huawei.com> <20230530112746.2767-1-lihuisong@huawei.com> <02f74b25-2ade-5b87-b316-ab902f08ead2@huawei.com> <3e106062-9ceb-eb51-70ba-32734c769bd5@kernel.org> <2cc391ce-0e87-040f-6a45-d3e128a988f0@huawei.com>
In-Reply-To: <2cc391ce-0e87-040f-6a45-d3e128a988f0@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.39]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi Krzysztof,

On 2023/7/18 16:07, lihuisong (C) wrote:
> Hi Krzysztof,
> 
> Thank you for your reply.
> 
> 
> 在 2023/7/17 20:06, Krzysztof Kozlowski 写道:
>> On 14/07/2023 08:17, lihuisong (C) wrote:
>>> Hi all,
>>>
>>> Can you take a look at this series?
>> People you listed in "To:" field are not maintainers of HiSilicon, so
>> why pinging us?
> This "To:" field are from the get_maintainer.pl script.
> ./scripts/get_maintainer.pl -f ./drivers/soc/
> The hisilicon in drivers/soc/ is created for the first time. So there are no maintainer of HiSilicon.
> 
> Thanks for reminder.
> add HiSilicon SOC maintainer Wei Xu.
>>
>> HiSilicon DTS has numerous issues, so if you want to increase the
>> chances anyone cares about your patch, please contribute to fixing and
>> improving your company DTS. See for example commit b2bbc8687 which is
>> bad (underscores are not allowed) or 1860a51823 which is just wrong. The
>> latter one is being fixed, although I do not see the fix being picked

Sorry, it seems wrong of the commit 1860a51823 which changed the clock pin.
I have checked the mail list but did not find the bug fix for it.
Could you please kindly share the subject of the patch?
Or I can simply revert it. 
Thanks!

Best Regards,
Wei

>> up... my feelings are the platform is just dead.
> The HCCS driver has nothing to do with HiSilicon DTS.
> So I cannot understand why you say DTS.
> 
> /Huisong
> .
> 
