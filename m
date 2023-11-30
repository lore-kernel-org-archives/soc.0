Return-Path: <SRS0=fqXu=HL=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5597AC10F04
	for <soc@archiver.kernel.org>; Thu, 30 Nov 2023 13:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A0C4C433C9; Thu, 30 Nov 2023 13:45:58 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BE65C433C8;
	Thu, 30 Nov 2023 13:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9BE65C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm000004.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Sgy9t0Gw8zWj0x;
	Thu, 30 Nov 2023 21:45:06 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 kwepemm000004.china.huawei.com (7.193.23.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 21:45:51 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<arnd@arndb.de>, <krzk@kernel.org>, <sudeep.holla@arm.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 2/4] soc: hisilicon: kunpeng_hccs: Add failure log for no _CRS method
Date: Thu, 30 Nov 2023 21:45:48 +0800
Message-ID: <20231130134550.33398-3-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20231130134550.33398-1-lihuisong@huawei.com>
References: <20231109054526.27270-1-lihuisong@huawei.com>
 <20231130134550.33398-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000004.china.huawei.com (7.193.23.18)
X-CFilter-Loop: Reflected

Driver gets the PCC channel id by using the PCC GAS in _CRS.
But, currently, if the firmware has no _CRS method on platform, there
is not any failure log. So this patch adds the log for this.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index dad6235dbf1a..fd3ca0eb8175 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -85,8 +85,10 @@ static int hccs_get_pcc_chan_id(struct hccs_dev *hdev)
 	struct hccs_register_ctx ctx = {0};
 	acpi_status status;
 
-	if (!acpi_has_method(handle, METHOD_NAME__CRS))
+	if (!acpi_has_method(handle, METHOD_NAME__CRS)) {
+		dev_err(hdev->dev, "No _CRS method.\n");
 		return -ENODEV;
+	}
 
 	ctx.dev = hdev->dev;
 	status = acpi_walk_resources(handle, METHOD_NAME__CRS,
-- 
2.33.0

