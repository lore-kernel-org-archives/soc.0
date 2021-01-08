Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40315C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:46:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF14622D01
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF14622D01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GScNKLWZ3IJwHV1vZvkurcj6K9uCZAx5o2B1IpzZYDQ=; b=rP+TbO7WqZoROQ8E71hkIMS22
	DwMewbN+Bb/nWdkq3fQGILq08MPwuW9Usaz07Xi7HYVdOO1m01g6/oxd7YWISXTjh+88EOv8EF3Nc
	9i2uLm4wdwahOoDIPo5T1RV6odaJTdIhXNMNz4vTZAd2Ra53d0GLKGJbvybIqqaGi7w18tbjLOZha
	Hb9PV3xPSCLbmLTnpOFCFMj3y0aVTHunH5Jep9IVr+K5VfK50/G+0JRjXf2n/qwvLxG4/j9UmsGlF
	QRNF6bh+ALsW49FGKfF2nWzfgdIub2VFrbe8rwyzt8EdUtZv4mUI8d4SGsmKLiQLHrlRBHGfFWbZG
	KM0D7zriQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxpFb-0003Zh-G3; Fri, 08 Jan 2021 10:44:11 +0000
Received: from esa5.hc1455-7.c3s2.iphmx.com ([68.232.139.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxpCB-0002nx-7o
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:40:43 +0000
IronPort-SDR: 6yJEyTght7Dd55ApmVPOH1YodTzS0d7+yxiBgyx67ohtXwO2BrrjS4ZzGIcAn/k5vvKWnUo+P0
 ea6Bfx0EI+8FwysLDSi0XHMJxOrBBQ1AeshYKRzowZkYgvGKq7VqmRUtXHKU6iXsUpCELqMx+X
 gcxPGDZL8KjxmKhvL3pDYV0Z99Aa/tXuoZ6UxRZZaXkC1dq1m/lotoVHfMxgQzt1sStZnwf3Bp
 fqUf+VNVBcgdYRmHZUjqxZYpVxji9BGzDR3ZQETMgELYvCkdQzFJmlKRM7TY8THtYmCqOpfDlG
 By8=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14051028"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; d="scan'208";a="14051028"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
 by esa5.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:40:37 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com
 [192.168.87.61])
 by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E7C4497F23
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:40:35 +0900 (JST)
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
 (g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
 by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 32B9E44C081
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:40:35 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local
 (G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
 by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id 1EA4B32887B;
 Fri,  8 Jan 2021 19:40:34 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:40:31 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
Subject: [PATCH 04/10] soc: fujitsu: hwb: Add IOC_BW_ASSIGN ioctl
Date: Fri, 8 Jan 2021 19:52:35 +0900
Message-ID: <20210108105241.1757799-5-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_054039_540771_2219F9F2 
X-CRM114-Status: GOOD (  20.38  )
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
Message-ID: <20210108105235.NKDWB69E_gnMJB6LT1LUSgNhXCwQ4EcBGUoFilimRek@z>

IOC_BW_ASSIGN ioctl sets up control register and window register on each
PE. Therefore, this ioctl will be called as many times as the number of
PEs joining synchronization. Also, the caller thread is expected to be
bound to one PE at this point.

Since barrier window and control register is per-PE resource and
context switch is not supported at this point, we forbid concurrent
running of ioc_bw_assign() on the same PE by disabling preemption.

After this ioctl returns successfully, user program (EL0) can access
BST_SYNC/LBSY_SYNC registers directly to realize synchronization.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/soc/fujitsu/fujitsu_hwb.c      | 187 +++++++++++++++++++++++++
 include/uapi/linux/fujitsu_hpc_ioctl.h |   7 +
 2 files changed, 194 insertions(+)

diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
index 24d1bb00f55c..85ffc1642dd9 100644
--- a/drivers/soc/fujitsu/fujitsu_hwb.c
+++ b/drivers/soc/fujitsu/fujitsu_hwb.c
@@ -179,6 +179,34 @@ static struct bb_info *alloc_bb_info(void)
 	return bb_info;
 }
 
+static struct bb_info *get_bb_info(struct hwb_private_data *pdata, u8 cmg, u8 bb)
+{
+	struct bb_info *bb_info;
+
+	if (cmg >= _hwinfo.num_cmg || bb >= _hwinfo.num_bb) {
+		pr_err("CMG/BB number is invalid: %u/%u\n", cmg, bb);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!test_bit(bb, &_hwinfo.used_bb_bmap[cmg])) {
+		pr_err("BB is not allocated: %u/%u\n", cmg, bb);
+		return ERR_PTR(-ENOENT);
+	}
+
+	spin_lock(&pdata->list_lock);
+	list_for_each_entry(bb_info, &pdata->bb_list, node) {
+		if (bb_info->cmg == cmg && bb_info->bb == bb) {
+			kref_get(&bb_info->kref);
+			spin_unlock(&pdata->list_lock);
+			return bb_info;
+		}
+	}
+	spin_unlock(&pdata->list_lock);
+
+	pr_err("BB is not allocated by this process: %u/%u\n", cmg, bb);
+	return ERR_PTR(-EPERM);
+}
+
 static inline void put_bb_info(struct bb_info *bb_info)
 {
 	kref_put(&bb_info->kref, free_bb_info);
@@ -347,6 +375,162 @@ static int ioc_bb_alloc(struct file *filp, void __user *argp)
 	return ret;
 }
 
+static bool is_bound_only_one_pe(void)
+{
+	if (current->nr_cpus_allowed == 1)
+		return true;
+
+	pr_err("Thread must be bound to one PE between assign and unassign\n");
+	return false;
+}
+
+/* Check if this PE can be assignable and set window number to be used to @bw_ctl->window */
+static int is_bw_assignable(struct bb_info *bb_info, struct fujitsu_hwb_ioc_bw_ctl *bw_ctl, int cpu)
+{
+	int i;
+
+	if (!cpumask_test_cpu(cpu, bb_info->pemask)) {
+		pr_err("This pe is not supposed to join sync, %u/%u/%d\n",
+						bb_info->cmg, bb_info->bb, cpu);
+		return -EINVAL;
+	}
+
+	if (cpumask_test_cpu(cpu, bb_info->assigned_pemask)) {
+		pr_err("This pe is already assigned to window: %u/%u/%d\n",
+						bb_info->cmg, bb_info->bb, cpu);
+		return -EINVAL;
+	}
+
+	if (bw_ctl->window >= 0) {
+		/* User specifies window number to use. Check if available */
+		if (bw_ctl->window >= _hwinfo.num_bw) {
+			pr_err("Window number is invalid: %u/%u/%d/%u\n",
+						bb_info->cmg, bb_info->bb, cpu, bw_ctl->window);
+			return -EINVAL;
+		}
+
+		if (test_bit(bw_ctl->window, &_hwinfo.used_bw_bmap[cpu])) {
+			pr_err("Window is already used: %u/%u/%d/%u\n",
+						bb_info->cmg, bb_info->bb, cpu, bw_ctl->window);
+			return -EBUSY;
+		}
+	} else {
+		/* User does not specify window number. Use free window */
+		i = ffz(_hwinfo.used_bw_bmap[cpu]);
+		if (i == _hwinfo.num_bw) {
+			pr_err("There is no free window: %u/%u/%d\n",
+					bb_info->cmg, bb_info->bb, cpu);
+			return -EBUSY;
+		}
+
+		bw_ctl->window = i;
+	}
+
+	return 0;
+}
+
+static void setup_ctl_reg(struct bb_info *bb_info, int cpu)
+{
+	u64 val;
+
+	if (_hwinfo.used_bw_bmap[cpu] != 0)
+		/* Already setup. Nothing todo */
+		return;
+
+	/*
+	 * This is the first assign on this PE.
+	 * Setup ctrl reg to allow access to BST_SYNC/LBSY_SYNC from EL0
+	 */
+	val = (FHWB_CTRL_EL1_EL1AE | FHWB_CTRL_EL1_EL0AE);
+	write_sysreg_s(val, FHWB_CTRL_EL1);
+
+	pr_debug("Setup ctl reg. cpu: %d\n", cpu);
+}
+
+static void write_bw_reg(u8 window, u64 val)
+{
+	switch (window) {
+	case 0:
+		write_sysreg_s(val, FHWB_ASSIGN_SYNC_W0_EL1);
+		break;
+	case 1:
+		write_sysreg_s(val, FHWB_ASSIGN_SYNC_W1_EL1);
+		break;
+	case 2:
+		write_sysreg_s(val, FHWB_ASSIGN_SYNC_W2_EL1);
+		break;
+	case 3:
+		write_sysreg_s(val, FHWB_ASSIGN_SYNC_W3_EL1);
+		break;
+	}
+}
+
+static void setup_bw(struct bb_info *bb_info, struct fujitsu_hwb_ioc_bw_ctl *bw_ctl, int cpu)
+{
+	u64 val;
+	u8 ppe;
+
+	/* Set valid bit and bb number */
+	val = (FHWB_ASSIGN_SYNC_W_EL1_VALID | bw_ctl->bb);
+	write_bw_reg(bw_ctl->window, val);
+
+	/* Update bitmap info */
+	ppe = _hwinfo.core_map[cpu].ppe;
+	set_bit(bw_ctl->window, &_hwinfo.used_bw_bmap[cpu]);
+	cpumask_set_cpu(cpu, bb_info->assigned_pemask);
+	bb_info->bw[ppe] = bw_ctl->window;
+
+	pr_debug("Setup bw. cpu: %d, window: %u, BB: %u, bw_bmap: %lx, assigned_pemask: %*pbl\n",
+			cpu, bw_ctl->window, bw_ctl->bb,
+			_hwinfo.used_bw_bmap[cpu], cpumask_pr_args(bb_info->assigned_pemask));
+}
+
+static int ioc_bw_assign(struct file *filp, void __user *argp)
+{
+	struct hwb_private_data *pdata = (struct hwb_private_data *)filp->private_data;
+	struct fujitsu_hwb_ioc_bw_ctl bw_ctl;
+	struct bb_info *bb_info;
+	int ret;
+	int cpu;
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
+	/*
+	 * Barrier window register and control register is each PE's resource.
+	 * context switch is not supported and mutual exclusion is needed for
+	 * assign and unassign on this PE
+	 */
+	preempt_disable();
+	ret = is_bw_assignable(bb_info, &bw_ctl, cpu);
+	if (!ret) {
+		setup_ctl_reg(bb_info, cpu);
+		setup_bw(bb_info, &bw_ctl, cpu);
+	}
+	preempt_enable();
+
+	put_bb_info(bb_info);
+
+	/* Copy back window number to be used to user */
+	if (!ret && copy_to_user((struct fujitsu_hwb_ioc_bw_ctl __user *)argp, &bw_ctl,
+						sizeof(struct fujitsu_hwb_ioc_bw_ctl)))
+		/* Leave cleanup to f_op->release() */
+		return -EFAULT;
+
+	return ret;
+}
+
 static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
@@ -356,6 +540,9 @@ static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned
 	case FUJITSU_HWB_IOC_BB_ALLOC:
 		ret = ioc_bb_alloc(filp, argp);
 		break;
+	case FUJITSU_HWB_IOC_BW_ASSIGN:
+		ret = ioc_bw_assign(filp, argp);
+		break;
 	default:
 		ret = -ENOTTY;
 		break;
diff --git a/include/uapi/linux/fujitsu_hpc_ioctl.h b/include/uapi/linux/fujitsu_hpc_ioctl.h
index c87a5bad3f59..ad90f8f3ae9a 100644
--- a/include/uapi/linux/fujitsu_hpc_ioctl.h
+++ b/include/uapi/linux/fujitsu_hpc_ioctl.h
@@ -17,7 +17,14 @@ struct fujitsu_hwb_ioc_bb_ctl {
 	unsigned long __user *pemask;
 };
 
+struct fujitsu_hwb_ioc_bw_ctl {
+	__u8 bb;
+	__s8 window;
+};
+
 #define FUJITSU_HWB_IOC_BB_ALLOC _IOWR(__FUJITSU_IOCTL_MAGIC, \
 	0x00, struct fujitsu_hwb_ioc_bb_ctl)
+#define FUJITSU_HWB_IOC_BW_ASSIGN _IOWR(__FUJITSU_IOCTL_MAGIC, \
+	0x01, struct fujitsu_hwb_ioc_bw_ctl)
 
 #endif /* _UAPI_LINUX_FUJITSU_HPC_IOC_H */
-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
