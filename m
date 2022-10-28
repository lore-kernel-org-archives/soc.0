Return-Path: <SRS0=9TFX=25=huawei.com=f.fangjian@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18277FA3741
	for <soc@archiver.kernel.org>; Fri, 28 Oct 2022 10:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD5A3C433D7; Fri, 28 Oct 2022 10:55:39 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C652AC433D6
	for <soc@kernel.org>; Fri, 28 Oct 2022 10:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C652AC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MzK8B18L5zmVXJ;
	Fri, 28 Oct 2022 18:50:34 +0800 (CST)
Received: from localhost.localdomain (10.67.165.2) by
 kwepemi500015.china.huawei.com (7.221.188.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 18:55:29 +0800
From: Jay Fang <f.fangjian@huawei.com>
To: <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
CC: <jonathan.cameron@huawei.com>, <john.garry@huawei.com>,
	<rafael.j.wysocki@intel.com>, <linuxarm@huawei.com>, <soc@kernel.org>,
	<linux-kernel@vger.kernel.org>, <huangdaode@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: [PATCH] MAINTAINERS: Update HiSilicon LPC BUS Driver maintainer
Date: Fri, 28 Oct 2022 18:54:34 +0800
Message-ID: <20221028105434.1661264-1-f.fangjian@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.165.2]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500015.china.huawei.com (7.221.188.92)
X-CFilter-Loop: Reflected

Add Jay Fang as the maintainer of the HiSilicon LPC BUS Driver, replacing
John Garry.

Signed-off-by: Jay Fang <f.fangjian@huawei.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 781423be8400..d73921b67758 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9146,7 +9146,7 @@ W:	https://www.hisilicon.com
 F:	drivers/i2c/busses/i2c-hisi.c
 
 HISILICON LPC BUS DRIVER
-M:	john.garry@huawei.com
+M:	Jay Fang <f.fangjian@huawei.com>
 S:	Maintained
 W:	http://www.hisilicon.com
 F:	Documentation/devicetree/bindings/arm/hisilicon/low-pin-count.yaml
-- 
2.30.0

