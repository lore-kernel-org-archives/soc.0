Return-Path: <SRS0=Kl+F=LW=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580B3C4345F
	for <soc@archiver.kernel.org>; Wed, 17 Apr 2024 09:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 275B8C32786; Wed, 17 Apr 2024 09:55:45 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D6C5C2BD10
	for <soc@kernel.org>; Wed, 17 Apr 2024 09:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D6C5C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VKGTz0mDxz1HBtF;
	Wed, 17 Apr 2024 17:54:47 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id C1453140382;
	Wed, 17 Apr 2024 17:55:40 +0800 (CST)
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
Subject: [PATCH v2 0/2] soc: hisilicon: kunpeng_hccs: add dependency and enhance verification
Date: Wed, 17 Apr 2024 17:47:59 +0800
Message-ID: <20240417094801.25393-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20240403081935.24308-1-lihuisong@huawei.com>
References: <20240403081935.24308-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.79.22]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600004.china.huawei.com (7.193.23.242)

Add PCC dependency and enhance verification during the probe phase.

---
 v2: fix the log on failure.

Huisong Li (2):
  soc: hisilicon: kunpeng_hccs: Add the check for obtaining complete
    port attribute
  soc: hisilicon: kunpeng_hccs: replace MAILBOX dependency with PCC

 drivers/soc/hisilicon/Kconfig        | 2 +-
 drivers/soc/hisilicon/kunpeng_hccs.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.22.0

