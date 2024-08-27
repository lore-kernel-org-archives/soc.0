Return-Path: <SRS0=y4ye=P2=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C832C54735
	for <soc@archiver.kernel.org>; Tue, 27 Aug 2024 11:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73A2CC515D5; Tue, 27 Aug 2024 11:49:44 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02077C515CF;
	Tue, 27 Aug 2024 11:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02077C515CF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WtQnN3wKSz1j7C9;
	Tue, 27 Aug 2024 19:49:28 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 6DA04180019;
	Tue, 27 Aug 2024 19:49:38 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemm600004.china.huawei.com
 (7.193.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 19:49:37 +0800
Message-ID: <7b2ce01f-da18-d809-6fa1-2ad40982a9a3@huawei.com>
Date: Tue, 27 Aug 2024 19:49:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/6] Add some features and bugfix for kunpeng_hccs
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzk@kernel.org>,
	<wanghuiqiang@huawei.com>, <liuyonglong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
 <20240823031059.32579-1-lihuisong@huawei.com>
 <20240823100211.00002b9d@Huawei.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20240823100211.00002b9d@Huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600004.china.huawei.com (7.193.23.242)


在 2024/8/23 17:02, Jonathan Cameron 写道:
> On Fri, 23 Aug 2024 11:10:53 +0800
> Huisong Li <lihuisong@huawei.com> wrote:
>
>> This series are intended to support the low power feature for specified
>> HCCS and add used HCCS types sysfs. In addition, fix some bugfix and
>> enhance some codes.
> Quick process thing.  Don't send a v2 like this in reply to v1
> (for most kernel subsystems anyway, maybe there are some that request
> this?).
>
> Most people still review in email clients and they often start at latest
> and work back until they run out of time.  Thus a reply to an earlier
> thread is not read!
Got it. Thanks for suggestion.
>
> Jonathan
>
>> ---
>>   v2:
>>    - remove "this patch" words in commit log suggested by Krzyszto.
>>    - use for_each_set_bit to replace the cycle scanning all HCCS IP.
>>    - add a patch to rename the 'lane_mode' to 'max_lane_num' to make it
>>      easy to see.
>>    - add doc description into the code patch.
>>    - rename the name of the low power interface.
>>    - adjust the increasing and decreasing lane interface description.
>>    - do not create available_inc_dec_lane_types when no HCCS type support
>>      low power.
>> ---
>>
>> Huisong Li (6):
>>    soc: hisilicon: kunpeng_hccs: Fix a PCC typo
>>    soc: hisilicon: kunpeng_hccs: Return failure on having not die or port
>>      information
>>    soc: hisilicon: kunpeng_hccs: Add the check for base address and size
>>      of shared memory
>>    soc: hisilicon: kunpeng_hccs: Fix the 'lane_mode' field name in port
>>      info structure to 'max_lane_num'
>>    soc: hisilicon: kunpeng_hccs: Add used HCCS types sysfs
>>    soc: hisilicon: kunpeng_hccs: Support low power feature for the
>>      specified HCCS type
>>
>>   .../sysfs-devices-platform-kunpeng_hccs       |  45 ++
>>   drivers/soc/hisilicon/Kconfig                 |   7 +-
>>   drivers/soc/hisilicon/kunpeng_hccs.c          | 516 +++++++++++++++++-
>>   drivers/soc/hisilicon/kunpeng_hccs.h          |  33 +-
>>   4 files changed, 582 insertions(+), 19 deletions(-)
>>
> .
