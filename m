Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75702C433E9
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:40:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 31C01238A0; Fri,  8 Jan 2021 10:40:40 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1813A2388C;
	Fri,  8 Jan 2021 10:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1813A2388C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: Lzc61TjJe4rdBqE9caK+3gw91Vn/UipeqMGV3JCVUXG2kbq7IJ2H/wCYiu2BHrGuKhVVOrGbEE
 iySy/InvIX8GnxhFrA87E+KG3uE01Q2dTqSdOnrsU9q7W5vbhjfPIKPSKw6oYEs8sjhlcKuvA3
 kG81wo3yDfMM/+mbAYD3D8pdmXFMHZMHEAMaIcR/FsexZRZpNE8cNdn0hB5ClyOTqvSG/YG+cu
 bIyiJR3xwOPcxHQHUiWQA5W4PvE1MEl7U1RJE4Dz5aQ0qfpbPav0Xc1ldaAEFJpoxQyib+N10T
 Eqk=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="2149512"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="2149512"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:40:35 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F30E31FB303;
	Fri,  8 Jan 2021 19:40:34 +0900 (JST)
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local (g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 48DA9207B46;
	Fri,  8 Jan 2021 19:40:34 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local (G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id 3CF3BBD6867;
	Fri,  8 Jan 2021 19:40:33 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:40:31 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH 02/10] soc: fujtisu: hwb: Add open operation
Date: Fri, 8 Jan 2021 19:52:33 +0900
Message-ID: <20210108105241.1757799-3-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00

Nothing special. Just preparing private_data for this FD.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/soc/fujitsu/fujitsu_hwb.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
index 44c32c1683df..1dec3d3c652f 100644
--- a/drivers/soc/fujitsu/fujitsu_hwb.c
+++ b/drivers/soc/fujitsu/fujitsu_hwb.c
@@ -142,8 +142,28 @@ struct bb_info {
 };
 static struct kmem_cache *bb_info_cachep;
 
+static int fujitsu_hwb_dev_open(struct inode *inode, struct file *filp)
+{
+	struct hwb_private_data *pdata;
+
+	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&pdata->bb_list);
+	spin_lock_init(&pdata->list_lock);
+
+	/*
+	 * misc_open() sets pointer of the miscdevice to filp->private_data.
+	 * Just override it since barrier fops does not use it
+	 */
+	filp->private_data = pdata;
+
+	return 0;
+}
+
 static const struct file_operations fujitsu_hwb_dev_fops = {
 	.owner          = THIS_MODULE,
+	.open           = fujitsu_hwb_dev_open,
 };
 
 static struct miscdevice bar_miscdev = {
-- 
2.26.2

