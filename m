Return-Path: <SRS0=EqKn=PW=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7917BC52D7C
	for <soc@archiver.kernel.org>; Fri, 23 Aug 2024 03:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E7DEC4AF12; Fri, 23 Aug 2024 03:20:58 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89C34C32782;
	Fri, 23 Aug 2024 03:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 89C34C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WqlhK3xQjz1j6gR;
	Fri, 23 Aug 2024 11:20:49 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id D04DF1402E1;
	Fri, 23 Aug 2024 11:20:53 +0800 (CST)
Received: from localhost.localdomain (10.28.79.22) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 11:20:53 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzk@kernel.org>,
	<Jonathan.Cameron@Huawei.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 0/6] Add some features and bugfix for kunpeng_hccs
Date: Fri, 23 Aug 2024 11:10:53 +0800
Message-ID: <20240823031059.32579-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20240718071134.31155-1-lihuisong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.79.22]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600004.china.huawei.com (7.193.23.242)

This series are intended to support the low power feature for specified
HCCS and add used HCCS types sysfs. In addition, fix some bugfix and
enhance some codes.

---
 v2:
  - remove "this patch" words in commit log suggested by Krzyszto.
  - use for_each_set_bit to replace the cycle scanning all HCCS IP.
  - add a patch to rename the 'lane_mode' to 'max_lane_num' to make it
    easy to see.
  - add doc description into the code patch.
  - rename the name of the low power interface.
  - adjust the increasing and decreasing lane interface description.
  - do not create available_inc_dec_lane_types when no HCCS type support
    low power.
---

Huisong Li (6):
  soc: hisilicon: kunpeng_hccs: Fix a PCC typo
  soc: hisilicon: kunpeng_hccs: Return failure on having not die or port
    information
  soc: hisilicon: kunpeng_hccs: Add the check for base address and size
    of shared memory
  soc: hisilicon: kunpeng_hccs: Fix the 'lane_mode' field name in port
    info structure to 'max_lane_num'
  soc: hisilicon: kunpeng_hccs: Add used HCCS types sysfs
  soc: hisilicon: kunpeng_hccs: Support low power feature for the
    specified HCCS type

 .../sysfs-devices-platform-kunpeng_hccs       |  45 ++
 drivers/soc/hisilicon/Kconfig                 |   7 +-
 drivers/soc/hisilicon/kunpeng_hccs.c          | 516 +++++++++++++++++-
 drivers/soc/hisilicon/kunpeng_hccs.h          |  33 +-
 4 files changed, 582 insertions(+), 19 deletions(-)

-- 
2.22.0

