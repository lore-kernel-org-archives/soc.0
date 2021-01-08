Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5805EC4332D
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:40:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1FD832389F; Fri,  8 Jan 2021 10:40:41 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59C372388C;
	Fri,  8 Jan 2021 10:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59C372388C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: +9IsS7c+YmUWYiwCDNvzJEnOLVoGnftlKwib6hIz5XNPFCTP/ChwkQ/K5wT+HWYHiGzOcGVqdv
 xS6N34Nuu78Kn3pkBexuXvn2kHxpvrq/RMAWoxMbn0Mftx4GrU1jrsfToF9/ZRq0Ng11UnPgGB
 297Uq7bd+cnK6zo9z0cuK7uULtiPrhjdFI0Qt+F/JaV91qaaIT1G1NDIj7Gpl9BYHz51byx1yJ
 SRl9tJw5rxUvRCBirfpyed9xpA9hEJU5uasifa+wUYXuOtGJtRLqB4MHRrLtCkFUhqht7G34yS
 G8Y=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14147253"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="14147253"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:40:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A21AEEC7AA;
	Fri,  8 Jan 2021 19:40:36 +0900 (JST)
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local (g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1DFA9BB1F;
	Fri,  8 Jan 2021 19:40:35 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local (G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id E56F6BD686A;
	Fri,  8 Jan 2021 19:40:34 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:40:32 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH 08/10] soc: fujitsu: hwb: Add release operation
Date: Fri, 8 Jan 2021 19:52:39 +0900
Message-ID: <20210108105241.1757799-9-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
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

