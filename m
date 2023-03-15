Return-Path: <SRS0=9v8K=7H=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFA2C61DA4
	for <soc@archiver.kernel.org>; Wed, 15 Mar 2023 06:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C931C4339E; Wed, 15 Mar 2023 06:36:52 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88577C433EF
	for <soc@kernel.org>; Wed, 15 Mar 2023 06:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88577C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id o12so71357375edb.9
        for <soc@kernel.org>; Tue, 14 Mar 2023 23:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678862209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KC0WmgOfjafcWzo9T9EJ/kwEick/ELqJEOpJmapTe34=;
        b=EOjepyr2KbnBu8V+/dIGLzeB7rf6edvM4dAgNrBj3u509JsU8+PnB8JwXXcPViAggr
         9jNvXLnXOa4cPP77tl3j43+VkIE1JTz/rcuv04wM+uUq+872el8nhhFDCuzFWE4VtinF
         S7mxdEAYzcPDPhUC7e5Rbx7z+l7ImirLvzSTe7fgguKwMCICuHOwxili5n55Fl6sRzYi
         gjWeC6M0eFSpNpEcC8PeA+0n6NyYUyVZcTlwa7StRY7I0E75n5Y71R0QWqFacnPbBGxG
         SuJBo5pUr2eh0WXQeKBSguE3QcuUXZ0dCW/b1mq+p9K+TWKtsOBHDoX1bQzGDGxLYQQO
         bHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KC0WmgOfjafcWzo9T9EJ/kwEick/ELqJEOpJmapTe34=;
        b=R54td7qKy2dQwZDXSnj8VlVAaJngKLW93CGUMyfisA5IPXC8pMfIPp1igz8d/v1chc
         sHHxYiFmft5siLQEpyhHen1qjUqSRLf4DOFNO+K8s+NRV8bx0BE+UvViyBvdcE+LYH3l
         vqRBo5ecQkOFD2Yxn4gGpjYZmGR+cHJkIVImoBmQ4FU6OobGujz1w5BWe+ESBbEmp3a3
         N3+s7bzKd7cOTSEn3E5ByRgHFiMPjCDTAcnMrZXVXJmnzijbUx4sfuVrUZcDq6V1Km3o
         ifQYXgyXY0WWczQENk2V3tkpjH1bVu6qpYyYlw7A4wdQY/Z4AVZl3hV4L2l36u+xPHW4
         Parw==
X-Gm-Message-State: AO0yUKVZYLVZQp2snADozGE+Suzf3J15Gc+rejA6RonzmNKcQhFnbHWv
	WIBOUGSQQFDiu35Q9WVv6ap5rQ==
X-Google-Smtp-Source: AK7set+Qlxf0T9dtFxHDCEa1K9fnKl6esE6BSL3I+/JB5H9lX8Bxy36qh8ITlyt5HcCvKap3KQCepQ==
X-Received: by 2002:a17:906:a245:b0:925:1d1d:6825 with SMTP id bi5-20020a170906a24500b009251d1d6825mr5153121ejb.42.1678862208766;
        Tue, 14 Mar 2023 23:36:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id rv20-20020a17090710d400b00924ffcb65e7sm2064103ejb.49.2023.03.14.23.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 23:36:48 -0700 (PDT)
Message-ID: <c31ede10-3f1d-cd82-12d5-199dafaa1c3a@linaro.org>
Date: Wed, 15 Mar 2023 07:36:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: cisco: add device tree for Cisco CrayAr
 Argos.
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Daniel Walker <danielwa@cisco.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 xe-linux-external@cisco.com
Cc: Marcin Wierzbicki <mawierzb@cisco.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230315010920.2473206-1-danielwa@cisco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315010920.2473206-1-danielwa@cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/03/2023 02:09, Daniel Walker wrote:
> From: Marcin Wierzbicki <mawierzb@cisco.com>
> 
> This adds device tree include file for Cisco CrayAR SoC and
> device tree file for Cisco CrayAR Argos EVB board.
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Marcin Wierzbicki <mawierzb@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>  .../devicetree/bindings/arm/cisco/crayar.yaml |  27 ++
>  MAINTAINERS                                   |   5 +
>  arch/arm64/Kconfig.platforms                  |   5 +
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/cisco/Makefile            |   2 +
>  arch/arm64/boot/dts/cisco/crayar.dtsi         | 326 ++++++++++++++++++
>  arch/arm64/boot/dts/cisco/crayar_argos.dts    |  32 ++
>  7 files changed, 398 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cisco/crayar.yaml
>  create mode 100644 arch/arm64/boot/dts/cisco/Makefile
>  create mode 100644 arch/arm64/boot/dts/cisco/crayar.dtsi
>  create mode 100644 arch/arm64/boot/dts/cisco/crayar_argos.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/cisco/crayar.yaml b/Documentation/devicetree/bindings/arm/cisco/crayar.yaml
> new file mode 100644
> index 000000000000..3975ca4fd07a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/cisco/crayar.yaml

Bindings are separate patches, always, split them.

> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license. Checkpatch should complain.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/cisco/crayar.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cisco CrayAR based Platforms Device Tree Bindings

Drio "Device Tree Bindings"

> +
> +maintainers:
> +  - xe-linux-external@cisco.com
> +
> +description: |

Drop '|'

> +  Cisco CrayAR boards with CrayAR SOC
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Cisco CrayAR Argos evaluation board
> +        items:
> +          - const: cisco,crayar-argos
> +          - const: cisco,crayar
> +
> +additionalProperties: true
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ec57c42ed544..f94d769c6f88 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4793,6 +4793,11 @@ X:	drivers/char/ipmi/
>  X:	drivers/char/random.c
>  X:	drivers/char/tpm/
>  
> +CISCO ARM64 DEVICE TREE SUPPORT
> +M:	xe-linux-external@cisco.com
> +S:	Supported
> +F:	arch/arm64/boot/dts/cisco/
> +
>  CHECKPATCH
>  M:	Andy Whitcroft <apw@canonical.com>
>  M:	Joe Perches <joe@perches.com>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 89a0b13b058d..740099c56382 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -94,6 +94,11 @@ config ARCH_BITMAIN
>  	help
>  	  This enables support for the Bitmain SoC Family.
>  
> +config ARCH_CISCO_CRAYAR_ARGOS
> +	bool "Cisco Argos Platform"
> +	help
> +	  This enables support for the Cisco Argos Platform.
> +
>  config ARCH_EXYNOS
>  	bool "Samsung Exynos SoC family"
>  	select COMMON_CLK_SAMSUNG
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 7b107fa7414b..3f83583f9996 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -11,6 +11,7 @@ subdir-y += arm
>  subdir-y += bitmain
>  subdir-y += broadcom
>  subdir-y += cavium
> +subdir-y += cisco
>  subdir-y += exynos
>  subdir-y += freescale
>  subdir-y += hisilicon
> diff --git a/arch/arm64/boot/dts/cisco/Makefile b/arch/arm64/boot/dts/cisco/Makefile
> new file mode 100644
> index 000000000000..b1d4220df2f4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cisco/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_CISCO_CRAYAR_ARGOS) += crayar_argos.dtb
> diff --git a/arch/arm64/boot/dts/cisco/crayar.dtsi b/arch/arm64/boot/dts/cisco/crayar.dtsi
> new file mode 100644
> index 000000000000..22579406e65c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cisco/crayar.dtsi
> @@ -0,0 +1,326 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Include file for Cisco CrayAR family SoC.
> + *
> + * Copyright (C) 2022 Cisco
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	compatible = "cisco,crayar";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <0x2>;
> +	#size-cells = <0x2>;
> +
> +	base_clk: base-clk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <500000000>;
> +	};
> +
> +	cpus {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75", "arm,armv8";
> +			reg = <0x00000>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x7003FFF8>;
> +			next-level-cache = <&l2_0>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75", "arm,armv8";
> +			reg = <0x00100>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x7003FFF8>;
> +			next-level-cache = <&l2_1>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75", "arm,armv8";
> +			reg = <0x00200>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x7003FFF8>;
> +			next-level-cache = <&l2_2>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75", "arm,armv8";
> +			reg = <0x00300>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x7003FFF8>;
> +			next-level-cache = <&l2_3>;
> +		};
> +
> +		cpu4: cpu@10000 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75", "arm,armv8";
> +			reg = <0x10000>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x7003FFF8>;
> +			next-level-cache = <&l2_4>;
> +		};
> +
> +		cpu5: cpu@10100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75", "arm,armv8";
> +			reg = <0x10100>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x7003FFF8>;
> +			next-level-cache = <&l2_5>;
> +		};
> +
> +		cpu6: cpu@10200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75", "arm,armv8";
> +			reg = <0x10200>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x7003FFF8>;
> +			next-level-cache = <&l2_6>;
> +		};
> +
> +		cpu7: cpu@10300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75", "arm,armv8";
> +			reg = <0x10300>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x7003FFF8>;
> +			next-level-cache = <&l2_7>;
> +		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +				core2 {
> +					cpu = <&cpu6>;
> +				};
> +				core3 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		l2_0: l2-cache0 {
> +			compatible = "cache";
> +			next-level-cache = <&l3_0>;
> +		};
> +
> +		l2_1: l2-cache1 {
> +			compatible = "cache";
> +			next-level-cache = <&l3_0>;
> +		};
> +
> +		l2_2: l2-cache2 {
> +			compatible = "cache";
> +			next-level-cache = <&l3_0>;
> +		};
> +
> +		l2_3: l2-cache3 {
> +			compatible = "cache";
> +			next-level-cache = <&l3_0>;
> +		};
> +
> +		l2_4: l2-cache4 {
> +			compatible = "cache";
> +			next-level-cache = <&l3_1>;
> +		};
> +
> +		l2_5: l2-cache5 {
> +			compatible = "cache";
> +			next-level-cache = <&l3_1>;
> +		};
> +
> +		l2_6: l2-cache6 {
> +			compatible = "cache";
> +			next-level-cache = <&l3_1>;
> +		};
> +
> +		l2_7: l2-cache7 {
> +			compatible = "cache";
> +			next-level-cache = <&l3_1>;
> +		};
> +
> +		l3_0: l3-cache0 {
> +			compatible = "cache";
> +		};
> +
> +		l3_1: l3-cache1 {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	cci: cci@2E000000 {

Lowercase hex, everywhere

> +		compatible = "arm,cci-550";
> +		#address-cells = <0x1>;
> +		#size-cells = <0x1>;
> +		reg = <0x0 0x2E000000 0x0 0x1000>;

reg is second property

> +		ranges = <0x0 0x0 0x2E000000 0x6000>;

ranges third, and fix case everywhere

> +
> +		secondary-if@1000 {
> +			compatible = "arm,cci-550-ctrl-if";
> +			interface-type = "ace-lite";
> +			reg = <0x1000 0x1000>;
> +		};
> +
> +		secondary-if@2000 {
> +			compatible = "arm,cci-550-ctrl-if";
> +			interface-type = "ace-lite";
> +			reg = <0x2000 0x1000>;
> +		};
> +
> +		secondary-if@3000 {
> +			compatible = "arm,cci-550-ctrl-if";
> +			interface-type = "ace-lite";
> +			reg = <0x3000 0x1000>;
> +		};
> +
> +		secondary-if@4000 {
> +			compatible = "arm,cci-550-ctrl-if";
> +			interface-type = "ace";
> +			reg = <0x4000 0x1000>;
> +		};
> +
> +		secondary-if@5000 {
> +			compatible = "arm,cci-550-ctrl-if";
> +			interface-type = "ace";
> +			reg = <0x5000 0x1000>;
> +		};
> +
> +		secondary-if@6000 {
> +			compatible = "arm,cci-550-ctrl-if";
> +			interface-type = "ace";
> +			reg = <0x6000 0x1000>;
> +		};
> +
> +		secondary-if@7000 {
> +			compatible = "arm,cci-550-ctrl-if";
> +			interface-type = "ace";
> +			reg = <0x6000 0x1000>;
> +		};
> +
> +		pm-cntr@10000 {
> +			compatible = "arm,cci-550-pmu";
> +			reg = <0x10000 0x10000>;
> +		};
> +
> +		pm-cntr@20000 {
> +			compatible = "arm,cci-550-pmu";
> +			reg = <0x20000 0x10000>;
> +		};
> +
> +		pm-cntr@30000 {
> +			compatible = "arm,cci-550-pmu";
> +			reg = <0x30000 0x10000>;
> +		};
> +
> +		pm-cntr@40000 {
> +			compatible = "arm,cci-550-pmu";
> +			reg = <0x40000 0x10000>;
> +		};
> +
> +		pm-cntr@50000 {
> +			compatible = "arm,cci-550-pmu";
> +			reg = <0x50000 0x10000>;
> +		};
> +
> +		pm-cntr@60000 {
> +			compatible = "arm,cci-550-pmu";
> +			reg = <0x60000 0x10000>;
> +		};
> +
> +		pm-cntr@70000 {
> +			compatible = "arm,cci-550-pmu";
> +			reg = <0x70000 0x10000>;
> +		};
> +
> +		pm-cntr@80000 {
> +			compatible = "arm,cci-550-pmu";
> +			reg = <0x80000 0x10000>;
> +		};
> +	};
> +
> +	timer: timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts =	<GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gic: interrupt-controller@20000000 {
> +		compatible = "arm,gic-v3";
> +		#interrupt-cells = <3>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		interrupt-controller;
> +		reg =	<0x0 0x20000000 0x0 0x10000>,	/* GICD */
> +			<0x0 0x20060000 0x0 0x100000>;	/* GICR */

Same problems.

> +
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		its: its@20040000 {
> +			compatible = "arm,gic-v3-its";
> +			msi-controller;
> +			mbi-ranges = <256 224>;
> +			reg = <0x0 0x20040000 0x0 0x10000>;
> +		};
> +	};


Best regards,
Krzysztof

