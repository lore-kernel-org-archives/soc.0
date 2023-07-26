Return-Path: <SRS0=Ajvy=DM=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C83C001E0
	for <soc@archiver.kernel.org>; Wed, 26 Jul 2023 09:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D511C433C9; Wed, 26 Jul 2023 09:48:19 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34304C433C7;
	Wed, 26 Jul 2023 09:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34304C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R9psF1lGfzNmTw;
	Wed, 26 Jul 2023 17:44:49 +0800 (CST)
Received: from [10.67.103.231] (10.67.103.231) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 17:48:11 +0800
Message-ID: <f4a50436-4409-0bde-429f-f01e54e6fccc@huawei.com>
Date: Wed, 26 Jul 2023 17:48:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RESEND v3 1/2] soc: hisilicon: Support HCCS driver on
 Kunpeng SoC
To: Randy Dunlap <rdunlap@infradead.org>, <xuwei5@hisilicon.com>,
	<arnd@arndb.de>, <krzk@kernel.org>, <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wanghuiqiang@huawei.com>,
	<tanxiaofei@huawei.com>, <liuyonglong@huawei.com>, <lihuisong@huawei.com>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230725075706.48939-1-lihuisong@huawei.com>
 <20230725075706.48939-2-lihuisong@huawei.com>
 <d35eddd6-0089-bbe8-c2f9-416941dcbed6@infradead.org>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <d35eddd6-0089-bbe8-c2f9-416941dcbed6@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.231]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected

Hi Randy Dunlap,

many thanks for reviewing my patch.


在 2023/7/25 23:28, Randy Dunlap 写道:
> Hi--
>
> On 7/25/23 00:57, Huisong Li wrote:
>> diff --git a/drivers/soc/hisilicon/Kconfig b/drivers/soc/hisilicon/Kconfig
>> new file mode 100644
>> index 000000000000..87a1f15cbedb
>> --- /dev/null
>> +++ b/drivers/soc/hisilicon/Kconfig
>> @@ -0,0 +1,19 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +menu "Hisilicon SoC drivers"
>> +	depends on ARCH_HISI || COMPILE_TEST
>> +
>> +config KUNPENG_HCCS
>> +	tristate "HCCS driver on Kunpeng SoC"
>> +	depends on ACPI
>> +	depends on ARM64 || COMPILE_TEST
>> +	help
>> +	  The Huawei Cache-Coherent System (HCCS) is a bus protocol standard
> Just curious: what makes it a standard?
HCCS is just a self-defined bus protocol and used for multi-chip 
interconnection.
The description above doesn't seem appropriate.
I will fix these releated description in next version.
>
>> +	  for ensuring cache coherent on HiSilicon SoC. The performance of
> 	                     coherence
Ack, thanks.
>
>> +	  the application may be affected if some hccs ports are in non-full
> 	                                          HCCS
HCCS is a bus protocol, it should be all capitals.
And hccs port is an abstraction object in code layer here.
So maybe it is ok here. what do you think?

Best regards,
Huisong
