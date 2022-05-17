Return-Path: <jszhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA588C433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 12:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E624C36AE2; Tue, 17 May 2022 12:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BC6C385B8;
	Tue, 17 May 2022 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652792313;
	bh=RhHPCDjYhGbJM/qCxpyBdbcOWVbWQwCIlM+2R7fj6rQ=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=cIUdkpZNqeXrc9KeQdYDC9T90hxuH0MnWMf6/HPcNscFr58d9aQPP2YLGlt3tBxVA
	 1ZwDqIZj4jEzIBQIxZVSv7oEC+tfLsvl6d1uE/n9nrzsDzfeZ1HEI/MJ3bpln5vZl2
	 eKzM3CoEvmxTJyIfWJ9fu7XYmriTiqpw0j7D0kXMgyxsgGHzqQUi5kDowhxot/qaCF
	 p1xHV7/cUCByoRuh9ZVdJt+FpOvNDQP9DAK3Qf4AijpdPkhAOKhJIlQ8tPwhFDDPOg
	 c+e6MmcmaGBf+hRySpvNj3c24sPv1GOAwPssrY6hVe/sRmKqr/4NtaS+lrSdyke5+/
	 MyYBZvsVegXoQ==
Date: Tue, 17 May 2022 20:49:37 +0800
From: Jisheng Zhang <jszhang@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	arm@kernel.org, soc@kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH] arm64: dts: synaptics: remove unused DTSI for
 AS370
Message-ID: <YoOZ4TawKslvu01w@xhacker>
References: <20220407204115.34350-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220407204115.34350-1-krzysztof.kozlowski@linaro.org>

On Thu, Apr 07, 2022 at 10:41:15PM +0200, Krzysztof Kozlowski wrote:
> The as370.dtsi for Synaptics AS370 SoC does not have a user (DTS board
> file), is uncompilable and untestable.  It was added back in 2018.  No
> user appeared since that time, so assume it won't be added.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Jisheng Zhang <jszhang@kernel.org>

Hi Arnd, Olof,

This is the only one patch of berlin-soc for v5.19, Can you please
take it?

Thanks in advance

> 
> ---
> 
> The AS370 board was submitted for review in Aug 2021 [1] but after few
> comments there were no resubmits, so basically this is still a dead
> DTSI.
> 
> [1] https://lore.kernel.org/all/CAK8P3a2vkZVt1bb7-iDGaSHp20U9d8QXu6AcrUMceJSS9Q_-4Q@mail.gmail.com/
> ---
>  .../devicetree/bindings/arm/syna.txt          |   4 -
>  arch/arm64/boot/dts/synaptics/as370.dtsi      | 173 ------------------
>  2 files changed, 177 deletions(-)
>  delete mode 100644 arch/arm64/boot/dts/synaptics/as370.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/arm/syna.txt b/Documentation/devicetree/bindings/arm/syna.txt
> index d8b48f2edf1b..851f48ead927 100644
> --- a/Documentation/devicetree/bindings/arm/syna.txt
> +++ b/Documentation/devicetree/bindings/arm/syna.txt
> @@ -18,10 +18,6 @@ stable binding/ABI.
>  
>  ---------------------------------------------------------------
>  
> -Boards with the Synaptics AS370 SoC shall have the following properties:
> -  Required root node property:
> -    compatible: "syna,as370"
> -
>  Boards with a SoC of the Marvell Berlin family, e.g. Armada 1500
>  shall have the following properties:
>  
> diff --git a/arch/arm64/boot/dts/synaptics/as370.dtsi b/arch/arm64/boot/dts/synaptics/as370.dtsi
> deleted file mode 100644
> index 4bb5d650df9c..000000000000
> --- a/arch/arm64/boot/dts/synaptics/as370.dtsi
> +++ /dev/null
> @@ -1,173 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/*
> - * Copyright (C) 2018 Synaptics Incorporated
> - *
> - * Author: Jisheng Zhang <jszhang@kernel.org>
> - */
> -
> -#include <dt-bindings/interrupt-controller/arm-gic.h>
> -
> -/ {
> -	compatible = "syna,as370";
> -	interrupt-parent = <&gic>;
> -	#address-cells = <2>;
> -	#size-cells = <2>;
> -
> -	psci {
> -		compatible = "arm,psci-1.0";
> -		method = "smc";
> -	};
> -
> -	cpus {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		cpu0: cpu@0 {
> -			compatible = "arm,cortex-a53";
> -			device_type = "cpu";
> -			reg = <0x0>;
> -			enable-method = "psci";
> -			next-level-cache = <&l2>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> -		};
> -
> -		cpu1: cpu@1 {
> -			compatible = "arm,cortex-a53";
> -			device_type = "cpu";
> -			reg = <0x1>;
> -			enable-method = "psci";
> -			next-level-cache = <&l2>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> -		};
> -
> -		cpu2: cpu@2 {
> -			compatible = "arm,cortex-a53";
> -			device_type = "cpu";
> -			reg = <0x2>;
> -			enable-method = "psci";
> -			next-level-cache = <&l2>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> -		};
> -
> -		cpu3: cpu@3 {
> -			compatible = "arm,cortex-a53";
> -			device_type = "cpu";
> -			reg = <0x3>;
> -			enable-method = "psci";
> -			next-level-cache = <&l2>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
> -		};
> -
> -		l2: cache {
> -			compatible = "cache";
> -		};
> -
> -		idle-states {
> -			entry-method = "psci";
> -			CPU_SLEEP_0: cpu-sleep-0 {
> -				compatible = "arm,idle-state";
> -				local-timer-stop;
> -				arm,psci-suspend-param = <0x0010000>;
> -				entry-latency-us = <75>;
> -				exit-latency-us = <155>;
> -				min-residency-us = <1000>;
> -			};
> -		};
> -	};
> -
> -	osc: osc {
> -		compatible = "fixed-clock";
> -		#clock-cells = <0>;
> -		clock-frequency = <25000000>;
> -	};
> -
> -	pmu {
> -		compatible = "arm,cortex-a53-pmu";
> -		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-affinity = <&cpu0>,
> -				     <&cpu1>,
> -				     <&cpu2>,
> -				     <&cpu3>;
> -	};
> -
> -	timer {
> -		compatible = "arm,armv8-timer";
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> -	};
> -
> -	soc@f7000000 {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges = <0 0 0xf7000000 0x1000000>;
> -
> -		gic: interrupt-controller@901000 {
> -			compatible = "arm,gic-400";
> -			#interrupt-cells = <3>;
> -			interrupt-controller;
> -			reg = <0x901000 0x1000>,
> -			      <0x902000 0x2000>,
> -			      <0x904000 0x2000>,
> -			      <0x906000 0x2000>;
> -			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> -		};
> -
> -		apb@e80000 {
> -			compatible = "simple-bus";
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			ranges = <0 0xe80000 0x10000>;
> -
> -			uart0: serial@c00 {
> -				compatible = "snps,dw-apb-uart";
> -				reg = <0xc00 0x100>;
> -				interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&osc>;
> -				reg-shift = <2>;
> -				status = "disabled";
> -			};
> -
> -			gpio0: gpio@1800 {
> -				compatible = "snps,dw-apb-gpio";
> -				reg = <0x1800 0x400>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				porta: gpio-port@0 {
> -					compatible = "snps,dw-apb-gpio-port";
> -					gpio-controller;
> -					#gpio-cells = <2>;
> -					ngpios = <32>;
> -					reg = <0>;
> -					interrupt-controller;
> -					#interrupt-cells = <2>;
> -					interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> -				};
> -			};
> -
> -			gpio1: gpio@2000 {
> -				compatible = "snps,dw-apb-gpio";
> -				reg = <0x2000 0x400>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				portb: gpio-port@1 {
> -					compatible = "snps,dw-apb-gpio-port";
> -					gpio-controller;
> -					#gpio-cells = <2>;
> -					ngpios = <32>;
> -					reg = <0>;
> -					interrupt-controller;
> -					#interrupt-cells = <2>;
> -					interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> -				};
> -			};
> -		};
> -	};
> -};
> -- 
> 2.32.0
> 
