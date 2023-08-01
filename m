Return-Path: <SRS0=PQgt=DS=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4EAC001DE
	for <soc@archiver.kernel.org>; Tue,  1 Aug 2023 01:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCBBAC433C9; Tue,  1 Aug 2023 01:30:36 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19A30C433C7;
	Tue,  1 Aug 2023 01:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19A30C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RFHXG1z7cztRl9;
	Tue,  1 Aug 2023 09:27:10 +0800 (CST)
Received: from [10.67.103.231] (10.67.103.231) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 09:30:30 +0800
Message-ID: <d7da8a14-6d37-1e6f-6db2-fb57a68a9b12@huawei.com>
Date: Tue, 1 Aug 2023 09:30:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 1/2] soc: hisilicon: Support HCCS driver on Kunpeng SoC
To: Randy Dunlap <rdunlap@infradead.org>, <xuwei5@hisilicon.com>,
	<arnd@arndb.de>, <krzk@kernel.org>, <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wanghuiqiang@huawei.com>,
	<tanxiaofei@huawei.com>, <liuyonglong@huawei.com>, <lihuisong@huawei.com>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230729082632.43224-1-lihuisong@huawei.com>
 <20230729082632.43224-2-lihuisong@huawei.com>
 <fcf22ecc-858a-43d2-9b4b-78e3bc02ef68@infradead.org>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <fcf22ecc-858a-43d2-9b4b-78e3bc02ef68@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.231]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected


在 2023/7/30 6:43, Randy Dunlap 写道:
> Hi--
>
> On 7/29/23 01:26, Huisong Li wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d73c9e97a237..c9e302c3ff48 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9488,6 +9488,12 @@ S:	Maintained
>>   F:	Documentation/ABI/testing/debugfs-hisi-zip
>>   F:	drivers/crypto/hisilicon/zip/
>>   
> This new entry should be between
> HISILICON I2C CONTROLLER DRIVER
> and
> HISILICON LPC BUS DRIVER
> to keep the MAINTAINERS file in alphabetical order.
ok, will fix in v6. thanks.
>> +HISILICON KUNPENG SOC HCCS DRIVER
>> +M:	Huisong Li <lihuisong@huawei.com>
>> +S:	Maintained
>> +F:	drivers/soc/hisilicon/kunpeng_hccs.c
>> +F:	drivers/soc/hisilicon/kunpeng_hccs.h
>> +
>>   HMM - Heterogeneous Memory Management
>>   M:	Jérôme Glisse <jglisse@redhat.com>
>>   L:	linux-mm@kvack.org
>> diff --git a/drivers/soc/hisilicon/Kconfig b/drivers/soc/hisilicon/Kconfig
>> new file mode 100644
>> index 000000000000..73a99b8156c9
>> --- /dev/null
>> +++ b/drivers/soc/hisilicon/Kconfig
>> @@ -0,0 +1,20 @@
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
>> +	  The Huawei Cache Coherence System (HCCS) is a multi-chip
>> +	  interconnection bus protocol.
>> +	  The performance of application may be affected if some hccs
> s/hccs/HCCS/ for consistency.
Ack
>
>> +	  ports are not in full lane status, have a large number of CRC
>> +	  errors and so on.
>> +
>> +	  Say M here if you want to include support for querying the
>> +	  health status and port information of HCCS on Kunpeng SoC.
> thanks.
>
