Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E99C761A6
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 08:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EAE4EC433EF; Tue,  4 Apr 2023 08:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1045C433A1;
	Tue,  4 Apr 2023 08:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680596657;
	bh=Wu9Q5YNgmAzpnEFBnOoyRUEdHAWjUx5xpzv1twk34q8=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=AM3ydbcoEuF6wt0hUYzZ8HqTTkMrRla/MaZzFAP1WR1tOmbrUd7cd6xUrj8bsh8SV
	 zLwegJU9XVHxfjfd96C7OcMHffCfPvWQZLLCUPmoRgaxS0rXZeWIZudweg2EUKCw3y
	 MaaAnSdzM2ECpcwdJtbPgNyaSPEHFimuQxKDn5OhA7WbZ8EQkvDe4zwgwWAACCS44/
	 zhliv1LqCbx4cAXdhmNwS0Wy6LWMaNLIffcULq5/BIoK+jfQWPsFcIw34FDrJIWR1B
	 psbm/muVnWCauyEq/jNYPfL6DOzP5dCLd0sdGuDPxonWy0y7cvRChIO1QGpIAt7/Dv
	 EHOua9Tuk5CXw==
From: Arnd Bergmann <arnd@kernel.org>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	"Aaro Koskinen" <aaro.koskinen@iki.fi>,
	"Bartosz Golaszewski" <brgl@bgdev.pl>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Felipe Balbi" <balbi@kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Johannes Berg" <johannes@sipsolutions.net>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Linus Walleij" <linus.walleij@linaro.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Rob Herring" <robh+dt@kernel.org>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: net: add st,stlc45xx
Date: Tue,  4 Apr 2023 10:23:59 +0200
Message-Id: <20230404082401.1087835-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404082401.1087835-1-arnd@kernel.org>
References: <20230404082401.1087835-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gmail.com/
Acked-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../bindings/net/wireless/st,stlc45xx.yaml    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml b/Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml
new file mode 100644
index 000000000000..99f13d8d3816
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/st,stlc45xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST/Intersil/Conexant stlc45xx/p54spi/cx3110x SPI wireless device
+
+maintainers:
+  - Christian Lamparter <chunkeey@gmail.com>
+
+description:
+  The SPI variant of the Intersil Prism54 wireless device was sold
+  under a variety of names, including Conexant CX3110x and
+  ST Microelectronics STLC5460.
+
+allOf:
+  - $ref: ieee80211.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cnxt,3110x
+      - isil,p54spi
+      - st,stlc4550
+      - st,stlc4560
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  powerdown-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi@0 {
+	    compatible = "st,stlc4560";
+	    reg = <0>;
+	    spi-max-frequency = <48000000>;
+	    interrupts-extended = <&gpio 23>;
+	    powerdown-gpios = <&gpio 1>;
+	};
+    };
-- 
2.39.2

