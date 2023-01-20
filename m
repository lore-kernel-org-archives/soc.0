Return-Path: <SRS0=a+z/=5R=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B30C05027
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 12:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B3B6C4339C; Fri, 20 Jan 2023 12:57:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8F6DC4339B
	for <soc@kernel.org>; Fri, 20 Jan 2023 12:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8F6DC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so5770569wml.3
        for <soc@kernel.org>; Fri, 20 Jan 2023 04:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eoV8ostgSDbK08VdIZJMHvJGHyPcf5FjWF2t6GC4OEg=;
        b=I+2h2nB4eC17X95+rn5I4LjsNEODeuLd/RstVgSYO9B2D0iPkpnYaJvdIdryMAT1EO
         CU5FIeSMPKBW9fVMRpzL+IOLy9wCpHpyqT4JWPVxeEjGfO0IEBspkhA5UJcsPP05Ntfd
         rV1LO9WfmcPB8z+8of3kfcC8Qiqk1770+UjG/QY6zRB2aDJBcReLfNOHefGUoqPO7Iga
         VaFSdp2S5tlSKZZztCPhgRwp05yXyUkVmqmkuU65yyVBXnHQ6N2P6ho/wHUBV0YYv5vP
         JfWl3INAMhagIgOCA+Qjd+eSHo1Yo9YWD238XpPKHtNWXfy5o3JbPFOvjW1b+h7nds4G
         mMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoV8ostgSDbK08VdIZJMHvJGHyPcf5FjWF2t6GC4OEg=;
        b=GQqMJ6iGWQ5HAQ41xf9YSHAiKjvbKKf9LCtXmReCF3f5TcjL7IFYWnooa12IXVyn8s
         2p0XVgoik1EubC+h7BRvdcIaUR67/GtmZ2SnOFBb9JFuWuGHLRmtSjeGW/B1jOTvX7fE
         LG8Qf6FvK8vPFny5s4IxrbEENTt7Z+ERd8Vpw/Snjr9vu8z96ikuHsqNkdPf52FWku20
         ow8XHzHUsmtzgFn7n2i13B5sthCjkdb7iaeQnXL2EURixwll1DGM42ii6t8aFVPvp21H
         JDTiby44wQnpHiIIV839Qq6S/JKqxB22rddyjac6tGTu6JzfwSR4dEhvu0GkC0An5LLs
         aVAA==
X-Gm-Message-State: AFqh2krUc0QxanQPPwKJ8h7YdvC/Rcg/zT42O8RXv5K7DOP3leBA9EwI
	+yM4v+UXPiUhVrNZUEv9Q6VyvA==
X-Google-Smtp-Source: AMrXdXvkIjdx5y0alBmce8ylnRgIDUjnzn/rTeXMSskipMsEgmlz4JbfeRubh4n53lBnOQIWrz2B4Q==
X-Received: by 2002:a05:600c:1d22:b0:3da:f66c:795d with SMTP id l34-20020a05600c1d2200b003daf66c795dmr14361504wms.9.1674219446983;
        Fri, 20 Jan 2023 04:57:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f22-20020a1cc916000000b003d35acb0fd7sm2229002wmb.34.2023.01.20.04.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 04:57:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: drop redundant "ARMv8" from Kconfig option title
Date: Fri, 20 Jan 2023 13:57:22 +0100
Message-Id: <20230120125722.270722-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All these platforms are ARMv8 or newer and choosing the platforms in
menuconfig is much easier if the titles start with something specific.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/Kconfig.platforms | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d1970adf80ab..165e544aa7f9 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -95,7 +95,7 @@ config ARCH_BITMAIN
 	  This enables support for the Bitmain SoC Family.
 
 config ARCH_EXYNOS
-	bool "ARMv8 based Samsung Exynos SoC family"
+	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
 	select CLKSRC_EXYNOS_MCT
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
@@ -108,7 +108,7 @@ config ARCH_EXYNOS
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
 config ARCH_SPARX5
-	bool "ARMv8 based Microchip Sparx5 SoC family"
+	bool "Microchip Sparx5 SoC family"
 	select PINCTRL
 	select DW_APB_TIMER_OF
 	help
@@ -199,13 +199,13 @@ menuconfig ARCH_NXP
 if ARCH_NXP
 
 config ARCH_LAYERSCAPE
-	bool "ARMv8 based Freescale Layerscape SoC family"
+	bool "Freescale Layerscape SoC family"
 	select EDAC_SUPPORT
 	help
 	  This enables support for the Freescale Layerscape SoC family.
 
 config ARCH_MXC
-	bool "ARMv8 based NXP i.MX SoC family"
+	bool "NXP i.MX SoC family"
 	select ARM64_ERRATUM_843419
 	select ARM64_ERRATUM_845719 if COMPAT
 	select IMX_GPCV2
@@ -296,7 +296,7 @@ config ARCH_TEGRA
 	  This enables support for the NVIDIA Tegra SoC family.
 
 config ARCH_TESLA_FSD
-	bool "ARMv8 based Tesla platform"
+	bool "Tesla platform"
 	depends on ARCH_EXYNOS
 	help
 	  Support for ARMv8 based Tesla platforms.
-- 
2.34.1

