Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE81BC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:45:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5955222D01
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5955222D01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RRa8hD8zA3UzvonLWsewzCb/oMQJwq0tmqyO7gF+uOk=; b=ggvSwlNL7TggK7pagG7Gl3MTu
	ZmGENSN1bcfalUDEgQoOlbFv7v11ERkp4wK3fV6fKCj4aNO7YlO/Tr/SfhptKxYx3pUb4BJZ5jpAi
	XK+nV/cLJ4ofd72B8pe/oLCJKg432zp5t863VgsuXklMxsVZ7ek8rHB48Dz1yqGwzMXG9gD9D6eZd
	UyFeKMgNu4E+cUEhaYgqDS1m96cie/NNazmUPkBblt/Pd5qP9HphqRm3xAe1mRYXDXdrj5qeBrqms
	+R85dt90F/jeY8dCtTphejIB7FyeJOEIpmSM1LVXEvWflt0k8FyTsDc3yw36ZKFBhDL+D1MX6jCaU
	A7y/Wpjzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxpEm-0003JC-N8; Fri, 08 Jan 2021 10:43:20 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxpCA-0002nm-SF
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:40:43 +0000
IronPort-SDR: C245A4XtqInidD5TcHw17Nl4eBf6XWiFx8YHLb5wPMUzeQRV22uDSFKybg/FWOoOBWv/fncCJg
 X6IbqJEFbZjX/ABDnfAa6QwHQcvaeTNGoJQ0ubRaa9wgBUlof5qWPc3rDwSQQmb0hDk5Gnh2Dl
 IUyhrNudVQu9GppH8ZEZ/RqU2CTSWVEp9NtdRKZXzmkVHg7sQw//vdMyk2U+12vdj8CkvXrE0R
 8MrYRztxXsqWey0gy7Z0mHMVFZvqF9eDeG+mr+TiFJuyBNB5lRYm92RQuX8Di6chSTLEZn6qVC
 7GM=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14093493"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; d="scan'208";a="14093493"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa6.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:40:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A363421EC60
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:40:35 +0900 (JST)
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
 (g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
 by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 036695AEEB6
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:40:35 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local
 (G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
 by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id E298EBD685E;
 Fri,  8 Jan 2021 19:40:33 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:40:31 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
Subject: [PATCH 03/10] soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
Date: Fri, 8 Jan 2021 19:52:34 +0900
Message-ID: <20210108105241.1757799-4-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_054039_166331_1A3DBC42 
X-CRM114-Status: GOOD (  25.15  )
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
Message-ID: <20210108105234.RAYG7DY2WRHQwwErcQ5qiLMF-M4kdTi9MXqURcphzEw@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
