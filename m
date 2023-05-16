Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA3BC77B7A
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A55D4C433D2; Tue, 16 May 2023 15:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4E1C433EF;
	Tue, 16 May 2023 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251124;
	bh=dGtx50T5is7qnVEdQTiLOc5141/dVGpeqDfz3k59KAw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TQuu3nUvQAba0rT7rxE8hy/wOhHfYyKB27Jn2i6pr7EzDud+kwVMFWXuJrnXLbVgC
	 bdGeo/3tyLHKBqpYuZUwAFXvnKHBI0QiRpJglxXDMZCVrScgnLt5YTQewDQK12dddt
	 dVyDI5+U+30YS/0p9GE40rOFX6WLE5H4K7tzdKycVou7KVmvNn3nC2cz2N+yJbwAig
	 m4IhSVGuMDqkU8Mwee18/7qij03qT2CEljXKwSjrtvSCqrOz/sB3rZeNxJbYYVhW2B
	 Iu0zG9Qcu7r6bk3bTPGUjuVIpGQthfIfO50PISjc6/bK8aF5N5ffX7ijhJnFAEWIfJ
	 0DcsBjRXNhKCQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 05/13] ARM: imx: remove unused mx25_revision()
Date: Tue, 16 May 2023 17:31:01 +0200
Message-Id: <20230516153109.514251-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This function has no prototype and no callers:

arm/mach-imx/cpu-imx25.c:43:5: error: no previous prototype for 'mx25_revision' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-imx/Makefile    |  2 +-
 arch/arm/mach-imx/cpu-imx25.c | 50 -----------------------------------
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 arch/arm/mach-imx/cpu-imx25.c

diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
index 5c650bf40e02..35a99888f54a 100644
--- a/arch/arm/mach-imx/Makefile
+++ b/arch/arm/mach-imx/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y := cpu.o system.o irq-common.o
 
-obj-$(CONFIG_SOC_IMX25) += cpu-imx25.o mach-imx25.o pm-imx25.o
+obj-$(CONFIG_SOC_IMX25) += mach-imx25.o pm-imx25.o
 
 obj-$(CONFIG_SOC_IMX27) += cpu-imx27.o pm-imx27.o mach-imx27.o
 
diff --git a/arch/arm/mach-imx/cpu-imx25.c b/arch/arm/mach-imx/cpu-imx25.c
deleted file mode 100644
index cc86977d0a34..000000000000
--- a/arch/arm/mach-imx/cpu-imx25.c
+++ /dev/null
@@ -1,50 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MX25 CPU type detection
- *
- * Copyright (c) 2009 Daniel Mack <daniel@caiaq.de>
- * Copyright (C) 2011 Freescale Semiconductor, Inc. All Rights Reserved
- */
-#include <linux/module.h>
-#include <linux/io.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-
-#include "iim.h"
-#include "hardware.h"
-
-static int mx25_cpu_rev = -1;
-
-static int mx25_read_cpu_rev(void)
-{
-	u32 rev;
-	void __iomem *iim_base;
-	struct device_node *np;
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,imx25-iim");
-	iim_base = of_iomap(np, 0);
-	of_node_put(np);
-	BUG_ON(!iim_base);
-	rev = readl(iim_base + MXC_IIMSREV);
-	iounmap(iim_base);
-
-	switch (rev) {
-	case 0x00:
-		return IMX_CHIP_REVISION_1_0;
-	case 0x01:
-		return IMX_CHIP_REVISION_1_1;
-	case 0x02:
-		return IMX_CHIP_REVISION_1_2;
-	default:
-		return IMX_CHIP_REVISION_UNKNOWN;
-	}
-}
-
-int mx25_revision(void)
-{
-	if (mx25_cpu_rev == -1)
-		mx25_cpu_rev = mx25_read_cpu_rev();
-
-	return mx25_cpu_rev;
-}
-EXPORT_SYMBOL(mx25_revision);
-- 
2.39.2

