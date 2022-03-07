Return-Path: <SRS0=D0ga=TS=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1347C433EF
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 10:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84190C340E9; Mon,  7 Mar 2022 10:25:13 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B94BC340F6;
	Mon,  7 Mar 2022 10:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B94BC340F6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id w4so16632390edc.7;
        Mon, 07 Mar 2022 02:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9BEIE4LEowvxQSSTz3f1Y8ar8ZR223l9KKCc1D8mpx0=;
        b=xvDxOgYgOq8mKhllZAnZNvRl8RsLgVVH4NEvHj9+awoLp1cF3jSRr0FheTyZ7I51GZ
         YhTiqlQNuHXfISwqVjlosV05xi7bJy0E2KWcGorZdCh/BHYeVsq/qx0PkWQqN4B0OQ9E
         C769/wTfx9q0n0FgNZpLX/pyQnKjY2posYapSmetL/jRmw0/luzq2zn4avqsr8duXGnl
         z3OykzSIaeVRMz3R0joj8+8bxZCgVUQGPlrrZXpgBAVGNjR7ghUTlTKtR9+2b5/Jb8te
         tlxN3g8dRf6TvGdpHVAJ4C0pM69IaDacQjbsHhPwRn0ZakRgzNwhEtTLP+Jad93Dw0V+
         57jg==
X-Gm-Message-State: AOAM530eI5jzeGD7isF29LmRACpS4KKnlNYSsCFnJ/6zH40moq9KDzyT
	wbx3q52QvAebz70fpMzjJmM=
X-Google-Smtp-Source: ABdhPJwIkS5RGTudyYpPKaC8uoCHh20OFgMnawdAASKR32kUeYvdzWByRI3rumxyl4AavNo2ImHiRw==
X-Received: by 2002:a05:6402:3712:b0:416:13bf:4fc5 with SMTP id ek18-20020a056402371200b0041613bf4fc5mr10687450edb.115.1646648710572;
        Mon, 07 Mar 2022 02:25:10 -0800 (PST)
Received: from [192.168.0.141] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.googlemail.com with ESMTPSA id rh13-20020a17090720ed00b006da69254082sm4558682ejb.135.2022.03.07.02.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 02:25:10 -0800 (PST)
Message-ID: <2669852c-5bb6-1edf-bf58-ea815f54d50f@kernel.org>
Date: Mon, 7 Mar 2022 11:25:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] arm64: dts: nuvoton: Add initial support for MA35D1
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, robh+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, arnd@arndb.de, olof@lixom.net
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220307091923.9909-1-ychuang3@nuvoton.com>
 <20220307091923.9909-4-ychuang3@nuvoton.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220307091923.9909-4-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/03/2022 10:19, Jacky Huang wrote:
> Add the initial device tree files for Nuvoton MA35D1 Soc.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  arch/arm64/boot/dts/Makefile               |   1 +
>  arch/arm64/boot/dts/nuvoton/Makefile       |   2 +
>  arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts |  23 +++++
>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi    | 106 +++++++++++++++++++++
>  4 files changed, 132 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nuvoton/Makefile
>  create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts
>  create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> 
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 639e01a4d855..28e01442094f 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -30,3 +30,4 @@ subdir-y += synaptics
>  subdir-y += ti
>  subdir-y += toshiba
>  subdir-y += xilinx
> +subdir-y += nuvoton
> diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
> new file mode 100644
> index 000000000000..e1e0c466bf5e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_NUVOTON) += ma35d1-evb.dtb

ARCH_NUVOTON does not exist.

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts
> new file mode 100644
> index 000000000000..38e4f734da0f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree Source for MA35D1 Evaluation Board (EVB)
> + *
> + * Copyright (C) 2021 Nuvoton Technology Corp.
> + */
> +
> +/dts-v1/;
> +#include "ma35d1.dtsi"
> +
> +/ {
> +       model = "Nuvoton MA35D1-EVB";
> +
> +       chosen {
> +               bootargs = "console=ttyS0,115200n8";

No bootargs. "chosen", please.

> +       };

You need compatible and bindings.

> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x00000000 0x80000000 0 0x10000000>;
> +       };
> +};
> +
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> new file mode 100644
> index 000000000000..27adac4975c3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
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
> +       compatible = "nuvoton,ma35d1";

Please run checkpatch. This compatible looks undocumented.

> +       interrupt-parent = <&gic>;
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       cpus {
> +               #address-cells = <2>;
> +               #size-cells = <0>;
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu = <&cpu0>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu1>;
> +                               };
> +                       };
> +               };

Line break between each nodes, here and below.

> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a35";
> +                       reg = <0x0 0x0>;
> +                       enable-method = "psci";
> +                       next-level-cache = <&L2_0>;
> +               };
> +               cpu1: cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a35";
> +                       reg = <0x0 0x1>;
> +                       enable-method = "psci";
> +                       next-level-cache = <&L2_0>;
> +               };
> +               L2_0: l2-cache0 {
> +                       compatible = "cache";
> +                       cache-level = <2>;
> +               };
> +       };
> +
> +       psci {
> +               compatible = "arm,psci-0.2";
> +               method = "smc";
> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
> +                                         IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
> +                                         IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
> +                                         IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
> +                                         IRQ_TYPE_LEVEL_LOW)>;
> +               clock-frequency = <12000000>;
> +       };
> +
> +       sys: system-controller@40460000 {
> +               compatible = "nuvoton,ma35d1-sys", "syscon", "simple-mfd";
> +               reg = <0x0 0x40460000 0x0 0x200>;
> +       };
> +
> +       reset: reset-controller {
> +               compatible = "nuvoton,ma35d1-reset";
> +               nuvoton,ma35d1-sys = <&sys>;
> +               #reset-cells = <1>;
> +       };
> +
> +       clk: clock-controller@40460200 {
> +               compatible = "nuvoton,ma35d1-clk";
> +               reg = <0x00000000 0x40460200 0x0 0x100>;
> +               #clock-cells = <1>;
> +               assigned-clocks = <&clk DDRPLL>,
> +                                 <&clk APLL>,
> +                                 <&clk EPLL>,
> +                                 <&clk VPLL>;
> +               assigned-clock-rates = <266000000>,
> +                                      <180000000>,
> +                                      <500000000>,
> +                                      <102000000>;
> +               clock-pll-mode = <1>, <0>, <0>, <0>;
> +       };
> +
> +       gic: interrupt-controller@50800000 {
> +               compatible = "arm,gic-400";
> +               #interrupt-cells = <3>;
> +               interrupt-parent = <&gic>;
> +               interrupt-controller;
> +               reg = <0x0 0x50801000 0 0x1000>,
> +                     <0x0 0x50802000 0 0x2000>,
> +                     <0x0 0x50804000 0 0x2000>,
> +                     <0x0 0x50806000 0 0x2000>;
> +               interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0x13) |
> +                                        IRQ_TYPE_LEVEL_HIGH)>;
> +       };
> +};
> --
> 2.17.1
> 
> ________________________________
> ________________________________
>  The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately.


> Your cooperation is highly appreciated...

Cooperation seems futile... :)

Best regards,
Krzysztof
