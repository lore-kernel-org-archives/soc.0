Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E51C7619A
	for <soc@archiver.kernel.org>; Mon, 27 Mar 2023 02:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 220F3C4339B; Mon, 27 Mar 2023 02:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6AFC433EF;
	Mon, 27 Mar 2023 02:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679885116;
	bh=AiEbgLzIhGbD6g6j2H0IM5fDCH/xy7CmlIhEelLot2k=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=lGsTdYoHJpkcbpi1ryl9j1nwn7PTU1753FYC/owq7PtipZUJ8hDG+XZADL9ncVv+1
	 uDasc1xtzbJoU4BTZbZa0QdMiEspaN9XA2r+zcj13P9/FgjsoJ4MQ0QCgw3cancOUS
	 Y5b2y39BDaEoEqD7m5U5Gd+mhiZYxI+bNzs0Jn/RLPwyBYC9EA/XRFQo2A46RU1et4
	 uwKZjfVhPfpggIghUud0jTWL/MOgh6NP6twgcexXbRNlqIXnleLgeXI07H1CdXnXGZ
	 541yNODHnkx1JdlGxMFw/3CW/I/xQcFfncWr2jESn+2H4EIHvRpblrLtrevCGZlGYx
	 mj3RTfSg555Lw==
Date: Mon, 27 Mar 2023 10:45:07 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, arnd@arndb.de,
	olof@lixom.net, soc@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	marex@denx.de, max.krummenacher@toradex.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] ARM: dts: imx: Add devicetree for Tolino Vison
Message-ID: <20230327024507.GG3364759@dragon>
References: <20230317081618.2387407-1-andreas@kemnade.info>
 <20230317081618.2387407-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317081618.2387407-3-andreas@kemnade.info>

On Fri, Mar 17, 2023 at 09:16:18AM +0100, Andreas Kemnade wrote:
> Add a devicetree for the Tolino Vision Ebook reader. It is based
> on boards marked with "37NB-E60Q30+4A3". It is equipped with an i.MX6SL
> SoC.
> 
> Expected to work:
>  - Buttons
>  - Wifi
>  - LEDs
>  - uSD
>  - eMMC
>  - USB
>  - RTC
>  - Touchscreen
>  - Backlight
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/Makefile                 |   1 +
>  arch/arm/boot/dts/imx6sl-tolino-vision.dts | 490 +++++++++++++++++++++
>  2 files changed, 491 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6sl-tolino-vision.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index efe4152e5846..159363f46522 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -690,6 +690,7 @@ dtb-$(CONFIG_SOC_IMX6SL) += \
>  	imx6sl-kobo-aura2.dtb \
>  	imx6sl-tolino-shine2hd.dtb \
>  	imx6sl-tolino-shine3.dtb \
> +	imx6sl-tolino-vision.dtb \
>  	imx6sl-tolino-vision5.dtb \
>  	imx6sl-warp.dtb
>  dtb-$(CONFIG_SOC_IMX6SLL) += \
> diff --git a/arch/arm/boot/dts/imx6sl-tolino-vision.dts b/arch/arm/boot/dts/imx6sl-tolino-vision.dts
> new file mode 100644
> index 000000000000..035d1dea42c4
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6sl-tolino-vision.dts
> @@ -0,0 +1,490 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device tree for the Tolino Vison ebook reader
> + *
> + * Name on mainboard is: 37NB-E60Q30+4A3
> + * Serials start with: 6032
> + *
> + * Copyright 2023 Andreas Kemnade
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include "imx6sl.dtsi"
> +
> +/ {
> +	model = "Tolino Vision";
> +	compatible = "kobo,tolino-vision", "fsl,imx6sl";
> +
> +	aliases {
> +		mmc0 = &usdhc4;
> +		mmc1 = &usdhc2;
> +	};
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&ec 0 50000>;
> +		power-supply = <&backlight_regulator>;
> +	};
> +
> +	backlight_regulator: regulator-backlight {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_backlight_power>;
> +		regulator-name = "backlight";
> +		gpio = <&gpio2 10 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart1;
> +	};
> +
> +	gpio_keys: gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_keys>;
> +
> +		key-cover {
> +			/* magnetic sensor in the corner next to the uSD slot */
> +			label = "Cover";
> +			gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
> +			linux,code = <SW_LID>;
> +			linux,input-type = <EV_SW>;
> +			wakeup-source;
> +		};
> +
> +		key-fl {
> +			label = "Frontlight";
> +			gpios = <&gpio3 26 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_BRIGHTNESS_CYCLE>;
> +		};
> +
> +		key-power {
> +			label = "Power";
> +			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_POWER>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	leds: leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_leds>;
> +
> +		led-0 {
> +			/* LED on home button */
> +			color = <LED_COLOR_ID_WHITE>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-1 {
> +			/* LED on power button */
> +			color = <LED_COLOR_ID_WHITE>;
> +			function = LED_FUNCTION_POWER;
> +			gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "timer";
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	reg_wifi: regulator-wifi {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_wifi_power>;
> +		regulator-name = "SD3_SPWR";
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +		gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
> +	};
> +
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_wifi_reset>;
> +		post-power-on-delay-ms = <20>;
> +		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default","sleep";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1_sleep>;
> +	status = "okay";
> +
> +	touchscreen@15 {
> +		compatible = "elan,ektf2132";
> +		reg = <0x15>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ts>;
> +		power-gpios = <&gpio5 13 GPIO_ACTIVE_HIGH>;
> +		interrupts-extended = <&gpio5 6 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	accelerometer@1d {
> +		reg = <0x1d>;
> +		compatible = "fsl,mma8652";

Flipped the order of these two.  Applied both, thanks!

Shawn

> +	};
> +};
