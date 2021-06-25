Return-Path: <SRS0=r8q2=LT=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5B6C2B9F4
	for <soc@archiver.kernel.org>; Fri, 25 Jun 2021 09:50:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 29D91613EF; Fri, 25 Jun 2021 09:50:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10C66141A;
	Fri, 25 Jun 2021 09:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F10C66141A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wm1-f43.google.com with SMTP id o22so4911810wms.0;
        Fri, 25 Jun 2021 02:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QrjPhqxp9AQ4SD1mzWPx8rTfZvPDwimW5172Nl3y578=;
        b=TWeGTjIZqq60pcvRI4aoL/E5tI2vFRC3ClmK2IyiaNfaDWLpnsnkzpmDGdLTLhCasH
         KIYQc90gv5vTAHqMV35pX9iWuLsn2sWAH/z1rxhZbs9sAFncgINbM/PCI1yXeu+35KGn
         Oe2vZLN4o3HnQv+FbJdAfOg8n/jm79gdUyehRMpiSErJBzB6c3YmZ7qbRgdLB7fzy0Kd
         HeQYlUR06JtVyfWlG4z/ns63R64MqtsBkGsKjYSu1TpWN+jgfC0SqnLqh260KBP1QYay
         u3Tg3FXZwkNaj7dFENjdOCWmW6u09fApq0beqsLfe1eamt3I+szyJNvaRWk9vRImt7NO
         NTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QrjPhqxp9AQ4SD1mzWPx8rTfZvPDwimW5172Nl3y578=;
        b=IaahNomTMzTT7W5ZycpCrAZa1Jzbwf6u2TtTIxcWC7uwHwuP7OHoesnqQOXRbUcHPM
         SYi4x/rtgLh1g3RGJe6H73nCwML9FnHNU9O8R0NyyBlkjy54NQdBc48YWsUaynQMKBfW
         /nT7ezYLDhP/JYcsYlQt6ZVGLfrRyL/a7L0/Bky/wEc0bkJB31wHjpbDsaE8wOZmKAk+
         OyZZZJFqx2c61fJSbtStReDwPAjgT+O7iw/zDcvygiZJd0vyU+oAAHBMQrjX3D3pix3j
         CNz+2ruMJ9PK5wcr3MqVkDG81NP9ZnyZ8gaRdWFcrUQVN7IXae8bzxfQZGh6IQ5YjNSz
         XnPA==
X-Gm-Message-State: AOAM532CmTOaYwXgSq9vUWJ77pxRmKMwo/srVqiUHbD+cABzJ8w5KLdP
	bcNdObW1xxhEwiMn/2cqzdI=
X-Google-Smtp-Source: ABdhPJxuO8tCW3o6RrFwKkPTiYPqkQ4XlysqpY6AAZBqBU+O/SfKciS3xXeNmwpS8VYNUOhJ56WFkg==
X-Received: by 2002:a1c:2cc3:: with SMTP id s186mr9808890wms.150.1624614653716;
        Fri, 25 Jun 2021 02:50:53 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id r1sm5413139wmh.32.2021.06.25.02.50.53
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 25 Jun 2021 02:50:53 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
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
Subject: [PATCH v4 3/4] ARM: dts: NSP: Add DT files for Meraki MX65 series
Date: Fri, 25 Jun 2021 10:49:50 +0100
Message-Id: <20210625095000.3358973-4-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210625095000.3358973-1-mnhagan88@gmail.com>
References: <20210625095000.3358973-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MX65 & MX65W Hardware info:
  - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
  - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
  - Storage: 1 GB (Micron MT29F8G08ABACA)
  - Networking: BCM58625 switch (2x 1GbE ports)
    2x Qualcomm QCA8337 switches (10x 1GbE ports total)
  - PSE: Broadcom BCM59111KMLG connected to LAN ports 11 & 12
  - USB: 1x USB2.0
  - Serial: Internal header
  - WLAN(MX65W Only): 2x Broadcom BCM43520KMLG on the PCI bus.

Note that a driver and firmware image for the BCM59111 PSE has been
released under GPL, but this is not present in the kernel.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi | 279 ++++++++++++++++++
 arch/arm/boot/dts/bcm958625-meraki-mx65.dts   |  15 +
 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts  |  23 ++
 4 files changed, 319 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 83560b05f797..033d9604db60 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -158,6 +158,8 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
 	bcm958625-meraki-mx64-a0.dtb \
 	bcm958625-meraki-mx64w.dtb \
 	bcm958625-meraki-mx64w-a0.dtb \
+	bcm958625-meraki-mx65.dtb \
+	bcm958625-meraki-mx65w.dtb \
 	bcm958625hr.dtb \
 	bcm988312hr.dtb \
 	bcm958625k.dtb
diff --git a/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi b/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
new file mode 100644
index 000000000000..8860f2fefc63
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65 series (Alamo).
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+#include "bcm958625-meraki-mx6x-common.dtsi"
+
+/ {
+	keys {
+		compatible = "gpio-keys-polled";
+		autorepeat;
+		poll-interval = <20>;
+
+		reset {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpioa 8 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			/* green:wan1-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 25 GPIO_ACTIVE_LOW>;
+		};
+
+		led-1 {
+			/* green:wan1-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 24 GPIO_ACTIVE_LOW>;
+		};
+
+		led-2 {
+			/* green:wan2-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 27 GPIO_ACTIVE_LOW>;
+		};
+
+		led-3 {
+			/* green:wan2-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <3>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 26 GPIO_ACTIVE_LOW>;
+		};
+
+		led-4 {
+			/* amber:power */
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_AMBER>;
+			gpios = <&gpioa 3 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		led-5 {
+			/* white:status */
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&gpioa 31 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	mdio-mii-mux {
+		compatible = "mdio-mux-mmioreg";
+		reg = <0x1803f1c0 0x4>;
+		mux-mask = <0x2000>;
+		mdio-parent-bus = <&mdio_ext>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mdio@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			phy_port6: phy@0 {
+				reg = <0>;
+			};
+
+			phy_port7: phy@1 {
+				reg = <1>;
+			};
+
+			phy_port8: phy@2 {
+				reg = <2>;
+			};
+
+			phy_port9: phy@3 {
+				reg = <3>;
+			};
+
+			phy_port10: phy@4 {
+				reg = <4>;
+			};
+
+			switch@10 {
+				compatible = "qca,qca8337";
+				reg = <0x10>;
+				dsa,member = <1 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						ethernet = <&sgmii1>;
+						phy-mode = "sgmii";
+						fixed-link {
+							speed = <1000>;
+							full-duplex;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						label = "lan8";
+						phy-handle = <&phy_port6>;
+					};
+
+					port@2 {
+						reg = <2>;
+						label = "lan9";
+						phy-handle = <&phy_port7>;
+					};
+
+					port@3 {
+						reg = <3>;
+						label = "lan10";
+						phy-handle = <&phy_port8>;
+					};
+
+					port@4 {
+						reg = <4>;
+						label = "lan11";
+						phy-handle = <&phy_port9>;
+					};
+
+					port@5 {
+						reg = <5>;
+						label = "lan12";
+						phy-handle = <&phy_port10>;
+					};
+				};
+			};
+		};
+
+		mdio-mii@2000 {
+			reg = <0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			phy_port1: phy@0 {
+				reg = <0>;
+			};
+
+			phy_port2: phy@1 {
+				reg = <1>;
+			};
+
+			phy_port3: phy@2 {
+				reg = <2>;
+			};
+
+			phy_port4: phy@3 {
+				reg = <3>;
+			};
+
+			phy_port5: phy@4 {
+				reg = <4>;
+			};
+
+			switch@10 {
+				compatible = "qca,qca8337";
+				reg = <0x10>;
+				dsa,member = <2 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						ethernet = <&sgmii0>;
+						phy-mode = "sgmii";
+						fixed-link {
+							speed = <1000>;
+							full-duplex;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						label = "lan3";
+						phy-handle = <&phy_port1>;
+					};
+
+					port@2 {
+						reg = <2>;
+						label = "lan4";
+						phy-handle = <&phy_port2>;
+					};
+
+					port@3 {
+						reg = <3>;
+						label = "lan5";
+						phy-handle = <&phy_port3>;
+					};
+
+					port@4 {
+						reg = <4>;
+						label = "lan6";
+						phy-handle = <&phy_port4>;
+					};
+
+					port@5 {
+						reg = <5>;
+						label = "lan7";
+						phy-handle = <&phy_port5>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&srab {
+	compatible = "brcm,bcm58625-srab", "brcm,nsp-srab";
+	status = "okay";
+	dsa,member = <0 0>;
+
+	ports {
+		port@0 {
+			label = "wan1";
+			reg = <0>;
+		};
+
+		port@1 {
+			label = "wan2";
+			reg = <1>;
+		};
+
+		sgmii0: port@4 {
+			label = "sw0";
+			reg = <4>;
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
+
+		sgmii1: port@5 {
+			label = "sw1";
+			reg = <5>;
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
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
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx65.dts b/arch/arm/boot/dts/bcm958625-meraki-mx65.dts
new file mode 100644
index 000000000000..a196b3053a59
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx65.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-alamo.dtsi"
+
+/ {
+	model = "Cisco Meraki MX65";
+	compatible = "meraki,mx65", "brcm,bcm58625", "brcm,nsp";
+};
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
new file mode 100644
index 000000000000..bfdaa1a6a046
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65W.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-alamo.dtsi"
+
+/ {
+	model = "Cisco Meraki MX65W";
+	compatible = "meraki,mx65w", "brcm,bcm58625", "brcm,nsp";
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

