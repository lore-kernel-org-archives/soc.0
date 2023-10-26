Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A51C25B67
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 16:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96223C433C9; Thu, 26 Oct 2023 16:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAC7C433D9;
	Thu, 26 Oct 2023 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698337101;
	bh=HKm75Jt4k50b8pAXVQpBsrBTXG4MCNOPWjeqg02FmWw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QkSd/2IWiOZq3PQWxB6WM7x0QV9WF7fp5gmxn7KcosxYYTNKx5GMUyX1VGZYBy19U
	 1riafayc5APoVisbLGOqx9rbCiX/vYVGFGxW0tExTJnqM5eg+IEjDtvzH/om/CN4hu
	 ZRfHVSTFARGYY4xSAX3q/fhYgiPJT6bjb4d0Smy6ZlD70nREjEoDO+1nnRdEAujJsp
	 dSqsqSNpv17JSbKfjGKcyY58UsxTLRYEAq9y1xDa8d9Rq8hyV4JJ8lwH8S+AB79RZX
	 fl/eCRNRsw+nOQVAIYha/VWykVTiCerMOJWEqDVUfAi5sZEnbPxRyCl+67QZeQDTQ8
	 pOA3AK2bESfng==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v4 1/7] dt-bindings: arm: add cznic,turris-omnia-mcu binding
Date: Thu, 26 Oct 2023 18:17:57 +0200
Message-ID: <20231026161803.16750-2-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026161803.16750-1-kabel@kernel.org>
References: <20231026161803.16750-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add binding for cznic,turris-omnia-mcu, the device-tree node
representing the system-controller features provided by the MCU on the
Turris Omnia router.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../bindings/arm/cznic,turris-omnia-mcu.yaml  | 67 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml

diff --git a/Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml b/Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
new file mode 100644
index 000000000000..ea1fd0117bb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
@@ -0,0 +1,67 @@
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        system-controller@2a {
+            compatible = "cznic,turris-omnia-mcu";
+            reg = <0x2a>;
+
+            interrupt-parent = <&gpio1>;
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
index 2894f0777537..56cb540bb4ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2102,6 +2102,7 @@ W:	https://www.turris.cz/
 F:	Documentation/ABI/testing/debugfs-moxtet
 F:	Documentation/ABI/testing/sysfs-bus-moxtet-devices
 F:	Documentation/ABI/testing/sysfs-firmware-turris-mox-rwtm
+F:	Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
 F:	Documentation/devicetree/bindings/bus/moxtet.txt
 F:	Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt
 F:	Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
-- 
2.41.0

