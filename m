Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E66EE4993
	for <soc@archiver.kernel.org>; Wed, 23 Aug 2023 16:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B53B0C433CB; Wed, 23 Aug 2023 16:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8FBC433C9;
	Wed, 23 Aug 2023 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807018;
	bh=IXbIi8TvFJEjkdvzTqODOQaFSwZog/KmUIOezb+KRdo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NPgo5qhA1raVy8FkCOsDZhZBwaWm2UQMxAtclJKhm9/DKJ/WBeJolvrgaDrkGANQ/
	 0/QoGPvSR3ZfhSdtidFuUW3YOd62E8/rGh5wGTFJw1movnjicGb2hFDsfjP213+Xhn
	 rPyQErundwgEICcXkRkLfi9JKj+ofT6RFvD+L4LzDkCnfKxHgRy1CIStZ9WsSAzC6s
	 KzkUeuepaCkUJy132+iHeKd5vsO3X604G6jyAMxxjq2uNObPoIYCnehdjgcuNuF0v7
	 nPPzoRlLdDz0HqmzkF2OqQ+OB+3J3lU3kfkpIdLc4eoso9ZtLkZ+uOjvvT7bzc8iRW
	 MX8rvZ/DwmIRQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 1/4] dt-bindings: arm: add cznic,turris-omnia-mcu binding
Date: Wed, 23 Aug 2023 18:10:09 +0200
Message-ID: <20230823161012.6986-2-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823161012.6986-1-kabel@kernel.org>
References: <20230823161012.6986-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add binding for cznic,turris-omnia-mcu, the device-tree node
representing the system-controller features provided by the MCU on the
Turris Omnia router.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../bindings/arm/cznic,turris-omnia-mcu.yaml  | 72 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml

diff --git a/Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml b/Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
new file mode 100644
index 000000000000..055485847e71
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/cznic,turris-omnia-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CZ.NIC's Turris Omnia MCU
+
+maintainers:
+  - Marek Behún <kabel@kernel.org>
+
+description:
+  The MCU on Turris Omnia acts as a system controller providing additional
+  GPIOs, interrupts, watchdog, system power off and wakeup configuration.
+
+properties:
+  compatible:
+    const: cznic,turris-omnia-mcu
+
+  reg:
+    description: MCU I2C slave address
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ic: interrupt-controller {
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        system-controller@2a {
+            compatible = "cznic,turris-omnia-mcu";
+            reg = <0x2a>;
+
+            interrupt-parent = <&ic>;
+            interrupts = <11 IRQ_TYPE_NONE>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d590ce31aa72..00db4f1d165f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2077,6 +2077,7 @@ W:	https://www.turris.cz/
 F:	Documentation/ABI/testing/debugfs-moxtet
 F:	Documentation/ABI/testing/sysfs-bus-moxtet-devices
 F:	Documentation/ABI/testing/sysfs-firmware-turris-mox-rwtm
+F:	Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
 F:	Documentation/devicetree/bindings/bus/moxtet.txt
 F:	Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt
 F:	Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
-- 
2.41.0

