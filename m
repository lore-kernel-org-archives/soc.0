Return-Path: <SRS0=aE8x=WX=cqplus1.com=prvs=1162F1FB06=qinjian@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06A0C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 06:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 495A4C3411F; Thu, 16 Jun 2022 06:42:50 +0000 (UTC)
Received: from mx1.cqplus1.com (mx1.cqplus1.com [113.204.237.245])
	by smtp.kernel.org (Postfix) with ESMTP id EF93EC36AF2
	for <soc@kernel.org>; Thu, 16 Jun 2022 06:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF93EC36AF2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cqplus1.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cqplus1.com
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 172.28.114.216
	by mx1.cqplus1.com with MailGates ESMTP Server V5.0(23338:0:AUTH_RELAY)
	(envelope-from <qinjian@cqplus1.com>); Thu, 16 Jun 2022 14:42:34 +0800 (CST)
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
	Qin Jian <qinjian@cqplus1.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v19 01/11] dt-bindings: arm: sunplus: Add bindings for Sunplus SP7021 SoC boards
Date: Thu, 16 Jun 2022 14:42:17 +0800
Message-Id: <81b03d86f05b994f46c371f5e81d497e4fd5ddbc.1655360818.git.qinjian@cqplus1.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1655360818.git.qinjian@cqplus1.com>
References: <cover.1655360818.git.qinjian@cqplus1.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This introduces bindings for boards based Sunplus SP7021 SoC.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Qin Jian <qinjian@cqplus1.com>
---
 .../bindings/arm/sunplus,sp7021.yaml          | 29 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml

diff --git a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
new file mode 100644
index 000000000..def7d0cfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) Sunplus Co., Ltd. 2021
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/sunplus,sp7021.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sunplus SP7021 Boards
+
+maintainers:
+  - qinjian <qinjian@cqplus1.com>
+
+description: |
+  ARM platforms using Sunplus SP7021, an ARM Cortex A7 (4-cores) based SoC.
+  Wiki: https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - enum:
+          - sunplus,sp7021-achip
+          - sunplus,sp7021-demo-v3
+      - const: sunplus,sp7021
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 1fc9ead83..92be76d1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2822,6 +2822,13 @@ F:	drivers/clocksource/armv7m_systick.c
 N:	stm32
 N:	stm
 
+ARM/SUNPLUS SP7021 SOC SUPPORT
+M:	Qin Jian <qinjian@cqplus1.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for mon-subscribers)
+S:	Maintained
+W:	https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
+F:	Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
+
 ARM/Synaptics SoC support
 M:	Jisheng Zhang <jszhang@kernel.org>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
-- 
2.33.1

