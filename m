Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17B216ABC6
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 05:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165107; cv=none; b=o9MrvGyuV50FSzV3TupaMUaXy9Z58pXm/y+CkH5vINP4brsLzfC0ysexmujKDzERHuYFSk3LSIKRFeTv5gMuKFvo1KcQqMzBK7DrtNW8O6+Bl+5k83vl9KqnlPcb0n19xxcZDBkiGAtPK0TZwyqvXnzU4AdtuIdZLo8ANEsx4Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165107; c=relaxed/simple;
	bh=RTrrx6UbAwOdfacoU/QP207LikTxBSDpj5xZF1dpQ5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1RoKZrC91sJ1SGPcGHJVqCJqkjZXFcUcuKQJNBNhz+oLoYyO2LXDb03bV6iK+5FYM7tCIpw3AOyHWulxDhtEmq78ltH8Exf7ijQCdIEXE91f+IDiz2tj3Bxzd6muXNMcdJKqFkrs/YAFAfvm4JHlVm4J5NfZiC09ue+XIC7KUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3x5wEeX; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3x5wEeX"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46fcbb96ba9so49759161cf.0
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 21:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739165105; x=1739769905; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7IFkxoJIPpueHk3Dd4/FzbaVjVFKjq20JwLnPRuIaMk=;
        b=G3x5wEeX33VsA7ragF3exM61vv6MDeud6FAk5TitcMyUtd9JavkCrLu3uOplNIRl0k
         XwVOg48oNwSiQvcaeAfbHhA4s0R7r1jQDYhRtYM6eKqZofewWqiFgW1HPGuKSekz/WG0
         guySb70LQ4V6E6aFzVf/8Ed7TgIt3nq1OA3hhMmudWD98ySZnRe60MHXYypQguxDF4i0
         ETw1vs+lp1jOzM+gV8KVojg3S0kjTqxZDu4ArxJeJTQ36CB/jwbc82A/4dvttYCYwb6P
         vThOaEGhn86vppVUsoGxsWBGU5Swc6HVu8u4KafczUACXC+90undy99rh0je2CTGFCuq
         DrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739165105; x=1739769905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IFkxoJIPpueHk3Dd4/FzbaVjVFKjq20JwLnPRuIaMk=;
        b=UCeRAuJ1CdrXd4zyeQ2rfy5cOYL2jJdum3365I9IM42Tz61h43uhPCTWje8EIkrv0U
         eh5wMUZshw4FCMhppOEsKOZ+Gu69zHZczrL/JxpeLGAHRcrCNVQ8qwrg28ynK2TgV6UZ
         ArzjfYfFTZxGaIHFSvw0exYbneXP8zfkH1+bUIJi8QhBI+ty3K05heAE8YFDd60QwBdr
         2M6XmTE//8fZPn8/zK8jm9iGmRwyWjVsE1klp10YEzWJO4PJECyIr6QLtqgxBpsxAYRe
         vU2mEngbpFV2YK88cwoM2FnKsVrbODgDO64shm0PlJTFuKWuKsXov7x4nrhqoPIviDBl
         xPhw==
X-Forwarded-Encrypted: i=1; AJvYcCW2ORNq8oknHdCOl0/YxzWU0kgv5a+9vuYuUA5hfKFfoPQE+GgdkTCsvtkP3LkXBONzsUQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc98+rEnk1NTe1se3dw7APjMMOLHOx/kvmtYr9GsbOXdKtpPSC
	RLY3b+7bkyduW+WIn8OVtS/Hk2DsDb8lyKGcdRymLY+TXJR3Iry+ykEDbQ==
X-Gm-Gg: ASbGncuwuqkbfNjGPWZSP9KrUXmbcFksqIruSDSwmsu3R+i+PjkN27qr8LD+Ecy6alM
	lQI75FKwO71hmu0jzkooi8CNF9v+AysDSW9FmUNg4/eMfXRxUW+zyezThh5hrOrieylRjWWIpjU
	KyAyLSDjrB+TYQB/y+uEjDw5h77g+UAjqERTPQaCB0jREeqHkGSVG5llVZF/soiH9voxoQ0eodr
	ZM8Y0bTpS5sv2Yvr5yFvIo2TH+SKqc6wDs2zEKz4zwLUMsh/JT06ObXv1jYbTMldJg=
X-Google-Smtp-Source: AGHT+IF88Qj5BXZRsD6619e0PbX62Rvx+7INc9jZTGKOkrlP86k5mF3+32TaSxZSLUN+bTkY1+lKGg==
X-Received: by 2002:a05:6214:2467:b0:6e4:2d90:37ed with SMTP id 6a1803df08f44-6e445620d64mr155154756d6.18.1739165104418;
        Sun, 09 Feb 2025 21:25:04 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e44f1c96f6sm26774386d6.61.2025.02.09.21.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:25:04 -0800 (PST)
Date: Mon, 10 Feb 2025 13:24:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 02/10] riscv: dts: sophgo: cv18xx: Split into CPU core
 and peripheral parts
Message-ID: <bdwht3hjui3sjy54sgv7e2uzsd6l7625bcx7vvk6wq372wgvdu@v2snqaox57hx>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-3-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-3-alexander.sverdlin@gmail.com>

On Sun, Feb 09, 2025 at 11:06:27PM +0100, Alexander Sverdlin wrote:
> Make the peripheral device tree re-usable on ARM64 platform by splitting it
> into CPU-core specific and peripheral parts.
> 
> Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
> into "plic" interrupt-controller numbering.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv181x.dtsi        |   2 +-
>  arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 313 ++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 305 +----------------
>  3 files changed, 317 insertions(+), 303 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv181x.dtsi b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
> index 5fd14dd1b14f..bbdb30653e9a 100644
> --- a/arch/riscv/boot/dts/sophgo/cv181x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
> @@ -11,7 +11,7 @@ soc {
>  		emmc: mmc@4300000 {
>  			compatible = "sophgo,cv1800b-dwcmshc";
>  			reg = <0x4300000 0x1000>;
> -			interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(18) IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_AXI4_EMMC>,
>  				 <&clk CLK_EMMC>;
>  			clock-names = "core", "bus";
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> new file mode 100644
> index 000000000000..53834b0658b2
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> + */
> +

Split the cpu into a separate file and hold the cv18xx.dtsi to
hold the peripheral. Also define the SOC_PERIPHERAL_IRQ in the
cpu file, so you can get less change.

> +#include <dt-bindings/clock/sophgo,cv1800.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	osc: oscillator {
> +		compatible = "fixed-clock";
> +		clock-output-names = "osc_25m";
> +		#clock-cells = <0>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;

You also needs ranges here.

> +
> +		clk: clock-controller@3002000 {
> +			reg = <0x03002000 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};
> +

[...]

> +		dmac: dma-controller@4330000 {
> +			compatible = "snps,axi-dma-1.01a";
> +			reg = <0x04330000 0x1000>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
> +			clock-names = "core-clk", "cfgr-clk";
> +			#dma-cells = <1>;
> +			dma-channels = <8>;
> +			snps,block-size = <1024 1024 1024 1024
> +					   1024 1024 1024 1024>;
> +			snps,priority = <0 1 2 3 4 5 6 7>;
> +			snps,dma-masters = <2>;
> +			snps,data-width = <4>;
> +			status = "disabled";
> +		};
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index c18822ec849f..57a01b71aa67 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -4,9 +4,9 @@
>   * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
>   */
>  
> -#include <dt-bindings/clock/sophgo,cv1800.h>
> -#include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/interrupt-controller/irq.h>
> +#define SOC_PERIPHERAL_IRQ(nr)		((nr) + 16)
> +
> +#include "cv18xx-periph.dtsi"
>  
>  / {
>  	#address-cells = <1>;
> @@ -41,310 +41,11 @@ cpu0_intc: interrupt-controller {
>  		};
>  	};
>  
> -	osc: oscillator {
> -		compatible = "fixed-clock";
> -		clock-output-names = "osc_25m";
> -		#clock-cells = <0>;
> -	};
> -
>  	soc {
> -		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;

>  		dma-noncoherent;

Move this into new cpu file.

>  		ranges;
>  
> -		clk: clock-controller@3002000 {
> -			reg = <0x03002000 0x1000>;
> -			clocks = <&osc>;
> -			#clock-cells = <1>;
> -		};
> -
> -		gpio0: gpio@3020000 {
> -			compatible = "snps,dw-apb-gpio";
> -			reg = <0x3020000 0x1000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			porta: gpio-controller@0 {
> -				compatible = "snps,dw-apb-gpio-port";
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				ngpios = <32>;
> -				reg = <0>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				interrupts = <60 IRQ_TYPE_LEVEL_HIGH>;
> -			};
> -		};
> -
> -		gpio1: gpio@3021000 {
> -			compatible = "snps,dw-apb-gpio";
> -			reg = <0x3021000 0x1000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			portb: gpio-controller@0 {
> -				compatible = "snps,dw-apb-gpio-port";
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				ngpios = <32>;
> -				reg = <0>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				interrupts = <61 IRQ_TYPE_LEVEL_HIGH>;
> -			};
> -		};
> -
> -		gpio2: gpio@3022000 {
> -			compatible = "snps,dw-apb-gpio";
> -			reg = <0x3022000 0x1000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			portc: gpio-controller@0 {
> -				compatible = "snps,dw-apb-gpio-port";
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				ngpios = <32>;
> -				reg = <0>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
> -			};
> -		};
> -
> -		gpio3: gpio@3023000 {
> -			compatible = "snps,dw-apb-gpio";
> -			reg = <0x3023000 0x1000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			portd: gpio-controller@0 {
> -				compatible = "snps,dw-apb-gpio-port";
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				ngpios = <32>;
> -				reg = <0>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				interrupts = <63 IRQ_TYPE_LEVEL_HIGH>;
> -			};
> -		};
> -
> -		saradc: adc@30f0000 {
> -			compatible = "sophgo,cv1800b-saradc";
> -			reg = <0x030f0000 0x1000>;
> -			clocks = <&clk CLK_SARADC>;
> -			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			status = "disabled";
> -
> -			channel@0 {
> -				reg = <0>;
> -			};
> -
> -			channel@1 {
> -				reg = <1>;
> -			};
> -
> -			channel@2 {
> -				reg = <2>;
> -			};
> -		};
> -
> -		i2c0: i2c@4000000 {
> -			compatible = "snps,designware-i2c";
> -			reg = <0x04000000 0x10000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
> -			clock-names = "ref", "pclk";
> -			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> -		};
> -
> -		i2c1: i2c@4010000 {
> -			compatible = "snps,designware-i2c";
> -			reg = <0x04010000 0x10000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
> -			clock-names = "ref", "pclk";
> -			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> -		};
> -
> -		i2c2: i2c@4020000 {
> -			compatible = "snps,designware-i2c";
> -			reg = <0x04020000 0x10000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
> -			clock-names = "ref", "pclk";
> -			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> -		};
> -
> -		i2c3: i2c@4030000 {
> -			compatible = "snps,designware-i2c";
> -			reg = <0x04030000 0x10000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
> -			clock-names = "ref", "pclk";
> -			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> -		};
> -
> -		i2c4: i2c@4040000 {
> -			compatible = "snps,designware-i2c";
> -			reg = <0x04040000 0x10000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
> -			clock-names = "ref", "pclk";
> -			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> -		};
> -
> -		uart0: serial@4140000 {
> -			compatible = "snps,dw-apb-uart";
> -			reg = <0x04140000 0x100>;
> -			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_UART0>, <&clk CLK_APB_UART0>;
> -			clock-names = "baudclk", "apb_pclk";
> -			reg-shift = <2>;
> -			reg-io-width = <4>;
> -			status = "disabled";
> -		};
> -
> -		uart1: serial@4150000 {
> -			compatible = "snps,dw-apb-uart";
> -			reg = <0x04150000 0x100>;
> -			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_UART1>, <&clk CLK_APB_UART1>;
> -			clock-names = "baudclk", "apb_pclk";
> -			reg-shift = <2>;
> -			reg-io-width = <4>;
> -			status = "disabled";
> -		};
> -
> -		uart2: serial@4160000 {
> -			compatible = "snps,dw-apb-uart";
> -			reg = <0x04160000 0x100>;
> -			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_UART2>, <&clk CLK_APB_UART2>;
> -			clock-names = "baudclk", "apb_pclk";
> -			reg-shift = <2>;
> -			reg-io-width = <4>;
> -			status = "disabled";
> -		};
> -
> -		uart3: serial@4170000 {
> -			compatible = "snps,dw-apb-uart";
> -			reg = <0x04170000 0x100>;
> -			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_UART3>, <&clk CLK_APB_UART3>;
> -			clock-names = "baudclk", "apb_pclk";
> -			reg-shift = <2>;
> -			reg-io-width = <4>;
> -			status = "disabled";
> -		};
> -
> -		spi0: spi@4180000 {
> -			compatible = "snps,dw-apb-ssi";
> -			reg = <0x04180000 0x10000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
> -			clock-names = "ssi_clk", "pclk";
> -			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> -		};
> -
> -		spi1: spi@4190000 {
> -			compatible = "snps,dw-apb-ssi";
> -			reg = <0x04190000 0x10000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
> -			clock-names = "ssi_clk", "pclk";
> -			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> -		};
> -
> -		spi2: spi@41a0000 {
> -			compatible = "snps,dw-apb-ssi";
> -			reg = <0x041a0000 0x10000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
> -			clock-names = "ssi_clk", "pclk";
> -			interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> -		};
> -
> -		spi3: spi@41b0000 {
> -			compatible = "snps,dw-apb-ssi";
> -			reg = <0x041b0000 0x10000>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
> -			clock-names = "ssi_clk", "pclk";
> -			interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> -		};
> -
> -		uart4: serial@41c0000 {
> -			compatible = "snps,dw-apb-uart";
> -			reg = <0x041c0000 0x100>;
> -			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_UART4>, <&clk CLK_APB_UART4>;
> -			clock-names = "baudclk", "apb_pclk";
> -			reg-shift = <2>;
> -			reg-io-width = <4>;
> -			status = "disabled";
> -		};
> -
> -		sdhci0: mmc@4310000 {
> -			compatible = "sophgo,cv1800b-dwcmshc";
> -			reg = <0x4310000 0x1000>;
> -			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_AXI4_SD0>,
> -				 <&clk CLK_SD0>;
> -			clock-names = "core", "bus";
> -			status = "disabled";
> -		};
> -
> -		sdhci1: mmc@4320000 {
> -			compatible = "sophgo,cv1800b-dwcmshc";
> -			reg = <0x4320000 0x1000>;
> -			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_AXI4_SD1>,
> -				 <&clk CLK_SD1>;
> -			clock-names = "core", "bus";
> -			status = "disabled";
> -		};
> -
> -		dmac: dma-controller@4330000 {
> -			compatible = "snps,axi-dma-1.01a";
> -			reg = <0x04330000 0x1000>;
> -			interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
> -			clock-names = "core-clk", "cfgr-clk";
> -			#dma-cells = <1>;
> -			dma-channels = <8>;
> -			snps,block-size = <1024 1024 1024 1024
> -					   1024 1024 1024 1024>;
> -			snps,priority = <0 1 2 3 4 5 6 7>;
> -			snps,dma-masters = <2>;
> -			snps,data-width = <4>;
> -			status = "disabled";
> -		};
> -
>  		plic: interrupt-controller@70000000 {
>  			reg = <0x70000000 0x4000000>;
>  			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> -- 
> 2.48.1
> 
