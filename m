Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455C1C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41E264F44
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D41E264F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c0glWh1hs/ZWJPuEdl5hAwI7NDk4GVi4bMNvDn41ZmE=; b=V637Y1V0qVYTxsJwIPowfuHHe
	zZYA8ctX202bteZF9x4NW1uD6NAkLdxr4XyOc7cQHSogVXcTfrJcqSRpvCNpcKvUbh3xZszX0HPxp
	7QPkxgg32ec0yYNf5pDEJikyTZ0P8KOasFfIo+1mSKMaoRqZR/NzHIw65aEXa9G1n63nwyUOVOUh+
	iBSa4g2ZdA3aNpyIO67esQ7a4TD62XPpHSz0NR05UZh4SmRieoLGOl22M0IMNvXjMZ4Vq0EvfMEMW
	TBDVWfPTfr+9vbX7oBNfHT47Y8WUbvM34JcZqy35TPOEAS2pJvjosAnYrgjXo+DgtdgSh3AeAsm4v
	uRQiGGVcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lRc-0008Lr-Kz; Thu, 04 Feb 2021 20:41:42 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lQu-00081L-6b
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:40:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 48E7442860;
 Thu,  4 Feb 2021 20:40:52 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 14/18] dt-bindings: interrupt-controller: Add DT bindings for
 apple-aic
Date: Fri,  5 Feb 2021 05:39:47 +0900
Message-Id: <20210204203951.52105-15-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154056_532589_2903A5CB 
X-CRM114-Status: GOOD (  15.70  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

AIC is the Apple Interrupt Controller found on Apple ARM SoCs, such as
the M1.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 .../interrupt-controller/AAPL,aic.yaml        | 88 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 .../interrupt-controller/apple-aic.h          | 14 +++
 3 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml
 create mode 100644 include/dt-bindings/interrupt-controller/apple-aic.h

diff --git a/Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml
new file mode 100644
index 000000000000..7e119614275a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/AAPL,aic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Interrupt Controller
+
+maintainers:
+  - Hector Martin <marcan@marcan.st>
+
+description: |
+  The Apple Interrupt Controller is a simple interrupt controller present on
+  Apple ARM SoC platforms, including various iPhone and iPad devices and the
+  "Apple Silicon" M1 Macs.
+
+  It provides the following features:
+
+  - Level-triggered hardware IRQs wired to SoC blocks
+    - Single mask bit per IRQ
+    - Per-IRQ affinity setting
+    - Automatic masking on event delivery (auto-ack)
+    - Software triggering (ORed with hw line)
+  - 2 per-CPU IPIs (meant as "self" and "other", but they are interchangeable
+    if not symmetric)
+  - Automatic prioritization (single event/ack register per CPU, lower IRQs =
+    higher priority)
+  - Automatic masking on ack
+  - Default "this CPU" register view and explicit per-CPU views
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    contains:
+      enum:
+        - AAPL,aic
+        - AAPL,m1-aic
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 3
+    description: |
+      The 1st cell contains the interrupt type:
+        - 0: Hardware IRQ
+        - 1: FIQ
+        - 2: IPI
+
+      The 2nd cell contains the interrupt number.
+        - HW IRQs: interrupt number
+        - FIQs:
+          - 0: physical timer
+          - 1: virtual timer
+        - IPIs:
+          - 0: normal/"other" IPI (used interanlly for virtual IPIs)
+          - 1: self IPI (normally unused)
+
+      The 3rd cell contains the interrupt flags. This is normally
+      IRQ_TYPE_LEVEL_HIGH (4).
+
+  reg:
+    description: |
+      Specifies base physical address and size of the AIC registers.
+    maxItems: 1
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - interrupt-controller
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        aic: interrupt-controller@23b100000 {
+            compatible = "AAPL,m1-aic", "AAPL,aic";
+            #interrupt-cells = <3>;
+            interrupt-controller;
+            reg = <0x2 0x3b100000 0x0 0x8000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 91a7b33834ac..f3d4661731c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1634,6 +1634,8 @@ B:	https://github.com/AsahiLinux/linux/issues
 C:	irc://chat.freenode.net/asahi-dev
 T:	git https://github.com/AsahiLinux/linux.git
 F:	Documentation/devicetree/bindings/arm/AAPL.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml
+F:	include/dt-bindings/interrupt-controller/apple-aic.h
 
 ARM/ARTPEC MACHINE SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
diff --git a/include/dt-bindings/interrupt-controller/apple-aic.h b/include/dt-bindings/interrupt-controller/apple-aic.h
new file mode 100644
index 000000000000..f54dc0cd6e9a
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/apple-aic.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_APPLE_AIC_H
+#define _DT_BINDINGS_INTERRUPT_CONTROLLER_APPLE_AIC_H
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#define AIC_IRQ 0
+#define AIC_FIQ 1
+#define AIC_IPI 2
+
+#define AIC_TMR_PHYS 0
+#define AIC_TMR_VIRT 1
+
+#endif
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
