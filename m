Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F90BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 22:58:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F85A601FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 22:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F85A601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6UWps+WR0OsUG1LXSnwCTjeJmfTHW9KYHigbr8DPGs=; b=zeq1PNdGSnpnZX
	8wN8+YX1koKaw60w1BYxsHPBfprPwv7Vgm4y86SwYOqmgJUVnHP2F7U4vGLfnDG4F0PPFzgdjAW5j
	DYw/lCFe/YI79d1I9Bqw/tB/IgkeYnhfDiqumKycwFORX0/Agl4/3nBkF3Fm2ny5VTCY5871SuFHb
	rF0ApwIOzFFLGYChw1yG/IOn7dtTuHsoVIZb0bz4wEtPLNae0wBoPNqW8N7qe/D1lI4Ti7pZfgmjZ
	UVazZPei7hSK4blME8JYHfMGf/aGGHHoeTJegluFyY6pJh+NwK/EcRjPDSAJw6v5RVkYWXsl9nGJR
	1m7rmifO4385QiRum2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi2iX-003EoT-S9; Tue, 02 Nov 2021 22:57:22 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi2iL-003EiV-2u
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 22:57:10 +0000
Received: by mail-qv1-xf32.google.com with SMTP id u25so617143qve.2
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 15:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tf8G6SIOApaUaJO9pxLfwQw4yArH0WpJ7K2Fnq6jDtk=;
 b=Tre6hYyrdHJVK2yOzhxQyvNB6DmIhoAUYAfZnVqL6MkvLaL4Cc5QsbbuAz2OfHj5ta
 nriXAmirrdWLw9JlmZbxJ9hoykd7fpTBOykNo5D6mco7JKiJpWmDSPJXeWCjOOSEirdD
 9LM3lzaq0w1t6K+226UqDOPcJKQSA0jTriAEb55dYri7gnoNPp0u1yCApdSihSqluYeH
 0kpdcT1kkdCutOGtVcjmAVXJNxU6KUgD52/7eSUqIJ2jQqQ1UkLdWRACRWiCRWOxmFLL
 NKbgZuH7PSOK2ptvoUkJmn+fBMYzdL8Fnyqj+FFSm8ePvO8+/3fMiQyJOVAmO6q3N7oH
 hFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tf8G6SIOApaUaJO9pxLfwQw4yArH0WpJ7K2Fnq6jDtk=;
 b=5EvCww1NB2SEngPOW1tMCng68jS0ufG7UwKmgejQtT6S1C7q+DM0jVJnYZsutxYLa5
 2G2LKK3jsbuxq8kCUwLG8ypxxOheJAxiqYiMZsN/KpJydyl7tti06SgtzcFRMubWZCeq
 JHqRzpcsozd/BCeVA5K1WXOm8CjnSfXMwDPG/u5Wp2eBh4rGaP+0+v0O8zYnhf0Nqq8Z
 nFlAOO/MRsf0M5lf+Uouxjr2Cf87KRO7yUuEgYYe1HDlQzNl0xLykleVjtdpVeTBSbG5
 8PBAdiAFMsu9bQnckLYPVhListymDZ1Kvmd3kW98rEf+zmA6Iu7MPkmRgZy5gc9xp4ui
 cE2w==
X-Gm-Message-State: AOAM532DoDaLoxFBDSckIc2ZfUypDZyZ7SvgJNhBfyjM3/TEmRs4KTgh
 NK9Gb9L2E4omP68yjTjpEwU=
X-Google-Smtp-Source: ABdhPJwHWSusTYtlpK15i6eOWqx1ByT5GDJfEYYOk729XHStEVb6LE8ohkDSctHJeOh4D4atsM+upA==
X-Received: by 2002:ac8:5d86:: with SMTP id d6mr41050726qtx.194.1635893825698; 
 Tue, 02 Nov 2021 15:57:05 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:57:05 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 Mr.Bossman075@gmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v2 01/13] ARM: imx: add initial support for i.MXRT10xx family
Date: Tue,  2 Nov 2021 18:56:49 -0400
Message-ID: <20211102225701.98944-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_155709_166704_11E29D12 
X-CRM114-Status: GOOD (  17.71  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211102225649.tg6yg3IafvUY7iM5t4ZVM62LROL7oyXI-s7FZqhHO7g@z>

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
2.33.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
