Return-Path: <SRS0=WedL=ME=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D620DC07E99
	for <soc@archiver.kernel.org>; Mon, 12 Jul 2021 20:11:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9D04961245; Mon, 12 Jul 2021 20:11:29 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71B8A611F1
	for <soc@kernel.org>; Mon, 12 Jul 2021 20:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71B8A611F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-io1-f42.google.com with SMTP id l18so19275516iow.4
        for <soc@kernel.org>; Mon, 12 Jul 2021 13:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8vx4roC1t44uRDMKvtWy4G2yQadZ8UNHNbyeeJaYsn8=;
        b=fDlFhdFAZYFg4b4tWB+Y6sjByV8mh+u+r2vgVTMKq+q+rHsJdjfM7mWHYN2MkRID3f
         +sHrjD33Q3SHsv0cfbSFao2xUqgjM+CZGVkmM1QlIP/LJYZHrISULmuxZVcmtq2nXLFB
         2vtQZoVk0dE2uKzI4qn7D8CcOSUytv2aQSr393D3jfq/6AKuxqTgCPetKBRu8hmaste7
         ZlOiLInfF3JlCB8aHGFrV4eX8OEI2kN/bGnd6sGjNpsBcrjdyiQICwA3TUfgoHzQ1FH0
         ZCrqL8WhcSqdBYOjdPr+jOW1WAq0nIn5HeUFdcBETmebnmXeVX3sZm31Js0mbfOHkBbt
         83wg==
X-Gm-Message-State: AOAM531QAW0uz53YUavI6nodu5gFx6nkqfjaq1NNvjXmzpuo5KOxVPJ7
	HiPfFYHVA9e1HlcYYNogMQ==
X-Google-Smtp-Source: ABdhPJzP9Tl9BuIS+smxRdFk4eVQWlMsI8BnrQqgRg+s0VguhaQEmbN+761bl/F8klabtu8ZkVtT5Q==
X-Received: by 2002:a02:6946:: with SMTP id e67mr674179jac.4.1626120688898;
        Mon, 12 Jul 2021 13:11:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m20sm2261259ioc.39.2021.07.12.13.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:11:28 -0700 (PDT)
Received: (nullmailer pid 2407738 invoked by uid 1000);
	Mon, 12 Jul 2021 20:11:25 -0000
Date: Mon, 12 Jul 2021 14:11:25 -0600
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net, soc@kernel.org, ulli.kroll@googlemail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] ARM: gemini: add device tree for ssi1328
Message-ID: <20210712201125.GA2401230@robh.at.kernel.org>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
 <20210618205533.1527384-6-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618205533.1527384-6-clabbe@baylibre.com>

On Fri, Jun 18, 2021 at 08:55:33PM +0000, Corentin Labbe wrote:
> The SSI 1328 is a NAS box running a SL3516 SoC.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  arch/arm/boot/dts/Makefile           |   1 +
>  arch/arm/boot/dts/gemini-ssi1328.dts | 138 +++++++++++++++++++++++++++
>  2 files changed, 139 insertions(+)
>  create mode 100644 arch/arm/boot/dts/gemini-ssi1328.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 806715f3266d..49bf7af72111 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -221,6 +221,7 @@ dtb-$(CONFIG_ARCH_GEMINI) += \
>  	gemini-rut1xx.dtb \
>  	gemini-sl93512r.dtb \
>  	gemini-sq201.dtb \
> +	gemini-ssi1328.dtb \
>  	gemini-wbd111.dtb \
>  	gemini-wbd222.dtb
>  dtb-$(CONFIG_ARCH_HI3xxx) += \
> diff --git a/arch/arm/boot/dts/gemini-ssi1328.dts b/arch/arm/boot/dts/gemini-ssi1328.dts
> new file mode 100644
> index 000000000000..2b3e7db84fed
> --- /dev/null
> +++ b/arch/arm/boot/dts/gemini-ssi1328.dts
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: GPL-2.0

Dual license? No one runs BSD or other OS on these devices?

> +/*
> + * Copyright (C) 2021 Corentin Labbe <clabbe@baylibre.com>
> + * Device Tree file for SSI 1328
> + */
> +
> +/dts-v1/;
> +
> +#include "gemini.dtsi"

Though the license should match this file.

> +
> +/ {
> +	model = "SSI 1328";
> +	compatible = "ssi,1328", "cortina,gemini";

Where's ssi,1328 documented?

> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	memory@0 {
> +		/* 128 MB */
> +		device_type = "memory";
> +		reg = <0x00000000 0x8000000>;
> +	};
> +
> +	aliases {
> +		mdio-gpio0 = &mdio0;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS0,19200n8 initrd=0x900000,9M";
> +		stdout-path = &uart0;

Don't need both 'console' and stdout-path. (console should be removed)

> +	};
> +
> +	mdio0: mdio {
> +		compatible = "virtual,mdio-gpio";
> +		gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>, /* MDC */
> +			<&gpio0 21 GPIO_ACTIVE_HIGH>; /* MDIO */
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* LAN Marvell 88E1118 */
> +		phy0: ethernet-phy@1 {
> +			reg = <1>;
> +			device_type = "ethernet-phy";
> +			/* We lack the knowledge of necessary GPIO to achieve
> +			 * Gigabit
> +			 */
> +			max-speed = <100>;
> +		};
> +		/* WAN ICPlus IP101A */
> +		phy1: ethernet-phy@2 {
> +			reg = <2>;
> +			device_type = "ethernet-phy";
> +		};
> +	};
> +};
> +
> +&ethernet {
> +	status = "okay";
> +	ethernet-port@0 {
> +		phy-mode = "rgmii";
> +		phy-handle = <&phy0>;
> +	};
> +	ethernet-port@1 {
> +		phy-mode = "rgmii";
> +		phy-handle = <&phy1>;
> +	};
> +};
> +
> +&flash {
> +	status = "okay";
> +	/* 32MB of flash */
> +	reg = <0x30000000 0x03200000>;
> +
> +	pinctrl-names = "enabled", "disabled";
> +	pinctrl-0 = <&pflash_default_pins>;
> +	pinctrl-1 = <&pflash_disabled_pins>;
> +
> +	partitions {
> +		compatible = "redboot-fis";
> +		/* Eraseblock at 0xfe0000 */
> +		fis-index-block = <0x7F>;
> +	};
> +};
> +
> +&gpio0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpio0_default_pins>;
> +};
> +
> +&ide0 {
> +	status = "okay";
> +};
> +
> +&ide1 {
> +	status = "okay";
> +};
> +
> +&sata {
> +	cortina,gemini-ata-muxmode = <0>;
> +	cortina,gemini-enable-sata-bridge;
> +	status = "okay";
> +};
> +
> +&syscon {
> +	pinctrl {
> +		/*
> +		 * gpio0agrp cover line 0-4
> +		 * gpio0bgrp cover line 5
> +		 */
> +		gpio0_default_pins: pinctrl-gpio0 {
> +			mux {
> +				function = "gpio0";
> +				groups = "gpio0agrp", "gpio0bgrp";
> +			};
> +		};
> +		pflash_disabled_pins: pinctrl-pflash-disabled {
> +			mux {
> +				function = "gpio0";
> +				groups = "gpio0ggrp", "gpio0igrp", "gpio0jgrp",
> +					 "gpio0kgrp";
> +			};
> +		};
> +		pinctrl-gmii {
> +			/* This platform use both the ethernet ports */
> +			mux {
> +				function = "gmii";
> +				groups = "gmii_gmac0_grp", "gmii_gmac1_grp";
> +			};
> +		};
> +	};
> +};
> +
> +&usb0 {
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	status = "okay";
> +};
> -- 
> 2.31.1
> 
> 
