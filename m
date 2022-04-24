Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D833C433EF
	for <soc@archiver.kernel.org>; Sun, 24 Apr 2022 13:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66776C385A9; Sun, 24 Apr 2022 13:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A1EC385A7;
	Sun, 24 Apr 2022 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650805335;
	bh=jdW2GLO3VeG8C4KGHY8tjnorAW+qhR75JPlEhHE0M+I=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Ahv9oXOeaQBvpcRLwDdW/H5LngYVOl/lEqqw6J6C0OpiFw+0608qi2PyyWQQQNrg3
	 RUpauVxy8XFWOhASdITKbmub8klCs8yMtp0+dDdPTNFX947Ql/VLjHJxVPnOEmdMWt
	 XXxZBedJDkqvPggWWwx4IUSmZ3QzNFprJF7Z2L/Q5jZ1xI+d3WdKaeHCzFV0VxF6tw
	 OBfJx//qtNOlErwdc/vuJDrOFsJtV350qSBQQixpBfWlBcwt94FkZzr9m7J/uOzbbA
	 wCF7bcdWIdKIBWUJ25GNfBW5mIOwmYod/MLrKCpal42+u8CIrW+2T7gxEf4VygwEFP
	 nG6ZjwVGUerJg==
Date: Sun, 24 Apr 2022 21:02:07 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marcel Ziswiler <marcel@ziswiler.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Denys Drozdov <denys.drozdov@toradex.com>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>, Olof Johansson <olof@lixom.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, soc@kernel.org
Subject: Re: [PATCH v1 10/14] ARM: dts: imx6ull-colibri: add support for
 toradex iris carrier boards
Message-ID: <20220424130207.GU391514@dragon>
References: <20220414085106.18621-1-marcel@ziswiler.com>
 <20220414085106.18621-11-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414085106.18621-11-marcel@ziswiler.com>

On Thu, Apr 14, 2022 at 10:51:02AM +0200, Marcel Ziswiler wrote:
> From: Denys Drozdov <denys.drozdov@toradex.com>
> 
> Add support for Toradex Iris, small form-factor Pico-ITX Colibri Arm
> Computer Module family carrier boards.
> 
> Iris Device Trees:
> - imx6ull-colibri-iris.dtb
> - imx6ull-colibri-emmc-iris.dtb
> - imx6ull-colibri-wifi-iris.dtb
> 
> Iris-V2 Device Trees:
> - imx6ull-colibri-iris-v2.dtb
> - imx6ull-colibri-emmc-iris-v2.dtb
> - imx6ull-colibri-wifi-iris-v2.dtb
> 
> Signed-off-by: Denys Drozdov <denys.drozdov@toradex.com>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> ---
> 
>  arch/arm/boot/dts/Makefile                    |   6 +
>  .../boot/dts/imx6ull-colibri-emmc-iris-v2.dts |  17 +++
>  .../boot/dts/imx6ull-colibri-emmc-iris.dts    |  17 +++
>  .../dts/imx6ull-colibri-emmc-nonwifi.dtsi     |   4 +-
>  arch/arm/boot/dts/imx6ull-colibri-eval-v3.dts |   6 +-
>  .../arm/boot/dts/imx6ull-colibri-eval-v3.dtsi |   5 +-
>  arch/arm/boot/dts/imx6ull-colibri-iris-v2.dts |  28 ++++
>  .../arm/boot/dts/imx6ull-colibri-iris-v2.dtsi |  27 ++++
>  arch/arm/boot/dts/imx6ull-colibri-iris.dts    |  20 +++
>  arch/arm/boot/dts/imx6ull-colibri-iris.dtsi   | 132 ++++++++++++++++++
>  .../arm/boot/dts/imx6ull-colibri-nonwifi.dtsi |   4 +-
>  .../boot/dts/imx6ull-colibri-wifi-eval-v3.dts |   4 +-
>  .../boot/dts/imx6ull-colibri-wifi-iris-v2.dts |  28 ++++
>  .../boot/dts/imx6ull-colibri-wifi-iris.dts    |  20 +++
>  arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi   |   4 +-
>  arch/arm/boot/dts/imx6ull-colibri.dtsi        |   4 +-
>  16 files changed, 311 insertions(+), 15 deletions(-)
>  create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-iris-v2.dts
>  create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-iris.dts
>  create mode 100644 arch/arm/boot/dts/imx6ull-colibri-iris-v2.dts
>  create mode 100644 arch/arm/boot/dts/imx6ull-colibri-iris-v2.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6ull-colibri-iris.dts
>  create mode 100644 arch/arm/boot/dts/imx6ull-colibri-iris.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6ull-colibri-wifi-iris-v2.dts
>  create mode 100644 arch/arm/boot/dts/imx6ull-colibri-wifi-iris.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 252353fb4e3b..53b41ef092d9 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -705,8 +705,14 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ul-tx6ul-mainboard.dtb \
>  	imx6ull-14x14-evk.dtb \
>  	imx6ull-colibri-emmc-eval-v3.dtb \
> +	imx6ull-colibri-emmc-iris.dtb \
> +	imx6ull-colibri-emmc-iris-v2.dtb \
>  	imx6ull-colibri-eval-v3.dtb \
> +	imx6ull-colibri-iris.dtb \
> +	imx6ull-colibri-iris-v2.dtb \
>  	imx6ull-colibri-wifi-eval-v3.dtb \
> +	imx6ull-colibri-wifi-iris.dtb \
> +	imx6ull-colibri-wifi-iris-v2.dtb \
>  	imx6ull-jozacp.dtb \
>  	imx6ull-myir-mys-6ulx-eval.dtb \
>  	imx6ull-opos6uldev.dtb \
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-emmc-iris-v2.dts b/arch/arm/boot/dts/imx6ull-colibri-emmc-iris-v2.dts
> new file mode 100644
> index 000000000000..b9060c2f7977
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ull-colibri-emmc-iris-v2.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2022 Toradex
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull-colibri-emmc-nonwifi.dtsi"
> +#include "imx6ull-colibri-iris-v2.dtsi"
> +
> +/ {
> +	model = "Toradex Colibri iMX6ULL 1G (eMMC) on Colibri Iris V2";
> +	compatible = "toradex,colibri-imx6ull-iris-v2",
> +		     "toradex,colibri-imx6ull-emmc",
> +		     "toradex,colibri-imx6ull",
> +		     "fsl,imx6ull";
> +};
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-emmc-iris.dts b/arch/arm/boot/dts/imx6ull-colibri-emmc-iris.dts
> new file mode 100644
> index 000000000000..0ab71f2f5daa
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ull-colibri-emmc-iris.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2022 Toradex
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull-colibri-emmc-nonwifi.dtsi"
> +#include "imx6ull-colibri-iris.dtsi"
> +
> +/ {
> +	model = "Toradex Colibri iMX6ULL 1GB (eMMC) on Colibri Iris";
> +	compatible = "toradex,colibri-imx6ull-emmc-iris",
> +		     "toradex,colibri-imx6ull-emmc",
> +		     "toradex,colibri-imx6ull",
> +		     "fsl,imx6ull";
> +};
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi b/arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi
> index a099abfdfa27..1d75bc671f75 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi
> @@ -1,6 +1,6 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>  /*
> - * Copyright 2021 Toradex
> + * Copyright 2022 Toradex
>   */
>  
>  #include "imx6ull-colibri.dtsi"
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dts b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dts
> index 08669a18349e..9bf7111d7b00 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dts
> +++ b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dts
> @@ -1,6 +1,6 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>  /*
> - * Copyright 2018 Toradex AG
> + * Copyright 2018-2022 Toradex
>   */
>  
>  /dts-v1/;
> @@ -9,6 +9,6 @@
>  #include "imx6ull-colibri-eval-v3.dtsi"
>  
>  / {
> -	model = "Toradex Colibri iMX6ULL 256MB on Colibri Evaluation Board V3";
> +	model = "Toradex Colibri iMX6ULL 256/512MB on Colibri Evaluation Board V3";
>  	compatible = "toradex,colibri-imx6ull-eval", "fsl,imx6ull";
>  };
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
> index 3c07b4273e80..08197c66af12 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
> @@ -1,6 +1,6 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>  /*
> - * Copyright 2017 Toradex AG
> + * Copyright 2017-2022 Toradex
>   */
>  
>  / {
> @@ -121,6 +121,7 @@ &uart5 {
>  };
>  
>  &usbotg1 {
> +	vbus-supply = <&reg_usbh_vbus>;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-iris-v2.dts b/arch/arm/boot/dts/imx6ull-colibri-iris-v2.dts
> new file mode 100644
> index 000000000000..47940a4ba6e6
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ull-colibri-iris-v2.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2018-2022 Toradex
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull-colibri-nonwifi.dtsi"
> +#include "imx6ull-colibri-iris-v2.dtsi"
> +
> +/ {
> +	model = "Toradex Colibri iMX6ULL 256M/512B on Colibri Iris V2";
> +	compatible = "toradex,colibri-imx6ull-iris-v2",
> +		     "toradex,colibri-imx6ull",
> +		     "fsl,imx6ull";
> +};
> +
> +&atmel_mxt_ts {
> +	status = "okay";
> +};
> +
> +&gpio1 {
> +	lvds_tx_on {
> +		gpio-hog;
> +		gpios = <14 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-iris-v2.dtsi b/arch/arm/boot/dts/imx6ull-colibri-iris-v2.dtsi
> new file mode 100644
> index 000000000000..93649cad0cc0
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ull-colibri-iris-v2.dtsi
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2018-2022 Toradex
> + */
> +
> +#include "imx6ull-colibri-iris.dtsi"
> +
> +/ {
> +	reg_3v3_vmmc: regulator-3v3-vmmc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3v3_vmmc";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <100>;
> +		enable-active-high;
> +	};
> +};
> +
> +
> +&usdhc1 {
> +	cap-power-off-card;
> +	vmmc-supply = <&reg_3v3_vmmc>;
> +	/delete-property/ keep-power-in-suspend;
> +	/delete-property/ no-1-8-v;
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-iris.dts b/arch/arm/boot/dts/imx6ull-colibri-iris.dts
> new file mode 100644
> index 000000000000..4fb97b0fe30b
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ull-colibri-iris.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2018-2022 Toradex
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull-colibri-nonwifi.dtsi"
> +#include "imx6ull-colibri-iris.dtsi"
> +
> +/ {
> +	model = "Toradex Colibri iMX6ULL 256/512MB on Colibri Iris";
> +	compatible = "toradex,colibri-imx6ull-iris",
> +		     "toradex,colibri-imx6ull",
> +		     "fsl,imx6ull";
> +};
> +
> +&atmel_mxt_ts {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-iris.dtsi b/arch/arm/boot/dts/imx6ull-colibri-iris.dtsi
> new file mode 100644
> index 000000000000..eb30353e7fa8
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ull-colibri-iris.dtsi
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2018-2022 Toradex
> + */
> +
> +/ {
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_snvs_gpiokeys>;
> +
> +		power {
> +			label = "Wake-Up";
> +			gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
> +			linux,code = <KEY_WAKEUP>;
> +			debounce-interval = <10>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	reg_5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	reg_usbh_vbus: regulator-usbh-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usbh_reg>;
> +		regulator-name = "VCC_USB[1-4]";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
> +		vin-supply = <&reg_5v0>;
> +	};
> +};
> +
> +&adc1 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	/* M41T0M6 real time clock on carrier board */
> +	m41t0m6: rtc@68 {
> +		compatible = "st,m41t0";
> +		reg = <0x68>;
> +	};
> +};
> +
> +/* PWM <A> */
> +&pwm4 {
> +	status = "okay";
> +};
> +
> +/* PWM <B> */
> +&pwm5 {
> +	status = "okay";
> +};
> +
> +/* PWM <C> */
> +&pwm6 {
> +	status = "okay";
> +};
> +
> +/* PWM <D> */
> +&pwm7 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	vbus-supply = <&reg_usbh_vbus>;
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	vbus-supply = <&reg_usbh_vbus>;
> +	status = "okay";
> +};
> +
> +&usdhc1 {
> +	vmmc-supply = <&reg_3v3>;
> +	status = "okay";
> +};
> +
> +&gpio1 {

Break alphabetical order.

Shawn

> +	/*
> +	 * uart25_tx_on turns the UART transceiver on. If one wants to turn the
> +	 * transceiver off, that property has to be deleted and the gpio handled
> +	 * in userspace.
> +	 * The same applies to uart1_tx_on.
> +	 */
> +	uart25_tx_on {
> +		gpio-hog;
> +		gpios = <15 0>;
> +		output-high;
> +	};
> +};
> +
> +&gpio2 {
> +	uart1_tx_on {
> +		gpio-hog;
> +		gpios = <7 0>;
> +		output-high;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-nonwifi.dtsi b/arch/arm/boot/dts/imx6ull-colibri-nonwifi.dtsi
> index 60f169227ad9..88901db255d6 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri-nonwifi.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri-nonwifi.dtsi
> @@ -1,6 +1,6 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>  /*
> - * Copyright 2018 Toradex AG
> + * Copyright 2018-2022 Toradex
>   */
>  
>  #include "imx6ull-colibri.dtsi"
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dts b/arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dts
> index df72ce1ae2cb..1d64d1a5d8a7 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dts
> +++ b/arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dts
> @@ -1,6 +1,6 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>  /*
> - * Copyright 2018 Toradex AG
> + * Copyright 2018-2022 Toradex
>   */
>  
>  /dts-v1/;
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-wifi-iris-v2.dts b/arch/arm/boot/dts/imx6ull-colibri-wifi-iris-v2.dts
> new file mode 100644
> index 000000000000..ea610141a8bf
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ull-colibri-wifi-iris-v2.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2018-2022 Toradex
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull-colibri-wifi.dtsi"
> +#include "imx6ull-colibri-iris-v2.dtsi"
> +
> +/ {
> +	model = "Toradex Colibri iMX6ULL 512MB on Colibri Iris V2";
> +	compatible = "toradex,colibri-imx6ull-wifi-iris-v2",
> +		     "toradex,colibri-imx6ull",
> +		     "fsl,imx6ull";
> +};
> +
> +&atmel_mxt_ts {
> +	status = "okay";
> +};
> +
> +&gpio1 {
> +	lvds_tx_on {
> +		gpio-hog;
> +		gpios = <14 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-wifi-iris.dts b/arch/arm/boot/dts/imx6ull-colibri-wifi-iris.dts
> new file mode 100644
> index 000000000000..5ac1aa298ce7
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ull-colibri-wifi-iris.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2018-2022 Toradex
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull-colibri-wifi.dtsi"
> +#include "imx6ull-colibri-iris.dtsi"
> +
> +/ {
> +	model = "Toradex Colibri iMX6ULL 512MB on Colibri Iris";
> +	compatible = "toradex,colibri-imx6ull-wifi-iris",
> +		     "toradex,colibri-imx6ull",
> +		     "fsl,imx6ull";
> +};
> +
> +&atmel_mxt_ts {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi b/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
> index 3c47cfa7afa5..db59ee6b1c86 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
> @@ -1,6 +1,6 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>  /*
> - * Copyright 2018 Toradex AG
> + * Copyright 2018-2022 Toradex
>   */
>  
>  #include "imx6ull-colibri.dtsi"
> diff --git a/arch/arm/boot/dts/imx6ull-colibri.dtsi b/arch/arm/boot/dts/imx6ull-colibri.dtsi
> index a1e26ac4d1e7..59731ae7d04d 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri.dtsi
> @@ -1,6 +1,6 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>  /*
> - * Copyright 2018-2021 Toradex
> + * Copyright 2018-2022 Toradex
>   */
>  
>  #include "imx6ull.dtsi"
> -- 
> 2.35.1
> 
