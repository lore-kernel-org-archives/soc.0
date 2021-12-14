Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE647C433EF
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 04:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E0CFC34606; Tue, 14 Dec 2021 04:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDD0C34604;
	Tue, 14 Dec 2021 04:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639454557;
	bh=txV48AzR/EMVhd7F+bhfry46IsLFFaCOMwSidG0PURo=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Cn5oymGPTQ1MvgPntFdOwRMb1/jD45OQ+JaaBQjdMsK+etKco/qE9laCHkyn+wNvV
	 rNFG8/Tp6tZg+0RW2wbgTYHswPXC7q3pwiQaKrGaBl29QkFnFYDtEW3iVdJaGbKB+Q
	 aB3XdJDZGFWXlHzGtBkIxGC01Rel19aDiXjcBE+Zd0FPsXgru3ZS83N4OsBj4CGSli
	 9rJglnDov0Uw5fa7bf1REqc4gZo8xHIemo+fIt7uhZMgck796fKAaOCTRdQz2P/f5p
	 ngr2LsX5ru6+DxNfpff5rhI03m8/OMZAYCFg19T62NMTraA79imN2xIq14gMQQXXGR
	 slcfe6HNjhVXA==
Date: Tue, 14 Dec 2021 12:02:29 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Changming Huang <jerry.huang@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, robh+dt@kernel.org, arnd@arndb.de,
	olof@lixom.net, soc@kernel.org, leoyang.li@nxp.com,
	krzysztof.kozlowski@canonical.com, linux@rempel-privat.de,
	festevam@gmail.com, tharvey@gateworks.com,
	marcel.ziswiler@toradex.com, jagan@amarulasolutions.com,
	dev@lynxeye.de, cniedermaier@dh-electronics.com,
	sebastian.reichel@collabora.com, Alison Wang <alison.wang@nxp.com>
Subject: Re: [PATCH 2/2] ARM: dts: Add initial LS1021A IoT board dts support
Message-ID: <20211214040228.GD10916@dragon>
References: <20211203031332.902485-1-jerry.huang@nxp.com>
 <20211203031332.902485-2-jerry.huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203031332.902485-2-jerry.huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Dec 03, 2021 at 11:13:32AM +0800, Changming Huang wrote:
> The LS1021A-IoT gateway reference design is a purpose-built,
> small footprint hardware platform equipped with a wide array
> of both high-speed connectivity and low speed serial interfaces.
> 
> CC: Li Yang <leoyang.li@nxp.com>
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> Signed-off-by: Alison Wang <alison.wang@nxp.com>
> ---
>  arch/arm/boot/dts/Makefile        |   3 +-
>  arch/arm/boot/dts/ls1021a-iot.dts | 248 ++++++++++++++++++++++++++++++
>  2 files changed, 250 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/ls1021a-iot.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 0de64f237cd8..8534f6f94bc3 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -727,7 +727,8 @@ dtb-$(CONFIG_SOC_LS1021A) += \
>  	ls1021a-moxa-uc-8410a.dtb \
>  	ls1021a-qds.dtb \
>  	ls1021a-tsn.dtb \
> -	ls1021a-twr.dtb
> +	ls1021a-twr.dtb \
> +	ls1021a-iot.dtb

Keep the list alphabetically sorted.

>  dtb-$(CONFIG_SOC_VF610) += \
>  	vf500-colibri-eval-v3.dtb \
>  	vf610-bk4.dtb \
> diff --git a/arch/arm/boot/dts/ls1021a-iot.dts b/arch/arm/boot/dts/ls1021a-iot.dts
> new file mode 100644
> index 000000000000..47ad718dc542
> --- /dev/null
> +++ b/arch/arm/boot/dts/ls1021a-iot.dts
> @@ -0,0 +1,248 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2021 NXP
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
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Drop the container node and put fixed regulators directly under root.

> +
> +		reg_3p3v: regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "3P3V";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +		};
> +
> +		reg_2p5v: regulator@1 {
> +			compatible = "regulator-fixed";
> +			reg = <1>;
> +			regulator-name = "2P5V";
> +			regulator-min-microvolt = <2500000>;
> +			regulator-max-microvolt = <2500000>;
> +			regulator-always-on;
> +		};
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
> +			sound-dai = <&codec>;
> +			frame-master;
> +			bitclock-master;
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
> +&can0{

Keep label nodes sort alphabetically.

> +	status = "disabled";
> +};

Maybe we should have can0 ~ can4 disabled by default in ls1021a.dtsi,
and flip status for enabled ones in board dts.

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
> +&esdhc{
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	max1239@35 {

Use a generic node name.

> +		compatible = "maxim,max1239";
> +		reg = <0x35>;
> +		#io-channel-cells = <1>;
> +	};
> +
> +	codec: sgtl5000@2a {

Node name should be generic while label can be specific, so:

	sgtl5000: audio-codec@2a

Also, please sort node with unit-address in the address.

> +		#sound-dai-cells=<0x0>;

Missing space before and after =.

> +		compatible = "fsl,sgtl5000";
> +		reg = <0x2a>;
> +		VDDA-supply = <&reg_3p3v>;
> +		VDDIO-supply = <&reg_2p5v>;
> +		clocks = <&sys_mclk 1>;
> +	};
> +
> +	pca9555: pca9555@23 {

Use a generic node name.

> +		compatible = "nxp,pca9555";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		reg = <0x23>;
> +	};
> +
> +	ina220@44 {

Ditto

> +		compatible = "ti,ina220";
> +		reg = <0x44>;
> +		shunt-resistor = <1000>;
> +	};
> +
> +	ina220@45 {
> +		compatible = "ti,ina220";
> +		reg = <0x45>;
> +		shunt-resistor = <1000>;
> +	};
> +
> +	lm75b@48 {

Ditto

> +		compatible = "national,lm75b";
> +		reg = <0x48>;
> +	};
> +
> +	adt7461a@4c {

Ditto

> +		compatible = "adt7461a";
> +		reg = <0x4c>;
> +	};
> +};
> +
> +&i2c1 {
> +	status = "disabled";

Isn't it already disabled ls1021a.dtsi?

> +};
> +
> +&ifc {
> +	status = "disabled";
> +};

Ditto

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
> +	qflash0: s25fl128s@0 {

Use generic node name and specific label name.

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
> +
> +&dcu {
> +	display = <&display>;
> +	status = "okay";
> +
> +	display: display@0 {

Did you run dtbs_check?

Shawn

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
> -- 
> 2.25.1
> 
