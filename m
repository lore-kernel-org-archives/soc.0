Return-Path: <SRS0=Lge8=U4=nuvoton.com=YCHuang3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBDBC43219
	for <soc@archiver.kernel.org>; Mon, 18 Apr 2022 08:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7561AC385A7; Mon, 18 Apr 2022 08:28:00 +0000 (UTC)
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
	by smtp.kernel.org (Postfix) with ESMTP id 44506C385A8;
	Mon, 18 Apr 2022 08:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44506C385A8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
	by maillog.nuvoton.com (Postfix) with ESMTP id 3A8DB1C81292;
	Mon, 18 Apr 2022 16:27:51 +0800 (CST)
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 18
 Apr 2022 16:27:50 +0800
Received: from localhost.localdomain (172.19.1.47) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 18 Apr 2022 16:27:50 +0800
From: Jacky Huang <ychuang3@nuvoton.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
CC: <robh+dt@kernel.org>, <sboyd@kernel.org>, <krzk+dt@kernel.org>,
	<arnd@arndb.de>, <olof@lixom.net>, <will@kernel.org>, <soc@kernel.org>,
	<cfli0@nuvoton.com>, Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH v3 5/5] dt-bindings: arm: Add initial bindings for Nuvoton Platform
Date: Mon, 18 Apr 2022 16:27:38 +0800
Message-ID: <20220418082738.11301-6-ychuang3@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220418082738.11301-1-ychuang3@nuvoton.com>
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain

Add binding for ARMv8 based Nuvotn SoCs and platform boards.
Add initial bindings for MA35D1 series development boards.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 .../devicetree/bindings/arm/nuvoton.yaml      | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/nuvoton.yaml

diff --git a/Documentation/devicetree/bindings/arm/nuvoton.yaml b/Documentation/devicetree/bindings/arm/nuvoton.yaml
new file mode 100644
index 000000000000..2b8444c2f7ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/nuvoton.yaml
@@ -0,0 +1,27 @@
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
+description: |+
+  Bindings for Nuvoton ARMv8 based platform boards.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - enum:
+          - nuvoton,ma35d1
+          - nuvoton,ma35d1-evb
+          - nuvoton,ma35d1-iot
+          - nuvoton,ma35d1-som512
+          - nuvoton,ma35d1-som1g
+
+additionalProperties: true
-- 
2.17.1

