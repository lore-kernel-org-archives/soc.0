Return-Path: <SRS0=ZBZI=3H=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB67C433FE
	for <soc@archiver.kernel.org>; Mon,  7 Nov 2022 17:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 997F1C433D7; Mon,  7 Nov 2022 17:35:14 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DA9FC433C1;
	Mon,  7 Nov 2022 17:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DA9FC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id t25so32081385ejb.8;
        Mon, 07 Nov 2022 09:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPY+3cT3MZaKayKCb1FnP/BDZRsXWWCrLi1A/PBZkJc=;
        b=gmp7n4AoRy3cYZT6zYqguGPSEXf54UDIRxDVrk7KacRAVpQSciWv4vX2n16NHeW7fI
         /yh/Pu9AsUzVJ1930MI+8BANU34wRvoDVqT1MxDZFmisrLQdD2MxF+lrD/yBlamxXFig
         oh/q7iDj6CtmQzCUcz6ny14uhAI3rmqZ890aZwTJRA2yiQUowjN3Ow4KU76KAWgUg6C8
         mbOVLEosM2L5vu1pPIiXh1UKI94tXTHkKpPFOkemG9to2J4dNcmcFMjEyqKukzJAcA9I
         /64MkRbRXn+yMTwwP/vLPR9sPAv/OFgkDeSjGK0pNra4g5NxCHiue/AXqT1QXyI7Pr0y
         4ywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPY+3cT3MZaKayKCb1FnP/BDZRsXWWCrLi1A/PBZkJc=;
        b=FeECQ7MhlRPhK6/al9zdWTXc/NP46W9n/oYfjg5qAzVaiiP+4ccRNT9YNvk6mDXqxZ
         BU5fH7X4SepY0+1M+s2rZgr0lF4nEFgbGi8P6t1JN/zfSjSBm5N9gWRqi3chBkMUQk1j
         aJbzjwRbIh9Vh1Lik4XZJsmw+GQ0izP8QnrwoNQduKPQG/N9hLn0N1lSQbNRNmixFlcy
         MlkWDgH5AwTD55Rl4mkPGqn9nvsFAp6/3qDLNDfV0y4A13CTirI5YFmN79lW61LJmFKR
         IyNsoP1H2BZTZxWLc5LEA2sNTOEpTLAcbFUh9tSYn/DaywnuA0LtgMO0sCjKp/2agMSf
         AVqw==
X-Gm-Message-State: ACrzQf2DfAH6fDFvS7EqnaLik4qXbG8n806gTQm/Td9I2se+IJwAWP8Q
	j5A10xBqFwN16jkSv7/M/Tc=
X-Google-Smtp-Source: AMsMyM4GcHsnTIH5YBhdUytB+oAMNR2U/e2ewjfJB+qlvXYSUfhl7+StHVKEuK/0Cqj/qga6kaXANA==
X-Received: by 2002:a17:907:f9c:b0:7ae:1990:5487 with SMTP id kb28-20020a1709070f9c00b007ae19905487mr22513790ejc.293.1667842511319;
        Mon, 07 Nov 2022 09:35:11 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id es11-20020a056402380b00b0045bd257b307sm4463039edb.22.2022.11.07.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:35:10 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Icenowy Zheng <uwu@icenowy.me>, Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 09/11] ARM: dts: suniv: add device tree for PopStick v1.1
Date: Mon, 07 Nov 2022 18:35:09 +0100
Message-ID: <4752971.GXAFRqVoOG@kista>
In-Reply-To: <20221106154826.6687-10-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-10-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. november 2022 ob 16:48:24 CET je Andre Przywara napisal(a):
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> PopStick is a minimal Allwinner F1C200s dongle, with its USB controller
> wired to a USB Type-A port, a SD slot and a SPI NAND flash on board, and
> an on-board CH340 USB-UART converted connected to F1C200s's UART0.
> 
> Add a device tree for it. As F1C200s is just F1C100s with a different
> DRAM chip co-packaged, directly use F1C100s DTSI here.
> 
> This commit covers the v1.1 version of this board, which is now shipped.
> v1.0 is some internal sample that have not been shipped at all.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/Makefile                    |  3 +-
>  .../boot/dts/suniv-f1c200s-popstick-v1.1.dts  | 99 +++++++++++++++++++
>  2 files changed, 101 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6aa7dc4db2fc..0249c07bd8a6 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1391,7 +1391,8 @@ dtb-$(CONFIG_MACH_SUN9I) += \
>  	sun9i-a80-optimus.dtb \
>  	sun9i-a80-cubieboard4.dtb
>  dtb-$(CONFIG_MACH_SUNIV) += \
> -	suniv-f1c100s-licheepi-nano.dtb
> +	suniv-f1c100s-licheepi-nano.dtb \
> +	suniv-f1c200s-popstick-v1.1.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
>  	tegra20-acer-a500-picasso.dtb \
>  	tegra20-asus-tf101.dtb \
> diff --git a/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts new file mode 100644
> index 000000000000..7d69b5fcb905
> --- /dev/null
> +++ b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +/dts-v1/;
> +#include "suniv-f1c100s.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "Popcorn Computer PopStick v1.1";
> +	compatible = "sourceparts,popstick-v1.1", "sourceparts,popstick",
> +		     "allwinner,suniv-f1c200s", "allwinner,suniv-
f1c100s";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&pio 4 6 GPIO_ACTIVE_HIGH>; /* PE6 
*/
> +			linux,default-trigger = "heartbeat";
> +		};
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
> +	cd-gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
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
> +		spi-max-frequency = <40000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		partitions {

"make dtbs_check" is not happy with cells and partitions. Do we really need 
them? If yes, then binding needs to be updated beforehand.

Best regards,
Jernej

> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "u-boot-with-spl";
> +				reg = <0x0 0x100000>;
> +			};
> +
> +			ubi@100000 {
> +				label = "ubi";
> +				reg = <0x100000 0x7f00000>;
> +			};
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pe_pins>;
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	status = "okay";
> +};
> --
> 2.35.5


