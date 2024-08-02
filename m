Return-Path: <SRS0=ip/V=PB=aspeedtech.com=kevin_chen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCE5C3DA4A
	for <soc@archiver.kernel.org>; Fri,  2 Aug 2024 09:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7690C4AF12; Fri,  2 Aug 2024 09:05:59 +0000 (UTC)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F403C4AF10;
	Fri,  2 Aug 2024 09:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F403C4AF10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 2 Aug
 2024 17:05:51 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 2 Aug 2024 17:05:51 +0800
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
Subject: [PATCH v2 0/9] Introduce ASPEED AST27XX BMC SoC
Date: Fri, 2 Aug 2024 17:05:35 +0800
Message-ID: <20240802090544.2741206-2-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patchset adds initial support for the ASPEED.
AST27XX Board Management controller (BMC) SoC family.

AST2700 is ASPEED's 8th-generation server management processor.
Featuring a quad-core ARM Cortex A35 64-bit processor and two
independent ARM Cortex M4 processors

This patchset adds minimal architecture and drivers such as:
Clocksource, Clock and Reset

This patchset was tested on the ASPEED AST2700 evaluation board.

Kevin Chen (9):
  dt-bindings: mfd: aspeed,ast2x00-scu: Add ASPEED AST2700-SCUX schema
  dt-bindings: reset: ast2700: Add ASPEED AST27xx Reset schema
  dt-bindings: clk: ast2700: Add ASPEED AST27XX Clock schema
  clk: ast2700: add clock controller
  dt-bindings: arm: aspeed: Add ASPEED AST27XX SoC
  arm64: aspeed: Add support for ASPEED AST27XX BMC SoC
  arm64: defconfig: Add ASPEED AST2700 family support
  arm64: dts: aspeed: Add initial AST27XX device tree
  arm64: dts: aspeed: Add initial AST2700 EVB device tree

 .../bindings/arm/aspeed/aspeed.yaml           |    7 +
 .../bindings/mfd/aspeed,ast2x00-scu.yaml      |   70 +-
 MAINTAINERS                                   |    3 +
 arch/arm64/Kconfig.platforms                  |   14 +
 arch/arm64/boot/dts/Makefile                  |    1 +
 arch/arm64/boot/dts/aspeed/Makefile           |    4 +
 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi     |  185 +++
 arch/arm64/boot/dts/aspeed/ast2700-evb.dts    |   58 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-ast2700.c                     | 1173 +++++++++++++++++
 .../dt-bindings/clock/aspeed,ast2700-clk.h    |  175 +++
 .../dt-bindings/reset/aspeed,ast2700-reset.h  |  132 ++
 13 files changed, 1804 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts
 create mode 100644 drivers/clk/clk-ast2700.c
 create mode 100644 include/dt-bindings/clock/aspeed,ast2700-clk.h
 create mode 100644 include/dt-bindings/reset/aspeed,ast2700-reset.h

-- 
2.34.1

