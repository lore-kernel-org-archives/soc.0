Return-Path: <SRS0=0poK=LF=gmail.com=olteanv@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D905C48BE0
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 20:30:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BDA0B610F8; Fri, 11 Jun 2021 20:30:34 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92DC86128A;
	Fri, 11 Jun 2021 20:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92DC86128A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=olteanv@gmail.com
Received: by mail-ed1-f50.google.com with SMTP id d13so24992126edt.5;
        Fri, 11 Jun 2021 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qkN0AO/46OjWRT9PADiybil1jeYRgRfOTZb/+oZbXks=;
        b=pSsSHInu6XM//mfEujgy+dDYDIxO8g4iJ9E8Q3jKKmCnyF+79S4vuAkRhunEN/+cJg
         K/r0SY/VeX5w7/isFdpGncBNrMSv9f40E7xC/1sf4bQ9VZuWJjEjtd12CB44ysTJH74l
         SuKkVbPRhY0IsypL79Cgozv1PF8XSeeRwJyB/1w45ydojDRUcxGpsKlJYCMEI6SIKtI6
         X2yqgfjWHfNG4PINOdlI/2wDNZCGlrTBJcQtt8Wm3c0YPat72NB13WKSV/ZRqi/p6IAq
         o2Bm4m6erZUlYVX50wfTNmeeYfxyCScJqc3ZdLy9SE4HFpBii2W1jUvAXRAbqUz6d4ua
         1bLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qkN0AO/46OjWRT9PADiybil1jeYRgRfOTZb/+oZbXks=;
        b=jQ3MZ2pfhIcph3uvNVShb9SMIqJf/m5SXWdM//5clkQGRPDu29xeYmLZu9BO9LF1GY
         EN4S1eEb/xNxkQiWpctBHq/5oKmpz05/bnuE+wH7KHZiZW2h+jLPe7jdlurt3LdHlQPQ
         do6MeLAesnVXjGXA8DWpm6ScQwS+4sPypFSa5Xb20U2nrJuf0OdDvvwFW+ESY8gNDOle
         RgLTVMUh3c8/HR+vQ63co0ve3/MdNPMX/3ltO7fMXh/pcakxrGe5IEJk2XIcdSGcI9lc
         LFCZiD3ngDWvjDyEygpKsS9vw8wiOmdWdXaNKdLFkfadwbpPXEedx20I5M4QYMV/ml5p
         yjLA==
X-Gm-Message-State: AOAM532zUovjv4+k4m7gUz47Mm52KhMIah4kHcWVoNaksPVyUL924kqK
	L99fyGqVZuvavnVPaJdg8/0=
X-Google-Smtp-Source: ABdhPJyHl8voOpFgIlUqxxEy8/h8evFb+gmOEvLOPk278Vz2pxh81jcD5TYnggJ7g+hIVpH31rsVmA==
X-Received: by 2002:aa7:d648:: with SMTP id v8mr5286241edr.203.1623443433222;
        Fri, 11 Jun 2021 13:30:33 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
        by smtp.gmail.com with ESMTPSA id c13sm3022543edv.27.2021.06.11.13.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 13:30:32 -0700 (PDT)
Date: Fri, 11 Jun 2021 23:30:31 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Sam Ravnborg <sam@ravnborg.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] ARM: dts: NSP: Add common bindings for MX64/MX65
Message-ID: <20210611203031.fj3g32o7kgupgzjy@skbuf>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-4-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610232727.1383117-4-mnhagan88@gmail.com>

On Fri, Jun 11, 2021 at 12:27:15AM +0100, Matthew Hagan wrote:
> These bindings are required for all Meraki MX64/MX65 devices.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  .../dts/bcm958625-meraki-mx6x-common.dtsi     | 148 ++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
> 
> diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
> new file mode 100644
> index 000000000000..47a30dedf7b3
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Common Bindings for Cisco Meraki MX64 (Kingpin) and MX65 (Alamo) devices.
> + *
> + * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
> + */
> +
> +#include "bcm-nsp.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x60000000 0x80000000>;
> +	};
> +
> +	pwm-leds {
> +		compatible = "pwm-leds";
> +
> +		red {
> +			label = "red:led";
> +			pwms = <&pwm 1 50000>;
> +		};
> +
> +		green {
> +			label = "green:led";
> +			pwms = <&pwm 2 50000>;
> +		};
> +
> +		blue {
> +			label = "blue:led";
> +			pwms = <&pwm 3 50000>;
> +		};
> +	};
> +};
> +
> +&L2 {
> +	arm,io-coherent;
> +	prefetch-data = <1>;
> +	prefetch-instr = <1>;
> +};

It is common practice to sort labels alphabetically and nodes by unit address.

> +
> +&uart0 {
> +	clock-frequency = <62500000>;
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +	at24@50 {
> +		compatible = "atmel,24c64";
> +		pagesize = <32>;
> +		reg = <0x50>;
> +	};
> +};
> +
> +&amac2 {
> +	status = "okay";
> +};
> +
> +&nand {
> +	nandcs@0 {
> +		compatible = "brcm,nandcs";
> +		reg = <0>;
> +		nand-on-flash-bbt;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		nand-ecc-strength = <24>;
> +		nand-ecc-step-size = <1024>;
> +
> +		brcm,nand-oob-sector-size = <27>;
> +
> +		partition@0 {
> +			label = "u-boot";
> +			reg = <0x0 0x80000>;
> +			read-only;
> +		};
> +
> +		partition@80000 {
> +			label = "shmoo";
> +			reg = <0x80000 0x80000>;
> +			read-only;
> +		};
> +
> +		partition@100000 {
> +			label = "bootkernel1";
> +			reg = <0x100000 0x300000>;
> +		};
> +
> +		partition@400000 {
> +			label = "senao_nvram";
> +			reg = <0x400000 0x100000>;
> +		};
> +
> +		partition@500000 {
> +			label = "bootkernel2";
> +			reg = <0x500000 0x300000>;
> +		};
> +
> +		partition@800000 {
> +			label = "ubi";
> +			reg = <0x800000 0x3f700000>;
> +		};
> +	};
> +};
> +
> +&qspi {
> +	status = "disabled";
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&pwm {
> +	status = "okay";
> +	#pwm-cells = <2>;

What is the reason for overriding this to 2?

> +	chan0 {
> +		channel = <1>;
> +		active_low = <1>;
> +		};

Bad indentation for this bracket.

> +	chan1 {
> +		channel = <2>;
> +		active_low = <1>;
> +	};
> +	chan2 {
> +		channel = <3>;
> +		active_low = <1>;
> +	};
> +};
> +
> +&ccbtimer1 {
> +	status = "disabled";
> +};
> +
> +&sata_phy {
> +	status = "disabled";
> +};

It is common practice to disable these in the common SoC dtsi and let
individual boards enable them as necessary, instead of the opposite.

> -- 
> 2.26.3
> 

