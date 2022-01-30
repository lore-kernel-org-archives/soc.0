Return-Path: <SRS0=FQl8=SO=nbd.name=nbd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6B2C433EF
	for <soc@archiver.kernel.org>; Sun, 30 Jan 2022 15:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49E31C340EF; Sun, 30 Jan 2022 15:24:24 +0000 (UTC)
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84B03C340E4;
	Sun, 30 Jan 2022 15:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84B03C340E4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=nbd.name
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9LNCxByVJfB01XgfTzWT/WHLAUj6DbOsTr33pwsf6iQ=; b=SF/9GSjb4y8NCa89dD1GXg/5/A
	N4m8fFIXfbRCnmiztwfcVCHvPlK0/Z/izxXOzG6lW/x6wLTpW417yuTkQQLP+HoqX/xhs7E6vMU/G
	nAxsMZxQKu7HuoXAEiZbkgit+AOJ6yLNtZE9li/EY9JYFEK130P52avws9BwIiABYr14=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1nEBYC-0002if-JZ; Sun, 30 Jan 2022 15:51:32 +0100
From: Felix Fietkau <nbd@nbd.name>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	John Crispin <john@phrozen.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 11/13] dt-bindings: arm: airoha: Add binding for Airoha GPIO controller
Date: Sun, 30 Jan 2022 15:51:14 +0100
Message-Id: <20220130145116.88406-12-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: John Crispin <john@phrozen.org>

Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
GPIOs

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../bindings/gpio/airoha,en7523-gpio.yaml     | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml b/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
new file mode 100644
index 000000000000..66c00ec85731
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/airoha,en7523-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7523 GPIO controller
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+description: |
+  Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
+  GPIOs.
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - const: airoha,en7523-gpio
+
+  reg:
+    description: |
+      The first tuple points to the input register.
+      The second and third tuple point to the direction registers
+      The fourth tuple points to the output register
+    maxItems: 4
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio0: gpio@1fbf0200 {
+        compatible = "airoha,en7523-gpio";
+        reg = <0x1fbf0204 0x4>,
+              <0x1fbf0200 0x4>,
+              <0x1fbf0220 0x4>,
+              <0x1fbf0214 0x4>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+    gpio1: gpio@1fbf0270 {
+        compatible = "airoha,en7523-gpio";
+        reg = <0x1fbf0270 0x4>,
+              <0x1fbf0260 0x4>,
+              <0x1fbf0264 0x4>,
+              <0x1fbf0278 0x4>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+
+...
-- 
2.32.0 (Apple Git-132)

