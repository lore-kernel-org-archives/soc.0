Return-Path: <SRS0=cZMy=OI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA380C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Sep 2021 14:19:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A414B60ED7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Sep 2021 14:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A414B60ED7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pB9EQisBakAZ72WZ5WlQK87xDQkfrEFxv56ATvzZw1Y=; b=E/WXXzbwvhx5SU
	G6jbuLkF+s+LLFjdmn3XlOdj5gXfnU5IhB6UpB+1CPhtZe7KlPhgGim/71xawLAQ9fEILQvf0iVa2
	yySpp37qjO/83WMJ39HXeGz9d+c4eMAO7WNjnqQf1sDRdbouFqgHdN20RwbzwSI/qVVbDq8IqAO63
	uo+pthYqrD9Sx+aV5wHEOMnzlyuBgX1XsW0GcYmPnpv300nNw1ccC+tz/3Y3YZHpmU7yt4tqj1/4e
	TIN6sB1GEy1msvmTpQSu54bLzhRd8AUUaSArTd2D2d4xzAW8wTRTKLY5Akt7n38nyxPwjAiezhxkN
	E5ouwfJU7gA99cMMb97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRb9Y-00FxSb-4a; Sat, 18 Sep 2021 14:17:16 +0000
Received: from mail.andi.de1.cc ([2a01:238:4321:8900:456f:ecd6:43e:202c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRb91-00FxOb-BQ
 for linux-arm-kernel@lists.infradead.org; Sat, 18 Sep 2021 14:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2qmq1CoyoXXD8M7nZSQs1ljKpDD2dga/WdxiVioLFbg=; b=jNbHIRbac6qLVO2jrhfhi/LOaj
 DA0rCxyyiUxRrohH9iyuP5Hv12vvIY/sBJZQOBWDpfoE70QBVtxuaIcL4QLR2H1BYzMlfMgJDTwLu
 sAw9JM2RuYVpGJX0WjktZlK56ZrVKjSsYP3d+EG5cRirDBILU517HXiYMhIH+/CmZuw0=;
Received: from p200300ccff3476001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff34:7600:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1mRb8t-0003mX-6x; Sat, 18 Sep 2021 16:16:35 +0200
Received: from andi by aktux with local (Exim 4.94.2)
 (envelope-from <andreas@kemnade.info>)
 id 1mRb8s-008zMk-O0; Sat, 18 Sep 2021 16:16:34 +0200
From: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
To: robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, krzk@kernel.org, leoyang.li@nxp.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 2/4] ARM: dts: add Netronix E70K02 board common file
Date: Sat, 18 Sep 2021 16:16:25 +0200
Message-Id: <20210918141627.2142457-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210918141627.2142457-1-andreas@kemnade.info>
References: <20210918141627.2142457-1-andreas@kemnade.info>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_071643_612191_6D827067 
X-CRM114-Status: GOOD (  15.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Netronix board E70K02 can be found some several Ebook-Readers,
at least the Kobo Libra H2O and the Tolino Vision 5. The board
is equipped with different SoCs requiring different pinmuxes.

    For now the following peripherals are included:
    - LED
    - Power Key
    - Cover (gpio via hall sensor)
    - RC5T619 PMIC
    - Backlight via lm3630a
    - Wifi sdio chip detection (mmc-powerseq and stuff)

    It is based on vendor kernel but heavily reworked due to many
    changed bindings.

Known limitations: cold colored backlight does not work due to
incompatible hard coded overvoltage setting in the driver.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/e70k02.dtsi | 320 ++++++++++++++++++++++++++++++++++
 1 file changed, 320 insertions(+)
 create mode 100644 arch/arm/boot/dts/e70k02.dtsi

diff --git a/arch/arm/boot/dts/e70k02.dtsi b/arch/arm/boot/dts/e70k02.dtsi
new file mode 100644
index 000000000000..5e57d2d9e14d
--- /dev/null
+++ b/arch/arm/boot/dts/e70k02.dtsi
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2021 Andreas Kemnade
+ * based on works
+ * Copyright 2016 Freescale Semiconductor, Inc.
+ * and
+ * Copyright (C) 2014 Ricoh Electronic Devices Co., Ltd
+ *
+ * Netronix E70K02 board common.
+ * This board is equipped with different SoCs and
+ * found in ebook-readers like the Kobo Clara HD (with i.MX6SLL) and
+ * the Tolino Shine 3 (with i.MX6SL)
+ */
+#include <dt-bindings/input/input.h>
+
+/ {
+	aliases {
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc3;
+	};
+
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			label = "Power";
+			gpios = <&gpio4 25 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		cover {
+			label = "Cover";
+			gpios = <&gpio4 23 GPIO_ACTIVE_LOW>;
+			linux,code = <SW_LID>;
+			linux,input-type = <EV_SW>;
+			wakeup-source;
+		};
+
+		pageup {
+			label = "PageUp";
+			gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_PAGEUP>;
+		};
+
+		pagedown {
+			label = "PageDown";
+			gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_PAGEDOWN>;
+		};
+	};
+
+	leds: leds {
+		compatible = "gpio-leds";
+
+		on {
+			label = "e70k02:white:on";
+			gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "timer";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reg_wifi: regulator-wifi {
+		compatible = "regulator-fixed";
+		regulator-name = "SD3_SPWR";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <20>;
+		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	lm3630a: backlight@36 {
+		reg = <0x36>;
+		compatible = "ti,lm3630a";
+		enable-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			led-sources = <0>;
+			label = "backlight_warm";
+			default-brightness = <0>;
+			max-brightness = <255>;
+		};
+
+		led@1 {
+			reg = <1>;
+			led-sources = <1>;
+			label = "backlight_cold";
+			default-brightness = <0>;
+			max-brightness = <255>;
+		};
+	};
+
+	/* TODO: KX122 acceleration sensor a 0x1e */
+
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	/* TODO: CYTTSP5 touch controller at 0x24 */
+
+	/* TODO: SY7636 PMIC for E Ink at 0x62 */
+
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	ricoh619: pmic@32 {
+		compatible = "ricoh,rc5t619";
+		reg = <0x32>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <19 IRQ_TYPE_EDGE_FALLING>;
+		system-power-controller;
+
+		regulators {
+			dcdc1_reg: DCDC1 {
+				regulator-name = "DCDC1";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1875000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-max-microvolt = <900000>;
+					regulator-suspend-min-microvolt = <900000>;
+				};
+			};
+
+			/* Core3_3V3 */
+			dcdc2_reg: DCDC2 {
+				regulator-name = "DCDC2";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-max-microvolt = <3300000>;
+					regulator-suspend-min-microvolt = <3300000>;
+				};
+			};
+
+			dcdc3_reg: DCDC3 {
+				regulator-name = "DCDC3";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1875000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-max-microvolt = <1140000>;
+					regulator-suspend-min-microvolt = <1140000>;
+				};
+			};
+
+			/* Core4_1V2 */
+			dcdc4_reg: DCDC4 {
+				regulator-name = "DCDC4";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-max-microvolt = <1140000>;
+					regulator-suspend-min-microvolt = <1140000>;
+				};
+			};
+
+			/* Core4_1V8 */
+			dcdc5_reg: DCDC5 {
+				regulator-name = "DCDC5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-max-microvolt = <1700000>;
+					regulator-suspend-min-microvolt = <1700000>;
+				};
+			};
+
+			ldo1_reg: LDO1  {
+				regulator-name = "LDO1";
+				regulator-boot-on;
+			};
+
+			/* Core1_3V3 */
+			ldo2_reg: LDO2  {
+				regulator-name = "LDO2";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-max-microvolt = <3000000>;
+					regulator-suspend-min-microvolt = <3000000>;
+				};
+			};
+
+			/* Core5_1V2 */
+			ldo3_reg: LDO3  {
+				regulator-name = "LDO3";
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "LDO4";
+				regulator-boot-on;
+			};
+
+			/* SPD_3V3 */
+			ldo5_reg: LDO5 {
+				regulator-name = "LDO5";
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			/* DDR_0V6 */
+			ldo6_reg: LDO6 {
+				regulator-name = "LDO6";
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			/* VDD_PWM */
+			ldo7_reg: LDO7 {
+				regulator-name = "LDO7";
+				regulator-boot-on;
+			};
+
+			/* ldo_1v8 */
+			ldo8_reg: LDO8 {
+				regulator-name = "LDO8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+			};
+
+			ldo9_reg: LDO9 {
+				regulator-name = "LDO9";
+				regulator-boot-on;
+			};
+
+			ldo10_reg: LDO10 {
+				regulator-name = "LDO10";
+				regulator-boot-on;
+			};
+
+			ldortc1_reg: LDORTC1  {
+				regulator-name = "LDORTC1";
+				regulator-boot-on;
+			};
+		};
+	};
+};
+
+&snvs_rtc {
+	/* we are using the rtc in the pmic, not disabled in imx6sll.dtsi */
+	status = "disabled";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usdhc1 {
+	non-removable;
+	no-1-8-v;
+	status = "okay";
+};
+
+&usdhc3 {
+	vmmc-supply = <&reg_wifi>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	cap-power-off-card;
+	non-removable;
+	status = "okay";
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	disable-over-current;
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	status = "okay";
+};
-- 
2.30.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
