Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B02C4332B
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:21:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6D7D223772; Fri,  8 Jan 2021 10:21:41 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FD1B23718;
	Fri,  8 Jan 2021 10:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FD1B23718
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: StTP81wDR6ZNFOE/fkNPTi1DgEWUkhzFrbQi0yTQObOrRkt6advHMl+OOo9dD21ffcTPkej1Fd
 OJwFqk6A/gw8MnsvoIVLv7NoSG1OSGWk2k4Sh8vw8Omw/UItJ8+EnpkbV3t9qWRfIqkS+RhJV7
 k2BbefFvURgHxPssl+scFYRNTSsr4oHkpbqJvOCd6h3FnbRYzqeP5K4fS6wWBs4Ls7LAeVdQmf
 IDDtzVZt+BOm2p3/k9TUeUL8WxdulTjezwJwoOpOQIKJzNh8mFkq3IFO8qIvyfAV6Dd8S0tyIT
 248=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="2147499"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="2147499"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A3562EC7AD;
	Fri,  8 Jan 2021 19:20:32 +0900 (JST)
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local (g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EAAB99BB1B;
	Fri,  8 Jan 2021 19:20:31 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id E1ACB6D68B2;
	Fri,  8 Jan 2021 19:20:30 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:20:28 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH 05/10] soc: fujitsu: hwb: Add IOC_BW_UNASSIGN ioctl
Date: Fri, 8 Jan 2021 19:32:22 +0900
Message-ID: <20210108103227.1740865-6-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00

IOC_BW_UNASSIGN resets what IOC_BW_ASSIGN did on each PE.
This ioctl will also be called as many times as the number of PEs joining
synchronization.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/soc/fujitsu/fujitsu_hwb.c      | 93 ++++++++++++++++++++++++++
 include/uapi/linux/fujitsu_hpc_ioctl.h |  2 +
 2 files changed, 95 insertions(+)

diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
index 85ffc1642dd9..8c4cabd60872 100644
--- a/drivers/soc/fujitsu/fujitsu_hwb.c
+++ b/drivers/soc/fujitsu/fujitsu_hwb.c
@@ -531,6 +531,96 @@ static int ioc_bw_assign(struct file *filp, void __user *argp)
 	return ret;
 }
 
+static int is_bw_unassignable(struct bb_info *bb_info, int cpu)
+{
+	u8 ppe;
+
+	if (!cpumask_test_and_clear_cpu(cpu, bb_info->assigned_pemask)) {
+		pr_err("This pe is not assigned: %u/%u/%d\n", bb_info->cmg, bb_info->bb, cpu);
+		return -EINVAL;
+	}
+
+	ppe = _hwinfo.core_map[cpu].ppe;
+	if (!test_bit(bb_info->bw[ppe], &_hwinfo.used_bw_bmap[cpu])) {
+		/* should not happen */
+		pr_crit("Logic error. This window is not assigned: %u/%u/%d\n",
+							bb_info->cmg, bb_info->bb, cpu);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void teardown_ctl_reg(struct bb_info *bb_info, int cpu)
+{
+	if (_hwinfo.used_bw_bmap[cpu] != 0)
+		/* Other window on this PE is still in use. Nothing todo */
+		return;
+
+	/*
+	 * This is the last unassign on this PE.
+	 * Clear all bits to disallow access to BST_SYNC/LBSY_SYNC from EL0
+	 */
+	write_sysreg_s(0, FHWB_CTRL_EL1);
+
+	pr_debug("Teardown ctl reg. cpu: %d\n", cpu);
+}
+
+static void teardown_bw(struct bb_info *bb_info, int cpu)
+{
+	u8 window;
+	u8 ppe;
+
+	/* Just clear all bits */
+	ppe = _hwinfo.core_map[cpu].ppe;
+	window = bb_info->bw[ppe];
+	write_bw_reg(window, 0);
+
+	/* Update bitmap info */
+	clear_bit(window, &_hwinfo.used_bw_bmap[cpu]);
+	bb_info->bw[ppe] = -1;
+
+	pr_debug("Teardown bw. cpu: %d, window: %u, BB: %u, bw_bmap: %lx, assigned_pemask: %*pbl\n",
+			cpu, window, bb_info->bb,
+			_hwinfo.used_bw_bmap[cpu], cpumask_pr_args(bb_info->assigned_pemask));
+}
+
+static int ioc_bw_unassign(struct file *filp, void __user *argp)
+{
+	struct hwb_private_data *pdata = (struct hwb_private_data *)filp->private_data;
+	struct fujitsu_hwb_ioc_bw_ctl bw_ctl;
+	struct bb_info *bb_info;
+	int cpu;
+	int ret;
+	u8 cmg;
+
+	if (!is_bound_only_one_pe())
+		return -EPERM;
+
+	if (copy_from_user(&bw_ctl, (struct fujitsu_hwb_ioc_bw_ctl __user *)argp,
+						sizeof(struct fujitsu_hwb_ioc_bw_ctl)))
+		return -EFAULT;
+
+	cpu = smp_processor_id();
+	cmg = _hwinfo.core_map[cpu].cmg;
+	bb_info = get_bb_info(pdata, cmg, bw_ctl.bb);
+	if (IS_ERR(bb_info))
+		return PTR_ERR(bb_info);
+
+	/* See comments in ioc_bw_assign() */
+	preempt_disable();
+	ret = is_bw_unassignable(bb_info, cpu);
+	if (!ret) {
+		teardown_bw(bb_info, cpu);
+		teardown_ctl_reg(bb_info, cpu);
+	}
+	preempt_enable();
+
+	put_bb_info(bb_info);
+
+	return ret;
+}
+
 static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
@@ -543,6 +633,9 @@ static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned
 	case FUJITSU_HWB_IOC_BW_ASSIGN:
 		ret = ioc_bw_assign(filp, argp);
 		break;
+	case FUJITSU_HWB_IOC_BW_UNASSIGN:
+		ret = ioc_bw_unassign(filp, argp);
+		break;
 	default:
 		ret = -ENOTTY;
 		break;
diff --git a/include/uapi/linux/fujitsu_hpc_ioctl.h b/include/uapi/linux/fujitsu_hpc_ioctl.h
index ad90f8f3ae9a..396029f2bc0d 100644
--- a/include/uapi/linux/fujitsu_hpc_ioctl.h
+++ b/include/uapi/linux/fujitsu_hpc_ioctl.h
@@ -26,5 +26,7 @@ struct fujitsu_hwb_ioc_bw_ctl {
 	0x00, struct fujitsu_hwb_ioc_bb_ctl)
 #define FUJITSU_HWB_IOC_BW_ASSIGN _IOWR(__FUJITSU_IOCTL_MAGIC, \
 	0x01, struct fujitsu_hwb_ioc_bw_ctl)
+#define FUJITSU_HWB_IOC_BW_UNASSIGN _IOW(__FUJITSU_IOCTL_MAGIC, \
+	0x02, struct fujitsu_hwb_ioc_bw_ctl)
 
 #endif /* _UAPI_LINUX_FUJITSU_HPC_IOC_H */
-- 
2.26.2

