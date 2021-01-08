Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBFAC43381
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:40:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E392C238D6; Fri,  8 Jan 2021 10:40:43 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 281342388C;
	Fri,  8 Jan 2021 10:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 281342388C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: fRjlUFoZTkipdCyi/vM845f55uYU1yGxY9ku3a4doZzs82btRpoWqvotYzfnVGwctywE5R2eOf
 LTtTytlk/6/d0QTXpz+SI8XCfE6J8UD5cyA5JYRgLqoom/RX4Vz3fjZaeHV9PD8cF4A4jvgozO
 VR+wapgMaB+5iKn9pWa3lCBcBy5fZZKz88Zb8vhq0sOReAZLVmkVWw7Lntb42/OaBbpY7No+Fk
 kXKTpIngcsUIVAXsl4AGGwoqAbeNaPxY1clt5nY/X15x70DuvyXrfzC/E+sidqfxlAr5IzAMmt
 6KI=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="2155283"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="2155283"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:40:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3415EE0371;
	Fri,  8 Jan 2021 19:40:37 +0900 (JST)
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local (g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 771041532E;
	Fri,  8 Jan 2021 19:40:36 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local (G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id 58514328871;
	Fri,  8 Jan 2021 19:40:35 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:40:32 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH 09/10] soc: fujitsu: hwb: Add sysfs entry
Date: Fri, 8 Jan 2021 19:52:40 +0900
Message-ID: <20210108105241.1757799-10-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00

This adds sysfs entry per CMG to show running barrier driver status
for debugging user application. The following entries will be created:

/sys/class/misc/fujitsu_hwb
 |- hwinfo ... number of CMG/BB/BW/pe_per_cmg on running system
 |- CMG0
     |- core_map      ... cpuid belonging to this CMG
     |- used_bb_bmap  ... bitmap of currently allocated BB
     |- used_bw_bmap  ... bitmap of currently allocated BW
     |- init_sync_bb0 ... current value of INIT_SYNC register 0
     |- init_sync_bb1 ... current value of INIT_SYNC register 1
     ...
 |- CMG1
  ...

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 drivers/soc/fujitsu/fujitsu_hwb.c | 258 ++++++++++++++++++++++++++++++
 1 file changed, 258 insertions(+)

diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
index 46f1f244f93a..a3a0e314f63a 100644
--- a/drivers/soc/fujitsu/fujitsu_hwb.c
+++ b/drivers/soc/fujitsu/fujitsu_hwb.c
@@ -32,6 +32,7 @@
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/kernel.h>
+#include <linux/kobject.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
@@ -931,6 +932,254 @@ static int hwb_cpu_online(unsigned int cpu)
 	return 0;
 }
 
+static void read_init_sync_reg(void *args)
+{
+	struct init_sync_args *sync_args = (struct init_sync_args *)args;
+	u64 val = 0;
+
+	switch (sync_args->bb) {
+	case 0:
+		val = read_sysreg_s(FHWB_INIT_SYNC_BB0_EL1);
+		break;
+	case 1:
+		val = read_sysreg_s(FHWB_INIT_SYNC_BB1_EL1);
+		break;
+	case 2:
+		val = read_sysreg_s(FHWB_INIT_SYNC_BB2_EL1);
+		break;
+	case 3:
+		val = read_sysreg_s(FHWB_INIT_SYNC_BB3_EL1);
+		break;
+	case 4:
+		val = read_sysreg_s(FHWB_INIT_SYNC_BB4_EL1);
+		break;
+	case 5:
+		val = read_sysreg_s(FHWB_INIT_SYNC_BB5_EL1);
+		break;
+	}
+
+	sync_args->val = val;
+}
+
+struct hwb_attr {
+	struct kobj_attribute attr;
+	u8 bb;
+};
+static struct hwb_attr *battr;
+
+/* kobject for each CMG */
+static struct kobject **cmg_kobj;
+
+/* Get CMG number based on index value of cmg_kobj */
+static int get_cmg_from_kobj(struct kobject *kobj)
+{
+	int i;
+
+	for (i = 0; i < _hwinfo.num_cmg; i++) {
+		if (cmg_kobj[i] == kobj)
+			return i;
+	}
+	/* should not happen */
+	WARN_ON_ONCE("cmg_kobj not found\n");
+	return 0;
+}
+
+static ssize_t hwb_init_sync_bb_show(struct kobject *kobj,
+					 struct kobj_attribute *attr, char *buf)
+{
+	struct hwb_attr *battr = container_of(attr, struct hwb_attr, attr);
+	struct init_sync_args args = {0};
+	ssize_t written = 0;
+	int cpu;
+	int cmg;
+	u64 mask;
+	u64 bst;
+
+	/* Find online cpu in target cmg */
+	cmg = get_cmg_from_kobj(kobj);
+	for_each_online_cpu(cpu) {
+		if (_hwinfo.core_map[cpu].cmg == cmg)
+			break;
+	}
+	if (cpu >= nr_cpu_ids)
+		return 0;
+
+	/* Send IPI to read INIT_SYNC register */
+	args.bb = battr->bb;
+	on_each_cpu_mask(cpumask_of(cpu), read_init_sync_reg, &args, 1);
+
+	mask = FIELD_GET(FHWB_INIT_SYNC_BB_EL1_MASK_FIELD, args.val);
+	bst = FIELD_GET(FHWB_INIT_SYNC_BB_EL1_BST_FIELD, args.val);
+
+	written += scnprintf(buf, PAGE_SIZE, "%04llx\n", mask);
+	written += scnprintf(buf + written, PAGE_SIZE - written, "%04llx\n", bst);
+
+	return written;
+}
+
+#define BARRIER_ATTR(name) \
+static struct kobj_attribute hwb_##name##_attribute = \
+	__ATTR(name, 0444, hwb_##name##_show, NULL)
+
+static ssize_t hwb_hwinfo_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	return scnprintf(buf, PAGE_SIZE, "%d %d %d %d\n",
+				_hwinfo.num_cmg, _hwinfo.num_bb,
+				_hwinfo.num_bw, _hwinfo.max_pe_per_cmg);
+}
+BARRIER_ATTR(hwinfo);
+
+static ssize_t hwb_used_bb_bmap_show(struct kobject *kobj,
+					 struct kobj_attribute *attr, char *buf)
+{
+	int cmg;
+
+	cmg = get_cmg_from_kobj(kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%04lx\n", _hwinfo.used_bb_bmap[cmg]);
+}
+BARRIER_ATTR(used_bb_bmap);
+
+static ssize_t hwb_used_bw_bmap_show(struct kobject *kobj,
+					 struct kobj_attribute *attr, char *buf)
+{
+	ssize_t written = 0;
+	int cmg;
+	int cpu;
+
+	cmg = get_cmg_from_kobj(kobj);
+	for (cpu = 0; cpu < num_possible_cpus(); cpu++) {
+		if (_hwinfo.core_map[cpu].cmg == cmg)
+			written += scnprintf(buf + written, PAGE_SIZE - written, "%d %04lx\n",
+						 cpu, _hwinfo.used_bw_bmap[cpu]);
+	}
+
+	return written;
+}
+BARRIER_ATTR(used_bw_bmap);
+
+static ssize_t hwb_core_map_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	ssize_t written = 0;
+	int cmg;
+	int cpu;
+
+	cmg = get_cmg_from_kobj(kobj);
+	for (cpu = 0; cpu < num_possible_cpus(); cpu++) {
+		if (_hwinfo.core_map[cpu].cmg == cmg)
+			written += scnprintf(buf + written, PAGE_SIZE - written, "%d %d\n",
+				cpu, _hwinfo.core_map[cpu].ppe);
+	}
+
+	return written;
+}
+BARRIER_ATTR(core_map);
+
+static struct attribute *hwb_attrs[] = {
+	&hwb_used_bb_bmap_attribute.attr,
+	&hwb_used_bw_bmap_attribute.attr,
+	&hwb_core_map_attribute.attr,
+	NULL,
+};
+
+static const struct attribute_group hwb_attribute = {
+	.attrs = hwb_attrs,
+};
+
+static void destroy_sysfs(void)
+{
+	int cmg;
+	int bb;
+	int i;
+
+	sysfs_remove_file(&bar_miscdev.this_device->kobj, &hwb_hwinfo_attribute.attr);
+
+	for (cmg = 0; cmg < _hwinfo.num_cmg; cmg++) {
+		for (bb = 0; bb < _hwinfo.num_bb; bb++) {
+			i = (cmg * _hwinfo.num_bb) + bb;
+			if (battr[i].attr.attr.name)
+				sysfs_remove_file(cmg_kobj[cmg], &battr[i].attr.attr);
+		}
+	}
+	kfree(battr);
+
+	for (cmg = 0; cmg < _hwinfo.num_cmg; cmg++) {
+		if (cmg_kobj[cmg]) {
+			sysfs_remove_group(cmg_kobj[cmg], &hwb_attribute);
+			kobject_put(cmg_kobj[cmg]);
+		}
+	}
+	kfree(cmg_kobj);
+}
+
+/* Create sysfs file under /sys/class/misc/fujitsu_hwb */
+#define NAME_LEN 16
+static int __init init_sysfs(void)
+{
+	char name[NAME_LEN];
+	int ret;
+	int cmg;
+	int bb;
+	int i;
+
+	/* Create file to show number of CMG/BB/BW/pe_per_cmg */
+	ret = sysfs_create_file(&bar_miscdev.this_device->kobj, &hwb_hwinfo_attribute.attr);
+	if (ret)
+		return ret;
+
+	cmg_kobj = kcalloc(_hwinfo.num_cmg, sizeof(struct kobject *), GFP_KERNEL);
+	battr = kcalloc(_hwinfo.num_cmg * _hwinfo.num_bb, sizeof(struct hwb_attr), GFP_KERNEL);
+	if (!cmg_kobj || !battr) {
+		kfree(cmg_kobj);
+		kfree(battr);
+		return -ENOMEM;
+	}
+
+	/* Create folder for each CMG and create core_map/bitmap file */
+	for (cmg = 0; cmg < _hwinfo.num_cmg; cmg++) {
+		scnprintf(name, NAME_LEN, "CMG%d", cmg);
+		cmg_kobj[cmg] = kobject_create_and_add(name, &bar_miscdev.this_device->kobj);
+		if (!cmg_kobj[cmg]) {
+			ret = -ENOMEM;
+			goto fail;
+		}
+
+		ret = sysfs_create_group(cmg_kobj[cmg], &hwb_attribute);
+		if (ret)
+			goto fail;
+	}
+
+	/* Create files for INIT_SYNC register */
+	for (cmg = 0; cmg < _hwinfo.num_cmg; cmg++) {
+		for (bb = 0; bb < _hwinfo.num_bb; bb++) {
+			i = (cmg * _hwinfo.num_bb) + bb;
+
+			scnprintf(name, NAME_LEN, "init_sync_bb%d", bb);
+			battr[i].bb = bb;
+			battr[i].attr.attr.name = kstrdup(name, GFP_KERNEL);
+			if (!battr[i].attr.attr.name) {
+				ret = -ENOMEM;
+				goto fail;
+			}
+			battr[i].attr.attr.mode = 0400; /* root only */
+			battr[i].attr.show = hwb_init_sync_bb_show;
+
+			sysfs_attr_init(&battr[i].attr.attr);
+			ret = sysfs_create_file(cmg_kobj[cmg], &battr[i].attr.attr);
+			if (ret < 0)
+				goto fail;
+		}
+	}
+
+	return 0;
+
+fail:
+	destroy_sysfs();
+	return ret;
+}
+
 static int __init hwb_init(void)
 {
 	int ret;
@@ -967,8 +1216,16 @@ static int __init hwb_init(void)
 		goto out3;
 	}
 
+	ret = init_sysfs();
+	if (ret < 0) {
+		pr_err("sysfs creation failed: %d\n", ret);
+		goto out4;
+	}
+
 	return 0;
 
+out4:
+	misc_deregister(&bar_miscdev);
 out3:
 	cpuhp_remove_state(_hp_state);
 out2:
@@ -981,6 +1238,7 @@ static int __init hwb_init(void)
 
 static void __exit hwb_exit(void)
 {
+	destroy_sysfs();
 	misc_deregister(&bar_miscdev);
 	cpuhp_remove_state(_hp_state);
 	destroy_bb_info_cachep();
-- 
2.26.2

