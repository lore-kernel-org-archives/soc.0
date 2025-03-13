Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD881267F45
	for <soc@lists.linux.dev>; Thu, 13 Mar 2025 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741877030; cv=none; b=H7reDaH4sBtxWyAFUYyVYlondw5YGpgGw0bL2i98qjBdpKZKO9vTNPJ8pP10GxQOg97AWxoNFzBvZfH0lPcsQj4FEdHS8ski+RfWnHpAZjO5nsgtsrjCIgw6tTGtic2RrQkBd/Su8G0VHmdY0H83z8pP62KZkh0KZqccfYshMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741877030; c=relaxed/simple;
	bh=T0coL3ZH523qYq6yfSUUv5gVtAh7nimv88zOywguTV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eT/9v/n+kZMRgL+ZbinAEUUjcdl3NaWImJfERAXp5CcLhZXcdpGeVgg1oabtLOSWn0qqM/zhP7DT81qqbd/g11rCwbtHBTuc1emqraAEPvGjD8npyEUcrr+WYlxj2iicR9+QCtDX9xdoL7bUFCr1Mvh9QCP5S+7wYcLBHs12AOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=oNpNzR/N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="oNpNzR/N"
Received: by smtp.kernel.org (Postfix)
	id 5EF98C4AF0D; Thu, 13 Mar 2025 14:43:50 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 666A9C4CEE5;
	Thu, 13 Mar 2025 14:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 666A9C4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0B2661FDF4;
	Thu, 13 Mar 2025 15:43:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1741877016;
	bh=o2tHwAWQtKwr8g9xT8Y3eVDCA531Nfmh88jkGfw7L+Y=; h=From:To:Subject;
	b=oNpNzR/NP4Wnk8OaVf6aLoj+Js3rliqLCXsezM06RD9N44Gj4PMHNu2gY8zfZVhsX
	 31/nHy675Rf8E9e/KOzS5Qopvup8oAKd+2IO8CAX8KqCfaPvkeXkCS4iX6mgiOageC
	 ICOJmCkIqpSGv/NCB48bHVMePbhoediyMXN5+ux1gAAAGN2O5XB952HJiq5/7QhQaz
	 +5QiwzDVgMBRaMlWUCj/9AlBhjNyP1a2GGbvDVGlRZQkAA4MnSheHtZkWcfMf7bns5
	 rdEj6N+jwDab05TLQ0z0hfP831p6Vm8z4b+XJv3k4Gamxe1If5cHAKdxHh6B6LG5UX
	 FieUBm7/yPHIA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [RFC PATCH v1 1/2] dt-bindings: firmware: add toradex,embedded-controller
Date: Thu, 13 Mar 2025 15:43:30 +0100
Message-Id: <20250313144331.70591-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313144331.70591-1-francesco@dolcini.it>
References: <20250313144331.70591-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

The Toradex Embedded Controller serves as a system controller, providing
system power-off and restart functionalities
The two variants, Smarc iMX95 and Smarc iMX8P, have a compatible I2C interface.
Besides this, different compatible values are defined to allow for
future implementation differences.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../firmware/toradex,embedded-controller.yaml | 44 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml

diff --git a/Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml b/Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml
new file mode 100644
index 000000000000..626e5e653c0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/toradex,embedded-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toradex Embedded Controller
+
+maintainers:
+  - Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
+  - Francesco Dolcini <francesco.dolcini@toradex.com>
+
+description:
+  The Toradex Embedded Controller acts as a system controller which provides
+  system power off and restart.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - toradex,smarc-imx95-ec
+          - toradex,smarc-imx8mp-ec
+      - const: toradex,embedded-controller
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@28 {
+            compatible = "toradex,smarc-imx95-ec", "toradex,embedded-controller";
+            reg = <0x28>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ed7aa6867674..19d7c17c0115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23972,6 +23972,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/topstar-laptop.c
 
+TORADEX EMBEDDED CONTROLLER DRIVER
+M:	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
+M:	Francesco Dolcini <francesco@dolcini.it>
+S:	Maintained
+F:	Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml
+
 TORTURE-TEST MODULES
 M:	Davidlohr Bueso <dave@stgolabs.net>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
-- 
2.39.5

