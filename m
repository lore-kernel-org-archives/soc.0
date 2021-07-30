Return-Path: <SRS0=BD2L=MW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12B2C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 16:49:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DBBB60720
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 16:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DBBB60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlwPr5viainibwjjS9E9vZjf8ZIB3GI5wuKIyIsRagU=; b=dDkTijktZvusW3
	P5r4Qxz7E+ys5gIg5r+XlzVG0BoMDxt0nIA/UuOVTyM4T+TXbIf46oMt/Mnk+YcV4rFe4GxOpI+TC
	NHNIjCUzYRAWsGLkivGl9Rmr8wwSpRdQoHF/qLxB1/Y132jV9gKBpyyrw3ZVXzBew0HQZbYQPZIus
	fw3hpr/sdNOu7sazx6cuLABICtESShgd8N9EfZQZeFKS60/qOEATgzD+9B89qyunWRfh22WASoGQg
	VL9v6lB0gqoIT0XzUzEpyophBu1Fr0n3hBtNKL8riXr8QY+OFfFwuBmH61oHXn7zautS96m054wqu
	xnqHrCNKbWS1fgnfBq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Vfw-009Y5C-D4; Fri, 30 Jul 2021 16:47:56 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Vfr-009Y4P-Ts
 for linux-arm-kernel@lists.infradead.org; Fri, 30 Jul 2021 16:47:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE53F113E;
 Fri, 30 Jul 2021 09:47:49 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35DB03F66F;
 Fri, 30 Jul 2021 09:47:48 -0700 (PDT)
Date: Fri, 30 Jul 2021 17:47:04 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Rob Herring
 <robh+dt@kernel.org>, John Crispin <john@phrozen.org>, Felix Fietkau
 <nbd@nbd.name>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
Message-ID: <20210730174704.48c9a94f@slackpad.fritz.box>
In-Reply-To: <20210730134552.853350-4-bert@biot.com>
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_094752_159131_D846F140 
X-CRM114-Status: GOOD (  21.30  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210730164704.-oNOnCxAKG3zD3MbhccN4LBuZ_6XEwpcMrvPfCYbZkc@z>

On Fri, 30 Jul 2021 15:45:50 +0200
Bert Vermeulen <bert@biot.com> wrote:

Hi,

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
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 863347b6b65e..3eeb7715c6ce 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -174,6 +174,8 @@ dtb-$(CONFIG_ARCH_DAVINCI) += \
>  	da850-lego-ev3.dtb
>  dtb-$(CONFIG_ARCH_DIGICOLOR) += \
>  	cx92755_equinox.dtb
> +dtb-$(CONFIG_ARCH_ECONET) += \
> +	en7523-evb.dtb
>  dtb-$(CONFIG_ARCH_EXYNOS3) += \
>  	exynos3250-artik5-eval.dtb \
>  	exynos3250-monk.dtb \
> diff --git a/arch/arm/boot/dts/en7523-evb.dts b/arch/arm/boot/dts/en7523-evb.dts
> new file mode 100644
> index 000000000000..c5b75eb3715e
> --- /dev/null
> +++ b/arch/arm/boot/dts/en7523-evb.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +#include "en7523.dtsi"
> +
> +/ {
> +	model = "Econet EN7523 Evaluation Board";
> +	compatible = "econet,en7523-evb", "econet,en7523";
> +
> +	aliases {
> +		serial0 = &uart1;
> +	};
> +
> +	chosen {
> +		bootargs = "earlycon=uart8250,mmio32,0x1fbf0000 console=ttyS0,115200";
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
> new file mode 100644
> index 000000000000..f4fe1c6f66e8
> --- /dev/null
> +++ b/arch/arm/boot/dts/en7523.dtsi
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		npu_binary@84000000 {
> +			no-map;
> +			reg = <0x84000000 0xA00000>;
> +		};
> +
> +		npu_flag@84B0000 {
> +			no-map;
> +			reg = <0x84B00000 0x100000>;
> +		};
> +
> +		npu_pkt@85000000 {
> +			no-map;
> +			reg = <0x85000000 0x1A00000>;
> +		};
> +
> +		npu_phyaddr@86B00000 {
> +			no-map;
> +			reg = <0x86B00000 0x100000>;
> +		};
> +
> +		npu_rxdesc@86D00000 {
> +			no-map;
> +			reg = <0x86D00000 0x100000>;
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
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
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			clock-frequency = <80000000>;
> +			next-level-cache = <&L2_0>;
> +
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x1>;
> +			enable-method = "psci";
> +			clock-frequency = <80000000>;
> +			next-level-cache = <&L2_0>;
> +		};
> +
> +		L2_0: l2-cache0 {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	gic: interrupt-controller@09000000 {

Please no leading zeros behind the '@', dtc should warn about this.

> +		compatible = "arm,gic-v3";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x09000000 0x20000>,

Mmh, 128K for the distributor, is that actually right? Is that to cover
some GIC-500 MBI aliases? I don't think we announce this in the DT,
though?

> +			  <0x09080000 0x80000>;

So this offset and length suggests there are four cores? Is that a
mistake or are there two more cores, that are possibly hidden? 

> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +
> +		its: gic-its@09020000 {

Another leading zero.

Cheers,
Andre


> +			compatible = "arm,gic-v3-its";
> +			msi-controller;
> +			#msi-cell = <1>;
> +			reg = <0x090200000 0x20000>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <25000000>;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	uart1: serial@1fbf0000 {
> +		compatible = "ns8250";
> +		reg = <0x1fbf0000 0x30>;
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +		clock-frequency = <1843200>;
> +		status = "okay";
> +	};
> +};


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
