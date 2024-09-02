Return-Path: <SRS0=ieK5=QA=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83250CA0ED3
	for <soc@archiver.kernel.org>; Mon,  2 Sep 2024 07:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 558D8C4CEC6; Mon,  2 Sep 2024 07:51:30 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBBF6C4CEC2;
	Mon,  2 Sep 2024 07:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBBF6C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wy1CD5W8nzyRM5;
	Mon,  2 Sep 2024 15:50:48 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 7880018010A;
	Mon,  2 Sep 2024 15:51:24 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 2 Sep
 2024 15:51:23 +0800
Message-ID: <66D56E7B.9040502@hisilicon.com>
Date: Mon, 2 Sep 2024 15:51:23 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Huisong Li <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzk@kernel.org>,
	<Jonathan.Cameron@Huawei.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <xuwei5@hisilicon.com>
Subject: Re: [PATCH v3 0/6] Add some features and bugfix for kunpeng_hccs
References: <20240828104956.20214-1-lihuisong@huawei.com>
In-Reply-To: <20240828104956.20214-1-lihuisong@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500014.china.huawei.com (7.221.188.63)

Hi Huisong,

On 2024/8/28 18:49, Huisong Li wrote:
> This series is aimed to support the low power feature and add used
> HCCS types sysfs. And fix some bugfix to harden codes by the way.
> 
> ---
>  v3:
>   - add Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>.
>   - drop 'none' string print according to Jonathan's suggestion.
>   - early return in hccs_wait_serdes_adapt_completed.
>   - fix commit log in patch[2/6], patch[3/6] and patch[5/6]
> 
>  v2:
>   - remove "this patch" words in commit log suggested by Krzyszto.
>   - use for_each_set_bit to replace the cycle scanning all HCCS IP.
>   - add a patch to rename the 'lane_mode' to 'max_lane_num' to make it
>     easy to see.
>   - add doc description into the code patch.
>   - rename the name of the low power interface.
>   - adjust the increasing and decreasing lane interface description.
>   - do not create available_inc_dec_lane_types when no HCCS type support
>     low power.
> ---
> 
> Huisong Li (6):
>   soc: hisilicon: kunpeng_hccs: Fix a PCC typo
>   soc: hisilicon: kunpeng_hccs: Return failure on having not die or port
>     information
>   soc: hisilicon: kunpeng_hccs: Add the check for base address and size
>     of shared memory
>   soc: hisilicon: kunpeng_hccs: Fix the 'lane_mode' field name in port
>     info structure to 'max_lane_num'
>   soc: hisilicon: kunpeng_hccs: Add used HCCS types sysfs
>   soc: hisilicon: kunpeng_hccs: Support low power feature for the
>     specified HCCS type
> 
>  .../sysfs-devices-platform-kunpeng_hccs       |  45 ++
>  drivers/soc/hisilicon/Kconfig                 |   7 +-
>  drivers/soc/hisilicon/kunpeng_hccs.c          | 514 +++++++++++++++++-
>  drivers/soc/hisilicon/kunpeng_hccs.h          |  33 +-
>  4 files changed, 580 insertions(+), 19 deletions(-)
> 

Thanks!
Series applied to the Hisilicon driver tree.
But it is already rc6, maybe I will send the PR in the next cycle if no conflict.

Best Regards,
Wei
