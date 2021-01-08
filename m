Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0608AC43381
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:21:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C51662371F; Fri,  8 Jan 2021 10:21:40 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF24A23715;
	Fri,  8 Jan 2021 10:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF24A23715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: Vpgf6oXx/rchpwL5fxdcjcuqmepCon0/7MAnCKmJPhxOh0sF1hvZGi5ZmjCoLpBranU2KxUu5H
 LRJtceP58LRbRf3x+dtk+ktBgpuVI33u7XuAzipGxX7y1qvNZflE3pG4KmN6hRuSpimcUJCLL0
 bZN8EmcQnrmGIlBnI714FjR/2jhraOfrMu2XdaSpnglI3Vkk5xEl2myjNUQ9xsKcH1rZugsw9S
 ael1B8FNlm5N/BH2Hyot9+u7EyISSeqZB71jeeV4r9Z4HxeIReY0TDMRLk+WWe3J40x7nOGhxw
 MrA=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="2147764"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="2147764"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:33 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 49D8F32F7C6;
	Fri,  8 Jan 2021 19:20:33 +0900 (JST)
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local (g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EA42207B49;
	Fri,  8 Jan 2021 19:20:32 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id 63378584384;
	Fri,  8 Jan 2021 19:20:31 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:20:29 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH 07/10] soc: fujitsu: hwb: Add IOC_GET_PE_INFO ioctl
Date: Fri, 8 Jan 2021 19:32:24 +0900
Message-ID: <20210108103227.1740865-8-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00

This is an infomative ioctl to tell users CMG/PE number of currently
running PE.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/soc/fujitsu/fujitsu_hwb.c      | 18 ++++++++++++++++++
 include/uapi/linux/fujitsu_hpc_ioctl.h |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
index 2535942cc0d7..1132cb74b13b 100644
--- a/drivers/soc/fujitsu/fujitsu_hwb.c
+++ b/drivers/soc/fujitsu/fujitsu_hwb.c
@@ -733,6 +733,21 @@ static int ioc_bb_free(struct file *filp,  void __user *argp)
 	return 0;
 }
 
+static int ioc_get_pe_info(struct file *filp, void __user *argp)
+{
+	struct fujitsu_hwb_ioc_pe_info pe_info = {0};
+	int cpu = smp_processor_id();
+
+	pe_info.cmg = _hwinfo.core_map[cpu].cmg;
+	pe_info.ppe = _hwinfo.core_map[cpu].ppe;
+
+	if (copy_to_user((struct fujitsu_hwb_ioc_pe_info __user *)argp, &pe_info,
+						sizeof(struct fujitsu_hwb_ioc_pe_info)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
@@ -751,6 +766,9 @@ static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned
 	case FUJITSU_HWB_IOC_BB_FREE:
 		ret = ioc_bb_free(filp, argp);
 		break;
+	case FUJITSU_HWB_IOC_GET_PE_INFO:
+		ret = ioc_get_pe_info(filp, argp);
+		break;
 	default:
 		ret = -ENOTTY;
 		break;
diff --git a/include/uapi/linux/fujitsu_hpc_ioctl.h b/include/uapi/linux/fujitsu_hpc_ioctl.h
index 7a285d8db0a9..1226014d97c4 100644
--- a/include/uapi/linux/fujitsu_hpc_ioctl.h
+++ b/include/uapi/linux/fujitsu_hpc_ioctl.h
@@ -22,6 +22,11 @@ struct fujitsu_hwb_ioc_bw_ctl {
 	__s8 window;
 };
 
+struct fujitsu_hwb_ioc_pe_info {
+	__u8 cmg;
+	__u8 ppe;
+};
+
 #define FUJITSU_HWB_IOC_BB_ALLOC _IOWR(__FUJITSU_IOCTL_MAGIC, \
 	0x00, struct fujitsu_hwb_ioc_bb_ctl)
 #define FUJITSU_HWB_IOC_BW_ASSIGN _IOWR(__FUJITSU_IOCTL_MAGIC, \
@@ -30,5 +35,7 @@ struct fujitsu_hwb_ioc_bw_ctl {
 	0x02, struct fujitsu_hwb_ioc_bw_ctl)
 #define FUJITSU_HWB_IOC_BB_FREE _IOW(__FUJITSU_IOCTL_MAGIC, \
 	0x03, struct fujitsu_hwb_ioc_bb_ctl)
+#define FUJITSU_HWB_IOC_GET_PE_INFO _IOR(__FUJITSU_IOCTL_MAGIC, \
+	0x04, struct fujitsu_hwb_ioc_pe_info)
 
 #endif /* _UAPI_LINUX_FUJITSU_HPC_IOC_H */
-- 
2.26.2

