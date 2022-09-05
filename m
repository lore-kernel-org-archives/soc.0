Return-Path: <SRS0=QTUT=ZI=huawei.com=john.garry@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10CAECAAD5
	for <soc@archiver.kernel.org>; Mon,  5 Sep 2022 08:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84A67C4347C; Mon,  5 Sep 2022 08:29:35 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 063BCC433D6
	for <soc@kernel.org>; Mon,  5 Sep 2022 08:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 063BCC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MLhW00wsrz67xLp;
	Mon,  5 Sep 2022 16:28:44 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 10:29:24 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 09:29:22 +0100
From: John Garry <john.garry@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <linuxarm@huawei.com>,
	<rafael.j.wysocki@intel.com>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>, <yangyingliang@huawei.com>, John Garry
	<john.garry@huawei.com>
Subject: [PATCH v3 0/5] Misc hisi_lpc changes
Date: Mon, 5 Sep 2022 16:23:01 +0800
Message-ID: <1662366186-233933-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500003.china.huawei.com (7.191.162.67)
X-CFilter-Loop: Reflected

Hi Xu Wei,

This is a series of small improvements to the driver from Andy
and myself.

Andy sent his patches originally in the following:
https://lore.kernel.org/lkml/20220708210859.6774-1-andriy.shevchenko@linux.intel.com/

Please consider sending through the arm-soc tree for v6.1 .

Based on v6.0-rc3.

Differences to v2:
- Fix handling of platform_device_register_full() error (Andy)
- Add Andy's RB tag (thanks!)

Differences to v1:
- remove blank lines in patch 5/5, as requested by Andy

Thanks,
John

Andy Shevchenko (4):
  bus: hisi_lpc: Don't dereference fwnode handle
  bus: hisi_lpc: Use devm_platform_ioremap_resource
  bus: hisi_lpc: Correct error code for timeout
  bus: hisi_lpc: Don't guard ACPI IDs with ACPI_PTR()

John Garry (1):
  bus: hisi_lpc: Use platform_device_register_full()

 drivers/bus/hisi_lpc.c | 96 +++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 52 deletions(-)

-- 
2.35.3

