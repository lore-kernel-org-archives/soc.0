Return-Path: <SRS0=QGPE=BE=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB8EC7EE22
	for <soc@archiver.kernel.org>; Mon, 15 May 2023 03:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E459C4339B; Mon, 15 May 2023 03:37:43 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B07ECC433EF;
	Mon, 15 May 2023 03:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B07ECC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QKQ1B0yRpzTkhP;
	Mon, 15 May 2023 11:32:46 +0800 (CST)
Received: from [10.67.103.231] (10.67.103.231) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 11:37:30 +0800
Message-ID: <e92558e2-f371-27f4-a030-04efe840cda8@huawei.com>
Date: Mon, 15 May 2023 11:37:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] soc: hisilicon: Support HCCS driver on Kunpeng SoC
From: "lihuisong (C)" <lihuisong@huawei.com>
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
In-Reply-To: <db6c713c-f99c-fa3f-8d38-9a5d50889cc2@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.231]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected


在 2023/5/4 21:16, lihuisong (C) 写道:
>
> 在 2023/4/25 21:19, Sudeep Holla 写道:
>> On Tue, Apr 25, 2023 at 09:00:31PM +0800, lihuisong (C) wrote:
>>> For firmware, DSD way is simpler and easier to manage these virtual 
>>> platform
>>> devices, and it's an usual way in kernel.
>> Any specific examples you are referring here. We had lots of debate when
>> DSD was introduced. It must be used only when there is no standard ACPI
>> way to achieve the same. But in this I don't (yet) think that is the 
>> case.
>> Further "simplicity" is remotely not the reason why you must use DSD.
>> So until you provide me technical reasons as why _CRS can't work, I
>> have to NACK this approach. DSD in this case seems like pure hack.
>>
>>> Driver only needs to get a fixed value, like pcc-id and type, here.
>>>
>> Yes and _CRS is used to get similar such properties in ACPI. It includes
>> normally MMIO and interrupts and since GAS supports PCC and _CRS can
>> contain GAS, you must simply use that.
> Hi Sudeep,
>
> I'm tring to use CRS with GAS to report PCC channel ID and get other 
> informations driver need by address.
> I found a way to obtain the generic register information according to 
> "Referencing the PCC address space" in ACPI spec.
> And driver also get the PCC generic register information successfully.
>
> But I don't know how to set and use the address in PCC register.
> Where should this address come from?
> It seems that ACPI spec is not very detailed about this.
> Do you have any suggestions?
>
> On the other hand, we think that System Memory space + method can also 
> achieve above goal.
> What do you think of that?
>
>
Hi Sudeep,

Can you give us some suggestions about above question and idea?

Looking forward to your reply.

/Huisong
