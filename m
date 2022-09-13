Return-Path: <SRS0=lB4r=ZQ=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F4DECAAA1
	for <soc@archiver.kernel.org>; Tue, 13 Sep 2022 01:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97274C433D7; Tue, 13 Sep 2022 01:47:40 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6FAAC433C1
	for <soc@kernel.org>; Tue, 13 Sep 2022 01:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6FAAC433C1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MRR9M1P5ZznVFq;
	Tue, 13 Sep 2022 09:44:55 +0800 (CST)
Received: from [10.67.102.125] (10.67.102.125) by
 kwepemi500011.china.huawei.com (7.221.188.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 09:47:34 +0800
Message-ID: <631FE136.6020409@hisilicon.com>
Date: Tue, 13 Sep 2022 09:47:34 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <linuxarm@huawei.com>,
	<rafael.j.wysocki@intel.com>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>, <yangyingliang@huawei.com>, <xuwei5@hisilicon.com>
Subject: Re: [PATCH v3 0/5] Misc hisi_lpc changes
References: <1662366186-233933-1-git-send-email-john.garry@huawei.com>
In-Reply-To: <1662366186-233933-1-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.125]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi John,

On 2022/9/5 16:23, John Garry wrote:
> Hi Xu Wei,
> 
> This is a series of small improvements to the driver from Andy
> and myself.
> 
> Andy sent his patches originally in the following:
> https://lore.kernel.org/lkml/20220708210859.6774-1-andriy.shevchenko@linux.intel.com/
> 
> Please consider sending through the arm-soc tree for v6.1 .
> 
> Based on v6.0-rc3.
> 
> Differences to v2:
> - Fix handling of platform_device_register_full() error (Andy)
> - Add Andy's RB tag (thanks!)
> 
> Differences to v1:
> - remove blank lines in patch 5/5, as requested by Andy
> 
> Thanks,
> John
> 
> Andy Shevchenko (4):
>   bus: hisi_lpc: Don't dereference fwnode handle
>   bus: hisi_lpc: Use devm_platform_ioremap_resource
>   bus: hisi_lpc: Correct error code for timeout
>   bus: hisi_lpc: Don't guard ACPI IDs with ACPI_PTR()
> 
> John Garry (1):
>   bus: hisi_lpc: Use platform_device_register_full()
> 
>  drivers/bus/hisi_lpc.c | 96 +++++++++++++++++++-----------------------
>  1 file changed, 44 insertions(+), 52 deletions(-)
> 

Thanks!
Series applied to the hisilicon driver tree.

Best Regards,
Wei
