Return-Path: <SRS0=2Cpl=BG=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E025C77B7A
	for <soc@archiver.kernel.org>; Wed, 17 May 2023 11:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A274C433D2; Wed, 17 May 2023 11:35:38 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7FD9C433EF;
	Wed, 17 May 2023 11:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7FD9C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4QLrXB2BPkz18LWR;
	Wed, 17 May 2023 19:31:06 +0800 (CST)
Received: from [10.67.103.231] (10.67.103.231) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 19:35:25 +0800
Message-ID: <5ca49494-5a0c-4dc8-9cf5-fc4bc3b8e1b2@huawei.com>
Date: Wed, 17 May 2023 19:35:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] soc: hisilicon: Support HCCS driver on Kunpeng SoC
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Shawn Guo <shawnguo@kernel.org>,
	<linux-kernel@vger.kernel.org>, <soc@kernel.org>, <wanghuiqiang@huawei.com>,
	<tanxiaofei@huawei.com>, <liuyonglong@huawei.com>, <huangdaode@huawei.com>,
	<linux-acpi@vger.kernel.org>, Len Brown <lenb@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230425103040.znv66k364ant6klq@bogus>
 <c7d9c3c5-e400-c60a-52e0-0f267ec8c517@huawei.com>
 <20230425131918.5tf5vot4h7jf54xk@bogus>
 <db6c713c-f99c-fa3f-8d38-9a5d50889cc2@huawei.com>
 <20230515130807.pdvx7bxwjkfdsmsr@bogus>
 <aa5b1919-74c6-1f97-78af-ab5f0904c3ce@huawei.com>
 <20230516122931.il4ai7fyxdo5gsff@bogus>
 <f0733521-2557-fdaf-e59b-b10d515c487c@huawei.com>
 <20230516143530.venhj4gax6stinah@bogus>
 <a98e3620-57da-000e-f5ee-2c2e47e97906@huawei.com>
 <20230517093033.4jvwjxuoeic46a24@bogus>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20230517093033.4jvwjxuoeic46a24@bogus>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.231]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected


在 2023/5/17 17:30, Sudeep Holla 写道:
> On Wed, May 17, 2023 at 03:16:12PM +0800, lihuisong (C) wrote:
>
> [...]
>
>> No. I want to use this flag to make compability between different platforms.
>> This driver only use PCC OpRegion to access to the channel if platform
>> support use PCC OpRegion.
> What do you mean by that ? It is not correct. If there is a PCC Opregion,
> then you need to make it work with drivers/acpi/acpi_pcc.c
>
> You need to have all the other details in the firmware(ASL). By looking
> at the driver, it has no connection to PCC Opregion IMO unless I am missing
> something.
Driver just needs to call these APIs, such as acpi_evaluate_integer(), 
if want to use PCC OpRegion.
I know that. I have tested PCC OpRegion before.
You've completely misunderstood what I said.😅

I mean that this driver plans to support both PCC and PCC OpRegion.
For example,
Platform A: this driver use PCC (as the current implementation)
Platform B: this driver use PCC OpRegion (Currently, this patch does not 
implement it, but it may be available in the future.)
Note:
This driver selects only one of them (PCC and PCC OpRegion) to 
communicate with firmware on one platform.
We use one bit in device-flags to know which one this driver will use.

I'm not sure if you can understand what I mean by saing that.
If you're not confused about this now, can you reply to my last email 
again?😁
>
