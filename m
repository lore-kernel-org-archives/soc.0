Return-Path: <SRS0=HoMm=EZ=nuvoton.com=Tomer.Maimon@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FD2C2D0E4
	for <soc@archiver.kernel.org>; Thu, 19 Nov 2020 08:34:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B49F4246B0; Thu, 19 Nov 2020 08:34:30 +0000 (UTC)
X-Greylist: delayed 2016 seconds by postgrey-1.34 at mail.kernel.org; Thu, 19 Nov 2020 08:34:29 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79BB324655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=Tomer.Maimon@nuvoton.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79BB324655;
	Thu, 19 Nov 2020 08:34:29 +0000 (UTC)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 0AJ80EK4010231;
	Thu, 19 Nov 2020 10:00:14 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 7C18B63A09; Thu, 19 Nov 2020 10:00:14 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
List-Id: <soc.lore.kernel.org>
To: joel@jms.id.au, arnd@arndb.de, olof@lixom.net, arm@kernel.org,
        soc@kernel.org, avifishman70@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, yuenn@google.com, benjaminfair@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1] ARM: dts: add Nuvoton NPCM730 device tree
Date: Thu, 19 Nov 2020 10:00:02 +0200
Message-Id: <20201119080002.100342-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Nuvoton NPCM730 SoC device tree.

The Nuvoton NPCN730 SoC is a part of the
Nuvoton NPCM7xx SoCs family.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-npcm730.dtsi | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730.dtsi

diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
new file mode 100644
index 000000000000..86ec12ec2b50
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Nuvoton Technology
+
+#include "nuvoton-common-npcm7xx.dtsi"
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "nuvoton,npcm750-smp";
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			clocks = <&clk NPCM7XX_CLK_CPU>;
+			clock-names = "clk_cpu";
+			reg = <0>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			clocks = <&clk NPCM7XX_CLK_CPU>;
+			clock-names = "clk_cpu";
+			reg = <1>;
+			next-level-cache = <&l2>;
+		};
+	};
+
+	soc {
+		timer@3fe600 {
+			compatible = "arm,cortex-a9-twd-timer";
+			reg = <0x3fe600 0x20>;
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
+						  IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&clk NPCM7XX_CLK_AHB>;
+		};
+	};
+};
-- 
2.22.0

