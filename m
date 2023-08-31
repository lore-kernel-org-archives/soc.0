Return-Path: <SRS0=fF9g=EQ=loongson.cn=zhoubinbin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A315FC83F39
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 11:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22FAEC4339A; Thu, 31 Aug 2023 11:43:26 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id 8E74AC433C9;
	Thu, 31 Aug 2023 11:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E74AC433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8BxHOvYfPBkJm8dAA--.55523S3;
	Thu, 31 Aug 2023 19:43:20 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxniPTfPBkVxJoAA--.14619S4;
	Thu, 31 Aug 2023 19:43:19 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 2/5] dt-bindings: soc: loongson,ls2k-pmc: Use fallbacks for ls2k-pmc compatible
Date: Thu, 31 Aug 2023 19:43:12 +0800
Message-Id: <9e22a208934dde6e111a8436aa4b158669d027b5.1693474728.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1693474728.git.zhoubinbin@loongson.cn>
References: <cover.1693474728.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxniPTfPBkVxJoAA--.14619S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4kWFy5GFy5GryUAr1UArc_yoW8XrWUpF
	sxCa4xGr10vF13Z3s3JFy8Ar4Fvr93C3ZrWFsrJF17Gr4DXa1jvr1fKF1UZF45urW8XFWU
	ur92krW5WasrCrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

The Loongson-2K series chips (ls2k0500/ls2k1000/ls2k2000) share the same
PM system controller, using ls2k0500 compatible as fallback for the
others.

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

