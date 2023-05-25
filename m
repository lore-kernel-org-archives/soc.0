Return-Path: <SRS0=Z7LC=BO=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539A6C77B7E
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 08:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D7D0C4339E; Thu, 25 May 2023 08:13:01 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C00EC433D2;
	Thu, 25 May 2023 08:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C00EC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QRgjG6mK4zYslL;
	Thu, 25 May 2023 16:10:42 +0800 (CST)
Received: from [10.67.103.231] (10.67.103.231) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:12:50 +0800
Message-ID: <5e0d81c8-5f52-82e5-5509-785e87a9a17e@huawei.com>
Date: Thu, 25 May 2023 16:12:50 +0800
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
 <b29eab0c-4084-0e91-3e31-7f7c264ad629@huawei.com>
 <20230525073539.waaa7wpudohullcg@bogus>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20230525073539.waaa7wpudohullcg@bogus>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.231]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected


在 2023/5/25 15:35, Sudeep Holla 写道:
> On Thu, May 25, 2023 at 10:41:51AM +0800, lihuisong (C) wrote:
>> Hi Sudeep,
>>
>> Here, the interface is used to determine whether a port is in use or
>> enabled.
>> If we just use 'status', it cannot inidicates its own meaning by name.
>> What do you think?
>>
> How about "port_status" or "port-status" ?
The meaning of this status is a little board.
How about 'enable'? just a read-only entry.


In addition, I happen to have another problem when replace ioremap() 
with acpi_os_ioremap().

The driver selects 'M' in .config to compile.
The driver cannot be compiled if we use acpi_os_ioremap().
The compiling log is as follows:
-->
make -j80
   CALL    scripts/checksyscalls.sh
   CC [M]  drivers/soc/hisilicon/kunpeng_hccs.o
   MODPOST Module.symvers
ERROR: modpost: "acpi_os_ioremap" 
[drivers/soc/hisilicon/kunpeng_hccs.ko] undefined!
scripts/Makefile.modpost:136: recipe for target 'Module.symvers' failed
make[1]: *** [Module.symvers] Error 1
Makefile:1978: recipe for target 'modpost' failed
make: *** [modpost] Error 2

The driver can be compiled if we selects 'Y' or export symbol for 
acpi_os_ioremap.
So we have to export symbol for acpi_os_ioremap.
I plan to do it in another patch, and not in this series in case of 
blocking the upload of this driver.
What do you think?
