Return-Path: <SRS0=Kl+F=LW=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB395C04FF9
	for <soc@archiver.kernel.org>; Wed, 17 Apr 2024 09:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBDA4C4AF09; Wed, 17 Apr 2024 09:55:45 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2276CC32781
	for <soc@kernel.org>; Wed, 17 Apr 2024 09:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2276CC32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VKGSF5T5nzNp2s;
	Wed, 17 Apr 2024 17:53:17 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 74D391403D3;
	Wed, 17 Apr 2024 17:55:41 +0800 (CST)
Received: from localhost.localdomain (10.28.79.22) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 17:55:40 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 2/2] soc: hisilicon: kunpeng_hccs: replace MAILBOX dependency with PCC
Date: Wed, 17 Apr 2024 17:48:01 +0800
Message-ID: <20240417094801.25393-3-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20240417094801.25393-1-lihuisong@huawei.com>
References: <20240403081935.24308-1-lihuisong@huawei.com>
 <20240417094801.25393-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.79.22]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600004.china.huawei.com (7.193.23.242)

The kunpeng_hccs driver depands on Platform Communication Channel Driver.
If PCC driver is not enabled, this driver fails to probe.
Seeing as how PCC driver depands on MAILBOX. so replace MAILBOX dependency
with PCC.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/soc/hisilicon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/hisilicon/Kconfig b/drivers/soc/hisilicon/Kconfig
index 0ab688af308f..4b0a099b28cc 100644
--- a/drivers/soc/hisilicon/Kconfig
+++ b/drivers/soc/hisilicon/Kconfig
@@ -6,7 +6,7 @@ menu "Hisilicon SoC drivers"
 config KUNPENG_HCCS
 	tristate "HCCS driver on Kunpeng SoC"
 	depends on ACPI
-	depends on MAILBOX
+	depends on PCC
 	depends on ARM64 || COMPILE_TEST
 	help
 	  The Huawei Cache Coherence System (HCCS) is a multi-chip
-- 
2.22.0

