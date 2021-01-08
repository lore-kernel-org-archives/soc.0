Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C69C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:26:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A9E23770
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79A9E23770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nr0EGkWSDC6Q4rBSU4jARTSKvVpBi1JyeR+obh94m0k=; b=pYMyGIZDNt+WiKtBaSC9eNWFT
	aovh8vtoal6ZUSfpXxHQklxO+ZTacR5Y6WZNNxaRhoOOpxyEApe29nlBKy5YZFSoIqTXwriihVFCY
	fPejOYodJzjLeln5q9O2b1IwiHGrYxKeJK1NgCVTeSk2f/LIH/Nw+x+yrsoaHCOHraA+rtqud9XGe
	4vr1ERmEf+7u0WMeKQCfS3rwGYmiwQIrRE8tr/OyCEWOukpXXG0MznW3uayKGx23j9npDkfiu58DJ
	C7c7I7KasObpftvzcLZSDfkVq5F1dyjVv9uxrAqWQhCO1SNtMddsfzdqrBgwlcs+a2qxq4jIPTLcy
	ZzJ/FFojA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxowD-0005jm-47; Fri, 08 Jan 2021 10:24:09 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxosq-0004xx-ET
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:20:42 +0000
IronPort-SDR: E2GJQFA7/1e7TRr2WVQzTyFWZGRJIogZ6oWlFlE6gswBka/yHEyccSdOd3N4SeDgSjHGoe8GNS
 hPLSEOCd1ePr/xpYxh5NyvMk0b0RI8Q+yHVxOOQcMrSLInupqreZcHFP31aDjm6j1yjMuZdckm
 GV/LKaV71tVJo15yZe+wRiiYXWoKL0pPjj+bK4Xpd3I1TgGz46iRKIMXzq9uHI17lJfjDKUPQ4
 ckSzdN3LcWIxtPLm47shvFt9btD0g9LzYzSiJundftzbDv1MJzbLpIgOTHbH/u0RMB9Lw7kOBr
 uIM=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="2153491"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="2153491"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
 by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:34 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com
 [192.168.87.58])
 by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6006FE0376
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:20:33 +0900 (JST)
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
 (g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
 by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A792A22F3B7
 for <linux-arm-kernel@lists.infradead.org>;
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
Subject: [PATCH 08/10] soc: fujitsu: hwb: Add release operation
Date: Fri, 8 Jan 2021 19:32:25 +0900
Message-ID: <20210108103227.1740865-9-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_052040_744430_C9C6A8FB 
X-CRM114-Status: GOOD (  12.64  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: olof@lixom.net, catalin.marinas@arm.com, will@kernel.org,
 misono.tomohiro@jp.fujitsu.com, arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108103225._yzGl70vaBF4AUodezCfYUykfBoaqWfcgrCWjBYi_C4@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
