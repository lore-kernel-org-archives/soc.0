Return-Path: <SRS0=SE/m=6T=gmail.com=musashino.open@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C0FC678DB
	for <soc@archiver.kernel.org>; Thu, 23 Feb 2023 13:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37854C4331F; Thu, 23 Feb 2023 13:35:07 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C401CC4339C;
	Thu, 23 Feb 2023 13:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C401CC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id nw10-20020a17090b254a00b00233d7314c1cso13016783pjb.5;
        Thu, 23 Feb 2023 05:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3ATVOfxCZA2ZkKdKSzd8AQB6yxO93GcARBKQZVggQA=;
        b=QdrgXbL1UTP9Gd7GXkTcXLPqYdp8s27T0EUDoLTDaUbnFFbJS+XxVXskYrF0bljG+Q
         bj2lEH6N1QC9HDNIoFnhqDKbjClOXGnEBjgZfs06TYm3c4u6FuZFj36JmLFLNrsBrPQ+
         Nn7OLtRD+LMsPl6QAGSGHB7OU+pMV+JMcoGZY5ZwgzbHxew0xeA2qfZE+9LLWzjDYNob
         7lq0wU0XnWhFF8BAh46jjK1PuJf6bTIDNhqC3z438iCHaf66FcRa4y54pOe7oZmEpOwC
         adFYBK3aknTvDGSxHuQW/7pVBejcIoaPH0OIr9kYnq2wOpAG20jS9U/8+KWcDrqqkWsk
         +9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3ATVOfxCZA2ZkKdKSzd8AQB6yxO93GcARBKQZVggQA=;
        b=hOtmtLP8ePkVgMFaC70CwoWFLfPK4ujjhFntcF04ffCmnUK9mYy8XmnzWENxXzWj6H
         k0wzCKI/qfyYBmu3KEIKXPUPMqXybGYe7qW9FgUavcAan9A0t76p+P+371npV1CaAmlK
         vdKGI+YFMclslfRIRJltoPPKnpAdLOjXI5MjuN8bu+Be5pht5ctgGqI19/1FxI9y4N43
         s9799DXCN9P4wBGSL2JQjd9UbSaBRIKS+OVNBCCRR5X1ZnBM/plckr+dbggRjMqKhO3V
         4e5hhynN6BuO7alMyico7gP1TwNo3whF+xss8SsmfmTzQVigypuPa3DWHy/9Mr2jwwjf
         MEMQ==
X-Gm-Message-State: AO0yUKWfAb9/+RkgonnD8nfWrHI4OXGG0COvYT7s36EvcHy7TYBQEUg+
	OEcfnbbE848cAiexMh7CZN+1HFogpF4E2A==
X-Google-Smtp-Source: AK7set8E1aYl6549lZKqTYnOUlU9MFkiNr106y0uI/UZSfPfiK9FJjQPBguRrhk8X0hfTp47tbPwUA==
X-Received: by 2002:a17:902:f546:b0:19a:8304:21eb with SMTP id h6-20020a170902f54600b0019a830421ebmr11036797plf.6.1677159304962;
        Thu, 23 Feb 2023 05:35:04 -0800 (PST)
Received: from localhost.localdomain (M014008005000.v4.enabler.ne.jp. [14.8.5.0])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709028c8d00b0019a96a6543esm6030254plo.184.2023.02.23.05.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:35:04 -0800 (PST)
From: INAGAKI Hiroshi <musashino.open@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: INAGAKI Hiroshi <musashino.open@gmail.com>,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2 appliance
Date: Thu, 23 Feb 2023 22:25:02 +0900
Message-Id: <20230223132502.2045-2-musashino.open@gmail.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230223132502.2045-1-musashino.open@gmail.com>
References: <20230223132502.2045-1-musashino.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree for Internet Initiative Japan Inc. (IIJ) SA-W2 appliance.

Specification:

- SoC         : Marvell Armada 380 88F6810
- RAM         : DDR3 256 MiB
- Flash       : SPI-NOR 32 MiB
- WLAN        : 2x Mini PCI-E slots
  - 2.4 GHz   : Atheros AR9287
  - 5 GHz     : Qualcomm Atheros QCA9880
- Ethernet    : 5x 10/100/1000 Mbps
  - Switch    : Marvell 88E6172
- LEDs        : 12x
- Buttons     : 1x
- Serial      : "CONSOLE" port (RJ-45, RS-232C level)
  - port      : ttyS0
  - settings  : 115200 8n1
  - assignment: 1:NC , 2:NC , 3:TXD, 4:GND,
                5:GND, 6:RXD, 7:NC , 8:NC
- USB         : 2x USB 2.0 Type-A
  - Hub       : SMCC USB2514B
- Power       : DC Input or PoE Input
  - DC        : 12 VDC, 3 A
  - PoE       : 802.3f
    - module  : Silvertel Ag9712-2BR
- Bootloader  : PMON2000 based
- Stock OS    : NetBSD based

Image header for stock bootloader:

0x00 - 0x07: Identifier      , ascii, "SEIL2015"
0x08 - 0x57: Copyright       , ascii
0x58 - 0x5b: Checksum (CRC32), hex
0x5c - 0x5f: Version Format  , hex  , 0x00000001
0x60 - 0x63: Major Version   , hex
0x64 - 0x67: Minor Version   , hex
0x68 - 0x87: Release Version , ascii
0x88 - 0x8b: Xor Key?        , hex  , 0x00000000 (if not encoded)
0x8c - 0x8f: Data Length     , hex

  example:

  Identifier     : "SEIL2015"
  Copyright      : "ARM OpenWrt Linux-5.15.94"
  Checksum       : 0xd575759f (calculated from kernel data)
  Version Format : 0x00000001
  Major Version  : 0x00000009
  Minor Version  : 0x00000063
  Release Version: "r22151-318ed84c8d"
  Xor Key?       : 0x00000000
  Data Length    : 0x35312d33 (length of kernel data)

Signed-off-by: INAGAKI Hiroshi <musashino.open@gmail.com>
---
 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/armada-380-iij-sa-w2.dts | 391 +++++++++++++++++++++
 2 files changed, 392 insertions(+)
 create mode 100644 arch/arm/boot/dts/armada-380-iij-sa-w2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe4152e5846..19119a3f4f1e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1523,6 +1523,7 @@ dtb-$(CONFIG_MACH_ARMADA_370) += \
 dtb-$(CONFIG_MACH_ARMADA_375) += \
 	armada-375-db.dtb
 dtb-$(CONFIG_MACH_ARMADA_38X) += \
+	armada-380-iij-sa-w2.dtb \
 	armada-381-netgear-gs110emx.dtb \
 	armada-382-rd-ac3x-48g4x2xl.dtb \
 	armada-385-atl-x530.dtb\
diff --git a/arch/arm/boot/dts/armada-380-iij-sa-w2.dts b/arch/arm/boot/dts/armada-380-iij-sa-w2.dts
new file mode 100644
index 000000000000..beeecbb0f5f8
--- /dev/null
+++ b/arch/arm/boot/dts/armada-380-iij-sa-w2.dts
@@ -0,0 +1,391 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree file for Internet Initiative Japan Inc. SA-W2 Appliance
+ *
+ * Copyright (c) 2023, INAGAKI Hiroshi <musashino.open@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "armada-380.dtsi"
+
+/ {
+	model = "IIJ SA-W2";
+	compatible = "iij,sa-w2", "marvell,armada380";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x10000000>; /* 256MB */
+	};
+
+	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xd0000000 0x100000
+			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000
+			  MBUS_ID(0x09, 0x19) 0 0xf1100000 0x10000
+			  MBUS_ID(0x09, 0x15) 0 0xf1110000 0x10000
+			  MBUS_ID(0x0c, 0x04) 0 0xf1200000 0x100000>;
+
+		pcie {
+			status = "okay";
+
+			pcie@1,0 {
+				status = "okay";
+
+				/* Atheros AR9287 */
+				wifi@0,0 {
+					compatible = "pci168c,002e";
+					reg = <0000 0 0 0 0>;
+				};
+			};
+
+			pcie@3,0 {
+				status = "okay";
+
+				/* Qualcomm Atheros QCA9880 */
+				wifi@0,0 {
+					compatible = "qcom,ath10k";
+					reg = <0000 0 0 0 0>;
+				};
+			};
+		};
+	};
+
+	keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmx_keys_pins>;
+
+		button-init {
+			label = "init";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpio0 18 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmx_leds_pins>;
+
+		led-0 {
+			gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN;
+			function-enumerator = <1>;
+		};
+
+		led-1 {
+			gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_WLAN;
+			function-enumerator = <1>;
+		};
+
+		led-2 {
+			gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+		};
+
+		led-3 {
+			gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+		};
+
+		led-4 {
+			label = "green:mobile";
+			gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led-5 {
+			label = "red:mobile";
+			gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led-6 {
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN;
+			function-enumerator = <0>;
+		};
+
+		led-7 {
+			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_WLAN;
+			function-enumerator = <0>;
+		};
+
+		led-8 {
+			gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_POWER;
+		};
+
+		led-9 {
+			gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_POWER;
+		};
+
+		led-10 {
+			gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_USB;
+			function-enumerator = <1>;
+			linux,default-trigger = "usbport";
+			trigger-sources = <&hub_port2>;
+		};
+
+		led-11 {
+			gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_USB;
+			function-enumerator = <0>;
+			linux,default-trigger = "usbport";
+			trigger-sources = <&hub_port1>;
+		};
+	};
+
+	regulator-vbus-usb0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus-usb0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 20 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	regulator-vbus-usb1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus-usb1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+	status = "okay";
+};
+
+&pinctrl {
+	pmx_usb_pins: usb-pins {
+		marvell,pins = "mpp2",		 /* smsc usb2514b reset */
+			       "mpp48", "mpp49", /* port over current */
+			       "mpp52", "mpp53"; /* port vbus */
+		marvell,function = "gpio";
+	};
+
+	pmx_keys_pins: keys-pins {
+		marvell,pins = "mpp18";
+		marvell,function = "gpio";
+	};
+
+	pmx_leds_pins: leds-pins {
+		marvell,pins = "mpp19", "mpp20", "mpp33", "mpp34", "mpp35",
+			       "mpp36", "mpp44", "mpp45", "mpp46", "mpp47",
+			       "mpp54", "mpp55";
+		marvell,function = "gpio";
+	};
+};
+
+&gpio0 {
+	usb-hub-reset {
+		gpio-hog;
+		gpios = <2 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+};
+
+&usb0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmx_usb_pins>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* SMSC USB2514B */
+	hub@1 {
+		compatible = "usb424,2514";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hub_port1: port@1 {
+			reg = <1>;
+			#trigger-source-cells = <0>;
+		};
+
+		hub_port2: port@2 {
+			reg = <2>;
+			#trigger-source-cells = <0>;
+		};
+	};
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
+&eth1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ge1_rgmii_pins>;
+	status = "okay";
+
+	phy-connection-type = "rgmii";
+	buffer-manager = <&bm>;
+	bm,pool-long = <2>;
+	bm,pool-short = <3>;
+
+	nvmem-cells = <&macaddr_bdinfo_6>;
+	nvmem-cell-names = "mac-address";
+	mac-address-increment = <1>;
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mdio_pins>;
+	status = "okay";
+
+	/* Marvell 88E6172 */
+	switch@0 {
+		compatible = "marvell,mv88e6085";
+		reg = <0x0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				label = "ge1_0";
+			};
+
+			port@1 {
+				reg = <1>;
+				label = "ge1_1";
+			};
+
+			port@2 {
+				reg = <2>;
+				label = "ge1_2";
+			};
+
+			port@3 {
+				reg = <3>;
+				label = "ge1_3";
+			};
+
+			port@4 {
+				reg = <4>;
+				label = "ge0";
+				nvmem-cells = <&macaddr_bdinfo_6>;
+				nvmem-cell-names = "mac-address";
+			};
+
+			/*
+			 * eth0 is connected to port5 for WAN connection
+			 * on port4 ("GE0")
+			 */
+
+			port@6 {
+				reg = <6>;
+				label = "cpu";
+				ethernet = <&eth1>;
+				phy-connection-type = "rgmii-id";
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+		};
+	};
+};
+
+&rtc {
+	status = "disabled";
+};
+
+&spi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x0 0x100000>;
+				label = "bootloader";
+				read-only;
+			};
+
+			partition@100000 {
+				reg = <0x100000 0x10000>;
+				label = "bootloader-env";
+				read-only;
+			};
+
+			partition@110000 {
+				compatible = "nvmem-cells";
+				reg = <0x110000 0xf0000>;
+				label = "board-info";
+				read-only;
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				macaddr_bdinfo_6: macaddr@6 {
+					reg = <0x6 0x6>;
+				};
+			};
+
+			partition@200000 {
+				reg = <0x200000 0xf00000>;
+				label = "firmware";
+			};
+
+			partition@1100000 {
+				reg = <0x1100000 0xf00000>;
+				label = "rescue";
+				read-only;
+			};
+		};
+	};
+};
-- 
2.25.1

