Return-Path: <SRS0=6Rm9=BL=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67144C77B73
	for <soc@archiver.kernel.org>; Mon, 22 May 2023 07:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29092C4339C; Mon, 22 May 2023 07:24:08 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4693C433D2;
	Mon, 22 May 2023 07:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4693C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QPpj65rVNzTkkX;
	Mon, 22 May 2023 15:19:06 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 15:24:01 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <andersson@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <shawnguo@kernel.org>,
	<arnd@arndb.de>, <krzk@kernel.org>, <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<wanghuiqiang@huawei.com>, <tanxiaofei@huawei.com>, <liuyonglong@huawei.com>,
	<lihuisong@huawei.com>
Subject: [PATCH v2 0/2] soc: hisilicon: Support HCCS driver on Kunpeng SoC 
Date: Mon, 22 May 2023 15:22:09 +0800
Message-ID: <20230522072211.8894-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230424073020.4039-1-lihuisong@huawei.com>
References: <20230424073020.4039-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected

This series add HCCS driver to query the health status and port information
of HCCS on Kunpeng SoC as well as document all sysfs entries provided by
this driver.

---
 v2:
  - Document all sysfs entries provided by driver.
  - drop 'pcc_type' and 'intr_mode' in struct hccs_dev.
  - using _CRS with PCC GAS to get channel ID instead of _DSD.
  - replace readw_relaxed_poll_timeout with readw_poll_timeout.
  - use sysfs_emit() instead of sprintf().
  - drop ACPI_PTR in hccs_driver.
  - drop useless log during the probe phase.

Huisong Li (2):
  soc: hisilicon: Support HCCS driver on Kunpeng SoC
  doc: soc: hisilicon: Add Kunpeng HCCS driver documentation

 .../sysfs-devices-platform-kunpeng_hccs       |   76 +
 MAINTAINERS                                   |    7 +
 drivers/soc/Kconfig                           |    1 +
 drivers/soc/Makefile                          |    1 +
 drivers/soc/hisilicon/Kconfig                 |   19 +
 drivers/soc/hisilicon/Makefile                |    2 +
 drivers/soc/hisilicon/kunpeng_hccs.c          | 1287 +++++++++++++++++
 drivers/soc/hisilicon/kunpeng_hccs.h          |  196 +++
 8 files changed, 1589 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
 create mode 100644 drivers/soc/hisilicon/Kconfig
 create mode 100644 drivers/soc/hisilicon/Makefile
 create mode 100644 drivers/soc/hisilicon/kunpeng_hccs.c
 create mode 100644 drivers/soc/hisilicon/kunpeng_hccs.h

-- 
2.33.0

