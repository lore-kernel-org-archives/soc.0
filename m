Return-Path: <SRS0=QTUT=ZI=huawei.com=john.garry@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5683EC6FA89
	for <soc@archiver.kernel.org>; Mon,  5 Sep 2022 08:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C1D6C433B5; Mon,  5 Sep 2022 08:29:37 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13755C43470
	for <soc@kernel.org>; Mon,  5 Sep 2022 08:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13755C43470
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MLhW21NTCz68562;
	Mon,  5 Sep 2022 16:28:46 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 10:29:26 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 09:29:24 +0100
From: John Garry <john.garry@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <linuxarm@huawei.com>,
	<rafael.j.wysocki@intel.com>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>, <yangyingliang@huawei.com>, John Garry
	<john.garry@huawei.com>
Subject: [PATCH v3 1/5] bus: hisi_lpc: Don't dereference fwnode handle
Date: Mon, 5 Sep 2022 16:23:02 +0800
Message-ID: <1662366186-233933-2-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1662366186-233933-1-git-send-email-john.garry@huawei.com>
References: <1662366186-233933-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500003.china.huawei.com (7.191.162.67)
X-CFilter-Loop: Reflected

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Use dev_fwnode() and acpi_fwnode_handle() instead of dereferencing
an fwnode handle directly, which is a better coding practice.

While at it, reuse fwnode instead of ACPI_COMPANION().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/bus/hisi_lpc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
index 2e564803e786..6d432a07cbba 100644
--- a/drivers/bus/hisi_lpc.c
+++ b/drivers/bus/hisi_lpc.c
@@ -347,7 +347,7 @@ static int hisi_lpc_acpi_xlat_io_res(struct acpi_device *adev,
 	unsigned long sys_port;
 	resource_size_t len = resource_size(res);
 
-	sys_port = logic_pio_trans_hwaddr(&host->fwnode, res->start, len);
+	sys_port = logic_pio_trans_hwaddr(acpi_fwnode_handle(host), res->start, len);
 	if (sys_port == ~0UL)
 		return -EFAULT;
 
@@ -615,7 +615,6 @@ static void hisi_lpc_acpi_remove(struct device *hostdev)
 static int hisi_lpc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct acpi_device *acpi_device = ACPI_COMPANION(dev);
 	struct logic_pio_hwaddr *range;
 	struct hisi_lpc_dev *lpcdev;
 	resource_size_t io_end;
@@ -637,7 +636,7 @@ static int hisi_lpc_probe(struct platform_device *pdev)
 	if (!range)
 		return -ENOMEM;
 
-	range->fwnode = dev->fwnode;
+	range->fwnode = dev_fwnode(dev);
 	range->flags = LOGIC_PIO_INDIRECT;
 	range->size = PIO_INDIRECT_SIZE;
 	range->hostdata = lpcdev;
@@ -651,7 +650,7 @@ static int hisi_lpc_probe(struct platform_device *pdev)
 	}
 
 	/* register the LPC host PIO resources */
-	if (acpi_device)
+	if (is_acpi_device_node(range->fwnode))
 		ret = hisi_lpc_acpi_probe(dev);
 	else
 		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
@@ -672,11 +671,10 @@ static int hisi_lpc_probe(struct platform_device *pdev)
 static int hisi_lpc_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct acpi_device *acpi_device = ACPI_COMPANION(dev);
 	struct hisi_lpc_dev *lpcdev = dev_get_drvdata(dev);
 	struct logic_pio_hwaddr *range = lpcdev->io_host;
 
-	if (acpi_device)
+	if (is_acpi_device_node(range->fwnode))
 		hisi_lpc_acpi_remove(dev);
 	else
 		of_platform_depopulate(dev);
-- 
2.35.3

