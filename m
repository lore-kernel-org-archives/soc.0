Return-Path: <SRS0=xZhg=LH=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D698CC48BCF
	for <soc@archiver.kernel.org>; Sun, 13 Jun 2021 10:18:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AD362611C0; Sun, 13 Jun 2021 10:18:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B8ED61261;
	Sun, 13 Jun 2021 10:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B8ED61261
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wm1-f41.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so11042617wmq.5;
        Sun, 13 Jun 2021 03:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0rniEo6yjC7SVjDQNJKAQ2ssOUc4YwKIHYQjR7tq28M=;
        b=drEkFUrci88GQa6mFmoCLviP7OfIbvUTrG2Y5pk01IDsDCR66wAQb26lR5Hv7Zc5HH
         yg3ok/G+/FD4a1NKgCymiZYISXCOahInDqf546sxKoQN5JoS0RsAN5btC3qtrjE7p9nM
         9NuVYMJNX4UYdCh4R1nxH/V/6P7YOYaVkimhSg1XVJZ6JjLTVRtXBaa9czCKCbVigRu0
         63BONR7neDpc7/vtFrkVjJAMVL7XIWouHlOxgTgqYFf+oI8mCbzLBJiKJYhrZzQehOj9
         wyCIvZ5kY4h3XDz7LaFEhATxzDsfo4JL1MrplmOLQCRNXvCmWmibE6n4OxhUVMzyMwCB
         G9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0rniEo6yjC7SVjDQNJKAQ2ssOUc4YwKIHYQjR7tq28M=;
        b=TpfpMl8HIrS6Aa3ypyEQr/77kYzouhQaXXj6EgKNnoqodzlhSPzadkmbl4ITqe4upq
         czo5HqtRrYB68ouTIefa9xWEt+xnHWEwMNDt8XTg/QZ8/XzCyF7kRvYOczrJphz28W3j
         QqF21H9dvbOw6c0auVlK0PwwahU0h0R48mdn+xh0J72mN3rq6mvjgiQmOYvpOQgIye+O
         R0Ia5slwxHzbVBFCRwNP3n3Qy0Z387rMPH1+8JsjSh7V7BDVajYWAX0wAc8l8loNyC14
         +O5dR9qSCL01N2I8eOClnEvW3zMI1Id9RxEi/9OhU23K0anH8YUiisxMHRaISItA/XmK
         4iRw==
X-Gm-Message-State: AOAM532GFsS7Zcfvq9kH9G5QozfsUMeMm09fhN60dKXReAemS9hZScHD
	P82Y3eamYACkdb9r3V2Ub8I=
X-Google-Smtp-Source: ABdhPJyu0CwTt6cdMbQUZx9agEQbhHihD4AyS6H3CMibEEcVYFBrZIJHiFQeEAwhtHlYVAAOPKqYlg==
X-Received: by 2002:a05:600c:1c84:: with SMTP id k4mr27948034wms.164.1623579490160;
        Sun, 13 Jun 2021 03:18:10 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id f5sm13964323wrf.22.2021.06.13.03.18.09
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Sun, 13 Jun 2021 03:18:09 -0700 (PDT)
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
	Sam Ravnborg <sam@ravnborg.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/4] ARM: dts: NSP: Add DT files for Meraki MX64 series
Date: Sun, 13 Jun 2021 11:16:46 +0100
Message-Id: <20210613101658.3242777-3-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210613101658.3242777-1-mnhagan88@gmail.com>
References: <20210613101658.3242777-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MX64 & MX64W Hardware info:
  - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
  - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
  - Storage: 1 GB (Micron MT29F8G08ABACA)
  - Networking: BCM58625 internal switch (5x 1GbE ports)
  - USB: 1x USB2.0
  - Serial: Internal header
  - WLAN(MX64W only): 2x Broadcom BCM43520KMLG on the PCI bus

This patch adds the Meraki MX64 series-specific bindings. Since some
devices make use of the older A0 SoC, changes need to be made to
accommodate this case, including removal of coherency options and
modification to the secondary-boot-reg.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |   4 +
 .../boot/dts/bcm958625-meraki-kingpin.dtsi    | 165 ++++++++++++++++++
 .../arm/boot/dts/bcm958625-meraki-mx64-a0.dts |  45 +++++
 arch/arm/boot/dts/bcm958625-meraki-mx64.dts   |  15 ++
 .../boot/dts/bcm958625-meraki-mx64w-a0.dts    |  55 ++++++
 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts  |  23 +++
 6 files changed, 307 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f8f09c5066e7..83560b05f797 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -154,6 +154,10 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
 	bcm958525xmc.dtb \
 	bcm958622hr.dtb \
 	bcm958623hr.dtb \
+	bcm958625-meraki-mx64.dtb \
+	bcm958625-meraki-mx64-a0.dtb \
+	bcm958625-meraki-mx64w.dtb \
+	bcm958625-meraki-mx64w-a0.dtb \
 	bcm958625hr.dtb \
 	bcm988312hr.dtb \
 	bcm958625k.dtb
diff --git a/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi b/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
new file mode 100644
index 000000000000..107c2167a113
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 series (Kingpin).
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+#include "bcm958625-meraki-mx6x-common.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
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
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			/* green:lan1-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 19 GPIO_ACTIVE_LOW>;
+		};
+
+		led-1 {
+			/* green:lan1-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 18 GPIO_ACTIVE_LOW>;
+		};
+
+		led-2 {
+			/* green:lan2-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 24 GPIO_ACTIVE_LOW>;
+		};
+
+		led-3 {
+			/* green:lan2-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <3>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 20 GPIO_ACTIVE_LOW>;
+		};
+
+		led-4 {
+			/* green:lan3-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <4>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 26 GPIO_ACTIVE_LOW>;
+		};
+
+		led-5 {
+			/* green:lan3-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <5>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 25 GPIO_ACTIVE_LOW>;
+		};
+
+		led-6 {
+			/* green:lan4-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <6>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 28 GPIO_ACTIVE_LOW>;
+		};
+
+		led-7 {
+			/* green:lan4-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <7>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 27 GPIO_ACTIVE_LOW>;
+		};
+
+		led-8 {
+			/* green:wan-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <8>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 30 GPIO_ACTIVE_LOW>;
+		};
+
+		led-9 {
+			/* green:wan-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <9>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 29 GPIO_ACTIVE_LOW>;
+		};
+
+		led-a {
+			/* amber:power */
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_AMBER>;
+			gpios = <&gpioa 0 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-b {
+			/* white:status */
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&gpioa 31 GPIO_ACTIVE_HIGH>;
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
index 000000000000..e00299d06951
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 with A0 SoC.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
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
index 000000000000..58addd69688a
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 with B0+ SoC.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
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
index 000000000000..4e798739bb6a
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64W with A0 SoC.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64W(A0)";
+	compatible = "meraki,mx64w-a0", "brcm,bcm58625", "brcm,nsp";
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
index 000000000000..8d37cd56c093
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64W with B0+ SoC.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
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

