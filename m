Return-Path: <SRS0=fh0W=ES=loongson.cn=zhoubinbin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E92CA1004
	for <soc@archiver.kernel.org>; Sat,  2 Sep 2023 08:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ACBB2C433C7; Sat,  2 Sep 2023 08:47:47 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id BF4D8C433C8;
	Sat,  2 Sep 2023 08:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF4D8C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8Axjuus9vJk0P4dAA--.58844S3;
	Sat, 02 Sep 2023 16:47:40 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxrM6n9vJkZY1pAA--.58262S4;
	Sat, 02 Sep 2023 16:47:40 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/5] dt-bindings: soc: loongson,ls2k-pmc: Use fallbacks for ls2k-pmc compatible
Date: Sat,  2 Sep 2023 16:47:28 +0800
Message-Id: <fd2313138ec94775fcd43f4b1244b9ce1258dbd1.1693623752.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1693623752.git.zhoubinbin@loongson.cn>
References: <cover.1693623752.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxrM6n9vJkZY1pAA--.58262S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ury5AryDuFykWry3Jw18JFc_yoW8WrW8pF
	sxCas7Gr10vF13Z395JFy8Ar4Fvr93C3ZrXFsrJF17Gw1DXa1jvw1rKF15ZF45urW8XFW7
	uF92krWrWasrCrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

The Loongson-2K series chips (ls2k0500/ls2k1000/ls2k2000) share the same
PM system controller, using ls2k0500 compatible as fallback for the
others.

Fixes: 6054a676e969 ("soc: dt-bindings: add loongson-2 pm")
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../soc/loongson/loongson,ls2k-pmc.yaml         | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
index da2dcfeebf12..c45f5e7fc0e6 100644
--- a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
+++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
@@ -11,11 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - loongson,ls2k0500-pmc
-          - loongson,ls2k1000-pmc
-      - const: syscon
+    oneOf:
+      - items:
+          - const: loongson,ls2k0500-pmc
+          - const: syscon
+      - items:
+          - enum:
+              - loongson,ls2k1000-pmc
+              - loongson,ls2k2000-pmc
+          - const: loongson,ls2k0500-pmc
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -44,7 +49,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     power-management@1fe27000 {
-        compatible = "loongson,ls2k1000-pmc", "syscon";
+        compatible = "loongson,ls2k1000-pmc", "loongson,ls2k0500-pmc", "syscon";
         reg = <0x1fe27000 0x58>;
         interrupt-parent = <&liointc1>;
         interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-- 
2.39.3

