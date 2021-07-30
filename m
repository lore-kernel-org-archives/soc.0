Return-Path: <SRS0=Yfz5=MW=arm.com=mark.rutland@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D245EC4338F
	for <soc@archiver.kernel.org>; Fri, 30 Jul 2021 14:59:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A0B2E604D7; Fri, 30 Jul 2021 14:59:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 3AEC660F46;
	Fri, 30 Jul 2021 14:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AEC660F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1A441063;
	Fri, 30 Jul 2021 07:59:06 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.13.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 464EF3F66F;
	Fri, 30 Jul 2021 07:59:04 -0700 (PDT)
Date: Fri, 30 Jul 2021 15:59:01 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>,
	Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
Message-ID: <20210730145901.GC19569@C02TD0UTHF1T.local>
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730134552.853350-4-bert@biot.com>

On Fri, Jul 30, 2021 at 03:45:50PM +0200, Bert Vermeulen wrote:
> From: John Crispin <john@phrozen.org>
> 
> Add basic support for EcoNet EN7523, enough for booting to console.
> 
> The UART is basically 8250-compatible, except for the clock selection.
> A clock-frequency value is synthesized to get this to run at 115200 bps.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> ---
>  arch/arm/boot/dts/Makefile       |   2 +
>  arch/arm/boot/dts/en7523-evb.dts |  17 ++++
>  arch/arm/boot/dts/en7523.dtsi    | 128 +++++++++++++++++++++++++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 arch/arm/boot/dts/en7523-evb.dts
>  create mode 100644 arch/arm/boot/dts/en7523.dtsi
> 

> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;

> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			clock-frequency = <80000000>;
> +			next-level-cache = <&L2_0>;
> +
> +		};

> +	gic: interrupt-controller@09000000 {
> +		compatible = "arm,gic-v3";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x09000000 0x20000>,
> +			  <0x09080000 0x80000>;
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +
> +		its: gic-its@09020000 {
> +			compatible = "arm,gic-v3-its";
> +			msi-controller;
> +			#msi-cell = <1>;

Missing 's' here for '#msi-cells'.

> +			reg = <0x090200000 0x20000>;
> +		};
> +	};

Looking at this again, I was under the impression that Cortex-A7 only
supported GICv2; is this actually a Cortex-A7 or a different CPU?

Which revision is this?

Thanks,
Mark.
