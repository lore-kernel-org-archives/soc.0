Return-Path: <SRS0=QpUT=FE=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAF9CE79B0
	for <soc@archiver.kernel.org>; Wed, 20 Sep 2023 06:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4B7AC43395; Wed, 20 Sep 2023 06:50:31 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 935ADC433C8;
	Wed, 20 Sep 2023 06:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 935ADC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Rr8Fz1Yb8zMlgF;
	Wed, 20 Sep 2023 14:46:47 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 20 Sep 2023 14:50:21 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <rafael@kernel.org>, <rafael.j.wysocki@intel.com>, <sudeep.holla@arm.com>,
	<xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 2/2] soc: kunpeng_hccs: add the check for PCC subspace type
Date: Wed, 20 Sep 2023 14:47:03 +0800
Message-ID: <20230920064703.23543-3-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230920064703.23543-1-lihuisong@huawei.com>
References: <20230914115753.9064-1-lihuisong@huawei.com>
 <20230920064703.23543-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected

Currently, HCCS driver directly uses Generic Communications Channel Shared
Memory Region which is used in type0/1/2 to communicate with platform,
but actually doesn't support type3/4/5.
So this patch adds the check for PCC subspace type.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index f3810d9d1caa..4ba3bfd45a01 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -174,6 +174,19 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
 	return rc;
 }
 
+static int hccs_check_pcc_info(struct hccs_dev *hdev)
+{
+	struct pcc_mbox_chan *pcc_chan = hdev->cl_info.pcc_chan;
+
+	if (pcc_chan->type >= ACPI_PCCT_TYPE_EXT_PCC_MASTER_SUBSPACE) {
+		dev_err(hdev->dev, "unsupport for subspace type%u.\n",
+			pcc_chan->type);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int hccs_check_chan_cmd_complete(struct hccs_dev *hdev)
 {
 	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
@@ -1224,6 +1237,10 @@ static int hccs_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
+	rc = hccs_check_pcc_info(hdev);
+	if (rc)
+		goto unregister_pcc_chan;
+
 	rc = hccs_get_dev_caps(hdev);
 	if (rc)
 		goto unregister_pcc_chan;
-- 
2.33.0

