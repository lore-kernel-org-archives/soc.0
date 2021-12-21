Return-Path: <maz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5F4C433FE
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 15:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99669C36AEB; Tue, 21 Dec 2021 15:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDC7C36AE8;
	Tue, 21 Dec 2021 15:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640098937;
	bh=/hleQhtzfkgWMSSoNhz4Uly2Lw8FW08NlOPnuGsCgZQ=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=WxhtLKeT/7TMmTLWQFQmCyhv4i92xzAAtRsVlhTKmuJJlEy7UR0QQZj+DX0X1jcd2
	 FpDprUo3FtV+4TXg3ORJL93Q0Z8OCCJieInQauHCfaSIsuP9AEMv9R+2IwqWet0P37
	 J/VbXBdefTFNdrv9NTMpskWnqp4fNjriqU1dZd2BxNv3MX86cp+J8ICKT0udaZyzQ/
	 DkP0jlmHtOZhJn+xnrl1yRUr4aR0xm0wGo/e2jcs6Yv0zcC3Ul6CDJRmfbMWM2TdVH
	 mxU7VmVBhg4JO9lRJnIg7IX+71Y/7UmvHKeFDOQpMFUiuPNW+reyPORRgZetBq46cL
	 CtsVIhUFcwf5g==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <maz@kernel.org>)
	id 1mzgec-00DY5z-I6; Tue, 21 Dec 2021 15:02:15 +0000
MIME-Version: 1.0
Date: Tue, 21 Dec 2021 15:02:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, Rob Herring
 <robh+dt@kernel.org>, john@phrozen.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 03/14] ARM: dts: Add basic support for Airoha EN7523
In-Reply-To: <20211220211854.89452-4-nbd@nbd.name>
References: <20211220211854.89452-1-nbd@nbd.name>
 <20211220211854.89452-4-nbd@nbd.name>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <04137b5dd876899af0da15f7dbc159fc@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: nbd@nbd.name, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org, john@phrozen.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2021-12-20 21:18, Felix Fietkau wrote:
> From: John Crispin <john@phrozen.org>
> 
> Add basic support for Airoha EN7523, enough for booting to console.
> 
> The UART is basically 8250-compatible, except for the clock selection.
> A clock-frequency value is synthesized to get this to run at 115200 
> bps.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  arch/arm/boot/dts/Makefile       |   2 +
>  arch/arm/boot/dts/en7523-evb.dts |  27 ++++++++
>  arch/arm/boot/dts/en7523.dtsi    | 114 +++++++++++++++++++++++++++++++
>  3 files changed, 143 insertions(+)
>  create mode 100644 arch/arm/boot/dts/en7523-evb.dts
>  create mode 100644 arch/arm/boot/dts/en7523.dtsi
> 

[...]

> +	gic: interrupt-controller@9000000 {
> +		compatible = "arm,gic-v3";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x09000000 0x20000>, <0x09080000 0x80000>;

You are missing the 3 extra regions implemented by the A53 cores
(GICC, GICV, GICH). Please see the binding and the A53 TRM.

> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";

This is an ARMv8 CPU, even when used in 32bit mode.

> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +		clock-frequency = <25000000>;

Why isn't this properly configured by the firmware?

         M.
-- 
Jazz is not dead. It just smells funny...
