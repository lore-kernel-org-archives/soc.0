Return-Path: <SRS0=GTMN=3G=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FABC433FE
	for <soc@archiver.kernel.org>; Sun,  6 Nov 2022 10:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DCDAC433D6; Sun,  6 Nov 2022 10:16:34 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C578C433C1;
	Sun,  6 Nov 2022 10:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C578C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id f5so23331540ejc.5;
        Sun, 06 Nov 2022 02:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuz5pibufFgr3QRiyz0ibFVgdkOEAxv+c/sGLvW4I14=;
        b=E2d+lnL51e8Loa67SPvOw34PmrhwrHJhs7Mmirkt2MmeHlWJFWmx77lusoqt3GLo7D
         ih2G/Yi6NDJNzev9o6/2JLMoqrL8/l0xrDgOi9+amDJJZNbjHQCSSNWyb0qFZOt9k+bi
         9fW3RFJ6uorEPiwrVk38mqJ1GkIoULr0qaXYBBCrs0hQbK5kzjs4cPi8UTfnwroVKEvL
         592QK+obzFRlvoCRdBtevCqwhZ4lhgmYR0rAVuMrK+uLvLuEWvsaYGcrR2BY89zlMWOx
         cJtnUOp1gr5QdawCy1q5Rui6BJzIN1LIwk5TXsYna7VtXiFCSLy4Wo0y7/Edn5NOoVj/
         5WFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuz5pibufFgr3QRiyz0ibFVgdkOEAxv+c/sGLvW4I14=;
        b=S092cmFPw34i8EvjjOAhdD5TxZrzY+051hJM6I2SbPufoOgcWrny3iqrNh7IqYaR2M
         hsOmitumW0+WXl+5XoE0ymwSD9qtAFvzDhkKEFS5riWUUhO/kll+MKSWhDHNXAVhmVJ2
         P9Z2jk3loj7P3Xy0UrM3XtljRtk2TEbusV7+ybvRCZIv2kF0HITtQGaXqlNUPip/9hIx
         f94Rs0XUcw4ckeOelNnSDnPaXrJj6ozEouoOxrm4JhHrG0JS5zlWni6MjavgmPbmS1V3
         7Fn6CHFQdFMIVYq0HDs+tbdodKnIhHl8aUBEo959aOH0Ywqr4h8sUOAFR3wHvX7asDL+
         dVjw==
X-Gm-Message-State: ACrzQf3NlrxDiU93z9zbeW37Z+nzvJkpSo7AZbRA0w099atRbbJmB/zO
	n57Ru7QYVNChVSYraZp9RSY=
X-Google-Smtp-Source: AMsMyM6xKPxuEHro4Sq6dozwO8H60cH5RA64uM4TgA9U18EmM3e2zq9h0PvFqAZLmWdXPAac/CFqRw==
X-Received: by 2002:a17:907:3e85:b0:73d:60cc:5d06 with SMTP id hs5-20020a1709073e8500b0073d60cc5d06mr43980242ejc.722.1667729791450;
        Sun, 06 Nov 2022 02:16:31 -0800 (PST)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id h3-20020a1709066d8300b0074136cac2e7sm1941855ejt.81.2022.11.06.02.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 02:16:30 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, soc@kernel.org, Icenowy Zheng <uwu@icenowy.me>, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: suniv: Add Lctech Pi F1C200s devicetree
Date: Sun, 06 Nov 2022 11:16:29 +0100
Message-ID: <9064733.rMLUfLXkoz@jernej-laptop>
In-Reply-To: <20221025145909.2837939-4-andre.przywara@arm.com>
References: <20221025145909.2837939-1-andre.przywara@arm.com> <20221025145909.2837939-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre,

sorry for late review.

Dne torek, 25. oktober 2022 ob 16:59:09 CET je Andre Przywara napisal(a):
> The Lctech Pi F1C200s (also previously known under the Cherry Pi brand)
> is a small development board with the Allwinner F1C200s SoC. This is the
> same as the F1C100s, but with 64MB instead of 32MB co-packaged DRAM.
> 
> Alongside the obligatory micro-SD card slot, the board features a
> SPI-NAND flash chip, LCD and touch connectors, and unpopulated
> expansion header pins.
> There are two USB Type-C ports on the board: One supplies the power, also
> connects to the USB MUSB OTG controller port. The other one is connected
> to an CH340 USB serial chip, which in turn is connected to UART1.
> 
> Add a devicetree file, so that the board can be used easily.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/Makefile                    |  1 +
>  arch/arm/boot/dts/suniv-f1c100s.dtsi          |  5 ++
>  arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts | 80 +++++++++++++++++++
>  3 files changed, 86 insertions(+)
>  create mode 100644 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6abf6434eb372..f99c5c20bf7ef 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1394,6 +1394,7 @@ dtb-$(CONFIG_MACH_SUN9I) += \
>  	sun9i-a80-cubieboard4.dtb
>  dtb-$(CONFIG_MACH_SUNIV) += \
>  	suniv-f1c100s-licheepi-nano.dtb \
> +	suniv-f1c200s-lctech-pi.dtb \
>  	suniv-f1c200s-popstick-v1.1.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
>  	tegra20-acer-a500-picasso.dtb \
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> b/arch/arm/boot/dts/suniv-f1c100s.dtsi index 0f24c766c9fc5..2ec022e92eea8
> 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -201,6 +201,11 @@ uart0_pe_pins: uart0-pe-pins {
>  				pins = "PE0", "PE1";
>  				function = "uart0";
>  			};
> +
> +			uart1_pa_pins: uart1-pa-pins {
> +				pins = "PA2", "PA3";
> +				function = "uart1";
> +			};

/omit-if-no-ref/

>  		};
> 
>  		timer@1c20c00 {
> diff --git a/arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
> b/arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts new file mode 100644
> index 0000000000000..a9d1778395438
> --- /dev/null
> +++ b/arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022 Arm Ltd,
> + * based on work:
> + *   Copyright 2022 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +/dts-v1/;
> +#include "suniv-f1c100s.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Lctech Pi F1C200s";
> +	compatible = "lctech,pi-f1c200s", "allwinner,suniv-f1c200s",
> +		     "allwinner,suniv-f1c100s";
> +
> +	aliases {
> +		mmc0 = &mmc0;
> +		serial0 = &uart1;
> +		spi0 = &spi0;

We don't do aliases for mmc nor spi.

Best regards,
Jernej

> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reg_vcc3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +};
> +
> +&mmc0 {
> +	broken-cd;
> +	bus-width = <4>;
> +	disable-wp;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	status = "okay";
> +};
> +
> +&otg_sram {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pc_pins>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "spi-nand";
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <40000000>;
> +	};
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart1_pa_pins>;
> +	status = "okay";
> +};
> +
> +/*
> + * This is a Type-C socket, but CC1/2 are not connected, and VBUS is
> connected + * to Vin, which supplies the board. Host mode works (if the
> board is powered + * otherwise), but peripheral is probably the intention.
> + */
> +&usb_otg {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	status = "okay";
> +};




