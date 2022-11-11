Return-Path: <SRS0=Nqz8=3L=loongson.cn=zhuyinbo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCF7C433FE
	for <soc@archiver.kernel.org>; Fri, 11 Nov 2022 05:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B0A9C433D6; Fri, 11 Nov 2022 05:42:16 +0000 (UTC)
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id 7342FC433D7;
	Fri, 11 Nov 2022 05:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7342FC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8Axz7ez4G1jTwUGAA--.14145S3;
	Fri, 11 Nov 2022 13:42:11 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxLeCs4G1jrq4QAA--.45491S3;
	Fri, 11 Nov 2022 13:42:09 +0800 (CST)
From: Yinbo Zhu <zhuyinbo@loongson.cn>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Hector Martin <marcan@marcan.st>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Brian Norris <briannorris@chromium.org>,
	Sven Peter <sven@svenpeter.dev>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Rob Herring <robh@kernel.org>
Subject: [PATCH v7 2/2] dt-bindings: soc: add loongson-2 chipid
Date: Fri, 11 Nov 2022 13:42:01 +0800
Message-Id: <20221111054201.18528-2-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221111054201.18528-1-zhuyinbo@loongson.cn>
References: <20221111054201.18528-1-zhuyinbo@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxLeCs4G1jrq4QAA--.45491S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXF47tF4kJw17CF4UtF4xZwb_yoW5XFyrpa
	17Cr95GF4Iq3W7uFsxKa4Ik3WFvF93Aa9FqFW2yw15KrWqgw1Fqw1fK3WDuanxur17Jay7
	uFyS9rW5WF4UCr7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b38Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUAVWUZwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY
	6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7
	Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	W8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	2iL0UUUUU

Add the Loongson-2 SoC chipid binding with DT schema format using
json-schema.

Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Change in v7:
		1. NO change, but other patch in this series of patches set	
		   has changes.
Change in v6:
		1. NO change, but other patch in this series of patches set	
		   has changes.
Change in v5:
		1. Add all history change log information.
		2. Add reviewed-by information.
Change in v4:
		1. NO change, but other patch in this series of patches set	
		   has changes.
Change in v3:
		1. Drop "driver" and describe instead what is GUTS, including
		   its acronym.
		2. Add desciption about the SoC register.
		3. Fixup dts node name.
		4. Replace string loongson2/Loongson2 with loongson-2/Loongson-2
                   in binding file and commit message.
Change in v2:
		1. NO change, but other patch in this series of patches set	
		   has changes.

 .../bindings/hwinfo/loongson,ls2k-chipid.yaml | 38 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwinfo/loongson,ls2k-chipid.yaml

diff --git a/Documentation/devicetree/bindings/hwinfo/loongson,ls2k-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/loongson,ls2k-chipid.yaml
new file mode 100644
index 000000000000..9d0c36ec1982
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwinfo/loongson,ls2k-chipid.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwinfo/loongson,ls2k-chipid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-2 SoC ChipID
+
+maintainers:
+  - Yinbo Zhu <zhuyinbo@loongson.cn>
+
+description: |
+  Loongson-2 SoC contains many groups of global utilities register
+  blocks, of which the ChipID group registers record SoC version,
+  feature, vendor and id information.
+
+properties:
+  compatible:
+    const: loongson,ls2k-chipid
+
+  reg:
+    maxItems: 1
+
+  little-endian: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    chipid: chipid@1fe00000 {
+        compatible = "loongson,ls2k-chipid";
+        reg = <0x1fe00000 0x3ffc>;
+        little-endian;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 99aa2cb9c80a..0f32f2a614ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12048,6 +12048,7 @@ LOONGSON-2 SOC SERIES GUTS DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
 L:	loongarch@lists.linux.dev
 S:	Maintained
+F:	Documentation/devicetree/bindings/hwinfo/loongson,ls2k-chipid.yaml
 F:	drivers/soc/loongson/loongson2_guts.c
 
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
-- 
2.20.1

