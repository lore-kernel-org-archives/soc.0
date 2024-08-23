Return-Path: <SRS0=IwrI=PW=huawei.com=jonathan.cameron@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FB1C531DC
	for <soc@archiver.kernel.org>; Fri, 23 Aug 2024 09:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1C49C4AF09; Fri, 23 Aug 2024 09:02:19 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 765DEC32786;
	Fri, 23 Aug 2024 09:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 765DEC32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wqv9v5MG3z6FH3P;
	Fri, 23 Aug 2024 16:58:27 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 561FB140594;
	Fri, 23 Aug 2024 17:02:12 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 23 Aug
 2024 10:02:11 +0100
Date: Fri, 23 Aug 2024 10:02:11 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Huisong Li <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzk@kernel.org>,
	<wanghuiqiang@huawei.com>, <liuyonglong@huawei.com>
Subject: Re: [PATCH v2 0/6] Add some features and bugfix for kunpeng_hccs
Message-ID: <20240823100211.00002b9d@Huawei.com>
In-Reply-To: <20240823031059.32579-1-lihuisong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
	<20240823031059.32579-1-lihuisong@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Fri, 23 Aug 2024 11:10:53 +0800
Huisong Li <lihuisong@huawei.com> wrote:

> This series are intended to support the low power feature for specified
> HCCS and add used HCCS types sysfs. In addition, fix some bugfix and
> enhance some codes.

Quick process thing.  Don't send a v2 like this in reply to v1
(for most kernel subsystems anyway, maybe there are some that request
this?).

Most people still review in email clients and they often start at latest
and work back until they run out of time.  Thus a reply to an earlier
thread is not read!

Jonathan

> 
> ---
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
>  drivers/soc/hisilicon/kunpeng_hccs.c          | 516 +++++++++++++++++-
>  drivers/soc/hisilicon/kunpeng_hccs.h          |  33 +-
>  4 files changed, 582 insertions(+), 19 deletions(-)
> 

