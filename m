Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E7EC77B7A
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 13:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A9ABC4339B; Sun, 16 Apr 2023 13:35:49 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 714C9C433EF;
	Sun, 16 Apr 2023 13:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 714C9C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id c9so18616053ejz.1;
        Sun, 16 Apr 2023 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681652146; x=1684244146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsVMP+nc4oNcZ87McW4OVdy6DpQdiSat54tBtHLhBBY=;
        b=BK9ciytjH5O2apYl911PFKkIxjD0zuyUTnHnkFvow0HPrFXNgXRS+bCDhdVp/D36t6
         2P+yZB0Cqdr/gCuTRs5bqhMWolKAffqrQgg9iAQve6wBRsD6NVOxaeGXviUDLeV3rJuR
         xLdhNHynxxhPQGqFxrD6NL5AK92/CrwjBjCH+NRPxkfCyXCUTnTwKgi5E73R0eV7jBwZ
         HznmnxwUraE0gCIW5shq36yHLszhwO9+ho7QeR+RTJKYESs+Q3YqnnBWCavzVTrwfVvh
         9ov5d3uIsJZKmu/pF0PG+eTcUExVaN7r7ETQ1ENn984AqaKihGNVEDbOeyz6yR/EZfad
         w00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681652146; x=1684244146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsVMP+nc4oNcZ87McW4OVdy6DpQdiSat54tBtHLhBBY=;
        b=Lhg3RQyB6YugnE7UJOFKO61/3JIl7NYuHEtIATxvTjbDxnN1JMx1BAyJGFSvJV4c7M
         0hoQNU+qZjjkm0bPD2fVezMHsLg0hGww/CmS2w6rv4ujSgW2Vr8c+FMC0HyY3R6KxeTI
         FHOTgGYC7KxkZL9BHVdgG6LAJoamfTmZeiQpeBu1PWEgaiEkNQLXKWn/dwUl5M47ChaA
         fJCebawYrKhBtDWT2TR+hH2boJDzb3RCE8CdjvLhgvpGXneeJRYwCB+gGUBiqRY6ICvZ
         XuDkapK01MNPIC/ja5xGguQHNtwTltDADiA5t8QXeu/8LRwMrYTCTy23EgRm9G/oGw33
         TMNA==
X-Gm-Message-State: AAQBX9c7/0YTbwAy9i4deQdyS789MbHx/4CVPxiv/MVbs7vI3oORmhz0
	2H4Qz98D3PZv73+nQx3RfXs=
X-Google-Smtp-Source: AKy350aOQZtUDJ6HCtW/XeHcJyZm9y8dSlT6kREJgZmf3EgNgVfgfeFUalYfzshLE7tAJJsTQfMIqQ==
X-Received: by 2002:a17:906:4a0f:b0:94e:d664:c2d5 with SMTP id w15-20020a1709064a0f00b0094ed664c2d5mr4822386eju.21.1681652146503;
        Sun, 16 Apr 2023 06:35:46 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm5122958ejc.161.2023.04.16.06.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 06:35:46 -0700 (PDT)
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
Subject: [PATCH v2 06/12] clk: samsung: Re-add support for Exynos4212 CPU clock
Date: Sun, 16 Apr 2023 15:34:16 +0200
Message-Id: <20230416133422.1949-7-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416133422.1949-1-aweber.kernel@gmail.com>
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform was originally dropped in commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), as there were
no boards using it.

We will be adding a device that uses it, so add it back.

This is effectively a revert of commit c9194fb623b0 ("clk: samsung:
Remove support for obsolete Exynos4212 CPU clock"); the driver
has changed significantly since then, prompting this re-make.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/clk/samsung/clk-exynos4.c | 44 +++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 22009cb53428..9655f46db95c 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -138,7 +138,8 @@
 /* the exynos4 soc type */
 enum exynos4_soc {
 	EXYNOS4210,
-	EXYNOS4X12,
+	EXYNOS4412,
+	EXYNOS4212,
 };
 
 /* list of PLLs to be registered */
@@ -1205,6 +1206,24 @@ static const struct exynos_cpuclk_cfg_data e4210_armclk_d[] __initconst = {
 	{  0 },
 };
 
+static const struct exynos_cpuclk_cfg_data e4212_armclk_d[] __initconst = {
+	{ 1500000, E4210_CPU_DIV0(2, 1, 6, 0, 7, 3), E4210_CPU_DIV1(2, 6), },
+	{ 1400000, E4210_CPU_DIV0(2, 1, 6, 0, 7, 3), E4210_CPU_DIV1(2, 6), },
+	{ 1300000, E4210_CPU_DIV0(2, 1, 5, 0, 7, 3), E4210_CPU_DIV1(2, 5), },
+	{ 1200000, E4210_CPU_DIV0(2, 1, 5, 0, 7, 3), E4210_CPU_DIV1(2, 5), },
+	{ 1100000, E4210_CPU_DIV0(2, 1, 4, 0, 6, 3), E4210_CPU_DIV1(2, 4), },
+	{ 1000000, E4210_CPU_DIV0(1, 1, 4, 0, 5, 2), E4210_CPU_DIV1(2, 4), },
+	{  900000, E4210_CPU_DIV0(1, 1, 3, 0, 5, 2), E4210_CPU_DIV1(2, 3), },
+	{  800000, E4210_CPU_DIV0(1, 1, 3, 0, 5, 2), E4210_CPU_DIV1(2, 3), },
+	{  700000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
+	{  600000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
+	{  500000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
+	{  400000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
+	{  300000, E4210_CPU_DIV0(1, 1, 2, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
+	{  200000, E4210_CPU_DIV0(1, 1, 1, 0, 3, 1), E4210_CPU_DIV1(2, 3), },
+	{  0 },
+};
+
 #define E4412_CPU_DIV1(cores, hpm, copy)				\
 		(((cores) << 8) | ((hpm) << 4) | ((copy) << 0))
 
@@ -1233,6 +1252,11 @@ static const struct samsung_cpu_clock exynos4210_cpu_clks[] __initconst = {
 			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14200, e4210_armclk_d),
 };
 
+static const struct samsung_cpu_clock exynos4212_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL_USER_C,
+			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14200, e4212_armclk_d),
+};
+
 static const struct samsung_cpu_clock exynos4412_cpu_clks[] __initconst = {
 	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL_USER_C,
 			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14200, e4412_armclk_d),
@@ -1326,11 +1350,15 @@ static void __init exynos4_clk_init(struct device_node *np,
 		samsung_clk_register_fixed_factor(ctx,
 			exynos4x12_fixed_factor_clks,
 			ARRAY_SIZE(exynos4x12_fixed_factor_clks));
-		samsung_clk_register_cpu(ctx, exynos4412_cpu_clks,
-				ARRAY_SIZE(exynos4412_cpu_clks));
+		if (soc == EXYNOS4412)
+			samsung_clk_register_cpu(ctx, exynos4412_cpu_clks,
+					ARRAY_SIZE(exynos4412_cpu_clks));
+		else
+			samsung_clk_register_cpu(ctx, exynos4212_cpu_clks,
+					ARRAY_SIZE(exynos4212_cpu_clks));
 	}
 
-	if (soc == EXYNOS4X12)
+	if (soc == EXYNOS4412 || soc == EXYNOS4212)
 		exynos4x12_core_down_clock();
 
 	samsung_clk_extended_sleep_init(reg_base,
@@ -1363,8 +1391,14 @@ static void __init exynos4210_clk_init(struct device_node *np)
 }
 CLK_OF_DECLARE(exynos4210_clk, "samsung,exynos4210-clock", exynos4210_clk_init);
 
+static void __init exynos4212_clk_init(struct device_node *np)
+{
+	exynos4_clk_init(np, EXYNOS4212);
+}
+CLK_OF_DECLARE(exynos4212_clk, "samsung,exynos4212-clock", exynos4212_clk_init);
+
 static void __init exynos4412_clk_init(struct device_node *np)
 {
-	exynos4_clk_init(np, EXYNOS4X12);
+	exynos4_clk_init(np, EXYNOS4412);
 }
 CLK_OF_DECLARE(exynos4412_clk, "samsung,exynos4412-clock", exynos4412_clk_init);
-- 
2.40.0

