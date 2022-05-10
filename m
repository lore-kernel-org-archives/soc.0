Return-Path: <SRS0=BSpn=VS=nuvoton.com=YCHuang3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA123C433EF
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 03:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B14CBC385A6; Tue, 10 May 2022 03:26:09 +0000 (UTC)
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
	by smtp.kernel.org (Postfix) with ESMTP id AB4B1C385CC;
	Tue, 10 May 2022 03:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB4B1C385CC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
	by maillog.nuvoton.com (Postfix) with ESMTP id 198D41C80DCB;
	Tue, 10 May 2022 11:26:08 +0800 (CST)
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 10 May
 2022 11:26:07 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Tue, 10 May
 2022 11:26:07 +0800
Received: from localhost.localdomain (172.19.1.47) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 10 May 2022 11:26:07 +0800
From: Jacky Huang <ychuang3@nuvoton.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
CC: <robh+dt@kernel.org>, <sboyd@kernel.org>, <krzk+dt@kernel.org>,
	<arnd@arndb.de>, <olof@lixom.net>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <soc@kernel.org>, <cfli0@nuvoton.com>, Jacky Huang
	<ychuang3@nuvoton.com>
Subject: [PATCH V4 5/5] dt-bindings: arm: Add initial bindings for Nuvoton Platform
Date: Tue, 10 May 2022 11:25:58 +0800
Message-ID: <20220510032558.10304-6-ychuang3@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510032558.10304-1-ychuang3@nuvoton.com>
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain

Add binding for ARMv8 based Nuvotn SoCs and platform boards.
Add initial bindings for MA35D1 series development boards.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 .../devicetree/bindings/arm/nuvoton.yaml      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/nuvoton.yaml

diff --git a/Documentation/devicetree/bindings/arm/nuvoton.yaml b/Documentation/devicetree/bindings/arm/nuvoton.yaml
new file mode 100644
index 000000000000..56fb5bb41d0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/nuvoton.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/nuvoton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton Platforms Device Tree Bindings
+
+maintainers:
+  - Jacky Huang <ychuang3@nuvoton.com>
+
+description: |
+  Boards with an ARMv8 based Nuvoton SoC shall have the following
+  properties.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: MA35D1 based boards
+        items:
+          - enum:
+              - nuvoton,ma35d1-evb
+              - nuvoton,ma35d1-iot
+              - nuvoton,ma35d1-som
+          - const: nuvoton,ma35d1
+
+additionalProperties: true
+...
-- 
2.30.2

