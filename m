Return-Path: <SRS0=X96t=R3=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97342C4167B
	for <soc@archiver.kernel.org>; Tue, 11 Jan 2022 21:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A8BAC36AFC; Tue, 11 Jan 2022 21:54:22 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0952C36AF2;
	Tue, 11 Jan 2022 21:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0952C36AF2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id y17so823353qtx.9;
        Tue, 11 Jan 2022 13:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dwv8zU8n8yiogijHIs2AxKIN+CujA549uEl1KGc0Fvk=;
        b=aOIMywn9Tv/KtesiTMbUlu1L9A6aOlQ34jYj+zfDTNBfcL4/uucaYxRl7jx4L+uOmp
         p/0PjbTSJ6K2Gfa4WvE+Mo9B+CBbP1nD2p2ecD9zRbG5EPxl401gLNDaHdKmCUl7BS+m
         cyBtjLau7V5lyEWran8c7OwG1Ra2Y//xUYi3y8ObjrKAnXriqV+1b7D7QxP8vZczRFDu
         /Xq1D6yfukxrcuLa8Cohc8q3IHEm1bhEiV31rnsVFTH3xgRD8B1LJEY8b7PU8mzKvKSW
         jywlZLjxbBm2yynSys3878j9PlZGOT084TCtHZy4oIGrueV11Nfi6wDz9ILWZpPvy+XA
         tWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dwv8zU8n8yiogijHIs2AxKIN+CujA549uEl1KGc0Fvk=;
        b=laXJgEMMpniUNZlDKvg/I+MmrRN8erKqa4NYOEpYmYleoAd+xcqUlsuMcxKQQdoF+/
         rkLGH/MPeID0BV3Hm4wQxpDdvL27VgNMAJYO5wBpp7cQvksSfWsEujEFZEn7XxF8VRdM
         7zI2AK7MDO6xHPWtrUDWc8FfC5SkJTwanEG6Zpo7xzBUwHhgTSC/yGzWSatnNwsrE6vN
         h3nLnE7Dplvbv12Fk4vq16gqk5OofHbfEdupHbBg2SnxvuYO7ciNIoHPuLfvawWEf/A8
         QLlRJZTHIQIe/3ebnKDLgFsSXQVx8kVJEZ5jdBSDgodmidjh5c8hiNjeU4v87AbcEDWR
         1BJg==
X-Gm-Message-State: AOAM532c8hdVMPlnFJCOSGrQrSPqIJFoBQgmBdGE1ng503NS72EzeLLN
	A6sXG7ExShDkXddzooIWX2g=
X-Google-Smtp-Source: ABdhPJwmFJwRyW0dwBWesz2FiEvUJwHPZYwMPvE9D3m1+MJu0YV/YRL3uWQht+5iMk4Qm0SEun557w==
X-Received: by 2002:a05:622a:30b:: with SMTP id q11mr5509321qtw.529.1641938060622;
        Tue, 11 Jan 2022 13:54:20 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id l10sm7591020qtk.18.2022.01.11.13.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 13:54:20 -0800 (PST)
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
Subject: [PATCH v8 1/7] ARM: imx: Add initial support for i.MXRT10xx family
Date: Tue, 11 Jan 2022 16:54:09 -0500
Message-Id: <20220111215415.2075257-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111215415.2075257-1-Mr.Bossman075@gmail.com>
References: <20220111212606.2072669-1-Mr.Bossman075@gmail.com>
 <20220111215415.2075257-1-Mr.Bossman075@gmail.com>
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
V5->V6:
* Nothing done
V6->V7:
* Nothing done
V7->V8:
* Nothing done
---
 arch/arm/mach-imx/Kconfig      |  7 +++++++
 arch/arm/mach-imx/Makefile     |  2 ++
 arch/arm/mach-imx/mach-imxrt.c | 19 +++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 arch/arm/mach-imx/mach-imxrt.c

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index b407b024dde3..5ad3a8b9b4b6 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -239,6 +239,13 @@ config SOC_IMX7ULP
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
2.34.1

