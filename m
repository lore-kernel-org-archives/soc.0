Return-Path: <SRS0=tCWR=IJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B9BC433E0
	for <soc@archiver.kernel.org>; Thu, 11 Mar 2021 15:28:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ECCC564FA6; Thu, 11 Mar 2021 15:27:59 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A92CA64FAB
	for <soc@kernel.org>; Thu, 11 Mar 2021 15:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A92CA64FAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lKNEE-0005qO-7Z
	for soc@kernel.org; Thu, 11 Mar 2021 15:27:58 +0000
Received: by mail-wr1-f70.google.com with SMTP id v13so9679574wrs.21
        for <soc@kernel.org>; Thu, 11 Mar 2021 07:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LkS1dLaLUNf0Tu13eWfZQBLP6fiimg7+EWMMMS6XyYM=;
        b=eIlmxC+1efekXSiMiFxX8tSQ6akSIEOaKMl0JliP0hyIXgcUaU8w1Uzpxeb52jQYeY
         ZS6qPRGqISFa9EAgsFrEQfZvckOhzqsSVy0Z8bVVJ00sFTlTBuBQHl9+5T/IDoio86Sf
         jxLkoZJNTwq29fYYq+55wUIXnHL+ZGNFa6e3YmqL6LdZhsWEJOBEJYLkpUUKl/45XtYo
         ch7Gq+eLsr/qO4PNZNytzXXQE4qmMr1aGRzF5AElg+GNFQ+5gb2+LjWTDZY2+VUjDSib
         po891Wui8BbCI6up8Hn6QbESLn1FPrixxguutUihSTeu5OkszQImbo9CCd4h40ycd0NI
         il8g==
X-Gm-Message-State: AOAM5320V6Gi+FNCulqXcRiBcTHfYTW/wluOEc3zJHefW+oxVJkvyO6q
	Ju/RyICFkWan9Plhw5cTnY3itEwNq7Za9PyaT6sFaGhaCphinujKmIjpGpYIq+GI4MIn28t8Aye
	NN12Zhe17gjTBmNUSJyvY5Cc=
X-Received: by 2002:a05:6402:10c9:: with SMTP id p9mr9186800edu.268.1615476466826;
        Thu, 11 Mar 2021 07:27:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiRng9hU7KaBQ9hI2y61WSuJDlIqArf08ScSxAu55vb9/puMamEp/Rnnmw5+yqMGNTUgkwAA==
X-Received: by 2002:a05:6402:10c9:: with SMTP id p9mr9186761edu.268.1615476466574;
        Thu, 11 Mar 2021 07:27:46 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id t15sm1518545edc.34.2021.03.11.07.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:27:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Robert Richter <rric@kernel.org>,
	Moritz Fischer <mdf@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Lee Jones <lee.jones@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 15/15] ARM: socfpga: drop ARCH_SOCFPGA
Date: Thu, 11 Mar 2021 16:27:44 +0100
Message-Id: <20210311152744.1318653-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
one for both of them.  After conversion of all
drivers to use the new ARCH_INTEL_SOCFPGA, the remaining ARM option can
be removed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 arch/arm/configs/socfpga_defconfig  | 2 +-
 arch/arm/mach-socfpga/Kconfig       | 8 ++------
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3823da605430..591b15164e3d 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -79,7 +79,7 @@ CONFIG_ARCH_MSM8960=y
 CONFIG_ARCH_MSM8974=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_RENESAS=y
-CONFIG_ARCH_SOCFPGA=y
+CONFIG_ARCH_INTEL_SOCFPGA=y
 CONFIG_PLAT_SPEAR=y
 CONFIG_ARCH_SPEAR13XX=y
 CONFIG_MACH_SPEAR1310=y
diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index 0c60eb382c80..2d9404ea52c6 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -9,7 +9,7 @@ CONFIG_NAMESPACES=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EMBEDDED=y
 CONFIG_PROFILING=y
-CONFIG_ARCH_SOCFPGA=y
+CONFIG_ARCH_INTEL_SOCFPGA=y
 CONFIG_ARM_THUMBEE=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
index e43ed0ca6860..43ddec677c0b 100644
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@ -1,8 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menuconfig ARCH_SOCFPGA
+menuconfig ARCH_INTEL_SOCFPGA
 	bool "Altera SOCFPGA family"
 	depends on ARCH_MULTI_V7
-	select ARCH_INTEL_SOCFPGA
 	select ARCH_SUPPORTS_BIG_ENDIAN
 	select ARM_AMBA
 	select ARM_GIC
@@ -20,10 +19,7 @@ menuconfig ARCH_SOCFPGA
 	select PL310_ERRATA_753970 if PL310
 	select PL310_ERRATA_769419
 
-if ARCH_SOCFPGA
-config ARCH_INTEL_SOCFPGA
-	bool
-
+if ARCH_INTEL_SOCFPGA
 config SOCFPGA_SUSPEND
 	bool "Suspend to RAM on SOCFPGA"
 	help
-- 
2.25.1

