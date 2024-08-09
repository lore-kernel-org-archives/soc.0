Return-Path: <SRS0=7GN9=PI=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC96C3DA4A
	for <soc@archiver.kernel.org>; Fri,  9 Aug 2024 04:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C5CAC4AF0B; Fri,  9 Aug 2024 04:07:28 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 357B0C4AF0D
	for <soc@kernel.org>; Fri,  9 Aug 2024 04:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 357B0C4AF0D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wg9N45ywyzyNx9;
	Fri,  9 Aug 2024 12:07:00 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id E0A771800A0;
	Fri,  9 Aug 2024 12:07:23 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemm600004.china.huawei.com
 (7.193.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 9 Aug
 2024 12:07:23 +0800
Message-ID: <e921f0ca-d09f-772e-9f36-97567ba0b92e@huawei.com>
Date: Fri, 9 Aug 2024 12:07:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/5] soc: hisilicon: kunpeng_hccs: add used HCCS type
 sysfs on platform
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<liuyonglong@huawei.com>, <linuxarm@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
 <20240718071134.31155-4-lihuisong@huawei.com>
 <66AB7194.1060404@hisilicon.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <66AB7194.1060404@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600004.china.huawei.com (7.193.23.242)


在 2024/8/1 19:29, Wei Xu 写道:
> Hi Huisong,
>
> On 2024/7/18 15:11, Huisong Li wrote:
>> This patch add the sysfs to show all HCCS type used on platform.
> As Krzysztof suggested, it is better to change the commit as follows:
>    Add the sysfs to show all HCCS types used on the platform.
Ack
>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
>> ---
>>   drivers/soc/hisilicon/kunpeng_hccs.c | 106 ++++++++++++++++++++++++++-
>>   drivers/soc/hisilicon/kunpeng_hccs.h |  15 ++++
>>   2 files changed, 120 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
>> index 6e88f597f267..2d68ec49e1d6 100644
>> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
>> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
>> @@ -21,11 +21,14 @@
>>    *    - if all enabled ports are in linked
>>    *    - if all linked ports are in full lane
>>    *    - CRC error count sum
>> + *
>> + * - Retrieve all used HCCS types on platform.
> How about changed to the following?
> Retrieve all HCCS types used on the platform.
Ack
>
>>    */
>>   #include <linux/acpi.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/sysfs.h>
>> +#include <linux/types.h>
>>   
>>   #include <acpi/pcc.h>
>>   
>> @@ -53,6 +56,15 @@ static struct hccs_chip_info *kobj_to_chip_info(struct kobject *k)
>>   	return container_of(k, struct hccs_chip_info, kobj);
>>   }
>>   
>> +static struct hccs_dev *device_kobj_to_hccs_dev(struct kobject *k)
>> +{
>> +	struct device *dev = container_of(k, struct device, kobj);
>> +	struct platform_device *pdev =
>> +			container_of(dev, struct platform_device, dev);
>> +
>> +	return platform_get_drvdata(pdev);
>> +}
>> +
>>   struct hccs_register_ctx {
>>   	struct device *dev;
>>   	u8 chan_id;
>> @@ -664,6 +676,59 @@ static int hccs_get_hw_info(struct hccs_dev *hdev)
>>   	return 0;
>>   }
>>   
>> +static u16 hccs_calc_used_type_num(struct hccs_dev *hdev,
>> +				   unsigned long *hccs_ver)
>> +{
>> +	struct hccs_chip_info *chip;
>> +	struct hccs_port_info *port;
>> +	struct hccs_die_info *die;
>> +	u16 used_type_num = 0;
>> +	u16 i, j, k;
>> +
>> +	for (i = 0; i < hdev->chip_num; i++) {
>> +		chip = &hdev->chips[i];
>> +		for (j = 0; j < chip->die_num; j++) {
>> +			die = &chip->dies[j];
>> +			for (k = 0; k < die->port_num; k++) {
>> +				port = &die->ports[k];
>> +				set_bit(port->port_type, hccs_ver);
>> +			}
>> +		}
>> +	}
>> +
>> +	for (i = 0; i <= HCCS_IP_MAX; i++) {
>> +		if (test_bit(i, hccs_ver))
>> +			used_type_num++;
>> +	}
>> +
>> +	return used_type_num;
>> +}
>> +
>> +static int hccs_init_type_name_maps(struct hccs_dev *hdev)
>> +{
>> +	DECLARE_BITMAP(hccs_ver, HCCS_IP_MAX + 1) = {};
>> +	unsigned int i;
>> +	u32 map_size;
>> +	u16 idx = 0;
>> +
>> +	hdev->used_type_num = hccs_calc_used_type_num(hdev, hccs_ver);
>> +	map_size = sizeof(struct hccs_type_name_map) * hdev->used_type_num;
>> +	hdev->type_name_maps = devm_kzalloc(hdev->dev, map_size, GFP_KERNEL);
>> +	if (!hdev->type_name_maps)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i <= HCCS_IP_MAX; i++) {
>> +		if (test_bit(i, hccs_ver)) {
>> +			hdev->type_name_maps[idx].type = i;
>> +			sprintf(hdev->type_name_maps[idx].name,
>> +				HCCS_IP_PREFIX "%u", i);
> How about changed to the following?
> sprintf(hdev->type_name_maps[idx].name, "%s %u", HCCS_IP_PREFIX, i);
Ack
>
>> +			idx++;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int hccs_query_port_link_status(struct hccs_dev *hdev,
>>   				       const struct hccs_port_info *port,
>>   				       struct hccs_link_status *link_status)
>> @@ -824,7 +889,7 @@ static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
>>   {
>>   	const struct hccs_port_info *port = kobj_to_port_info(kobj);
>>   
>> -	return sysfs_emit(buf, "HCCS-v%u\n", port->port_type);
>> +	return sysfs_emit(buf, HCCS_IP_PREFIX "%u\n", port->port_type);
> ditto.
Ack
>>   }
>>   static struct kobj_attribute hccs_type_attr = __ATTR_RO(type);
>>   
>> @@ -1128,6 +1193,33 @@ static const struct kobj_type hccs_chip_type = {
>>   	.default_groups = hccs_chip_default_groups,
>>   };
>>   
>> +
>> +static ssize_t used_types_show(struct kobject *kobj,
>> +			       struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct hccs_dev *hdev = device_kobj_to_hccs_dev(kobj);
>> +	int len = 0;
>> +	u16 i;
>> +
>> +	for (i = 0; i < hdev->used_type_num - 1; i++)
>> +		len += sysfs_emit(&buf[len], "%s ", hdev->type_name_maps[i].name);
>> +	len += sysfs_emit(&buf[len], "%s\n", hdev->type_name_maps[i].name);
>> +
>> +	return len;
>> +}
>> +static struct kobj_attribute used_types_attr =
>> +		__ATTR(used_types, 0444, used_types_show, NULL);
>> +
>> +static void hccs_remove_misc_sysfs(struct hccs_dev *hdev)
>> +{
>> +	sysfs_remove_file(&hdev->dev->kobj, &used_types_attr.attr);
>> +}
>> +
>> +static int hccs_add_misc_sysfs(struct hccs_dev *hdev)
>> +{
>> +	return sysfs_create_file(&hdev->dev->kobj, &used_types_attr.attr);
>> +}
>> +
>>   static void hccs_remove_die_dir(struct hccs_die_info *die)
>>   {
>>   	struct hccs_port_info *port;
>> @@ -1162,6 +1254,8 @@ static void hccs_remove_topo_dirs(struct hccs_dev *hdev)
>>   
>>   	for (i = 0; i < hdev->chip_num; i++)
>>   		hccs_remove_chip_dir(&hdev->chips[i]);
>> +
>> +	hccs_remove_misc_sysfs(hdev);
>>   }
>>   
>>   static int hccs_create_hccs_dir(struct hccs_dev *hdev,
>> @@ -1257,6 +1351,12 @@ static int hccs_create_topo_dirs(struct hccs_dev *hdev)
>>   		}
>>   	}
>>   
>> +	ret = hccs_add_misc_sysfs(hdev);
>> +	if (ret) {
>> +		dev_err(hdev->dev, "create global sysfs interface failed, ret = %d\n", ret);
>> +		goto err;
>> +	}
>> +
>>   	return 0;
>>   err:
>>   	for (k = 0; k < id; k++)
>> @@ -1307,6 +1407,10 @@ static int hccs_probe(struct platform_device *pdev)
>>   	if (rc)
>>   		goto unregister_pcc_chan;
>>   
>> +	rc = hccs_init_type_name_maps(hdev);
>> +	if (rc)
>> +		goto unregister_pcc_chan;
>> +
>>   	rc = hccs_create_topo_dirs(hdev);
>>   	if (rc)
>>   		goto unregister_pcc_chan;
>> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.h b/drivers/soc/hisilicon/kunpeng_hccs.h
>> index c3adbc01b471..fe8b4089a9c7 100644
>> --- a/drivers/soc/hisilicon/kunpeng_hccs.h
>> +++ b/drivers/soc/hisilicon/kunpeng_hccs.h
>> @@ -10,6 +10,19 @@
>>    * | P0 | P1 | P2 | P3 | P0 | P1 | P2 | P3 | P0 | P1 | P2 | P3 |P0 | P1 | P2 | P3 |
>>    */
>>   
>> +enum hccs_port_type {
>> +	HCCS_V1 = 1,
>> +	HCCS_V2,
>> +};
>> +
>> +#define HCCS_IP_PREFIX	"HCCS-v"
>> +#define HCCS_IP_MAX		255
>> +#define HCCS_NAME_MAX_LEN	9
>> +struct hccs_type_name_map {
>> +	u8 type;
>> +	char name[HCCS_NAME_MAX_LEN + 1];
>> +};
>> +
>>   /*
>>    * This value cannot be 255, otherwise the loop of the multi-BD communication
>>    * case cannot end.
>> @@ -74,6 +87,8 @@ struct hccs_dev {
>>   	u64 caps;
>>   	u8 chip_num;
>>   	struct hccs_chip_info *chips;
>> +	u16 used_type_num;
>> +	struct hccs_type_name_map *type_name_maps;
>>   	u8 chan_id;
>>   	struct mutex lock;
>>   	struct hccs_mbox_client_info cl_info;
>>
> .
