Return-Path: <SRS0=sXtS=U7=gmail.com=takayoshi.shimamoto.360@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31CDC433FE
	for <soc@archiver.kernel.org>; Thu, 21 Apr 2022 15:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73C63C385B5; Thu, 21 Apr 2022 15:11:12 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF4B0C385A1;
	Thu, 21 Apr 2022 15:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF4B0C385A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id iq10so1460272pjb.0;
        Thu, 21 Apr 2022 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3FK8dTuLoBtzcuEmwJHQddp5IKeSSjXBglcT/dgsgJE=;
        b=BOgNinI6yGyyXVu0C94MJIr88RLyuV9PKO8smiv1WF5fPEqDIKzxUSGuFSboxOKmsR
         WuTICmD6/Hf50TfPfoZFoK2APZrms83bQ9P9IjobwL5nbPpCXZA3cdfj3wNPaGa/HQTz
         G3GcUgJ1X47ECyLqlZgcsG8b8L/5+QKQpVbWqTPt/jk0WW+hYOxrin4CtnE7AWGyT1mD
         1+QNCmHHOnRSQ8q3o89ViJu1us0X0GTaL2SoMkyJp5MshfrqgN4JRUprlEp+KMTfsL0E
         Q7RXWn2JVR6RCZNPzpiybwjcYZICXz6Y1dndxeFawnpRiO8UseJbsfku8jJGTqjvVFgP
         xJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3FK8dTuLoBtzcuEmwJHQddp5IKeSSjXBglcT/dgsgJE=;
        b=WYI/UHn09tObTw8CZkhjrf35LjKyyMGu6HwZdAD7mJQ+flzudtLmt9HhXILucSIbO5
         PsaS+hYTaoigk1LiuABot9XMmfUbuCxNJllcPSf4oyiCjtGuLSfe3Tcr+2Gtc7pB9INM
         WL5IA8QUmgOin8SNh+Gb/hpi3Sb55ckgewhsPhAI9DaqulLXP0sUb71JuuwQwuhivfSM
         hB9LDDSn9mp9Ob9oTN6sg8w0s+2V36qM0dT3XtNBDjJ8OY6jxiPD1i+4YEQDzY9n4ftE
         I9wkgtQ6tu+Al8vkUD3YdI9K9XLZaX3MtLETQFmQSgB10Zoz+fmCR++KM69500zSON+z
         Eokg==
X-Gm-Message-State: AOAM532VhFtgmRS+XouZZeLRiJ5J3IqC2F/Q52DMc04hVT+cGjl6vLrU
	ItB5e7cQft5YdVs0zMJOW7c=
X-Google-Smtp-Source: ABdhPJyODH2AISsaZ+PqtXq3kLm8nnNbMGuEcP7ZbCBev1zsTuFGuG863k/Bp9yECP4esT7A9c5asw==
X-Received: by 2002:a17:90b:4d81:b0:1d2:8525:5f1c with SMTP id oj1-20020a17090b4d8100b001d285255f1cmr113711pjb.27.1650553870325;
        Thu, 21 Apr 2022 08:11:10 -0700 (PDT)
Received: from V2.localdomain (M106073234000.v4.enabler.ne.jp. [106.73.234.0])
        by smtp.gmail.com with ESMTPSA id 16-20020a621410000000b0050aca5f79f5sm6875704pfu.97.2022.04.21.08.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 08:11:10 -0700 (PDT)
From: SHIMAMOTO Takayoshi <takayoshi.shimamoto.360@gmail.com>
To: takayoshi.shimamoto.360@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: BCM5301X: Add DT for WZR-1166DHP,DHP2
Date: Fri, 22 Apr 2022 00:10:54 +0900
Message-Id: <20220421151055.6851-1-takayoshi.shimamoto.360@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

  Buffalo WZR-1166DHP/WZR-1166DHP2  wireless router with

    - BCM4708A0
    - 128MiB NAND flash
    - 2T2R 11ac/a/b/g/n Wi-Fi
    - 4x 10/100/1000M ethernet switch
    - 1x USB 3.0 port

  WZR-1166DHP and WZR-1166DHP2 have different memory capacity.

  WZR-1166DHP
    - 512 MiB DDR2 SDRAM

  WZR-1166DHP2
    - 256 MiB DDR2 SDRAM

  These hardware components are very similar to the WZR-1750DHP
   except for the number of antennas.

Signed-off-by: SHIMAMOTO Takayoshi <takayoshi.shimamoto.360@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |   2 +
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 192 ++++++++++++++++++
 .../boot/dts/bcm4708-buffalo-wzr-1166dhp.dts  |  26 +++
 .../boot/dts/bcm4708-buffalo-wzr-1166dhp2.dts |  26 +++
 4 files changed, 246 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi
 create mode 100644 arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp.dts
 create mode 100644 arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7c16f8a2b738..8611d9b38d3b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -103,6 +103,8 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm4708-asus-rt-ac56u.dtb \
 	bcm4708-asus-rt-ac68u.dtb \
 	bcm4708-buffalo-wzr-1750dhp.dtb \
+	bcm4708-buffalo-wzr-1166dhp.dtb \
+	bcm4708-buffalo-wzr-1166dhp2.dtb \
 	bcm4708-linksys-ea6300-v1.dtb \
 	bcm4708-linksys-ea6500-v2.dtb \
 	bcm4708-luxul-xap-1510.dtb \
diff --git a/arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi
new file mode 100644
index 000000000000..d659e409a17e
--- /dev/null
+++ b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Broadcom BCM470X / BCM5301X ARM platform code.
+ * DTS for Buffalo WZR-1166DHP and WZR-1166DHP2
+ *
+ * Copyright (C) 2014 Rafał Miłecki <zajec5@gmail.com>
+ * Copyright (C) 2022 SHIMAMOTO Takayoshi <takayoshi.shimamoto.360@gmail.com>
+ */
+
+
+#include "bcm4708.dtsi"
+#include "bcm5301x-nand-cs0-bch8.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	spi {
+		compatible = "spi-gpio";
+		num-chipselects = <1>;
+		gpio-sck = <&chipcommon 7 0>;
+		gpio-mosi = <&chipcommon 4 0>;
+		cs-gpios = <&chipcommon 6 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hc595: gpio_spi@0 {
+			compatible = "fairchild,74hc595";
+			reg = <0>;
+			registers-number = <1>;
+			spi-max-frequency = <100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		usb {
+			/* label = "bcm53xx:blue:usb"; */
+			function = LED_FUNCTION_USB;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&hc595 0 GPIO_ACTIVE_HIGH>;
+			trigger-sources = <&ohci_port1>, <&ehci_port1>,
+					  <&xhci_port1>, <&ohci_port2>,
+					  <&ehci_port2>;
+			linux,default-trigger = "usbport";
+		};
+
+		power0 {
+			/* label = "bcm53xx:red:power"; */
+			function = LED_FUNCTION_FAULT;
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&hc595 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		power1 {
+			/* label = "bcm53xx:white:power"; */
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&hc595 2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		router0 {
+			/*  label = "bcm53xx:blue:router"; */
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&hc595 3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		router1 {
+			/* label = "bcm53xx:amber:router"; */
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_AMBER>;
+			gpios = <&hc595 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		wan {
+			/* label = "bcm53xx:blue:wan"; */
+			function = LED_FUNCTION_WAN;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&hc595 5 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		wireless0 {
+			/* label = "bcm53xx:blue:wireless"; */
+			function = LED_FUNCTION_WLAN;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&hc595 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		wireless1 {
+			/* label = "bcm53xx:amber:wireless"; */
+			function = LED_FUNCTION_WLAN;
+			color = <LED_COLOR_ID_AMBER>;
+			gpios = <&hc595 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		restart {
+			label = "Reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
+		};
+
+		aoss {
+			label = "AOSS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&chipcommon 12 GPIO_ACTIVE_LOW>;
+		};
+
+		/* Commit mode set by switch? */
+		mode {
+			label = "Mode";
+			linux,code = <KEY_SETUP>;
+			gpios = <&chipcommon 13 GPIO_ACTIVE_LOW>;
+		};
+
+		/* Switch: AP mode */
+		sw_ap {
+			label = "AP";
+			linux,code = <BTN_0>;
+			gpios = <&chipcommon 14 GPIO_ACTIVE_LOW>;
+		};
+
+		eject {
+			label = "USB eject";
+			linux,code = <KEY_EJECTCD>;
+			gpios = <&chipcommon 15 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&usb2 {
+	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+};
+
+&usb3 {
+	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+};
+
+&spi_nor {
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+			label = "lan1";
+		};
+
+		port@1 {
+			reg = <1>;
+			label = "lan2";
+		};
+
+		port@2 {
+			reg = <2>;
+			label = "lan3";
+		};
+
+		port@3 {
+			reg = <3>;
+			label = "lan4";
+		};
+
+		port@4 {
+			reg = <4>;
+			label = "wan";
+		};
+
+		port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp.dts b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp.dts
new file mode 100644
index 000000000000..8e506269fa1a
--- /dev/null
+++ b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindigs for Buffalo WZR-1166DHP
+ *
+ * Copyright (C) 2022 SHIMAMOTO Takayoshi <takayoshi.shimamoto.360@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm4708-buffalo-wzr-1166dhp-common.dtsi"
+
+/ {
+	compatible = "buffalo,wzr-1166dhp", "brcm,bcm4708";
+	model = "Buffalo WZR-1166DHP";
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x08000000>,
+		      <0x88000000 0x18000000>;
+	};
+
+};
diff --git a/arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp2.dts b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp2.dts
new file mode 100644
index 000000000000..596129027074
--- /dev/null
+++ b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp2.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindigs for Buffalo WZR-1166DHP2
+ *
+ * Copyright (C) 2022 SHIMAMOTO Takayoshi <takayoshi.shimamoto.360@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm4708-buffalo-wzr-1166dhp-common.dtsi"
+
+/ {
+	compatible = "buffalo,wzr-1166dhp2", "brcm,bcm4708";
+	model = "Buffalo WZR-1166DHP2";
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x08000000>,
+		      <0x88000000 0x08000000>;
+	};
+
+};
-- 
2.30.2

