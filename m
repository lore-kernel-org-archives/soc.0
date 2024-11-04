Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B47208A7
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730736170; cv=none; b=dtOSbfHAT4glmPJACm73tfrett2/cMXoY8yvy2AfKAoq44nFovtawWEj2fIj+tDEORw+h2qt7RDK9al2oomN/DMGCxnwh6T22nhs6iXmTARZUsOFqX9zedyXGGSeFX3I7c2yZTar/U/BLbLqTHeznPoI2I5MJVn0DvQvqN8JR68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730736170; c=relaxed/simple;
	bh=IMPSXRSZHiSKChDLZSD/EL+GNcEzzjv6djemSat7PcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=altEw0moSQEIb/9SruWb2F7ztZ8vpQ9/ha4JedobSr26CzaBUqlu72Ws3ZnvQD9vqF9KYx1KoLv8MkrBUIC5683/baP4JhNiVCRNPZ1k1u/P3ljkZ8k+ciPa8xzeJuHroB4gRLpxFkxFc2Lo/9lojAZuCBM+TQ5x7JHY93kB/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V7BFKuQF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V7BFKuQF"
Received: by smtp.kernel.org (Postfix)
	id 0AECDC4CEDD; Mon,  4 Nov 2024 16:02:50 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CD8DC4CECE;
	Mon,  4 Nov 2024 16:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5CD8DC4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A61B1BF212;
	Mon,  4 Nov 2024 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730736165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVW8Eovr8XM+Wk5SgrmMG++7+hvu3mp1NJ851HHAgbQ=;
	b=V7BFKuQFb19JUly9CiSwu5oht+6XImDThA72JhlABUx3krc0uXVJxEb2TOwzR6GCPLzJT8
	0kf1fHR24ed1AhbpdyDhYhxVsPX5M6NDxqSKHgoqkUx5AnKbrcbWz8U4zcdmqZMhOeS/sY
	NWX0RpKkkxQO3oU4hGuWFeKFT4QvARW9oXmCBExe0eADehf2mqWiW5UbGCOXXJJq3M2teu
	PfWQCpS3CfHi/JsYe1abKbJMtghDsGoPCmwtmBI5l7j3PmeDaotqC+fx160Z9PsrcnDUvv
	pdSn1GPBPIYG25qk4IQrfGuZywH4sn+L8QIhbyBvcfszlDSTMyRz4TsLD3grXw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Lee Jones
 <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?Q?J?=
 =?utf-8?Q?=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Marek
 =?utf-8?Q?Beh=C3=BAn?=
 <kabel@kernel.org>
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
In-Reply-To: <20241104141924.18816-13-kabel@kernel.org>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-13-kabel@kernel.org>
Date: Mon, 04 Nov 2024 17:02:44 +0100
Message-ID: <87bjyv9ecb.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Marek Beh=C3=BAn <kabel@kernel.org> writes:

> When global LED brightness is changed by pressing the front button on
> Turris Omnia, the MCU can produce an interrupt to the CPU. Add the
> description of this interrupt to the LED controller node.
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

As the binding had been acked, and this change won't produce any
regression I can already get it.

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch=
/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> index 43202890c959..83fe00abd652 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> +++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> @@ -251,6 +251,7 @@ mcu: system-controller@2a {
>  			led-controller@2b {
>  				compatible =3D "cznic,turris-omnia-leds";
>  				reg =3D <0x2b>;
> +				interrupts-extended =3D <&mcu 11 IRQ_TYPE_NONE>;
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
>  				status =3D "okay";
> --=20
> 2.45.2
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
