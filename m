Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01334C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:43:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 844732395B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 844732395B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2gvQMqfJwNQi524fk8jZYQBkiV1W7+kzuoRzJxioukg=; b=0wnu9myE1uI/8JyqOd/7zxbeJ
	vN7Lwm4ksp6SCQwh+nLhsvaHGMlxAfdb91HKZJk1pfgen2cqi3FRaHrS4jBZDBGHBOpFzAaG3+EY9
	Q5DTm5cTnSyOy7Aql0PhtpXg2+hg6e6jrKPBM7YfNWw5e//qyBgQN38RAZVPZMcVPzDMdeTZlbLrm
	Av3QB8eNCwjalGDw3Jqs7XQ8TDPAsJRAUszZgRQENlev3Zbp3eKqGXJ5hgSbNiIjY002Px82YeYk8
	BW22ptXyNyd/09QNjr9HjMnPkMuw+JAhlF3jmwJcdcS5PxPOK3DHkwaKFwoWpJ2cz7qDpwdRYeZbC
	t0DiJXX4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxpCw-0002u4-17; Fri, 08 Jan 2021 10:41:26 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxpC9-0002nR-Ly
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:40:38 +0000
IronPort-SDR: eSNfkxgjiWQ9yD9dZef52n5GMFlwahjdajKvLNlc2olCxRUAKTOa1JU7KgtVwD3GNVxcIilfDh
 NMetY93s+/u7Axc4JmxdTlYLEZhSiSK4gIr7xsiLojhXeGw2Y7G4vdZAPAj4k9L4UNLa+8OhmH
 dcehdpFKB/skNx7wjmDaplWxnyxqcMY3fYWmcC3pIIUSy/A+Wt31JCw+dwrjuCQQ4Z7ZySu8NS
 hR/cilPlBRoPjmUNz6lSBja/sgAbKAia+ZFyPi+eJ5oach7Z6J5CRoR0rf+NILIIgHMS9SElrZ
 tTQ=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="2149303"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="2149303"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
 by esa10.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:40:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com
 [192.168.87.60])
 by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 933BD32F7C1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:40:34 +0900 (JST)
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
 (g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
 by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DE1BD1532E
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:40:33 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local
 (G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
 by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id D0041BD685E;
 Fri,  8 Jan 2021 19:40:32 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:40:30 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
Subject: [PATCH 01/10] soc: fujitsu: hwb: Add hardware barrier driver
 init/exit code
Date: Fri, 8 Jan 2021 19:52:32 +0900
Message-ID: <20210108105241.1757799-2-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_054037_899081_BCD3AFDF 
X-CRM114-Status: GOOD (  25.25  )
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
Message-ID: <20210108105232.A6jGIHXnqKL444ASmnFHkNZuLowUw46o1aZhsDLQl98@z>

This adds hardware barrier driver's struct definitions and
module init/exit code. We use miscdeice for barrier driver ioctl
and /dev/fujitsu_hwb will be created upon module load.
Following commits will add each ioctl definition.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/soc/fujitsu/fujitsu_hwb.c | 313 ++++++++++++++++++++++++++++++
 1 file changed, 313 insertions(+)
 create mode 100644 drivers/soc/fujitsu/fujitsu_hwb.c

diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
new file mode 100644
index 000000000000..44c32c1683df
--- /dev/null
+++ b/drivers/soc/fujitsu/fujitsu_hwb.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020 FUJITSU LIMITED
+ *
+ * This hardware barrier (HWB) driver provides a set of ioctls to realize synchronization
+ * by PEs in the same Come Memory Group (CMG) by using implementation defined registers.
+ * On A64FX, CMG is the same as L3 cache domain.
+ *
+ * The main purpose of the driver is setting up registers which cannot be accessed
+ * from EL0. However, after initialization, BST_SYNC/LBSY_SYNC registers which is used
+ * in synchronization main logic can be accessed from EL0 (therefore it is fast).
+ *
+ * Simplified barrier operation flow of user application is as follows:
+ *  (one PE)
+ *    1. Call IOC_BB_ALLOC to setup INIT_SYNC register which is shared in a CMG.
+ *       This specifies which PEs join synchronization
+ *  (on each PE joining synchronization)
+ *    2. Call IOC_BW_ASSIGN to setup ASSIGN_SYNC register per PE
+ *    3. Barrier main logic (all logic runs in EL0)
+ *      a) Write 1 to BST_SYNC register
+ *      b) Read LBSY_SYNC register
+ *      c) If LBSY_SYNC value is 1, sync is finished, otherwise go back to b
+ *         (If all PEs joining synchronization write 1 to BST_SYNC, LBSY_SYNC becomes 1)
+ *    4. Call IOC_BW_UNASSIGN to reset ASSIGN_SYNC register
+ *  (one PE)
+ *    5. Call IOC_BB_FREE to reset INIT_SYNC register
+ */
+
+#include <asm/cputype.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+#include <linux/wait.h>
+
+#ifdef pr_fmt
+#undef pr_fmt
+#endif
+#define pr_fmt(fmt) "[%s:%s:%d] " fmt, KBUILD_MODNAME, __func__, __LINE__
+
+/* Since miscdevice is used, /dev/fujitsu_hwb will be created when module is loaded */
+#define FHWB_DEV_NAME "fujitsu_hwb"
+
+/* Implementation defined registers for barrier shared in CMG */
+#define FHWB_INIT_SYNC_BB0_EL1  sys_reg(3, 0, 15, 13, 0)
+#define FHWB_INIT_SYNC_BB1_EL1  sys_reg(3, 0, 15, 13, 1)
+#define FHWB_INIT_SYNC_BB2_EL1  sys_reg(3, 0, 15, 13, 2)
+#define FHWB_INIT_SYNC_BB3_EL1  sys_reg(3, 0, 15, 13, 3)
+#define FHWB_INIT_SYNC_BB4_EL1  sys_reg(3, 0, 15, 13, 4)
+#define FHWB_INIT_SYNC_BB5_EL1  sys_reg(3, 0, 15, 13, 5)
+
+/* Implementation defined registers for barrier per PE */
+#define FHWB_CTRL_EL1           sys_reg(3, 0, 11, 12, 0)
+#define FHWB_BST_BIT_EL1        sys_reg(3, 0, 11, 12, 4)
+#define FHWB_ASSIGN_SYNC_W0_EL1 sys_reg(3, 0, 15, 15, 0)
+#define FHWB_ASSIGN_SYNC_W1_EL1 sys_reg(3, 0, 15, 15, 1)
+#define FHWB_ASSIGN_SYNC_W2_EL1 sys_reg(3, 0, 15, 15, 2)
+#define FHWB_ASSIGN_SYNC_W3_EL1 sys_reg(3, 0, 15, 15, 3)
+
+/* Field definitions for above registers */
+#define FHWB_INIT_SYNC_BB_EL1_MASK_FIELD  GENMASK_ULL(44, 32)
+#define FHWB_INIT_SYNC_BB_EL1_BST_FIELD   GENMASK_ULL(12, 0)
+#define FHWB_CTRL_EL1_EL1AE               BIT_ULL(63)
+#define FHWB_CTRL_EL1_EL0AE               BIT_ULL(62)
+#define FHWB_BST_BIT_EL1_CMG_FILED        GENMASK_ULL(5, 4)
+#define FHWB_BST_BIT_EL1_PE_FILED         GENMASK_ULL(3, 0)
+#define FHWB_ASSIGN_SYNC_W_EL1_VALID      BIT_ULL(63)
+
+static enum cpuhp_state _hp_state;
+
+/*
+ * Each PE has its own CMG and Physical PE number (determined by BST_BIT_EL1 register).
+ * Barrier operation can be performed by PEs which belong to the same CMG.
+ */
+struct pe_info {
+	/* CMG number of this PE */
+	u8 cmg;
+	/* Physical PE number of this PE */
+	u8 ppe;
+};
+
+/* Hardware information of running system */
+struct hwb_hwinfo {
+	/* CPU type (part number) */
+	unsigned int type;
+	/* Number of CMG */
+	u8 num_cmg;
+	/* Number of barrier blade(BB) per CMG */
+	u8 num_bb;
+	/* Number of barrier window(BW) per PE */
+	u8 num_bw;
+	/*
+	 * Maximum number of PE per CMG.
+	 * Depending on BIOS configuration, each CMG has up to max_pe_per_cmg PEs
+	 * and each PE has unique physical PE number between 0 ~ (max_pe_per_cmg-1)
+	 */
+	u8 max_pe_per_cmg;
+
+	/* Bitmap for currently allocated BB per CMG */
+	unsigned long *used_bb_bmap;
+	/* Bitmap for currently allocated BW per PE */
+	unsigned long *used_bw_bmap;
+	/* Mapping table of cpuid -> CMG/PE number */
+	struct pe_info *core_map;
+};
+static struct hwb_hwinfo _hwinfo;
+
+/* List for barrier blade currently used per FD */
+struct hwb_private_data {
+	struct list_head bb_list;
+	spinlock_t list_lock;
+};
+
+/* Each barrier blade info */
+#define BB_FREEING 1
+struct bb_info {
+	/* cpumask for PEs which participate synchronization */
+	cpumask_var_t pemask;
+	/* cpumask for PEs which currently assigned BW for this BB */
+	cpumask_var_t assigned_pemask;
+	/* Added to hwb_private_data::bb_list */
+	struct list_head node;
+	/* For indicating if this bb is currently being freed or not */
+	unsigned long flag;
+	/* For waiting ongoing assign/unassign operation to finish before freeing BB */
+	wait_queue_head_t wq;
+	/* Track ongoing assign/unassign operation count */
+	atomic_t ongoing_assign_count;
+	/* CMG  number of this blade */
+	u8 cmg;
+	/* BB number of this blade */
+	u8 bb;
+	/* Hold assigned window number of each PE corresponding to @assigned_pemask */
+	u8 *bw;
+	/* Track usage count as IOC_BB_FREE and IOC_BW_[UN]ASSIGN might be run in parallel */
+	struct kref kref;
+};
+static struct kmem_cache *bb_info_cachep;
+
+static const struct file_operations fujitsu_hwb_dev_fops = {
+	.owner          = THIS_MODULE,
+};
+
+static struct miscdevice bar_miscdev = {
+	.fops  = &fujitsu_hwb_dev_fops,
+	.minor = MISC_DYNAMIC_MINOR,
+	.mode  = 0666,
+	.name  = FHWB_DEV_NAME,
+};
+
+static void destroy_bb_info_cachep(void)
+{
+	kmem_cache_destroy(bb_info_cachep);
+}
+
+static int __init init_bb_info_cachep(void)
+{
+	/*
+	 * Since cpumask value will be copied from userspace to the beginning of
+	 * struct bb_info, use kmem_cache_create_usercopy to mark that region.
+	 * Otherwise CONFIG_HARDENED_USERCOPY gives user_copy_warn.
+	 */
+	bb_info_cachep = kmem_cache_create_usercopy("bb_info_cache", sizeof(struct bb_info),
+			0, SLAB_HWCACHE_ALIGN, 0, sizeof(cpumask_var_t), NULL);
+	if (bb_info_cachep == NULL)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void free_map(void)
+{
+	kfree(_hwinfo.used_bw_bmap);
+	kfree(_hwinfo.used_bb_bmap);
+	kfree(_hwinfo.core_map);
+}
+
+static int __init alloc_map(void)
+{
+	_hwinfo.core_map = kcalloc(num_possible_cpus(), sizeof(struct pe_info), GFP_KERNEL);
+	_hwinfo.used_bb_bmap = kcalloc(_hwinfo.num_cmg, sizeof(unsigned long), GFP_KERNEL);
+	_hwinfo.used_bw_bmap = kcalloc(num_possible_cpus(), sizeof(unsigned long), GFP_KERNEL);
+	if (!_hwinfo.core_map || !_hwinfo.used_bb_bmap || !_hwinfo.used_bw_bmap)
+		goto fail;
+
+	/* 0 is valid number for both CMG/PE. Set all bits to 1 to represents uninitialized state */
+	memset(_hwinfo.core_map, 0xFF, sizeof(struct pe_info) * num_possible_cpus());
+
+	return 0;
+
+fail:
+	free_map();
+	return -ENOMEM;
+}
+
+/* Get this system's CPU type (part number). If it is not fujitsu CPU, return -1 */
+static int __init get_cpu_type(void)
+{
+	if (read_cpuid_implementor() != ARM_CPU_IMP_FUJITSU)
+		return -1;
+
+	return read_cpuid_part_number();
+}
+
+static int __init setup_hwinfo(void)
+{
+	int type;
+
+	type = get_cpu_type();
+	if (type < 0)
+		return -ENODEV;
+
+	_hwinfo.type = type;
+	switch (type) {
+	case FUJITSU_CPU_PART_A64FX:
+		_hwinfo.num_cmg = 4;
+		_hwinfo.num_bb = 6;
+		_hwinfo.num_bw = 4;
+		_hwinfo.max_pe_per_cmg = 13;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int hwb_cpu_online(unsigned int cpu)
+{
+	u64 val;
+	int i;
+
+	/* Setup core_map by reading BST_BIT_EL1 register of each PE */
+	val = read_sysreg_s(FHWB_BST_BIT_EL1);
+	_hwinfo.core_map[cpu].cmg = FIELD_GET(FHWB_BST_BIT_EL1_CMG_FILED, val);
+	_hwinfo.core_map[cpu].ppe = FIELD_GET(FHWB_BST_BIT_EL1_PE_FILED, val);
+
+	/* Since these registers' values are UNKNOWN on reset, explicitly clear all */
+	for (i = 0; i < _hwinfo.num_bw; i++)
+		write_bw_reg(i, 0);
+
+	write_sysreg_s(0, FHWB_CTRL_EL1);
+
+	return 0;
+}
+
+static int __init hwb_init(void)
+{
+	int ret;
+
+	ret = setup_hwinfo();
+	if (ret < 0) {
+		pr_err("Unsupported CPU type\n");
+		return ret;
+	}
+
+	ret = alloc_map();
+	if (ret < 0)
+		return ret;
+
+	ret = init_bb_info_cachep();
+	if (ret < 0)
+		goto out1;
+
+	/*
+	 * Setup cpuhp callback to ensure each PE's resource will be initialized
+	 * even if some PEs are offline at this point
+	 */
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/fujitsu_hwb:online",
+		hwb_cpu_online, NULL);
+	if (ret < 0) {
+		pr_err("cpuhp setup failed: %d\n", ret);
+		goto out2;
+	}
+	_hp_state = ret;
+
+	ret = misc_register(&bar_miscdev);
+	if (ret < 0) {
+		pr_err("misc_register failed: %d\n", ret);
+		goto out3;
+	}
+
+	return 0;
+
+out3:
+	cpuhp_remove_state(_hp_state);
+out2:
+	destroy_bb_info_cachep();
+out1:
+	free_map();
+
+	return ret;
+}
+
+static void __exit hwb_exit(void)
+{
+	misc_deregister(&bar_miscdev);
+	cpuhp_remove_state(_hp_state);
+	destroy_bb_info_cachep();
+	free_map();
+}
+
+module_init(hwb_init);
+module_exit(hwb_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("FUJITSU LIMITED");
+MODULE_DESCRIPTION("FUJITSU HPC Hardware Barrier Driver");
-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
