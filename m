Return-Path: <SRS0=mQ6W=SQ=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AA5C433FE
	for <soc@archiver.kernel.org>; Tue,  1 Feb 2022 17:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2716EC340F4; Tue,  1 Feb 2022 17:28:25 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4486FC340EB;
	Tue,  1 Feb 2022 17:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4486FC340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Md66H-1mgAIR2Egl-00aCE6; Tue, 01 Feb 2022 18:28:12 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 2/3] ARM: dts: Add Raspberry Pi Zero 2 W
Date: Tue,  1 Feb 2022 18:27:46 +0100
Message-Id: <1643736467-17764-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643736467-17764-1-git-send-email-stefan.wahren@i2se.com>
References: <1643736467-17764-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:5N4koCStL57Z+yDGLpr/nE4J/nbJUku+HoCjThPavhRjpU4WS4R
 AvFDNcOjWzizNZFag/vguuJxVECuawTQt0D8sXOTX5Y4S01A0cmfPmB8avfJUIVT75bfbCL
 mvh/jM3Wu91veA3IlSqaL41B1zW7Cs8q8d9Hmj9Vw1WeBJM0eSjxjE6BzNLsGGWfgxp5atI
 +pv0JILooqFR88SdeLLfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iZ5uyo5FviI=:vpfXj0Iv5Yjs28agoRz0+a
 M5GqMPUhazzXpyscY1tXxvK7/zacOwH2kxFClZfOXm6L1i2NkrgSodCkiY+hejmCIw07ZZBla
 aDcQB7nz9+eWg0N6YZ86pS1kDTn/COjLVNO3dLVP/+dNnH2mKA18zhQoFYtxdNhb+BazjQCzq
 MIO/yqLZEZQJHW2ct69lj/9HfFw+CyFKv2AC60MVNrBGdtElKJbV6uxFFD3c/J2DQ+c/8WPO1
 bab4LSLIyoVxvjCQMJDSg9vhWGDijMv1Y/NlHuF8cHUtFuVBeXyD9LLzCtbYJCyAcYRdjM/dN
 qbqDpaQKSFqCOEsPXEbdaMA7u2PEyVzJp7DTwgWVDAliaNU2C4+Wac6yiby9J77SfZFwGWZMr
 pgfq2zcgPdwuQ0vwRvnipiN1YpO07nS7gccRW6JyOmvvxCk/WqmcBY3YuiqWWLjHkMAB2x+v1
 cQ/rKOKwsSrarUY+qaeoWNZpGHXMVx0wIAmDvP6bfouDUShiJoduKpT6jCCFbLm2DUwykR7K3
 fI1DcknY6Q5bXtzokGwSKkzoV9qKSJHCXQX5D2u9znfoAnRq7nfgoZofIR8krflQWzn4MxxIQ
 8/In7+D/I0PCvWnC+9XjGkDg614B5mNSeV3He5bhyUFVK2JICyMYEBWLG+hK1pRsEKSNDkYtf
 Skb+sgMUO1mr92SupY+NAQxbzu+ncZlRQNpLNwSFfQg15DLWw/3Zoq285uPjBadw7YOjO0JjK
 nHFTCwZk18K031XL

The Raspberry Pi Zero 2 W mostly bases on the Raspberry Pi Zero W with
the following differences:
* Broadcom BCM2710A1, quad-core 64-bit SoC @ 1 GHz
* Synaptics BCM43436 (reported as BCM43430B0) IEEE 802.11b/g/n wireless LAN

Contrary to the Raspberry Pi 3 boards there is no GPIO expander.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts | 136 +++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 235ad55..fe31d14 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -93,6 +93,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2837-rpi-3-b.dtb \
 	bcm2837-rpi-3-b-plus.dtb \
 	bcm2837-rpi-cm3-io3.dtb \
+	bcm2837-rpi-zero-2-w.dtb \
 	bcm2711-rpi-400.dtb \
 	bcm2711-rpi-4-b.dtb \
 	bcm2711-rpi-cm4-io.dtb \
diff --git a/arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts b/arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts
new file mode 100644
index 0000000..4a76856
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2022 Stefan Wahren <stefan.wahren@i2se.com>
+ */
+
+/dts-v1/;
+#include "bcm2837.dtsi"
+#include "bcm2836-rpi.dtsi"
+#include "bcm283x-rpi-usb-otg.dtsi"
+#include "bcm283x-rpi-wifi-bt.dtsi"
+
+/ {
+	compatible = "raspberrypi,model-zero-2-w", "brcm,bcm2837";
+	model = "Raspberry Pi Zero 2 W";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0 0x20000000>;
+	};
+
+	chosen {
+		/* 8250 auxiliary UART instead of pl011 */
+		stdout-path = "serial1:115200n8";
+	};
+
+	leds {
+		led-act {
+			gpios = <&gpio 29 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&bt {
+	shutdown-gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
+};
+
+&gpio {
+	/*
+	 * This is based on the official GPU firmware DT blob.
+	 *
+	 * Legend:
+	 * "NC" = not connected (no rail from the SoC)
+	 * "FOO" = GPIO line named "FOO" on the schematic
+	 * "FOO_N" = GPIO line named "FOO" on schematic, active low
+	 */
+	gpio-line-names = "ID_SDA",
+			  "ID_SCL",
+			  "SDA1",
+			  "SCL1",
+			  "GPIO_GCLK",
+			  "GPIO5",
+			  "GPIO6",
+			  "SPI_CE1_N",
+			  "SPI_CE0_N",
+			  "SPI_MISO",
+			  "SPI_MOSI",
+			  "SPI_SCLK",
+			  "GPIO12",
+			  "GPIO13",
+			  /* Serial port */
+			  "TXD0",
+			  "RXD0",
+			  "GPIO16",
+			  "GPIO17",
+			  "GPIO18",
+			  "GPIO19",
+			  "GPIO20",
+			  "GPIO21",
+			  "GPIO22",
+			  "GPIO23",
+			  "GPIO24",
+			  "GPIO25",
+			  "GPIO26",
+			  "GPIO27",
+			  "HDMI_HPD_N",
+			  "STATUS_LED_N",
+			  "NC", /* GPIO30 */
+			  "NC", /* GPIO31 */
+			  "NC", /* GPIO32 */
+			  "NC", /* GPIO33 */
+			  "NC", /* GPIO34 */
+			  "NC", /* GPIO35 */
+			  "NC", /* GPIO36 */
+			  "NC", /* GPIO37 */
+			  "NC", /* GPIO38 */
+			  "NC", /* GPIO39 */
+			  "CAM_GPIO0", /* GPIO40 */
+			  "WL_ON", /* GPIO41 */
+			  "BT_ON", /* GPIO42 */
+			  "WIFI_CLK", /* GPIO43 */
+			  "SDA0", /* GPIO44 */
+			  "SCL0", /* GPIO45 */
+			  "SMPS_SCL",
+			  "SMPS_SDA",
+			  /* Used by SD Card */
+			  "SD_CLK_R",
+			  "SD_CMD_R",
+			  "SD_DATA0_R",
+			  "SD_DATA1_R",
+			  "SD_DATA2_R",
+			  "SD_DATA3_R";
+
+	pinctrl-0 = <&gpioout &alt0>;
+};
+
+&hdmi {
+	hpd-gpios = <&gpio 28 GPIO_ACTIVE_LOW>;
+	power-domains = <&power RPI_POWER_DOMAIN_HDMI>;
+	status = "okay";
+};
+
+&sdhci {
+	pinctrl-0 = <&emmc_gpio34 &gpclk2_gpio43>;
+};
+
+&sdhost {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhost_gpio48>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_gpio32 &uart0_ctsrts_gpio30>;
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_gpio14>;
+	status = "okay";
+};
+
+&wifi_pwrseq {
+	reset-gpios = <&gpio 41 GPIO_ACTIVE_LOW>;
+};
-- 
2.7.4

