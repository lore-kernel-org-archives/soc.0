Return-Path: <SRS0=QEF6=24=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D97FA3740
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 14:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BBBCC433B5; Thu, 27 Oct 2022 14:58:43 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2F3DC433C1
	for <soc@kernel.org>; Thu, 27 Oct 2022 14:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2F3DC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f174.google.com with SMTP id j21so1080734qkk.9
        for <soc@kernel.org>; Thu, 27 Oct 2022 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBTBb9mYsO/bWIRGTLUEcV64642M/1C9Rv4JP7J0eJI=;
        b=J2G+exWTK2vBkW5KSNWs9dOO61qmN1M+oA4zlOxHvkZOYdeDYjc8eMy15TODjlMErm
         sv52x42bTqk4oUCokXyzolTWJP3nbWScYJrbhp/QnCOJJnYl2bdeIfFPo801YA/HBM5n
         ZtD3VZbui/Ef0Ct5cOc5cRlbn9GftRbDpRp7eMLY0BRlY4HI2xZTy8H5k3OeoUkVltu3
         /kGoRCIz8M+RFKYpsQOYipf7amBGUi40siOpDuEiPbokYsf9OzgQAjOvZEfNpPEd0XtQ
         CyfaiF5HI1n4j3LMQuNu+fYnBSoi4rm+Pt9q1dHxCH6U8rWV61CQQQSirJy30C5Qbvve
         7VFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBTBb9mYsO/bWIRGTLUEcV64642M/1C9Rv4JP7J0eJI=;
        b=78vo8fhnGlxXZV8b8slTMSQ3Rm5QBuJhwJv3IkO7700drWHz54pxa3IFuaV/AOpnBn
         FiQj68j1RnSspYeXkF5G/UbTILJTGf8gpohKedIvh/iMtH+SbMjzzwUeYF2scvyVT4wd
         nisIXZi/pqq3hmYTL5kiI9N2SizJm3vOKDMHCNf7Kp/NZmSQ06GNZAGevdXb5ytEbBck
         0KKGrEGtiUfLpIlYFL5JUvtSXd1HAGZvH5n61sZGZI3kGFe4WfUw/OV6536pg72BFeCs
         K0zyXXFMNrA5PM2RDbE4KXJZ/herPYoKV2BYLrm3XUDehy9WN4koyBinRDFfDmPFLkoE
         ZlDg==
X-Gm-Message-State: ACrzQf2qhyWWk3viRDjq7R1Z5Vh9/9tYo8q0+26DKkRGwOMNy1CAHghC
	sE24TvZ6ScfUkCYKc1xXld+Dzw==
X-Google-Smtp-Source: AMsMyM5EhvBne8BTpFgbh4xmJ4O3CTeyG2GRaTNgWWbno/JTCE6LmAUbPg8zLVTar77LMFTDfHlQ9Q==
X-Received: by 2002:a05:620a:d55:b0:6f9:fadd:4762 with SMTP id o21-20020a05620a0d5500b006f9fadd4762mr1614437qkl.335.1666882720655;
        Thu, 27 Oct 2022 07:58:40 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bp43-20020a05622a1bab00b00399d5d564b7sm961058qtb.56.2022.10.27.07.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 07:58:40 -0700 (PDT)
Message-ID: <f45a4dcb-12e6-9a72-dbb3-7ec198ff2b1d@linaro.org>
Date: Thu, 27 Oct 2022 10:58:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 3/4] ARM: dts: rockchip: add rk3128.dtsi
Content-Language: en-US
To: Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com,
 heiko@sntech.de
List-Id: <soc.lore.kernel.org>
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, zhangqing@rock-chips.com,
 hjc@rock-chips.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <da1252eb-85e9-bdb8-0542-207173523523@gmail.com>
 <674b875a-0dfa-eff2-5018-eafed851707f@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <674b875a-0dfa-eff2-5018-eafed851707f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2022 20:53, Johan Jonker wrote:
> Add basic rk3128 support.
> 

Thank you for your patch. There is something to discuss/improve.

> +#include <dt-bindings/clock/rk3128-cru.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +
> +/ {
> +	compatible = "rockchip,rk3128";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	aliases {
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		spi0 = &spi0;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;

Bus aliases are board specific and represent what is actually available
on headers/pins etc. These do not belong to SoC DTSI.

> +	};
> +
> +	arm-pmu {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@f00 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0xf00>;
> +			clock-latency = <40000>;
> +			clocks = <&cru ARMCLK>;
> +			operating-points = <
> +				/* KHz    uV */
> +				 816000 1000000
> +			>;

Why not operating-points-v2?

> +			#cooling-cells = <2>; /* min followed by max */
> +		};
> +
> +		cpu1: cpu@f01 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0xf01>;
> +		};
> +
> +		cpu2: cpu@f02 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0xf02>;
> +		};
> +
> +		cpu3: cpu@f03 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0xf03>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +		arm,cpu-registers-not-fw-configured;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	xin24m: oscillator {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xin24m";
> +		#clock-cells = <0>;
> +	};
> +
> +	pmu: syscon@100a0000 {
> +		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
> +		reg = <0x100a0000 0x1000>;
> +	};
> +
> +	gic: interrupt-controller@10139000 {
> +		compatible = "arm,cortex-a7-gic";
> +		reg = <0x10139000 0x1000>,
> +		      <0x1013a000 0x1000>,
> +		      <0x1013c000 0x2000>,
> +		      <0x1013e000 0x2000>;
> +		interrupts = <GIC_PPI 9 0xf04>;

f04 looks like a mask, so use standard defines for it.

> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		#address-cells = <0>;
> +	};
> +
> +	usb_otg: usb@10180000 {
> +		compatible = "rockchip,rk3128-usb", "rockchip,rk3066-usb", "snps,dwc2";
> +		reg = <0x10180000 0x40000>;
> +		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_OTG>;
> +		clock-names = "otg";
> +		dr_mode = "otg";
> +		phys = <&usb2phy_otg>;
> +		phy-names = "usb2-phy";
> +		status = "disabled";
> +	};
> +
> +	usb_host_ehci: usb@101c0000 {
> +		compatible = "generic-ehci";
> +		reg = <0x101c0000 0x20000>;
> +		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&usb2phy_host>;
> +		phy-names = "usb";
> +		status = "disabled";
> +	};
> +
> +	usb_host_ohci: usb@101e0000 {
> +		compatible = "generic-ohci";
> +		reg = <0x101e0000 0x20000>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&usb2phy_host>;
> +		phy-names = "usb";
> +		status = "disabled";
> +	};
> +
> +	sdmmc: mmc@10214000 {
> +		compatible = "rockchip,rk3128-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x10214000 0x4000>;
> +		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
> +			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		dmas = <&pdma 10>;
> +		dma-names = "rx-tx";
> +		fifo-depth = <256>;
> +		max-frequency = <150000000>;
> +		resets = <&cru SRST_SDMMC>;
> +		reset-names = "reset";
> +		status = "disabled";
> +	};
> +
> +	sdio: mmc@10218000 {
> +		compatible = "rockchip,rk3128-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x10218000 0x4000>;
> +		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_SDIO>, <&cru SCLK_SDIO>,
> +			 <&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		dmas = <&pdma 11>;
> +		dma-names = "rx-tx";
> +		fifo-depth = <256>;
> +		max-frequency = <150000000>;
> +		resets = <&cru SRST_SDIO>;
> +		reset-names = "reset";
> +		status = "disabled";
> +	};
> +
> +	emmc: mmc@1021c000 {
> +		compatible = "rockchip,rk3128-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x1021c000 0x4000>;
> +		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_EMMC>, <&cru SCLK_EMMC>,
> +			 <&cru SCLK_EMMC_DRV>, <&cru SCLK_EMMC_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		dmas = <&pdma 12>;
> +		dma-names = "rx-tx";
> +		fifo-depth = <256>;
> +		max-frequency = <150000000>;
> +		resets = <&cru SRST_EMMC>;
> +		reset-names = "reset";
> +		status = "disabled";
> +	};
> +
> +	nfc: nand-controller@10500000 {
> +		compatible = "rockchip,rk3128-nfc", "rockchip,rk2928-nfc";
> +		reg = <0x10500000 0x4000>;
> +		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
> +		clock-names = "ahb", "nfc";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&flash_ale &flash_bus8 &flash_cle &flash_cs0
> +			     &flash_dqs &flash_rdn &flash_rdy &flash_wrn>;
> +		status = "disabled";
> +	};
> +
> +	cru: clock-controller@20000000 {
> +		compatible = "rockchip,rk3128-cru";
> +		reg = <0x20000000 0x1000>;
> +		clocks = <&xin24m>;
> +		clock-names = "xin24m";
> +		rockchip,grf = <&grf>;
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +		assigned-clocks = <&cru PLL_GPLL>;
> +		assigned-clock-rates = <594000000>;
> +	};
> +
> +	grf: syscon@20008000 {
> +		compatible = "rockchip,rk3128-grf", "syscon", "simple-mfd";
> +		reg = <0x20008000 0x1000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		usb2phy: usb2phy@17c {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "rockchip,rk3128-usb2phy";
> +			reg = <0x017c 0x0c>;
> +			clocks = <&cru SCLK_OTGPHY0>;
> +			clock-names = "phyclk";
> +			clock-output-names = "usb480m_phy";
> +			#clock-cells = <0>;
> +			status = "disabled";
> +


Best regards,
Krzysztof

