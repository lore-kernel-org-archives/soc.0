Return-Path: <SRS0=Z3CQ=HM=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0858FC10F05
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 03:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E64CDC433C7; Fri,  1 Dec 2023 03:45:41 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E167C433CC;
	Fri,  1 Dec 2023 03:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E167C433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemm000004.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ShJkk0102zNnv2;
	Fri,  1 Dec 2023 11:41:17 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 kwepemm000004.china.huawei.com (7.193.23.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Dec 2023 11:45:37 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<arnd@arndb.de>, <krzk@kernel.org>, <sudeep.holla@arm.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v3 4/5] doc: kunpeng_hccs: Fix incorrect email domain name
Date: Fri, 1 Dec 2023 11:45:33 +0800
Message-ID: <20231201034534.7276-5-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20231201034534.7276-1-lihuisong@huawei.com>
References: <20231109054526.27270-1-lihuisong@huawei.com>
 <20231201034534.7276-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000004.china.huawei.com (7.193.23.18)
X-CFilter-Loop: Reflected

The email domain name in Contact is wrong. So this patch has to modify it.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 .../ABI/testing/sysfs-devices-platform-kunpeng_hccs         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
index fdb4e36310fb..1666340820f7 100644
--- a/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
+++ b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
@@ -3,7 +3,7 @@ What:		/sys/devices/platform/HISI04Bx:00/chipX/linked_full_lane
 What:		/sys/devices/platform/HISI04Bx:00/chipX/crc_err_cnt
 Date:		November 2023
 KernelVersion:	6.6
-Contact:	Huisong Li <lihuisong@huawei.org>
+Contact:	Huisong Li <lihuisong@huawei.com>
 Description:
 		The /sys/devices/platform/HISI04Bx:00/chipX/ directory
 		contains read-only attributes exposing some summarization
@@ -26,7 +26,7 @@ What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/linked_full_lane
 What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/crc_err_cnt
 Date:		November 2023
 KernelVersion:	6.6
-Contact:	Huisong Li <lihuisong@huawei.org>
+Contact:	Huisong Li <lihuisong@huawei.com>
 Description:
 		The /sys/devices/platform/HISI04Bx:00/chipX/dieY/ directory
 		contains read-only attributes exposing some summarization
@@ -54,7 +54,7 @@ What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/lane_mask
 What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/crc_err_cnt
 Date:		November 2023
 KernelVersion:	6.6
-Contact:	Huisong Li <lihuisong@huawei.org>
+Contact:	Huisong Li <lihuisong@huawei.com>
 Description:
 		The /sys/devices/platform/HISI04Bx/chipX/dieX/hccsN/ directory
 		contains read-only attributes exposing information about
-- 
2.33.0

