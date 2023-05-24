Return-Path: <SRS0=g95U=BN=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F69BC77B7A
	for <soc@archiver.kernel.org>; Wed, 24 May 2023 09:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C612BC4339B; Wed, 24 May 2023 09:37:10 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30C7CC433D2;
	Wed, 24 May 2023 09:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30C7CC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4QR5Z61K5gz18LhL;
	Wed, 24 May 2023 17:32:30 +0800 (CST)
Received: from [10.67.103.231] (10.67.103.231) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 17:36:58 +0800
Message-ID: <b0a08101-2f20-825a-5120-6662e1436821@huawei.com>
Date: Wed, 24 May 2023 17:36:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] soc: hisilicon: Support HCCS driver on Kunpeng SoC
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
CC: <andersson@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <shawnguo@kernel.org>,
	<arnd@arndb.de>, <krzk@kernel.org>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>, <wanghuiqiang@huawei.com>, <tanxiaofei@huawei.com>,
	<liuyonglong@huawei.com>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230522072211.8894-1-lihuisong@huawei.com>
 <20230522072211.8894-2-lihuisong@huawei.com>
 <20230523093922.f2y4wrz3vkzi7kmw@bogus>
 <928a893b-6596-8d40-ce0e-80059a363d11@huawei.com>
 <20230523134135.jkkhcwfihflp775m@bogus>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20230523134135.jkkhcwfihflp775m@bogus>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.231]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected


在 2023/5/23 21:41, Sudeep Holla 写道:
> On Tue, May 23, 2023 at 07:57:42PM +0800, lihuisong (C) wrote:
>> 在 2023/5/23 17:39, Sudeep Holla 写道:
>>> On Mon, May 22, 2023 at 03:22:10PM +0800, Huisong Li wrote:
>>>> The Huawei Cache-Coherent System (HCCS) is a bus protocol standard
>>>> for ensuring cache coherent on HiSilicon SoC. The performance of
>>>> the application may be affected if some hccs ports are in non-full
>>>> lane status, have a large number of CRC errors and so on.
>>>>
>>>> This driver provides the query interface of the health status and
>>>> port information of HCCS on Kunpeng SoC.
>>>>
>>>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
>>>> ---
>>>>    MAINTAINERS                          |    6 +
>>>>    drivers/soc/Kconfig                  |    1 +
>>>>    drivers/soc/Makefile                 |    1 +
>>>>    drivers/soc/hisilicon/Kconfig        |   19 +
>>>>    drivers/soc/hisilicon/Makefile       |    2 +
>>>>    drivers/soc/hisilicon/kunpeng_hccs.c | 1287 ++++++++++++++++++++++++++
>>>>    drivers/soc/hisilicon/kunpeng_hccs.h |  196 ++++
>>>>    7 files changed, 1512 insertions(+)
>>>>    create mode 100644 drivers/soc/hisilicon/Kconfig
>>>>    create mode 100644 drivers/soc/hisilicon/Makefile
>>>>    create mode 100644 drivers/soc/hisilicon/kunpeng_hccs.c
>>>>    create mode 100644 drivers/soc/hisilicon/kunpeng_hccs.h
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index eddbc48c61e9..fe0e796e8445 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -9399,6 +9399,12 @@ S:	Maintained
>>>>    W:	http://www.hisilicon.com
>>>>    F:	drivers/spi/spi-hisi-sfc-v3xx.c
>>>> +HISILICON KUNPENG SOC HCCS DRIVER
>>> s/HCCS/HCCS INFO or QUERY/ ?
>>  From the current features, what you suggest is suitable.
>> But this driver will support to the setting feature.
> Ah OK, I wasn't aware of that, in that case it is fine to keep it as is
> and add comment about future feature expansions so that the name makes
It's not suitable to add it in advance.
> more sense them. I assumed it is more a query interface.
Yes, most of them are query interfaces.
>
> I also assume the settings with just control performance and is fully
> safe and stability of the system is taken care.
Yes, it will has an impact on performance and power consumption, but not 
functionality.
>
> [...]
>
>>>> +
>>>> +/* PCC defines */
>>>> +#define HCCS_PCC_SIGNATURE_MASK		0x50434300
>>>> +#define HCCS_PCC_STATUS_CMD_COMPLETE	BIT(0)
>>> I am not really sure if we keep duplicating this. I will try to cook up
>>> a patch consolidating these.
>> Yes, these info is better placed in a global header.
>> Do I need to do this in this series?
>> Or do not modify it, and then process all related code in your patch.
> Fair enough, we can do that later. I don't want to block this for that reason.
ok, thanks. will send v3 ASAP.
>
