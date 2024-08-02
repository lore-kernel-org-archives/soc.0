Return-Path: <SRS0=ip/V=PB=aspeedtech.com=kevin_chen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36999C3DA7F
	for <soc@archiver.kernel.org>; Fri,  2 Aug 2024 09:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E930C4AF11; Fri,  2 Aug 2024 09:06:01 +0000 (UTC)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE290C4AF13;
	Fri,  2 Aug 2024 09:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE290C4AF13
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
Subject: [PATCH v2 1/9] dt-bindings: mfd: aspeed,ast2x00-scu: Add ASPEED AST2700-SCUX schema
Date: Fri, 2 Aug 2024 17:05:36 +0800
Message-ID: <20240802090544.2741206-3-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add compatible for two SCU of SCU0 and SCU1 in AST2700.

Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
---
 .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 70 +++++++++++++------
 1 file changed, 50 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index 86ee69c0f45b..3426b1c84132 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -13,33 +13,62 @@ description:
 maintainers:
   - Joel Stanley <joel@jms.id.au>
   - Andrew Jeffery <andrew@aj.id.au>
+  - Kevin Chen <kevin_chen@aspeedtech.com>
 
-properties:
-  compatible:
-    items:
-      - enum:
-          - aspeed,ast2400-scu
-          - aspeed,ast2500-scu
-          - aspeed,ast2600-scu
-      - const: syscon
-      - const: simple-mfd
+scu@ast2xx00-scu:
+  properties:
+    compatible:
+      items:
+        - enum:
+            - aspeed,ast2400-scu
+            - aspeed,ast2500-scu
+            - aspeed,ast2600-scu
+        - const: syscon
+        - const: simple-mfd
 
-  reg:
-    maxItems: 1
+    reg:
+      maxItems: 1
 
-  ranges: true
+    ranges: true
 
-  '#address-cells':
-    const: 1
+    '#address-cells':
+      const: 1
 
-  '#size-cells':
-    const: 1
+    '#size-cells':
+      const: 1
 
-  '#clock-cells':
-    const: 1
+    '#clock-cells':
+      const: 1
 
-  '#reset-cells':
-    const: 1
+    '#reset-cells':
+      const: 1
+
+scu@ast2xx00-scux:
+  properties:
+    compatible:
+      items:
+        - enum:
+            - aspeed,ast2700-scu0
+            - aspeed,ast2700-scu1
+        - const: syscon
+        - const: simple-mfd
+
+    reg:
+      maxItems: 1
+
+    ranges: true
+
+    '#address-cells':
+      const: 2
+
+    '#size-cells':
+      const: 2
+
+    '#clock-cells':
+      const: 1
+
+    '#reset-cells':
+      const: 1
 
 patternProperties:
   '^p2a-control@[0-9a-f]+$':
@@ -76,6 +105,7 @@ patternProperties:
               - aspeed,ast2400-silicon-id
               - aspeed,ast2500-silicon-id
               - aspeed,ast2600-silicon-id
+              - aspeed,ast2700-silicon-id
           - const: aspeed,silicon-id
 
       reg:
-- 
2.34.1

