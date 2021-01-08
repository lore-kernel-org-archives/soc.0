Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B17C4332E
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:21:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9B2CD23718; Fri,  8 Jan 2021 10:21:41 +0000 (UTC)
X-Greylist: delayed 64 seconds by postgrey-1.34 at mail.kernel.org; Fri, 08 Jan 2021 10:21:40 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9FD423715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9FD423715;
	Fri,  8 Jan 2021 10:21:40 +0000 (UTC)
IronPort-SDR: AokH47rneKp08b8OfY3n+Txvz198j5FiahXT2/fowauepJYzlLU9uxdaLXNrYySCBp+sop74/5
 w2nHwYpat9OGb/PN/tBnd2WQ9DK9WikDq8zPQbkkHw8QmBmSUQLawP1Gibxv1kBnzhbvDV8WHn
 aJMy18AWjJeaLG0i5+FBS+WFXQQA4qcIuf0CP++OCkjOsp8D5ythd2jaWtQzQ15S8M0gL4QMiP
 6P5jpwhyiWEbS0Y/Np2vois/JUCmBzTDBhAZJ95U8YpFvCeAD71V3zWxZi+SuDWH0S/7t14xE/
 tYs=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14109558"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="14109558"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A6DDEDF51;
	Fri,  8 Jan 2021 19:20:33 +0900 (JST)
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local (g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A7A051532E;
	Fri,  8 Jan 2021 19:20:32 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id A9B8A46E891;
	Fri,  8 Jan 2021 19:20:31 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:20:29 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH 08/10] soc: fujitsu: hwb: Add release operation
Date: Fri, 8 Jan 2021 19:32:25 +0900
Message-ID: <20210108103227.1740865-9-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00

Upon release, we cleanup remaining resources/registers if necessary.
This happens when user does not call IOC_BB_FREE properly and the
function will do effectively the same operation as IOC_BB_FREE.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/soc/fujitsu/fujitsu_hwb.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
index 1132cb74b13b..46f1f244f93a 100644
--- a/drivers/soc/fujitsu/fujitsu_hwb.c
+++ b/drivers/soc/fujitsu/fujitsu_hwb.c
@@ -796,9 +796,35 @@ static int fujitsu_hwb_dev_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static int fujitsu_hwb_dev_release(struct inode *inode, struct file *filp)
+{
+	struct hwb_private_data *pdata = (struct hwb_private_data *)filp->private_data;
+	struct bb_info *bb_info, *tmp;
+
+	/*
+	 * Cleanup BB if IOC_BB_FREE is not called properly.
+	 * No lock for pdata->bb_list is needed cause there is no one else
+	 */
+	if (!list_empty(&pdata->bb_list)) {
+		pr_warn("free operation is not called properly\n");
+
+		list_for_each_entry_safe(bb_info, tmp, &pdata->bb_list, node) {
+			teardown_bb(bb_info);
+			list_del_init(&bb_info->node);
+			/* 1 put for alloc_bb_info */
+			put_bb_info(bb_info);
+		}
+	}
+
+	kfree(pdata);
+
+	return 0;
+}
+
 static const struct file_operations fujitsu_hwb_dev_fops = {
 	.owner          = THIS_MODULE,
 	.open           = fujitsu_hwb_dev_open,
+	.release        = fujitsu_hwb_dev_release,
 	.unlocked_ioctl = fujitsu_hwb_dev_ioctl,
 };
 
-- 
2.26.2

