Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B54C433E6
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:40:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 25F7A238E7; Fri,  8 Jan 2021 10:40:42 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B678238EA;
	Fri,  8 Jan 2021 10:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B678238EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: NTbefARYcDsuY+oLZmOQznu4TvB+/RoFnF0SMVc24yGY2GLZjABhUnGOaBhtn7smF/jED2xFX8
 5Re7i2hoHvTlEGXTc065sjPFfQthB6y1oTelpAzsMFzZxc9XElNNtjzwn4nnDyqhcThmBsh6BQ
 kTYlCkwln058dj7Af0WM/TY04SCg/2GSitSQtyu56m8Ri4fCM+6F9Rx9LgXYxmxDax2ps9sSZD
 tc/eSgcrdlUrAoPqpxFA40NWvWT1b3ZSoyJTSqD24OzosLCnA5Y66e5Q3YmAcJPXvyDfVizXsl
 nLg=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14111429"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="14111429"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:40:38 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DD9832F7C2;
	Fri,  8 Jan 2021 19:40:37 +0900 (JST)
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local (g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A38EF44C087;
	Fri,  8 Jan 2021 19:40:36 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local (G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id 9E601692764;
	Fri,  8 Jan 2021 19:40:35 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:40:33 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@arndb.de>,
	<olof@lixom.net>, <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH 10/10] soc: fujitsu: hwb: Add Kconfig/Makefile to build fujitsu_hwb driver
Date: Fri, 8 Jan 2021 19:52:41 +0900
Message-ID: <20210108105241.1757799-11-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00

This adds kconfig/Makefile to build fujitsu hardware barrier driver
(fujitsu_hwb.ko when built as module).

Note that this is the first time to add A64FX specific driver,
this also adds A64FX entry in Kconfig.platforms of arm64 Kconfig.
Also add MAINTAINERS entry for ARM/A64FX accordingly.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 MAINTAINERS                  |  7 +++++++
 arch/arm64/Kconfig.platforms |  5 +++++
 drivers/soc/Kconfig          |  1 +
 drivers/soc/Makefile         |  1 +
 drivers/soc/fujitsu/Kconfig  | 24 ++++++++++++++++++++++++
 drivers/soc/fujitsu/Makefile |  2 ++
 6 files changed, 40 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index 6eff4f720c72..d57ec44ceaed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1508,6 +1508,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	arch/arm/mach-*/
 F:	arch/arm/plat-*/
 
+ARM/A64FX SOC SUPPORT
+M:	Tomohiro Misono <misono.tomohiro@jp.fujitsu.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	drivers/soc/fujitsu/
+F:	include/uapi/linux/fujitsu_hpc_ioctl.h
+
 ARM/ACTIONS SEMI ARCHITECTURE
 M:	Andreas Färber <afaerber@suse.de>
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6eecdef538bd..41fb214adaff 100644
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
index d097d070f579..7a52b5dc4c96 100644
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
index 699b758d28e4..57c0dddc4d23 100644
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
index 000000000000..cbba0c939e62
--- /dev/null
+++ b/drivers/soc/fujitsu/Kconfig
@@ -0,0 +1,24 @@
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
+config FUJITSU_HARDWARE_BARRIER
+	tristate "FUJITSU HPC Hardware Barrier Driver"
+	depends on ARM64_VHE || COMPILE_TEST
+	help
+	  FUJITSU HPC Hardware Barrier Driver
+
+	  This driver offers hardware barrier functions for A64FX system
+	  which realizes synchronization by PEs in the same CMG (L3 cache
+	  domain) by using implementation defined registers. As control
+	  registers can only be accessed from EL2 on reset, this driver
+	  needs support of VHE.
+	  When built as a module, this will be called as "fujitsu_hwb".
+
+endif # SOC_FUJITSU
diff --git a/drivers/soc/fujitsu/Makefile b/drivers/soc/fujitsu/Makefile
new file mode 100644
index 000000000000..1b8e4c947f7f
--- /dev/null
+++ b/drivers/soc/fujitsu/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_FUJITSU_HARDWARE_BARRIER) +=	fujitsu_hwb.o
-- 
2.26.2

