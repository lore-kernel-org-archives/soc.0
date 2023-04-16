Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F054FC77B73
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 13:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5D58C4339E; Sun, 16 Apr 2023 13:35:51 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2C2CC4339B;
	Sun, 16 Apr 2023 13:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2C2CC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id c9so18616217ejz.1;
        Sun, 16 Apr 2023 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681652149; x=1684244149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKVIgiz58zIFJgX8elDwMTDtG02bu6kIfybVoLMLnnE=;
        b=jpx0NRbyMusb0ecSr5/iGMxYz0JwUDJN886OD/9YfiIzcVKnJXLY1BYn+1t78nwV/y
         9nqeIod/pXUqjApOqH5PHrxNljX+93tczHKOM9pYDHpgALFBPRH2cgBNjKuGHFbW/BSh
         zXwzu+r8BKDFt/NS4dgd9QHVM4vSwtgzMt3N06YoEi35nns7MZdzSQg1qy1c4v0pXPbw
         sldLFMjV93K8as7gmDeIcBrtXMy6fWb+Zo8ctWts38oyC+of47DRGUVY/13hsB/y/5n6
         pWQaJO0+RH+PoMjECv/s/3drmcniEaMqsCurZ1l5/zrpHramZCQWCzqqCHiqkMvK87O6
         5Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681652149; x=1684244149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKVIgiz58zIFJgX8elDwMTDtG02bu6kIfybVoLMLnnE=;
        b=FSV11dI/OikgckHR3oCoH05spV5JoY+308xB1aFr8Kdm9m289URXnkTD5RmuCbeTLi
         0/8BEX4wlm2e2C8MQBssuxnY9sy9YBV7j+o8pcPfprUy/L/M/9uOhiGuNo8BaH/dO44u
         cWXkrjg2mgUxQ82IIX0yWxNoToRP4JyQzaH0LEj7WPUY9KvKSCozIqgnyyzQDlesim+b
         zFXw8Z0CuR9WLo4/D0MIZ1fploRggn5nYvTq43GWPeyEWp1ow8GeHBYrHBHlMlKcad7r
         Yka0rxkPjtyS9oJEi2unxd9SkEyPd0P3HoQBMGPy9osYHNDySeg5BwoRsT0L4d6BDTvQ
         KXZw==
X-Gm-Message-State: AAQBX9dE5QadG4uDoOEWkA8+YfXU8GumrdF6B0qQ3yIqTJvn74binqEO
	3ynz3ma7R7YYqjXVJ4ZYtDU=
X-Google-Smtp-Source: AKy350YPmstbPVajjknyXiRkvg9C+KqbRwgdFKT785sk0SCoKCnq3TzeyY7LVWJnakbCk4/HQ+J22w==
X-Received: by 2002:a17:907:2ccc:b0:94f:3cb2:9351 with SMTP id hg12-20020a1709072ccc00b0094f3cb29351mr2253935ejc.40.1681652148930;
        Sun, 16 Apr 2023 06:35:48 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm5122958ejc.161.2023.04.16.06.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 06:35:48 -0700 (PDT)
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
Subject: [PATCH v2 07/12] Revert "media: exynos4-is: Remove dependency on obsolete SoC support"
Date: Sun, 16 Apr 2023 15:34:17 +0200
Message-Id: <20230416133422.1949-8-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416133422.1949-1-aweber.kernel@gmail.com>
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform was originally dropped in commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), as there were
no boards using it.

We will be adding a device that uses it, so add it back.

This reverts commit 2d41a0c9ae51ac363d107f2510022106e7234b33.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/media/platform/samsung/exynos4-is/Kconfig     | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-core.c | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/Kconfig b/drivers/media/platform/samsung/exynos4-is/Kconfig
index da33faa7132e..7f9ba053dd8e 100644
--- a/drivers/media/platform/samsung/exynos4-is/Kconfig
+++ b/drivers/media/platform/samsung/exynos4-is/Kconfig
@@ -47,7 +47,7 @@ config VIDEO_S5P_MIPI_CSIS
 config VIDEO_EXYNOS_FIMC_LITE
 	tristate "EXYNOS FIMC-LITE camera interface driver"
 	depends on I2C
-	depends on SOC_EXYNOS4412 || SOC_EXYNOS5250 || COMPILE_TEST
+	depends on SOC_EXYNOS4212 || SOC_EXYNOS4412 || SOC_EXYNOS5250 || COMPILE_TEST
 	depends on HAS_DMA
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEO_EXYNOS4_IS_COMMON
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.c b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
index 1791100b6935..e2f394e60dee 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
@@ -1129,7 +1129,7 @@ static const struct fimc_drvdata fimc_drvdata_exynos4210 = {
 	.out_buf_count	= 32,
 };
 
-/* EXYNOS4412 */
+/* EXYNOS4212, EXYNOS4412 */
 static const struct fimc_drvdata fimc_drvdata_exynos4x12 = {
 	.num_entities	= 4,
 	.lclk_frequency	= 166000000UL,
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index e185a40305a8..f80047095f30 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1619,7 +1619,7 @@ static const struct dev_pm_ops fimc_lite_pm_ops = {
 			   NULL)
 };
 
-/* EXYNOS4412 */
+/* EXYNOS4212, EXYNOS4412 */
 static struct flite_drvdata fimc_lite_drvdata_exynos4 = {
 	.max_width		= 8192,
 	.max_height		= 8192,
-- 
2.40.0

