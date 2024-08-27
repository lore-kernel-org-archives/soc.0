Return-Path: <SRS0=y4ye=P2=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C030C54735
	for <soc@archiver.kernel.org>; Tue, 27 Aug 2024 11:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58951C4D02C; Tue, 27 Aug 2024 11:48:45 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E8B6C4CB12;
	Tue, 27 Aug 2024 11:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E8B6C4CB12
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WtQk72bvFz1xwMP;
	Tue, 27 Aug 2024 19:46:39 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F313140120;
	Tue, 27 Aug 2024 19:48:36 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemm600004.china.huawei.com
 (7.193.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 19:48:35 +0800
Message-ID: <de0d4cb2-c668-1d7f-2893-a42840a2b53b@huawei.com>
Date: Tue, 27 Aug 2024 19:48:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 6/6] soc: hisilicon: kunpeng_hccs: Support low power
 feature for the specified HCCS type
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzk@kernel.org>,
	<wanghuiqiang@huawei.com>, <liuyonglong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
 <20240823031059.32579-1-lihuisong@huawei.com>
 <20240823031059.32579-7-lihuisong@huawei.com>
 <20240823095851.0000004e@Huawei.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20240823095851.0000004e@Huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600004.china.huawei.com (7.193.23.242)

Hi Jonathan,

Thanks for your review again.
Your proposal are good and are also more worth to enhance code.
How about use guard() for all sysfs interface in furture patch?
I want to support this feature first.

Huisong


在 2024/8/23 16:58, Jonathan Cameron 写道:
> On Fri, 23 Aug 2024 11:10:59 +0800
> Huisong Li <lihuisong@huawei.com> wrote:
>
>> Add the low power feature for the specified HCCS type by increasing
>> and decreasing the used lane number of these HCCS ports on platform.
>>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> Hi Huisong,
>
> A few comments inline, but all minor things.
>
> With at least the "none" string print dropped as it's in an error path
> that shouldn't be hit you can add
You are correct.
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> The early return comment and whitespace suggestion are things you
> can act on if you liek for v2.
>
> Jonathan
>
>> ---
>>   .../sysfs-devices-platform-kunpeng_hccs       |  37 ++
>>   drivers/soc/hisilicon/Kconfig                 |   7 +-
>>   drivers/soc/hisilicon/kunpeng_hccs.c          | 378 +++++++++++++++++-
>>   drivers/soc/hisilicon/kunpeng_hccs.h          |  14 +
>>   4 files changed, 433 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
>> index d4c355e0e0bb..d1b3a95a5518 100644
>> --- a/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
>> +++ b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
>> @@ -87,3 +87,40 @@ Contact:	Huisong Li <lihuisong@huawei.com>
>>   Description:
>>   		This interface is used to show all HCCS types used on the
>>   		platform, like, HCCS-v1, HCCS-v2 and so on.
>> +
>> +What:		/sys/devices/platform/HISI04Bx:00/available_inc_dec_lane_types
>> +What:		/sys/devices/platform/HISI04Bx:00/dec_lane_of_type
>> +What:		/sys/devices/platform/HISI04Bx:00/inc_lane_of_type
>> +Date:		August 2024
>> +KernelVersion:	6.12
>> +Contact:	Huisong Li <lihuisong@huawei.com>
>> +Description:
>> +		These interfaces under /sys/devices/platform/HISI04Bx/ are
>> +		used to support the low power consumption feature of some
>> +		HCCS types by changing the number of lanes used. The interfaces
>> +		changing the number of lanes used are 'dec_lane_of_type' and
>> +		'inc_lane_of_type' which require root privileges. These
>> +		interfaces aren't exposed if no HCCS type on platform support
>> +		this feature. Please note that decreasing lane number is only
>> +		allowed if all the specified HCCS ports are not busy.
>> +
>> +		The low power consumption interfaces are as follows:
>> +
>> +		============================= ==== ================================
>> +		available_inc_dec_lane_types: (RO) available HCCS types (string) to
>> +						   increase and decrease the number
>> +						   of lane used, e.g. HCCS-v2.
> See below. There is an apparent value of 'none' available, but I think in reality the
> interface doesn't exist if that is present. So drop it as it will just cause confusion.
Ack
>
>> +		dec_lane_of_type:             (WO) input HCCS type supported
>> +						   decreasing lane to decrease the
>> +						   used lane number of all specified
>> +						   HCCS type ports on platform to
>> +						   the minimum.
>> +						   You can query the 'cur_lane_num'
>> +						   to get the minimum lane number
>> +						   after executing successfully.
>> +		inc_lane_of_type:             (WO) input HCCS type supported
>> +						   increasing lane to increase the
>> +						   used lane number of all specified
>> +						   HCCS type ports on platform to
>> +						   the full lane state.
>> +		============================= ==== ================================
>> +static int hccs_wait_serdes_adapt_completed(struct hccs_dev *hdev, u8 type)
>> +{
>> +#define HCCS_MAX_WAIT_CNT_FOR_ADAPT	10
>> +#define HCCS_QUERY_ADAPT_RES_DELAY_MS	100
>> +#define HCCS_SERDES_ADAPT_OK		0
>> +
>> +	struct hccs_inc_lane_req_param *req_param;
>> +	u8 wait_cnt = HCCS_MAX_WAIT_CNT_FOR_ADAPT;
>> +	struct hccs_desc desc;
>> +	u8 adapt_res;
>> +	int ret;
>> +
>> +	do {
>> +		hccs_init_req_desc(&desc);
>> +		req_param = (struct hccs_inc_lane_req_param *)desc.req.data;
>> +		req_param->port_type = type;
>> +		req_param->opt_type = HCCS_GET_ADAPT_RES;
>> +		ret = hccs_pcc_cmd_send(hdev, HCCS_PM_INC_LANE, &desc);
>> +		if (ret) {
>> +			dev_err(hdev->dev, "query adapting result failed, ret = %d.\n",
>> +				ret);
>> +			return ret;
>> +		}
>> +		adapt_res = *((u8 *)&desc.rsp.data);
>> +		if (adapt_res == HCCS_SERDES_ADAPT_OK)
>> +			break;
> return 0; here perhaps?

It's ok. And then we can directly return failure if timeout.

>
>> +
>> +		msleep(HCCS_QUERY_ADAPT_RES_DELAY_MS);
>> +	} while (--wait_cnt);
>> +
>> +	if (adapt_res != HCCS_SERDES_ADAPT_OK) {
> With above early exit in good path, this can be unconditional perhaps?
Yes
>
>> +		dev_err(hdev->dev, "wait for adapting completed timeout.\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	return ret;
>> +}
>> +static ssize_t inc_lane_of_type_store(struct kobject *kobj, struct kobj_attribute *attr,
>> +			      const char *buf, size_t count)
>> +{
>> +	struct hccs_dev *hdev = device_kobj_to_hccs_dev(kobj);
>> +	bool full_lane;
>> +	u8 port_type;
>> +	int ret;
>> +
>> +	ret = hccs_parse_pm_port_type(hdev, buf, &port_type);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mutex_lock(&hdev->lock);
> Another comment for a future patch series perhaps.
>
> guard(mutex)(&hdev->lock); in all these will make the code quite a bit cleaner.
This is a good way. very nice and simple.
But many sysfs interfaces in this driver have used mutex_lock/mutex_unlock.
So is it better for us to keep the same mutex lock way in this patch and 
use guard() for all sysfs interface in furture patch?
>> +	ret = hccs_get_all_spec_port_full_lane_sta(hdev, port_type, &full_lane);
>> +	if (ret || full_lane)
>> +		goto out;
>> +
>> +	ret = hccs_start_inc_lane(hdev, port_type);
>> +out:
>> +	mutex_unlock(&hdev->lock);
>> +	return ret == 0 ? count : ret;
>> +}
>> +static struct kobj_attribute inc_lane_of_type_attr =
>> +		__ATTR(inc_lane_of_type, 0200, NULL, inc_lane_of_type_store);
>> +
>> +static ssize_t available_inc_dec_lane_types_show(struct kobject *kobj,
>> +						 struct kobj_attribute *attr,
>> +						 char *buf)
>> +{
>> +	struct hccs_dev *hdev = device_kobj_to_hccs_dev(kobj);
>> +
>> +	if (hdev->caps & HCCS_CAPS_HCCS_V2_PM)
>> +		return sysfs_emit(buf, "%s\n",
>> +				  hccs_port_type_to_name(hdev, HCCS_V2));
>> +
>> +	return sysfs_emit(buf, "%s\n", "none");
> Can we get here? I thought this was only registered if the condition
> above is true?
>
> Maybe worth keeping a fallback here as a code hardening measure, but
> perhaps return -EINVAL; is fine?
Ack
>
>
>> +}
>> +static struct kobj_attribute available_inc_dec_lane_types_attr =
>> +		__ATTR(available_inc_dec_lane_types, 0444,
>> +		       available_inc_dec_lane_types_show, NULL);
>>   
>>   static ssize_t used_types_show(struct kobject *kobj,
>>   			       struct kobj_attribute *attr, char *buf)
>> @@ -1215,11 +1553,49 @@ static struct kobj_attribute used_types_attr =
>>   static void hccs_remove_misc_sysfs(struct hccs_dev *hdev)
>>   {
>>   	sysfs_remove_file(&hdev->dev->kobj, &used_types_attr.attr);
>> +
>> +	if (!(hdev->caps & HCCS_CAPS_HCCS_V2_PM))
>> +		return;
>> +
>> +	sysfs_remove_file(&hdev->dev->kobj,
>> +			  &available_inc_dec_lane_types_attr.attr);
>> +	sysfs_remove_file(&hdev->dev->kobj, &dec_lane_of_type_attr.attr);
>> +	sysfs_remove_file(&hdev->dev->kobj, &inc_lane_of_type_attr.attr);
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
>> +	if (!(hdev->caps & HCCS_CAPS_HCCS_V2_PM))
>> +		return 0;
>> +
>> +	ret = sysfs_create_file(&hdev->dev->kobj,
>> +				&available_inc_dec_lane_types_attr.attr);
>> +	if (ret)
>> +		goto used_types_remove;
>> +
>> +	ret = sysfs_create_file(&hdev->dev->kobj, &dec_lane_of_type_attr.attr);
>> +	if (ret)
>> +		goto inc_dec_lane_types_remove;
> I can sort of see why no line break makes some sense here given these
> two files are closely related, but I'd still add one here as I think
> visual consistency is more important for readability reasons.
Ack
>
>> +	ret = sysfs_create_file(&hdev->dev->kobj, &inc_lane_of_type_attr.attr);
>> +	if (ret)
>> +		goto dec_lane_of_type_remove;
>> +
>> +	return 0;
>> +
>> +dec_lane_of_type_remove:
>> +	sysfs_remove_file(&hdev->dev->kobj, &dec_lane_of_type_attr.attr);
>> +inc_dec_lane_types_remove:
>> +	sysfs_remove_file(&hdev->dev->kobj,
>> +			  &available_inc_dec_lane_types_attr.attr);
>> +used_types_remove:
>> +	sysfs_remove_file(&hdev->dev->kobj, &used_types_attr.attr);
>> +	return ret;
>>   }
>>   
>>   static void hccs_remove_die_dir(struct hccs_die_info *die)
> .
