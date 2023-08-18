Return-Path: <SRS0=VFTi=ED=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F23C71132
	for <soc@archiver.kernel.org>; Fri, 18 Aug 2023 01:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 407B0C433C7; Fri, 18 Aug 2023 01:39:05 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6BE5C433C8;
	Fri, 18 Aug 2023 01:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6BE5C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RRkyT4BfPz1GDHl;
	Fri, 18 Aug 2023 09:37:37 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemm600004.china.huawei.com
 (7.193.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 09:38:59 +0800
Message-ID: <584734f7-3eb7-961f-10a2-3707cf03819c@huawei.com>
Date: Fri, 18 Aug 2023 09:38:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] soc: kunpeng_hccs: fix some sparse warnings about
 incorrect type
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <liuyonglong@huawei.com>,
	<xuwei5@hisilicon.com>, <lihuisong@huawei.com>
References: <20230815125233.65469-1-lihuisong@huawei.com>
 <74f99c2f-fd9d-4cb9-a541-b699b79b928c@app.fastmail.com>
 <15c26edc-eb4f-a90c-d52c-dd532c9d12ea@huawei.com>
 <4f72b1d7-00b4-4318-b3c3-50d11e4a233c@app.fastmail.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <4f72b1d7-00b4-4318-b3c3-50d11e4a233c@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected


在 2023/8/17 19:54, Arnd Bergmann 写道:
> On Thu, Aug 17, 2023, at 03:37, lihuisong (C) wrote:
>> 在 2023/8/16 21:17, Arnd Bergmann 写道:
>>> On Tue, Aug 15, 2023, at 14:52, Huisong Li wrote:
>>>> @@ -199,8 +200,8 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
>>>>    			     struct hccs_desc *desc)
>>>>    {
>>>>    	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
>>>> -	struct acpi_pcct_shared_memory *comm_base = cl_info->pcc_comm_addr;
>>>> -	void *comm_space = (void *)(comm_base + 1);
>>>> +	void __iomem *comm_space = (u8 *)cl_info->pcc_comm_addr +
>>>> +					sizeof(struct acpi_pcct_shared_memory);
>>>>    	struct hccs_fw_inner_head *fw_inner_head;
>>>>    	struct acpi_pcct_shared_memory tmp = {0};
>>>>    	u16 comm_space_size;
>>> The cast still looks wrong, while both comm_space and ->pcc_comm_addr
>>> are __iomem pointers, casting to a non-__iomem u8 pointer should
>>> still produce that warning. I'd suggest casting to (u8 __iomem *)
>>> or (void __iomem *), I assume you still need a cast here to get
>>> the correct address.
>> Thanks Arnd.
>>
>> You are right. So I modify it by dropping (u8 *) here in patch v2.
>> Please take a look at this again.
> Right, if pcc_comm_addr is already a u8 __iomem* or void*, that
> works, I though the cast was needed since it points to a larger
> object, which would throw off the calculation.
This pcc_comm_addr is already defined "void __iomem *" type in patch v2.
So that works well, right?

/Huisong
>
>> If it is ok for you, can you apply this patch to soc/soc.git?
> Yes, of course.
>
>         Arnd
> .
