Return-Path: <SRS0=y4ye=P2=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B008C54735
	for <soc@archiver.kernel.org>; Tue, 27 Aug 2024 11:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE5B0C8B7AB; Tue, 27 Aug 2024 11:12:28 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54EB9C8B7A9;
	Tue, 27 Aug 2024 11:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54EB9C8B7A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WtPwh2F8TzpStT;
	Tue, 27 Aug 2024 19:10:44 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id CCE27140137;
	Tue, 27 Aug 2024 19:12:24 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemm600004.china.huawei.com
 (7.193.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 19:12:24 +0800
Message-ID: <716dc0b3-f663-b37d-6d97-fb3c3887a97b@huawei.com>
Date: Tue, 27 Aug 2024 19:12:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/6] soc: hisilicon: kunpeng_hccs: Add the check for
 base address and size of shared memory
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzk@kernel.org>,
	<wanghuiqiang@huawei.com>, <liuyonglong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
 <20240823031059.32579-1-lihuisong@huawei.com>
 <20240823031059.32579-4-lihuisong@huawei.com>
 <20240823093858.00007047@Huawei.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20240823093858.00007047@Huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600004.china.huawei.com (7.193.23.242)


在 2024/8/23 16:38, Jonathan Cameron 写道:
> On Fri, 23 Aug 2024 11:10:56 +0800
> Huisong Li <lihuisong@huawei.com> wrote:
>
>> If the shmem_base_addr from PCCT is zero, hccs_register_pcc_channel will
>> return success. And then driver will access to illegal address when send
>> PCC command. In addition, the size of shared memory used for communication
>> between driver and platform is fixed, namely 64 Bytes which is
>> unchangeable. So add the verification for them.
>>
> As with previous, make it clear if this hardening or fix
> fix to catch a problem on shipping hardware (I assume not, but you never
> know!)
Ack
>
> A comment on existing code inline.  Not a suggestion for a change
> in this series, but maybe for the future.  There are a lot
> of goto err_mbx_channel_Free in here already and this patch adds
> another.  The cleanup there is trivial so DEFINE_FREE() and __free
> usage will make this code quite a bit nicer to read.
Yeah, it's a good way to simplify code on error path.
I will take into account it. thanks for your good suggestion.
>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
>> ---
>>   drivers/soc/hisilicon/kunpeng_hccs.c | 24 +++++++++++++++---------
>>   1 file changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
>> index 6e88f597f267..6055e5091cbd 100644
>> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
>> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
>> @@ -170,15 +170,21 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
>>   		goto err_mbx_channel_free;
>>   	}
>>   
>> -	if (pcc_chan->shmem_base_addr) {
>> -		cl_info->pcc_comm_addr = ioremap(pcc_chan->shmem_base_addr,
>> -						 pcc_chan->shmem_size);
>> -		if (!cl_info->pcc_comm_addr) {
>> -			dev_err(dev, "Failed to ioremap PCC communication region for channel-%u.\n",
>> -				hdev->chan_id);
>> -			rc = -ENOMEM;
>> -			goto err_mbx_channel_free;
>> -		}
>> +	if (!pcc_chan->shmem_base_addr ||
>> +	    pcc_chan->shmem_size != HCCS_PCC_SHARE_MEM_BYTES) {
>> +		dev_err(dev, "The base address or size (%llu) of PCC communication region is invalid.\n",
>> +			pcc_chan->shmem_size);
>> +		rc = -EINVAL;
>> +		goto err_mbx_channel_free;
> Worth considering for the future: Maybe a DEFINE_FREE for pcc_mbox_free_channel) makes sense,
> though if you do you should only assign cl_info->pcc_chan after all possible error paths.
Ack
>
>> +	}
>> +
>> +	cl_info->pcc_comm_addr = ioremap(pcc_chan->shmem_base_addr,
>> +					 pcc_chan->shmem_size);
>> +	if (!cl_info->pcc_comm_addr) {
>> +		dev_err(dev, "Failed to ioremap PCC communication region for channel-%u.\n",
>> +			hdev->chan_id);
>> +		rc = -ENOMEM;
>> +		goto err_mbx_channel_free;
>>   	}
>>   
>>   	return 0;
> .
