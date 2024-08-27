Return-Path: <SRS0=y4ye=P2=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4A3C54735
	for <soc@archiver.kernel.org>; Tue, 27 Aug 2024 11:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 193DDC8B7B5; Tue, 27 Aug 2024 11:15:18 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B095DC8B7AF;
	Tue, 27 Aug 2024 11:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B095DC8B7AF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WtQ0x4KSSzyQWq;
	Tue, 27 Aug 2024 19:14:25 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id BC16D18007C;
	Tue, 27 Aug 2024 19:15:12 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemm600004.china.huawei.com
 (7.193.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 19:15:12 +0800
Message-ID: <03160a07-0507-f5a9-fb26-5940cae29750@huawei.com>
Date: Tue, 27 Aug 2024 19:15:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 4/6] soc: hisilicon: kunpeng_hccs: Fix the 'lane_mode'
 field name in port info structure to 'max_lane_num'
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzk@kernel.org>,
	<wanghuiqiang@huawei.com>, <liuyonglong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
 <20240823031059.32579-1-lihuisong@huawei.com>
 <20240823031059.32579-5-lihuisong@huawei.com>
 <20240823094058.00002b9f@Huawei.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20240823094058.00002b9f@Huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600004.china.huawei.com (7.193.23.242)


在 2024/8/23 16:40, Jonathan Cameron 写道:
> On Fri, 23 Aug 2024 11:10:57 +0800
> Huisong Li <lihuisong@huawei.com> wrote:
>
>> The lane mode of HCCS port is an information to user, and actually comes
>> from the maximum lane number. But it is good and easy for driver to use
>> the maximum lane number. So fix the 'lane_mode' field name in port info
>> structure to 'max_lane_num'.
>>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> It's unfortunate we missed the ABI in the first place
> as that's still confusingly names, but at least this improves things
> in the driver.
But it is ok for an external interface to use the 'lane_mode' name. It's 
similar to PCIE's x8.
>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
>> ---
>>   drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
>>   drivers/soc/hisilicon/kunpeng_hccs.h | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
>> index 6055e5091cbd..418e4ee5d9e5 100644
>> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
>> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
>> @@ -594,7 +594,7 @@ static int hccs_get_all_port_info_on_die(struct hccs_dev *hdev,
>>   		port = &die->ports[i];
>>   		port->port_id = attrs[i].port_id;
>>   		port->port_type = attrs[i].port_type;
>> -		port->lane_mode = attrs[i].lane_mode;
>> +		port->max_lane_num = attrs[i].max_lane_num;
>>   		port->enable = attrs[i].enable;
>>   		port->die = die;
>>   	}
>> @@ -839,7 +839,7 @@ static ssize_t lane_mode_show(struct kobject *kobj, struct kobj_attribute *attr,
>>   {
>>   	const struct hccs_port_info *port = kobj_to_port_info(kobj);
>>   
>> -	return sysfs_emit(buf, "x%u\n", port->lane_mode);
>> +	return sysfs_emit(buf, "x%u\n", port->max_lane_num);
>>   }
>>   static struct kobj_attribute lane_mode_attr = __ATTR_RO(lane_mode);
>>   
>> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.h b/drivers/soc/hisilicon/kunpeng_hccs.h
>> index c3adbc01b471..5e12a1e1474e 100644
>> --- a/drivers/soc/hisilicon/kunpeng_hccs.h
>> +++ b/drivers/soc/hisilicon/kunpeng_hccs.h
>> @@ -19,7 +19,7 @@
>>   struct hccs_port_info {
>>   	u8 port_id;
>>   	u8 port_type;
>> -	u8 lane_mode;
>> +	u8 max_lane_num;
>>   	bool enable; /* if the port is enabled */
>>   	struct kobject kobj;
>>   	bool dir_created;
>> @@ -113,7 +113,7 @@ struct hccs_die_info_rsp_data {
>>   struct hccs_port_attr {
>>   	u8 port_id;
>>   	u8 port_type;
>> -	u8 lane_mode;
>> +	u8 max_lane_num;
>>   	u8 enable : 1; /* if the port is enabled */
>>   	u16 rsv[2];
>>   };
> .
