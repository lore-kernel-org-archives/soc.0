Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F9C19F2D
	for <soc@archiver.kernel.org>; Sat, 13 Aug 2022 22:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7F45C433B5; Sat, 13 Aug 2022 22:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F25C433D6;
	Sat, 13 Aug 2022 22:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660428187;
	bh=vRtqMu+Bq/xSY+s++5VgU3Q1BTmkW5DQywXkQfaAOQk=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=RwAFsPOAUEsxCH5ICykRtbSckjMim1Vbhu+DwWfE4I11FywkftsNStpn0SfeKwqOI
	 WwfVL7sRkZ4L5RP7OmaL9saYa3dDdnQwOSngaNzyhYfc154lLaBrgyXFi8VU+nlev0
	 n/2AETgMkqtJlSaBaS+jKdvtjyb1Mb6TBDblpCeN/UkxmO5Nzj8QayXkhx2K1yWPYi
	 TKOjPCEGFbovX07HePkzsaenSiZAGwzS4RpmemBD4ebZ1xDLZEzBxnr5SZrmmjuVxh
	 yjqSDSA7LXqoMC4l9d8JuNa0KcdBHnk4tIpaiHKtaHTYyJJc0/Wqr7GhoeCjPH772B
	 MVG5pjn6DAZ5A==
From: Sasha Levin <sashal@kernel.org>
To: stable-commits@vger.kernel.org,
	chunkeey@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: Patch "ARM: dts: BCM5301X: Add DT for Meraki MR26" has been added to the 5.15-stable tree
Date: Sat, 13 Aug 2022 18:03:04 -0400
Message-Id: <20220813220305.1978733-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

This is a note to let you know that I've just added the patch titled

    ARM: dts: BCM5301X: Add DT for Meraki MR26

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-dts-bcm5301x-add-dt-for-meraki-mr26.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.



commit b90f0afd7b682227db42ac35de9b086ba3a193f8
Author: Christian Lamparter <chunkeey@gmail.com>
Date:   Sat Jun 18 00:00:29 2022 +0200

    ARM: dts: BCM5301X: Add DT for Meraki MR26
    
    [ Upstream commit 935327a73553001f8d81375c76985d05f604507f ]
    
    Meraki MR26 is an EOL wireless access point featuring a
    PoE ethernet port and two dual-band 3x3 MIMO 802.11n
    radios and 1x1 dual-band WIFI dedicated to scanning.
    
    Thank you Amir for the unit and PSU.
    
    Hardware info:
    SOC   : Broadcom BCM53015A1KFEBG (dual-core Cortex-A9 CPU at 800 MHz)
    RAM   : SK Hynix Inc. H5TQ1G63EFR, 1 GBit DDR3 SDRAM = 128 MiB
    NAND  : Spansion S34ML01G100TF100, 1 GBit SLC NAND Flash = 128 MiB
    ETH   : 1 GBit Ethernet Port - PoE (TPS23754 PoE Interface)
    WIFI0 : Broadcom BCM43431KMLG, BCM43431 802.11 abgn (3x3:3)
    WIFI1 : Broadcom BCM43431KMLG, BCM43431 802.11 abgn (3x3:3)
    WIFI2 : Broadcom BCM43428 "Air Marshal" 802.11 abgn (1x1:1)
    BUTTON: One reset key behind a small hole next to the Ethernet Port
    LEDS  : One amber (fault), one white (indicator) LED, separate RGB-LED
    MISC  : Atmel AT24C64 8KiB EEPROM i2c
          : Ti INA219 26V, 12-bit, i2c output current/voltage/power monitor
    
    SERIAL:
          WARNING: The serial port needs a TTL/RS-232 3V3 level converter!
          The Serial setting is 115200-8-N-1. The board has a populated
          right angle 1x4 0.1" pinheader.
          The pinout is: VCC (next to J3, has the pin 1 indicator), RX, TX, GND.
    
    Odd stuff:
    
    - uboot does not support lzma compression, but gzip'd uImage/DTB work.
    - uboot claims to support FIT, but fails to pass the DTB to the kernel.
      Appending the dtb after the kernel image works.
    - RGB-controller is supported through an external userspace program.
    - The ubi partition contains a "board-config" volume. It stores the
      MAC Address (0x66 in binary) and Serial No. (0x7c alpha-numerical).
    - SoC's temperature sensor always reports that it is on fire.
      This causes the system to immediately shutdown! Looking at reported
      "418 degree Celsius" suggests that this sensor is not working.
    
    WIFI:
    b43 is able to initialize all three WIFIs @ 802.11bg.
    | b43-phy0: Broadcom 43431 WLAN found (core revision 29)
    | bcma-pci-bridge 0000:01:00.0: bus1: Switched to core: 0x812
    | b43-phy0: Found PHY: Analog 9, Type 7 (HT), Revision 1
    | b43-phy0: Found Radio: Manuf 0x17F, ID 0x2059, Revision 0, Version 1
    | b43-phy0 warning: 5 GHz band is unsupported on this PHY
    | b43-phy1: Broadcom 43431 WLAN found (core revision 29)
    | bcma-pci-bridge 0001:01:00.0: bus2: Switched to core: 0x812
    | b43-phy1: Found PHY: Analog 9, Type 7 (HT), Revision 1
    | b43-phy1: Found Radio: Manuf 0x17F, ID 0x2059, Revision 0, Version 1
    | b43-phy1 warning: 5 GHz band is unsupported on this PHY
    | b43-phy2: Broadcom 43228 WLAN found (core revision 30)
    | bcma-pci-bridge 0002:01:00.0: bus3: Switched to core: 0x812
    | b43-phy2: Found PHY: Analog 9, Type 4 (N), Revision 16
    | b43-phy2: Found Radio: Manuf 0x17F, ID 0x2057, Revision 9, Version 1
    | Broadcom 43xx driver loaded [ Features: NL ]
    
    Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
    Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 27ca1ca6e827..7a72fc636a7a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -127,6 +127,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm47094-luxul-xwr-3150-v1.dtb \
 	bcm47094-netgear-r8500.dtb \
 	bcm47094-phicomm-k3.dtb \
+	bcm53015-meraki-mr26.dtb \
 	bcm53016-meraki-mr32.dtb \
 	bcm94708.dtb \
 	bcm94709.dtb \
diff --git a/arch/arm/boot/dts/bcm53015-meraki-mr26.dts b/arch/arm/boot/dts/bcm53015-meraki-mr26.dts
new file mode 100644
index 000000000000..14f58033efeb
--- /dev/null
+++ b/arch/arm/boot/dts/bcm53015-meraki-mr26.dts
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Broadcom BCM470X / BCM5301X ARM platform code.
+ * DTS for Meraki MR26 / Codename: Venom
+ *
+ * Copyright (C) 2022 Christian Lamparter <chunkeey@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm4708.dtsi"
+#include "bcm5301x-nand-cs0-bch8.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "meraki,mr26", "brcm,bcm53015", "brcm,bcm4708";
+	model = "Meraki MR26";
+
+	memory@0 {
+		reg = <0x00000000 0x08000000>;
+		device_type = "memory";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_FAULT;
+			color = <LED_COLOR_ID_AMBER>;
+			gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+			panic-indicator;
+		};
+		led-1 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&chipcommon 12 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		key-restart {
+			label = "Reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&uart0 {
+	clock-frequency = <50000000>;
+	/delete-property/ clocks;
+};
+
+&uart1 {
+	status = "disabled";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "disabled";
+};
+&gmac2 {
+	status = "disabled";
+};
+&gmac3 {
+	status = "disabled";
+};
+
+&nandcs {
+	nand-ecc-algo = "hw";
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0 0x200000>;
+			read-only;
+		};
+
+		partition@200000 {
+			label = "u-boot-env";
+			reg = <0x200000 0x200000>;
+			/* empty */
+		};
+
+		partition@400000 {
+			label = "u-boot-backup";
+			reg = <0x400000 0x200000>;
+			/* empty */
+		};
+
+		partition@600000 {
+			label = "u-boot-env-backup";
+			reg = <0x600000 0x200000>;
+			/* empty */
+		};
+
+		partition@800000 {
+			label = "ubi";
+			reg = <0x800000 0x7780000>;
+		};
+	};
+};
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+			label = "poe";
+		};
+
+		port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+
+			fixed-link {
+				speed = <1000>;
+				duplex-full;
+			};
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinmux_i2c>;
+
+	clock-frequency = <100000>;
+
+	ina219@40 {
+		compatible = "ti,ina219"; /* PoE power */
+		reg = <0x40>;
+		shunt-resistor = <60000>; /* = 60 mOhms */
+	};
+
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+		pagesize = <32>;
+		read-only;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		/* it's empty */
+	};
+};
+
+&thermal {
+	status = "disabled";
+	/* does not work, reads 418 degree Celsius */
+};
