Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2861C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:23:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A1023770
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A1023770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jUjiJf87cB7Za55mrkMb7HreXDTamB2QhKRXWWFbh2k=; b=FXxYhgzWgXrTcKAq4gXxs5tNi
	45T3SEqvnmqdiBQjkyzXMUN4uLPvibcoLxyz8kuQmwtpM5fUu/hblbx2Lvf8uVHzFAiziB0pQp0Zz
	b6bJ/1RcDUFUmK3z7PhHKWTZM46vhQzjOiAYWdhO2NIy+5YwJDQJaGgKi9wddpeESoy7eVNy8WVbp
	S2onIlYKViYHy0eXVjmlbJGTbf63qg2tbWhhWZXuIkMWw28d6nP6GOv7mxz263mc2D2b3VASAzmil
	8z6lpsF8flFrU+D97RTnz16/vnNqCBUCpr7mmgwKNsHOUxPL9dQCRdxjJklCOcL1O9OPpd8OMK0Xv
	2GCwTObwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxou0-000563-TX; Fri, 08 Jan 2021 10:21:52 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxosm-0004xw-KH
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:20:39 +0000
IronPort-SDR: MT6quIOKOQj3gDrY70aArLE0Qiy+XhFmCS3jQlOT3uysuiUkG+7vBFwpBUBCSgON0juL4d/zDN
 0hFcNgQNUYI28ANljYBJcYioGqBY+pGOKZJ16VF4B1qiFPvjcADcphgjMU+aMFo5p1OsNO9cEm
 WVQrmcRu7DIAowLDlTXNZUbg3+DVWVUSQlP3cQ0k6/TuOXWO5MGr1+HycRTCEDgy9p50rIgh6w
 UfgCL+b/5bEjOXWtY0khxR+ZZ2TzxnLIbCqUV9DJ+Z6nlbMsLL4qTTV0DX/VW96dazbyTUtEhJ
 ZAc=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14091497"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; d="scan'208";a="14091497"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
 by esa6.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:32 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com
 [192.168.83.65])
 by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 42FBAEC7AB
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:20:31 +0900 (JST)
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
 (g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
 by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B0689B616
 for <linux-arm-kernel@lists.infradead.org>;
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
Subject: [PATCH 02/10] soc: fujtisu: hwb: Add open operation
Date: Fri, 8 Jan 2021 19:32:19 +0900
Message-ID: <20210108103227.1740865-3-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_052036_871897_B5047C72 
X-CRM114-Status: GOOD (  12.35  )
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
Message-ID: <20210108103219.TlRFnHy31o0nY33xCODYuihgqBGmctWh7NM3Vc0p0-I@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
