Return-Path: <SRS0=EqKn=PW=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16A2C5472E
	for <soc@archiver.kernel.org>; Fri, 23 Aug 2024 03:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8414DC4AF1D; Fri, 23 Aug 2024 03:21:00 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF8C3C4AF12;
	Fri, 23 Aug 2024 03:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF8C3C4AF12
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WqlZz0tQYzQp7G;
	Fri, 23 Aug 2024 11:16:11 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 11DE4180106;
	Fri, 23 Aug 2024 11:20:55 +0800 (CST)
Received: from localhost.localdomain (10.28.79.22) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 11:20:54 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzk@kernel.org>,
	<Jonathan.Cameron@Huawei.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 3/6] soc: hisilicon: kunpeng_hccs: Add the check for base address and size of shared memory
Date: Fri, 23 Aug 2024 11:10:56 +0800
Message-ID: <20240823031059.32579-4-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20240823031059.32579-1-lihuisong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
 <20240823031059.32579-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.79.22]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600004.china.huawei.com (7.193.23.242)

If the shmem_base_addr from PCCT is zero, hccs_register_pcc_channel will
return success. And then driver will access to illegal address when send
PCC command. In addition, the size of shared memory used for communication
between driver and platform is fixed, namely 64 Bytes which is
unchangeable. So add the verification for them.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index 6e88f597f267..6055e5091cbd 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -170,15 +170,21 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
 		goto err_mbx_channel_free;
 	}
 
-	if (pcc_chan->shmem_base_addr) {
-		cl_info->pcc_comm_addr = ioremap(pcc_chan->shmem_base_addr,
-						 pcc_chan->shmem_size);
-		if (!cl_info->pcc_comm_addr) {
-			dev_err(dev, "Failed to ioremap PCC communication region for channel-%u.\n",
-				hdev->chan_id);
-			rc = -ENOMEM;
-			goto err_mbx_channel_free;
-		}
+	if (!pcc_chan->shmem_base_addr ||
+	    pcc_chan->shmem_size != HCCS_PCC_SHARE_MEM_BYTES) {
+		dev_err(dev, "The base address or size (%llu) of PCC communication region is invalid.\n",
+			pcc_chan->shmem_size);
+		rc = -EINVAL;
+		goto err_mbx_channel_free;
+	}
+
+	cl_info->pcc_comm_addr = ioremap(pcc_chan->shmem_base_addr,
+					 pcc_chan->shmem_size);
+	if (!cl_info->pcc_comm_addr) {
+		dev_err(dev, "Failed to ioremap PCC communication region for channel-%u.\n",
+			hdev->chan_id);
+		rc = -ENOMEM;
+		goto err_mbx_channel_free;
 	}
 
 	return 0;
-- 
2.22.0

