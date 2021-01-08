Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB19C433E9
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:21:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 093992376E; Fri,  8 Jan 2021 10:21:40 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3377823718;
	Fri,  8 Jan 2021 10:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3377823718
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: KTcDwsjJr1/j1kZU8e5kzcr4uO5YzdZ+AeutGL/u8zPPi7YDFxd4+HihHOjIZPnSqiSjMDTfYB
 BgeuGj80JqmD2PHWAjVyYNsymbEyil+gOKJDtOfYv5VLungzJFPSnWK0iU1A4KK3w7WjeoVdpm
 aAM47yBY7nEoC0/JqViB1EjOw6IfWfQ20478xQd2dmytH7WP4LQN4ASopQWTOa/6YYqfPcA5/W
 Cpq6WVYuJsJoJfiJ0VVbg0UTjao89NbATG//I2r+ehFmw0523gpN/3x7wFBdd7ij02hehCkL9y
 21U=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="2153484"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="2153484"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EBE7066;
	Fri,  8 Jan 2021 19:20:31 +0900 (JST)
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local (g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4866F1D955;
	Fri,  8 Jan 2021 19:20:31 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id 427976D68A7;
	Fri,  8 Jan 2021 19:20:30 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:20:28 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH 03/10] soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
Date: Fri, 8 Jan 2021 19:32:20 +0900
Message-ID: <20210108103227.1740865-4-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00

IOC_BB_ALLOC ioctl initialize INIT_SYNC register which represents
PEs in a CMG joining synchronization. Although we get cpumask of
PEs from userspace, INIT_SYNC register requires mask value based
on physical PE number which is written in each PE's BST register.
So we perform conversion of cpumask value in validate_and_conver_pemask().

Since INIT_SYNC register is a shared resource per CMG, we pick
up one PE and send IPI to it to write the register.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/soc/fujitsu/fujitsu_hwb.c      | 223 +++++++++++++++++++++++++
 include/uapi/linux/fujitsu_hpc_ioctl.h |  23 +++
 2 files changed, 246 insertions(+)
 create mode 100644 include/uapi/linux/fujitsu_hpc_ioctl.h

diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
index 1dec3d3c652f..24d1bb00f55c 100644
--- a/drivers/soc/fujitsu/fujitsu_hwb.c
+++ b/drivers/soc/fujitsu/fujitsu_hwb.c
@@ -38,6 +38,8 @@
 #include <linux/slab.h>
 #include <linux/wait.h>
 
+#include <linux/fujitsu_hpc_ioctl.h>
+
 #ifdef pr_fmt
 #undef pr_fmt
 #endif
@@ -142,6 +144,226 @@ struct bb_info {
 };
 static struct kmem_cache *bb_info_cachep;
 
+static void free_bb_info(struct kref *kref)
+{
+	struct bb_info *bb_info = container_of(kref, struct bb_info, kref);
+
+	free_cpumask_var(bb_info->assigned_pemask);
+	free_cpumask_var(bb_info->pemask);
+	kfree(bb_info->bw);
+	kmem_cache_free(bb_info_cachep, bb_info);
+}
+
+static struct bb_info *alloc_bb_info(void)
+{
+	struct bb_info *bb_info;
+
+	bb_info = kmem_cache_zalloc(bb_info_cachep, GFP_KERNEL);
+	if (!bb_info)
+		return NULL;
+
+	bb_info->bw = kcalloc(_hwinfo.max_pe_per_cmg, sizeof(u8), GFP_KERNEL);
+	if (!bb_info->bw) {
+		free_bb_info(&bb_info->kref);
+		return NULL;
+	}
+	if (!zalloc_cpumask_var(&bb_info->pemask, GFP_KERNEL) ||
+		!zalloc_cpumask_var(&bb_info->assigned_pemask, GFP_KERNEL)) {
+		free_bb_info(&bb_info->kref);
+		return NULL;
+	}
+
+	init_waitqueue_head(&bb_info->wq);
+	kref_init(&bb_info->kref);
+
+	return bb_info;
+}
+
+static inline void put_bb_info(struct bb_info *bb_info)
+{
+	kref_put(&bb_info->kref, free_bb_info);
+}
+
+/* Validate pemask's range and convert it to a mask based on physical PE number */
+static int validate_and_convert_pemask(struct bb_info *bb_info, unsigned long *phys_pemask)
+{
+	int cpu;
+	u8 cmg;
+
+	if (cpumask_weight(bb_info->pemask) < 2) {
+		pr_err("pemask needs at least two bit set: %*pbl\n",
+						cpumask_pr_args(bb_info->pemask));
+		return -EINVAL;
+	}
+
+	if (!cpumask_subset(bb_info->pemask, cpu_online_mask)) {
+		pr_err("pemask needs to be subset of online cpu: %*pbl, %*pbl\n",
+			cpumask_pr_args(bb_info->pemask), cpumask_pr_args(cpu_online_mask));
+		return -EINVAL;
+	}
+
+	/*
+	 * INIT_SYNC register requires a mask value based on physical PE number.
+	 * So convert pemask to it while checking if all PEs belongs to the same CMG
+	 */
+	cpu = cpumask_first(bb_info->pemask);
+	cmg = _hwinfo.core_map[cpu].cmg;
+	*phys_pemask = 0;
+	for_each_cpu(cpu, bb_info->pemask) {
+		if (_hwinfo.core_map[cpu].cmg != cmg) {
+			pr_err("All PEs must belong to the same CMG: %*pbl\n",
+							cpumask_pr_args(bb_info->pemask));
+			return -EINVAL;
+		}
+		set_bit(_hwinfo.core_map[cpu].ppe, phys_pemask);
+	}
+	bb_info->cmg = cmg;
+
+	pr_debug("pemask: %*pbl, physical_pemask: %lx\n",
+					cpumask_pr_args(bb_info->pemask), *phys_pemask);
+
+	return 0;
+}
+
+/* Search free BB in_hwinfo->used_bb_bitmap[cmg] */
+static int search_free_bb(u8 cmg)
+{
+	int i;
+
+	for (i = 0; i < _hwinfo.num_bb; i++) {
+		if (!test_and_set_bit(i, &_hwinfo.used_bb_bmap[cmg])) {
+			pr_debug("Use BB %u in CMG %u, bitmap: %lx\n",
+							i, cmg, _hwinfo.used_bb_bmap[cmg]);
+			return i;
+		}
+	}
+
+	pr_err("All barrier blade is currently used in CMG %u\n", cmg);
+	return -EBUSY;
+}
+
+struct init_sync_args {
+	u64 val;
+	u8 bb;
+};
+
+static void write_init_sync_reg(void *args)
+{
+	struct init_sync_args *sync_args = (struct init_sync_args *)args;
+
+	switch (sync_args->bb) {
+	case 0:
+		write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB0_EL1);
+		break;
+	case 1:
+		write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB1_EL1);
+		break;
+	case 2:
+		write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB2_EL1);
+		break;
+	case 3:
+		write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB3_EL1);
+		break;
+	case 4:
+		write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB4_EL1);
+		break;
+	case 5:
+		write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB5_EL1);
+		break;
+	}
+}
+
+/* Send IPI to initialize INIT_SYNC register */
+static void setup_bb(struct bb_info *bb_info, unsigned long phys_pemask)
+{
+	struct init_sync_args args = {0};
+	int cpu;
+
+	/* INIT_SYNC register is shared resource in CMG. Pick one PE to set it up */
+	cpu = cpumask_any(bb_info->pemask);
+
+	args.bb = bb_info->bb;
+	args.val = FIELD_PREP(FHWB_INIT_SYNC_BB_EL1_MASK_FIELD, phys_pemask);
+	on_each_cpu_mask(cpumask_of(cpu), write_init_sync_reg, &args, 1);
+
+	pr_debug("Setup bb. cpu: %d, CMG: %u, BB: %u, bimtap: %lx\n",
+			cpu, bb_info->cmg, bb_info->bb, _hwinfo.used_bb_bmap[bb_info->cmg]);
+}
+
+static int ioc_bb_alloc(struct file *filp, void __user *argp)
+{
+	struct hwb_private_data *pdata = (struct hwb_private_data *)filp->private_data;
+	struct fujitsu_hwb_ioc_bb_ctl bb_ctl;
+	struct bb_info *bb_info;
+	unsigned long physical_pemask;
+	unsigned int size;
+	int ret;
+
+	if (copy_from_user(&bb_ctl, (struct fujitsu_hwb_ioc_bb_ctl __user *)argp,
+						sizeof(struct fujitsu_hwb_ioc_bb_ctl)))
+		return -EFAULT;
+
+	bb_info = alloc_bb_info();
+	if (!bb_info)
+		return -ENOMEM;
+
+	/* cpumask size may vary in user and kernel space. Use the smaller one */
+	size = min(cpumask_size(), bb_ctl.size);
+	if (copy_from_user(bb_info->pemask, bb_ctl.pemask, size)) {
+		ret = -EFAULT;
+		goto put_bb_info;
+	}
+
+	ret = validate_and_convert_pemask(bb_info, &physical_pemask);
+	if (ret < 0)
+		goto put_bb_info;
+
+	ret = search_free_bb(bb_info->cmg);
+	if (ret < 0)
+		goto put_bb_info;
+	bb_info->bb = ret;
+
+	/* Copy back CMG/BB number to be used to user */
+	bb_ctl.cmg = bb_info->cmg;
+	bb_ctl.bb  = bb_info->bb;
+	if (copy_to_user((struct fujitsu_hwb_ioc_bb_ctl __user *)argp, &bb_ctl,
+						sizeof(struct fujitsu_hwb_ioc_bb_ctl))) {
+		ret = -EFAULT;
+		clear_bit(bb_ctl.bb, &_hwinfo.used_bb_bmap[bb_ctl.cmg]);
+		goto put_bb_info;
+	}
+
+	setup_bb(bb_info, physical_pemask);
+
+	spin_lock(&pdata->list_lock);
+	list_add_tail(&bb_info->node, &pdata->bb_list);
+	spin_unlock(&pdata->list_lock);
+
+	return 0;
+
+put_bb_info:
+	put_bb_info(bb_info);
+
+	return ret;
+}
+
+static long fujitsu_hwb_dev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	void __user *argp = (void __user *)arg;
+	int ret;
+
+	switch (cmd) {
+	case FUJITSU_HWB_IOC_BB_ALLOC:
+		ret = ioc_bb_alloc(filp, argp);
+		break;
+	default:
+		ret = -ENOTTY;
+		break;
+	}
+
+	return ret;
+}
+
 static int fujitsu_hwb_dev_open(struct inode *inode, struct file *filp)
 {
 	struct hwb_private_data *pdata;
@@ -164,6 +386,7 @@ static int fujitsu_hwb_dev_open(struct inode *inode, struct file *filp)
 static const struct file_operations fujitsu_hwb_dev_fops = {
 	.owner          = THIS_MODULE,
 	.open           = fujitsu_hwb_dev_open,
+	.unlocked_ioctl = fujitsu_hwb_dev_ioctl,
 };
 
 static struct miscdevice bar_miscdev = {
diff --git a/include/uapi/linux/fujitsu_hpc_ioctl.h b/include/uapi/linux/fujitsu_hpc_ioctl.h
new file mode 100644
index 000000000000..c87a5bad3f59
--- /dev/null
+++ b/include/uapi/linux/fujitsu_hpc_ioctl.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/* Copyright 2020 FUJITSU LIMITED */
+#ifndef _UAPI_LINUX_FUJITSU_HPC_IOC_H
+#define _UAPI_LINUX_FUJITSU_HPC_IOC_H
+
+#include <linux/ioctl.h>
+#include <asm/types.h>
+
+#define __FUJITSU_IOCTL_MAGIC 'F'
+
+/* ioctl definitions for hardware barrier driver */
+struct fujitsu_hwb_ioc_bb_ctl {
+	__u8 cmg;
+	__u8 bb;
+	__u8 unused[2];
+	__u32 size;
+	unsigned long __user *pemask;
+};
+
+#define FUJITSU_HWB_IOC_BB_ALLOC _IOWR(__FUJITSU_IOCTL_MAGIC, \
+	0x00, struct fujitsu_hwb_ioc_bb_ctl)
+
+#endif /* _UAPI_LINUX_FUJITSU_HPC_IOC_H */
-- 
2.26.2

