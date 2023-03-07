Return-Path: <SRS0=Mj3k=67=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE44C678D4
	for <soc@archiver.kernel.org>; Tue,  7 Mar 2023 08:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 072EFC433EF; Tue,  7 Mar 2023 08:30:45 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E724C4339E
	for <soc@kernel.org>; Tue,  7 Mar 2023 08:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E724C4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id ec29so18273430edb.6
        for <soc@kernel.org>; Tue, 07 Mar 2023 00:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678177841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B797IxtRv3mfI28zuNtqQlSFbuT7ZIuv6u5nuOEa+wA=;
        b=uM7W9pWblGX5LZDKxpuQtiTON5A1m5LqrZ/xIGbnNnV3tEAFsjic3KvUL32Y/JJbws
         NjSLibYIaYOjEaYox83RdwbidCRQwdNOf4nR3lIFeHm109ZMSUB355SKGIDQ0WKh+LgS
         G2Hf3mejbX2SMqslgsaSrw1N2Kj6nb4rzl7bcw1ZH3v5HDRxEjSTXCGfXY3h7gvaxn9i
         Iu/QErRvmTzc2b2KH0j17sD2Uy7lpFGhqU9aFmDxym72h6a+LRhwyuEBK1EF8ynXF9Wy
         n87Cv9myNhjGIjCijwKvphjc73RjRx+FXdgXzcRHsuns0pQLJa3ZFQKF0LmOWqbNzaLw
         IDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678177841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B797IxtRv3mfI28zuNtqQlSFbuT7ZIuv6u5nuOEa+wA=;
        b=WiTrg8E2fKSkt//cHxIkNvJQ9JUu5sNW9cYddzwKlofMbRNAVBJS/OS/0bixZx0KyP
         R9NUFT+YgIumSL2wvx0bn5i6QmCs1jNiV2DbtgKw2dvGKS1v9HlBePVIywhNZGZ3O0iV
         OPKMap33VQR9CEHr0CrwwDVLgZ7wPBeB9Znnr3wTgD7da6utJyfZb3+2DT0B/kGChtu6
         Ixwdj+TaPJLFLco6lrjjUtaJMDscvTMKerRp9/tskgOoq9wDJs7Kqs4xrj6NHElG/TEg
         JzMgC3PHdzVaMiOs30P+S8EHDdOkQfGVhnuvi+PaWto4WNFmqARawze4/ybfJp+jszDF
         hOxw==
X-Gm-Message-State: AO0yUKV6xWcwPHfM+V4gCCfG6QB2kvFz9BlC/GVQEMT/uYEhZZC1V2Ei
	g+A16nWlsqzlrDt8B9Cb2ngFJQ==
X-Google-Smtp-Source: AK7set9r2bJjvG8iK8PdX1VUCpCGcHBd3/LfU5idMNfZkuljorIRSVh6qEy2VnlGpV3rz2XY+wam+A==
X-Received: by 2002:a17:907:8747:b0:87f:a197:5666 with SMTP id qo7-20020a170907874700b0087fa1975666mr15181726ejc.5.1678177840765;
        Tue, 07 Mar 2023 00:30:40 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id bo6-20020a170906d04600b008eb5877a221sm5709942ejb.75.2023.03.07.00.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 00:30:40 -0800 (PST)
Message-ID: <d77c2938-bcef-4586-77b5-1cb93b113eb5@linaro.org>
Date: Tue, 7 Mar 2023 09:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 7/8] ARM: dts: imx6ull: Add chargebyte Tarragon support
Content-Language: en-US
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, Li Yang <leoyang.li@nxp.com>,
 Denis Ciocca <denis.ciocca@st.com>, soc@kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <stefan.wahren@chargebyte.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
 <20230306172249.74003-8-stefan.wahren@i2se.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306172249.74003-8-stefan.wahren@i2se.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2023 18:22, Stefan Wahren wrote:
> From: Stefan Wahren <stefan.wahren@chargebyte.com>
> 
> This adds the support for chargebyte Tarragon, which is an Electrical
> Vehicle Supply Equipment (EVSE) for AC charging stations
> (according to IEC 61851, ISO 15118).
> 
> The Tarragon board is based on an i.MX6ULL SoC and is available in
> 4 variants (Master, Slave, SlaveXT, Micro), which provide more or
> less peripherals.
> 
> Supported features:
>   * 512 MB DDR RAM
>   * eMMC
>   * Debug UART
>   * 100 Mbit Ethernet
>   * USB 2.0 Host interface
>   * Powerline communication (QCA700x)
>   * 2x RS485
>   * Digital in- and outputs (12 V)
>   * One-Wire master for external temp sensors
>   * 2x relay outputs
>   * 2x motor interfaces
> 
> Link: https://chargebyte.com/products/charging-station-communication/charge-control-c
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   4 +
>  .../arm/boot/dts/imx6ull-tarragon-common.dtsi | 858 ++++++++++++++++++
>  arch/arm/boot/dts/imx6ull-tarragon-master.dts |  82 ++
>  arch/arm/boot/dts/imx6ull-tarragon-micro.dts  |  10 +
>  arch/arm/boot/dts/imx6ull-tarragon-slave.dts  |  32 +
>  .../arm/boot/dts/imx6ull-tarragon-slavext.dts |  64 ++
>  6 files changed, 1050 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-common.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-master.dts
>  create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-micro.dts
>  create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slave.dts
>  create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slavext.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index efe4152e5846..aae52a6380bc 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -755,6 +755,10 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ull-phytec-segin-lc-rdk-nand.dtb \
>  	imx6ull-phytec-tauri-emmc.dtb \
>  	imx6ull-phytec-tauri-nand.dtb \
> +	imx6ull-tarragon-master.dtb \
> +	imx6ull-tarragon-micro.dtb \
> +	imx6ull-tarragon-slave.dtb \
> +	imx6ull-tarragon-slavext.dtb \
>  	imx6ull-tqma6ull2-mba6ulx.dtb \
>  	imx6ull-tqma6ull2l-mba6ulx.dtb \
>  	imx6ulz-14x14-evk.dtb \
> diff --git a/arch/arm/boot/dts/imx6ull-tarragon-common.dtsi b/arch/arm/boot/dts/imx6ull-tarragon-common.dtsi
> new file mode 100644
> index 000000000000..1099dd688e80
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ull-tarragon-common.dtsi
> @@ -0,0 +1,858 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +//
> +// Copyright (C) 2023 chargebyte GmbH
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include "imx6ull.dtsi"
> +
> +/ {
> +	aliases {
> +		mmc0 = &usdhc2; /* eMMC */
> +	};
> +
> +	chosen {
> +		stdout-path = &uart4;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		pinctrl-0 = <&pinctrl_emmc_rst>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_dcdc_3v3: regulator-dcdc-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dcdc-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ldo-1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_status_leds>;
> +
> +		led1 {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

> +			label = "evse:green:led1";

Drop the label.

> +			function = LED_FUNCTION_BOOT;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&gpio3 14 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "timer";
> +		};
> +
> +		led2 {
> +			label = "evse:yellow:led2";

Drop the label.

> +			function = LED_FUNCTION_PROGRAMMING;
> +			color = <LED_COLOR_ID_YELLOW>;
> +			gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led3 {
> +			label = "evse:red:led3";

Drop the label.

> +			function = LED_FUNCTION_HEARTBEAT;
> +			color = <LED_COLOR_ID_RED>;
> +			gpios = <&gpio3 19 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +};

(...)

> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
> +	vmmc-supply = <&sw2_reg>;
> +	vqmmc-supply = <&reg_1v8>;
> +	mmc-pwrseq = <&emmc_pwrseq>;
> +	bus-width = <8>;
> +	broken-cd;
> +	non-removable;

Hm, isn't polling for CD a contradictory to non-removable card? Few
other boards also have it but it looks wrong.

> +	status = "okay";
> +};
> +
> +&wdog1 {
> +	status = "disabled";
> +};


Best regards,
Krzysztof

