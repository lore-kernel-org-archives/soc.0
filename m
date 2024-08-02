Return-Path: <SRS0=ip/V=PB=aspeedtech.com=kevin_chen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48879C52D1D
	for <soc@archiver.kernel.org>; Fri,  2 Aug 2024 09:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3630CC4AF0E; Fri,  2 Aug 2024 09:06:10 +0000 (UTC)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20330C4AF19;
	Fri,  2 Aug 2024 09:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20330C4AF19
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 2 Aug
 2024 17:05:52 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 2 Aug 2024 17:05:52 +0800
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
Subject: [PATCH v2 5/9] dt-bindings: arm: aspeed: Add ASPEED AST27XX SoC
Date: Fri, 2 Aug 2024 17:05:40 +0800
Message-ID: <20240802090544.2741206-7-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 95113df178cc..18fcd44377bd 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -8,6 +8,7 @@ title: Aspeed SoC based boards
 
 maintainers:
   - Joel Stanley <joel@jms.id.au>
+  - Kevin Chen <kevin_chen@aspeedtech.com>
 
 properties:
   $nodename:
@@ -98,4 +99,10 @@ properties:
               - ufispace,ncplite-bmc
           - const: aspeed,ast2600
 
+      - description: AST2700 based boards
+        items:
+          - enum:
+              - aspeed,ast2700-evb
+          - const: aspeed,ast2700
+
 additionalProperties: true
-- 
2.34.1

