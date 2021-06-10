Return-Path: <SRS0=piyp=LE=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAD9C48BD1
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 23:29:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 09837613CB; Thu, 10 Jun 2021 23:29:00 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C94B3613E1;
	Thu, 10 Jun 2021 23:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C94B3613E1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wr1-f47.google.com with SMTP id z8so4024406wrp.12;
        Thu, 10 Jun 2021 16:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BTpjcEscnkXt8biWria3TPVvbm38R/l/UTSx1WwHNQ4=;
        b=HV8O5Wx+mQNMN2vpuSzv6+t3TN3t8AVdOuLrs6e0MI3vI0yveOfPUCL09T29xrwxX/
         niGf6R3taOBFa8NYD4uEp0yNeNLCyMyzyYf6gKdaAGJ4EPvWR426NVveEtldotO7Nd91
         LKyfqy+Ribef0jOKTR61fp1aymO05HvpUYUqc/vJLoIcUeOpgTnL9Wzdxbw5d9PX4ebR
         wSN92PxI4lp2g4eseZu5R7VwHs+3zRQY8SxKzo4mNY2Z/KIs6psFnXmRKzbLaLkI3ao7
         h7uV6+I6mveGb0jP+TOEuP4Sp0nZKDE9vEHqI/5Cvy0U+lCuln3iwJSOL/Z6KSHqx+TZ
         4Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BTpjcEscnkXt8biWria3TPVvbm38R/l/UTSx1WwHNQ4=;
        b=aVp9dHpajDeJt9HJCqFTo9pzBprNHYBv0z6tgcIAmuwspDIQfeTXtkZ9RGcyIVgqBW
         3KOhrniLYaY3gJRP4aGbUwf9zk6L5rS4AbVXNs4mwtl/qAvlO3iU9wgfAaerww/lRtKx
         E0L5cVsvBCplRHU6HX/PuN/c8K9fEbDp4+Zwb7oz9lH45dgIoJIFvG/eFYfbeCIo9sbw
         exqe6A+P1wrb8rWlIxzEPvK/bMBfzxNdwTBueZRNhqsQwUZdKEcqp4dYORXe4hxl6UN0
         ppiqMhoRKJ9S07vbyACLoaIe+OYvY2Jo1wBormHGgNTpavQk0gczN+ykzJ177dQu7CRh
         n9Bw==
X-Gm-Message-State: AOAM53024nKlZ52/jFGnqZwkuH7RpIsbWDAaWFb79OLczRB2K8XJigF0
	R56C+tbqsdVE5QGMoXNu5VY=
X-Google-Smtp-Source: ABdhPJyCoU8FCEn23JKM5OCnln6DG5M5qDbzdTAbzlnFUMV2OTYKEdslyh579et4/sWhtyi1REg0Yw==
X-Received: by 2002:adf:de03:: with SMTP id b3mr788972wrm.15.1623367738500;
        Thu, 10 Jun 2021 16:28:58 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id f14sm9786849wmq.10.2021.06.10.16.28.57
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 10 Jun 2021 16:28:58 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Matthew Hagan <mnhagan88@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/5] ARM: dts: NSP: Add DT files for Meraki MX64 series
Date: Fri, 11 Jun 2021 00:27:16 +0100
Message-Id: <20210610232727.1383117-5-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610232727.1383117-1-mnhagan88@gmail.com>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MX64 Hardware info:
  - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
  - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
  - Storage: 1 GB (Micron MT29F8G08ABACA)
  - Networking: BCM58625 internal switch (5x 1GbE ports)
  - USB: 1x USB2.0
  - Serial: Internal header

This patch adds the Meraki MX64 series. Since some devices make use of
the older A0 SoC, changes need to be made to accommodate this device,
including removal of dma-coherent and change in the secondary-cpu
address. The MX64W devices have 2x Broadcom BCM43520KMLG on the PCI bus.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 .../boot/dts/bcm958625-meraki-kingpin.dtsi    | 131 ++++++++++++++++++
 .../arm/boot/dts/bcm958625-meraki-mx64-a0.dts |  45 ++++++
 arch/arm/boot/dts/bcm958625-meraki-mx64.dts   |  15 ++
 .../boot/dts/bcm958625-meraki-mx64w-a0.dts    |  55 ++++++++
 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts  |  23 +++
 5 files changed, 269 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts

diff --git a/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi b/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
new file mode 100644
index 000000000000..8c4834f3496b
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 series (Kingpin).
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+#include "bcm958625-meraki-mx6x-common.dtsi"
+
+#include <dt-bindings/input/input.h>
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+
+		orange_power {
+			label = "orange:power";
+			gpios = <&gpioa 0 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		lan1_right {
+			label = "green:lan1-right";
+			gpios = <&gpioa 18 GPIO_ACTIVE_LOW>;
+		};
+
+		lan1_left {
+			label = "green:lan1-left";
+			gpios = <&gpioa 19 GPIO_ACTIVE_LOW>;
+		};
+
+		lan2_right {
+			label = "green:lan2-right";
+			gpios = <&gpioa 20 GPIO_ACTIVE_LOW>;
+		};
+
+		lan2_left {
+			label = "green:lan2-left";
+			gpios = <&gpioa 24 GPIO_ACTIVE_LOW>;
+		};
+
+		lan3_right {
+			label = "green:lan3-right";
+			gpios = <&gpioa 25 GPIO_ACTIVE_LOW>;
+		};
+
+		lan3_left {
+			label = "green:lan3-left";
+			gpios = <&gpioa 26 GPIO_ACTIVE_LOW>;
+		};
+
+		lan4_right {
+			label = "green:lan4-right";
+			gpios = <&gpioa 27 GPIO_ACTIVE_LOW>;
+		};
+
+		lan4_left {
+			label = "green:lan4-left";
+			gpios = <&gpioa 28 GPIO_ACTIVE_LOW>;
+		};
+
+		wan_right {
+			label = "green:wan-right";
+			gpios = <&gpioa 29 GPIO_ACTIVE_LOW>;
+		};
+
+		wan_left {
+			label = "green:wan-left";
+			gpios = <&gpioa 30 GPIO_ACTIVE_LOW>;
+		};
+
+		white_status {
+			label = "white:status";
+			gpios = <&gpioa 31 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	keys {
+		compatible = "gpio-keys-polled";
+		autorepeat;
+		poll-interval = <20>;
+
+		reset {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpioa 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&srab {
+	compatible = "brcm,bcm58625-srab", "brcm,nsp-srab";
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+			reg = <0>;
+		};
+
+		port@1 {
+			label = "lan2";
+			reg = <1>;
+		};
+
+		port@2 {
+			label = "lan3";
+			reg = <2>;
+		};
+
+		port@3 {
+			label = "lan4";
+			reg = <3>;
+		};
+
+		port@4 {
+			label = "wan";
+			reg = <4>;
+		};
+
+		port@8 {
+			ethernet = <&amac2>;
+			label = "cpu";
+			reg = <8>;
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts b/arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
new file mode 100644
index 000000000000..aed9eb9fccd7
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 with A0 SoC.
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64(A0)";
+	compatible = "meraki,mx64-a0", "brcm,bcm58625", "brcm,nsp";
+};
+
+&cpu1 {
+	secondary-boot-reg = <0xffff042c>;
+};
+
+&L2 {
+	/delete-property/ arm,io-coherent;
+	/delete-property/ prefetch-data;
+	/delete-property/ prefetch-instr;
+};
+
+&amac2 {
+	/delete-property/ dma-coherent;
+};
+
+&mailbox {
+	/delete-property/ dma-coherent;
+};
+
+&ehci0 {
+	/delete-property/ dma-coherent;
+};
+
+&ohci0 {
+	/delete-property/ dma-coherent;
+};
+
+&i2c0 {
+	/delete-property/ dma-coherent;
+};
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx64.dts b/arch/arm/boot/dts/bcm958625-meraki-mx64.dts
new file mode 100644
index 000000000000..fe787fd7d660
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 with B0+ SoC.
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64";
+	compatible = "meraki,mx64", "brcm,bcm58625", "brcm,nsp";
+};
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts b/arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
new file mode 100644
index 000000000000..b7d88c542943
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64W with A0 SoC.
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64(A0)";
+	compatible = "meraki,mx64-a0", "brcm,bcm58625", "brcm,nsp";
+};
+
+&cpu1 {
+	secondary-boot-reg = <0xffff042c>;
+};
+
+&L2 {
+	/delete-property/ arm,io-coherent;
+	/delete-property/ prefetch-data;
+	/delete-property/ prefetch-instr;
+};
+
+&amac2 {
+	/delete-property/ dma-coherent;
+};
+
+&mailbox {
+	/delete-property/ dma-coherent;
+};
+
+&ehci0 {
+	/delete-property/ dma-coherent;
+};
+
+&ohci0 {
+	/delete-property/ dma-coherent;
+};
+
+&i2c0 {
+	/delete-property/ dma-coherent;
+};
+
+&pcie0 {
+	/delete-property/ dma-coherent;
+	status = "okay";
+};
+
+&pcie1 {
+	/delete-property/ dma-coherent;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx64w.dts b/arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
new file mode 100644
index 000000000000..aa29c96f2871
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64W with B0+ SoC.
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64W";
+	compatible = "meraki,mx64w", "brcm,bcm58625", "brcm,nsp";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
-- 
2.26.3

