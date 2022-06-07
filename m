Return-Path: <SRS0=Mv/n=WO=cqplus1.com=prvs=115555DFF1=qinjian@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CFBCCA485
	for <soc@archiver.kernel.org>; Tue,  7 Jun 2022 01:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1064C385A9; Tue,  7 Jun 2022 01:58:46 +0000 (UTC)
Received: from mx1.cqplus1.com (mx1.cqplus1.com [113.204.237.245])
	by smtp.kernel.org (Postfix) with ESMTP id DE81DC3411E
	for <soc@kernel.org>; Tue,  7 Jun 2022 01:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE81DC3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cqplus1.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cqplus1.com
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 172.28.114.216
	by mx1.cqplus1.com with MailGates ESMTP Server V5.0(2334:0:AUTH_RELAY)
	(envelope-from <qinjian@cqplus1.com>); Tue, 07 Jun 2022 09:58:34 +0800 (CST)
From: Qin Jian <qinjian@cqplus1.com>
To: sboyd@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	mturquette@baylibre.com,
	linux@armlinux.org.uk,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Qin Jian <qinjian@cqplus1.com>
Subject: [PATCH v17 06/10] dt-bindings: interrupt-controller: Add bindings for SP7021 interrupt controller
Date: Tue,  7 Jun 2022 09:58:06 +0800
Message-Id: <69c9eec136cde52ca4c69743910066f575354c20.1654565776.git.qinjian@cqplus1.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1654565776.git.qinjian@cqplus1.com>
References: <cover.1654565776.git.qinjian@cqplus1.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation to describe Sunplus SP7021 interrupt controller bindings.

Reviewed-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Qin Jian <qinjian@cqplus1.com>
---
 .../sunplus,sp7021-intc.yaml                  | 62 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sunplus,sp7021-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sunplus,sp7021-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/sunplus,sp7021-intc.yaml
new file mode 100644
index 000000000..bd0021dba
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sunplus,sp7021-intc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) Sunplus Co., Ltd. 2021
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/sunplus,sp7021-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sunplus SP7021 SoC Interrupt Controller
+
+maintainers:
+  - Qin Jian <qinjian@cqplus1.com>
+
+properties:
+  compatible:
+    items:
+      - const: sunplus,sp7021-intc
+
+  reg:
+    maxItems: 2
+    description:
+      Specifies base physical address(s) and size of the controller regs.
+      The 1st region include type/polarity/priority/mask regs.
+      The 2nd region include clear/masked_ext0/masked_ext1/group regs.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+    description:
+      The first cell is the IRQ number, the second cell is the trigger
+      type as defined in interrupt.txt in this directory.
+
+  interrupts:
+    maxItems: 2
+    description:
+      EXT_INT0 & EXT_INT1, 2 interrupts references to primary interrupt
+      controller.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    intc: interrupt-controller@9c000780 {
+        compatible = "sunplus,sp7021-intc";
+        reg = <0x9c000780 0x80>, <0x9c000a80 0x80>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>, /* EXT_INT0 */
+                     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>; /* EXT_INT1 */
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b90bb93a3..23774ee07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2812,8 +2812,13 @@ S:	Maintained
 W:	https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
 F:	Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
 F:	Documentation/devicetree/bindings/clock/sunplus,sp7021-clkc.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/sunplus,sp7021-intc.yaml
 F:	Documentation/devicetree/bindings/reset/sunplus,reset.yaml
+F:	arch/arm/boot/dts/sunplus-sp7021*.dts*
+F:	arch/arm/configs/sp7021_*defconfig
+F:	arch/arm/mach-sunplus/
 F:	drivers/clk/clk-sp7021.c
+F:	drivers/irqchip/irq-sp7021-intc.c
 F:	drivers/reset/reset-sunplus.c
 F:	include/dt-bindings/clock/sunplus,sp7021-clkc.h
 F:	include/dt-bindings/reset/sunplus,sp7021-reset.h
-- 
2.33.1

