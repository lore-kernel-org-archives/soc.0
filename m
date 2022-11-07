Return-Path: <SRS0=lTMw=3H=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8516EC43219
	for <soc@archiver.kernel.org>; Mon,  7 Nov 2022 10:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48D0AC433D7; Mon,  7 Nov 2022 10:34:20 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 4B184C4314F;
	Mon,  7 Nov 2022 10:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B184C4314F
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 07 Nov 2022 19:34:15 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 347E920584CE;
	Mon,  7 Nov 2022 19:34:15 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 7 Nov 2022 19:34:15 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id A22CBB62B3;
	Mon,  7 Nov 2022 19:34:14 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 1/5] dt-bindings: arm: uniphier: Add system controller bindings
Date: Mon,  7 Nov 2022 19:34:06 +0900
Message-Id: <20221107103410.3443-2-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107103410.3443-1-hayashi.kunihiko@socionext.com>
References: <20221107103410.3443-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding schema for system controller implemented in UniPhier SoCs.
This describes that the nodes defined here are treated as "syscon".

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 .../socionext/socionext,uniphier-sysctrl.yaml | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-sysctrl.yaml

diff --git a/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-sysctrl.yaml b/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-sysctrl.yaml
new file mode 100644
index 000000000000..be7cf72c232e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-sysctrl.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/socionext/socionext,uniphier-sysctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Socionext UniPhier system controller
+
+maintainers:
+  - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
+
+description: |+
+  This describes the devicetree bindings for system controller
+  implemented on Socionext UniPhier SoCs.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              # sysctrl
+              - socionext,uniphier-ld4-sysctrl
+              - socionext,uniphier-pro4-sysctrl
+              - socionext,uniphier-pro5-sysctrl
+              - socionext,uniphier-pxs2-sysctrl
+              - socionext,uniphier-ld6b-sysctrl
+              - socionext,uniphier-sld8-sysctrl
+              - socionext,uniphier-ld11-sysctrl
+              - socionext,uniphier-ld20-sysctrl
+              - socionext,uniphier-pxs3-sysctrl
+              - socionext,uniphier-nx1-sysctrl
+              - socionext,uniphier-sysctrl
+              # soc-glue
+              - socionext,uniphier-ld4-soc-glue
+              - socionext,uniphier-pro4-soc-glue
+              - socionext,uniphier-pro5-soc-glue
+              - socionext,uniphier-pxs2-soc-glue
+              - socionext,uniphier-ld6b-soc-glue
+              - socionext,uniphier-sld8-soc-glue
+              - socionext,uniphier-ld11-soc-glue
+              - socionext,uniphier-ld20-soc-glue
+              - socionext,uniphier-pxs3-soc-glue
+              - socionext,uniphier-nx1-soc-glue
+              - socionext,uniphier-soc-glue
+              # perictrl
+              - socionext,uniphier-ld4-perictrl
+              - socionext,uniphier-pro4-perictrl
+              - socionext,uniphier-pro5-perictrl
+              - socionext,uniphier-pxs2-perictrl
+              - socionext,uniphier-ld6b-perictrl
+              - socionext,uniphier-sld8-perictrl
+              - socionext,uniphier-ld11-perictrl
+              - socionext,uniphier-ld20-perictrl
+              - socionext,uniphier-pxs3-perictrl
+              - socionext,uniphier-nx1-perictrl
+              - socionext,uniphier-perictrl
+              # sdctrl
+              - socionext,uniphier-ld4-sdctrl
+              - socionext,uniphier-pro4-sdctrl
+              - socionext,uniphier-pro5-sdctrl
+              - socionext,uniphier-pxs2-sdctrl
+              - socionext,uniphier-ld6b-sdctrl
+              - socionext,uniphier-sld8-sdctrl
+              - socionext,uniphier-ld11-sdctrl
+              - socionext,uniphier-ld20-sdctrl
+              - socionext,uniphier-pxs3-sdctrl
+              - socionext,uniphier-nx1-sdctrl
+              - socionext,uniphier-sdctrl
+              # mioctrl
+              - socionext,uniphier-ld4-mioctrl
+              - socionext,uniphier-pro4-mioctrl
+              - socionext,uniphier-sld8-mioctrl
+              - socionext,uniphier-ld11-mioctrl
+              - socionext,uniphier-mioctrl
+              # adamv
+              - socionext,uniphier-ld11-adamv
+              - socionext,uniphier-ld20-adamv
+              - socionext,uniphier-adamv
+          - const: simple-mfd
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties:
+  type: object
+
+...
-- 
2.25.1

