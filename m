Return-Path: <SRS0=tXOV=HJ=huawei.com=jonathan.cameron@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01634C4167B
	for <soc@archiver.kernel.org>; Tue, 28 Nov 2023 15:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BBF31C433C7; Tue, 28 Nov 2023 15:25:25 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7759BC433CB;
	Tue, 28 Nov 2023 15:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7759BC433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SfmV86ksKz6D8YZ;
	Tue, 28 Nov 2023 23:25:04 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id EF23E140C98;
	Tue, 28 Nov 2023 23:25:21 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 Nov
 2023 15:25:21 +0000
Date: Tue, 28 Nov 2023 15:25:20 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Huisong Li <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <arnd@arndb.de>, <krzk@kernel.org>,
	<sudeep.holla@arm.com>, <liuyonglong@huawei.com>
Subject: Re: [PATCH v1 1/3] soc: hisilicon: kunpeng_hccs: Fix some incorrect
 format strings
Message-ID: <20231128152520.00007766@Huawei.com>
In-Reply-To: <20231109054526.27270-2-lihuisong@huawei.com>
References: <20231109054526.27270-1-lihuisong@huawei.com>
	<20231109054526.27270-2-lihuisong@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Thu, 9 Nov 2023 13:45:24 +0800
Huisong Li <lihuisong@huawei.com> wrote:

> Fix some incorrect format strings.
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>
These are indeed all unsigned.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
