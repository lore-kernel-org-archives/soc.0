Return-Path: <SRS0=tp4w=L7=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38418C4345F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 16:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0722FC116B1; Fri, 26 Apr 2024 16:02:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A69BDC2BD10;
	Fri, 26 Apr 2024 16:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A69BDC2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BD90FF806;
	Fri, 26 Apr 2024 16:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714147348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uq9yi5NKN6ArvsQFbKMTgwcBlOAftfJTuKRqxMbmRy0=;
	b=YFJOE3e0oW6T2PvJ5xTbz7jmBKsuXcJbwuI+khZCbaGq9TaivdWzFofrcrcpu0HfktLUgb
	2/yLw2wlPDrjlfaSinzEiISC0Chm9T5bvmO14AaRgzXcJk/ZcXeJVSdrasKoKAbcqHwPdG
	XAQFPl2kZkSgiy80ONio/N/8FreAKWyh8a+n0DG5kpyDX+D3vs0Omh2Y20MSg5+R9UssLx
	o2kjf8Zy+w/VZ07dgQ3LeSzVv4NlWUWJRCRNWLKkU6cxSZ8C56PNs9ieKz2ZBmTQ3hh4pJ
	dcr5dfnkcYMm+2G4ioFqF/KSXxHVFTWboDoYwDTyMW8sSM5SZPEppKBw9rJfCw==
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
Subject: Re: [PATCH v7 9/9] ARM: dts: turris-omnia: Add GPIO key node for
 front button
In-Reply-To: <20240424173809.7214-10-kabel@kernel.org>
References: <20240424173809.7214-1-kabel@kernel.org>
 <20240424173809.7214-10-kabel@kernel.org>
Date: Fri, 26 Apr 2024 18:02:26 +0200
Message-ID: <878r105cz1.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Marek,

> Now that we have the MCU device-tree node, which acts as a GPIO
> controller, add GPIO key node for the front button.
>
> Fixes: 26ca8b52d6e1 ("ARM: dts: add support for Turris Omnia")

Same as previous patch is it really a fix ?

Gregory

> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
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
> 2.43.2
