Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D1AC433DB
	for <soc@archiver.kernel.org>; Sun, 10 Jan 2021 12:16:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E8E8F206DB; Sun, 10 Jan 2021 12:16:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65435206C1;
	Sun, 10 Jan 2021 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610280964;
	bh=64Bm8tvNHXc+AkPnadrw9NBCeskCkSPQ46R/5g2s7BU=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ebtu0dk2vpT+XWce1K7F9h3kqwTH+ZIcGcnxUpl0ryIobWmoL/DYAXTKUNxLd4mmy
	 zmiligjr9FvMN1wjgI2f8hBl7ypKxuT4kmZEOLlC0kdJ1l8w4hzQ7GBKyvqAsPVjNb
	 +wEYH3Tx0Szilxr8WvH2G1qOIJIdFAHKTi+AAcjIu8ogvIjZH8o7l/TH6DV8CN2JpS
	 kFyelsXzrsAk1t343cpNNmDkCJfw1feYwXsuF7aFfKhPXyYypiWNq8tenMfGCDWjjc
	 qyCCqaovrE3VZMyEecfJsPPmSWEP5Q+Kl2hGe/DwGVROtmFJ9mQAsR96SknphWsswQ
	 g/Ho4caIdBrAw==
Date: Sun, 10 Jan 2021 20:15:59 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ARM: dts: add Webasto ccbv2
Message-ID: <20210110121558.GH28365@dragon>
References: <20201216162544.9629-1-r.czerwinski@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216162544.9629-1-r.czerwinski@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Wed, Dec 16, 2020 at 05:25:43PM +0100, Rouven Czerwinski wrote:
> The Webasto Common Communication Board Version 2 is a i.MX6UL based
> board.
> 
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> ---
>  arch/arm/boot/dts/Makefile                 |   1 +
>  arch/arm/boot/dts/imx6ul-webasto-ccbv2.dts | 472 +++++++++++++++++++++
>  2 files changed, 473 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6ul-webasto-ccbv2.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index ce66ffd5a1bb..757e415a7979 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -626,6 +626,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ul-tx6ul-0010.dtb \
>  	imx6ul-tx6ul-0011.dtb \
>  	imx6ul-tx6ul-mainboard.dtb \
> +	imx6ul-webasto-ccbV2.dtb \
>  	imx6ull-14x14-evk.dtb \
>  	imx6ull-colibri-eval-v3.dtb \
>  	imx6ull-colibri-wifi-eval-v3.dtb \
> diff --git a/arch/arm/boot/dts/imx6ul-webasto-ccbv2.dts b/arch/arm/boot/dts/imx6ul-webasto-ccbv2.dts
> new file mode 100644
> index 000000000000..5c3bca6d2698
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ul-webasto-ccbv2.dts
> @@ -0,0 +1,472 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2019, Webasto SE
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ul.dtsi"
> +
> +/ {
> +	model = "Webasto common communication board version 2";
> +	compatible = "webasto,imx6ul-ccbv2", "fsl,imx6ul";
> +
> +	chosen {
> +		stdout-path = &uart7;
> +	};
> +
> +	reg_4v: regulator-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_+4V";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;

These two properties only make sense to regulators that have
enable/disable control.

> +	};
> +
> +	reg_wl18xx_vmmc: regulator-wl18xx {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wl1837";
> +		vin-supply = <&reg_4v>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <70000>;
> +		enable-active-high;
> +	};
> +
> +	reg_dp83822_en: regulator-dp83822 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dp83822";
> +		vin-supply = <&vcc_eth>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&gpio1 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enet1>;
> +	phy-mode = "rmii";
> +	phy-supply = <&reg_dp83822_en>;
> +	phy-handle = <&dp83822i>;
> +	phy-reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;

It's deprecated.

> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dp83822i: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +			clocks = <&clks IMX6UL_CLK_ENET_REF>;
> +			clock-names = "rmii-ref";
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	pmic: mc34pf3000@8 {

pfuze3000: pmic@8

> +		compatible = "fsl,pfuze3000";
> +		reg = <0x08>;

Have a newline between property list and child node.

> +		regulators {
> +			sw1a_reg: sw1a {
> +				regulator-name = "V_+3V3_SW1A";
> +				vin-supply = <&reg_4v>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;

Quite some regulators are marked as always-on.  Are you sure that's
reasonable?

> +				regulator-ramp-delay = <6250>;
> +			};

Have a newline between nodes.

> +			vdd_soc_in: sw1b {
> +				regulator-name = "V_+1V4_SW1B";
> +				vin-supply = <&reg_4v>;
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1475000>;
> +				regulator-ramp-delay = <6250>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +			sw2_reg: sw2 {
> +				regulator-name = "V_+3V3_SW2";
> +				vin-supply = <&reg_4v>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +			vcc_ddr3: sw3 {
> +				regulator-name = "V_+1V35_SW3";
> +				vin-supply = <&reg_4v>;
> +				regulator-min-microvolt = <1350000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +			swbst_reg: swbst {
> +				regulator-name = "V_+5V0_SWBST";
> +				vin-supply = <&reg_4v>;
> +				regulator-min-microvolt = <5000000>;
> +				regulator-max-microvolt = <5150000>;
> +			};
> +			vdd_snvs: vsnvs {
> +				regulator-name = "V_+3V0_SNVS";
> +				vin-supply = <&reg_4v>;
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +			vrefddr: vrefddr {
> +				regulator-name = "V_+0V675_VREFDDR";
> +				vin-supply = <&vcc_ddr3>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +			/* 3V3 Supply: i.MX6 modules */
> +			vgen1_reg: vldo1 {
> +				regulator-name = "V_+3V3_LDO1";
> +				vin-supply = <&reg_4v>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +			vgen2_reg: vldo2 {
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1550000>;
> +			};
> +			vgen3_reg: vccsd {
> +				regulator-min-microvolt = <2850000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +			vdd_high_in: v33 {
> +				regulator-name = "V_+3V3_V33";
> +				vin-supply = <&reg_4v>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +			vcc_eth: vldo3 {
> +				regulator-name = "V_+1V8_LDO3";
> +				vin-supply = <&reg_4v>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +			vgen6_reg: vldo4 {
> +				regulator-name = "V_+1V8_LDO4";
> +				vin-supply = <&reg_4v>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +&ecspi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1>;
> +	cs-gpios = <
> +		&gpio3 26 GPIO_ACTIVE_LOW
> +		&gpio3 10 GPIO_ACTIVE_LOW
> +		&gpio3 12 GPIO_ACTIVE_LOW
> +	>;
> +	status = "okay";
> +
> +	cc2520: spi@0 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_cc2520>;
> +		compatible = "ti,cc2520";
> +		reg = <0>;
> +		spi-max-frequency = <4000000>;
> +		fifo-gpio = <&gpio3 15 0>;
> +		fifop-gpio = <&gpio3 16 0>;
> +		sfd-gpio = <&gpio3 24 0>;
> +		cca-gpio = <&gpio3 20 0>;
> +		vreg-gpio = <&gpio3 19 0>;
> +		reset-gpio = <&gpio3 23 0>;
> +		vin-supply = <&sw2_reg>;
> +		status = "okay";

Unnecessary 'okay' status.

Shawn

> +	};
> +	qca7000: spi@1 {
> +		compatible = "qca,qca7000";
> +		reg = <1>;
> +		spi-max-frequency = <8000000>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <16 0x1>;
> +		spi-cpha;
> +		spi-cpol;
> +		status = "okay";
> +	};
> +	tfr7970: spi@2 {
> +		compatible = "ti,trf7970a";
> +		reg = <3>;
> +		spi-max-frequency = <2000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_trf7970>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <14 0>;
> +		ti,enable-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>, <&gpio3 17 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&reg_4v>;
> +		vdd-io-supply = <&sw2_reg>;
> +		autosuspend-delay = <30000>;
> +		clock-frequency = <27120000>;
> +		status = "okay";
> +	};
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart4>;
> +	status = "okay";
> +};
> +
> +&uart6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart6>;
> +	uart-has-rtscts;
> +	status = "okay";
> +	bluetooth {
> +		compatible = "ti,wl1835-st";
> +		enable-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&reg_4v>;
> +	};
> +};
> +
> +&uart7 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart7>;
> +	status = "okay";
> +};
> +
> +&usdhc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	bus-width = <4>;
> +	vmmc-supply = <&reg_wl18xx_vmmc>;
> +	non-removable;
> +	keep-power-in-suspend;
> +	cap-power-off-card;
> +	max-frequency = <25000000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	wlcore: wlcore@2 {
> +		compatible = "ti,wl1837";
> +		reg = <2>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
> +		tcxo-clock-frequency = <26000000>;
> +	};
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	bus-width = <8>;
> +	vmmc-supply = <&sw1a_reg>;
> +	no-1-8-v;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	keep-power-in-suspend;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	dr_mode = "host";
> +	disable-over-current;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_minipcie>;
> +	status = "okay";
> +};
> +
> +&wdog1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_wdog>;
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
> +
> +&reg_arm {
> +	vin-supply = <&vdd_soc_in>;
> +	regulator-allow-bypass;
> +};
> +
> +&reg_soc {
> +	vin-supply = <&vdd_soc_in>;
> +	regulator-allow-bypass;
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +
> +	pinctrl_enet1: enet1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
> +			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
> +			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
> +			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
> +			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
> +			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
> +			MX6UL_PAD_GPIO1_IO08__GPIO1_IO08	0x13030
> +			MX6UL_PAD_GPIO1_IO09__GPIO1_IO09	0x13030
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_UART5_TX_DATA__I2C2_SCL   0x4001b8b0
> +			MX6UL_PAD_UART5_RX_DATA__I2C2_SDA   0x4001b8b0
> +			MX6UL_PAD_UART4_RX_DATA__GPIO1_IO29 0x10000
> +		>;
> +	};
> +
> +	pinctrl_minipcie: minipciegrp {
> +		fsl,pins = <
> +			/* HYS=1, 100k PullDown, 50MHz, R0/6 */
> +			MX6UL_PAD_LCD_HSYNC__GPIO3_IO02   0x13030
> +			MX6UL_PAD_LCD_VSYNC__GPIO3_IO03   0x13030
> +			MX6UL_PAD_LCD_RESET__GPIO3_IO04   0x13030
> +			MX6UL_PAD_LCD_DATA03__GPIO3_IO08  0x13030
> +			MX6UL_PAD_LCD_DATA04__GPIO3_IO09  0x13030
> +		>;
> +	};
> +
> +	pinctrl_spi1: spi1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_LCD_DATA20__ECSPI1_SCLK 0x1b0b0
> +			MX6UL_PAD_LCD_DATA22__ECSPI1_MOSI 0x1b0b0
> +			MX6UL_PAD_LCD_DATA23__ECSPI1_MISO 0x1b0b0
> +			MX6UL_PAD_LCD_DATA05__GPIO3_IO10  0x17030
> +			MX6UL_PAD_NAND_DQS__GPIO4_IO16    0x17030
> +			MX6UL_PAD_LCD_DATA06__GPIO3_IO11  0x17030
> +			MX6UL_PAD_LCD_DATA13__GPIO3_IO18  0x10030
> +		>;
> +	};
> +
> +	pinctrl_cc2520: cc2520grp {
> +		fsl,pins = <
> +			MX6UL_PAD_LCD_DATA10__GPIO3_IO15  0x13030
> +			MX6UL_PAD_LCD_DATA11__GPIO3_IO16  0x13030
> +			MX6UL_PAD_LCD_DATA14__GPIO3_IO19  0x13030
> +			MX6UL_PAD_LCD_DATA15__GPIO3_IO20  0x13030
> +			MX6UL_PAD_LCD_DATA18__GPIO3_IO23  0x13030
> +			MX6UL_PAD_LCD_DATA19__GPIO3_IO24  0x13030
> +			MX6UL_PAD_LCD_DATA21__GPIO3_IO26  0x17030
> +
> +		>;
> +	};
> +
> +	pinctrl_trf7970: trf7970grp {
> +		fsl,pins = <
> +			MX6UL_PAD_LCD_DATA07__GPIO3_IO12  0x17030
> +			MX6UL_PAD_LCD_DATA02__GPIO3_IO07  0x10030
> +			MX6UL_PAD_LCD_DATA12__GPIO3_IO17  0x10030
> +			MX6UL_PAD_LCD_DATA09__GPIO3_IO14  0x17000
> +		>;
> +	};
> +
> +	pinctrl_uart3: uart3grp {
> +		fsl,pins = <
> +			MX6UL_PAD_NAND_READY_B__UART3_DCE_TX  0x1b0b0
> +			MX6UL_PAD_NAND_CE0_B__UART3_DCE_RX    0x1b0b0
> +			MX6UL_PAD_NAND_CE1_B__UART3_DCE_CTS   0x1b0b0
> +			MX6UL_PAD_NAND_CLE__UART3_DCE_RTS     0x1b0b0
> +			MX6UL_PAD_LCD_DATA08__GPIO3_IO13      0x13030
> +			MX6UL_PAD_NAND_WP_B__GPIO4_IO11       0x13030
> +			MX6UL_PAD_NAND_DQS__GPIO4_IO16        0x13030
> +		>;
> +	};
> +
> +	pinctrl_uart4: uart4grp {
> +		fsl,pins = <
> +			MX6UL_PAD_LCD_CLK__UART4_DCE_TX	      0x1b0b0
> +			MX6UL_PAD_LCD_ENABLE__UART4_DCE_RX    0x1b0b0
> +		>;
> +	};
> +
> +	pinctrl_uart6: uart6grp {
> +		fsl,pins = <
> +			MX6UL_PAD_CSI_MCLK__UART6_DCE_TX      0x1b0b0
> +			MX6UL_PAD_CSI_PIXCLK__UART6_DCE_RX    0x1b0b0
> +			MX6UL_PAD_CSI_VSYNC__UART6_DCE_RTS    0x1b0b0
> +			MX6UL_PAD_CSI_HSYNC__UART6_DCE_CTS    0x1b0b0
> +			MX6UL_PAD_ENET2_TX_DATA0__GPIO2_IO11  0x10030
> +			MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT  0x00010
> +		>;
> +	};
> +
> +	pinctrl_uart7: uart7grp {
> +		fsl,pins = <
> +			MX6UL_PAD_LCD_DATA16__UART7_DCE_TX    0x1b0b0
> +			MX6UL_PAD_LCD_DATA17__UART7_DCE_RX    0x1b0b0
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_SD1_CMD__USDHC1_CMD        0x10059
> +			MX6UL_PAD_SD1_CLK__USDHC1_CLK        0x10059
> +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0    0x10059
> +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1    0x10059
> +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2    0x10059
> +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3    0x10059
> +			MX6UL_PAD_CSI_DATA00__GPIO4_IO21     0x17000
> +			MX6UL_PAD_CSI_DATA01__GPIO4_IO22     0x10030
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_NAND_RE_B__USDHC2_CLK      0x100e9
> +			MX6UL_PAD_NAND_WE_B__USDHC2_CMD      0x100e9
> +			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0  0x100e9
> +			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1  0x100e9
> +			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2  0x100e9
> +			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3  0x100e9
> +			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4  0x100e9
> +			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5  0x100e9
> +			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6  0x100e9
> +			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7  0x100e9
> +			MX6UL_PAD_NAND_ALE__GPIO4_IO10       0x10030
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdoggrp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO01__WDOG1_WDOG_B	0x00b0
> +		>;
> +	};
> +};
> -- 
> 2.29.2
> 
