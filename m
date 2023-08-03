Return-Path: <SRS0=iWum=DU=loongson.cn=zhuyinbo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD03C04A6A
	for <soc@archiver.kernel.org>; Thu,  3 Aug 2023 06:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D39F9C433CC; Thu,  3 Aug 2023 06:37:26 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id 7D725C433C9;
	Thu,  3 Aug 2023 06:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D725C433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.201])
	by gateway (Coremail) with SMTP id _____8AxjushS8tkEoYPAA--.33770S3;
	Thu, 03 Aug 2023 14:37:21 +0800 (CST)
Received: from localhost.localdomain (unknown [10.20.42.201])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxF80aS8tkMsZGAA--.49295S3;
	Thu, 03 Aug 2023 14:37:20 +0800 (CST)
From: Yinbo Zhu <zhuyinbo@loongson.cn>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>,
	wanghongliang@loongson.cn,
	Liu Peibao <liupeibao@loongson.cn>,
	loongson-kernel@lists.loongnix.cn,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	loongarch@lists.linux.dev,
	Liu Yun <liuyun@loongson.cn>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/2] soc: dt-bindings: add loongson-2 pm
Date: Thu,  3 Aug 2023 14:37:02 +0800
Message-Id: <20230803063703.5659-2-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230803063703.5659-1-zhuyinbo@loongson.cn>
References: <20230803063703.5659-1-zhuyinbo@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxF80aS8tkMsZGAA--.49295S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Add the Loongson-2 SoC Power Management Controller binding with DT
schema format using json-schema.

Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../soc/loongson/loongson,ls2k-pmc.yaml       | 52 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml

diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
new file mode 100644
index 000000000000..da2dcfeebf12
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/loongson/loongson,ls2k-pmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-2 Power Manager controller
+
+maintainers:
+  - Yinbo Zhu <zhuyinbo@loongson.cn>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - loongson,ls2k0500-pmc
+          - loongson,ls2k1000-pmc
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  loongson,suspend-address:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      The "loongson,suspend-address" is a deep sleep state (Suspend To
+      RAM) firmware entry address which was jumped from kernel and it's
+      value was dependent on specific platform firmware code. In
+      addition, the PM need according to it to indicate that current
+      SoC whether support Suspend To RAM.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    power-management@1fe27000 {
+        compatible = "loongson,ls2k1000-pmc", "syscon";
+        reg = <0x1fe27000 0x58>;
+        interrupt-parent = <&liointc1>;
+        interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+        loongson,suspend-address = <0x0 0x1c000500>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1089ef3319f2..608a00473498 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12365,6 +12365,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwinfo/loongson,ls2k-chipid.yaml
 F:	drivers/soc/loongson/loongson2_guts.c
 
+LOONGSON-2 SOC SERIES PM DRIVER
+M:	Yinbo Zhu <zhuyinbo@loongson.cn>
+L:	linux-pm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
+
 LOONGSON-2 SOC SERIES PINCTRL DRIVER
 M:	zhanghongchen <zhanghongchen@loongson.cn>
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
-- 
2.20.1

