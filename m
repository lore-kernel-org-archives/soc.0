Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD8FC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:26:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398F823770
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 398F823770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KhouV4J/+yZJKKIOrppaVebmx/ljIWWOfVMZJ4LzaSw=; b=pnoK5+Wq0UjXhfc9rRSyH4iiQ
	dIIY2ziH932GCCDjnW+oFLDj4nCV++JWeGM9+DGN9OUqHvHrNQHH356Xr1D5z1yKA5TQIVao8pWHw
	h6qDKuAkFCPOAfs0SHgY8YTMfxccFTn92TFhE1kaGd/AxO+E1HqJ8bOmedcLIKl/lygJadp5bXa20
	nN9P5rJQlZ2Sg6b7Hbs5XZvENVfdMEr0zJrDWEUhn3ZSWDwvO5YD+Clq/ygZ0gZVmPE5TYBelIdba
	EEWPER88zE3A8sPPVBH6fEFF9j2gNIS2dATMmwLAmoqMjewaWdXuBw7UOvkxMfEQmqCTxPEcECZIR
	bZNrDHDxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxowy-00060j-HJ; Fri, 08 Jan 2021 10:24:56 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxoso-0004xn-Me
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:20:42 +0000
IronPort-SDR: BBYafTYpctpPgKV5J3tGVOGYFXDcmWjGbs2+kfEJ0Nt0goo1LrKBPS5/u9V1AadKiSEG41unOm
 k06unBLa7zSt+EYwQwzjBlKD69w3fCh1+SU1qPFwPDuUrEu00qIddylE3nS5pEnqI7bNHsaWyr
 xAWT5dmvCLT4mHaB/Gq97hCzNhOYl+Zdzlt51cn879fEBp2obIQLucyEKYR3n7XTo2eA+u9ezZ
 zJj+B56a/ItAQAYbrLJ0vEzUyjbQqS7LA9mc6lySoMqAQgeup6VWpJ10p4fI+gxxapCDRYowf2
 J8A=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="2153054"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="2153054"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa8.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:34 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com
 [192.168.83.65])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D6E5021EC68
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:20:33 +0900 (JST)
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
 (g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
 by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 37F369B616
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:20:33 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
 by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id 3129B58438D;
 Fri,  8 Jan 2021 19:20:32 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:20:30 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
Subject: [PATCH 09/10] soc: fujitsu: hwb: Add sysfs entry
Date: Fri, 8 Jan 2021 19:32:26 +0900
Message-ID: <20210108103227.1740865-10-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_052038_978531_74E20CE8 
X-CRM114-Status: GOOD (  20.04  )
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
Message-ID: <20210108103226.y9M0M4a2QZEpeV2hMIzOG6z-s_AMUE-dciIA6pW_FBY@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
