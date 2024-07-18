Return-Path: <SRS0=OPox=OS=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7C7C41513
	for <soc@archiver.kernel.org>; Thu, 18 Jul 2024 07:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB6FBC4AF0F; Thu, 18 Jul 2024 07:20:50 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41822C116B1
	for <soc@kernel.org>; Thu, 18 Jul 2024 07:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41822C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WPkfr66wBz1HFMT;
	Thu, 18 Jul 2024 15:18:12 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 45F721A0188;
	Thu, 18 Jul 2024 15:20:47 +0800 (CST)
Received: from localhost.localdomain (10.28.79.22) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 15:20:46 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH 2/5] soc: hisilicon: kunpeng_hccs: return failure on having not die or port information
Date: Thu, 18 Jul 2024 15:11:31 +0800
Message-ID: <20240718071134.31155-3-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20240718071134.31155-1-lihuisong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.79.22]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600004.china.huawei.com (7.193.23.242)

Driver is useless if all die number or all port number obtained from
firmware are zero. So this patch return failure in this case.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index c4a57328f22a..6e88f597f267 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -451,6 +451,7 @@ static int hccs_query_all_die_info_on_platform(struct hccs_dev *hdev)
 	struct device *dev = hdev->dev;
 	struct hccs_chip_info *chip;
 	struct hccs_die_info *die;
+	bool has_die_info = false;
 	u8 i, j;
 	int ret;
 
@@ -459,6 +460,7 @@ static int hccs_query_all_die_info_on_platform(struct hccs_dev *hdev)
 		if (!chip->die_num)
 			continue;
 
+		has_die_info = true;
 		chip->dies = devm_kzalloc(hdev->dev,
 				chip->die_num * sizeof(struct hccs_die_info),
 				GFP_KERNEL);
@@ -480,7 +482,7 @@ static int hccs_query_all_die_info_on_platform(struct hccs_dev *hdev)
 		}
 	}
 
-	return 0;
+	return has_die_info ? 0 : -EINVAL;
 }
 
 static int hccs_get_bd_info(struct hccs_dev *hdev, u8 opcode,
@@ -601,6 +603,7 @@ static int hccs_query_all_port_info_on_platform(struct hccs_dev *hdev)
 	struct device *dev = hdev->dev;
 	struct hccs_chip_info *chip;
 	struct hccs_die_info *die;
+	bool has_port_info = false;
 	u8 i, j;
 	int ret;
 
@@ -611,6 +614,7 @@ static int hccs_query_all_port_info_on_platform(struct hccs_dev *hdev)
 			if (!die->port_num)
 				continue;
 
+			has_port_info = true;
 			die->ports = devm_kzalloc(dev,
 				die->port_num * sizeof(struct hccs_port_info),
 				GFP_KERNEL);
@@ -629,7 +633,7 @@ static int hccs_query_all_port_info_on_platform(struct hccs_dev *hdev)
 		}
 	}
 
-	return 0;
+	return has_port_info ? 0 : -EINVAL;
 }
 
 static int hccs_get_hw_info(struct hccs_dev *hdev)
-- 
2.22.0

