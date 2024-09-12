Return-Path: <devnull+arturs.artamonovs.analog.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD82FEEE268
	for <soc@archiver.kernel.org>; Thu, 12 Sep 2024 18:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9D65C4FE8D; Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78E6CC4FE02;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165216;
	bh=XyPBNJcfsateLZqZDmqJXaqUGmKQFBsDRF55C4LG0T0=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=TcCXaNCYW0BDNvMJHeqsLBHwik+5OsspXU5I71ENbZi2qdd52UN/hiTye4I/r6+06
	 BczIjQodK0HLtfegCi4WuhflNmfDloWMv7XpXvjk4SBjTQ68LZUOc9U92ecOGMwZLK
	 BQayujEvoKmTa8tSxPRemXhec1hi2arbm+F3PATppFX1oSnpekdCH5Ifsd+n9yPdGC
	 5Em6vfyV/tVj3IiFmZZW3EfAFtONgfOe0aPMOf6lmtFGI3gtbrVUFI+WT1YrJjwfKI
	 lY41wq8Rz4q/N1sO7S519s+9CPl0fPqUVFKqzXZDNpt7Xw+bPJGbLP2Np4IFGILmn7
	 r4rI4NG8EyY4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675A5EEE265;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:25:03 +0100
Subject: [PATCH 18/21] dt-bindings: serial: adi,uart4: add adi,uart4 driver
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-18-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=2919;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=oBF3dIbaQwuAcAPatmm8KzhpEcd5bQSZY83uCgqBwSQ=;
 b=6j/X3JDP4zFMAEkkyqLnHXSrm0oSB9HRqbPcKNXW4rw81mCvOqQoSN+pNHFxk+ahdUEzGmu5D
 5MfHyd0g+Q/DvdFqQ+DrXNJjkag80B9sLtGo27C10DPMpx3J/zt0gBB
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add serial driver bindings.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 .../devicetree/bindings/serial/adi,uart.yaml       | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/adi,uart.yaml b/Documentation/devicetree/bindings/serial/adi,uart.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..de58059efa7e21acaa5b7f4984ffadca18f7f53a
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/adi,uart.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/adi,uart4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices UART Driver for SC5XX-family processors
+
+maintainers:
+  - Arturs Artamonovs <arturs.artamonovs@analog.com>
+  - Utsav Agarwal <Utsav.Agarwal@analog.com>
+
+description: |
+  Analog Devices UART Driver for SC59X-family processors
+
+properties:
+  compatible:
+    enum:
+      - adi,uart
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+    minItems: 2
+    description: TX and RX DMA cluster numbers
+
+  dma-names:
+    maxItems: 2
+    minItems: 2
+    description: DMA channel names (tx and rx)
+
+  clocks:
+    maxItems: 1
+    description: Clock being used for UART
+
+  clock-names:
+    maxItems: 1
+    description: Clock name (sclk0)
+
+  interrupt-names:
+    minItems: 3
+    maxItems: 3
+    description: Interrupt names (tx + rx + status)
+
+  interrupts:
+    minItems: 3
+    maxItems: 3
+    description: GIC interrupt numbers
+
+  adi,use-edbo:
+    type: boolean
+    description: Enable divide by one in divisor
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupt-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/adi-sc5xx-clock.h>
+
+    uart0: uart@31003000 {
+      compatible = "adi,uart";
+      reg = <0x31003000 0x40>;
+      clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
+      clock-names = "sclk0";
+      interrupt-parent = <&gic>;
+      interrupt-names = "tx", "rx", "status";
+      interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+      adi,use-edbo;
+      status = "disabled";
+    };
+

-- 
2.25.1


