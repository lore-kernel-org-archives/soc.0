Return-Path: <SRS0=Kwmh=EC=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573CCC05052
	for <soc@archiver.kernel.org>; Thu, 17 Aug 2023 01:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F363C433CA; Thu, 17 Aug 2023 01:37:54 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A9B5C433C7;
	Thu, 17 Aug 2023 01:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A9B5C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RR6zX6M5PzrS03;
	Thu, 17 Aug 2023 09:36:24 +0800 (CST)
Received: from [10.67.103.231] (10.67.103.231) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 17 Aug 2023 09:37:46 +0800
Message-ID: <15c26edc-eb4f-a90c-d52c-dd532c9d12ea@huawei.com>
Date: Thu, 17 Aug 2023 09:37:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] soc: kunpeng_hccs: fix some sparse warnings about
 incorrect type
To: Arnd Bergmann <arnd@arndb.de>, <xuwei5@hisilicon.com>, Arnd Bergmann
	<arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <liuyonglong@huawei.com>,
	<lihuisong@huawei.com>
References: <20230815125233.65469-1-lihuisong@huawei.com>
 <74f99c2f-fd9d-4cb9-a541-b699b79b928c@app.fastmail.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <74f99c2f-fd9d-4cb9-a541-b699b79b928c@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.231]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected


在 2023/8/16 21:17, Arnd Bergmann 写道:
> On Tue, Aug 15, 2023, at 14:52, Huisong Li wrote:
>> @@ -199,8 +200,8 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
>>   			     struct hccs_desc *desc)
>>   {
>>   	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
>> -	struct acpi_pcct_shared_memory *comm_base = cl_info->pcc_comm_addr;
>> -	void *comm_space = (void *)(comm_base + 1);
>> +	void __iomem *comm_space = (u8 *)cl_info->pcc_comm_addr +
>> +					sizeof(struct acpi_pcct_shared_memory);
>>   	struct hccs_fw_inner_head *fw_inner_head;
>>   	struct acpi_pcct_shared_memory tmp = {0};
>>   	u16 comm_space_size;
> The cast still looks wrong, while both comm_space and ->pcc_comm_addr
> are __iomem pointers, casting to a non-__iomem u8 pointer should
> still produce that warning. I'd suggest casting to (u8 __iomem *)
> or (void __iomem *), I assume you still need a cast here to get
> the correct address.
Thanks Arnd.

You are right. So I modify it by dropping (u8 *) here in patch v2.
Please take a look at this again.
If it is ok for you, can you apply this patch to soc/soc.git?

/Huisong
