Return-Path: <SRS0=OPox=OS=huawei.com=lihuisong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED95C3DA49
	for <soc@archiver.kernel.org>; Thu, 18 Jul 2024 07:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC70EC4AF13; Thu, 18 Jul 2024 07:20:51 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BB04C4AF0E
	for <soc@kernel.org>; Thu, 18 Jul 2024 07:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6BB04C4AF0E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WPkcs0pFTz28fXS;
	Thu, 18 Jul 2024 15:16:29 +0800 (CST)
Received: from kwepemm600004.china.huawei.com (unknown [7.193.23.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 51C221402D0;
	Thu, 18 Jul 2024 15:20:48 +0800 (CST)
Received: from localhost.localdomain (10.28.79.22) by
 kwepemm600004.china.huawei.com (7.193.23.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 15:20:47 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH 5/5] doc: soc: hisilicon: kunpeng_hccs: add low power interface description for HCCS
Date: Thu, 18 Jul 2024 15:11:34 +0800
Message-ID: <20240718071134.31155-6-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20240718071134.31155-1-lihuisong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.79.22]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600004.china.huawei.com (7.193.23.242)

This patch add low power interface description for HCCS.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 .../sysfs-devices-platform-kunpeng_hccs       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
index 1666340820f7..28bffb79e742 100644
--- a/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
+++ b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
@@ -79,3 +79,29 @@ Description:
 			           indicates a lane.
 		crc_err_cnt:  (RO) CRC err count on this port.
 		============= ==== =============================================
+
+What:		/sys/devices/platform/HISI04Bx:00/used_typs
+Date:		July 2024
+KernelVersion:	6.11
+Contact:	Huisong Li <lihuisong@huawei.com>
+Description:
+		This interface is used to show all HCCS type used on current
+		platform, like, HCCS-v1, HCCS-v2 and so on.
+
+What:		/sys/devices/platform/HISI04Bx:00/support_pm_types
+What:		/sys/devices/platform/HISI04Bx:00/dec_lane
+What:		/sys/devices/platform/HISI04Bx:00/inc_lane
+Date:		July 2024
+KernelVersion:	6.11
+Contact:	Huisong Li <lihuisong@huawei.com>
+Description:
+		This series interface under /sys/devices/platform/HISI04Bx/
+		directory is used to support low power of some HCCS type
+		by operating their lane number. The 'inc_lane' and 'dec_lane'
+		are just exposed with root privilege and write-onely attributes
+		when there is the HCCS type supported low power operation.
+		The 'support_pm_types' with read-only attributes is used to
+		expose the HCCS type supported PM. The available input of
+		'inc_lane' and 'dec_lane' is from 'support_pm_types'.
+		Note: allow to decrease lane only when all specified HCCS ports
+		are not busy.
-- 
2.22.0

