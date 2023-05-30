Return-Path: <SRS0=uZ+G=BT=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9729C77B73
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 10:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87CD6C4339B; Tue, 30 May 2023 10:57:30 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E22C5C433EF;
	Tue, 30 May 2023 10:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E22C5C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4QVq3z2rwYz18LpZ;
	Tue, 30 May 2023 18:52:47 +0800 (CST)
Received: from [10.67.103.231] (10.67.103.231) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 18:57:24 +0800
Message-ID: <c2d2ad06-a6c0-342f-402e-ac5d42d8dda8@huawei.com>
Date: Tue, 30 May 2023 18:57:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] soc: hisilicon: Support HCCS driver on Kunpeng SoC
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
CC: <andersson@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <shawnguo@kernel.org>,
	<arnd@arndb.de>, <krzk@kernel.org>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>, <wanghuiqiang@huawei.com>, <tanxiaofei@huawei.com>,
	<liuyonglong@huawei.com>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230522072211.8894-1-lihuisong@huawei.com>
 <20230522072211.8894-2-lihuisong@huawei.com>
 <20230523093922.f2y4wrz3vkzi7kmw@bogus>
 <b29eab0c-4084-0e91-3e31-7f7c264ad629@huawei.com>
 <20230525073539.waaa7wpudohullcg@bogus>
 <5e0d81c8-5f52-82e5-5509-785e87a9a17e@huawei.com>
 <7852a2b4-b601-f4e8-bc5f-7b1bc9d9dc69@huawei.com>
 <20230530084324.m47xvpqrga6tegpd@bogus>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20230530084324.m47xvpqrga6tegpd@bogus>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.231]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected


在 2023/5/30 16:43, Sudeep Holla 写道:
> On Tue, May 30, 2023 at 10:53:38AM +0800, lihuisong (C) wrote:
>> Hi Sudeep,
>>
>>
>> 在 2023/5/25 16:12, lihuisong (C) 写道:
>>> 在 2023/5/25 15:35, Sudeep Holla 写道:
>>>> On Thu, May 25, 2023 at 10:41:51AM +0800, lihuisong (C) wrote:
>>>>> Hi Sudeep,
>>>>>
>>>>> Here, the interface is used to determine whether a port is in use or
>>>>> enabled.
>>>>> If we just use 'status', it cannot inidicates its own meaning by name.
>>>>> What do you think?
>>>>>
>>>> How about "port_status" or "port-status" ?
>>> The meaning of this status is a little board.
>>> How about 'enable'? just a read-only entry.
>>>
>>>
>> "using_status" --> "enable" ? What do you think?
>> Its original purpose was to determine whether a port is in use or enabled.
>>
> That's fine. The main point I was trying to make is plain "status" or
ok, create it as "enable".
> "using_status" is prone to conflict as you have ports, lanes, ...etc.
> Adding "port_" to the name whatever you choose is better.
Yes, adding "port_" is better if not all sysfs entries are related to 
the port.
Actually, all sysfs entries belong to the hccsX port under the hccsX 
directory.
>
