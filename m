Return-Path: <SRS0=vybe=LI=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99814CD128D
	for <soc@archiver.kernel.org>; Wed,  3 Apr 2024 08:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A4A6C43394; Wed,  3 Apr 2024 08:27:10 +0000 (UTC)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06F43C43390
	for <soc@kernel.org>; Wed,  3 Apr 2024 08:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06F43C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4V8d7y2YQxz1R8dx;
	Wed,  3 Apr 2024 16:24:14 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 52D0918001A;
	Wed,  3 Apr 2024 16:27:00 +0800 (CST)
Received: from localhost.localdomain (10.28.79.22) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 16:26:59 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH 1/2] soc: hisilicon: kunpeng_hccs: Add the check for obtaining complete port attribute
Date: Wed, 3 Apr 2024 16:19:34 +0800
Message-ID: <20240403081935.24308-2-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20240403081935.24308-1-lihuisong@huawei.com>
References: <20240403081935.24308-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.79.22]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600004.china.huawei.com (7.193.23.242)

The hccs_get_all_port_attr() is used to obtained the attribute of all
ports on a specified DIE from firmware. However, this interface doesn't
ensure whether firmware reports the complete attribute of all ports or not.
So this patch adds the check for this.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index 9ff70b38e5e9..bb69a95b5f2d 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -556,6 +556,12 @@ static int hccs_get_all_port_attr(struct hccs_dev *hdev,
 		start_id = rsp_head.next_id;
 	}
 
+	if (left_buf_len != 0) {
+		dev_err(hdev->dev, "do not get the expected port number(%u) attribute.\n",
+			size);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.22.0

