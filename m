Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C12EC3DA6F
	for <soc@archiver.kernel.org>; Thu, 24 Aug 2023 07:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59211C433C9; Thu, 24 Aug 2023 07:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A381C433C7;
	Thu, 24 Aug 2023 07:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692862665;
	bh=6FFMk5I78sIvySvAeuKmvMYzUXZZiP7PSAZFpSL+Sfo=;
	h=Date:Subject:List-Id:To:References:From:In-Reply-To:From;
	b=Zatazv5MzouVhtJgFZUh0jDwCR7cRWXIbvoauxp0l/8xDKR9Asp2eC+gEJwfnbeoc
	 AY9tSSAScRZojIKL4iPDxLk+/ye4OGX4pomgxUCkKatEHkZA7nDh/QnKgvXpo+jk15
	 kfoY5KRJTGuWHwbkPBdeQNjBWltYrk0W+pBz1sYzG4MDqcnRln2x37NbUTjzb6201Z
	 VrvoX+/F5gkK5C59lkaPnLCAYw73LJ5O2RhTd++KGPhb53bFaR80o6OISu0DjPPiuj
	 u90SNX6zt56f8eAr+5JZ+4k2Q5TVRwJ/b+hnQIeVT6vlnnoeNZYvDpk1KCzIjQVDc2
	 n4kpTO/xjuDTg==
Message-ID: <e78af5e2-3447-0418-8a19-c9c981894ac1@kernel.org>
Date: Thu, 24 Aug 2023 09:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/4] ARM: dts: turris-omnia: Add MCU system-controller
 node
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org
References: <20230823161012.6986-1-kabel@kernel.org>
 <20230823161012.6986-4-kabel@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230823161012.6986-4-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/08/2023 18:10, Marek Behún wrote:
> Turris Omnia's MCU provides various features that can be configured over
> I2C at address 0x2a. Add device-tree node.
> 
> Fixes: 26ca8b52d6e1 ("ARM: dts: add support for Turris Omnia")
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  .../dts/marvell/armada-385-turris-omnia.dts   | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> index 2d8d319bec83..761147f5870f 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> +++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> @@ -218,7 +218,24 @@ i2c@0 {
>  			#size-cells = <0>;
>  			reg = <0>;
>  
> -			/* STM32F0 command interface at address 0x2a */
> +			mcu: system-controller@2a {
> +				compatible = "cznic,turris-omnia-mcu";
> +				reg = <0x2a>;
> +
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&mcu_pins>;
> +
> +				interrupt-parent = <&gpio1>;
> +				interrupts = <11 IRQ_TYPE_NONE>;
> +
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +
> +				status = "okay";

Drop status.



Best regards,
Krzysztof

