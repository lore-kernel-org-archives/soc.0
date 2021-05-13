Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9077C433ED
	for <soc@archiver.kernel.org>; Thu, 13 May 2021 03:36:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9BEC761352; Thu, 13 May 2021 03:36:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B098611AB;
	Thu, 13 May 2021 03:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620877000;
	bh=HR141LPncVfcn6VfIq0QvPydlKPGVFjz1cNOvIRHAGE=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ZEgu1yuyp3xrnCZbw74UlGx8Iq9pw/rPeWxuyQm4ougBHqTDs40p6FoRePux2q6OH
	 4Dclj9cL8LKV5OglJxfWF1DOE9/9co4b7eJaw/ERy07LYLkc46WApdP3GSlr0iK8Vr
	 dyTzr5Jpd+d4+wZZUwjdfJTgg6EcJSxHMJoYmaAllQyARemBjB/Oapc+uPs/laXp++
	 U1oukR66DNgKX17nrkLAjwvTpwVIVJJR1R8vlu21Z8C6Udx3gonE3l9IVsmFC5SIZc
	 ZoVqVc0y56DqMFnJ+UahhXMzne2u4asze0oIiUkiUmVg/jgolGYuCXTPBewdeQwR6t
	 TrgDAFWSphiCw==
Date: Thu, 13 May 2021 11:36:34 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: imx28: Add DTS description of imx28 based
 XEA board
Message-ID: <20210513033631.GL3425@dragon>
References: <20210409122036.31628-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409122036.31628-1-lukma@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Apr 09, 2021 at 02:20:36PM +0200, Lukasz Majewski wrote:
> This patch adds DTS definition of the imx278 based XEA board.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> 
> ---
> Changes for v2:
> - Fix 'memory' node and remove regulators subnode
> - Rename 'flash0: s25fl256s0@0' to flash@0
> - Add proper compatible for XEA board
> ---
>  arch/arm/boot/dts/Makefile       |   3 +-
>  arch/arm/boot/dts/imx28-lwe.dtsi | 174 +++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/imx28-xea.dts  |  99 ++++++++++++++++++
>  3 files changed, 275 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/imx28-lwe.dtsi
>  create mode 100644 arch/arm/boot/dts/imx28-xea.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 8e5d4ab4e75e..d2398a090e4d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -721,7 +721,8 @@ dtb-$(CONFIG_ARCH_MXS) += \
>  	imx28-m28evk.dtb \
>  	imx28-sps1.dtb \
>  	imx28-ts4600.dtb \
> -	imx28-tx28.dtb
> +	imx28-tx28.dtb \
> +	imx28-xea.dtb
>  dtb-$(CONFIG_ARCH_NOMADIK) += \
>  	ste-nomadik-s8815.dtb \
>  	ste-nomadik-nhk15.dtb
> diff --git a/arch/arm/boot/dts/imx28-lwe.dtsi b/arch/arm/boot/dts/imx28-lwe.dtsi
> new file mode 100644
> index 000000000000..2d14a8ae91f8
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx28-lwe.dtsi
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2021
> + * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
> + */
> +
> +/dts-v1/;
> +#include "imx28.dtsi"
> +
> +/ {
> +	aliases {
> +		spi2 = &ssp3;
> +	};
> +
> +	chosen {
> +		bootargs = "root=/dev/mmcblk0p2 rootfstype=ext4 ro rootwait console=ttyAMA0,115200 panic=1";

Shouldn't it come from bootloader?

> +	};
> +
> +	memory@0x40000000 {

memory@40000000

> +		reg = <0x40000000 0x08000000>;
> +	};
> +
> +	reg_3v3: regulator-reg-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;

regulator-always-on makes no sense to a regulator that doesn't on/off
control at all.

> +	};
> +
> +	reg_usb_5v: regulator-reg-usb-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;

enable-active-high is meaningful only when there is a GPIO controlling
on/off.

> +	};
> +
> +	reg_fec_3v3: regulator-reg-fec-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fec-phy";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		regulator-boot-on;

Ditto

> +	};
> +};
> +
> +&duart {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&duart_pins_a>;
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins_a>;
> +	status = "okay";
> +};
> +
> +&saif0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&saif0_pins_a>;
> +	#sound-dai-cells = <0>;
> +	assigned-clocks = <&clks 53>;
> +	assigned-clock-rates = <12000000>;
> +	status = "okay";
> +};
> +
> +&saif1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&saif1_pins_a>;
> +	fsl,saif-master = <&saif0>;
> +	#sound-dai-cells = <0>;
> +	status = "okay";
> +};
> +
> +&spi3_pins_a {
> +	fsl,pinmux-ids = <
> +		MX28_PAD_AUART2_RX__SSP3_D4
> +		MX28_PAD_AUART2_TX__SSP3_D5
> +		MX28_PAD_SSP3_SCK__SSP3_SCK
> +		MX28_PAD_SSP3_MOSI__SSP3_CMD
> +		MX28_PAD_SSP3_MISO__SSP3_D0
> +		MX28_PAD_SSP3_SS0__SSP3_D3
> +		MX28_PAD_AUART2_TX__GPIO_3_9
> +	>;
> +};
> +
> +&ssp3 {
> +	compatible = "fsl,imx28-spi";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi3_pins_a>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		spi-max-frequency = <40000000>;
> +		reg = <0>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "u-boot";
> +				reg = <0 0x80000>;
> +				read-only;
> +			};
> +
> +			partition@80000 {
> +				label = "env0";
> +				reg = <0x80000 0x10000>;
> +			};
> +
> +			partition@90000 {
> +				label = "env1";
> +				reg = <0x90000 0x10000>;
> +			};
> +
> +			partition@100000 {
> +				label = "kernel";
> +				reg = <0x100000 0x400000>;
> +			};
> +
> +			partition@500000 {
> +				label = "swupdate";
> +				reg = <0x500000 0x800000>;
> +			};
> +		};
> +	};
> +};
> +
> +&ssp2 {
> +	compatible = "fsl,imx28-spi";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi2_pins_a>;
> +	status = "okay";
> +};
> +
> +&ssp0 {
> +	compatible = "fsl,imx28-mmc";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_8bit_pins_a>;
> +	bus-width = <8>;
> +	vmmc-supply = <&reg_3v3>;
> +	non-removable;
> +	status = "okay";
> +};

The order should be like:

&ssp0
&ssp2
&ssp3

> +
> +&usb0 {
> +	vbus-supply = <&reg_usb_5v>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb0_pins_b>, <&usb0_id_pins_a>;
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usbphy0 {
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	vbus-supply = <&reg_usb_5v>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb1_pins_b>;
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usbphy1 {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/imx28-xea.dts b/arch/arm/boot/dts/imx28-xea.dts
> new file mode 100644
> index 000000000000..a400c108f66a
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx28-xea.dts
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2021
> + * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
> + */
> +
> +/dts-v1/;
> +#include "imx28-lwe.dtsi"
> +
> +/ {
> +	compatible = "lwn,imx28-xea", "fsl,imx28";

Compatible needs to be documented.

> +};
> +
> +&can0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&can1_pins_a>;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins_b>;
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hog_pins_a &hog_pins_tiva>;
> +
> +	hog_pins_a: hog@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_GPMI_D00__GPIO_0_0
> +			MX28_PAD_GPMI_D02__GPIO_0_2
> +			MX28_PAD_GPMI_D05__GPIO_0_5
> +			MX28_PAD_GPMI_CE1N__GPIO_0_17
> +			MX28_PAD_GPMI_RDY0__GPIO_0_20
> +			MX28_PAD_GPMI_RDY1__GPIO_0_21
> +			MX28_PAD_GPMI_RDY2__GPIO_0_22
> +			MX28_PAD_GPMI_RDN__GPIO_0_24
> +			MX28_PAD_GPMI_CLE__GPIO_0_27
> +			MX28_PAD_LCD_VSYNC__GPIO_1_28
> +			MX28_PAD_SSP1_SCK__GPIO_2_12
> +			MX28_PAD_SSP1_CMD__GPIO_2_13
> +			MX28_PAD_SSP2_SS1__GPIO_2_20
> +			MX28_PAD_SSP2_SS2__GPIO_2_21
> +			MX28_PAD_LCD_D00__GPIO_1_0
> +			MX28_PAD_LCD_D01__GPIO_1_1
> +			MX28_PAD_LCD_D02__GPIO_1_2
> +			MX28_PAD_LCD_D03__GPIO_1_3
> +			MX28_PAD_LCD_D04__GPIO_1_4
> +			MX28_PAD_LCD_D05__GPIO_1_5
> +			MX28_PAD_LCD_D06__GPIO_1_6
> +		>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +	};
> +
> +	hog_pins_tiva: hog@1 {
> +		reg = <1>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_GPMI_RDY3__GPIO_0_23
> +			MX28_PAD_GPMI_WRN__GPIO_0_25
> +		>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +	};
> +
> +	hog_pins_coding: hog@2 {
> +		reg = <2>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_GPMI_D01__GPIO_0_1
> +			MX28_PAD_GPMI_D03__GPIO_0_3
> +			MX28_PAD_GPMI_D04__GPIO_0_4
> +			MX28_PAD_GPMI_D06__GPIO_0_6
> +			MX28_PAD_GPMI_D07__GPIO_0_7
> +		>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +	};
> +};
> +
> +&reg_fec_3v3 {
> +	gpio = <&gpio0 0 0>;
> +};
> +
> +&reg_usb_5v {
> +	gpio = <&gpio0 2 0>;
> +};
> +
> +&spi2_pins_a {

Out of order.

Shawn

> +	fsl,pinmux-ids = <
> +		MX28_PAD_SSP2_SCK__SSP2_SCK
> +		MX28_PAD_SSP2_MOSI__SSP2_CMD
> +		MX28_PAD_SSP2_MISO__SSP2_D0
> +		MX28_PAD_SSP2_SS0__GPIO_2_19
> +	>;
> +};
> -- 
> 2.20.1
> 
