Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4D3C77B61
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 13:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15792C433D2; Sun, 16 Apr 2023 13:35:45 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F382C4339B;
	Sun, 16 Apr 2023 13:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F382C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50489c109f4so6348920a12.2;
        Sun, 16 Apr 2023 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681652142; x=1684244142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p71y//uR+D7cixeMALk8VhvdwbZ2ImHTuWWM7+KMyYU=;
        b=pJXFgk+NWdlcUWqn0CAJER8vvEVEsgWfuzc+d4oDR+4JPfI0l+9p13UP24yjnlotOQ
         QA+hvrFp47yzq08fnypXcq+33V6ao+pTGROzOzbDVlcdqay/CcY0jdmknsIEJk67LRC1
         BHntnCxsLYiJPmnRxY0zx14QO/tGrqQvcaEh5XwW1/9OLDLy/M0af93NVFdvBsh52Zm4
         bvo2lz2v2q21biuHZ6i4g+8PIUreOfZNZRnNnovx6PkAq6kUIxRvQ8xWUYPVP9sYp2QI
         3NGcbfx1UZ3/gW6hg9YPch/cZiSdGoNcKBatd/1JXdhUBNpyjtTJ8azkYheGV1JbJyTb
         oD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681652142; x=1684244142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p71y//uR+D7cixeMALk8VhvdwbZ2ImHTuWWM7+KMyYU=;
        b=HMfq6qJ5sJo9plxd+jDUlEeEw//fFNui6UK/8BVRV7H5g8Gt9g9LITJCk/sXoA2JdU
         LyQgGx+2UCqmf5eE8IcW/h/OGucncGReo8PcoXLPuutSu6r2Ehg8gFRQ2ypxZs9zk82Z
         FLp/11dGojOTyXpZqB+iJvA0YhgeMVZkVZW0YDxRFG5Jesz57PaNxPTpQOIKjjcqZVB6
         AbCvjDpbPYXxKIGrZPO9lVW4vXUAjDXFL+aeC0n+sq8vgbpRmMwbEaupzppPdT+bY9w2
         ZIBfTwsLgRsOHKRKjPjOgIuhLA+zAl/Ql644a6s9VyZoTNoAc8wWbdEK4rPpZdykXUn7
         /U7A==
X-Gm-Message-State: AAQBX9eJQD+erz/aKvRFuMSqRPyXuvNU5pbNaxJDQQ6OzUtfPlYet/UT
	H98hgFxNDDuhwwqzrRbJLJSy37DtZUFB8w==
X-Google-Smtp-Source: AKy350a4bDFc1nDQ4TpPm8FPIuPeDQN6bY3okrym98knbaDGqTAnZNubzYyTwKGklnso2Fml0g+Smw==
X-Received: by 2002:aa7:c90b:0:b0:506:7385:9653 with SMTP id b11-20020aa7c90b000000b0050673859653mr10582713edt.39.1681652141742;
        Sun, 16 Apr 2023 06:35:41 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm5122958ejc.161.2023.04.16.06.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 06:35:41 -0700 (PDT)
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
Subject: [PATCH v2 04/12] soc: samsung: Re-introduce Exynos4212 support
Date: Sun, 16 Apr 2023 15:34:14 +0200
Message-Id: <20230416133422.1949-5-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416133422.1949-1-aweber.kernel@gmail.com>
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform was originally dropped in commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), as there were
no boards using it.

We will be adding a device that uses it, so add it back.

This effectively reverts commit c40610198f35 ("soc: samsung: Remove
Exynos4212 related dead code").

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/soc/samsung/exynos-pmu.c  |  9 +++++++++
 drivers/soc/samsung/exynos-pmu.h  |  2 ++
 drivers/soc/samsung/exynos4-pmu.c | 13 +++++++++++--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 732c86ce2be8..f3437db2fbdc 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -57,6 +57,12 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
 
 	if (pmu_data->powerdown_conf_extra)
 		pmu_data->powerdown_conf_extra(mode);
+
+	if (pmu_data->pmu_config_extra) {
+		for (i = 0; pmu_data->pmu_config_extra[i].offset != PMU_TABLE_END; i++)
+			pmu_raw_writel(pmu_data->pmu_config_extra[i].val[mode],
+					pmu_data->pmu_config_extra[i].offset);
+	}
 }
 
 /*
@@ -79,6 +85,9 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 	}, {
 		.compatible = "samsung,exynos4210-pmu",
 		.data = exynos_pmu_data_arm_ptr(exynos4210_pmu_data),
+	}, {
+		.compatible = "samsung,exynos4212-pmu",
+		.data = exynos_pmu_data_arm_ptr(exynos4212_pmu_data),
 	}, {
 		.compatible = "samsung,exynos4412-pmu",
 		.data = exynos_pmu_data_arm_ptr(exynos4412_pmu_data),
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 5e851f32307e..1c652ffd79b4 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -20,6 +20,7 @@ struct exynos_pmu_conf {
 
 struct exynos_pmu_data {
 	const struct exynos_pmu_conf *pmu_config;
+	const struct exynos_pmu_conf *pmu_config_extra;
 
 	void (*pmu_init)(void);
 	void (*powerdown_conf)(enum sys_powerdown);
@@ -32,6 +33,7 @@ extern void __iomem *pmu_base_addr;
 /* list of all exported SoC specific data */
 extern const struct exynos_pmu_data exynos3250_pmu_data;
 extern const struct exynos_pmu_data exynos4210_pmu_data;
+extern const struct exynos_pmu_data exynos4212_pmu_data;
 extern const struct exynos_pmu_data exynos4412_pmu_data;
 extern const struct exynos_pmu_data exynos5250_pmu_data;
 extern const struct exynos_pmu_data exynos5420_pmu_data;
diff --git a/drivers/soc/samsung/exynos4-pmu.c b/drivers/soc/samsung/exynos4-pmu.c
index cb35103565a6..f8092190b938 100644
--- a/drivers/soc/samsung/exynos4-pmu.c
+++ b/drivers/soc/samsung/exynos4-pmu.c
@@ -86,7 +86,7 @@ static const struct exynos_pmu_conf exynos4210_pmu_config[] = {
 	{ PMU_TABLE_END,},
 };
 
-static const struct exynos_pmu_conf exynos4412_pmu_config[] = {
+static const struct exynos_pmu_conf exynos4x12_pmu_config[] = {
 	{ S5P_ARM_CORE0_LOWPWR,			{ 0x0, 0x0, 0x2 } },
 	{ S5P_DIS_IRQ_CORE0,			{ 0x0, 0x0, 0x0 } },
 	{ S5P_DIS_IRQ_CENTRAL0,			{ 0x0, 0x0, 0x0 } },
@@ -191,6 +191,10 @@ static const struct exynos_pmu_conf exynos4412_pmu_config[] = {
 	{ S5P_GPS_ALIVE_LOWPWR,			{ 0x7, 0x0, 0x0 } },
 	{ S5P_CMU_SYSCLK_ISP_LOWPWR,		{ 0x1, 0x0, 0x0 } },
 	{ S5P_CMU_SYSCLK_GPS_LOWPWR,		{ 0x1, 0x0, 0x0 } },
+	{ PMU_TABLE_END,},
+};
+
+static const struct exynos_pmu_conf exynos4412_pmu_config[] = {
 	{ S5P_ARM_CORE2_LOWPWR,			{ 0x0, 0x0, 0x2 } },
 	{ S5P_DIS_IRQ_CORE2,			{ 0x0, 0x0, 0x0 } },
 	{ S5P_DIS_IRQ_CENTRAL2,			{ 0x0, 0x0, 0x0 } },
@@ -204,6 +208,11 @@ const struct exynos_pmu_data exynos4210_pmu_data = {
 	.pmu_config	= exynos4210_pmu_config,
 };
 
+const struct exynos_pmu_data exynos4212_pmu_data = {
+	.pmu_config	= exynos4x12_pmu_config,
+};
+
 const struct exynos_pmu_data exynos4412_pmu_data = {
-	.pmu_config		= exynos4412_pmu_config,
+	.pmu_config		= exynos4x12_pmu_config,
+	.pmu_config_extra	= exynos4412_pmu_config,
 };
-- 
2.40.0

