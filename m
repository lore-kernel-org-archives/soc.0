Return-Path: <SRS0=7GN9=PI=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155C0C3DA4A
	for <soc@archiver.kernel.org>; Fri,  9 Aug 2024 04:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5CC3C4AF0E; Fri,  9 Aug 2024 04:06:36 +0000 (UTC)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D501C32782;
	Fri,  9 Aug 2024 04:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D501C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wg9Fw3nMMz1S7Rr;
	Fri,  9 Aug 2024 12:01:40 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id CC2A0180042;
	Fri,  9 Aug 2024 12:06:25 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemm600004.china.huawei.com
 (7.193.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 9 Aug
 2024 12:06:25 +0800
Message-ID: <6a60c4ea-6113-e14f-5d3c-d90175a227cc@huawei.com>
Date: Fri, 9 Aug 2024 12:06:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/5] soc: hisilicon: kunpeng_hccs: support low power
 feature for specified HCCS
To: Krzysztof Kozlowski <krzk@kernel.org>, <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<liuyonglong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
 <20240718071134.31155-5-lihuisong@huawei.com>
 <91308a58-f70c-4b28-95e5-d64a1f12f252@kernel.org>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <91308a58-f70c-4b28-95e5-d64a1f12f252@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600004.china.huawei.com (7.193.23.242)

Hi Krzyszto,

Thanks for your suggestion.

在 2024/7/28 19:55, Krzysztof Kozlowski 写道:
> On 18/07/2024 09:11, Huisong Li wrote:
>> This patch add the low power feature for specified HCCS by increasing
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
got it. many thanks.
>
>> and decrasing the lane number of these HCCS ports on platform.
>>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
>> ---
>>   drivers/soc/hisilicon/Kconfig        |   7 +-
>>   drivers/soc/hisilicon/kunpeng_hccs.c | 377 ++++++++++++++++++++++++++-
>>   drivers/soc/hisilicon/kunpeng_hccs.h |  14 +
>>   3 files changed, 394 insertions(+), 4 deletions(-)
> ...
>
>
>> +static struct kobj_attribute pm_types_attr =
>> +		__ATTR(support_pm_types, 0444, support_pm_types_show, NULL);
>>   
>>   static ssize_t used_types_show(struct kobject *kobj,
>>   			       struct kobj_attribute *attr, char *buf)
>> @@ -1213,11 +1551,46 @@ static struct kobj_attribute used_types_attr =
>>   static void hccs_remove_misc_sysfs(struct hccs_dev *hdev)
>>   {
>>   	sysfs_remove_file(&hdev->dev->kobj, &used_types_attr.attr);
>> +	sysfs_remove_file(&hdev->dev->kobj, &pm_types_attr.attr);
>> +
>> +	if (!(hdev->caps & HCCS_CAPS_HCCS_V2_PM))
>> +		return;
>> +
>> +	sysfs_remove_file(&hdev->dev->kobj, &dec_lane_attr.attr);
>> +	sysfs_remove_file(&hdev->dev->kobj, &inc_lane_attr.attr);
>>   }
>>   
>>   static int hccs_add_misc_sysfs(struct hccs_dev *hdev)
>>   {
>> -	return sysfs_create_file(&hdev->dev->kobj, &used_types_attr.attr);
>> +	int ret;
>> +
>> +	ret = sysfs_create_file(&hdev->dev->kobj, &used_types_attr.attr);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = sysfs_create_file(&hdev->dev->kobj, &pm_types_attr.attr);
> Where is the ABI documentation?
Ok, will split the doc patch and add doc with code patch.
>
> Best regards,
> Krzysztof
>
> .
