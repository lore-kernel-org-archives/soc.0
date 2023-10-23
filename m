Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B25C004C0
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 14:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8965DC433C9; Mon, 23 Oct 2023 14:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C9CC433D9;
	Mon, 23 Oct 2023 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698071499;
	bh=Fg86UnFzeuRYFlNfDsA8CHP0gSTz7SIzUtkgZOICR6o=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XEVTihPiomB5YfYS3YzJRDdwV8OJNKRIH8D9WWAtA6Z2C68LDSMV4XBCxiq6Q/ds6
	 b1BHSg2NclNMqffX928Hrdgrav9CserWYtd2enSegjlVzO9x5zshkdj8EnU1fxWOu1
	 dLoq0aVW1sWn10OdOOHJ05RqvjcTU0i7HRLf0g/RZYS+pgTRASOFzGJ23ClvoSkVR2
	 mlPgHCIOFIr42FwNR3uAXdGQpl35n3/Fw0So93UTjhw+FdQL30R8lrpGFPcRGKbXqI
	 UX25qT/O2suCZTMGVdGgKNfdb+QPc9k4vBzy7aMUK58ao32EsxOYINfsmUS0wmj3cg
	 oUnHCMELN4xsw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/7] dt-bindings: arm: add cznic,turris-omnia-mcu binding
Date: Mon, 23 Oct 2023 16:31:24 +0200
Message-ID: <20231023143130.11602-2-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023143130.11602-1-kabel@kernel.org>
References: <20231023143130.11602-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add binding for cznic,turris-omnia-mcu, the device-tree node
representing the system-controller features provided by the MCU on the
Turris Omnia router.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

