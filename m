Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C649309A61
	for <soc@lists.linux.dev>; Fri,  4 Jul 2025 08:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616984; cv=none; b=F/cvgYIOfPEBKcyKynuNv9sKs1U77h75fRE3oMjhaXmBkxhm2g2pXDqceWWaBItsAf8nJg1N6MWEQXs2sQiST4SAgp2nus0bf3LzRn3XIqm9Do7wnwr8iemuGfUmlE/0kzfZP6FVAX3pjC9396dlS+uW8W6CQL8zctgFFidUfCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616984; c=relaxed/simple;
	bh=aKdC/fRJ+J6WHGQoAiIwXJ0mtHGxMv8NI/q7yo9xl6c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ga9puQf06X9819XvzhpIaJMakhs4v6sFx33hx72GI1FigNC4yqxW3dciENNFgu0jbEGmjInt0pSNPTKGfLA36lUlp+EkG4x3eeBllEhYsWixzJs6t5VXFI+w6qMxJCVVvLqa5KhgAex7tF9ICQWUGR5VvSUd+CQvmf6GoJXrjA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5648F0GA092007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Jul 2025 16:15:00 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Fri, 4 Jul 2025
 16:15:00 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <arnd@arndb.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>,
        <tim609@andestech.com>, Ben Zong-You Xie <ben717@andestech.com>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH 4/8] dt-bindings: interrupt-controller: add Andes machine-level software interrupt controller
Date: Fri, 4 Jul 2025 16:14:47 +0800
Message-ID: <20250704081451.2011407-5-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704081451.2011407-1-ben717@andestech.com>
References: <20250704081451.2011407-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 5648F0GA092007

Add the DT binding documentation for Andes machine-level software
interrupt controller.

In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
second time with all interrupt sources tied to zero as the software
interrupt controller (PLICSW). PLICSW can generate machine-level software
interrupts through programming its registers.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 .../andestech,plicsw.yaml                     | 54 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
new file mode 100644
index 000000000000..eb2eb611ac09
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/andestech,plicsw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes machine-level software interrupt controller
+
+description:
+  In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
+  second time with all interrupt sources tied to zero as the software interrupt
+  controller (PLIC_SW). PLIC_SW directly connects to the machine-mode
+  inter-processor interrupt lines of CPUs, so RISC-V per-CPU local interrupt
+  controller is the parent interrupt controller for PLIC_SW. PLIC_SW can
+  generate machine-mode inter-processor interrupts through programming its
+  registers.
+
+maintainers:
+  - Ben Zong-You Xie <ben717@andestech.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - andestech,qilai-plicsw
+      - const: andestech,plicsw
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 15872
+    description:
+      Specifies which harts are connected to the PLIC_SW. Each item must points
+      to a riscv,cpu-intc node, which has a riscv cpu node as parent.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+
+examples:
+  - |
+    interrupt-controller@400000 {
+      compatible = "andestech,qilai-plicsw", "andestech,plicsw";
+      reg = <0x400000 0x400000>;
+      interrupts-extended = <&cpu0intc 3>,
+                            <&cpu1intc 3>,
+                            <&cpu2intc 3>,
+                            <&cpu3intc 3>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f4b4261d3c44..df309a360615 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21288,6 +21288,7 @@ F:	include/linux/irqchip/riscv-imsic.h
 RISC-V ANDES SoC Support
 M:	Ben Zong-You Xie <ben717@andestech.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
 F:	Documentation/devicetree/bindings/riscv/andes.yaml
 
 RISC-V ARCHITECTURE
-- 
2.34.1

