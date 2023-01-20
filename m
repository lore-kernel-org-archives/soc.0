Return-Path: <SRS0=MX/P=5R=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B99C05027
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 10:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5392DC433EF; Fri, 20 Jan 2023 10:09:01 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DBABC433D2;
	Fri, 20 Jan 2023 10:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DBABC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674209337; x=1705745337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TK+KRM3EMKMFlX0ZyA3HSIzsHmLWCaz9ZD/WieX73Q4=;
  b=R8ZJhpyCbaNTNrh0JlImdGvNaJ5sIjZZ/uPOfA2LQEpYE/YVrpTQa+v3
   +2rKARch2FXEKE9BMKbfJwjhRYSWfjt4p/vC7PQp+/VsFb3YCYBZQxtS4
   BBWEmJL0+dXzVwQawB9hu9aMKyGwIyzOAwWP+8gzgNFu1YHbH+1eKtk2A
   iSEwG0iu2sQQH4wJPp/zCJfRT0RENsExnlHmprhTqHLxZ565lek6vi/Gu
   MPpITJuI63EutAxhNNdJpYPCXrKlTd/Rlb92Pxt7m4VGREa50g4PgRrtY
   RY3loSllNXidwczeOhaKNf5MugmkTmGy9WDAJkVwzeEbmH1OH4I5pujFd
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669071600"; 
   d="scan'208";a="28555295"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 11:08:53 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 11:08:53 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 11:08:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674209333; x=1705745333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TK+KRM3EMKMFlX0ZyA3HSIzsHmLWCaz9ZD/WieX73Q4=;
  b=JcR7lkkfVRlJAw4KhK2uXcVEjDBrZ0ErgdPwuYJ2v9Tgd3P3tv+UdniS
   sWiDRiosv3+7Z7Zm5dJ+EMhBfO56NFcN1L56O74LlJcMLWJFll9RZEe2s
   SHdl4GGQ6sRAkoXu4/pYSWqVXZxG6qpjMzzYMsnBQQ/tw6QI0SnT6wnhT
   dW3gmHbhFdViKvcX24Sb7iTqmfkacPfXdoyZJZgktoUterd8fRxaTbhGQ
   kOPLVNFAUviFCYZBcB/GBiYbERK3p9GDgGyKSCnYzFy7irNOMkxJNq1ts
   k//UDfldXngxH4jh5bW9iZpVZf4/0AxgoTPAYRXi5MeTL/Es+NVNZU/ct
   g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669071600"; 
   d="scan'208";a="28555294"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 11:08:53 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 954AD280056;
	Fri, 20 Jan 2023 11:08:52 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Russell King <linux@armlinux.org.uk>, Marek Vasut <marex@denx.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/9] ARM: dts: ls1021a: add TQ-Systems MBLS102xA device tree
Date: Fri, 20 Jan 2023 11:08:51 +0100
Message-ID: <2902259.VdNmn5OnKV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <7cc4c0d4-d863-a62d-3867-ab03d7f7507a@linaro.org>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com> <20230119144236.3541751-3-alexander.stein@ew.tq-group.com> <7cc4c0d4-d863-a62d-3867-ab03d7f7507a@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Krzysztof,

thanks for the feedback.

Am Donnerstag, 19. Januar 2023, 18:03:14 CET schrieb Krzysztof Kozlowski:
> On 19/01/2023 15:42, Alexander Stein wrote:
> > Add device tree for the MBLS102xA mainboard with TQMLS1021A SoM.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  .../boot/dts/ls1021a-tqmls1021a-mbls1021a.dts | 409 ++++++++++++++++++
> >  arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi     |  93 ++++
> >  3 files changed, 503 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
> >  create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
> > 
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index d0c07867aeabe..44b5ed44b13d6 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -802,6 +802,7 @@ dtb-$(CONFIG_SOC_LS1021A) += \
> > 
> >  	ls1021a-iot.dtb \
> >  	ls1021a-moxa-uc-8410a.dtb \
> >  	ls1021a-qds.dtb \
> > 
> > +	ls1021a-tqmls1021a-mbls1021a.dtb \
> > 
> >  	ls1021a-tsn.dtb \
> >  	ls1021a-twr.dtb
> >  
> >  dtb-$(CONFIG_SOC_VF610) += \
> > 
> > diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
> > b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts new file mode 100644
> > index 0000000000000..21da171b9f38e
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
> > @@ -0,0 +1,409 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
> > +/*
> > + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> > + * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > + * D-82229 Seefeld, Germany.
> > + * Author: Alexander Stein
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/leds/leds-pca9532.h>
> > +#include <dt-bindings/net/ti-dp83867.h>
> > +#include "ls1021a-tqmls1021a.dtsi"
> > +
> > +/ {
> > +	model = "TQMLS102xA SOM on MBLS102xA";
> > +	compatible = "tq,ls1021a-tqmls1021a-mbls102xa", "tq,ls1021a-
tqmls1021a",
> > "fsl,ls1021a"; +
> > +	audio_mclk: audio-clock {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <25000000>;
> > +	};
> > +
> > +	backlight_dcu: backlight {
> > +		compatible = "gpio-backlight";
> > +		gpios = <&pca9530 0 GPIO_ACTIVE_LOW>;
> > +		status = "disabled";
> > +	};
> > +
> > +	gpio-keys {
> > +		compatible = "gpio-keys";
> > +		autorepeat;
> > +
> > +		switch-1 {
> > +			label = "S6";
> > +			linux,code = <BTN_0>;
> > +			gpios = <&pca9554_0 0 GPIO_ACTIVE_LOW>;
> > +		};
> > +
> > +		btn2: switch-2 {
> > +			label = "S7";
> > +			linux,code = <BTN_1>;
> > +			gpios = <&pca9554_0 1 GPIO_ACTIVE_LOW>;
> > +		};
> > +
> > +		switch-3 {
> > +			label = "S8";
> > +			linux,code = <BTN_2>;
> > +			gpios = <&pca9554_0 2 GPIO_ACTIVE_LOW>;
> > +		};
> > +	};
> > +
> > +	gpio_leds: gpio-leds {
> > +		compatible = "gpio-leds";
> > +
> > +		led-0 {
> > +			color = <LED_COLOR_ID_GREEN>;
> > +			function = LED_FUNCTION_STATUS;
> > +			function-enumerator = <0>;
> > +			gpios = <&pca9554_2 4 GPIO_ACTIVE_LOW>;
> > +			linux,default-trigger = "default-on";
> > +		};
> > +
> > +		led-1 {
> > +			color = <LED_COLOR_ID_GREEN>;
> > +			function = LED_FUNCTION_STATUS;
> > +			function-enumerator = <1>;
> > +			gpios = <&pca9554_2 5 GPIO_ACTIVE_LOW>;
> > +			linux,default-trigger = "default-on";
> > +		};
> > +
> > +		led-2 {
> > +			color = <LED_COLOR_ID_GREEN>;
> > +			function = LED_FUNCTION_STATUS;
> > +			function-enumerator = <2>;
> > +			gpios = <&pca9554_2 6 GPIO_ACTIVE_LOW>;
> > +			linux,default-trigger = "default-on";
> > +		};
> > +
> > +		led-3 {
> > +			color = <LED_COLOR_ID_GREEN>;
> > +			function = LED_FUNCTION_HEARTBEAT;
> > +			function-enumerator = <0>;
> > +			gpios = <&pca9554_2 7 GPIO_ACTIVE_LOW>;
> > +			linux,default-trigger = "heartbeat";
> > +		};
> > +	};
> > +
> > +	lvds_encoder: lvds-encoder {
> > +		compatible = "ti,sn75lvds83", "lvds-encoder";
> > +		power-supply = <&reg_3p3v>;
> > +		status = "disabled";
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				lvds_encoder_in: endpoint {};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +
> > +				lvds_encoder_out: endpoint {};
> > +			};
> > +		};
> > +	};
> > +
> > +	reg_1p2v: regulator-1p2v {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "1P2V";
> > +		regulator-min-microvolt = <1200000>;
> > +		regulator-max-microvolt = <1200000>;
> > +		regulator-always-on;
> > +		vin-supply = <&reg_3p3v>;
> > +	};
> > +
> > +	reg_3p3v: regulator-3p3v {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "3P3V";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	hdmi_out: hdmi {
> > +		compatible = "hdmi-connector";
> > +		type = "a";
> > +		ddc-i2c-bus = <&i2c0>;
> > +		status = "disabled";
> > +
> > +		port {
> > +			hdmi_in: endpoint {
> > +				remote-endpoint = <&sii9022a_out>;
> > +			};
> > +		};
> > +	};
> > +
> > +	display: panel {
> > +		backlight = <&backlight_dcu>;
> > +		enable-gpios = <&pca9554_1 3 GPIO_ACTIVE_HIGH>;
> > +		status = "disabled";
> > +
> > +		port {
> > +			panel_in: endpoint {};
> > +		};
> > +	};
> > +
> > +	sound {
> > +		compatible = "fsl,imx-audio-tlv320aic32x4";
> > +		model = "ls1021a-mbls1021a-tlv320aic32";
> > +		ssi-controller = <&sai1>;
> > +		audio-codec = <&tlv320aic32x4>;
> > +	};
> > +
> > +};
> > +
> > +&can0 {
> > +	status = "okay";
> > +	xceiver-supply = <&reg_3p3v>;
> > +};
> > +
> > +&can1 {
> > +	status = "okay";
> > +	xceiver-supply = <&reg_3p3v>;
> > +};
> > +
> > +&dspi0 {
> > +	bus-num = <0>;
> > +	status = "okay";
> > +};
> > +
> > +&enet0 {
> > +	phy-handle = <&rgmii_phy0c>;
> > +	phy-mode = "rgmii-id";
> > +	mac-address = [ 00 00 00 00 00 00 ];
> > +	status = "okay";
> > +};
> > +
> > +&enet1 {
> > +	tbi-handle = <&tbi1>;
> > +	phy-handle = <&sgmii_phy03>;
> > +	phy-mode = "sgmii";
> > +	mac-address = [ 00 00 00 00 00 00 ];
> > +	status = "okay";
> > +};
> > +
> > +&enet2 {
> > +	phy-handle = <&rgmii_phy04>;
> > +	phy-mode = "rgmii-id";
> > +	mac-address = [ 00 00 00 00 00 00 ];
> > +	status = "okay";
> > +};
> > +
> > +&i2c0 {
> > +	status = "okay";
> > +
> > +	tlv320aic32x4: audio-codec@18 {
> > +		compatible = "ti,tlv320aic32x4";
> > +		reg = <0x18>;
> > +		clocks = <&audio_mclk>;
> > +		clock-names = "mclk";
> > +		ldoin-supply = <&reg_3p3v>;
> > +		iov-supply = <&reg_3p3v>;
> > +	};
> > +
> > +	pca9554_0: gpio-expander@20 {
> > +		compatible = "nxp,pca9554";
> > +		reg = <0x20>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		interrupt-parent = <&gpio0>;
> > +		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> > +		interrupt-controller;
> > +		#interrupt-cells = <2>;
> > +		vcc-supply = <&reg_3p3v>;
> > +		gpio-line-names = "BUTTON0", "BUTTON1",
> > +				  "BUTTON2", "EMMC_SEL",
> > +				  "DIP2", "DIP3",
> > +				  "EXT_TOUCH_INT", "GPIO_1";
> > +	};
> > +
> > +	pca9554_1: gpio-expander@21 {
> > +		compatible = "nxp,pca9554";
> > +		reg = <0x21>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		interrupt-parent = <&gpio0>;
> > +		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> > +		interrupt-controller;
> > +		#interrupt-cells = <2>;
> > +		vcc-supply = <&reg_3p3v>;
> > +		gpio-line-names = "PCIE_PWR_EN", "MPCIE_DISABLE#",
> > +				  "MPCIE_WAKE#", "LCD_BLT_EN",
> > +				  "LCD_PWR_EN", "EC1_PHY_PWDN",
> > +				  "EC3_PHY_PWDN", "SGMII_PHY_PWDN";
> > +	};
> > +
> > +	pca9554_2: gpio-expander@22 {
> > +		compatible = "nxp,pca9554";
> > +		reg = <0x22>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		interrupt-parent = <&extirq>;
> > +		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> > +		interrupt-controller;
> > +		#interrupt-cells = <2>;
> > +		vcc-supply = <&reg_3p3v>;
> > +		gpio-line-names = "MUX_SEL0", "MUX_SEL1",
> > +				  "MUX_SEL2", "MUX_SEL3",
> > +				  "V95", "V96", "V97", "V98";
> > +	};
> > +
> > +	sii9022a: hdmi-transmitter@3b {
> > +		compatible = "sil,sii9022";
> > +		reg = <0x3b>;
> > +		iovcc-supply = <&reg_3p3v>;
> > +		cvcc12-supply = <&reg_1p2v>;
> > +		interrupts = <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>;
> > +		#sound-dai-cells = <0>;
> > +		sil,i2s-data-lanes = <0>;
> > +		status = "disabled";
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				sii9022a_in: endpoint {};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +
> > +				sii9022a_out: endpoint {
> > +					remote-endpoint = 
<&hdmi_in>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	stmpe811: touchscreen@41 {
> > +		compatible = "st,stmpe811";
> > +		reg = <0x41>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		interrupt-parent = <&gpio0>;
> > +		interrupts = <23 IRQ_TYPE_EDGE_FALLING>;
> > +		vcc-supply = <&reg_3p3v>;
> > +		vio-supply = <&reg_3p3v>;
> > +		status = "okay";
> 
> Drop, why do you need it?

Thanks, will drop it.

> > +
> > +		stmpe_gpio {
> 
> No underscores in node names, generic node names, so "gpio". Does
> anything depend on odd naming?

You are right, node names should have underscores, but in the end I was 
following the bindings (Documentation/devicetree/bindings/input/touchscreen/
stmpe.txt) naming 'stmpe_touchscreen' and 'stmpe_adc' in the example.
Each subdevice has it's own compatible, so there should be no issue.
Using just 'gpio' and 'touchscreen' below I didn't notice any difference.

> > +			compatible = "st,stmpe-gpio";
> > +			gpio-controller;
> > +			#gpio-cells = <2>;
> > +			/* GPIO 5-7 used for touch */
> > +			st,norequest-mask = <0xf0>;
> > +			gpio-line-names = "GPIO_ADC_I2C1_1",
> > +					  "GPIO_ADC_I2C1_2",
> > +					  "GPIO_ADC_I2C1_3",
> > +					  "GPIO_ADC_I2C1_4";
> > +		};
> > +
> > +		stmpe_touchscreen {
> 
> Same problems.

See above. When enabled driver loads fine.

> > +			compatible = "st,stmpe-ts";
> > +			status = "disabled";
> > +		};
> > +	};
> > +
> > +	pca9530: leds@60 {
> > +		compatible = "nxp,pca9530";
> > +		reg = <0x60>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		gpio-line-names = "PWM_0", "PWM_1";
> > +
> > +		gpio_pwm_0 {
> 
> No underscores in node names, generic node names. This is neither GPIO
> nor PWM.

You are right, no underscores. Well, actually it's used as a GPIO for 
backlight brightness, on a signal called 'PWM_0'. But I'll go for 'led-0' and 
'led-1' for node names and remove the labels, as they are type GPIO.

> > +			label = "pca9530:pwm0";
> > +			type = <PCA9532_TYPE_GPIO>;
> > +		};
> > +
> > +		gpio_pwm_1 {
> > +			label = "pca9530:pwm1";
> > +			type = <PCA9532_TYPE_GPIO>;
> > +		};
> > +	};
> > +
> > +};
> > +
> > +&i2c1 {
> > +	status = "okay";
> > +};
> > +
> > +&lpuart0 {
> > +	status = "okay";
> > +	linux,rs485-enabled-at-boot-time;
> > +};
> > +
> > +&mdio0 {
> > +	sgmii_phy03: ethernet-phy@3 {
> > +		compatible = "ethernet-phy-ieee802.3-c22";
> > +		reg = <0x03>;
> > +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> > +		ti,dp83867-rxctrl-strap-quirk;
> > +	};
> > +
> > +	rgmii_phy04: ethernet-phy@4 {
> > +		compatible = "ethernet-phy-ieee802.3-c22";
> > +		reg = <0x04>;
> > +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
> > +		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> > +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> > +	};
> > +
> > +	rgmii_phy0c: ethernet-phy@c {
> > +		compatible = "ethernet-phy-ieee802.3-c22";
> > +		reg = <0x0c>;
> > +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
> > +		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> > +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> > +	};
> > +};
> > +
> > +&pwm6 {
> > +	status = "okay";
> > +};
> > +
> > +&pwm7 {
> > +	status = "okay";
> > +};
> > +
> > +&sai1 {
> > +	status = "okay";
> > +};
> > +
> > +&sata {
> > +	/delete-property/ dma-coherent;
> > +	status = "okay";
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> > +
> > +&uart1 {
> > +	status = "okay";
> > +};
> > +
> > +&usb3 {
> > +	/*
> > +	 * Although DR connector, VBUS is always driven, so
> > +	 * restrict to host mode.
> > +	 */
> > +	dr_mode = "host";
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
> > b/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi new file mode 100644
> > index 0000000000000..1ab518c489252
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
> > @@ -0,0 +1,93 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
> > +/*
> > + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> > + * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > + * D-82229 Seefeld, Germany.
> > + * Author: Alexander Stein
> > + */
> > +
> > +#include "ls1021a.dtsi"
> > +
> > +/ {
> > +	model = "TQMLS102xA SOM";
> > +	compatible = "tq,ls1021a-tqmls1021a", "fsl,ls1021a";
> > +
> > +	reg_3p3v_som: regulator-3p3v-som {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "3P3V_SOM";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-always-on;
> > +	};
> > +};
> > +
> > +&esdhc {
> > +	compatible = "fsl,esdhc", "fsl,ls1021a-esdhc";
> > +	/* e-MMC over 8 data lines */
> > +	bus-width = <8>;
> > +	status = "okay";
> > +};
> > +
> > +&i2c0 {
> > +	status = "okay";
> > +
> > +	mc34vr500: pmic@8 {
> > +		reg = <0x08>;
> 
> No compatible? What's this?

That's a DC/DC regulator on the module, currently without any driver support. 
It's controlled by the PMC, see below.

We had an internal discussion as well whether to state clients without a 
driver (and thus no compatible) on the i2c bus. What is the guidelines for DT?
The benefit stating, even without compatible, is to show there is some device 
on the bus.

> > +		status = "disabled";
> > +	};
> > +
> > +	pmc0: pmc@11 {
> 
> No compatible? What's this?

That's a PMC monitoring voltages using the DC/DC regulator from above. It's 
connected to i2c bus, but apparently there is no interface using this device.

> > +		reg = <0x11>;
> > +		status = "disabled";
> > +	};
> > +
> > +	sa56004: temperature-sensor@4c {
> > +		compatible = "nxp,sa56004";
> > +		reg = <0x4c>;
> > +		vcc-supply = <&reg_3p3v_som>;
> > +	};
> > +
> > +	adm1069: supervisor@4f {
> 
> No compatible? What's this?

Another monitor, similar to above connected to i2c bus but no actual interface 
to ARM cpu.

> > +		reg = <0x4f>;
> > +		status = "disabled";
> > +	};
> > +
> > +	rtc0: rtc@51 {
> > +		compatible = "nxp,pcf85063a";
> > +		quartz-load-femtofarads = <12500>;
> > +		reg = <0x51>;
> 
> Reg is second property

Sounds reasonable, thanks.

> > +	};
> > +
> > +	m24c64_54: eeprom@54 {
> > +		compatible = "atmel,24c64";
> > +		reg = <0x54>;
> > +		pagesize = <32>;
> > +		read-only;
> > +		vcc-supply = <&reg_3p3v_som>;
> > +	};
> > +};
> 
> Best regards,
> Krzysztof

Best regards,
Alexander



