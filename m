Return-Path: <SRS0=QTUT=ZI=huawei.com=john.garry@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16391ECAAA1
	for <soc@archiver.kernel.org>; Mon,  5 Sep 2022 08:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2D07C43470; Mon,  5 Sep 2022 08:29:37 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D5CEC433C1
	for <soc@kernel.org>; Mon,  5 Sep 2022 08:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D5CEC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MLhRM6Pwlz688sr;
	Mon,  5 Sep 2022 16:25:35 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 10:29:34 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 09:29:31 +0100
From: John Garry <john.garry@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <linuxarm@huawei.com>,
	<rafael.j.wysocki@intel.com>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>, <yangyingliang@huawei.com>, John Garry
	<john.garry@huawei.com>
Subject: [PATCH v3 4/5] bus: hisi_lpc: Don't guard ACPI IDs with ACPI_PTR()
Date: Mon, 5 Sep 2022 16:23:05 +0800
Message-ID: <1662366186-233933-5-git-send-email-john.garry@huawei.com>
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

The OF ID table is not guarded, and the ACPI table does not needs it either.
The IDs do not depend on the configuration. Hence drop ACPI_PTR() from the
code and move ID table closer to its user.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/bus/hisi_lpc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
index a6513a571d7b..74f4448bff9d 100644
--- a/drivers/bus/hisi_lpc.c
+++ b/drivers/bus/hisi_lpc.c
@@ -589,11 +589,6 @@ static int hisi_lpc_acpi_probe(struct device *hostdev)
 
 	return ret;
 }
-
-static const struct acpi_device_id hisi_lpc_acpi_match[] = {
-	{"HISI0191"},
-	{}
-};
 #else
 static int hisi_lpc_acpi_probe(struct device *dev)
 {
@@ -688,11 +683,16 @@ static const struct of_device_id hisi_lpc_of_match[] = {
 	{}
 };
 
+static const struct acpi_device_id hisi_lpc_acpi_match[] = {
+	{"HISI0191"},
+	{}
+};
+
 static struct platform_driver hisi_lpc_driver = {
 	.driver = {
 		.name           = DRV_NAME,
 		.of_match_table = hisi_lpc_of_match,
-		.acpi_match_table = ACPI_PTR(hisi_lpc_acpi_match),
+		.acpi_match_table = hisi_lpc_acpi_match,
 	},
 	.probe = hisi_lpc_probe,
 	.remove = hisi_lpc_remove,
-- 
2.35.3

