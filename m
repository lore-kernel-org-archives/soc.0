Return-Path: <SRS0=fqXu=HL=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3152C10DC3
	for <soc@archiver.kernel.org>; Thu, 30 Nov 2023 13:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77839C433C7; Thu, 30 Nov 2023 13:45:57 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82EBEC433C9;
	Thu, 30 Nov 2023 13:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82EBEC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm000004.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Sgy564HQgzMnX3;
	Thu, 30 Nov 2023 21:40:58 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 kwepemm000004.china.huawei.com (7.193.23.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 21:45:50 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<arnd@arndb.de>, <krzk@kernel.org>, <sudeep.holla@arm.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 0/4] soc: hisilicon: kunpeng_hccs: Support the platform with PCC type3 and interrupt ack
Date: Thu, 30 Nov 2023 21:45:46 +0800
Message-ID: <20231130134550.33398-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20231109054526.27270-1-lihuisong@huawei.com>
References: <20231109054526.27270-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000004.china.huawei.com (7.193.23.18)
X-CFilter-Loop: Reflected

The main purpose of this series is to support the platform with PCC type3
and interrupt ack. At the same time, this series also fix some incorrect
format strings, add failure log for no _CRS method and remove an unused
blank line.

---
 v2:
  - using a version specific structure to replace device version according
    to Jonathan's advice.
  - add a new patch that remove an unused blank line.

Huisong Li (4):
  soc: hisilicon: kunpeng_hccs: Fix some incorrect format strings
  soc: hisilicon: kunpeng_hccs: Add failure log for no _CRS method
  soc: hisilicon: kunpeng_hccs: remove an unused blank line
  soc: hisilicon: kunpeng_hccs: Support the platform with PCC type3 and
    interrupt ack

 drivers/soc/hisilicon/kunpeng_hccs.c | 153 +++++++++++++++++++++------
 drivers/soc/hisilicon/kunpeng_hccs.h |  15 +++
 2 files changed, 135 insertions(+), 33 deletions(-)

-- 
2.33.0

