Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC39C433DB
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:21:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A48523719; Fri,  8 Jan 2021 10:21:39 +0000 (UTC)
X-Greylist: delayed 63 seconds by postgrey-1.34 at mail.kernel.org; Fri, 08 Jan 2021 10:21:38 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D0F236FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D0F236FB;
	Fri,  8 Jan 2021 10:21:38 +0000 (UTC)
IronPort-SDR: rTnOMLuNw2TfWOKAw0qk6TT0wPkquNVzT70dEunFGZuRpa+kfE5ajmsWFV/ZLSz61B+H56Jls5
 VwE5cGmGDIcN//OoEWdnPD0XAIzabG3LrEV9tQUCx4dOQchVvTCWITHjxurQtB7bAhg0gCvZZW
 zKmR7Lj9ScLWzfoqNJnjQLsV+QkeznlEOYW2/dwREfRRE3Pe0VklHoSHLo+Sw8ybHgmgFpcODG
 oarXABKtozDLxBXVbRx/s+ELxxy/4GTIA9hZ3DqsAWvY0JvMbznPN90gaI4/HIn2f0QZvYU5ur
 5WI=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="2147761"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="2147761"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:32 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 42BC1A80C3;
	Fri,  8 Jan 2021 19:20:31 +0900 (JST)
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local (g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B413AA81E;
	Fri,  8 Jan 2021 19:20:30 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id 8D31346E890;
	Fri,  8 Jan 2021 19:20:29 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:20:27 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH 02/10] soc: fujtisu: hwb: Add open operation
Date: Fri, 8 Jan 2021 19:32:19 +0900
Message-ID: <20210108103227.1740865-3-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
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

