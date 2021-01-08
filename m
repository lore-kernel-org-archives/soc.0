Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8441CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:23:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB0623770
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FB0623770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hACgsk/Xi3YWdrXxA+Krl/z8YyITNtKasY5IVM4FMLM=; b=WhkAFPL6nSHNO4Fz55/B+veGO
	n/lCG5IeKZdpMgKqni7unbL0C7B7hGzJSinmoA+/jtolIVSsCX8Q6b/YW9UadMGHKTjEDrojvMy99
	9TIwUAeO2AXFb6dTfNyaoSz6mfldZjpJ2WmiX/sj4ZCcBQWNCMROd0yLgg+7QlKTh4GgDE6LcLxfN
	zsBwygnYB3PRm9SLvn3eRAR71NYmnL/uh5qtjwGKDSs9kzvsJMqeMxBWuolEf58ri9nhtGdHaUA3Q
	ttRhXTS5ASYOCjwhQpbGJ1pT61uyf3nmGidUVsO11uGTNSa+MGZexc6oJjy/PEM0JhAQCQ40qEUcY
	K2T2tA2gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxotb-00054h-Ml; Fri, 08 Jan 2021 10:21:27 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxosm-0004xn-F7
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:20:38 +0000
IronPort-SDR: exanJGps+u0QM8yDW5Mzfj90wF2ZqcWmbpFBQjmN52CihLHuiUL/GooJXUc+dBXdWr9pnd72af
 9HxOJkfYHTp2+/7VL7+3u7qzreiZHkwbk3p9pc+8dxmjTOdz+7ZKJSi5/AVqtunfEniJz+jEan
 8idiuGi3XQmjkCeGLZ78Vv3WTE+oBgpKByBNP+s8tu+VFdV6JeSqQg8OblVS5gBOIzlVpp8oIf
 ETUZtuckOv+IQBgjSefQeBwsUPWin7DTNZjHLpAeWm0/rOCQYkMluKbmkgKTw5GDMNalv30Ey4
 1QI=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="2153051"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="2153051"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
 by esa8.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:33 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com
 [192.168.87.60])
 by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 117DE32F7C3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:20:33 +0900 (JST)
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
 (g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
 by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 524851532E
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:20:32 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
 by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id 2E03E46E556;
 Fri,  8 Jan 2021 19:20:31 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:20:29 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
Subject: [PATCH 06/10] soc: fujitsu: hwb: Add IOC_BB_FREE ioctl
Date: Fri, 8 Jan 2021 19:32:23 +0900
Message-ID: <20210108103227.1740865-7-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_052036_681393_CF4AEF96 
X-CRM114-Status: GOOD (  21.46  )
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
Message-ID: <20210108103223.ZuHzSWY805DpdFa-v9teM2x3sF7wqU-0JgPhtvIc_QI@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
