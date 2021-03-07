Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AEAC433E0
	for <soc@archiver.kernel.org>; Sun,  7 Mar 2021 13:02:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 19C68650FD; Sun,  7 Mar 2021 13:02:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3325A65100;
	Sun,  7 Mar 2021 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615122156;
	bh=Z7tHrzSv3UdenUINfxuYyWAGZJtKAXwCzMkFcmp+HWw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=pK4Df0ZYG0pE/03AI5EITASGk+Cuq0p3LssNZgKnRGHXJ9zoxDC147JZp5QSTAxlQ
	 Xqe6IFNKxsSqX/A+iFP+k2SedffKxxM9IGC5G6BAxDJUApY310qqHCsK8ytWWIM91T
	 BOOOOOIAfBSejFkCB8IO2VIu4LXXaKjFEzH6n+C1qknArlVUBaSj1b8sm7McW/wV/X
	 p4Ye34bZrQESzGB+kzVPq6SZCELIeTKDbmUWmIthWiuaTM0BJDxmJcYkVpoV/c+UXP
	 nK8HcV2hQSPucHrjDaNypoJQJ2PHlE0K+wyKNPAEbhoxmOE3pr3IE5LDDsTrHK+3T+
	 /KIZalUyve37Q==
Date: Sun, 7 Mar 2021 21:02:28 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oliver Graute <oliver.graute@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: m.felsch@pengutronix.de, festevam@gmail.com, narmstrong@baylibre.com,
	Parthiban Nallathambi <parthitce@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/3] ARM: dts: Add support for i.MX6 UltraLite DART
 Variscite Customboard
Message-ID: <20210307130227.GB543@dragon>
References: <1613308450-27958-1-git-send-email-oliver.graute@gmail.com>
 <1613308450-27958-3-git-send-email-oliver.graute@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613308450-27958-3-git-send-email-oliver.graute@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Sun, Feb 14, 2021 at 02:13:49PM +0100, Oliver Graute wrote:
> This patch adds DeviceTree Source for the i.MX6 UltraLite DART NAND/WIFI
> 
> Signed-off-by: Oliver Graute <oliver.graute@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Parthiban Nallathambi <parthitce@gmail.com>
> ---
> Changelog:
> 
> v9:
>  - removed display-timing node
>  - added 5V power supply for display
>  - added assigned clocks for display
> 
> v8:
>  - backlight droped the status line
>  - port the display panel
>  - added pinctrl for touch
> 
> v7:
>  - fixed wakeup-source
> 
> v6:
>  - added some muxing
>  - added codec in sound node
>  - added adc1 node
> 
>  arch/arm/boot/dts/Makefile                      |   1 +
>  arch/arm/boot/dts/imx6ul-var-6ulcustomboard.dts | 255 ++++++++++++++++++++++++
>  2 files changed, 256 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6ul-var-6ulcustomboard.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index ce66ffd..9f72446 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -626,6 +626,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ul-tx6ul-0010.dtb \
>  	imx6ul-tx6ul-0011.dtb \
>  	imx6ul-tx6ul-mainboard.dtb \
> +	imx6ul-var-6ulcustomboard.dtb \
>  	imx6ull-14x14-evk.dtb \
>  	imx6ull-colibri-eval-v3.dtb \
>  	imx6ull-colibri-wifi-eval-v3.dtb \
> diff --git a/arch/arm/boot/dts/imx6ul-var-6ulcustomboard.dts b/arch/arm/boot/dts/imx6ul-var-6ulcustomboard.dts
> new file mode 100644
> index 00000000..bf18888
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ul-var-6ulcustomboard.dts
> @@ -0,0 +1,255 @@
> +// SPDX-License-Identifier: (GPL-2.0)
> +/*
> + * Support for Variscite DART-6UL Module
> + *
> + * Copyright (C) 2015 Freescale Semiconductor, Inc.
> + * Copyright (C) 2015-2016 Variscite Ltd. - http://www.variscite.com
> + * Copyright (C) 2018-2021 Oliver Graute <oliver.graute@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include "imx6ul-imx6ull-var-dart-common.dtsi"
> +
> +/ {
> +	model = "Variscite i.MX6 UltraLite Carrier-board";
> +	compatible = "variscite,6ulcustomboard", "fsl,imx6ul";
> +
> +	backlight_lcd: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm1 0 20000>;
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <6>;
> +		status = "okay";

We use 'okay' status to flip 'disabled' devices.  It's not needed here.

> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_keys>;
> +
> +		user {
> +			gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_BACK>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_leds>;
> +
> +		d16-led {
> +			gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	panel1: panel-lcd {
> +		compatible = "sgd,gktw70sdad1sd";

Unsupported/undocumented compatible?

> +

Unnecessary newline.

> +		backlight = <&backlight_lcd>;
> +		label = "gktw70sdad1sd";

What is 'label' for?

> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lcdif_out>;
> +			};
> +		};
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "wm8731audio";
> +		simple-audio-card,widgets =
> +			"Headphone", "Headphone Jack",
> +			"Line", "Line Jack",
> +			"Microphone", "Mic Jack";
> +		simple-audio-card,routing =
> +			"Headphone Jack", "RHPOUT",
> +			"Headphone Jack", "LHPOUT",
> +			"LLINEIN", "Line Jack",
> +			"RLINEIN", "Line Jack",
> +			"MICIN", "Mic Bias",
> +			"Mic Bias", "Mic Jack";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,bitclock-master = <&codec_dai>;
> +		simple-audio-card,frame-master = <&codec_dai>;
> +
> +		codec_dai: simple-audio-card,codec {
> +			sound-dai = <&wm8731>;
> +			system-clock-frequency = <12288000>;
> +		};
> +	};
> +};
> +
> +&adc1 {
> +	status = "okay";
> +};
> +
> +&can1 {
> +	status = "okay";
> +};
> +
> +&can2 {
> +	status = "okay";
> +};
> +
> +&fec1 {
> +	status = "okay";
> +};
> +
> +&fec2 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	clock_frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	status = "okay";
> +
> +	wm8731: audio-codec@1a {
> +		compatible = "wlf,wm8731";
> +		reg = <0x1a>;
> +		#sound-dai-cells = <0>;
> +		clocks = <&clks IMX6UL_CLK_SAI2>;
> +		clock-names = "mclk";
> +	};
> +
> +	touchscreen@38 {
> +		compatible = "edt,edt-ft5x06";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touch>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <4 IRQ_TYPE_NONE>;
> +		touchscreen-size-x = <800>;
> +		touchscreen-size-y = <480>;
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +		wakeup-source;
> +	};
> +
> +	rtc@68 {
> +		compatible = "dallas,ds1337";
> +		reg = <0x68>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rtc>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +};
> +
> +&lcdif {
> +	assigned-clocks = <&clks IMX6UL_CLK_LCDIF_PRE_SEL>;
> +	assigned-clock-parents = <&clks IMX6UL_CLK_PLL5_VIDEO_DIV>;
> +	pinctrl-names = "default";
> +	power-supply = <&reg_5v0>;
> +	pinctrl-0 = <&pinctrl_lcdif>;
> +	status = "okay";
> +
> +	port {
> +		lcdif_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
> +};
> +
> +&pwm1 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	disable-over-current;
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	disable-over-current;
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_gpio_keys: gpio_keysgrp {

gpiokeysgrp maybe?  We do not recommend underscore in node name.  Hyphen
is preferred.

Shawn

> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x17059
> +		>;
> +	};
> +
> +	pinctrl_gpio_leds: gpioledsgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_CSI_HSYNC__GPIO4_IO20		0x1b0b0
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_UART5_TX_DATA__I2C2_SCL	0x4001b8b0
> +			MX6UL_PAD_UART5_RX_DATA__I2C2_SDA	0x4001b8b0
> +		>;
> +	};
> +
> +	pinctrl_lcdif: lcdif {
> +		fsl,pins = <
> +			MX6UL_PAD_LCD_DATA02__LCDIF_DATA02	0x79
> +			MX6UL_PAD_LCD_DATA03__LCDIF_DATA03	0x79
> +			MX6UL_PAD_LCD_DATA04__LCDIF_DATA04	0x79
> +			MX6UL_PAD_LCD_DATA05__LCDIF_DATA05	0x79
> +			MX6UL_PAD_LCD_DATA06__LCDIF_DATA06	0x79
> +			MX6UL_PAD_LCD_DATA07__LCDIF_DATA07	0x79
> +			MX6UL_PAD_LCD_DATA10__LCDIF_DATA10	0x79
> +			MX6UL_PAD_LCD_DATA11__LCDIF_DATA11	0x79
> +			MX6UL_PAD_LCD_DATA12__LCDIF_DATA12	0x79
> +			MX6UL_PAD_LCD_DATA13__LCDIF_DATA13	0x79
> +			MX6UL_PAD_LCD_DATA14__LCDIF_DATA14	0x79
> +			MX6UL_PAD_LCD_DATA15__LCDIF_DATA15	0x79
> +			MX6UL_PAD_LCD_DATA18__LCDIF_DATA18	0x79
> +			MX6UL_PAD_LCD_DATA19__LCDIF_DATA19	0x79
> +			MX6UL_PAD_LCD_DATA20__LCDIF_DATA20	0x79
> +			MX6UL_PAD_LCD_DATA21__LCDIF_DATA21	0x79
> +			MX6UL_PAD_LCD_DATA22__LCDIF_DATA22	0x79
> +			MX6UL_PAD_LCD_DATA23__LCDIF_DATA23	0x79
> +			MX6UL_PAD_LCD_CLK__LCDIF_CLK		0x79
> +			MX6UL_PAD_LCD_ENABLE__LCDIF_ENABLE	0x79
> +		>;
> +	};
> +
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_SNVS_TAMPER7__GPIO5_IO07	0x1b0b0
> +		>;
> +	};
> +
> +	pinctrl_touch: touchgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_LCD_RESET__GPIO3_IO04		0x80000000
> +		>;
> +	};
> +
> +};
> -- 
> 2.7.4
> 
