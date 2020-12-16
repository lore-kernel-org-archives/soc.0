Return-Path: <SRS0=5nc+=FU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EEEC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Dec 2020 16:27:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CFCC233F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Dec 2020 16:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CFCC233F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Iy14iiy6Th6UNq/XvNKVOPiajoB0rgpmCHBwdXMH40M=; b=hmkhKGWLhUfIRMtp9GETUf5Ef7
	VbaKdIZANn+Eia39BQupE2MRc7XKGfzWFHNarGg3MJ1eq/djrGXEvPpm5/ERqCzHxHVGloYBI1Gl3
	HS5h8WHns50VKUH36xLxcRe9DJ4gH4MGAeBabJKSXcuFfGl3uKjZgdnTBK6JpBWBY0PPzjuwDAEgQ
	nq+fuqyHBdVuvE8NAFacJyyQH6i0IHG1HaUNKSFp895/nggSsWO4N9yViE/9MwkFWNmkzWiIQzY3e
	/GvT1VhNLuZ8OvJa4l4DmAqZWG/SdJSR/OappaWgaJdGUd4W+6BJWYD2GivycrhMYmY+wmBkJjDnw
	4nPG6Biw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpZch-00018s-MX; Wed, 16 Dec 2020 16:25:55 +0000
Received: from magratgarlick.emantor.de ([78.46.208.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpZce-000181-A9
 for linux-arm-kernel@lists.infradead.org; Wed, 16 Dec 2020 16:25:53 +0000
Received: by magratgarlick.emantor.de (Postfix, from userid 114)
 id 5D09E103AE0; Wed, 16 Dec 2020 17:25:49 +0100 (CET)
Received: from localhost (unknown [IPv6:2001:9e8:79:5902:c0d3:dbff:fefe:ff70])
 by magratgarlick.emantor.de (Postfix) with ESMTPSA id 416CA103AD4;
 Wed, 16 Dec 2020 17:25:47 +0100 (CET)
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v2 2/3] ARM: dts: add Webasto ccbv2
Date: Wed, 16 Dec 2020 17:25:43 +0100
Message-ID: <20201216162544.9629-1-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_112552_638239_2FA38B74 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: devicetree@vger.kernel.org, Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201216162543.mfGJ9zFP6mxUL78oe2lqDBT6A2l_MOJ2guQDMbJDcA0@z>

The Webasto Common Communication Board Version 2 is a i.MX6UL based
board.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
---
 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/imx6ul-webasto-ccbv2.dts | 472 +++++++++++++++++++++
 2 files changed, 473 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ul-webasto-ccbv2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ce66ffd5a1bb..757e415a7979 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -626,6 +626,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-tx6ul-0010.dtb \
 	imx6ul-tx6ul-0011.dtb \
 	imx6ul-tx6ul-mainboard.dtb \
+	imx6ul-webasto-ccbV2.dtb \
 	imx6ull-14x14-evk.dtb \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-wifi-eval-v3.dtb \
diff --git a/arch/arm/boot/dts/imx6ul-webasto-ccbv2.dts b/arch/arm/boot/dts/imx6ul-webasto-ccbv2.dts
new file mode 100644
index 000000000000..5c3bca6d2698
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ul-webasto-ccbv2.dts
@@ -0,0 +1,472 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2019, Webasto SE
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+
+/ {
+	model = "Webasto common communication board version 2";
+	compatible = "webasto,imx6ul-ccbv2", "fsl,imx6ul";
+
+	chosen {
+		stdout-path = &uart7;
+	};
+
+	reg_4v: regulator-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "V_+4V";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_wl18xx_vmmc: regulator-wl18xx {
+		compatible = "regulator-fixed";
+		regulator-name = "wl1837";
+		vin-supply = <&reg_4v>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <70000>;
+		enable-active-high;
+	};
+
+	reg_dp83822_en: regulator-dp83822 {
+		compatible = "regulator-fixed";
+		regulator-name = "dp83822";
+		vin-supply = <&vcc_eth>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio1 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>;
+	phy-mode = "rmii";
+	phy-supply = <&reg_dp83822_en>;
+	phy-handle = <&dp83822i>;
+	phy-reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dp83822i: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			clocks = <&clks IMX6UL_CLK_ENET_REF>;
+			clock-names = "rmii-ref";
+		};
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	pmic: mc34pf3000@8 {
+		compatible = "fsl,pfuze3000";
+		reg = <0x08>;
+		regulators {
+			sw1a_reg: sw1a {
+				regulator-name = "V_+3V3_SW1A";
+				vin-supply = <&reg_4v>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <6250>;
+			};
+			vdd_soc_in: sw1b {
+				regulator-name = "V_+1V4_SW1B";
+				vin-supply = <&reg_4v>;
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1475000>;
+				regulator-ramp-delay = <6250>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			sw2_reg: sw2 {
+				regulator-name = "V_+3V3_SW2";
+				vin-supply = <&reg_4v>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			vcc_ddr3: sw3 {
+				regulator-name = "V_+1V35_SW3";
+				vin-supply = <&reg_4v>;
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			swbst_reg: swbst {
+				regulator-name = "V_+5V0_SWBST";
+				vin-supply = <&reg_4v>;
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5150000>;
+			};
+			vdd_snvs: vsnvs {
+				regulator-name = "V_+3V0_SNVS";
+				vin-supply = <&reg_4v>;
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			vrefddr: vrefddr {
+				regulator-name = "V_+0V675_VREFDDR";
+				vin-supply = <&vcc_ddr3>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			/* 3V3 Supply: i.MX6 modules */
+			vgen1_reg: vldo1 {
+				regulator-name = "V_+3V3_LDO1";
+				vin-supply = <&reg_4v>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			vgen2_reg: vldo2 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1550000>;
+			};
+			vgen3_reg: vccsd {
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <3300000>;
+			};
+			vdd_high_in: v33 {
+				regulator-name = "V_+3V3_V33";
+				vin-supply = <&reg_4v>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			vcc_eth: vldo3 {
+				regulator-name = "V_+1V8_LDO3";
+				vin-supply = <&reg_4v>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			vgen6_reg: vldo4 {
+				regulator-name = "V_+1V8_LDO4";
+				vin-supply = <&reg_4v>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1>;
+	cs-gpios = <
+		&gpio3 26 GPIO_ACTIVE_LOW
+		&gpio3 10 GPIO_ACTIVE_LOW
+		&gpio3 12 GPIO_ACTIVE_LOW
+	>;
+	status = "okay";
+
+	cc2520: spi@0 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_cc2520>;
+		compatible = "ti,cc2520";
+		reg = <0>;
+		spi-max-frequency = <4000000>;
+		fifo-gpio = <&gpio3 15 0>;
+		fifop-gpio = <&gpio3 16 0>;
+		sfd-gpio = <&gpio3 24 0>;
+		cca-gpio = <&gpio3 20 0>;
+		vreg-gpio = <&gpio3 19 0>;
+		reset-gpio = <&gpio3 23 0>;
+		vin-supply = <&sw2_reg>;
+		status = "okay";
+	};
+	qca7000: spi@1 {
+		compatible = "qca,qca7000";
+		reg = <1>;
+		spi-max-frequency = <8000000>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <16 0x1>;
+		spi-cpha;
+		spi-cpol;
+		status = "okay";
+	};
+	tfr7970: spi@2 {
+		compatible = "ti,trf7970a";
+		reg = <3>;
+		spi-max-frequency = <2000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_trf7970>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <14 0>;
+		ti,enable-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>, <&gpio3 17 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&reg_4v>;
+		vdd-io-supply = <&sw2_reg>;
+		autosuspend-delay = <30000>;
+		clock-frequency = <27120000>;
+		status = "okay";
+	};
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
+&uart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	uart-has-rtscts;
+	status = "okay";
+	bluetooth {
+		compatible = "ti,wl1835-st";
+		enable-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&reg_4v>;
+	};
+};
+
+&uart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_wl18xx_vmmc>;
+	non-removable;
+	keep-power-in-suspend;
+	cap-power-off-card;
+	max-frequency = <25000000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	wlcore: wlcore@2 {
+		compatible = "ti,wl1837";
+		reg = <2>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+		tcxo-clock-frequency = <26000000>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	bus-width = <8>;
+	vmmc-supply = <&sw1a_reg>;
+	no-1-8-v;
+	non-removable;
+	no-sd;
+	no-sdio;
+	keep-power-in-suspend;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	disable-over-current;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_minipcie>;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&reg_arm {
+	vin-supply = <&vdd_soc_in>;
+	regulator-allow-bypass;
+};
+
+&reg_soc {
+	vin-supply = <&vdd_soc_in>;
+	regulator-allow-bypass;
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
+			MX6UL_PAD_GPIO1_IO08__GPIO1_IO08	0x13030
+			MX6UL_PAD_GPIO1_IO09__GPIO1_IO09	0x13030
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6UL_PAD_UART5_TX_DATA__I2C2_SCL   0x4001b8b0
+			MX6UL_PAD_UART5_RX_DATA__I2C2_SDA   0x4001b8b0
+			MX6UL_PAD_UART4_RX_DATA__GPIO1_IO29 0x10000
+		>;
+	};
+
+	pinctrl_minipcie: minipciegrp {
+		fsl,pins = <
+			/* HYS=1, 100k PullDown, 50MHz, R0/6 */
+			MX6UL_PAD_LCD_HSYNC__GPIO3_IO02   0x13030
+			MX6UL_PAD_LCD_VSYNC__GPIO3_IO03   0x13030
+			MX6UL_PAD_LCD_RESET__GPIO3_IO04   0x13030
+			MX6UL_PAD_LCD_DATA03__GPIO3_IO08  0x13030
+			MX6UL_PAD_LCD_DATA04__GPIO3_IO09  0x13030
+		>;
+	};
+
+	pinctrl_spi1: spi1grp {
+		fsl,pins = <
+			MX6UL_PAD_LCD_DATA20__ECSPI1_SCLK 0x1b0b0
+			MX6UL_PAD_LCD_DATA22__ECSPI1_MOSI 0x1b0b0
+			MX6UL_PAD_LCD_DATA23__ECSPI1_MISO 0x1b0b0
+			MX6UL_PAD_LCD_DATA05__GPIO3_IO10  0x17030
+			MX6UL_PAD_NAND_DQS__GPIO4_IO16    0x17030
+			MX6UL_PAD_LCD_DATA06__GPIO3_IO11  0x17030
+			MX6UL_PAD_LCD_DATA13__GPIO3_IO18  0x10030
+		>;
+	};
+
+	pinctrl_cc2520: cc2520grp {
+		fsl,pins = <
+			MX6UL_PAD_LCD_DATA10__GPIO3_IO15  0x13030
+			MX6UL_PAD_LCD_DATA11__GPIO3_IO16  0x13030
+			MX6UL_PAD_LCD_DATA14__GPIO3_IO19  0x13030
+			MX6UL_PAD_LCD_DATA15__GPIO3_IO20  0x13030
+			MX6UL_PAD_LCD_DATA18__GPIO3_IO23  0x13030
+			MX6UL_PAD_LCD_DATA19__GPIO3_IO24  0x13030
+			MX6UL_PAD_LCD_DATA21__GPIO3_IO26  0x17030
+
+		>;
+	};
+
+	pinctrl_trf7970: trf7970grp {
+		fsl,pins = <
+			MX6UL_PAD_LCD_DATA07__GPIO3_IO12  0x17030
+			MX6UL_PAD_LCD_DATA02__GPIO3_IO07  0x10030
+			MX6UL_PAD_LCD_DATA12__GPIO3_IO17  0x10030
+			MX6UL_PAD_LCD_DATA09__GPIO3_IO14  0x17000
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_READY_B__UART3_DCE_TX  0x1b0b0
+			MX6UL_PAD_NAND_CE0_B__UART3_DCE_RX    0x1b0b0
+			MX6UL_PAD_NAND_CE1_B__UART3_DCE_CTS   0x1b0b0
+			MX6UL_PAD_NAND_CLE__UART3_DCE_RTS     0x1b0b0
+			MX6UL_PAD_LCD_DATA08__GPIO3_IO13      0x13030
+			MX6UL_PAD_NAND_WP_B__GPIO4_IO11       0x13030
+			MX6UL_PAD_NAND_DQS__GPIO4_IO16        0x13030
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX6UL_PAD_LCD_CLK__UART4_DCE_TX	      0x1b0b0
+			MX6UL_PAD_LCD_ENABLE__UART4_DCE_RX    0x1b0b0
+		>;
+	};
+
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <
+			MX6UL_PAD_CSI_MCLK__UART6_DCE_TX      0x1b0b0
+			MX6UL_PAD_CSI_PIXCLK__UART6_DCE_RX    0x1b0b0
+			MX6UL_PAD_CSI_VSYNC__UART6_DCE_RTS    0x1b0b0
+			MX6UL_PAD_CSI_HSYNC__UART6_DCE_CTS    0x1b0b0
+			MX6UL_PAD_ENET2_TX_DATA0__GPIO2_IO11  0x10030
+			MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT  0x00010
+		>;
+	};
+
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX6UL_PAD_LCD_DATA16__UART7_DCE_TX    0x1b0b0
+			MX6UL_PAD_LCD_DATA17__UART7_DCE_RX    0x1b0b0
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD        0x10059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK        0x10059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0    0x10059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1    0x10059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2    0x10059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3    0x10059
+			MX6UL_PAD_CSI_DATA00__GPIO4_IO21     0x17000
+			MX6UL_PAD_CSI_DATA01__GPIO4_IO22     0x10030
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK      0x100e9
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD      0x100e9
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0  0x100e9
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1  0x100e9
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2  0x100e9
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3  0x100e9
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4  0x100e9
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5  0x100e9
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6  0x100e9
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7  0x100e9
+			MX6UL_PAD_NAND_ALE__GPIO4_IO10       0x10030
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO01__WDOG1_WDOG_B	0x00b0
+		>;
+	};
+};
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
