Return-Path: <SRS0=JvIS=DY=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5941C001DE
	for <soc@archiver.kernel.org>; Mon,  7 Aug 2023 01:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B772C433C9; Mon,  7 Aug 2023 01:41:20 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB65EC433C7;
	Mon,  7 Aug 2023 01:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB65EC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RJzXH5b8Rz1KCJn;
	Mon,  7 Aug 2023 09:39:59 +0800 (CST)
Received: from [10.67.103.231] (10.67.103.231) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 09:41:07 +0800
Message-ID: <d6bd6abd-4330-a753-ad11-e5a78a826bb4@huawei.com>
Date: Mon, 7 Aug 2023 09:41:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 1/2] soc: hisilicon: Support HCCS driver on Kunpeng SoC
To: Zenghui Yu <zenghui.yu@linux.dev>, <xuwei5@hisilicon.com>,
	<arnd@arndb.de>, <krzk@kernel.org>, <sudeep.holla@arm.com>,
	<rdunlap@infradead.org>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wanghuiqiang@huawei.com>,
	<tanxiaofei@huawei.com>, <liuyonglong@huawei.com>, <lihuisong@huawei.com>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230801024119.37215-1-lihuisong@huawei.com>
 <20230801024119.37215-2-lihuisong@huawei.com>
 <b8512626-2174-ff08-5b6d-4256d9e59093@linux.dev>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <b8512626-2174-ff08-5b6d-4256d9e59093@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.231]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected

Hi Zenghui,

Please ignore the previous email and take a look at this.


在 2023/8/6 23:09, Zenghui Yu 写道:
> A few trivial comments inline.
Many thanks for reviewing my patch carefully.😁
>
> On 2023/8/1 10:41, Huisong Li wrote:
>> The Huawei Cache Coherence System (HCCS) is a multi-chip interconnection
>> bus protocol. The performance of the application may be affected if some
>> HCCS ports on platform are not in full lane status, have a large number
>> of CRC errors and so on.
>>
>> This driver provides the query interface of the health status and
>> port information of HCCS on Kunpeng SoC.
>>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
>
> [...]
>
>> +static int hccs_query_all_port_info_on_platform(struct hccs_dev *hdev)
>> +{
>> +
>> +    struct device *dev = hdev->dev;
>> +    struct hccs_chip_info *chip;
>> +    struct hccs_die_info *die;
>> +    u8 i, j;
>> +    int ret;
>> +
>> +    for (i = 0; i < hdev->chip_num; i++) {
>> +        chip = &hdev->chips[i];
>> +        for (j = 0; j < chip->die_num; j++) {
>> +            die = &chip->dies[j];
>> +            if (!die->port_num)
>> +                continue;
>> +
>> +            die->ports = devm_kzalloc(dev,
>> +                die->port_num * sizeof(struct hccs_port_info),
>> +                GFP_KERNEL);
>> +            if (!die->ports) {
>> +                dev_err(dev, "allocate ports memory on chip%u/die%u 
>> failed.\n",
>> +                    i, die->die_id);
>> +                return -ENOMEM;
>> +            }
>> +
>> +            ret = hccs_get_all_port_info_on_die(hdev, die);
>> +            if (ret) {
>> +                dev_err(dev, "get die(%u) info on chip%u failed, ret 
>> = %d.\n",
>
> "get *port* info failed"?
Yes, this is more exact.
Will be fixed to "get port info on chip%u/die%u failed".
>
>> +static int hccs_get_die_all_link_status(struct hccs_dev *hdev,
>> +                    const struct hccs_die_info *die,
>> +                    u8 *all_linked)
>> +{
>> +    struct hccs_die_comm_req_param *req_param;
>> +    struct hccs_desc desc;
>> +    int ret;
>> +
>> +    if (die->port_num == 0) {
>> +        *all_linked = 1;
>> +        return 0;
>> +    }
>> +
>> +    hccs_init_req_desc(&desc);
>> +    req_param = (struct hccs_die_comm_req_param *)desc.req.data;
>> +    req_param->chip_id = die->chip->chip_id;
>> +    req_param->die_id = die->die_id;
>> +    ret = hccs_pcc_cmd_send(hdev, HCCS_GET_DIE_PORTS_LANE_STA, &desc);
>
> Typo? Looks like we intend to send a HCCS_GET_DIE_PORTS_LINK_STA
> command.
Yes, you are right. It's my fault.
Appreciate you so much for pointing it out.
I will also check other commands again.
>
>> +/*
>> + * This value cannot be 255, otherwise the loop of the multi-BD 
>> communication
>> + * case cannot end.
>> + */
>> +#define HCCS_DIE_MAX_PORT_ID    254
>
> This looks weird. Isn't the "max port id" depends on your HW
> implementation?
The "max port id" normally depends on HW implementation.
And there are no so many numbers of port on one die.
But HW implementation specification is possiable to change in furture SoC.
Driver should be compatible with it.
So "max port id" here comes from the communication interface and way 
with firmware.
>
>> +#define hccs_get_field(origin, mask, shift) \
>> +    (((origin) & (mask)) >> (shift))
>> +#define hccs_get_bit(origin, shift) \
>> +    hccs_get_field((origin), (0x1UL << (shift)), (shift))
>
> Unused macroes.
This macroes were used in previous version.
Later, the place where it is used was deleted, now it is unused indeed.
will delete it.
>
> P.S., I'd personally prefer splitting this patch in 2 to ease other
> reviewer's work:
>
> - deal with the HCCS HW (chip/die/port) probing
> - focus on the sysfs/query things
Ok, I will split this patch in next version. Thanks.
> .
/Huisong
