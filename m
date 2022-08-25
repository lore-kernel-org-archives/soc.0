Return-Path: <SRS0=GW7t=Y5=microchip.com=Horatiu.Vultur@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FE3C28D13
	for <soc@archiver.kernel.org>; Thu, 25 Aug 2022 06:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B20D3C433C1; Thu, 25 Aug 2022 06:47:40 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AE9AC433D6;
	Thu, 25 Aug 2022 06:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8AE9AC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661410058; x=1692946058;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vD6uljUqlEWQf+eppEAvBEV9mc5Pchu0nk5o3fSUuRQ=;
  b=JGzgRe1OE1ssiXpGhX9NFOaDAHKLMgH42hyjdqeU6VxKUX6zCL5JPRM2
   H6gEB1vfsxVIDB2z6zrjpwxLHrDmAuO+1KEIogCxVkqZImxWdXZMRfAo9
   woHmPIuI2a32tVgwyXvskeLF0+Rj8w09q6rD5La/xkiKv5ZnVjkKTJcGk
   Xkz/LV3KphtmUhLJSK8C++KZIzqfE9koAdZ69dAfxxTysCplCJu0F/Yzf
   B7qkFMMdszoHNBEVZ7+rc5+IsYzJ84fwr6ToqNpwsb5/2QRoW7KSCfG9h
   vXf3qVkb482uHOBoNasxppFgbIqPUoIW6++s4ALzMi/WGQzuqo8Xjuie3
   A==;
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; 
   d="scan'208";a="187978450"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 23:47:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 23:47:31 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Wed, 24 Aug 2022 23:47:28 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <claudiu.beznea@microchip.com>,
	<nicolas.ferre@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<maxime.chevallier@bootlin.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>
Subject: [PATCH v4] ARM: dts: lan966x: add support for pcb8290
Date: Thu, 25 Aug 2022 08:51:35 +0200
Message-ID: <20220825065135.1075049-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add basic support for pcb8290. It has 2 lan8814 phys(each phy is a
quad-port) on the external MDIO bus and no SFP ports.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
v3->v4:
- add missing Copyright to dts file

v2->v3:
- update coma-mode-gpios, set them to OPEN_DRAIN

v1->v2:
- add comments for pps_out_pins and ptp_ext_pins pins
- fix commit message.
---
 arch/arm/boot/dts/Makefile            |   1 +
 arch/arm/boot/dts/lan966x-pcb8290.dts | 175 ++++++++++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 arch/arm/boot/dts/lan966x-pcb8290.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 05d8aef6e5d2..595e870750cd 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -788,6 +788,7 @@ dtb-$(CONFIG_SOC_IMXRT) += \
 dtb-$(CONFIG_SOC_LAN966) += \
 	lan966x-kontron-kswitch-d10-mmt-6g-2gs.dtb \
 	lan966x-kontron-kswitch-d10-mmt-8g.dtb \
+	lan966x-pcb8290.dtb \
 	lan966x-pcb8291.dtb \
 	lan966x-pcb8309.dtb
 dtb-$(CONFIG_SOC_LS1021A) += \
diff --git a/arch/arm/boot/dts/lan966x-pcb8290.dts b/arch/arm/boot/dts/lan966x-pcb8290.dts
new file mode 100644
index 000000000000..2e091180a64c
--- /dev/null
+++ b/arch/arm/boot/dts/lan966x-pcb8290.dts
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * lan966x-pcb8290.dts - Device Tree file for LAN966X-PCB8290 board
+ *
+ * Copyright (C) 2022 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Horatiu Vultur <horatiu.vultur@microchip.com>
+ */
+/dts-v1/;
+#include "lan966x.dtsi"
+#include "dt-bindings/phy/phy-lan966x-serdes.h"
+
+/ {
+	model = "Microchip EVB LAN9668";
+	compatible = "microchip,lan9668-pcb8290", "microchip,lan9668", "microchip,lan966";
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 56 GPIO_ACTIVE_LOW>;
+		priority = <200>;
+	};
+};
+
+&gpio {
+	miim_a_pins: mdio-pins {
+		/* MDC, MDIO */
+		pins =  "GPIO_28", "GPIO_29";
+		function = "miim_a";
+	};
+
+	pps_out_pins: pps-out-pins {
+		/* 1pps output */
+		pins = "GPIO_38";
+		function = "ptpsync_3";
+	};
+
+	ptp_ext_pins: ptp-ext-pins {
+		/* 1pps input */
+		pins = "GPIO_35";
+		function = "ptpsync_0";
+	};
+
+	udc_pins: ucd-pins {
+		/* VBUS_DET B */
+		pins = "GPIO_8";
+		function = "usb_slave_b";
+	};
+};
+
+&mdio0 {
+	pinctrl-0 = <&miim_a_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ext_phy0: ethernet-phy@7 {
+		reg = <7>;
+		coma-mode-gpios = <&gpio 60 GPIO_OPEN_DRAIN>;
+	};
+
+	ext_phy1: ethernet-phy@8 {
+		reg = <8>;
+		coma-mode-gpios = <&gpio 60 GPIO_OPEN_DRAIN>;
+	};
+
+	ext_phy2: ethernet-phy@9 {
+		reg = <9>;
+		coma-mode-gpios = <&gpio 60 GPIO_OPEN_DRAIN>;
+	};
+
+	ext_phy3: ethernet-phy@10 {
+		reg = <10>;
+		coma-mode-gpios = <&gpio 60 GPIO_OPEN_DRAIN>;
+	};
+
+	ext_phy4: ethernet-phy@15 {
+		reg = <15>;
+		coma-mode-gpios = <&gpio 60 GPIO_OPEN_DRAIN>;
+	};
+
+	ext_phy5: ethernet-phy@16 {
+		reg = <16>;
+		coma-mode-gpios = <&gpio 60 GPIO_OPEN_DRAIN>;
+	};
+
+	ext_phy6: ethernet-phy@17 {
+		reg = <17>;
+		coma-mode-gpios = <&gpio 60 GPIO_OPEN_DRAIN>;
+	};
+
+	ext_phy7: ethernet-phy@18 {
+		reg = <18>;
+		coma-mode-gpios = <&gpio 60 GPIO_OPEN_DRAIN>;
+	};
+};
+
+&port0 {
+	reg = <2>;
+	phy-handle = <&ext_phy2>;
+	phy-mode = "qsgmii";
+	phys = <&serdes 0 SERDES6G(1)>;
+	status = "okay";
+};
+
+&port1 {
+	reg = <3>;
+	phy-handle = <&ext_phy3>;
+	phy-mode = "qsgmii";
+	phys = <&serdes 1 SERDES6G(1)>;
+	status = "okay";
+};
+
+&port2 {
+	reg = <0>;
+	phy-handle = <&ext_phy0>;
+	phy-mode = "qsgmii";
+	phys = <&serdes 2 SERDES6G(1)>;
+	status = "okay";
+};
+
+&port3 {
+	reg = <1>;
+	phy-handle = <&ext_phy1>;
+	phy-mode = "qsgmii";
+	phys = <&serdes 3 SERDES6G(1)>;
+	status = "okay";
+};
+
+&port4 {
+	reg = <6>;
+	phy-handle = <&ext_phy6>;
+	phy-mode = "qsgmii";
+	phys = <&serdes 4 SERDES6G(2)>;
+	status = "okay";
+};
+
+&port5 {
+	reg = <7>;
+	phy-handle = <&ext_phy7>;
+	phy-mode = "qsgmii";
+	phys = <&serdes 5 SERDES6G(2)>;
+	status = "okay";
+};
+
+&port6 {
+	reg = <4>;
+	phy-handle = <&ext_phy4>;
+	phy-mode = "qsgmii";
+	phys = <&serdes 6 SERDES6G(2)>;
+	status = "okay";
+};
+
+&port7 {
+	reg = <5>;
+	phy-handle = <&ext_phy5>;
+	phy-mode = "qsgmii";
+	phys = <&serdes 7 SERDES6G(2)>;
+	status = "okay";
+};
+
+&serdes {
+	status = "okay";
+};
+
+&switch {
+	pinctrl-0 = <&pps_out_pins>, <&ptp_ext_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&udc {
+	pinctrl-0 = <&udc_pins>;
+	pinctrl-names = "default";
+	atmel,vbus-gpio = <&gpio 8 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
-- 
2.33.0

