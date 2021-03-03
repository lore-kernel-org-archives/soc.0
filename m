Return-Path: <SRS0=RWG8=IB=jp.fujitsu.com=tan.shaopeng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAF6C433E0
	for <soc@archiver.kernel.org>; Wed,  3 Mar 2021 09:40:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B10EF64EBD; Wed,  3 Mar 2021 09:40:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98E4D64EBB;
	Wed,  3 Mar 2021 09:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98E4D64EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=tan.shaopeng@jp.fujitsu.com
IronPort-SDR: rSCRmTxcYlOjcWX8jvdIs0w+Tj0udBfYqiOlEhDivhQNOwtN/Bycijhz6ZHwv4Hi8i9q9qbREu
 0ImFHnZDvgegTTf9n7ZLIC9p0I5r3C/5RKgrfIl2Y3RVFJQs0HUZJm2uyKn7Xiubm1rMttahd5
 6a/7ET4LNXkpvb5HCXG8P9yNt7O0xQMK9v5Qs0mr6L5EK0nYhm141y7GgN1GLZvtWlIzOsFuJN
 QXRA1QtVvyQSMgt1l/MBZ4Y5M9+3aGplglkw94Lsu59lbjhb53RljZCIzb7IaiAfOBWzxOtZfs
 h00=
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="21420004"
X-IronPort-AV: E=Sophos;i="5.81,219,1610377200"; 
   d="scan'208";a="21420004"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP; 03 Mar 2021 18:39:14 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5861BEC7AB;
	Wed,  3 Mar 2021 18:39:13 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B8A4B1D95E;
	Wed,  3 Mar 2021 18:39:12 +0900 (JST)
Received: from cn-r05-09.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp [10.123.235.113])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id 914F84006817C;
	Wed,  3 Mar 2021 18:39:12 +0900 (JST)
From: "tan.shaopeng" <tan.shaopeng@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	arnd@arndb.de,
	olof@lixom.net,
	misono.tomohiro@jp.fujitsu.com,
	tan.shaopeng@jp.fujitsu.com
Subject: [PATCH RFC] soc: fujitsu: Add cache driver code
Date: Wed,  3 Mar 2021 18:38:23 +0900
Message-Id: <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

From: "tan.shaopeng" <tan.shaopeng@jp.fujitsu.com>

This driver offers cache functions(including hardware prefetch function
and sector cache function) for A64FX system.
When built as a module, this will be called as "fujitsu_cache".

Signed-off-by: tan.shaopeng <tan.shaopeng@jp.fujitsu.com>
---
 MAINTAINERS                         |   6 ++
 arch/arm64/Kconfig.platforms        |   5 +
 drivers/soc/Kconfig                 |   1 +
 drivers/soc/Makefile                |   1 +
 drivers/soc/fujitsu/Kconfig         |  26 +++++
 drivers/soc/fujitsu/fujitsu_cache.c | 183 ++++++++++++++++++++++++++++++++++++
 6 files changed, 222 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/fujitsu_cache.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6eff4f7..93da2f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1508,6 +1508,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	arch/arm/mach-*/
 F:	arch/arm/plat-*/
 
+ARM/A64FX SOC SUPPORT
+M:	SHAOPENG TAN <tan.shaopeng@jp.fujitsu.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	drivers/soc/fujitsu/
+
 ARM/ACTIONS SEMI ARCHITECTURE
 M:	Andreas Färber <afaerber@suse.de>
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6eecdef..41fb214 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -1,6 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "Platform selection"
 
+config ARCH_A64FX
+	bool "Fujitsu A64FX Platforms"
+	help
+	  This enables support for Fujitsu A64FX SoC family.
+
 config ARCH_ACTIONS
 	bool "Actions Semi Platforms"
 	select OWL_TIMER
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index d097d07..7a52b5d 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -7,6 +7,7 @@ source "drivers/soc/aspeed/Kconfig"
 source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
 source "drivers/soc/fsl/Kconfig"
+source "drivers/soc/fujitsu/Kconfig"
 source "drivers/soc/imx/Kconfig"
 source "drivers/soc/ixp4xx/Kconfig"
 source "drivers/soc/litex/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 699b758..57c0ddd 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -10,6 +10,7 @@ obj-y				+= bcm/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
 obj-$(CONFIG_MACH_DOVE)		+= dove/
 obj-y				+= fsl/
+obj-y				+= fujitsu/
 obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
 obj-y				+= imx/
 obj-$(CONFIG_ARCH_IXP4XX)	+= ixp4xx/
diff --git a/drivers/soc/fujitsu/Kconfig b/drivers/soc/fujitsu/Kconfig
new file mode 100644
index 0000000..7754fb5
--- /dev/null
+++ b/drivers/soc/fujitsu/Kconfig
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# FUJITSU SoC drivers
+#
+menuconfig SOC_FUJITSU
+	bool "FUJITSU SoC drivers"
+	depends on ARCH_A64FX || COMPILE_TEST
+
+if SOC_FUJITSU
+
+config FUJITSU_CACHE
+        tristate "FUJITSU Cache Driver"
+        depends on ARM64_VHE || COMPILE_TEST
+        help
+          FUJITSU Cache Driver
+
+          This driver offers cache functions for A64FX system.
+	  Loading this cache driver, control registers will be set to enable
+	  these functions, and advanced settings registers will be set by default
+	  values. After loading this driver, you can use the default values of the
+	  advanced settings registers or set the advanced settings registers
+	  from EL0. Unloading this driver, control registers will be clear to
+	  disable these functions.
+          When built as a module, this will be called as "fujitsu_cache".
+
+endif # SOC_FUJITSU
diff --git a/drivers/soc/fujitsu/fujitsu_cache.c b/drivers/soc/fujitsu/fujitsu_cache.c
new file mode 100644
index 0000000..852fe1c
--- /dev/null
+++ b/drivers/soc/fujitsu/fujitsu_cache.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2021 FUJITSU LIMITED
+ *
+ * This driver enables HPC tag address override function &
+ * hardware prefetch assist function & sector cache function on A64FX.
+ *
+ * After loading this driver, detail settings of these functions
+ * can be made from EL0
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/cpuhotplug.h>
+#include <asm/cputype.h>
+#include <asm/sysreg.h>
+
+#ifdef pr_fmt
+#undef pr_fmt
+#endif
+#define pr_fmt(fmt) "[%s:%s:%d] " fmt, KBUILD_MODNAME, __func__, __LINE__
+
+#define TAG_ADDRESS_CTRL_EL1_ENABLE	GENMASK(31, 0)
+#define HWPF_CTRL_EL1_ENABLE		GENMASK(63, 0)
+#define SEC_CTRL_EL1_ENABLE		GENMASK(63, 62)
+#define SEC_ASSIGN_EL1_DEFAULT		((u64)0)
+#define SEC_SET0_L2_EL1_DEFAULT		GENMASK(63, 0)
+#define SEC_SET1_L2_EL1_DEFAULT		GENMASK(63, 0)
+
+/* hpc tag address */
+#define IMP_FJ_TAG_ADDRESS_CTRL_EL1	sys_reg(3, 0, 11, 2, 0)
+
+/* hardware prefetch assist */
+#define IMP_PF_CTRL_EL1			sys_reg(3, 0, 11, 4, 0)
+#define IMP_PF_STREAM_DETECT_CTRL_EL0	sys_reg(3, 3, 11, 4, 0)
+#define IMP_PF_INJECTION_CTRL0_EL0	sys_reg(3, 3, 11, 6, 0)
+#define IMP_PF_INJECTION_CTRL1_EL0	sys_reg(3, 3, 11, 6, 1)
+#define IMP_PF_INJECTION_CTRL2_EL0	sys_reg(3, 3, 11, 6, 2)
+#define IMP_PF_INJECTION_CTRL3_EL0	sys_reg(3, 3, 11, 6, 3)
+#define IMP_PF_INJECTION_CTRL4_EL0	sys_reg(3, 3, 11, 6, 4)
+#define IMP_PF_INJECTION_CTRL5_EL0	sys_reg(3, 3, 11, 6, 5)
+#define IMP_PF_INJECTION_CTRL6_EL0	sys_reg(3, 3, 11, 6, 6)
+#define IMP_PF_INJECTION_CTRL7_EL0	sys_reg(3, 3, 11, 6, 7)
+#define IMP_PF_INJECTION_DISTANCE0_EL0	sys_reg(3, 3, 11, 7, 0)
+#define IMP_PF_INJECTION_DISTANCE1_EL0	sys_reg(3, 3, 11, 7, 1)
+#define IMP_PF_INJECTION_DISTANCE2_EL0	sys_reg(3, 3, 11, 7, 2)
+#define IMP_PF_INJECTION_DISTANCE3_EL0	sys_reg(3, 3, 11, 7, 3)
+#define IMP_PF_INJECTION_DISTANCE4_EL0	sys_reg(3, 3, 11, 7, 4)
+#define IMP_PF_INJECTION_DISTANCE5_EL0	sys_reg(3, 3, 11, 7, 5)
+#define IMP_PF_INJECTION_DISTANCE6_EL0	sys_reg(3, 3, 11, 7, 6)
+#define IMP_PF_INJECTION_DISTANCE7_EL0	sys_reg(3, 3, 11, 7, 7)
+
+/* sector cache */
+#define IMP_SCCR_CTRL_EL1		sys_reg(3, 0, 11, 8, 0)
+#define IMP_SCCR_ASSIGN_EL1		sys_reg(3, 0, 11, 8, 1)
+#define IMP_SCCR_L1_EL0			sys_reg(3, 3, 11, 8, 2)
+#define IMP_SCCR_SET0_L2_EL1		sys_reg(3, 0, 15, 8, 2)
+#define IMP_SCCR_SET1_L2_EL1		sys_reg(3, 0, 15, 8, 3)
+#define IMP_SCCR_VSCCR_L2_EL0		sys_reg(3, 3, 15, 8, 2)
+
+static unsigned long tagaddr_ctrl_reg = TAG_ADDRESS_CTRL_EL1_ENABLE;
+static unsigned long hwpf_ctrl_reg = HWPF_CTRL_EL1_ENABLE;
+static unsigned long sec_ctrl_reg = SEC_CTRL_EL1_ENABLE;
+static unsigned long sec_assign_reg = SEC_ASSIGN_EL1_DEFAULT;
+static unsigned long sec_set0_l2_reg = SEC_SET0_L2_EL1_DEFAULT;
+static unsigned long sec_set1_l2_reg = SEC_SET1_L2_EL1_DEFAULT;
+
+module_param(tagaddr_ctrl_reg, ulong, 0444);
+MODULE_PARM_DESC(tagaddr_ctrl_reg, "HPC tag address override control register");
+module_param(hwpf_ctrl_reg, ulong, 0444);
+MODULE_PARM_DESC(hwpf_ctrl_reg, "hardware prefetch assist control register");
+module_param(sec_ctrl_reg, ulong, 0444);
+MODULE_PARM_DESC(sec_ctrl_reg, "sector cache control register");
+module_param(sec_assign_reg, ulong, 0444);
+MODULE_PARM_DESC(sec_assign_reg, "sector cache assign register");
+module_param(sec_set0_l2_reg, ulong, 0444);
+MODULE_PARM_DESC(sec_set0_l2_reg, "sector cache L2 way register(sector=0,1)");
+module_param(sec_set1_l2_reg, ulong, 0444);
+MODULE_PARM_DESC(sec_set1_l2_reg, "sector cache L2 way register(sector=2,3)");
+
+static enum cpuhp_state _hp_state;
+
+static void fujitsu_hwpf_setting_regs_clear(void)
+{
+	write_sysreg_s(0, IMP_PF_STREAM_DETECT_CTRL_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_CTRL0_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_CTRL1_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_CTRL2_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_CTRL3_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_CTRL4_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_CTRL5_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_CTRL6_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_CTRL7_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_DISTANCE0_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_DISTANCE1_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_DISTANCE2_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_DISTANCE3_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_DISTANCE4_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_DISTANCE5_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_DISTANCE6_EL0);
+	write_sysreg_s(0, IMP_PF_INJECTION_DISTANCE7_EL0);
+}
+
+static void fujitsu_sec_setting_regs_clear(void)
+{
+	write_sysreg_s(0, IMP_SCCR_L1_EL0);
+	write_sysreg_s(0, IMP_SCCR_VSCCR_L2_EL0);
+}
+
+static void fujitsu_cache_destroy(void *none)
+{
+	/* just clear the values of all registers */
+	write_sysreg_s(0, IMP_FJ_TAG_ADDRESS_CTRL_EL1);
+
+	write_sysreg_s(0, IMP_PF_CTRL_EL1);
+	fujitsu_hwpf_setting_regs_clear();
+
+	write_sysreg_s(0, IMP_SCCR_CTRL_EL1);
+	write_sysreg_s(0, IMP_SCCR_ASSIGN_EL1);
+	write_sysreg_s(0, IMP_SCCR_SET0_L2_EL1);
+	write_sysreg_s(0, IMP_SCCR_SET1_L2_EL1);
+	fujitsu_sec_setting_regs_clear();
+}
+
+static int fujitsu_cache_init(unsigned int cpu)
+{
+	/* Enabled HPC tag address override,
+	 * and then hardware prefetch assist & sector cache can be customized.
+	 * Default values can be changed by module parameters.
+	 */
+	write_sysreg_s(tagaddr_ctrl_reg, IMP_FJ_TAG_ADDRESS_CTRL_EL1);
+
+	/* hardware prefetch assist */
+	write_sysreg_s(hwpf_ctrl_reg, IMP_PF_CTRL_EL1);
+	fujitsu_hwpf_setting_regs_clear();
+
+	/* sector cache */
+	write_sysreg_s(sec_ctrl_reg, IMP_SCCR_CTRL_EL1);
+	write_sysreg_s(sec_assign_reg, IMP_SCCR_ASSIGN_EL1);
+	write_sysreg_s(sec_set0_l2_reg, IMP_SCCR_SET0_L2_EL1);
+	write_sysreg_s(sec_set1_l2_reg, IMP_SCCR_SET1_L2_EL1);
+	fujitsu_sec_setting_regs_clear();
+
+	return 0;
+}
+
+static int __init fujitsu_drv_init(void)
+{
+	int ret;
+
+	if (read_cpuid_implementor() != ARM_CPU_IMP_FUJITSU)
+		return -ENODEV;
+	if (read_cpuid_part_number() != FUJITSU_CPU_PART_A64FX)
+		return -ENODEV;
+
+	/* register initialize */
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/fujitsu_cache:online",
+				fujitsu_cache_init, NULL);
+	if (ret < 0) {
+		pr_err("cpuhp setup failed: %d\n", ret);
+		return ret;
+	}
+
+	_hp_state = ret;
+
+	return 0;
+}
+
+static void __exit fujitsu_drv_exit(void)
+{
+	cpuhp_remove_state(_hp_state);
+	/* register reset */
+	on_each_cpu_mask(cpu_online_mask, fujitsu_cache_destroy, NULL, 1);
+}
+
+module_init(fujitsu_drv_init);
+module_exit(fujitsu_drv_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("FUJITSU LIMITED");
+MODULE_DESCRIPTION("Fujitsu HPC HardWare Prefetch Assist, Hardware Prefetch, Sector Cache Driver");
-- 
1.8.3.1

