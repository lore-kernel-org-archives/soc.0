Return-Path: <SRS0=7x3u=KX=armlinux.org.uk=rmk+soc=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09275C4708C
	for <soc@archiver.kernel.org>; Fri, 28 May 2021 10:22:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CEB70613C9; Fri, 28 May 2021 10:22:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6522F6135F
	for <soc@kernel.org>; Fri, 28 May 2021 10:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6522F6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=rmk+soc=kernel.org@armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7At2CBkDPrIqe7BpfkbIhUleZyYi3jq7qT+GXqfdhXs=; b=oLt2RuDU2aIlc8glAct7LpUNzg
	jfP+l4upeorFJ+Sw9h+p9r5f7P7iwLCDz8B3gktV+OZMriKQ/DRvMURQpkHck2CsUr75v4tDSGA4+
	6HWdB1uvUqtAZhRKEHwzBghytwtj+KbK9ZOfufJzR0JHbglItMPUPA/hTH4Cr50zuVQxJ102eJaWJ
	w/o6yqDwzLihV6wXSC6ADcYHR/J+XmbRRik0nslkpssOatYolN8Fw6BxISqKt6+hR4SL+JmcVsnNH
	kbLo6xtT6JwuH8m4dkFEeispSt4zaq1H7d/B1vaeX2niAMsfL7L2inf3L5E5A6xOD6Hmy08NElX98
	vUnY3SMw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57344 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1lmZd0-0008Hk-6d; Fri, 28 May 2021 11:22:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1lmZcz-0005Ze-UX; Fri, 28 May 2021 11:22:05 +0100
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,Olof Johansson <olof@lixom.net>,soc@kernel.org,Rob Herring <robh+dt@kernel.org>,Sascha Hauer <s.hauer@pengutronix.de>,Pengutronix Kernel Team <kernel@pengutronix.de>,Fabio Estevam <festevam@gmail.com>,NXP Linux Team <linux-imx@nxp.com>,linux-arm-kernel@lists.infradead.org,devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: add SolidRun SolidSense support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1lmZcz-0005Ze-UX@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 28 May 2021 11:22:05 +0100

Add support for the SolidRun SolidSense platform, which is a
Hummingboard2 with a daughter card with two Nordic software defined
radios and a couple of bi-color LEDs.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
Patch created before I joined Oracle, so I'm leaving out the "(Oracle)"
suffix I have been adding to both the authorship and sign-off.

 arch/arm/boot/dts/Makefile                |   2 +
 arch/arm/boot/dts/imx6dl-solidsense.dts   |  54 ++++++++
 arch/arm/boot/dts/imx6q-solidsense.dts    |  54 ++++++++
 arch/arm/boot/dts/imx6qdl-solidsense.dtsi | 160 ++++++++++++++++++++++
 4 files changed, 270 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-solidsense.dts
 create mode 100644 arch/arm/boot/dts/imx6q-solidsense.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-solidsense.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f97dda5ff50f..e9f0d5292aa2 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -476,6 +476,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-sabrelite.dtb \
 	imx6dl-sabresd.dtb \
 	imx6dl-savageboard.dtb \
+	imx6dl-solidsense.dtb \
 	imx6dl-ts4900.dtb \
 	imx6dl-ts7970.dtb \
 	imx6dl-tx6dl-comtft.dtb \
@@ -571,6 +572,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-sabresd.dtb \
 	imx6q-savageboard.dtb \
 	imx6q-sbc6x.dtb \
+	imx6q-solidsense.dtb \
 	imx6q-tbs2910.dtb \
 	imx6q-ts4900.dtb \
 	imx6q-ts7970.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-solidsense.dts b/arch/arm/boot/dts/imx6dl-solidsense.dts
new file mode 100644
index 000000000000..2a3699adbed0
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-solidsense.dts
@@ -0,0 +1,54 @@
+/*
+ * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
+ * Based on dt work by Russell King
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+/dts-v1/;
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-sr-som.dtsi"
+#include "imx6qdl-sr-som-emmc.dtsi"
+#include "imx6qdl-sr-som-ti.dtsi"
+#include "imx6qdl-hummingboard2.dtsi"
+#include "imx6qdl-solidsense.dtsi"
+
+/ {
+	model = "SolidRun SolidSense Solo/DualLite (1.5som+emmc)";
+	compatible = "solidrun,solidsense/dl", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/imx6q-solidsense.dts b/arch/arm/boot/dts/imx6q-solidsense.dts
new file mode 100644
index 000000000000..0e6a325df363
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-solidsense.dts
@@ -0,0 +1,54 @@
+/*
+ * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
+ * Based on dt work by Russell King
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+/dts-v1/;
+
+#include "imx6q.dtsi"
+#include "imx6qdl-sr-som.dtsi"
+#include "imx6qdl-sr-som-emmc.dtsi"
+#include "imx6qdl-sr-som-ti.dtsi"
+#include "imx6qdl-hummingboard2.dtsi"
+#include "imx6qdl-solidsense.dtsi"
+
+/ {
+	model = "SolidRun SolidSense Dual/Quad (1.5som+emmc)";
+	compatible = "solidrun,solidsense/q", "fsl,imx6q";
+};
diff --git a/arch/arm/boot/dts/imx6qdl-solidsense.dtsi b/arch/arm/boot/dts/imx6qdl-solidsense.dtsi
new file mode 100644
index 000000000000..16ba29259cb0
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-solidsense.dtsi
@@ -0,0 +1,160 @@
+/*
+ * Copyright (C) 2021 Russell King <rmk@armlinux.org.uk>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include <dt-bindings/leds/common.h>
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_solidsense_leds>;
+
+		/* Red/Green LED1 - next to WiFi SMA */
+		led-11 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <0>;
+			gpios = <&gpio2 26 GPIO_ACTIVE_LOW>;
+		};
+
+		led-12 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <0>;
+			gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
+		};
+
+		/* Red/Green LED2 - next to GPS SMA */
+		led-21 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+			gpios = <&gpio2 25 GPIO_ACTIVE_LOW>;
+		};
+
+		led-22 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+			gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&audio {
+	status = "disabled";
+};
+
+&ecspi2 {
+	status = "disabled";
+};
+
+&i2c3 {
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl-0 = <&pinctrl_hog>, <&pinctrl_solidsense_hog>;
+
+	solidsense {
+		pinctrl_solidsense_hog: solidsense-hog {
+			fsl,pins = <
+				/* Nordic RESET_N */
+				MX6QDL_PAD_GPIO_9__GPIO1_IO09 0x400130b1
+				/* Nordic Chip 1 SWDIO - GPIO 125 */
+				MX6QDL_PAD_DISP0_DAT8__GPIO4_IO29 0x400130b1
+				/* Nordic Chip 1 SWDCLK - GPIO 59 */
+				/* already claimed in the HB2 hogs */
+				/* MX6QDL_PAD_EIM_LBA__GPIO2_IO27 0x400130b1 */
+				/* Nordic Chip 2 SWDIO - GPIO 81 */
+				MX6QDL_PAD_EIM_D17__GPIO3_IO17 0x400130b1
+				/* Nordic Chip 2 SWCLK - GPIO 82 */
+				MX6QDL_PAD_EIM_D18__GPIO3_IO18 0x400130b1
+			>;
+		};
+
+		pinctrl_solidsense_leds: solidsense-leds {
+			fsl,pins = <
+				/* Red LED 1 - GPIO 58 */
+				MX6QDL_PAD_EIM_RW__GPIO2_IO26 0x400130b1
+				/* Green LED 1 - GPIO 55 */
+				MX6QDL_PAD_EIM_CS0__GPIO2_IO23 0x400130b1
+				/* Red LED 2 - GPIO 57 */
+				MX6QDL_PAD_EIM_OE__GPIO2_IO25 0x400130b1
+				/* Green LED 2 - GPIO 56 */
+				MX6QDL_PAD_EIM_CS1__GPIO2_IO24 0x400130b1
+			>;
+		};		
+
+		pinctrl_solidsense_uart2: solidsense-uart2 {
+			fsl,pins = <
+				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+			>;
+		};
+
+		pinctrl_solidsense_uart3: solidsense-uart3 {
+			fsl,pins = <
+				MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
+				MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
+			>;
+		};
+	};
+};
+
+&pwm1 {
+	status = "disabled";
+};
+
+&sgtl5000 {
+	status = "disabled";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_solidsense_uart2>;
+	status = "okay";
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_solidsense_uart3>;
+	status = "okay";
+};
-- 
2.20.1

