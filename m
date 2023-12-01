Return-Path: <SRS0=Z3CQ=HM=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46199C4167B
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 02:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F68FC433C9; Fri,  1 Dec 2023 02:45:29 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36886C433C7;
	Fri,  1 Dec 2023 02:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36886C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm000004.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ShHTb0CvWzvQw8;
	Fri,  1 Dec 2023 10:44:51 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemm000004.china.huawei.com
 (7.193.23.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 1 Dec
 2023 10:45:23 +0800
Message-ID: <b2cb48ed-3ba2-ee61-4f33-0a60ebaf0029@huawei.com>
Date: Fri, 1 Dec 2023 10:45:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 4/4] soc: hisilicon: kunpeng_hccs: Support the platform
 with PCC type3 and interrupt ack
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <arnd@arndb.de>, <krzk@kernel.org>,
	<sudeep.holla@arm.com>, <liuyonglong@huawei.com>
References: <20231109054526.27270-1-lihuisong@huawei.com>
 <20231130134550.33398-1-lihuisong@huawei.com>
 <20231130134550.33398-5-lihuisong@huawei.com>
 <20231130144911.00005faf@Huawei.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20231130144911.00005faf@Huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000004.china.huawei.com (7.193.23.18)
X-CFilter-Loop: Reflected


在 2023/11/30 22:49, Jonathan Cameron 写道:
> On Thu, 30 Nov 2023 21:45:50 +0800
> Huisong Li <lihuisong@huawei.com> wrote:
>
>> Support the platform with PCC type3 and interrupt ack. And a version
>> specific structure is introduced to handle the difference between the
>> device in the code.
>>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> Hi.
>
> A few trivial things inline but now looks good to me!
>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
>> ---
>>   drivers/soc/hisilicon/kunpeng_hccs.c | 136 ++++++++++++++++++++++-----
>>   drivers/soc/hisilicon/kunpeng_hccs.h |  15 +++
>>   2 files changed, 126 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
>> index 15125f1e0f3e..d2302ff8c0e9 100644
>> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
>> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
> ...
>
>>   
>> -static int hccs_check_chan_cmd_complete(struct hccs_dev *hdev)
>> +static inline int hccs_wait_cmd_complete_by_poll(struct hccs_dev *hdev)
> Why inline?  Do we have numbers to support this hint to the compiler being
> useful?
No testing for this, but here might not be really useful.
So will remove this inline.
>>   {
>>   	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
>>   	struct acpi_pcct_shared_memory __iomem *comm_base =
>> @@ -194,30 +211,75 @@ static int hccs_check_chan_cmd_complete(struct hccs_dev *hdev)
>>   	return ret;
>>   }
>>   
>> +static inline int hccs_wait_cmd_complete_by_irq(struct hccs_dev *hdev)
>> +{
>> +	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
>> +	int ret = 0;
> Drop ret...
Ack
>
>> +
>> +	if (!wait_for_completion_timeout(&cl_info->done,
>> +			usecs_to_jiffies(cl_info->deadline_us))) {
>> +		dev_err(hdev->dev, "PCC command executed timeout!\n");
>> +		ret = -ETIMEDOUT;
> 		return -TIMEDOUT;
> ...
>> +	}
>> +
>> +	return ret;
> return 0;
Ack
>> +}
>> +static const struct hccs_verspecific_data hisi04b1_verspec_data = {
>> +	.rx_callback = NULL,
> It's harmless but no need to set callback to NULL. Maybe it acts as documentation?
Just to explicitly assign value and show the difference between the devices.
> It's common practice to just let C spec guarantees initialize any not implemented callbacks
> to 0 without them needing to be done explicitly.
Correct, but It's harmless.
>
>> +	.wait_cmd_complete = hccs_wait_cmd_complete_by_poll,
>> +	.fill_pcc_shared_mem = hccs_fill_pcc_shared_mem_region,
>> +	.shared_mem_size = sizeof(struct acpi_pcct_shared_memory),
>> +	.has_txdone_irq = false,
>> +};
>> +
>> +static const struct hccs_verspecific_data hisi04b2_verspec_data = {
>> +	.rx_callback = hccs_pcc_rx_callback,
>> +	.wait_cmd_complete = hccs_wait_cmd_complete_by_irq,
>> +	.fill_pcc_shared_mem = hccs_fill_ext_pcc_shared_mem_region,
>> +	.shared_mem_size = sizeof(struct acpi_pcct_ext_pcc_shared_memory),
>> +	.has_txdone_irq = true,
>> +};
> .
