Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFF5C7EE20
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 13:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 604B6C433AA; Sun, 16 Apr 2023 13:35:42 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E91BC433EF;
	Sun, 16 Apr 2023 13:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E91BC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id xd13so23553364ejb.4;
        Sun, 16 Apr 2023 06:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681652139; x=1684244139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ads9PaDpLFMxNXIqpGW0TRi2DREypjUaM/F9ijw7fLg=;
        b=hCmzpPTm6Llt0v3x9eLmqKG/7YKO62IIb3juGKudvZR4xIDmT5C1wwqnzTDmU8R0AX
         KcMrT6KZyrSwHjQInL/bEyEgXQefT78/wRKseJDRVImC3fhTrq/UoisJNe3XDwkJZnWE
         e2pGnAw2QcIXkhvDFAIpT/1Zm+N8Rvzv5d6Rn13/n+B7+n+BfYutoo8G/9z3wSoYMLSG
         eO5BmLFG9OvwYJ9WnrYEa7boSiavr/9qP3PYQDW6vmSTUeKZ/0QIzDVEW+6O5rHe+wSg
         /L7orLggpRECNhZ21VIFW8La46bMrMR+o+yFec4Pkj4t87t6bLK6EgEB1oazag3Dkc5H
         DH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681652139; x=1684244139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ads9PaDpLFMxNXIqpGW0TRi2DREypjUaM/F9ijw7fLg=;
        b=iB2Wf6CCFtPD5jv7ma1ufiYoS0WJcJuV00p6cg2kuhzkwybYtFi2x8l1z0wWVC5yKX
         Nmh6DMsfNVMmSYcgpe4UxMOU8bwOEYW4qdmAk7+Ab6CMrslzDDjmF7jEREPW6iuV2h1b
         P4Z3wePk7KeO2CkcEPuJcPILgdYFFWDO8nl2+bs2Vl+Y7zO+BE6ZyvFItQMwGJhZNZw3
         DBZwBYqqzo7Tzcc2QeKczBo2gCD5fgPeedim12QRz8dWg+2lWtiYiLOD5Mhq4r8eQYH3
         WrIOWiW+k21w0vP+eWFO7aTdke2kewAZxomOaR8UJsHgRYlPxK1TvnJ1TMQD0QYvRmbL
         dy2g==
X-Gm-Message-State: AAQBX9e0Dll4jxbVfmNMLPYbovwfhFEuiGUxmIejMDMrxhYMGrdDAX7b
	721922V9zDyPx6qjum8y7oQ=
X-Google-Smtp-Source: AKy350YRu6qOt9Bau0nwy9dTE7kzSEMo8AqoB896i81vC6wp6OwNRfIlSgYDy0oCffJMuMEb/kLBWg==
X-Received: by 2002:a17:906:4955:b0:8f4:ec13:d599 with SMTP id f21-20020a170906495500b008f4ec13d599mr5125024ejt.27.1681652139279;
        Sun, 16 Apr 2023 06:35:39 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm5122958ejc.161.2023.04.16.06.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 06:35:38 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Kukjin Kim <kgene@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v2 03/12] ARM: exynos: Re-introduce Exynos4212 support
Date: Sun, 16 Apr 2023 15:34:13 +0200
Message-Id: <20230416133422.1949-4-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416133422.1949-1-aweber.kernel@gmail.com>
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform was originally dropped in commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), as there were
no boards using it.

We will be adding a device that uses it, so add it back.

This effectively reverts commit 9e43eca3c874 ("ARM: EXYNOS: Remove
Exynos4212 related dead code").

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/mach-exynos/Kconfig    | 5 +++++
 arch/arm/mach-exynos/common.h   | 8 ++++++++
 arch/arm/mach-exynos/exynos.c   | 2 ++
 arch/arm/mach-exynos/firmware.c | 8 +++++++-
 arch/arm/mach-exynos/pm.c       | 2 +-
 arch/arm/mach-exynos/suspend.c  | 4 ++++
 6 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 4d3b40e4049a..b3d5df5225fe 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -78,6 +78,11 @@ config CPU_EXYNOS4210
 	default y
 	depends on ARCH_EXYNOS4
 
+config SOC_EXYNOS4212
+	bool "Samsung Exynos4212"
+	default y
+	depends on ARCH_EXYNOS4
+
 config SOC_EXYNOS4412
 	bool "Samsung Exynos4412"
 	default y
diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 29eb075b24a4..c9e85d33c309 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -15,6 +15,7 @@
 #define EXYNOS3_SOC_MASK	0xFFFFF000
 
 #define EXYNOS4210_CPU_ID	0x43210000
+#define EXYNOS4212_CPU_ID	0x43220000
 #define EXYNOS4412_CPU_ID	0xE4412200
 #define EXYNOS4_CPU_MASK	0xFFFE0000
 
@@ -34,6 +35,7 @@ static inline int is_samsung_##name(void)	\
 
 IS_SAMSUNG_CPU(exynos3250, EXYNOS3250_SOC_ID, EXYNOS3_SOC_MASK)
 IS_SAMSUNG_CPU(exynos4210, EXYNOS4210_CPU_ID, EXYNOS4_CPU_MASK)
+IS_SAMSUNG_CPU(exynos4212, EXYNOS4212_CPU_ID, EXYNOS4_CPU_MASK)
 IS_SAMSUNG_CPU(exynos4412, EXYNOS4412_CPU_ID, EXYNOS4_CPU_MASK)
 IS_SAMSUNG_CPU(exynos5250, EXYNOS5250_SOC_ID, EXYNOS5_SOC_MASK)
 IS_SAMSUNG_CPU(exynos5410, EXYNOS5410_SOC_ID, EXYNOS5_SOC_MASK)
@@ -52,6 +54,12 @@ IS_SAMSUNG_CPU(exynos5800, EXYNOS5800_SOC_ID, EXYNOS5_SOC_MASK)
 # define soc_is_exynos4210()	0
 #endif
 
+#if defined(CONFIG_SOC_EXYNOS4212)
+# define soc_is_exynos4212()	is_samsung_exynos4212()
+#else
+# define soc_is_exynos4212()	0
+#endif
+
 #if defined(CONFIG_SOC_EXYNOS4412)
 # define soc_is_exynos4412()	is_samsung_exynos4412()
 #else
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 51a247ca4da8..5671621f1661 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -178,6 +178,7 @@ static void __init exynos_dt_machine_init(void)
 		exynos_cpuidle.dev.platform_data = &cpuidle_coupled_exynos_data;
 #endif
 	if (of_machine_is_compatible("samsung,exynos4210") ||
+	    of_machine_is_compatible("samsung,exynos4212") ||
 	    (of_machine_is_compatible("samsung,exynos4412") &&
 	     (of_machine_is_compatible("samsung,trats2") ||
 		  of_machine_is_compatible("samsung,midas") ||
@@ -192,6 +193,7 @@ static char const *const exynos_dt_compat[] __initconst = {
 	"samsung,exynos3250",
 	"samsung,exynos4",
 	"samsung,exynos4210",
+	"samsung,exynos4212",
 	"samsung,exynos4412",
 	"samsung,exynos5",
 	"samsung,exynos5250",
diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index 2da5b60b59e2..110c8064ee64 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -63,12 +63,18 @@ static int exynos_cpu_boot(int cpu)
 	 *
 	 * On Exynos5 devices the call is ignored by trustzone firmware.
 	 */
-	if (!soc_is_exynos4210() && !soc_is_exynos4412())
+	if (!soc_is_exynos4210() && !soc_is_exynos4412() &&
+	    !soc_is_exynos4212())
 		return 0;
 
 	/*
 	 * The second parameter of SMC_CMD_CPU1BOOT command means CPU id.
+	 * But, Exynos4212 has only one secondary CPU so second parameter
+	 * isn't used for informing secure firmware about CPU id.
 	 */
+	if (soc_is_exynos4212())
+		cpu = 0;
+
 	exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
 	return 0;
 }
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 30f4e55bf39e..9b6db04e4e34 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -161,7 +161,7 @@ void exynos_enter_aftr(void)
 
 	exynos_pm_central_suspend();
 
-	if (soc_is_exynos4412()) {
+	if (soc_is_exynos4412() || soc_is_exynos4212()) {
 		/* Setting SEQ_OPTION register */
 		pmu_raw_writel(S5P_USE_STANDBY_WFI0 | S5P_USE_STANDBY_WFE0,
 			       S5P_CENTRAL_SEQ_OPTION);
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 3bf14ca78b62..df1e10033f90 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -231,6 +231,7 @@ static int __init exynos_pmu_irq_init(struct device_node *node,
 
 EXYNOS_PMU_IRQ(exynos3250_pmu_irq, "samsung,exynos3250-pmu");
 EXYNOS_PMU_IRQ(exynos4210_pmu_irq, "samsung,exynos4210-pmu");
+EXYNOS_PMU_IRQ(exynos4212_pmu_irq, "samsung,exynos4212-pmu");
 EXYNOS_PMU_IRQ(exynos4412_pmu_irq, "samsung,exynos4412-pmu");
 EXYNOS_PMU_IRQ(exynos5250_pmu_irq, "samsung,exynos5250-pmu");
 EXYNOS_PMU_IRQ(exynos5420_pmu_irq, "samsung,exynos5420-pmu");
@@ -640,6 +641,9 @@ static const struct of_device_id exynos_pmu_of_device_ids[] __initconst = {
 	}, {
 		.compatible = "samsung,exynos4210-pmu",
 		.data = &exynos4_pm_data,
+	}, {
+		.compatible = "samsung,exynos4212-pmu",
+		.data = &exynos4_pm_data,
 	}, {
 		.compatible = "samsung,exynos4412-pmu",
 		.data = &exynos4_pm_data,
-- 
2.40.0

