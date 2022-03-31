Return-Path: <SRS0=IGJM=UK=nuvoton.com=YCHuang3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780C4C433EF
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 02:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 613E5C3410F; Thu, 31 Mar 2022 02:43:21 +0000 (UTC)
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
	by smtp.kernel.org (Postfix) with ESMTP id 2B9FEC340F0;
	Thu, 31 Mar 2022 02:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B9FEC340F0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
	by maillog.nuvoton.com (Postfix) with ESMTP id 29AA11C81195;
	Thu, 31 Mar 2022 10:43:19 +0800 (CST)
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 31
 Mar 2022 10:43:19 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 31 Mar
 2022 10:43:18 +0800
Received: from localhost.localdomain (172.19.1.47) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 31 Mar 2022 10:43:14 +0800
From: Jacky Huang <ychuang3@nuvoton.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
CC: <robh+dt@kernel.org>, <sboyd@kernel.org>, <krzk+dt@kernel.org>,
	<arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>, <cfli0@nuvoton.com>,
	Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH 2/3] dt-bindings: clock: Document MA35D1 clock controller bindings
Date: Thu, 31 Mar 2022 10:42:55 +0800
Message-ID: <20220331024256.14762-3-ychuang3@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331024256.14762-1-ychuang3@nuvoton.com>
References: <20220331024256.14762-1-ychuang3@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain

Add documentation to describe Nuvoton MA35D1 clock driver bindings.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 .../bindings/clock/nuvoton,ma35d1-clk.yaml    | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
new file mode 100644
index 000000000000..bf5474b10420
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
@@ -0,0 +1,59 @@
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
+    dt-bindings/clock/ma35d1-clk.h
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
+    maxItems: 1
+
+  assigned-clocks:
+    maxItems: 4
+
+  assigned-clock-rates:
+    maxItems: 4
+
+  clock-pll-mode:
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  # clock control module node:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    clk: clock-controller@40460200 {
+        compatible = "nuvoton,ma35d1-clk";
+        reg = <0x40460200 0x100>;
+        #clock-cells = <1>;
+    };
+...
-- 
2.30.2

