Return-Path: <SRS0=BMg4=O2=aspeedtech.com=kevin_chen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708FCC49EA1
	for <soc@archiver.kernel.org>; Fri, 26 Jul 2024 11:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C7F7C4AF0B; Fri, 26 Jul 2024 11:04:28 +0000 (UTC)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07191C4AF09;
	Fri, 26 Jul 2024 11:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07191C4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 26 Jul
 2024 19:03:59 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 26 Jul 2024 19:03:59 +0800
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
Subject: [PATCH v1 01/10] dt-binding: mfd: aspeed,ast2x00-scu: Add binding for ASPEED AST2700 SCU
Date: Fri, 26 Jul 2024 19:03:46 +0800
Message-ID: <20240726110355.2181563-2-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
---
 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index 86ee69c0f45b..3fc991e4514d 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -13,6 +13,7 @@ description:
 maintainers:
   - Joel Stanley <joel@jms.id.au>
   - Andrew Jeffery <andrew@aj.id.au>
+  - Kevin Chen <kevin_chen@aspeedtech.com>
 
 properties:
   compatible:
@@ -21,6 +22,7 @@ properties:
           - aspeed,ast2400-scu
           - aspeed,ast2500-scu
           - aspeed,ast2600-scu
+          - aspeed,ast2700-scu
       - const: syscon
       - const: simple-mfd
 
@@ -76,6 +78,7 @@ patternProperties:
               - aspeed,ast2400-silicon-id
               - aspeed,ast2500-silicon-id
               - aspeed,ast2600-silicon-id
+              - aspeed,ast2700-silicon-id
           - const: aspeed,silicon-id
 
       reg:
-- 
2.34.1

