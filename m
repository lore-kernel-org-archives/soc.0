Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03235C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:24:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9392E235FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9392E235FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PbjRTSnNTBQ0fv53PpMlcoqcpPanDJh0P6x6P1cNcH8=; b=LOrGe95oyBE6CkbcKJf2sZnaI
	rTv0wuhSKAjxesXCLnqhKbX9fBSrRIWVI048JcvF4i7a+oqHH/Aqq6Ks0v2vb8L0RH6ihRIZ0+NGk
	qdtu4MOWMK97L+jfyjRpy7354KEIY5dgDp2SRztR1UhqTii070SII8NCHtBTHdwaw7YjnK3LskV6v
	CeDdJTFLVJcFKATOwiCx17cO0UXk0MQQskFt5vkMzs40qum5me4dWZERQdFfCGAiGAp8ElXg3JHO4
	mlB7AK03LwBTsxkD2b9lTdXhgcTFRDQ0MjrVfexMJFrP0LyGMlr4WiKspmS26DAdAnuy6rPDxF/Ze
	P/1L+oetQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxouN-00059X-9t; Fri, 08 Jan 2021 10:22:15 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxosm-0004xx-Lk
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:20:40 +0000
IronPort-SDR: J/QEdvzTK8sAhcVdJ6YpHsXh0TY5pJeM/xozSNYlkZEOZ2ju34HXmKlmZ7V1zHD1n9tAC2Lqkc
 1+DS5L+Wd4OP8HtlPIJaRqeYzBI/YDPbDeAaT/RpNUnqb93CCOUvx9ez1WnNAzkmNH0yU91K7D
 GHUndBQ/OdzIVCM5tlFIQ00cEPpFYnfhWz7HTSkrh/FBSqPaVxcw2fSPcemxk0b0hg17SuLVL/
 FWAYqYAc2ti1GvdCIORBy/6WOq+Q7SJrjMQ9jUWL+WU0hLhvuwSuyin+waUFSFdoHUHXrSUK3i
 xXM=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="2153489"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="2153489"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:33 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com
 [192.168.83.66])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A8C021EC60
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:20:33 +0900 (JST)
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
 (g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
 by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C454A9A72
 for <linux-arm-kernel@lists.infradead.org>;
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
Subject: [PATCH 07/10] soc: fujitsu: hwb: Add IOC_GET_PE_INFO ioctl
Date: Fri, 8 Jan 2021 19:32:24 +0900
Message-ID: <20210108103227.1740865-8-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_052036_924875_3EFA7407 
X-CRM114-Status: GOOD (  11.94  )
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
Message-ID: <20210108103224.8oKozP575imfHa-_TFqZbzxMGkhx1led7oItf3wGWnk@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
