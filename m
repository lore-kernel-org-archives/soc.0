Return-Path: <SRS0=Jhuu=XZ=microchip.com=Horatiu.Vultur@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41934C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Jul 2022 19:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 270D5C341C7; Wed, 20 Jul 2022 19:46:14 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86C72C3411E;
	Wed, 20 Jul 2022 19:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86C72C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658346373; x=1689882373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZDGmeIC5wAWph6fx9zzOtxX1lbFu5oe4nSte9/EaAZI=;
  b=o5c6I7bLKrq4F5WFJ2QyZ/r4X2V09ldjC7e0wyFBbqa1chGWCJ5zSJyY
   kv946Pbg8DNWlX+e84+1CGjXWsWa7nY3eeb6DqOBAvbBON6uUJdNQJ89/
   Mkz2Wj2WAin6ve66wEvnNdch8ud+IYfQ45vb5StrMXeAH/HkyFWmBKHa7
   ZJBNOJ2DK8Tno5wWsq6kzewNlS1ex02fLwDKXflI1wW/oOrRKhmxsuC98
   yVx/SlVVkArrObEU9niXsg/5l6xddtzqmdKVHVaEYvaKPnC5QKGPUWzN+
   v9o9hUbHpOFQvfBnadCTJhGdribU23L+RWTbfjMPslwni2U8rbw5ructR
   w==;
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; 
   d="scan'208";a="165677162"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jul 2022 12:45:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Jul 2022 12:45:56 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 20 Jul 2022 12:45:53 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@microchip.com>, <arnd@arndb.de>, <olof@lixom.net>,
	<soc@kernel.org>, <UNGLinuxDriver@microchip.com>,
	<maxime.chevallier@bootlin.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>
Subject: [PATCH 2/2] ARM: dts: lan966x: add support for pcb8309
Date: Wed, 20 Jul 2022 21:49:04 +0200
Message-ID: <20220720194904.2025384-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220720194904.2025384-1-horatiu.vultur@microchip.com>
References: <20220720194904.2025384-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add basic support for pcb8309. It is similar with pcb8291 with one big
difference that is having 2 SFP cages. Therefore it has 4 network ports.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 arch/arm/boot/dts/Makefile            |   3 +-
 arch/arm/boot/dts/lan966x-pcb8309.dts | 189 ++++++++++++++++++++++++++
 2 files changed, 191 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/lan966x-pcb8309.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 184899808ee7..6a6166e3a405 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -772,7 +772,8 @@ dtb-$(CONFIG_SOC_IMXRT) += \
 dtb-$(CONFIG_SOC_LAN966) += \
 	lan966x-pcb8291.dtb \
 	lan966x-kontron-kswitch-d10-mmt-6g-2gs.dtb \
-	lan966x-kontron-kswitch-d10-mmt-8g.dtb
+	lan966x-kontron-kswitch-d10-mmt-8g.dtb \
+	lan966x-pcb8309.dtb
 dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-iot.dtb \
 	ls1021a-moxa-uc-8410a.dtb \
diff --git a/arch/arm/boot/dts/lan966x-pcb8309.dts b/arch/arm/boot/dts/lan966x-pcb8309.dts
new file mode 100644
index 000000000000..ef441195e8c1
--- /dev/null
+++ b/arch/arm/boot/dts/lan966x-pcb8309.dts
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * lan966x_pcb8309.dts - Device Tree file for PCB8309
+ */
+/dts-v1/;
+#include "lan966x.dtsi"
+#include "dt-bindings/phy/phy-lan966x-serdes.h"
+
+/ {
+	model = "Microchip EVB - LAN9662";
+	compatible = "microchip,lan9662-pcb8309", "microchip,lan9662", "microchip,lan966";
+
+	aliases {
+		serial0 = &usart3;
+		i2c102 = &i2c102;
+		i2c103 = &i2c103;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 56 GPIO_ACTIVE_LOW>;
+		priority = <200>;
+	};
+
+	i2c-mux {
+		compatible = "i2c-mux";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		mux-controls = <&mux>;
+		i2c-parent = <&i2c4>;
+
+		i2c102: i2c-sfp@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c103: i2c-sfp@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	mux: mux-controller {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+
+		mux-gpios = <&sgpio_out 11 0 GPIO_ACTIVE_HIGH>, /* p11b0 */
+			    <&sgpio_out 11 1 GPIO_ACTIVE_HIGH>; /* p11b1 */
+	};
+
+	sfp2: sfp2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c102>;
+		tx-disable-gpios = <&sgpio_out 10 0 GPIO_ACTIVE_LOW>;
+		los-gpios = <&sgpio_in  2 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in  2 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in  1 0 GPIO_ACTIVE_HIGH>;
+	};
+
+	sfp3: sfp3 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c103>;
+		tx-disable-gpios = <&sgpio_out 10 1 GPIO_ACTIVE_LOW>;
+		los-gpios = <&sgpio_in  3 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in  3 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in  1 1 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&flx3 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
+	status = "okay";
+
+	usart3: serial@200 {
+		pinctrl-0 = <&fc3_b_pins>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+};
+
+&flx4 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+};
+
+&gpio {
+	fc3_b_pins: fc3-b-pins {
+		/* RXD, TXD */
+		pins = "GPIO_52", "GPIO_53";
+		function = "fc3_b";
+	};
+
+	fc4_b_pins: fc4-b-pins {
+		/* SCL, SDA */
+		pins = "GPIO_57", "GPIO_58";
+		function = "fc4_b";
+	};
+
+	sgpio_a_pins: sgpio-a-pins {
+		/* SCK, D0, D1, LD */
+		pins = "GPIO_32", "GPIO_33", "GPIO_34", "GPIO_35";
+		function = "sgpio_a";
+	};
+};
+
+&i2c4 {
+	compatible = "microchip,sam9x60-i2c";
+	reg = <0x600 0x200>;
+	interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clocks = <&nic_clk>;
+	pinctrl-0 = <&fc4_b_pins>;
+	pinctrl-names = "default";
+	i2c-analog-filter;
+	i2c-digital-filter;
+	i2c-digital-filter-width-ns = <35>;
+	i2c-sda-hold-time-ns = <1500>;
+	status = "okay";
+};
+
+&mdio1 {
+	status = "okay";
+};
+
+&phy0 {
+	status = "okay";
+};
+
+&phy1 {
+	status = "okay";
+};
+
+&port0 {
+	status = "okay";
+	phy-handle = <&phy0>;
+	phy-mode = "gmii";
+	phys = <&serdes 0 CU(0)>;
+};
+
+&port1 {
+	status = "okay";
+	phy-handle = <&phy1>;
+	phy-mode = "gmii";
+	phys = <&serdes 1 CU(1)>;
+};
+
+&port2 {
+	status = "okay";
+	sfp = <&sfp2>;
+	managed = "in-band-status";
+	phy-mode = "sgmii";
+	phys = <&serdes 2 SERDES6G(0)>;
+};
+
+&port3 {
+	status = "okay";
+	sfp = <&sfp3>;
+	managed = "in-band-status";
+	phy-mode = "sgmii";
+	phys = <&serdes 3 SERDES6G(1)>;
+};
+
+&serdes {
+	status = "okay";
+};
+
+&sgpio {
+	status = "okay";
+	pinctrl-0 = <&sgpio_a_pins>;
+	pinctrl-names = "default";
+	microchip,sgpio-port-ranges = <0 3>, <8 11>;
+	gpio@0 {
+		ngpios = <64>;
+	};
+	gpio@1 {
+		ngpios = <64>;
+	};
+};
+
+&switch {
+	status = "okay";
+};
-- 
2.33.0

