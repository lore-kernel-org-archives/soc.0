Return-Path: <SRS0=k3Qe=KZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7916C47091
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 May 2021 09:28:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BABC610FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 May 2021 09:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BABC610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSHauuCPUCqP+Qr6sEC8FO2vpPFdy1XSv3ONDfd51DE=; b=iVilauxjYPq0Z2
	UkPrUpUN4nHnIEpQ8456bRGPCjHLCGefVLrDf59XjzJskpOgiu1v8s8Jdh0VX6KshnGeTBk5qCTdv
	NbHVJJ+7glhNKkNnat/RVcXzYTAYTavGuMhJchvC1sYRyc2orBHjBIpALrBH+FXZdFRTKrECr64oR
	lFUnPc8yILFXhWOwGcUvphHFepfmTkQjvkGBvoCkydqgpOVcPguEya+A0S05QcX5cRuWzxhxrtUs1
	eVBfUtRaLJirUfYun9RuVLnEmeDbXEpbPY9vshAqUg2Z4O4xNNNxNCiwMlVpMbUM4ZBwTsOR9XWCo
	qOWtxvEyEmvftpAMvVZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnHis-009NGI-4a; Sun, 30 May 2021 09:27:06 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnHiT-009NCK-8L; Sun, 30 May 2021 09:26:44 +0000
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MJW18-1m70QK1a7E-00JrUK; Sun, 30 May 2021 11:26:24 +0200
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
Subject: [PATCH 3/6] ARM: dts: Move BCM2711 RPi specific into separate dtsi
Date: Sun, 30 May 2021 11:26:12 +0200
Message-ID: <1622366775-5309-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:M8P44XuD5Ei2tpIgR2aUmBNMRJXf3EtIhzOfSqlO1+r54TVGlJv
 uMtmJe2KUsQ+TXJhrR/6/uvGgPsJ5O7W1K7QC8Hu+WFFOTqcSCNqINi8CwHkTuazSShm+ob
 1Xhba/kbK5nGBMLvkhI4vDhlQkigi9vnQgLe5JhENEHZRWEWLW5N7p7+m7FJUSSgxnKQyRL
 5BbmelIYYV8UHW/brQjjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UQGBprPtfMA=:7/EZxsNghN2DwbripBocLG
 QQlqrpQYui+S0FsZnmexJ8AN3ITvvVOcegFRb3WNSpBV7mDoUzSknXthPUY/aXjR5yj1Ye4fN
 KppoGoth9GQWfFVUY+P7vPuCg7lEW+gvf2aaj2zf7ajy2uXPnbQB8b7jMijhlOT7IzMBUhrCM
 XkTo2MlTle0dLcUsBK1swUea4kmJ0wa2RkzN4EpnIrfAICWerTFRYIGAt9j+tBkUhh1gjrBu2
 4sjvmoZAvXwFOHog1fW7fAmXU1hJ91ZKFrAul1d4sFFy4+KOu0rPGviAonz5wEQQLgQ6iK/sJ
 VZs8a9k2jk1vHKlj9VI/8LmRDkru3zqihBUAaEey6k03JjiSz2SUt4wYp0HVCXklOcOJ7l+FH
 +5RmJ542u5yM3bEMaHWAko1C7qpnP9o6RYe0YvNDEpchUAXIUMpcMDnhCXWxrcbMlpuEVobPe
 sxzMYANfArGtuyEguCgS1LfiC1zw8xrKzzbEaFMNDnlV6v+0MkHoxi1egZi+eqy8GOtra6bTL
 8vYTuUA2sJj7CiK8ZSUQ9Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_022641_648485_942B7E51 
X-CRM114-Status: GOOD (  18.42  )
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
Message-ID: <20210530092612.zTQab8XkxpL0IjXxTUqMZhGQj3E7SEJGB2VwUqzRDDo@z>

There is a lot of Raspberry Pi specific stuff (neither SoC or board
specific) for the BCM2711 which is currently in the RPi 4 B dts. In order
to avoid copy & paste for every new BCM2711 based Raspberry Pi, move it
into a separate dtsi.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 62 +----------------------------
 arch/arm/boot/dts/bcm2711-rpi.dtsi    | 75 +++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi.dtsi

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index 3b4ab94..78142a0 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -1,11 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 #include "bcm2711.dtsi"
-#include "bcm2835-rpi.dtsi"
+#include "bcm2711-rpi.dtsi"
 #include "bcm283x-rpi-usb-peripheral.dtsi"
 
-#include <dt-bindings/reset/raspberrypi,firmware-reset.h>
-
 / {
 	compatible = "raspberrypi,4-model-b", "brcm,bcm2711";
 	model = "Raspberry Pi 4 Model B";
@@ -22,10 +20,7 @@
 	};
 
 	aliases {
-		emmc2bus = &emmc2bus;
 		ethernet0 = &genet;
-		pcie0 = &pcie0;
-		blconfig = &blconfig;
 	};
 
 	leds {
@@ -80,11 +75,6 @@
 };
 
 &firmware {
-	firmware_clocks: clocks {
-		compatible = "raspberrypi,firmware-clocks";
-		#clock-cells = <1>;
-	};
-
 	expgpio: gpio {
 		compatible = "raspberrypi,firmware-gpio";
 		gpio-controller;
@@ -99,11 +89,6 @@
 				  "";
 		status = "okay";
 	};
-
-	reset: reset {
-		compatible = "raspberrypi,firmware-reset";
-		#reset-cells = <1>;
-	};
 };
 
 &gpio {
@@ -180,23 +165,13 @@
 };
 
 &hdmi0 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
-	wifi-2.4ghz-coexistence;
 	status = "okay";
 };
 
 &hdmi1 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
-	wifi-2.4ghz-coexistence;
 	status = "okay";
 };
 
-&hvs {
-	clocks = <&firmware_clocks 4>;
-};
-
 &pixelvalve0 {
 	status = "okay";
 };
@@ -219,22 +194,6 @@
 	status = "okay";
 };
 
-&rmem {
-	/*
-	 * RPi4's co-processor will copy the board's bootloader configuration
-	 * into memory for the OS to consume. It'll also update this node with
-	 * its placement information.
-	 */
-	blconfig: nvram@0 {
-		compatible = "raspberrypi,bootloader-config", "nvmem-rmem";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		reg = <0x0 0x0 0x0>;
-		no-map;
-		status = "disabled";
-	};
-};
-
 /* SDHCI is used to control the SDIO for wireless */
 &sdhci {
 	#address-cells = <1>;
@@ -273,21 +232,6 @@
 	};
 };
 
-&pcie0 {
-	pci@1,0 {
-		#address-cells = <3>;
-		#size-cells = <2>;
-		ranges;
-
-		reg = <0 0 0 0 0>;
-
-		usb@1,0 {
-			reg = <0x10000 0 0 0 0>;
-			resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
-		};
-	};
-};
-
 /* uart0 communicates with the BT module */
 &uart0 {
 	pinctrl-names = "default";
@@ -309,10 +253,6 @@
 	status = "okay";
 };
 
-&vchiq {
-	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-};
-
 &vc4 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/bcm2711-rpi.dtsi b/arch/arm/boot/dts/bcm2711-rpi.dtsi
new file mode 100644
index 0000000..b4bc7f6
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "bcm2835-rpi.dtsi"
+
+#include <dt-bindings/reset/raspberrypi,firmware-reset.h>
+
+/ {
+	aliases {
+		emmc2bus = &emmc2bus;
+		pcie0 = &pcie0;
+		blconfig = &blconfig;
+	};
+};
+
+&firmware {
+	firmware_clocks: clocks {
+		compatible = "raspberrypi,firmware-clocks";
+		#clock-cells = <1>;
+	};
+
+	reset: reset {
+		compatible = "raspberrypi,firmware-reset";
+		#reset-cells = <1>;
+	};
+};
+
+&hdmi0 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+	wifi-2.4ghz-coexistence;
+};
+
+&hdmi1 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+	wifi-2.4ghz-coexistence;
+};
+
+&hvs {
+	clocks = <&firmware_clocks 4>;
+};
+
+&pcie0 {
+	pci@1,0 {
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		reg = <0 0 0 0 0>;
+
+		usb@1,0 {
+			reg = <0x10000 0 0 0 0>;
+			resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
+		};
+	};
+};
+
+&rmem {
+	/*
+	 * RPi4's co-processor will copy the board's bootloader configuration
+	 * into memory for the OS to consume. It'll also update this node with
+	 * its placement information.
+	 */
+	blconfig: nvram@0 {
+		compatible = "raspberrypi,bootloader-config", "nvmem-rmem";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x0 0x0 0x0>;
+		no-map;
+		status = "disabled";
+	};
+};
+
+&vchiq {
+	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
