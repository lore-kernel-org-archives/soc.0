Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584C6C433F5
	for <soc@archiver.kernel.org>; Mon, 18 Apr 2022 12:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22965C385A8; Mon, 18 Apr 2022 12:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4366BC385A7;
	Mon, 18 Apr 2022 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650285958;
	bh=Xi62UPker/DcT6fp0qdLaeAVONJgCLSbfDS7vHhvyTI=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ly60fWfU6qaTaBYOoH9MM8eLT0sPQ7A10e0u67PABx3y7nBTw/7YtatJW8KeF04tB
	 q353Wsl+P0c/62ErfrTH++82H4yNc0qp7uVf6B+ooX7GSFwCzpIb4k1F9WjKXdfnBP
	 h42NRj8NUZMjN3w9hO50hdOtvYjeQcC1JUTMJVpuEQasiKUWGszZ/4UmwQZ6d/p5VY
	 sWaOZoF9yOo7PT+EXleNObGcU9Ui7SeXsKpg4DouG/H9ZV5LZOAVnd2PW1nJWQb8dV
	 /PzxbiE+yOC9ChzfDhXsnN4NtIZnwWg094a/12sa+3jurF9FLSjPEIrHUdBBxB8cRV
	 Y35ABZ/WYZ3oA==
Date: Mon, 18 Apr 2022 20:45:50 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Changming Huang <jerry.huang@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzk+dt@kernel.org, festevam@gmail.com,
	marcel.ziswiler@toradex.com, l.stach@pengutronix.de,
	tharvey@gateworks.com, alexander.stein@ew.tq-group.com,
	ariel.dalessandro@collabora.com, matthias.schiffer@ew.tq-group.com,
	cniedermaier@dh-electronics.com, sebastian.reichel@collabora.com,
	leoyang.li@nxp.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de, olof@lixom.net,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	Alison Wang <alison.wang@nxp.com>
Subject: Re: [PATCH 2/2 v3] ARM: dts: Add initial LS1021A IoT board dts
 support
Message-ID: <20220418124550.GO391514@dragon>
References: <20220415025600.2019912-1-jerry.huang@nxp.com>
 <20220415025600.2019912-2-jerry.huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415025600.2019912-2-jerry.huang@nxp.com>

On Fri, Apr 15, 2022 at 10:56:00AM +0800, Changming Huang wrote:
> The LS1021A-IoT gateway reference design is a purpose-built,
> small footprint hardware platform equipped with a wide array
> of both high-speed connectivity and low speed serial interfaces.
> 
> CC: Li Yang <leoyang.li@nxp.com>
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> Signed-off-by: Alison Wang <alison.wang@nxp.com>
> ---
> changes in v3:
>   - adjust to generic node name for i2c nodes
> 
>  arch/arm/boot/dts/Makefile        |   1 +
>  arch/arm/boot/dts/ls1021a-iot.dts | 227 ++++++++++++++++++++++++++++++
>  2 files changed, 228 insertions(+)
>  create mode 100644 arch/arm/boot/dts/ls1021a-iot.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7c16f8a2b738..e2faf913e313 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -744,6 +744,7 @@ dtb-$(CONFIG_SOC_IMX7ULP) += \
>  dtb-$(CONFIG_SOC_LAN966) += \
>  	lan966x-pcb8291.dtb
>  dtb-$(CONFIG_SOC_LS1021A) += \
> +	ls1021a-iot.dtb \
>  	ls1021a-moxa-uc-8410a.dtb \
>  	ls1021a-qds.dtb \
>  	ls1021a-tsn.dtb \
> diff --git a/arch/arm/boot/dts/ls1021a-iot.dts b/arch/arm/boot/dts/ls1021a-iot.dts
> new file mode 100644
> index 000000000000..9e5a41880050
> --- /dev/null
> +++ b/arch/arm/boot/dts/ls1021a-iot.dts
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2021-2022 NXP
> + *
> + */
> +
> +/dts-v1/;
> +#include "ls1021a.dtsi"
> +
> +/ {
> +	model = "LS1021A-IOT Board";
> +	compatible = "fsl,ls1021a-iot", "fsl,ls1021a";
> +
> +	sys_mclk: clock-mclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24576000>;
> +	};
> +
> +	reg_3p3v: regulator-3V3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_2p5v: regulator-2V5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2P5V";
> +		regulator-min-microvolt = <2500000>;
> +		regulator-max-microvolt = <2500000>;
> +		regulator-always-on;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,widgets =
> +			"Microphone", "Microphone Jack",
> +			"Headphone", "Headphone Jack",
> +			"Speaker", "Speaker Ext",
> +			"Line", "Line In Jack";
> +		simple-audio-card,routing =
> +			"MIC_IN", "Microphone Jack",
> +			"Microphone Jack", "Mic Bias",
> +			"LINE_IN", "Line In Jack",
> +			"Headphone Jack", "HP_OUT",
> +			"Speaker Ext", "LINE_OUT";
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&sai2>;
> +			frame-master;
> +			bitclock-master;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&sgtl5000>;
> +			frame-master;
> +			bitclock-master;
> +		};
> +	};
> +};
> +
> +&can0{
> +	status = "disabled";
> +};
> +
> +&can1{
> +	status = "disabled";
> +};
> +
> +&can2{
> +	status = "disabled";
> +};
> +
> +&can3{
> +	status = "okay";
> +};
> +
> +&dcu {
> +	display = <&display>;
> +	status = "okay";
> +
> +	display: display@0 {
> +		bits-per-pixel = <24>;
> +
> +		display-timings {
> +			native-mode = <&timing0>;
> +
> +			timing0: mode0 {
> +				clock-frequency = <25000000>;
> +				hactive = <640>;
> +				vactive = <480>;
> +				hback-porch = <80>;
> +				hfront-porch = <80>;
> +				vback-porch = <16>;
> +				vfront-porch = <16>;
> +				hsync-len = <12>;
> +				vsync-len = <2>;
> +				hsync-active = <1>;
> +				vsync-active = <1>;
> +			};
> +		};
> +	};
> +};
> +
> +&enet0 {
> +	tbi-handle = <&tbi1>;
> +	phy-handle = <&phy1>;
> +	phy-connection-type = "sgmii";
> +	status = "okay";
> +};
> +
> +&enet1 {
> +	tbi-handle = <&tbi1>;
> +	phy-handle = <&phy3>;
> +	phy-connection-type = "sgmii";
> +	status = "okay";
> +};
> +
> +&enet2 {
> +	fixed-link = <0 1 1000 0 0>;
> +	phy-connection-type = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&esdhc{
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	pca9555: gpio@23 {
> +		compatible = "nxp,pca9555";
> +		reg = <0x23>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	sgtl5000: codec@2a {

audio-codec for node name.

> +		#sound-dai-cells=<0x0>;
> +		compatible = "fsl,sgtl5000";
> +		reg = <0x2a>;
> +		VDDA-supply = <&reg_3p3v>;
> +		VDDIO-supply = <&reg_2p5v>;
> +		clocks = <&sys_mclk 1>;
> +	};
> +
> +	max1239: adc@35 {
> +		compatible = "maxim,max1239";
> +		reg = <0x35>;
> +		#io-channel-cells = <1>;
> +	};
> +
> +	ina2201: core_monitor@44 {

Hyphen rather than underscore is recommended for node name.

Shawn

> +		compatible = "ti,ina220";
> +		reg = <0x44>;
> +		shunt-resistor = <1000>;
> +	};
> +
> +	ina2202: current_monitor@45 {
> +		compatible = "ti,ina220";
> +		reg = <0x45>;
> +		shunt-resistor = <1000>;
> +	};
> +
> +	lm75b: thermal_monitor@48 {
> +		compatible = "national,lm75b";
> +		reg = <0x48>;
> +	};
> +};
> +
> +&lpuart0 {
> +	status = "okay";
> +};
> +
> +&mdio0 {
> +	phy0: ethernet-phy@0 {
> +		reg = <0x0>;
> +	};
> +
> +	phy1: ethernet-phy@1 {
> +		reg = <0x1>;
> +	};
> +
> +	phy2: ethernet-phy@2 {
> +		reg = <0x2>;
> +	};
> +
> +	phy3: ethernet-phy@3 {
> +		reg = <0x3>;
> +	};
> +
> +	tbi1: tbi-phy@1f {
> +		reg = <0x1f>;
> +		device_type = "tbi-phy";
> +	};
> +};
> +
> +&qspi {
> +	num-cs = <2>;
> +	status = "okay";
> +
> +	s25fl128s: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <20000000>;
> +		reg = <0>;
> +	};
> +};
> +
> +&sai2 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> -- 
> 2.25.1
> 
