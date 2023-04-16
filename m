Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AADC77B7C
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 10:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9CCB7C433D2; Sun, 16 Apr 2023 10:18:22 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83F2EC4339C;
	Sun, 16 Apr 2023 10:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83F2EC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id fw30so4005013ejc.5;
        Sun, 16 Apr 2023 03:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681640300; x=1684232300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsVMP+nc4oNcZ87McW4OVdy6DpQdiSat54tBtHLhBBY=;
        b=nfr1zVEw9kPnLlYUrcbByybp16B3MuFjdqImbC7ms95NuitM7HO538K0NAk+bYVGm+
         VMfIGm5E5jFbUYTbOhrKD/2XnlznH5U1I/XmsKu5kq9+yPUCQztZKlJ5S7+tHyCHRLdp
         pLNOWMIuBaP969GCwvUkFO6A+9hbN3sT0yhfbjvzyetl/obzZqNpcQdTFk/lpmhlbTnb
         WpnuV3fHhpRne6stvD2t6TvjxTORCuTkrGwhFFkFctwvBlJvi1BLivYa5XK9bRExHFDj
         YCVhGMK7QkfpJlp9R2Jdh0UQ8vje0IiCc+JWfPDLD6Pgy2kcaU4J2dK4wI5joxk1ubv2
         hD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681640300; x=1684232300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsVMP+nc4oNcZ87McW4OVdy6DpQdiSat54tBtHLhBBY=;
        b=iTNFRo3tlvDQ2fHcBl95FJ9MqKXAsoGCukH64WCqRsnjGfUDVKopt7wxJ6EdAmrtRg
         pelNNo0Smgt2xh/yC7q4kI9uVLPawjlzpvTGMtYFj0EJXnTuJ71rqZcfF1TejdIv+QRq
         0UHaEJ19B6CZMQ/YhVYxkfxior2HfaQrFOkS91+poVn0KZ27fyTMNaTPhn0Shn0Je2CF
         6KVIHytd5qLYfdeB4ozV5WjPi7Upk3WQ3X0PPSglCBvenv5Az3C/FZlrMF8tGJ0tU3r7
         /BvoFm2WCUvdEjiMRJJ/f6AlUYk9f0L1ArRLx+Mo5+EBpbyTzjLyZAkMrN0QhMFXkQAV
         8iRA==
X-Gm-Message-State: AAQBX9eX9fZiplk/8YO/2DFXYsMiXLGmaJwmNqjfB7XOn6tlXhnjE4Fd
	CIdFrUvrYu2TCAIbf7ilSbc=
X-Google-Smtp-Source: AKy350Y2lZk3tbzxpDLIO3N9WFJh/eVD/q3CDUxh62fYMbYn+3t5erUqoeMqEi2LTAa6ReHdAtk0pQ==
X-Received: by 2002:a17:907:8a1e:b0:94f:695f:b177 with SMTP id sc30-20020a1709078a1e00b0094f695fb177mr422788ejc.30.1681640299547;
        Sun, 16 Apr 2023 03:18:19 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id r20-20020a056402019400b0050476da5160sm4427443edv.45.2023.04.16.03.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 03:18:19 -0700 (PDT)
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
Subject: [PATCH 06/12] clk: samsung: Re-add support for Exynos4212 CPU clock
Date: Sun, 16 Apr 2023 12:16:18 +0200
Message-Id: <20230416101624.15866-7-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416101624.15866-1-aweber.kernel@gmail.com>
References: <20230416101624.15866-1-aweber.kernel@gmail.com>
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

