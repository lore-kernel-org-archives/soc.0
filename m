Return-Path: <SRS0=eIL7=HT=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9141EC4167B
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 07:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BAF7C433C7; Fri,  8 Dec 2023 07:18:42 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3542C433C8;
	Fri,  8 Dec 2023 07:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3542C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemd100008.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Smj7n1PYYzsRnN;
	Fri,  8 Dec 2023 15:14:45 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd100008.china.huawei.com
 (7.221.188.193) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1258.28; Fri, 8 Dec
 2023 15:18:34 +0800
Message-ID: <6572C34A.7010101@hisilicon.com>
Date: Fri, 8 Dec 2023 15:18:34 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Huisong Li <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<arnd@arndb.de>, <krzk@kernel.org>, <sudeep.holla@arm.com>,
	<liuyonglong@huawei.com>, <xuwei5@hisilicon.com>
Subject: Re: [PATCH v3 0/5] soc: hisilicon: kunpeng_hccs: Support the platform
 with PCC type3 and interrupt ack
References: <20231109054526.27270-1-lihuisong@huawei.com> <20231201034534.7276-1-lihuisong@huawei.com>
In-Reply-To: <20231201034534.7276-1-lihuisong@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd100008.china.huawei.com (7.221.188.193)
X-CFilter-Loop: Reflected

Hi Huisong,

On 2023/12/1 11:45, Huisong Li wrote:
> The main purpose of this series is to support the platform with PCC type3
> and interrupt ack. At the same time, this series also fix some clean codes
> and modify the incorrect email domain name.
> 
> ---
>  v3:
>   - remove inline tag of two wait_cmd_complete function.
>   - delete variable 'ret' in hccs_wait_cmd_complete_by_irq()
>   - add a new patch which fix incorrect email domain name in document.
> 
>  v2:
>   - using a version specific structure to replace device version according
>     to Jonathan's advice.
>   - add a new patch that remove an unused blank line.
> 
> Huisong Li (5):
>   soc: hisilicon: kunpeng_hccs: Fix some incorrect format strings
>   soc: hisilicon: kunpeng_hccs: Add failure log for no _CRS method
>   soc: hisilicon: kunpeng_hccs: Remove an unused blank line
>   doc: kunpeng_hccs: Fix incorrect email domain name
>   soc: hisilicon: kunpeng_hccs: Support the platform with PCC type3 and
>     interrupt ack
> 
>  .../sysfs-devices-platform-kunpeng_hccs       |   6 +-
>  drivers/soc/hisilicon/kunpeng_hccs.c          | 152 ++++++++++++++----
>  drivers/soc/hisilicon/kunpeng_hccs.h          |  15 ++
>  3 files changed, 137 insertions(+), 36 deletions(-)
> 

Thanks!
Series applied to the HiSilicon driver tree.

Best Regards,
Wei
