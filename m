Return-Path: <SRS0=2Cpl=BG=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4041C7EE2C
	for <soc@archiver.kernel.org>; Wed, 17 May 2023 07:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B662AC433D2; Wed, 17 May 2023 07:16:24 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB4F1C433EF;
	Wed, 17 May 2023 07:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB4F1C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QLkqn6T5WzsSbZ;
	Wed, 17 May 2023 15:14:13 +0800 (CST)
Received: from [10.67.103.231] (10.67.103.231) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 15:16:13 +0800
Message-ID: <a98e3620-57da-000e-f5ee-2c2e47e97906@huawei.com>
Date: Wed, 17 May 2023 15:16:12 +0800
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
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <e0c4f4b5-8b34-4542-b676-f98ddb8ef586@app.fastmail.com>
 <20230425103040.znv66k364ant6klq@bogus>
 <c7d9c3c5-e400-c60a-52e0-0f267ec8c517@huawei.com>
 <20230425131918.5tf5vot4h7jf54xk@bogus>
 <db6c713c-f99c-fa3f-8d38-9a5d50889cc2@huawei.com>
 <20230515130807.pdvx7bxwjkfdsmsr@bogus>
 <aa5b1919-74c6-1f97-78af-ab5f0904c3ce@huawei.com>
 <20230516122931.il4ai7fyxdo5gsff@bogus>
 <f0733521-2557-fdaf-e59b-b10d515c487c@huawei.com>
 <20230516143530.venhj4gax6stinah@bogus>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20230516143530.venhj4gax6stinah@bogus>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.231]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected


在 2023/5/16 22:35, Sudeep Holla 写道:
> On Tue, May 16, 2023 at 10:13:58PM +0800, lihuisong (C) wrote:
> [...]
>
>> But I still need the device-flags to report if use PCC operation Region.
>> If so I have to dig one address register from comm subspace, right?
> [...]
>
>> Thanks for you bringing it up.
>> Indeed, this HCCS_DEV_FLAGS_INTR_B is not good.
>> I'm going to replace it with PCC operation Region flag.
> >From the above 2, I am getting a sense that all these flags dance is for
> sharing a PCC subspace ID between this driver and the firmware PCC Opregion ?
No. I want to use this flag to make compability between different platforms.
This driver only use PCC OpRegion to access to the channel if platform 
support use PCC OpRegion.
Driver must select one of them (PCC and PCC OpRegion) to communicate 
with firmware on one platform.
> If so that may not work as the current implementation of PCC Opregion
> assumes the exclusive access to the channel. Since it is initialised
> quite early, Opregion must succeed to get the mbox channel acquired and
> this driver must fail if they are sharing the channel. Making the sharing
> across firmware and this driver may need changes in the PCC Opregion
Only using PCC OpRegion after requesting and releasing PCC channel 
shouldn't change PCC OpRegion code?
> support code. One possible way is to acquire and release the channel for
> each transaction which will be definitely overhead.
Yes, transaction will be definitely overhead.
The following method should be no such problem.
-->
If driver want to obtain other info by RegisterAddress and offset in PCC 
Register(),
driver generally needs to do it as follows:
1> get channel ID and RegisterAddress and offset.
2> call pcc_mbox_request_channel to acquire the channel.
3> ioremap 'shmem_base_addr' to get 'pcc_comm_addr'
4> obtain other info based on RegisterAddress, offset and 'pcc_comm_addr'.
If driver selects PCC OpRegion method, driver may also need to release 
this PCC channel by calling pcc_mbox_free_channel.
Because this channel will be requested when PCC OpRegion method is 
executed for the first time.


Overall, the above process is a bit cumbersome if this driver only use 
PCC OpRegion.
In addition, I have to dig one address from comm space in share memory,
which will cause the available size of comm space to decrease, right?
So it is better to use other way to do get channel ID and other info if 
it is possible.
What do you think?
>
