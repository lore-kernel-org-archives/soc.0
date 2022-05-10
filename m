Return-Path: <SRS0=BSpn=VS=nuvoton.com=YCHuang3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D5DC3527B
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 02:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7CADC385C2; Tue, 10 May 2022 02:52:52 +0000 (UTC)
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
	by smtp.kernel.org (Postfix) with ESMTP id 502F8C385D5;
	Tue, 10 May 2022 02:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 502F8C385D5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
	by maillog.nuvoton.com (Postfix) with ESMTP id 22A391C810FF;
	Tue, 10 May 2022 10:52:43 +0800 (CST)
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 10 May
 2022 10:52:43 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Tue, 10 May
 2022 10:52:42 +0800
Received: from localhost.localdomain (172.19.1.47) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 10 May 2022 10:52:42 +0800
From: Jacky Huang <ychuang3@nuvoton.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
CC: <robh+dt@kernel.org>, <sboyd@kernel.org>, <krzk+dt@kernel.org>,
	<arnd@arndb.de>, <olof@lixom.net>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <soc@kernel.org>, <cfli0@nuvoton.com>, Jacky Huang
	<ychuang3@nuvoton.com>
Subject: [PATCH 2/5] dt-bindings: clock: Document MA35D1 clock controller bindings
Date: Tue, 10 May 2022 10:52:11 +0800
Message-ID: <20220510025214.5586-3-ychuang3@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510025214.5586-1-ychuang3@nuvoton.com>
References: <20220510025214.5586-1-ychuang3@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain

Add documentation to describe Nuvoton MA35D1 clock driver bindings.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/nuvoton,ma35d1-clk.yaml    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
new file mode 100644
index 000000000000..97af7947b6f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nuvoton,ma35d1-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Clock Control Module Binding
+
+maintainers:
+  - Chi-Fang Li <cfli0@nuvoton.com>
+  - Jacky Huang <ychuang3@nuvoton.com>
+
+description: |
+  The MA35D1 clock controller generates clocks for the whole chip,
+  including system clocks and all peripheral clocks.
+
+  See also:
+    include/dt-bindings/clock/ma35d1-clk.h
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-clk
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    items:
+      - description: External 24MHz crystal
+
+  clock-names:
+    items:
+      - const: hxt_24m
+
+  assigned-clocks:
+    maxItems: 5
+
+  assigned-clock-rates:
+    maxItems: 5
+
+  nuvoton,clk-pll-mode:
+    description:
+      A list of PLL operation mode corresponding to CAPLL, DDRPLL, APLL,
+      EPLL, and VPLL in sequential. The operation mode value 0 is for
+      integer mode, 1 is for fractional mode, and 2 is for spread
+      spectrum mode.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 5
+    items:
+      minimum: 0
+      maximum: 2
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    clk: clock-controller@40460200 {
+        compatible = "nuvoton,ma35d1-clk";
+        reg = <0x0 0x40460200 0x0 0x100>;
+        #clock-cells = <1>;
+        clocks = <&hxt_24m>;
+        clock-names = "HXT_24MHz";
+    };
+...
-- 
2.30.2

