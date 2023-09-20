Return-Path: <SRS0=QpUT=FE=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB0DCE79AC
	for <soc@archiver.kernel.org>; Wed, 20 Sep 2023 06:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5FD5C433CC; Wed, 20 Sep 2023 06:50:31 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93418C433C7;
	Wed, 20 Sep 2023 06:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93418C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm600004.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Rr8Fy2FngzMlhg;
	Wed, 20 Sep 2023 14:46:46 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 20 Sep 2023 14:50:20 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <rafael@kernel.org>, <rafael.j.wysocki@intel.com>, <sudeep.holla@arm.com>,
	<xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 0/2] mailbox: pcc: export the PCC subspace type
Date: Wed, 20 Sep 2023 14:47:01 +0800
Message-ID: <20230920064703.23543-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230914115753.9064-1-lihuisong@huawei.com>
References: <20230914115753.9064-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600004.china.huawei.com (7.193.23.242)
X-CFilter-Loop: Reflected

Currently, it seems that the subspace type in all drivers used PCC is fixed
and not obtained from their platform.
And PCCT is a best natural way to export it.

v1->v2:
 - add one patch to use PCC subspace type in kunpeng_hccs

Huisong Li (2):
  mailbox: pcc: export the PCC subspace type
  soc: kunpeng_hccs: add the check for PCC subspace type

 drivers/mailbox/pcc.c                | 10 ++++------
 drivers/soc/hisilicon/kunpeng_hccs.c | 17 +++++++++++++++++
 include/acpi/pcc.h                   |  1 +
 3 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.33.0

