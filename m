Return-Path: <SRS0=QTUT=ZI=huawei.com=john.garry@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B919ECAAA1
	for <soc@archiver.kernel.org>; Mon,  5 Sep 2022 08:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12A69C433B5; Mon,  5 Sep 2022 08:29:41 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D86BC433D6
	for <soc@kernel.org>; Mon,  5 Sep 2022 08:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D86BC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MLhWC4KbTz6889W;
	Mon,  5 Sep 2022 16:28:55 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 10:29:36 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 09:29:34 +0100
From: John Garry <john.garry@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <linuxarm@huawei.com>,
	<rafael.j.wysocki@intel.com>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>, <yangyingliang@huawei.com>, John Garry
	<john.garry@huawei.com>
Subject: [PATCH v3 5/5] bus: hisi_lpc: Use platform_device_register_full()
Date: Mon, 5 Sep 2022 16:23:06 +0800
Message-ID: <1662366186-233933-6-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1662366186-233933-1-git-send-email-john.garry@huawei.com>
References: <1662366186-233933-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500003.china.huawei.com (7.191.162.67)
X-CFilter-Loop: Reflected

The code to create the child platform device is essentially the same as
what platform_device_register_full() does, so change over to use
that same function to reduce duplication.

Signed-off-by: John Garry <john.garry@huawei.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/bus/hisi_lpc.c | 68 ++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
index 74f4448bff9d..5b65a48f17e7 100644
--- a/drivers/bus/hisi_lpc.c
+++ b/drivers/bus/hisi_lpc.c
@@ -472,9 +472,7 @@ static int hisi_lpc_acpi_clear_enumerated(struct acpi_device *adev, void *not_us
 
 struct hisi_lpc_acpi_cell {
 	const char *hid;
-	const char *name;
-	void *pdata;
-	size_t pdata_size;
+	const struct platform_device_info *pdevinfo;
 };
 
 static void hisi_lpc_acpi_remove(struct device *hostdev)
@@ -505,28 +503,45 @@ static int hisi_lpc_acpi_add_child(struct acpi_device *child, void *data)
 		/* ipmi */
 		{
 			.hid = "IPI0001",
-			.name = "hisi-lpc-ipmi",
+			.pdevinfo = (struct platform_device_info []) {
+				{
+					.parent = hostdev,
+					.fwnode = acpi_fwnode_handle(child),
+					.name = "hisi-lpc-ipmi",
+					.id = PLATFORM_DEVID_AUTO,
+					.res = res,
+					.num_res = num_res,
+				},
+			},
 		},
 		/* 8250-compatible uart */
 		{
 			.hid = "HISI1031",
-			.name = "serial8250",
-			.pdata = (struct plat_serial8250_port []) {
+			.pdevinfo = (struct platform_device_info []) {
 				{
-					.iobase = res->start,
-					.uartclk = 1843200,
-					.iotype = UPIO_PORT,
-					.flags = UPF_BOOT_AUTOCONF,
+					.parent = hostdev,
+					.fwnode = acpi_fwnode_handle(child),
+					.name = "serial8250",
+					.id = PLATFORM_DEVID_AUTO,
+					.res = res,
+					.num_res = num_res,
+					.data = (struct plat_serial8250_port []) {
+						{
+							.iobase = res->start,
+							.uartclk = 1843200,
+							.iotype = UPIO_PORT,
+							.flags = UPF_BOOT_AUTOCONF,
+						},
+						{}
+					},
+					.size_data =  2 * sizeof(struct plat_serial8250_port),
 				},
-				{}
 			},
-			.pdata_size = 2 *
-				sizeof(struct plat_serial8250_port),
 		},
 		{}
 	};
 
-	for (; cell && cell->name; cell++) {
+	for (; cell && cell->hid; cell++) {
 		if (!strcmp(cell->hid, hid)) {
 			found = true;
 			break;
@@ -540,31 +555,12 @@ static int hisi_lpc_acpi_add_child(struct acpi_device *child, void *data)
 		return 0;
 	}
 
-	pdev = platform_device_alloc(cell->name, PLATFORM_DEVID_AUTO);
-	if (!pdev)
-		return -ENOMEM;
-
-	pdev->dev.parent = hostdev;
-	ACPI_COMPANION_SET(&pdev->dev, child);
-
-	ret = platform_device_add_resources(pdev, res, num_res);
-	if (ret)
-		goto fail;
-
-	ret = platform_device_add_data(pdev, cell->pdata, cell->pdata_size);
-	if (ret)
-		goto fail;
-
-	ret = platform_device_add(pdev);
-	if (ret)
-		goto fail;
+	pdev = platform_device_register_full(cell->pdevinfo);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
 
 	acpi_device_set_enumerated(child);
 	return 0;
-
-fail:
-	platform_device_put(pdev);
-	return ret;
 }
 
 /*
-- 
2.35.3

