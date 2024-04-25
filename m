Return-Path: <SRS0=2Wdg=L6=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584EBC4345F
	for <soc@archiver.kernel.org>; Thu, 25 Apr 2024 11:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 400A4C113CE; Thu, 25 Apr 2024 11:16:21 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73D6FC113CC
	for <soc@kernel.org>; Thu, 25 Apr 2024 11:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73D6FC113CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VQCrc4F3rzwTQh;
	Thu, 25 Apr 2024 19:13:04 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 780821401E9;
	Thu, 25 Apr 2024 19:16:16 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Thu, 25 Apr
 2024 19:16:15 +0800
Message-ID: <662A3B7F.4060003@hisilicon.com>
Date: Thu, 25 Apr 2024 19:16:15 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Huisong Li <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<liuyonglong@huawei.com>
Subject: Re: [PATCH v2 0/2] soc: hisilicon: kunpeng_hccs: add dependency and
 enhance verification
References: <20240403081935.24308-1-lihuisong@huawei.com> <20240417094801.25393-1-lihuisong@huawei.com>
In-Reply-To: <20240417094801.25393-1-lihuisong@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500014.china.huawei.com (7.221.188.63)

Hi Huisong,

On 2024/4/17 17:47, Huisong Li wrote:
> Add PCC dependency and enhance verification during the probe phase.
> 
> ---
>  v2: fix the log on failure.
> 
> Huisong Li (2):
>   soc: hisilicon: kunpeng_hccs: Add the check for obtaining complete
>     port attribute
>   soc: hisilicon: kunpeng_hccs: replace MAILBOX dependency with PCC
> 
>  drivers/soc/hisilicon/Kconfig        | 2 +-
>  drivers/soc/hisilicon/kunpeng_hccs.c | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 

Thanks!
Series applied to the HiSilicon driver tree with minor changes in the commit msg:
https://github.com/hisilicon/linux-hisi/tree/next/drivers

Best Regards,
Wei
