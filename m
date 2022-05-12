Return-Path: <SRS0=vWm3=VU=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE033C433EF
	for <soc@archiver.kernel.org>; Thu, 12 May 2022 14:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8B90C34117; Thu, 12 May 2022 14:10:53 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5A7BC385B8
	for <soc@kernel.org>; Thu, 12 May 2022 14:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5A7BC385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 1-20020a05600c248100b00393fbf11a05so5225649wms.3
        for <soc@kernel.org>; Thu, 12 May 2022 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vn7/TcXZx/YPKou36lJ5SmtraXVwL0/BIRBykC2c2Cc=;
        b=ELpy5XjveqTbQ4ADroA70GtG1vEajwTq8gcfIQB+I1nxFpX931aWSnoFQx+h571n++
         yd0fNUi9/fTlPLS57mNb59AkoMA/W5Smp2uJvCki/46uvU7xFFsMClq736XF2e1XJviL
         MD6+7e02pF6Tw628pSOEZ0yseQBub9uk0RL/FDLTgufH/y0UqUqRhS6ai6wpdbu6PmqP
         VMgi8+Pnybu4Af6vZydhwDMbp9dGPytUTX1ZqhhOECd7IWbhgpoobOCYR9dZhMGrRaw1
         eAwZ+6aiNmdIlnsQ+7Vsj6sARBD/c8mN+DrlJuG4arrQto4jDONePgcfP6b7weDDAFov
         TJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vn7/TcXZx/YPKou36lJ5SmtraXVwL0/BIRBykC2c2Cc=;
        b=ZFhoYIOxyAN+GRSJ6+CBGezQ5AqySwb6asMarjgKyKkx+QCkBTGk/2Q5m+HzZxq/qB
         fiI7b6gr44VaYI27xoQpXycQWgOeq49GZmm+DV7buxuIlgCa/d5WmpHHQnQchCuFEzPk
         DuS6w97nFDWoZdVrya/YJqAHlXMHLoYyYWMEyd8DpLHe4jGwQYE1yJ1pqcJ+sqpIp21a
         3yr6gxM2Mxg3h4QDo1LivHjnAVBpjNlXoG5GSlLjn+WYs9qANv6W6sfTK2rwpIut1UyL
         jRIj9r+HLUvdgoRDqcPwsHW3DaWRgsq2n2cYQUH/jDyCDFj9gPXUBqPdgXH9tGOEcBJk
         61yQ==
X-Gm-Message-State: AOAM532fxkp/EWYnEv8GKyaDCsfL1fl3WWPf2RxK5hyoCsfbqBzZqMbc
	BGCkMQTCFakxjidIVwwLOVxpzQ==
X-Google-Smtp-Source: ABdhPJwsTL8QgcQKZq0wtbtNwGv44FIHOTOX3N5Tmf13Z//DkzY60DPj3KlFflGFpzZV2EIzFfLy5A==
X-Received: by 2002:a1c:f30b:0:b0:37b:b5de:c804 with SMTP id q11-20020a1cf30b000000b0037bb5dec804mr10411340wmq.166.1652364650173;
        Thu, 12 May 2022 07:10:50 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w17-20020a05600018d100b0020c5253d90asm4503374wrq.86.2022.05.12.07.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 07:10:49 -0700 (PDT)
Message-ID: <03ac0a67-bd1f-12ca-74f7-8d5b05857ea7@linaro.org>
Date: Thu, 12 May 2022 16:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH V4 3/5] arm64: dts: nuvoton: Add initial support for
 MA35D1
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, catalin.marinas@arm.com, will@kernel.org, soc@kernel.org,
 cfli0@nuvoton.com
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
 <20220510032558.10304-4-ychuang3@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220510032558.10304-4-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 05:25, Jacky Huang wrote:
> Add the initial device tree files for Nuvoton MA35D1 Soc.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  arch/arm64/boot/dts/Makefile               |   1 +
>  arch/arm64/boot/dts/nuvoton/Makefile       |   2 +
>  arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts |  24 +++++
>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi    | 120 +++++++++++++++++++++
>  4 files changed, 147 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nuvoton/Makefile
>  create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts
>  create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> 
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 1ba04e31a438..7b107fa7414b 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -19,6 +19,7 @@ subdir-y += lg
>  subdir-y += marvell
>  subdir-y += mediatek
>  subdir-y += microchip
> +subdir-y += nuvoton
>  subdir-y += nvidia
>  subdir-y += qcom
>  subdir-y += realtek
> diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
> new file mode 100644
> index 000000000000..e1e0c466bf5e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_NUVOTON) += ma35d1-evb.dtb
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts
> new file mode 100644
> index 000000000000..95f0facb0476
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for MA35D1 Evaluation Board (EVB)
> + *
> + * Copyright (C) 2022 Nuvoton Technology Corp.
> + */
> +
> +/dts-v1/;
> +#include "ma35d1.dtsi"
> +
> +/ {
> +	model = "Nuvoton MA35D1-EVB";
> +	compatible = "nuvoton,ma35d1-evb", "nuvoton,ma35d1";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x10000000>;
> +	};
> +};
> +


.git/rebase-apply/patch:60: new blank line at EOF.

+

warning: 1 line adds whitespace errors.



> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> new file mode 100644
> index 000000000000..7212f8de6906
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) 2022 Nuvoton Technology Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +/ {
> +	compatible = "nuvoton,ma35d1";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_0>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35";
> +			reg = <0x1>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_0>;
> +		};
> +
> +		L2_0: l2-cache0 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	hxt_24m: hxt_24mhz {

No underscores in node name. Generic node names, so "clock-X" or
"clock-some-suffix"

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;

This does not look like property of SoC. Where is this clock defined? In
the SoC or on the board?

> +		clock-output-names = "HXT_24MHz";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
> +					  IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
> +					  IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
> +					  IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
> +					  IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <12000000>;
> +	};
> +
> +	sys: system-controller@40460000 {
> +		compatible = "nuvoton,ma35d1-sys", "syscon", "simple-mfd";

Why is this a simple-mfd if there are no children here? What do you want
to instantiate here?

Where is the nuvoton,ma35d1-sys compatible documented?

> +		reg = <0x0 0x40460000 0x0 0x400>;
> +	};
> +
> +	reset: reset-controller {
> +		compatible = "nuvoton,ma35d1-reset";

Also not documented.

> +		nuvoton,ma35d1-sys = <&sys>;
> +		#reset-cells = <1>;
> +	};
> +
> +	clk: clock-controller@40460200 {
> +		compatible = "nuvoton,ma35d1-clk";
> +		reg = <0x0 0x40460200 0x0 0x100>;
> +		#clock-cells = <1>;
> +		clocks = <&hxt_24m>;
> +		clock-names = "HXT_24MHz";

Please test your DTS with make dtbs_check.

Don't send DTS which does not pass the checks. It is unnecessary use of
reviewers time when the same job can be done by automated tools.

Best regards,
Krzysztof
