Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C596C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 11:05:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E474A64E27
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 11:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E474A64E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ct6w/owxWIcLdht4W9bZkuqxoNhs8dATEj73UQVZ3Rg=; b=EAN+dFatfOGHmnHGqlE08NRGu
	c8kotFbrY0ZYPuxm6YzsDuKoDSzst0VJXPYelKX7Sd0MChpxsRMqHFEEKvRpnALB5Rmx5OFIKH4j0
	gxCe3rh7BrWlJnWnL3DrcPfYQMUCtn/8ENMBcd+xbFrzy6ZBKVDNnPIRnehUB1kEn9xfT7lOzgs0i
	ssUhPtUEq6tlS2OVNMGRJEfEOhcO7qFDzVc1MkhmRO9u5LCoBjCr9cXMOehEfINfKOJsWDvOcclhN
	MJpwFc4vVud0+mpC/dXqmlpH4hvvQEi67FZhZsD9mUr9KQhq5k0VS03nWV/y7beSMY8FLKsX1j5nZ
	zItp2geeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l94LZ-0003lj-9K; Mon, 08 Feb 2021 11:04:49 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l94LV-0003k9-1G
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 11:04:47 +0000
Received: by mail-ed1-f50.google.com with SMTP id q2so14406562eds.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 03:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZnXtuKDtjfCK+Wau43axfzEHC52NhOuAsUoAI9Jo0T4=;
 b=koOhUUBIL1zqQjD70FOtwveIoXnzNtIvfvJQ9KVgcLhGuW0BWN63m9dPBgsXQ4LVTK
 Fi9PqCEKsrFEaCbYZiKrjC3PZTJdeFShvOLXgqE+9RQcZFBekERw+hMlATa5teU+6DC+
 pPexZijZxBGB/kalUjXAcZRFN6zATUqfqTNd7582jmSwirisdaMNqnge5542jUWjJBOu
 0eTSSmqSDVQKCd63Kfk/7Ga+VARCrCIN69M17xqW+/kVpfo9srzBHvKeG2HvJ7Kzizay
 BIUJ6mMN6F8takdnv8SK3G1re1mm6D2fz4fc4KlcjuF1A+UWf5E6z4XGLPMxIztJn77H
 pKZw==
X-Gm-Message-State: AOAM533S1oPANgxDfAv1LgIgcVGJaUJzEj8M/0UwAsqBfvXcOsLrU+tw
 QV3AUD3zzIRkc77n8s4JROU=
X-Google-Smtp-Source: ABdhPJyTpLeaD+lc+pF/9E0BTCIWBbMdXbaxi0/0fqwRf5MYHywFNGGihVKmvcrpNDgjFNZ32RWqjw==
X-Received: by 2002:a50:bf42:: with SMTP id g2mr16650172edk.101.1612782283762; 
 Mon, 08 Feb 2021 03:04:43 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id lc11sm3180759ejc.95.2021.02.08.03.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 03:04:42 -0800 (PST)
Date: Mon, 8 Feb 2021 12:04:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <20210208110441.25qc6yken4effd6c@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204203951.52105-19-marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_060445_155124_C2BAF0F2 
X-CRM114-Status: GOOD (  25.29  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208110441.14lyarfo9N2dFjUdfKM6qlp2ywweMDruZ_qUMLsb9wU@z>

On Fri, Feb 05, 2021 at 05:39:51AM +0900, Hector Martin wrote:
> This currently supports:
> 
> * SMP (via spin-tables)
> * AIC IRQs
> * Serial (with earlycon)
> * Framebuffer
> 
> A number of properties are dynamic, and based on system firmware
> decisions that vary from version to version. These are expected
> to be filled in by the loader.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  MAINTAINERS                              |   1 +
>  arch/arm64/boot/dts/Makefile             |   1 +
>  arch/arm64/boot/dts/apple/Makefile       |   2 +
>  arch/arm64/boot/dts/apple/apple-j274.dts | 143 +++++++++++++++++++++++
>  4 files changed, 147 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/Makefile
>  create mode 100644 arch/arm64/boot/dts/apple/apple-j274.dts
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a54ee5747d3..5481b5bc2ef7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1635,6 +1635,7 @@ C:	irc://chat.freenode.net/asahi-dev
>  T:	git https://github.com/AsahiLinux/linux.git
>  F:	Documentation/devicetree/bindings/arm/AAPL.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml
> +F:	arch/arm64/boot/dts/AAPL/

apple

Don't make things different for this one platform (comparing to all
other platforms). Apple is not that special. :)

>  F:	drivers/irqchip/irq-apple-aic.c
>  F:	include/dt-bindings/interrupt-controller/apple-aic.h
>  
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 9b1170658d60..64f055d94948 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -6,6 +6,7 @@ subdir-y += amazon
>  subdir-y += amd
>  subdir-y += amlogic
>  subdir-y += apm
> +subdir-y += apple
>  subdir-y += arm
>  subdir-y += bitmain
>  subdir-y += broadcom
> diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
> new file mode 100644
> index 000000000000..ec03c474efd4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_APPLE) += apple-j274.dtb
> diff --git a/arch/arm64/boot/dts/apple/apple-j274.dts b/arch/arm64/boot/dts/apple/apple-j274.dts
> new file mode 100644
> index 000000000000..238a1bcee066
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/apple-j274.dts
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2021 Hector Martin <marcan@marcan.st>

A lot here might be difficult to reverse-egineer or figure out by
ourself, so usually people rely on vendor sources (the open source
compliance package). Didn't you receive such for the iOS (or whatever
was on your Mac)?

> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/interrupt-controller/apple-aic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "Apple Mac Mini M1 2020";
> +	compatible = "AAPL,j274", "AAPL,m1", "AAPL,arm-platform";

I guess Rob will comment on the dt-bindings more... but for me a generic
"arm-platform" is too generic. What's the point of it? I didn't see any
of such generic compatibles in other platforms.

> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		bootargs = "earlycon";

This should not be hard-coded in DTS. Pass it from bootloader.

> +		stdout-path = "serial0:1500000";

Use aliases.

> +
> +		framebuffer0: framebuffer@0 {
> +			compatible = "AAPL,simple-framebuffer", "simple-framebuffer";
> +			reg = <0 0 0 0>; // To be filled by loader
> +			// Format properties will be added by loader

Use /* style of comments

> +			status = "disabled";
> +		};
> +	};
> +
> +	memory@800000000 {
> +		device_type = "memory";
> +		reg = <0 0 0 0>; // To be filled by loader
> +	};
> +
> +	aliases {
> +		serial0 = &serial0;
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "AAPL,icestorm";
> +			device_type = "cpu";
> +			reg = <0x0 0x0>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; // To be filled by loader
> +		};
> +		cpu1: cpu@1 {
> +			compatible = "AAPL,icestorm";
> +			device_type = "cpu";
> +			reg = <0x0 0x1>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; // To be filled by loader
> +		};
> +		cpu2: cpu@2 {
> +			compatible = "AAPL,icestorm";
> +			device_type = "cpu";
> +			reg = <0x0 0x2>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; // To be filled by loader
> +		};
> +		cpu3: cpu@3 {
> +			compatible = "AAPL,icestorm";
> +			device_type = "cpu";
> +			reg = <0x0 0x3>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; // To be filled by loader
> +		};
> +		cpu4: cpu@10100 {
> +			compatible = "AAPL,firestorm";
> +			device_type = "cpu";
> +			reg = <0x0 0x10100>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; // To be filled by loader
> +		};
> +		cpu5: cpu@10101 {
> +			compatible = "AAPL,firestorm";
> +			device_type = "cpu";
> +			reg = <0x0 0x10101>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; // To be filled by loader
> +		};
> +		cpu6: cpu@10102 {
> +			compatible = "AAPL,firestorm";
> +			device_type = "cpu";
> +			reg = <0x0 0x10102>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; // To be filled by loader
> +		};
> +		cpu7: cpu@10103 {
> +			compatible = "AAPL,firestorm";
> +			device_type = "cpu";
> +			reg = <0x0 0x10103>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; // To be filled by loader
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_FIQ 1 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	clk24: clk24 {

Just "clock". Node names should be generic.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "clk24";

What clock is it? Part of board or SoC? Isn't it a work-around for
missing clock drivers?

> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		aic: interrupt-controller@23b100000 {
> +			compatible = "AAPL,m1-aic", "AAPL,aic";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0x2 0x3b100000 0x0 0x8000>;
> +		};
> +
> +		serial0: serial@235200000 {
> +			compatible = "AAPL,s5l-uart";
> +			reg = <0x2 0x35200000 0x0 0x1000>;
> +			reg-io-width = <4>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 605 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk24>, <&clk24>;
> +			clock-names = "uart", "clk_uart_baud0";
> +		};
> +

No blank lines at end of blocks.

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
