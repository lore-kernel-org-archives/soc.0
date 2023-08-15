Return-Path: <SRS0=D9Mn=EA=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678A2C001DB
	for <soc@archiver.kernel.org>; Tue, 15 Aug 2023 12:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 265D2C433C9; Tue, 15 Aug 2023 12:55:33 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24944C433C7;
	Tue, 15 Aug 2023 12:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24944C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RQB4Y0Q1tzFqdL;
	Tue, 15 Aug 2023 20:52:29 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 15 Aug 2023 20:55:25 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>, <arnd@arndb.de>, <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <liuyonglong@huawei.com>,
	<lihuisong@huawei.com>
Subject: [PATCH] soc: kunpeng_hccs: fix some sparse warnings about incorrect type
Date: Tue, 15 Aug 2023 20:52:33 +0800
Message-ID: <20230815125233.65469-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected

This patch fixes some sparse warnings about incorrect type.
The address about PCC communication space should use '__iomem' tag.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308151142.dH5Muhva-lkp@intel.com/
Fixes: 886bdf9c883b ("soc: hisilicon: Support HCCS driver on Kunpeng SoC")
Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 13 +++++++------
 drivers/soc/hisilicon/kunpeng_hccs.h |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index 0d6f6bacd3f6..4e94753ab0f7 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -156,8 +156,8 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
 	}
 
 	if (pcc_chan->shmem_base_addr) {
-		cl_info->pcc_comm_addr = (void __force *)ioremap(
-			pcc_chan->shmem_base_addr, pcc_chan->shmem_size);
+		cl_info->pcc_comm_addr = ioremap(pcc_chan->shmem_base_addr,
+						 pcc_chan->shmem_size);
 		if (!cl_info->pcc_comm_addr) {
 			dev_err(dev, "Failed to ioremap PCC communication region for channel-%d.\n",
 				hdev->chan_id);
@@ -177,7 +177,8 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
 static int hccs_check_chan_cmd_complete(struct hccs_dev *hdev)
 {
 	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
-	struct acpi_pcct_shared_memory *comm_base = cl_info->pcc_comm_addr;
+	struct acpi_pcct_shared_memory __iomem *comm_base =
+							cl_info->pcc_comm_addr;
 	u16 status;
 	int ret;
 
@@ -199,8 +200,8 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
 			     struct hccs_desc *desc)
 {
 	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
-	struct acpi_pcct_shared_memory *comm_base = cl_info->pcc_comm_addr;
-	void *comm_space = (void *)(comm_base + 1);
+	void __iomem *comm_space = (u8 *)cl_info->pcc_comm_addr +
+					sizeof(struct acpi_pcct_shared_memory);
 	struct hccs_fw_inner_head *fw_inner_head;
 	struct acpi_pcct_shared_memory tmp = {0};
 	u16 comm_space_size;
@@ -212,7 +213,7 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
 	tmp.command = cmd;
 	/* Clear cmd complete bit */
 	tmp.status = 0;
-	memcpy_toio(comm_base, (void *)&tmp,
+	memcpy_toio(cl_info->pcc_comm_addr, (void *)&tmp,
 			sizeof(struct acpi_pcct_shared_memory));
 
 	/* Copy the message to the PCC comm space */
diff --git a/drivers/soc/hisilicon/kunpeng_hccs.h b/drivers/soc/hisilicon/kunpeng_hccs.h
index 9d71fb78443f..6012d2776028 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.h
+++ b/drivers/soc/hisilicon/kunpeng_hccs.h
@@ -50,7 +50,7 @@ struct hccs_mbox_client_info {
 	struct mbox_chan *mbox_chan;
 	struct pcc_mbox_chan *pcc_chan;
 	u64 deadline_us;
-	void *pcc_comm_addr;
+	void __iomem *pcc_comm_addr;
 };
 
 struct hccs_dev {
-- 
2.33.0

