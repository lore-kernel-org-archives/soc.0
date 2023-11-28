Return-Path: <SRS0=tXOV=HJ=huawei.com=jonathan.cameron@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42492C4167B
	for <soc@archiver.kernel.org>; Tue, 28 Nov 2023 15:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10452C433C9; Tue, 28 Nov 2023 15:22:29 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2EC7FC433C8;
	Tue, 28 Nov 2023 15:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2EC7FC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SfmQm6lFjz6D8YL;
	Tue, 28 Nov 2023 23:22:08 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id F06551408FF;
	Tue, 28 Nov 2023 23:22:25 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 Nov
 2023 15:22:25 +0000
Date: Tue, 28 Nov 2023 15:22:24 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Huisong Li <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <arnd@arndb.de>, <krzk@kernel.org>,
	<sudeep.holla@arm.com>, <liuyonglong@huawei.com>
Subject: Re: [PATCH v1 2/3] soc: hisilicon: kunpeng_hccs: Add failure log
 for no _CRS method
Message-ID: <20231128152224.00002bd8@Huawei.com>
In-Reply-To: <20231109054526.27270-3-lihuisong@huawei.com>
References: <20231109054526.27270-1-lihuisong@huawei.com>
	<20231109054526.27270-3-lihuisong@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Thu, 9 Nov 2023 13:45:25 +0800
Huisong Li <lihuisong@huawei.com> wrote:

> Driver gets the PCC channel id by using the PCC GAS in _CRS.
> But, currently, if the firmware has no _CRS method on platform, there
> is not any failure log. So this patch adds the log for this.
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>
Make sense to me.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
