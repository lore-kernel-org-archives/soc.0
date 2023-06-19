Return-Path: <SRS0=Va33=CH=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003D3EB64D9
	for <soc@archiver.kernel.org>; Mon, 19 Jun 2023 06:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BDB7BC433C9; Mon, 19 Jun 2023 06:32:47 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A94AC433C0;
	Mon, 19 Jun 2023 06:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6A94AC433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ql0H208B5zMpTc;
	Mon, 19 Jun 2023 14:29:34 +0800 (CST)
Received: from [10.67.103.231] (10.67.103.231) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 19 Jun 2023 14:32:40 +0800
Message-ID: <e253c3a2-4f56-38f1-0eaa-0b506d4cd18a@huawei.com>
Date: Mon, 19 Jun 2023 14:32:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/2] soc: hisilicon: Support HCCS driver on Kunpeng SoC
To: <andersson@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <shawnguo@kernel.org>,
	<arnd@arndb.de>, <krzk@kernel.org>, <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<wanghuiqiang@huawei.com>, <tanxiaofei@huawei.com>, <liuyonglong@huawei.com>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230530112746.2767-1-lihuisong@huawei.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20230530112746.2767-1-lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.231]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected

Hi all,

Kindly ping.


在 2023/5/30 19:27, Huisong Li 写道:
> This series add HCCS driver to query the health status and port information
> of HCCS on Kunpeng SoC as well as document all sysfs entries provided by
> this driver.
>
> ---
>   v3:
>    - replace "using_status" with "enable" attribute.
>    - fix some comments in codes.
>
> ---
>   v2:
>    - Document all sysfs entries provided by driver.
>    - drop 'pcc_type' and 'intr_mode' in struct hccs_dev.
>    - using _CRS with PCC GAS to get channel ID instead of _DSD.
>    - replace readw_relaxed_poll_timeout with readw_poll_timeout.
>    - use sysfs_emit() instead of sprintf().
>    - drop ACPI_PTR in hccs_driver.
>    - drop useless log during the probe phase.
>
> Huisong Li (2):
>    soc: hisilicon: Support HCCS driver on Kunpeng SoC
>    doc: soc: hisilicon: Add Kunpeng HCCS driver documentation
>
>   .../sysfs-devices-platform-kunpeng_hccs       |   76 +
>   MAINTAINERS                                   |    7 +
>   drivers/soc/Kconfig                           |    1 +
>   drivers/soc/Makefile                          |    1 +
>   drivers/soc/hisilicon/Kconfig                 |   19 +
>   drivers/soc/hisilicon/Makefile                |    2 +
>   drivers/soc/hisilicon/kunpeng_hccs.c          | 1288 +++++++++++++++++
>   drivers/soc/hisilicon/kunpeng_hccs.h          |  196 +++
>   8 files changed, 1590 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
>   create mode 100644 drivers/soc/hisilicon/Kconfig
>   create mode 100644 drivers/soc/hisilicon/Makefile
>   create mode 100644 drivers/soc/hisilicon/kunpeng_hccs.c
>   create mode 100644 drivers/soc/hisilicon/kunpeng_hccs.h
>
