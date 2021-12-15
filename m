Return-Path: <SRS0=KNgb=RA=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1147C4321E
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 22:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C7CEC36AE3; Wed, 15 Dec 2021 22:05:44 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18FD7C36AE4;
	Wed, 15 Dec 2021 22:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18FD7C36AE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id m17so21605345qvx.8;
        Wed, 15 Dec 2021 14:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qtHvW9BocuqoGTqMjX7MPqvtZepouGgPxI1fz7ae77U=;
        b=SSfxbeV03olV4VfC/pIdwMcj4gV6lODRZc0twg40Y2zM8afNuvk1UWJy0ngQlNvacs
         8AyhflP0YYt33LA4rkw7GrLLBVq7APOmetlAx+/vEqb1NReuG7YYcW1LvuMHTmIYmx2f
         /y11MxWsTI7JY3PrmKE2bJpaqdBe1AIhofScWVCCJkilG2RdAIMvvvpqa4dt6uXt7SMf
         ZeSOx98x/wtYbZW8N7Dla4mzhmlcrFW4RAgZnkAP29+ZykrGbwEPP7Nb3Wk1MtWOBad5
         viG/IcjhyNe98Rw8MlKMAJamCOS+wnavUiVUdHaCjG44qz9ZFPxTmT5d8ad/Wcqtu0Ma
         1S5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qtHvW9BocuqoGTqMjX7MPqvtZepouGgPxI1fz7ae77U=;
        b=TwGC5M+WEOYrMAYoAS513bSkXTZ6sIcds3QX/Tj+PX+RNuYtP63IlEL5uAmaG49oZY
         W7UDD+AA7tCPlx9ejXoQC5BjO44Zw/z0S1DY6WXWnEgFJ/OzfUzKdTFDF2LPR5XUgHoS
         vZAwwDyqTlqDqBZiZTvI96feFd/nCxu2ZGIAnGUJTk8yy2kiv8yi0HalQ4lR/m0JjNy1
         acGNgVqzAFuqJeh6hNulgQyWABN8Rh+HVFqDbYD0iQrcQoEhXKuIp+aoQsa+FHCVE5Oi
         WHgtorwY3I2xktwD9nXPl5xjW342nBDrB7org7xjCoRRWOc5Et1T+fXU28kxTOFAQHHD
         S0DQ==
X-Gm-Message-State: AOAM530RszkfTTrkRSlR53BOz0t663zvYWsVupQhrLwOzfH5D6/1AKrX
	S6E4jmNLmtsB8J1SYGF4Dx4=
X-Google-Smtp-Source: ABdhPJw3UFEeoPUFlaw4jFRRsIllejxCxiWY08jJKXzVUq5wntniGLseowpjYW180lbHghD9PKeUcg==
X-Received: by 2002:a05:6214:238e:: with SMTP id fw14mr13497077qvb.86.1639605943101;
        Wed, 15 Dec 2021 14:05:43 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id s20sm2471592qtc.75.2021.12.15.14.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:05:42 -0800 (PST)
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
	Mr.Bossman075@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 1/9] ARM: imx: Add initial support for i.MXRT10xx family
Date: Wed, 15 Dec 2021 17:05:30 -0500
Message-Id: <20211215220538.4180616-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
References: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

The i.MXRT10xx family of processors features NXP's implementation of the
Arm Cortex-M7 core and in some case the Arm Cortex-M4 core too.

This patch aims to add an initial support for imxrt.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
[Jesse: removed SOC_IMXRT's 'depends on ARCH_MULTI_V7' and 'select
ARM_GIC if ARCH_MULTI_V7']
---
V1->V2:
* Remove depends ARCH_MULTI_V7
* Remove select PINCTRL_IMXRT
* Change commit description
V2->V3:
* Nothing done
V3->V4:
* Nothing done
V4->V5:
* Nothing done
---
 arch/arm/mach-imx/Kconfig      |  7 +++++++
 arch/arm/mach-imx/Makefile     |  2 ++
 arch/arm/mach-imx/mach-imxrt.c | 19 +++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 arch/arm/mach-imx/mach-imxrt.c

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index f296bac467c8..c5a59158722b 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -227,6 +227,13 @@ config SOC_IMX7ULP
 	help
 	  This enables support for Freescale i.MX7 Ultra Low Power processor.
 
+config SOC_IMXRT
+	bool "i.MXRT support"
+	depends on ARM_SINGLE_ARMV7M
+	select ARMV7M_SYSTICK if ARM_SINGLE_ARMV7M
+	help
+	  This enables support for Freescale i.MXRT Crossover processor.
+
 config SOC_VF610
 	bool "Vybrid Family VF610 support"
 	select ARM_GIC if ARCH_MULTI_V7
diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
index d5291ed9186a..6fb3965b9ae6 100644
--- a/arch/arm/mach-imx/Makefile
+++ b/arch/arm/mach-imx/Makefile
@@ -63,6 +63,8 @@ obj-$(CONFIG_SOC_IMX50) += mach-imx50.o
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
2.34.1

