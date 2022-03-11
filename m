Return-Path: <SRS0=EJTU=TW=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3F8C433F5
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 10:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92642C340EC; Fri, 11 Mar 2022 10:29:58 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E2E0C340E9
	for <soc@kernel.org>; Fri, 11 Mar 2022 10:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E2E0C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4F74F3F1DE
	for <soc@kernel.org>; Fri, 11 Mar 2022 10:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646994595;
	bh=GAdlqHcA6Sh85uTkI0dqow1UouMp3pSS26cRmxWTyao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=T9SVmNdTLWoOxqVLP+PDvuAMnzgvhUrVPRTf1HJljCwr3ijofvIdPMPToToYvnehk
	 o6jkODlh21Hl9/I4d0qW+s+yCaaF/uBkjIgtbVhQuqFiqita4qmngsyrZMatTatXAm
	 9vPD1ZPv0EWlrNED8GKwwzXQ/pNwGMofLDG4cnRoA+W4PpttFFkmpQ5rCyuV99eFGS
	 aOdPamj76KhkYXrJ1YR9RKMWNTxj3nf064wNNxDNBeCncHugCqCR2jgO5k/84V4Mms
	 LWYIdbQfwWAEh4Xl5Gzb1CPrI4Jj5tC+Zncq503CojfWqvbLSLosV6wBBzHRMmWJB0
	 U8JhW8iFyTYWQ==
Received: by mail-ej1-f69.google.com with SMTP id m12-20020a1709062acc00b006cfc98179e2so4721117eje.6
        for <soc@kernel.org>; Fri, 11 Mar 2022 02:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GAdlqHcA6Sh85uTkI0dqow1UouMp3pSS26cRmxWTyao=;
        b=5ZiQq0/FFPepKLhPw0bgUhjrs4Uh0dAdUBzj/yj3SLgfxi0p3EaXEFpk9THmd06wjk
         apCi8ZqNgWkv7NS47iEljfyJb2Sz6HkwQ4gL44qbFwGvOPgh8UyyNw3Y/MfagMOvLgqz
         8dPEP0AIAfBXXLnWGuuBmqRu6meQD2aKABDzt/57E9KGacPYdjgU5+P9C002YQkC9yq3
         c4R7dvdjTSJeAWHEOOCjF7xTHs1zrQz0si2m5Z7Xu4vn7uTpC5OIpFuZRWJxZgf8AkDj
         FWwJGAoAnRdg2yt9NzgzP0lsb1eVInoNrfQ00Nxi8NstBtTZrvso3wi3Xk69nK6/x40A
         VVWA==
X-Gm-Message-State: AOAM532GX9JxPxBJpcK+okYXZ125w3PYVoTyp93YBz96ZNtUFZ5ni1sO
	t1XgisVP9GzQoeMvXf70eY+b2w2pwwr+b1lAhff/NNllJX67OqGmZuDfK0B6J7C8Z2vqSeOXHcY
	G2uZ/JGf3ed5xQGkVJ0Ftab0=
X-Received: by 2002:a17:907:3e09:b0:6da:83e0:f2a4 with SMTP id hp9-20020a1709073e0900b006da83e0f2a4mr8202650ejc.758.1646994594904;
        Fri, 11 Mar 2022 02:29:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT2eso8G7Fi6TIPVxrIn33+/LwnmQUGoAsBS+jNWgtjnhVY+thE0W80PoU0E/7xBrAbEwkzg==
X-Received: by 2002:a17:907:3e09:b0:6da:83e0:f2a4 with SMTP id hp9-20020a1709073e0900b006da83e0f2a4mr8202633ejc.758.1646994594631;
        Fri, 11 Mar 2022 02:29:54 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id n25-20020aa7db59000000b00415965e9727sm3058824edt.18.2022.03.11.02.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 02:29:54 -0800 (PST)
Message-ID: <eb66cc83-2da9-8e19-db69-633e34fef946@canonical.com>
Date: Fri, 11 Mar 2022 11:29:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 09/10] arch: arm: boot: dts: Introduce HPE GXP Device
 tree
Content-Language: en-US
To: nick.hawkins@hpe.com, verdun@hpe.com
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220310195229.109477-1-nick.hawkins@hpe.com>
 <20220310195229.109477-9-nick.hawkins@hpe.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220310195229.109477-9-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/03/2022 20:52, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> The HPE SoC is new to linux. This patch
> creates the basic device tree layout with minimum required
> for linux to boot. This includes timer and watchdog
> support.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  arch/arm/boot/dts/Makefile               |   2 +
>  arch/arm/boot/dts/hpe-bmc-dl360gen10.dts |  27 +++++
>  arch/arm/boot/dts/hpe-gxp.dtsi           | 148 +++++++++++++++++++++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
>  create mode 100644 arch/arm/boot/dts/hpe-gxp.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index e41eca79c950..2823b359d373 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1550,3 +1550,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-vegman-n110.dtb \
>  	aspeed-bmc-vegman-rx20.dtb \
>  	aspeed-bmc-vegman-sx20.dtb
> +dtb-$(CONFIG_ARCH_HPE_GXP) += \
> +	hpe-bmc-dl360gen10.dtb

Alphabetically, also in respect to other architectures, so before
CONFIG_ARCH_INTEGRATOR.

> diff --git a/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
> new file mode 100644
> index 000000000000..da5eac1213a8
> --- /dev/null
> +++ b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree file for HPE DL360Gen10
> + */
> +
> +/include/ "hpe-gxp.dtsi"
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "hpe,gxp";

Missing board compatible.

> +	model = "Hewlett Packard Enterprise ProLiant dl360 Gen10";
> +
> +	chosen {
> +		bootargs = "earlyprintk console=ttyS2,115200";

I have impression we talked about it...

> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x40000000 0x20000000>;
> +	};
> +
> +	ahb {

Why do you need empty node?

> +
> +	};
> +
> +};
> diff --git a/arch/arm/boot/dts/hpe-gxp.dtsi b/arch/arm/boot/dts/hpe-gxp.dtsi
> new file mode 100644
> index 000000000000..dfaf8df829fe
> --- /dev/null
> +++ b/arch/arm/boot/dts/hpe-gxp.dtsi
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree file for HPE GXP
> + */
> +
> +/dts-v1/;
> +/ {
> +	model = "Hewlett Packard Enterprise GXP BMC";
> +	compatible = "hpe,gxp";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "arm,cortex-a9";
> +			device_type = "cpu";
> +			reg = <0>;
> +		};
> +	};
> +
> +	gxp-init@cefe0010 {

Need a generic node name. gpx-init is specific.

> +		compatible = "hpe,gxp-cpu-init";
> +		reg = <0xcefe0010 0x04>;
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x40000000 0x20000000>;
> +	};
> +
> +	ahb {

By convention we call it soc.

> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		device_type = "soc";
> +		ranges;
> +
> +		vic0: interrupt-controller@ceff0000 {
> +			compatible = "arm,pl192-vic";
> +			interrupt-controller;
> +			reg = <0xceff0000 0x1000>;

Please put reg after compatible, everywhere.

> +			#interrupt-cells = <1>;
> +		};
> +
> +		vic1: interrupt-controller@80f00000 {
> +			compatible = "arm,pl192-vic";
> +			interrupt-controller;
> +			reg = <0x80f00000 0x1000>;
> +			#interrupt-cells = <1>;
> +		};
> +
> +		timer0: timer@c0000080 {
> +			compatible = "hpe,gxp-timer";
> +			reg = <0xc0000080 0x1>, <0xc0000094 0x01>, <0xc0000088 0x08>;
> +			interrupts = <0>;
> +			interrupt-parent = <&vic0>;
> +			clock-frequency = <400000000>;
> +		};
> +
> +		uarta: serial@c00000e0 {
> +			compatible = "ns16550a";
> +			reg = <0xc00000e0 0x8>;
> +			interrupts = <17>;
> +			interrupt-parent = <&vic0>;
> +			clock-frequency = <1846153>;
> +			reg-shift = <0>;
> +		};
> +
> +		uartb: serial@c00000e8 {
> +			compatible = "ns16550a";
> +			reg = <0xc00000e8 0x8>;
> +			interrupts = <18>;
> +			interrupt-parent = <&vic0>;
> +			clock-frequency = <1846153>;
> +			reg-shift = <0>;
> +		};
> +
> +		uartc: serial@c00000f0 {
> +			compatible = "ns16550a";
> +			reg = <0xc00000f0 0x8>;
> +			interrupts = <19>;
> +			interrupt-parent = <&vic0>;
> +			clock-frequency = <1846153>;
> +			reg-shift = <0>;
> +		};
> +
> +		usb0: usb@cefe0000 {
> +			compatible = "generic-ehci";

I think one of previous comments was that you cannot have "generic-ehci"
only, right?

> +			reg = <0xcefe0000 0x100>;
> +			interrupts = <7>;
> +			interrupt-parent = <&vic0>;
> +		};
> +
> +		usb1: usb@cefe0100 {
> +			compatible = "generic-ohci";
> +			reg = <0xcefe0100 0x110>;
> +			interrupts = <6>;
> +			interrupt-parent = <&vic0>;
> +		};
> +
> +		vrom@58000000 {
> +			compatible = "mtd-ram";
> +			bank-width = <4>;
> +			reg = <0x58000000 0x4000000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			partition@0 {
> +				label = "vrom-prime";
> +				reg = <0x0 0x2000000>;
> +			};
> +			partition@2000000 {
> +				label = "vrom-second";
> +				reg = <0x2000000 0x2000000>;
> +			};
> +		};
> +
> +		i2cg: syscon@c00000f8 {


> +			compatible = "simple-mfd", "syscon";
> +			reg = <0xc00000f8 0x08>;
> +		};
> +	};
> +
> +	clocks {
> +		osc: osc {

Keep node naming consistent, so just "clk"... but it's also very generic
comparing to others, so I wonder what is this clock?

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-output-names = "osc";
> +			clock-frequency = <33333333>;
> +		};
> +
> +		iopclk: iopclk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-output-names = "iopclk";
> +			clock-frequency = <400000000>;
> +		};
> +
> +		memclk: memclk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-output-names = "memclk";
> +			clock-frequency = <800000000>;
> +		};

What are these clocks? If external to the SoC, then where are they? On
the board?

> +	};
> +};


Best regards,
Krzysztof
