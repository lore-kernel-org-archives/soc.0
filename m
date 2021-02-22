Return-Path: <SRS0=eyM4=HY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36C5C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Feb 2021 10:10:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E380614A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Feb 2021 10:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E380614A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pascalroeleven.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/fmJkuSyFft7LWluXlADdHJuZ/Q5j/tvkbMH1q9Seg8=; b=s3YCYgbB61wf5bZDzDglBwCLU
	DTwxGeoJ6RabFx8LXugePMgzPifGiCy43ncd7Edw/AxW5uB4Fa4t8/fhqhF46C6D3/wvvI5DjOJIG
	tNZuKU2an9/JJvg309dgiEtkkvxuPCF2oUZsZj1A1g2g+pk/HCHZBoX37VVCFmEdzRloPWU1DZdHU
	brICxMjF79nnPAsUPLt+Fi308wNmuS0z4GGzNJRN5oBTmEeB+gvvvPohJY77gXMK6h4hBHFVmHcWS
	ZmGzhX2iO+o5aOOH6rbiPm/okyGyz2SlW348LGtVsp2AQNxG71YjSowI0Y1jOEVRaIdaxVz1khMRv
	nzBa9KHuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE89E-0004wd-4b; Mon, 22 Feb 2021 10:09:00 +0000
Received: from pmg02-out1.zxcs.nl ([2a06:2ec0:1::ffea])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE89A-0004ut-OD
 for linux-arm-kernel@lists.infradead.org; Mon, 22 Feb 2021 10:08:58 +0000
Received: from pmg02.zxcs.nl (localhost.localdomain [127.0.0.1])
 by pmg02.zxcs.nl (ZXCS) with ESMTP id C96CA82A70;
 Mon, 22 Feb 2021 11:08:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:MIME-Version:References
 :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fnw1MAEMIxhFtiJXtmKN5fVklOhA/f0Sz4YobddOFGw=; b=s+5OJVKqT0VEzRJBLd4nz2PG37
 CcCVuJtp/3JJt18XgKKLYMBfkX8SllAZV6S126um5vCSbMQVZYTta7yp1ws9lpYziCZRQALHzfFAS
 Su6y1JY8MNNcLXG4ENQko54zCtdHBrvCMO8NB1mttYQrOwjuorSwmSsp18rmb5spzS2lq8qEfPY1J
 R0dRrVBXyg+PUFP6RrtKAjXZZSPpArSMtu+ZwF7N18/k2idwxJ+5XsHlUJCxlVjEAlDZFAYZ+151G
 lUnaSeaFxVV0HwTsdw5D0pyvadUNfyjrnqnLPDxzpGqJ1W4zxkrrVg/VCkQKevDcchyavTNVt+W29
 FzR9Ib/Q==;
From: Pascal Roeleven <dev@pascalroeleven.nl>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>, Corentin Labbe <clabbe@baylibre.com>,
 Martin Cerveny <m.cerveny@computer.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] ARM: dts: sun4i: Add support for Topwise A721 tablet
Date: Mon, 22 Feb 2021 11:08:26 +0100
Message-ID: <20210222100826.12478-3-dev@pascalroeleven.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210222100826.12478-1-dev@pascalroeleven.nl>
References: <20210222100826.12478-1-dev@pascalroeleven.nl>
MIME-Version: 1.0
X-AuthUser: dev@pascalroeleven.nl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_050856_926382_6A46F9ED 
X-CRM114-Status: GOOD (  15.34  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-sunxi@googlegroups.com, Pascal Roeleven <dev@pascalroeleven.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210222100826.48qQEibAUwhvGzilK8rM_FwIwFcYDaku5hmv3v__ax8@z>

The Topwise A721/LY-F1 tablet is a tablet sold around 2012 under
different brands. The mainboard mentions A721 clearly, so this tablet
is best known under this name.

Signed-off-by: Pascal Roeleven <dev@pascalroeleven.nl>
---
 arch/arm/boot/dts/Makefile                   |   3 +-
 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts | 242 +++++++++++++++++++
 2 files changed, 244 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 3d1ea0b251..ba25b4235a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1103,7 +1103,8 @@ dtb-$(CONFIG_MACH_SUN4I) += \
 	sun4i-a10-olinuxino-lime.dtb \
 	sun4i-a10-pcduino.dtb \
 	sun4i-a10-pcduino2.dtb \
-	sun4i-a10-pov-protab2-ips9.dtb
+	sun4i-a10-pov-protab2-ips9.dtb \
+	sun4i-a10-topwise-a721.dtb
 dtb-$(CONFIG_MACH_SUN5I) += \
 	sun5i-a10s-auxtek-t003.dtb \
 	sun5i-a10s-auxtek-t004.dtb \
diff --git a/arch/arm/boot/dts/sun4i-a10-topwise-a721.dts b/arch/arm/boot/dts/sun4i-a10-topwise-a721.dts
new file mode 100644
index 0000000000..2c417c408b
--- /dev/null
+++ b/arch/arm/boot/dts/sun4i-a10-topwise-a721.dts
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020 Pascal Roeleven <dev@pascalroeleven.nl>
+ */
+
+/dts-v1/;
+#include "sun4i-a10.dtsi"
+#include "sunxi-common-regulators.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+
+/ {
+	model = "Topwise A721";
+	compatible = "topwise,a721", "allwinner,sun4i-a10";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 100000 PWM_POLARITY_INVERTED>;
+		power-supply = <&reg_vbat>;
+		enable-gpios = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
+		brightness-levels = <0 30 40 50 60 70 80 90 100>;
+		default-brightness-level = <8>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	panel {
+		compatible = "starry,kr070pe2t";
+		backlight = <&backlight>;
+		power-supply = <&reg_lcd_power>;
+
+		port {
+			panel_input: endpoint {
+				remote-endpoint = <&tcon0_out_panel>;
+			};
+		};
+	};
+
+	reg_lcd_power: reg-lcd-power {
+		compatible = "regulator-fixed";
+		regulator-name = "reg-lcd-power";
+		gpio = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+		enable-active-high;
+	};
+
+	reg_vbat: reg-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+};
+
+&codec {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&de {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	axp209: pmic@34 {
+		reg = <0x34>;
+		interrupts = <0>;
+	};
+};
+
+#include "axp209.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&battery_power_supply {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	accelerometer@4c {
+		compatible = "fsl,mma7660";
+		reg = <0x4c>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&pio>;
+		interrupts = <7 21 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		vcc-supply = <&reg_vcc3v3>;
+	};
+};
+
+&lradc {
+	vref-supply = <&reg_ldo2>;
+	status = "okay";
+
+	button-761 {
+		label = "Volume Down";
+		linux,code = <KEY_VOLUMEDOWN>;
+		channel = <0>;
+		voltage = <761904>;
+	};
+
+	button-571 {
+		label = "Volume Up";
+		linux,code = <KEY_VOLUMEUP>;
+		channel = <0>;
+		voltage = <571428>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 7 1 GPIO_ACTIVE_LOW>; /* PH01 */
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&otg_sram {
+	status = "okay";
+};
+
+&pio {
+	vcc-pb-supply = <&reg_vcc3v3>;
+	vcc-pf-supply = <&reg_vcc3v3>;
+	vcc-ph-supply = <&reg_vcc3v3>;
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pin>;
+	status = "okay";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <1250000>;
+	regulator-max-microvolt = <1250000>;
+	regulator-name = "vdd-int-dll";
+};
+
+&reg_ldo1 {
+	regulator-name = "vdd-rtc";
+};
+
+&reg_ldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "avcc";
+};
+
+&reg_usb0_vbus {
+	status = "okay";
+};
+
+&reg_usb1_vbus {
+	status = "okay";
+};
+
+&reg_usb2_vbus {
+	status = "okay";
+};
+
+&tcon0_out {
+	tcon0_out_panel: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&panel_input>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_power_supply {
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_vbus_det-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_vbus-supply = <&reg_usb0_vbus>;
+	usb1_vbus-supply = <&reg_usb1_vbus>;
+	usb2_vbus-supply = <&reg_usb2_vbus>;
+	status = "okay";
+};
-- 
2.27.0



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
