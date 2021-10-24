Return-Path: <SRS0=jRGM=PM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BFAC433FE
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 15:40:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DEA816103E; Sun, 24 Oct 2021 15:40:34 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9A760EBC;
	Sun, 24 Oct 2021 15:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC9A760EBC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id 77so9568378qkh.6;
        Sun, 24 Oct 2021 08:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LIEq5WFYWlVHRg5jQfKDO8H8SVF/ng+FulfmYxIiEeM=;
        b=fxvDkIWQSPpOWDyxm35z+5uaq1Xscsol9mtVYvE06ytjwj7WpF3ohvK1hRNoLmDitc
         ED7ys95utlmjebr1nDo8nHPQydIL37M3gW63TjpC8IMwsrLlEr3UbrSdjxDsymgcAMMI
         T47oghcvqhrBk47ZjibgK70s+XTWTGzw3NsCfqKxik12F3DN8T859CvlbDchPysTHvBF
         59JNmkb6UtaT00kOA0X+GIwSP3durBaLISTINIdAMhDzjJvH/c9lav0L3Qb4Fb3NpHUk
         vivoSZmUS5LisEZerHj3L6Uo2vDttjyZI8ZSNvKaFqOPeYBcSsi4hSsQ0vvTn4aHnW29
         iA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIEq5WFYWlVHRg5jQfKDO8H8SVF/ng+FulfmYxIiEeM=;
        b=JxyMB1Z7wRjFRr4fvhp1l0jmyzVgVDALqn58MtZ4aHfXRFWzBfTdd7l5Msaau/DyvX
         UfA34wC3RRHcbd2qOhoy0sfh92hrxyVzoLR809Ocj8ToPiI8S9xUtKc1G87MePDyNY64
         MO6NYovS0kGeMeSNU3fi4WEyZMyNi6ZfJ9TX9s7sGuPUuw93C1PbjYWp8f/p1h0MhFBD
         GpuQWWi0idHWMjDhQM9yw/7Wtl8a8ZchX2+7MOywuJo1h63FeCaE8iydbsURJ+/8gAPP
         k1RjoZ+cLqvsO9ADjbpE6N9W9VcVlP9kri53jnzpP8S1QJFHq5G7EJe5Qowl/uEAn+PC
         K4Lg==
X-Gm-Message-State: AOAM533cPwV3xOfki5XMD5zhDEaces/X0GMwLpPJYcH0C+RJ7MIZ6Y6/
	M5OOpsyC6ErVtiLIpnUfDBM=
X-Google-Smtp-Source: ABdhPJy2L0usqJBt3NmxqI6WeZY6OuH4bCPxn6l+GmtMevu7MsqRv6MSPqRyNjgH6eh+qC5w2GqVcw==
X-Received: by 2002:a37:6556:: with SMTP id z83mr9335530qkb.211.1635090033848;
        Sun, 24 Oct 2021 08:40:33 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:33 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	ulf.hansson@linaro.org,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	adrian.hunter@intel.com,
	jirislaby@kernel.org,
	giulio.benetti@benettiengineering.com,
	nobuhiro1.iwamatsu@toshiba.co.jp,
	leonard.crestez@nxp.com,
	b20788@freescale.com,
	Mr.Bossman075@gmail.com,
	fugang.duan@nxp.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 01/13] ARM: imx: add initial support for i.MXRT10xx family
Date: Sun, 24 Oct 2021 11:40:15 -0400
Message-Id: <20211024154027.1479261-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

The i.MXRT10xx family of processors features NXP's implementation of the
Arm Cortex-M7 core and in some case the Arm Cortex-M4 core too.

This patch aims to add an initial support for imxrt.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/arm/mach-imx/Kconfig      |  9 +++++++++
 arch/arm/mach-imx/Makefile     |  2 ++
 arch/arm/mach-imx/mach-imxrt.c | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 arch/arm/mach-imx/mach-imxrt.c

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index b407b024dde3..fd190c8e0c99 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -239,6 +239,15 @@ config SOC_IMX7ULP
 	help
 	  This enables support for Freescale i.MX7 Ultra Low Power processor.
 
+config SOC_IMXRT
+	bool "i.MXRT support"
+	depends on ARM_SINGLE_ARMV7M || ARCH_MULTI_V7
+	select ARMV7M_SYSTICK if ARM_SINGLE_ARMV7M
+	select ARM_GIC if ARCH_MULTI_V7
+	select PINCTRL_IMXRT
+	help
+	  This enables support for Freescale i.MXRT Crossover processor.
+
 config SOC_VF610
 	bool "Vybrid Family VF610 support"
 	select ARM_GIC if ARCH_MULTI_V7
diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
index d1506ef7a537..3b1145722a44 100644
--- a/arch/arm/mach-imx/Makefile
+++ b/arch/arm/mach-imx/Makefile
@@ -65,6 +65,8 @@ obj-$(CONFIG_SOC_IMX50) += mach-imx50.o
 obj-$(CONFIG_SOC_IMX51) += mach-imx51.o
 obj-$(CONFIG_SOC_IMX53) += mach-imx53.o
 
+obj-$(CONFIG_SOC_IMXRT) += mach-imxrt.o
+
 obj-$(CONFIG_SOC_VF610) += mach-vf610.o
 
 obj-$(CONFIG_SOC_LS1021A) += mach-ls1021a.o
diff --git a/arch/arm/mach-imx/mach-imxrt.c b/arch/arm/mach-imx/mach-imxrt.c
new file mode 100644
index 000000000000..2063a3059c84
--- /dev/null
+++ b/arch/arm/mach-imx/mach-imxrt.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019
+ * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
+ */
+
+#include <linux/kernel.h>
+#include <asm/mach/arch.h>
+#include <asm/v7m.h>
+
+static const char *const imxrt_compat[] __initconst = {
+	"fsl,imxrt1050",
+	NULL
+};
+
+DT_MACHINE_START(IMXRTDT, "IMXRT (Device Tree Support)")
+	.dt_compat = imxrt_compat,
+	.restart = armv7m_restart,
+MACHINE_END
-- 
2.33.0

