Return-Path: <SRS0=3AV4=GW=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCE3C0018C
	for <soc@archiver.kernel.org>; Thu,  9 Nov 2023 05:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DD99C433CC; Thu,  9 Nov 2023 05:45:57 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53FA5C433C9;
	Thu,  9 Nov 2023 05:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53FA5C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm000004.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SQrSp4L3lz1P83T;
	Thu,  9 Nov 2023 13:42:34 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 kwepemm000004.china.huawei.com (7.193.23.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 9 Nov 2023 13:45:10 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <arnd@arndb.de>, <krzk@kernel.org>,
	<sudeep.holla@arm.com>, <liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v1 0/3] soc: hisilicon: kunpeng_hccs: Support the platform with PCC type3 and interrupt ack
Date: Thu, 9 Nov 2023 13:45:23 +0800
Message-ID: <20231109054526.27270-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000004.china.huawei.com (7.193.23.18)
X-CFilter-Loop: Reflected

Fix some incorrect format strings and add failure log for no _CRS method.
Add support for the platform with PCC type3 and interrupt ack.

Huisong Li (3):
  soc: hisilicon: kunpeng_hccs: Fix some incorrect format strings
  soc: hisilicon: kunpeng_hccs: Add failure log for no _CRS method
  soc: hisilicon: kunpeng_hccs: Support the platform with PCC type3 and
    interrupt ack

 drivers/soc/hisilicon/kunpeng_hccs.c | 153 ++++++++++++++++++++-------
 drivers/soc/hisilicon/kunpeng_hccs.h |   2 +
 2 files changed, 119 insertions(+), 36 deletions(-)

-- 
2.33.0

