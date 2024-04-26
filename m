Return-Path: <SRS0=tp4w=L7=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E7EC4345F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 16:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF226C4AF0E; Fri, 26 Apr 2024 16:01:32 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F148C32786;
	Fri, 26 Apr 2024 16:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F148C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0137B4000A;
	Fri, 26 Apr 2024 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714147281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jGAYTrF9PeV11woLuWXWEtsmjNv/+HmvXLGuWJGSei4=;
	b=h6q28Q0IU1HbasoIYl1HOB5LAw17MwEfESPRg/PB1SZVZR6nige5l/syys66cPpJ+sn7ZR
	QpeH8GrAJnOG+JZwtdfpFXIx+GzIxtbJVL2yC0RvIIOj+V9LHafwc6z3i1QlJHu9B2aQvw
	ILab5k1+soOXPzs3o/IapePP1SRliB4Yt/FGIoLHFJeJoBVu5Dxlbglj4tbnkcJq0sVG6s
	sC31UxC4pgk2HQac2fzN85fxXEQ5ueMx/NRx92bsJmj+AoMhvy3w5GSblXj4RKYVF4XZpr
	8PvSSPHaWS8OwFgtPQcfGz51kIN2Z8LsLQLs1ZheVM/JNcTXq6qW3ntG06LY1w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>,
 soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de
 Goede <hdegoede@redhat.com>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <uwe@kleine-koenig.org>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v7 8/9] ARM: dts: turris-omnia: Add MCU
 system-controller node
In-Reply-To: <20240424173809.7214-9-kabel@kernel.org>
References: <20240424173809.7214-1-kabel@kernel.org>
 <20240424173809.7214-9-kabel@kernel.org>
Date: Fri, 26 Apr 2024 18:01:20 +0200
Message-ID: <87bk5w5d0v.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Marek,

> Turris Omnia's MCU provides various features that can be configured over
> I2C at address 0x2a. Add device-tree node.
>
> Fixes: 26ca8b52d6e1 ("ARM: dts: add support for Turris Omnia")

Is it really a fix ?

It seems that the node you add depends on the firmware support that was
not yet added.

Gregory

> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
>  .../dts/marvell/armada-385-turris-omnia.dts   | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch=
/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> index 7b755bb4e4e7..59079d63fe27 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> +++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> @@ -218,7 +218,22 @@ i2c@0 {
>  			#size-cells =3D <0>;
>  			reg =3D <0>;
>=20=20
> -			/* STM32F0 command interface at address 0x2a */
> +			mcu: system-controller@2a {
> +				compatible =3D "cznic,turris-omnia-mcu";
> +				reg =3D <0x2a>;
> +
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&mcu_pins>;
> +
> +				interrupt-parent =3D <&gpio1>;
> +				interrupts =3D <11 IRQ_TYPE_NONE>;
> +
> +				gpio-controller;
> +				#gpio-cells =3D <3>;
> +
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +			};
>=20=20
>  			led-controller@2b {
>  				compatible =3D "cznic,turris-omnia-leds";
> @@ -501,6 +516,11 @@ fixed-link {
>  };
>=20=20
>  &pinctrl {
> +	mcu_pins: mcu-pins {
> +		marvell,pins =3D "mpp43";
> +		marvell,function =3D "gpio";
> +	};
> +
>  	pcawan_pins: pcawan-pins {
>  		marvell,pins =3D "mpp46";
>  		marvell,function =3D "gpio";
> --=20
> 2.43.2
