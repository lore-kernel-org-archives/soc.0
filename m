Return-Path: <SRS0=k3Qe=KZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719C4C47089
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 May 2021 09:28:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A51610C7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 May 2021 09:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A51610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArqgS9ZHv+/zZjBOP+PMK1fR/QhS5PNKc2UYh5JILNA=; b=qCnxo9t4Gykxws
	tOML2aL8gm/oD8xvMskg7OazPs1f6cycRwrobY/NR3LEcBkSGKpDN+yZqfU4r34JZ+0qjuhLCSgfZ
	+jCCBg9LAmmg8LFZiNmI4pQF2W1ZT9mTZD40H1pvFA2P5b5EyAWWR7cMX2ISyC7vpNR1MarnxxdSM
	BUloUIxUWS9E5OxprIX15l+IrARiTI8kJ4JsOgcw49FRlx2C9a3G6DJTOcoUn58ZmJ+VBw+VFMUWA
	rfyMyitTcYg+mmMfvzr1Nlkphe/zLq3aoV1N9HweDzwhLOF5JguQgUMrtcaBo4al8bVj1xPHBebcX
	XBnGBSuAd4M7YeBHIo9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnHj2-009NGs-L8; Sun, 30 May 2021 09:27:16 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnHiT-009NCS-95; Sun, 30 May 2021 09:26:44 +0000
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MgNxZ-1lCHHC1tFf-00hyVf; Sun, 30 May 2021 11:26:25 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 5/6] ARM: dts: Add Raspberry Pi 400 support
Date: Sun, 30 May 2021 11:26:14 +0200
Message-ID: <1622366775-5309-6-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:GwXjF7r43aCf/jqw7VvFyDJOhJ0rsCUHlQpS6IkKtPeW/bJqwa3
 rQ5x72A2uA4Tt6wUVXkO4G9yox9GIOGp8XInOJtG2gAb4qD08Bz12/kEyc1Ec3aUl0MJiYI
 Vk6hHrg/9G9t5VvLHxEKCsckuAO2yvCY4DtBJtJr7jLEGR2hF/KghFkL6qJbhbo8GDK54Lo
 YJsY3dpUiz1kksv7NppsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6oS4YcPRyoU=:bW1dErdiAOFA3QQ8sJyk3o
 A93Gc8ttAChpHWoy8lLKtE2o0bQgoQGO98vT9uHWKQysJnhed5bhY0R5hpTT3RgcrckOCvmAN
 yrlF5abCuRMqDRWNFG5eEBsq5KmlHr3oGeWx5tR4jcp3acHDjd6D5be6Ia2WW1s4bvc5jPCnf
 R1r4UJXU6cpkiMzsb2gjV5bof5H4mavvZ11bygnRSyDDs03IDv4rSi8MKWWngXlsx8fokgB/E
 UB772RHgeMrHH94nYMt9X5qYHxWs5FGse0DNQt500gxN6+VfX29geK2ipynLn0UmtSDO+Ug5A
 3gDJe0nL2kGL7U1P5XO2BDJdWf7BLReAcKIp+rhFUCEOPCBYQiZ5dwKOVLGTjzAjW8F0/lxqE
 9plLb43/vgVI8dszQqZ5Czs9N62WIm4j3zJbGsXjiaxvvSOeLjq0maDgPrgOaV3VB85dYBOfU
 tga6dIHz5IIiFmQzJhUHkiAWdumWFNcErqi/5gDGswfDOq6JvEdj19ktgK6rw9zJ3pShWpQYM
 bw+ri1KTpDQV9nBEweVMNg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_022641_660937_8A6D9336 
X-CRM114-Status: GOOD (  18.41  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210530092614.tM-RQpgEFh8hDIRwsxyX1a01zwA2CbDyFLN2pZQsiQg@z>

The Raspberry Pi 400 is like a Pi 4 B designed into a keyboard. But there
are some minor differences:

- higher CPU clock rate (1.8 GHz)
- different Wifi chip (BCM43456)
- power off is now handled via GPIO
- no ACT LED

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/Makefile            |   1 +
 arch/arm/boot/dts/bcm2711-rpi-400.dts | 271 ++++++++++++++++++++++++++++++++++
 2 files changed, 272 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-400.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f8f09c5..ec00dba 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -88,6 +88,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2837-rpi-3-b.dtb \
 	bcm2837-rpi-3-b-plus.dtb \
 	bcm2837-rpi-cm3-io3.dtb \
+	bcm2711-rpi-400.dtb \
 	bcm2711-rpi-4-b.dtb \
 	bcm2835-rpi-zero.dtb \
 	bcm2835-rpi-zero-w.dtb
diff --git a/arch/arm/boot/dts/bcm2711-rpi-400.dts b/arch/arm/boot/dts/bcm2711-rpi-400.dts
new file mode 100644
index 0000000..f063c5e
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi-400.dts
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "bcm2711.dtsi"
+#include "bcm2711-rpi.dtsi"
+#include "bcm283x-rpi-usb-peripheral.dtsi"
+
+/ {
+	compatible = "raspberrypi,400", "brcm,bcm2711";
+	model = "Raspberry Pi 400";
+
+	chosen {
+		/* 8250 auxiliary UART instead of pl011 */
+		stdout-path = "serial1:115200n8";
+	};
+
+	/* Will be filled by the bootloader */
+	memory@0 {
+		device_type = "memory";
+		reg = <0 0 0>;
+	};
+
+	aliases {
+		ethernet0 = &genet;
+	};
+
+	leds {
+		/delete-node/ act;
+
+		led-pwr {
+			label = "PWR";
+			gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			linux,default-trigger = "default-on";
+		};
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&expgpio 1 GPIO_ACTIVE_LOW>;
+	};
+
+	gpio-poweroff {
+		compatible = "gpio-poweroff";
+		gpios = <&expgpio 5 GPIO_ACTIVE_HIGH>;
+	};
+
+	sd_io_1v8_reg: sd_io_1v8_reg {
+		compatible = "regulator-gpio";
+		regulator-name = "vdd-sd-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-settling-time-us = <5000>;
+		gpios = <&expgpio 4 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x1
+			  3300000 0x0>;
+		status = "okay";
+	};
+
+	sd_vcc_reg: sd_vcc_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&expgpio 6 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&ddc0 {
+	status = "okay";
+};
+
+&ddc1 {
+	status = "okay";
+};
+
+&firmware {
+	expgpio: gpio {
+		compatible = "raspberrypi,firmware-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "BT_ON",
+				  "WL_ON",
+				  "",
+				  "GLOBAL_RESET",
+				  "VDD_SD_IO_SEL",
+				  "CAM_GPIO",
+				  "SD_PWR_ON",
+				  "SD_OC_N";
+		status = "okay";
+	};
+};
+
+&gpio {
+	/*
+	 * Parts taken from rpi_SCH_4b_4p0_reduced.pdf and
+	 * the official GPU firmware DT blob.
+	 *
+	 * Legend:
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
+			  "TXD1",
+			  "RXD1",
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
+			  "RGMII_MDIO",
+			  "RGMIO_MDC",
+			  /* Used by BT module */
+			  "CTS0",
+			  "RTS0",
+			  "TXD0",
+			  "RXD0",
+			  /* Used by Wifi */
+			  "SD1_CLK",
+			  "SD1_CMD",
+			  "SD1_DATA0",
+			  "SD1_DATA1",
+			  "SD1_DATA2",
+			  "SD1_DATA3",
+			  /* Shared with SPI flash */
+			  "PWM0_MISO",
+			  "PWM1_MOSI",
+			  "STATUS_LED_G_CLK",
+			  "SPIFLASH_CE_N",
+			  "SDA0",
+			  "SCL0",
+			  "RGMII_RXCLK",
+			  "RGMII_RXCTL",
+			  "RGMII_RXD0",
+			  "RGMII_RXD1",
+			  "RGMII_RXD2",
+			  "RGMII_RXD3",
+			  "RGMII_TXCLK",
+			  "RGMII_TXCTL",
+			  "RGMII_TXD0",
+			  "RGMII_TXD1",
+			  "RGMII_TXD2",
+			  "RGMII_TXD3";
+};
+
+&hdmi0 {
+	status = "okay";
+};
+
+&hdmi1 {
+	status = "okay";
+};
+
+&pixelvalve0 {
+	status = "okay";
+};
+
+&pixelvalve1 {
+	status = "okay";
+};
+
+&pixelvalve2 {
+	status = "okay";
+};
+
+&pixelvalve4 {
+	status = "okay";
+};
+
+&pm {
+	/delete-property/ system-power-controller;
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm1_0_gpio40 &pwm1_1_gpio41>;
+	status = "okay";
+};
+
+/* SDHCI is used to control the SDIO for wireless */
+&sdhci {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_gpio34>;
+	bus-width = <4>;
+	non-removable;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
+/* EMMC2 is used to drive the SD card */
+&emmc2 {
+	vqmmc-supply = <&sd_io_1v8_reg>;
+	vmmc-supply = <&sd_vcc_reg>;
+	broken-cd;
+	status = "okay";
+};
+
+&genet {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-rxid";
+	status = "okay";
+};
+
+&genet_mdio {
+	clock-frequency = <1950000>;
+
+	phy1: ethernet-phy@1 {
+		/* No PHY interrupt */
+		reg = <0x1>;
+	};
+};
+
+/* uart0 communicates with the BT module */
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ctsrts_gpio30 &uart0_gpio32>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <2000000>;
+		shutdown-gpios = <&expgpio 0 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* uart1 is mapped to the pin header */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_gpio14>;
+	status = "okay";
+};
+
+&vc4 {
+	status = "okay";
+};
+
+&vec {
+	status = "disabled";
+};
-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
