Return-Path: <SRS0=Szqg=LA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C8AC4743E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A8D6608FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A8D6608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCODh6ujHw4HoKBB/ejdsCCoFAaWd0W8kFyuj3sdNgY=; b=2HPvXJ+azTiZiW
	Yd7x3FB1QnjYgG55p/oJULLWIytr4b+7aZKIBiR2l2KiwVKnKdktyfzKLd/9mao5afACkIv+jSSd4
	twVRSdGLQgG5qFWZnqdMtZlICXCNoe3QcUNtKucGKyOTSyhVvZCRbOo9o0vXRm7JaiHBHD9XTz2uX
	UJ5E/I0YIGUtyUAIpY2pA9QnBeoa/ofsdir4U+UkMoFcDzZBuxKuth4JYUMaS/r5LMVtlXBjLHYUg
	6Yv8L0rrZdfDBOpTQo7AzwQsB1P/dKwPmzwZgePQG6uJsntoLiJnZwj+0xLOFuP4FczfQu8j4gWMH
	pTkSsdD4nq7VGOqwdYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpri6-000E2n-2h; Sun, 06 Jun 2021 12:16:58 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpri0-000Dzf-OM; Sun, 06 Jun 2021 12:16:54 +0000
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MyK5K-1lQT4I3yKi-00yi3s; Sun, 06 Jun 2021 14:16:35 +0200
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
Subject: [PATCH V2 3/7] ARM: dts: Move BCM2711 RPi specific into separate dtsi
Date: Sun,  6 Jun 2021 14:16:13 +0200
Message-ID: <1622981777-5023-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:DZu3y0RVxc2QPn7QuojF///xA4qmq/Uar+yz0SlIg/PJ9TSuhqh
 U2yCACckdei2EEQ2oDbK00NHEW/UHqNiAEA6NWlq/y/EzcCw/OU+sBSAvUWeu6vbPMHPWAS
 Vd82NL1OLqMPB1XtrLpY9pa1bpUhcRX2mxhLJF/9aWIhi0SXtz2HFitR+0aVbgRc8WaKi+n
 8voq6mKRslwj2bN63oxyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dzZ6vyu1YIo=:iGhhhPH5z4lQzjlz86ziNx
 EEUooSV6oaVgT6o2F0Iw+WOqNordvtEJBmitOIjTOppLpl/GchurZ8nFmiwVKz3kPebGhlXb8
 44eYkc9vhSX3iWIp3sqL6kYpsoljM1jfCuo945UxkbPuW9yu4OukFjwGMLPScY1AAypiPwJh6
 SqMr65Z8v5XaW+umtQooto0vl898EnSGtQKwvb77Y0x+FgXjNJFcENmjzWSxtLhzAnbetl7bw
 YNtYUuwK6SEBPwgxQkx8urxZGFU/GGO6/B+NftoNROg0EP5+KbZ/CnYYOJ8rXfKVdlX2EfHVR
 oqiczYFY0rGrGt3WQLJla9u24Z1egj3ZVi0YXK/uk47O/Pmky0Av5a1kJk0HVaiUPZn7ano8l
 JKfEo2M20W0ux/TAwPOtaXWqhRfuzhJdcR25/ovLOkcEfq5jqCUAlDhMKiPb53s1WBep0gwqz
 ENn6hbSDf6W67cCXVrpmRD3f/A3Cm6ZzEGV8VrwbtE0KFkE2NKz3rhfmFieWk7HvGsIcOkGGZ
 PMbJj3ZN891DW45lKcLr5E=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_051653_108750_EC5F3D6A 
X-CRM114-Status: GOOD (  18.48  )
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
Message-ID: <20210606121613.-uS8qQknoxENmyqbpaOrEMHMBGWieABvxxNuBOgHMx0@z>

There is a lot of Raspberry Pi specific stuff (neither SoC or board
specific) for the BCM2711 which is currently in the RPi 4 B dts. In order
to avoid copy & paste for every new BCM2711 based Raspberry Pi, move it
into a separate dtsi.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 81 +++++------------------------------
 arch/arm/boot/dts/bcm2711-rpi.dtsi    | 74 ++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 71 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi.dtsi

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index 3b4ab94..c54854a1 100644
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
@@ -15,19 +13,6 @@
 		stdout-path = "serial1:115200n8";
 	};
 
-	/* Will be filled by the bootloader */
-	memory@0 {
-		device_type = "memory";
-		reg = <0 0 0>;
-	};
-
-	aliases {
-		emmc2bus = &emmc2bus;
-		ethernet0 = &genet;
-		pcie0 = &pcie0;
-		blconfig = &blconfig;
-	};
-
 	leds {
 		act {
 			gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
@@ -79,31 +64,15 @@
 	status = "okay";
 };
 
-&firmware {
-	firmware_clocks: clocks {
-		compatible = "raspberrypi,firmware-clocks";
-		#clock-cells = <1>;
-	};
-
-	expgpio: gpio {
-		compatible = "raspberrypi,firmware-gpio";
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-line-names = "BT_ON",
-				  "WL_ON",
-				  "PWR_LED_OFF",
-				  "GLOBAL_RESET",
-				  "VDD_SD_IO_SEL",
-				  "CAM_GPIO",
-				  "SD_PWR_ON",
-				  "";
-		status = "okay";
-	};
-
-	reset: reset {
-		compatible = "raspberrypi,firmware-reset";
-		#reset-cells = <1>;
-	};
+&expgpio {
+	gpio-line-names = "BT_ON",
+			  "WL_ON",
+			  "PWR_LED_OFF",
+			  "GLOBAL_RESET",
+			  "VDD_SD_IO_SEL",
+			  "CAM_GPIO",
+			  "SD_PWR_ON",
+			  "";
 };
 
 &gpio {
@@ -180,23 +149,13 @@
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
@@ -219,22 +178,6 @@
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
@@ -309,10 +252,6 @@
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
index 0000000..ca266c5
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi.dtsi
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "bcm2835-rpi.dtsi"
+
+#include <dt-bindings/reset/raspberrypi,firmware-reset.h>
+
+/ {
+	/* Will be filled by the bootloader */
+	memory@0 {
+		device_type = "memory";
+		reg = <0 0 0>;
+	};
+
+	aliases {
+		emmc2bus = &emmc2bus;
+		ethernet0 = &genet;
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
+	expgpio: gpio {
+		compatible = "raspberrypi,firmware-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+		status = "okay";
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
