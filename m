Return-Path: <SRS0=MDPj=AD=gmail.com=mibodhi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043A0C77B70
	for <soc@archiver.kernel.org>; Wed, 12 Apr 2023 02:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B08F4C433EF; Wed, 12 Apr 2023 02:58:23 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66813C433D2;
	Wed, 12 Apr 2023 02:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66813C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1842cddca49so12456624fac.1;
        Tue, 11 Apr 2023 19:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681268301; x=1683860301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGP7yesw3xMDA0poEB6p9zhj3IsOIFA2Udu4LUARAfY=;
        b=Ltp+bRW1Z1tL5kBx6ctUzi28cURIx6nIh63O8TSXL+Tj3byp1Ko6MbrSXjvtwhn8cq
         E/pY6cp0AzIUaJPDPLNCl68Zwpw6R9JW0JSXamGZovzEdnhaqQQVPZm0ScNpV8UYBfDd
         Mx8tzT84rQp05HvEGLyuu68GOZ5ieuuaGYhUDuRL73tSrewoawaSpEQ4X+Gu0QyImL8Y
         lRGFnyhuJYKvuSttVHGK+BKrNmyxW8Yd+q6WR7FCyJ4qIlBI3KCtQDoZspaY8wHgMNw1
         KqJxXiNZiicFdamCxPAeGq/upv8kqja8csWbKYiwVRjlVcescd2mrfIkNpcGv1bkCCgO
         Jwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681268301; x=1683860301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGP7yesw3xMDA0poEB6p9zhj3IsOIFA2Udu4LUARAfY=;
        b=sXUbMDXD+g4S4LLvIbLY2oeWyk/SxK73DVJi+sUyF9yOUYjK2ZmCcrnM6kwLOKXj2j
         zKXzmwtwZl/q0WHqBq2TMAkwb9/tf9bF79kcROKuw+45uJ20SnYT+B+1XGqtJ+H+kdMj
         JYVciYa72vFhyvA8n699L/LuIz5six+6OcD/5wTWRe++GVibXaNrtZdOt2bonYnm4Ffq
         WORjVULaRoilXEF7sf8qXlRUawur6eoYMjGioAygR7Zz+m5LGMzRgmlFqtPOl/uQhG9n
         VF7bNdqDpjQAjbYgnOYsIe/BIyCEJcXOqeTliPmFi34qwosGHcSrUaOksWsWsE69K/F7
         Hz+Q==
X-Gm-Message-State: AAQBX9eh0KitU3ZsaMS2yDyZl4CepwFzir6+jEs5LDAqMVPFcr+dTrcw
	1WqILKUgxnG8M5QzMcqIWMc=
X-Google-Smtp-Source: AKy350aSgcog1w8V5ob5y6xmkf66PbHFyRuTyLmHbowtBnQLR9V6kUTxQ4I3is+j78OHpOwTr4qQ0A==
X-Received: by 2002:a05:6870:51f:b0:17a:d9b2:ab70 with SMTP id j31-20020a056870051f00b0017ad9b2ab70mr10121185oao.7.1681268301412;
        Tue, 11 Apr 2023 19:58:21 -0700 (PDT)
Received: from localhost.localdomain (76-229-100-169.lightspeed.irvnca.sbcglobal.net. [76.229.100.169])
        by smtp.gmail.com with ESMTPSA id b124-20020aca3482000000b0038bc0cb5d52sm3013293oia.9.2023.04.11.19.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 19:58:21 -0700 (PDT)
From: Tony Dinh <mibodhi@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: Tony Dinh <mibodhi@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: [PATCH v2 2/2] ARM: dts: mvebu: add Thecus N2350 board DTS
Date: Tue, 11 Apr 2023 19:57:36 -0700
Message-Id: <20230412025737.20280-3-mibodhi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230412025737.20280-1-mibodhi@gmail.com>
References: <20230412025737.20280-1-mibodhi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Thecus N2350 board DTS and Makefile.

Signed-off-by: Tony Dinh <mibodhi@gmail.com>
---

Changes in v2:
- Fix various DT bindings conformance (too numerous to list)
- Vendor prefix is not necessary, so remove it.

 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/armada-385-thecus-n2350.dts | 432 ++++++++++++++++++
 2 files changed, 433 insertions(+)
 create mode 100644 arch/arm/boot/dts/armada-385-thecus-n2350.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe4152e5846..cc856a57e58d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1535,6 +1535,7 @@ dtb-$(CONFIG_MACH_ARMADA_38X) += \
 	armada-385-linksys-rango.dtb \
 	armada-385-linksys-shelby.dtb \
 	armada-385-synology-ds116.dtb \
+	armada-385-thecus-n2350.dtb \
 	armada-385-turris-omnia.dtb \
 	armada-388-clearfog.dtb \
 	armada-388-clearfog-base.dtb \
diff --git a/arch/arm/boot/dts/armada-385-thecus-n2350.dts b/arch/arm/boot/dts/armada-385-thecus-n2350.dts
new file mode 100644
index 000000000000..54f1eab770a4
--- /dev/null
+++ b/arch/arm/boot/dts/armada-385-thecus-n2350.dts
@@ -0,0 +1,432 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Device Tree file for Thecus N2350 board
+ *
+ * Copyright (C) 2018-2023 Tony Dinh <mibodhi@gmail.com>
+ * Copyright (C) 2018 Manuel Jung <manuel.jung@hotmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "armada-385.dtsi"
+
+/ {
+	model = "Thecus N2350";
+	compatible = "marvell,armada385";
+
+	aliases {
+		ethernet0 = &eth0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x40000000>; /* 1GB */
+	};
+
+	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
+			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000
+			  MBUS_ID(0x09, 0x19) 0 0xf1100000 0x10000
+			  MBUS_ID(0x09, 0x15) 0 0xf1110000 0x10000
+			  MBUS_ID(0x0c, 0x04) 0 0xf1200000 0x100000>;
+
+	};
+
+	usb3_0_phy: usb-phy {
+		compatible = "usb-nop-xceiv";
+		vcc-supply = <&usb3_0_power>;
+		 #phy-cells = <0>;
+	};
+
+	usb3_1_phy: usb-phy {
+		compatible = "usb-nop-xceiv";
+		vcc-supply = <&usb3_1_power>;
+		 #phy-cells = <0>;
+	};
+
+	keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&pmx_power_button &pmx_copy_button &pmx_reset_button>;
+		pinctrl-names = "default";
+
+		button-1 {
+			label = "Power Button";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
+		};
+
+		button-2 {
+			label = "Copy Button";
+			linux,code = <KEY_COPY>;
+			gpios = <&gpio1 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		button-3 {
+			label = "Reset Button";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&pmx_sata1_white_led
+				&pmx_sata1_red_led
+				&pmx_sata2_white_led
+				&pmx_sata2_red_led
+				&pmx_sys_white_led
+				&pmx_sys_red_led
+				&pmx_pwr_blue_led
+				&pmx_pwr_red_led
+				&pmx_usb_white_led
+				&pmx_usb_red_led>;
+
+		pinctrl-names = "default";
+
+		led-1 {
+			label = "n2350:white:sata1";
+			gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			label = "n2350:red:sata1";
+			gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-3 {
+			label = "n2350:white:sata2";
+			gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-4 {
+			label = "n2350:red:sata2";
+			gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-5 {
+			label = "n2350:white:sys";
+			gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		led-6 {
+			label = "n2350:red:sys";
+			gpios = <&gpio0 15 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-7 {
+			label = "n2350:blue:pwr";
+			gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-8 {
+			label = "n2350:red:pwr";
+			gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-9 {
+			label = "n2350:white:usb";
+			gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-10 {
+			label = "n2350:red:usb";
+			gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	usb3_0_power: v5-vbus0 {
+		compatible = "regulator-fixed";
+		regulator-name = "USB3_0_Power";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&gpio0 21 GPIO_ACTIVE_HIGH>;
+	};
+
+	usb3_1_power: v5-vbus1 {
+		compatible = "regulator-fixed";
+		regulator-name = "USB3_1_Power";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&gpio0 24 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_sata0: pwr-sata0 {
+		compatible = "regulator-fixed";
+		regulator-name = "pwr_en_sata0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_5v_sata0: v5-sata0 {
+		compatible = "regulator-fixed";
+		regulator-name = "v5.0-sata0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_sata0>;
+	};
+
+	reg_12v_sata0: v12-sata0 {
+		compatible = "regulator-fixed";
+		regulator-name = "v12.0-sata0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		vin-supply = <&reg_sata0>;
+	};
+
+	reg_sata1: pwr-sata0 {
+		regulator-name = "pwr_en_sata1";
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_5v_sata1: v5-sata1 {
+		compatible = "regulator-fixed";
+		regulator-name = "v5.0-sata1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_sata1>;
+	};
+
+	reg_12v_sata1: v12-sata1 {
+		compatible = "regulator-fixed";
+		regulator-name = "v12.0-sata1";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		vin-supply = <&reg_sata1>;
+	};
+
+	gpio-poweroff {
+		compatible = "gpio-poweroff";
+		pinctrl-0 = <&pmx_pwr_off>;
+		pinctrl-names = "default";
+		gpios = <&gpio1 22 GPIO_ACTIVE_HIGH>;
+	};
+
+};
+
+&ahci0 {
+	status = "okay";
+};
+
+&bm {
+	status = "okay";
+};
+
+&bm_bppi {
+	status = "okay";
+};
+
+&eth0 {
+	status = "okay";
+	phy = <&phy0>;
+	phy-mode = "sgmii";
+	buffer-manager = <&bm>;
+	bm,pool-long = <0>;
+	bm,pool-short = <1>;
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
+&mdio {
+	phy0: ethernet-phy@0 {
+		reg = <1>;
+	};
+};
+
+&nand_controller {
+	status = "okay";
+
+	nand@0 {
+		status = "okay";
+		reg = <0>;
+		label = "pxa3xx_nand-0";
+		nand-rb = <0>;
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "rootfs";
+				reg = <0x00000000 0x20000000>;
+			};
+
+		};
+	};
+};
+
+&pciec {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+
+	pmx_power_button: pmx-power-button {
+		marvell,pins = "mpp49";
+		marvell,function = "gpio";
+	};
+
+	pmx_copy_button: pmx-copy-button {
+		marvell,pins = "mpp52";
+		marvell,function = "gpio";
+	};
+
+	pmx_reset_button: pmx-reset-button {
+		marvell,pins = "mpp50";
+		marvell,function = "gpio";
+	};
+
+	pmx_sata1_white_led: pmx-sata1-white-led {
+		marvell,pins = "mpp20";
+		marvell,function = "gpio";
+	};
+
+	pmx_sata1_red_led: pmx-sata1-red-led {
+		marvell,pins = "mpp46";
+		marvell,function = "gpio";
+	};
+
+	pmx_sata2_white_led: pmx-sata2-white-led {
+		marvell,pins = "mpp19";
+		marvell,function = "gpio";
+	};
+
+	pmx_sata2_red_led: pmx-sata2-red-led {
+		marvell,pins = "mpp47";
+		marvell,function = "gpio";
+	};
+
+	pmx_sys_white_led: pmx-sys-white-led {
+		marvell,pins = "mpp14";
+		marvell,function = "gpio";
+	};
+
+	pmx_sys_red_led: pmx-sys-red-led {
+		marvell,pins = "mpp15";
+		marvell,function = "gpio";
+	};
+
+	pmx_buzzer: pmx-buzzer {
+		marvell,pins = "mpp51";
+		marvell,function = "gpio";
+	};
+
+	pmx_pwr_off: pmx-pwr-off {
+		marvell,pins = "mpp54";
+		marvell,function = "gpio";
+	};
+
+	pmx_pwr_blue_led: pmx-pwr-blue-led {
+		marvell,pins = "mpp43";
+		marvell,function = "gpio";
+	};
+
+	pmx_pwr_red_led: pmx-pwr-red-led {
+		marvell,pins = "mpp18";
+		marvell,function = "gpio";
+	};
+
+	pmx_usb_white_led: pmx-usb-white-led {
+		marvell,pins = "mpp16";
+		marvell,function = "gpio";
+	};
+
+	pmx_usb_red_led: pmx-usb-red-led {
+		marvell,pins = "mpp17";
+		marvell,function = "gpio";
+	};
+};
+
+&sdhci {
+	broken-cd;
+	wp-inverted;
+	bus-width = <8>;
+	status = "okay";
+	no-1-8-v;
+};
+
+&spi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins>;
+	status = "okay";
+
+	/* spi: 4M Flash Macronix MX25L3205D */
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+
+		spi-max-frequency = <108000000>;
+		spi-cpha;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x00000000 0x00100000>;
+		};
+
+		partition@100000 {
+			label = "u-boot-env";
+			reg = <0x00100000 0x00010000>;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
-- 
2.30.2

