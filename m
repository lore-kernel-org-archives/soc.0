Return-Path: <SRS0=Ed/2=ZE=huawei.com=john.garry@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1914ECAAD3
	for <soc@archiver.kernel.org>; Thu,  1 Sep 2022 11:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8246FC433D6; Thu,  1 Sep 2022 11:21:12 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07AF8C433C1
	for <soc@kernel.org>; Thu,  1 Sep 2022 11:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07AF8C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MJJVy0QByz67dHc;
	Thu,  1 Sep 2022 19:20:26 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 13:21:00 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 1 Sep 2022 12:20:58 +0100
From: John Garry <john.garry@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <linuxarm@huawei.com>,
	<rafael.j.wysocki@intel.com>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>, <yangyingliang@huawei.com>, John Garry
	<john.garry@huawei.com>
Subject: [PATCH 0/5] Misc hisi_lpc changes
Date: Thu, 1 Sep 2022 19:14:26 +0800
Message-ID: <1662030871-182688-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500003.china.huawei.com (7.191.162.67)
X-CFilter-Loop: Reflected

Hi Xu Wei,

This is a series of small improvements to the driver from Andy
and myself.

Andy sent his patches originally in the following:
https://lore.kernel.org/lkml/20220708210859.6774-1-andriy.shevchenko@linux.intel.com/

Please consider sending through the arm-soc tree for v6.1 .

Based on v6.0-rc3.

Thanks,
John

Andy Shevchenko (4):
  bus: hisi_lpc: Don't dereference fwnode handle
  bus: hisi_lpc: Use devm_platform_ioremap_resource
  bus: hisi_lpc: Correct error code for timeout
  bus: hisi_lpc: Don't guard ACPI IDs with ACPI_PTR()

John Garry (1):
  bus: hisi_lpc: Use platform_device_register_full()

 drivers/bus/hisi_lpc.c | 98 +++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 50 deletions(-)

-- 
2.35.3

