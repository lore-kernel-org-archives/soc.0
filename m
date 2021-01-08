Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5E1C433E0
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:40:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 06B7A238E1; Fri,  8 Jan 2021 10:40:42 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43C23238E7;
	Fri,  8 Jan 2021 10:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43C23238E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: mQkEtnu9yC/nUJiWS5qNKDnTdnmbnGhum9Cl/VBzHaVxiM7zl9y6wiAvNHM7wGDHktE0JZXUM9
 tI8ueBP2rUlOC+46SIQRGtr12IPq1W3tmuh6+rSbIYoJLADWmYjzDrc1aQNj1BSS0kvFyWH2s2
 L9cPJ53/6gBgOGI+HAiNBtc09P/azBXZ8xlTr+41VmGOr/9UG7VIvc8efEX3D2a7/k5OuZn+uO
 CctSByypLBhC1epwrDmto2Zbhr7fDK4V3V5/3xI5WynbDH4x1QZ7dxXncs2Vmnmt35NDC24BiX
 rmU=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14111426"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="14111426"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:40:37 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5212321EC63;
	Fri,  8 Jan 2021 19:40:36 +0900 (JST)
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local (g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 91E2EAB1AD;
	Fri,  8 Jan 2021 19:40:35 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local (G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id 81047BD6867;
	Fri,  8 Jan 2021 19:40:34 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:40:32 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH 06/10] soc: fujitsu: hwb: Add IOC_BB_FREE ioctl
Date: Fri, 8 Jan 2021 19:52:37 +0900
Message-ID: <20210108105241.1757799-7-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00

IOC_BB_FREE ioctl resets what IOC_BB_ALLOC ioctl did.

We need to forbid assign/unassign operation happens during free
operation, so we set the flag to indicate it and also wait
ongoing assign/unassign to finish first.

If there exist PEs on which IOC_BW_UNASSIGN is not called,
we send IPI to do effectively the same operation as IOC_BW_UNASSIGN.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/soc/fujitsu/fujitsu_hwb.c      | 125 ++++++++++++++++++++++++-
 include/uapi/linux/fujitsu_hpc_ioctl.h |   2 +
 2 files changed, 122 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
index 8c4cabd60872..2535942cc0d7 100644
--- a/drivers/soc/fujitsu/fujitsu_hwb.c
+++ b/drivers/soc/fujitsu/fujitsu_hwb.c
@@ -196,6 +196,12 @@ static struct bb_info *get_bb_info(struct hwb_private_data *pdata, u8 cmg, u8 bb
 	spin_lock(&pdata->list_lock);
 	list_for_each_entry(bb_info, &pdata->bb_list, node) {
 		if (bb_info->cmg == cmg && bb_info->bb == bb) {
+			if (test_bit(BB_FREEING,  &bb_info->flag)) {
+				pr_err("BB is currently being freed: %u/%u\n", cmg, bb);
+				spin_unlock(&pdata->list_lock);
+				return ERR_PTR(-EPERM);
+			}
+
 			kref_get(&bb_info->kref);
 			spin_unlock(&pdata->list_lock);
 			return bb_info;
@@ -389,6 +395,11 @@ static int is_bw_assignable(struct bb_info *bb_info, struct fujitsu_hwb_ioc_bw_c
 {
 	int i;
 
+	if (test_bit(BB_FREEING, &bb_info->flag)) {
+		pr_err("BB is currently being freed: %u/%u/%d\n", bb_info->cmg, bb_info->bb, cpu);
+		return -EPERM;
+	}
+
 	if (!cpumask_test_cpu(cpu, bb_info->pemask)) {
 		pr_err("This pe is not supposed to join sync, %u/%u/%d\n",
 						bb_info->cmg, bb_info->bb, cpu);
@@ -490,6 +501,7 @@ static int ioc_bw_assign(struct file *filp, void __user *argp)
 	struct hwb_private_data *pdata = (struct hwb_private_data *)filp->private_data;
 	struct fujitsu_hwb_ioc_bw_ctl bw_ctl;
 	struct bb_info *bb_info;
+	unsigned long flags;
 	int ret;
 	int cpu;
 	u8 cmg;
@@ -507,18 +519,27 @@ static int ioc_bw_assign(struct file *filp, void __user *argp)
 	if (IS_ERR(bb_info))
 		return PTR_ERR(bb_info);
 
+	/* Increment counter to avoid this BB being freed during assign operation */
+	atomic_inc(&bb_info->ongoing_assign_count);
+
 	/*
 	 * Barrier window register and control register is each PE's resource.
 	 * context switch is not supported and mutual exclusion is needed for
-	 * assign and unassign on this PE
+	 * assign and unassign on this PE. As cleanup_bw() might be executed
+	 * in interrupt context via on_each_cpu_mask, disabling irq is needed
 	 */
-	preempt_disable();
+	local_irq_save(flags);
 	ret = is_bw_assignable(bb_info, &bw_ctl, cpu);
 	if (!ret) {
 		setup_ctl_reg(bb_info, cpu);
 		setup_bw(bb_info, &bw_ctl, cpu);
 	}
-	preempt_enable();
+	local_irq_restore(flags);
+
+	/* Wakeup if there is a process waiting in ioc_bb_free() */
+	if (atomic_dec_and_test(&bb_info->ongoing_assign_count) &&
+					test_bit(BB_FREEING, &bb_info->flag))
+		wake_up(&bb_info->wq);
 
 	put_bb_info(bb_info);
 
@@ -535,6 +556,12 @@ static int is_bw_unassignable(struct bb_info *bb_info, int cpu)
 {
 	u8 ppe;
 
+	if (test_bit(BB_FREEING, &bb_info->flag)) {
+		pr_err("This bb is currently being freed: %u/%u/%d\n",
+							bb_info->cmg, bb_info->bb, cpu);
+		return -EPERM;
+	}
+
 	if (!cpumask_test_and_clear_cpu(cpu, bb_info->assigned_pemask)) {
 		pr_err("This pe is not assigned: %u/%u/%d\n", bb_info->cmg, bb_info->bb, cpu);
 		return -EINVAL;
@@ -590,6 +617,7 @@ static int ioc_bw_unassign(struct file *filp, void __user *argp)
 	struct hwb_private_data *pdata = (struct hwb_private_data *)filp->private_data;
 	struct fujitsu_hwb_ioc_bw_ctl bw_ctl;
 	struct bb_info *bb_info;
+	unsigned long flags;
 	int cpu;
 	int ret;
 	u8 cmg;
@@ -608,19 +636,103 @@ static int ioc_bw_unassign(struct file *filp, void __user *argp)
 		return PTR_ERR(bb_info);
 
 	/* See comments in ioc_bw_assign() */
-	preempt_disable();
+	atomic_inc(&bb_info->ongoing_assign_count);
+
+	local_irq_save(flags);
 	ret = is_bw_unassignable(bb_info, cpu);
 	if (!ret) {
 		teardown_bw(bb_info, cpu);
 		teardown_ctl_reg(bb_info, cpu);
 	}
-	preempt_enable();
+	local_irq_restore(flags);
+
+	if (atomic_dec_and_test(&bb_info->ongoing_assign_count) &&
+					test_bit(BB_FREEING, &bb_info->flag))
+		wake_up(&bb_info->wq);
 
 	put_bb_info(bb_info);
 
 	return ret;
 }
 
+static void cleanup_bw_func(void *args)
+{
+	struct bb_info *bb_info = (struct bb_info *)args;
+	int cpu = smp_processor_id();
+
+	teardown_bw(bb_info, cpu);
+	teardown_ctl_reg(bb_info, cpu);
+}
+
+/* Send IPI to reset INIT_SYNC register */
+static void teardown_bb(struct bb_info *bb_info)
+{
+	struct init_sync_args args = {0};
+	int cpu;
+
+	/* Reset BW on each PE if IOC_BW_UNASSIGN is not called properly  */
+	if (cpumask_weight(bb_info->assigned_pemask) != 0) {
+		pr_warn("unassign is not called properly. CMG: %d, BB: %d, unassigned PE: %*pbl\n",
+			bb_info->cmg, bb_info->bb, cpumask_pr_args(bb_info->assigned_pemask));
+		on_each_cpu_mask(bb_info->assigned_pemask, cleanup_bw_func, bb_info, 1);
+	}
+
+	/* INIT_SYNC register is shared resource in CMG. Pick one PE */
+	cpu = cpumask_any(bb_info->pemask);
+
+	args.bb = bb_info->bb;
+	/* Just clear all bits */
+	args.val = 0;
+	on_each_cpu_mask(cpumask_of(cpu), write_init_sync_reg, &args, 1);
+
+	clear_bit(bb_info->bb, &_hwinfo.used_bb_bmap[bb_info->cmg]);
+
+	pr_debug("Teardown bb: cpu: %d, CMG: %u, BB: %u, bitmap: %lx\n",
+			cpu, bb_info->cmg, bb_info->bb, _hwinfo.used_bb_bmap[bb_info->cmg]);
+}
+
+static int ioc_bb_free(struct file *filp,  void __user *argp)
+{
+	struct hwb_private_data *pdata = (struct hwb_private_data *)filp->private_data;
+	struct fujitsu_hwb_ioc_bb_ctl bb_ctl;
+	struct bb_info *bb_info;
+
+	if (copy_from_user(&bb_ctl, (struct fujitsu_hwb_ioc_bb_ctl __user *)argp,
+						sizeof(struct fujitsu_hwb_ioc_bb_ctl)))
+		return -EFAULT;
+
+	bb_info = get_bb_info(pdata, bb_ctl.cmg, bb_ctl.bb);
+	if (IS_ERR(bb_info))
+		return PTR_ERR(bb_info);
+
+	/* Forbid free/assign/unassign operation from now on */
+	if (test_and_set_bit(BB_FREEING, &bb_info->flag)) {
+		pr_err("IOC_BB_FREE is already called. CMG: %u, BB: %u\n", bb_ctl.cmg, bb_ctl.bb);
+		put_bb_info(bb_info);
+		return -EPERM;
+	}
+
+	/* Wait current ongoing assign/unassign operation to finish */
+	if (wait_event_interruptible(bb_info->wq,
+					(atomic_read(&bb_info->ongoing_assign_count) == 0))) {
+		clear_bit(BB_FREEING, &bb_info->flag);
+		put_bb_info(bb_info);
+		pr_debug("IOC_BB_FREE is interrupted. CMG: %u, BB: %u\n", bb_ctl.cmg, bb_ctl.bb);
+		return -EINTR;
+	}
+
+	teardown_bb(bb_info);
+	spin_lock(&pdata->list_lock);
+	list_del_init(&bb_info->node);
+	spin_unlock(&pdata->list_lock);
+
+	/* 1 put for get_bb_info, 1 for alloc_bb_info */
+	put_bb_info(bb_info);
+	put_bb_info(bb_info);
+
+	return 0;
+}
+
 static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
@@ -636,6 +748,9 @@ static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned
 	case FUJITSU_HWB_IOC_BW_UNASSIGN:
 		ret = ioc_bw_unassign(filp, argp);
 		break;
+	case FUJITSU_HWB_IOC_BB_FREE:
+		ret = ioc_bb_free(filp, argp);
+		break;
 	default:
 		ret = -ENOTTY;
 		break;
diff --git a/include/uapi/linux/fujitsu_hpc_ioctl.h b/include/uapi/linux/fujitsu_hpc_ioctl.h
index 396029f2bc0d..7a285d8db0a9 100644
--- a/include/uapi/linux/fujitsu_hpc_ioctl.h
+++ b/include/uapi/linux/fujitsu_hpc_ioctl.h
@@ -28,5 +28,7 @@ struct fujitsu_hwb_ioc_bw_ctl {
 	0x01, struct fujitsu_hwb_ioc_bw_ctl)
 #define FUJITSU_HWB_IOC_BW_UNASSIGN _IOW(__FUJITSU_IOCTL_MAGIC, \
 	0x02, struct fujitsu_hwb_ioc_bw_ctl)
+#define FUJITSU_HWB_IOC_BB_FREE _IOW(__FUJITSU_IOCTL_MAGIC, \
+	0x03, struct fujitsu_hwb_ioc_bb_ctl)
 
 #endif /* _UAPI_LINUX_FUJITSU_HPC_IOC_H */
-- 
2.26.2

