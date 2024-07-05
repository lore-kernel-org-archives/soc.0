Return-Path: <SRS0=IP8z=OF=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FFDC30658
	for <soc@archiver.kernel.org>; Fri,  5 Jul 2024 12:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F182C4AF0B; Fri,  5 Jul 2024 12:46:29 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C56DC116B1;
	Fri,  5 Jul 2024 12:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C56DC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59334C0005;
	Fri,  5 Jul 2024 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720183580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Kj1eSZAKDwhk5vAXRl97uoZ1Sujr2CBBYFjFpgU8/A=;
	b=RLdlFXBcMRAxP1TiU23Cj/PfqhnwgiMMeW56JcIewnO4hNHI3QTWP7+MMlprmIZQUSXXa7
	WGPsg2RaqpymqUDtEFyNpggh/ES9OB1g7QS9KHXyZckOyM7X7Q+3rDxyIa1w4cXTvVJFlu
	cW5UZSCDFAivUT7UdQ3zUjqKTWa2xBq5KJy5p5GcTBIdCEmREf3x1fwP7IQjhpsq5yRTna
	++5a/fDwcZZDi0oV6twzbFaHX/puOaO0Vz1yj54pYce0wJb00NKxsmpojBJ3VqDKDgFkbh
	HRgxD6zzB6ui1My8hCNanGSSZVwiWKMuvDPfX+TXR+oBAFe4aBVDHuLMWJTK0Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>,
 soc@kernel.org
Cc: arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <uwe@kleine-koenig.org>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v13 8/8] ARM: dts: turris-omnia: Add GPIO key node for
 front button
In-Reply-To: <20240701113010.16447-9-kabel@kernel.org>
References: <20240701113010.16447-1-kabel@kernel.org>
 <20240701113010.16447-9-kabel@kernel.org>
Date: Fri, 05 Jul 2024 14:46:19 +0200
Message-ID: <87cynsj9b8.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Marek Beh=C3=BAn <kabel@kernel.org> writes:

> Now that we have the MCU device-tree node, which acts as a GPIO
> controller, add GPIO key node for the front button.
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  .../boot/dts/marvell/armada-385-turris-omnia.dts    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch=
/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> index 59079d63fe27..43202890c959 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> +++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> @@ -112,6 +112,19 @@ sfp: sfp {
>  		status =3D "disabled";
>  	};
>=20=20
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		front-button {
> +			label =3D "Front Button";
> +			linux,code =3D <KEY_VENDOR>;
> +			linux,can-disable;
> +			gpios =3D <&mcu 0 12 GPIO_ACTIVE_HIGH>;
> +			/* debouncing is done by the microcontroller */
> +			debounce-interval =3D <0>;
> +		};
> +	};
> +
>  	sound {
>  		compatible =3D "simple-audio-card";
>  		simple-audio-card,name =3D "SPDIF";
> --=20
> 2.44.2
