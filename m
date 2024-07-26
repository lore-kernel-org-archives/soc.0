Return-Path: <SRS0=BMg4=O2=aspeedtech.com=kevin_chen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C090EC52CDA
	for <soc@archiver.kernel.org>; Fri, 26 Jul 2024 11:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7F27C4AF07; Fri, 26 Jul 2024 11:04:22 +0000 (UTC)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35C6BC4AF09;
	Fri, 26 Jul 2024 11:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35C6BC4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 26 Jul
 2024 19:04:00 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 26 Jul 2024 19:04:00 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
List-Id: <soc.lore.kernel.org>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <lee@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <p.zabel@pengutronix.de>, <quic_bjorande@quicinc.com>,
	<geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
	<shawnguo@kernel.org>, <neil.armstrong@linaro.org>,
	<m.szyprowski@samsung.com>, <nfraprado@collabora.com>, <u-kumar1@ti.com>,
	<kevin_chen@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v1 07/10] arm64: aspeed: Add support for ASPEED AST2700 BMC SoC
Date: Fri, 26 Jul 2024 19:03:52 +0800
Message-ID: <20240726110355.2181563-8-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

---
 MAINTAINERS                  |  3 +++
 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c0a3d9e93689..08609430cfe0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2121,7 +2121,10 @@ Q:	https://patchwork.ozlabs.org/project/linux-aspeed/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
 F:	Documentation/devicetree/bindings/arm/aspeed/
 F:	arch/arm/boot/dts/aspeed/
+F:	arch/arm64/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
+F:	include/dt-bindings/clock/aspeed,ast2700-clk.h
+F:	include/dt-bindings/reset/aspeed,ast2700-reset.h
 N:	aspeed
 
 ARM/AXM LSI SOC
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6c6d11536b42..1db7b6f1ee0a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -40,6 +40,20 @@ config ARCH_APPLE
 	  This enables support for Apple's in-house ARM SoC family, starting
 	  with the Apple M1.
 
+config ARCH_ASPEED
+	bool "Aspeed SoC family"
+	select MACH_ASPEED_G7
+	help
+	  Say yes if you intend to run on an Aspeed ast2700 or similar
+	  seventh generation Aspeed BMCs.
+
+config MACH_ASPEED_G7
+	bool "Aspeed SoC AST2700"
+	help
+	  Say yes if you intend to run on an Aspeed ast2700
+	  seventh generation Aspeed BMCs.
+	  Aspeed ast2700 BMC based on the Cortex A35.
+
 menuconfig ARCH_BCM
 	bool "Broadcom SoC Support"
 
-- 
2.34.1

