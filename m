Return-Path: <SRS0=IP8z=OF=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22C7C30658
	for <soc@archiver.kernel.org>; Fri,  5 Jul 2024 12:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C157CC4AF0A; Fri,  5 Jul 2024 12:41:42 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6129AC116B1;
	Fri,  5 Jul 2024 12:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6129AC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 708071BF20C;
	Fri,  5 Jul 2024 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720183292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iosINar1te4jQmV0kLBug8VLhQo1H7OfnXMTToJiLeo=;
	b=HuGhRfW3NamX4GM3vt8ybyncRclOK3/tqvtVgmB/JmbdWBSGFLxDMmHteT0EZk2TFSVum2
	moDI4KjjZRtlQ2mpNmmIJoUqZXp29d7dG3Q8RLVTfRk/n5GEbFJn3xrG6id3VFVvmYyvJ4
	3IraKY0z4HAy1+oFuWNq34Pzt9d2TY48+5SLk3vvHxhEN3BKOUkCszMp7lI1E1Ohp4m3Xr
	1x1pun13K3J621FITvLwMfc5iJ+79vBUZSwuoZrXp9MEMZYFsVmbeM2ytT7n2of6t2LGeb
	1OueM1+GwUw7p9+7weWUWExO2tW9tbVF+4ezLyQ7Amzj/Mbh5bR61MDCRbXouA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, soc@kernel.org, Thomas Gleixner
 <tglx@linutronix.de>
Cc: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: armada-{370-xp,375,38x,39x}: Drop
 #size-cells from mpic node
In-Reply-To: <20240624145355.8034-2-kabel@kernel.org>
References: <20240624145355.8034-1-kabel@kernel.org>
 <20240624145355.8034-2-kabel@kernel.org>
Date: Fri, 05 Jul 2024 14:41:31 +0200
Message-ID: <87le2gj9j8.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Marek Beh=C3=BAn <kabel@kernel.org> writes:

> The marvell,mpic interrupt controller has no children nodes. Drop the
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>


Applied on mvebu/dt

Thanks,

Gregory


> ---
>  arch/arm/boot/dts/marvell/armada-370-xp.dtsi | 1 -
>  arch/arm/boot/dts/marvell/armada-375.dtsi    | 1 -
>  arch/arm/boot/dts/marvell/armada-38x.dtsi    | 1 -
>  arch/arm/boot/dts/marvell/armada-39x.dtsi    | 1 -
>  4 files changed, 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-370-xp.dtsi b/arch/arm/boot=
/dts/marvell/armada-370-xp.dtsi
> index 0b8c2a64b36f..954c891e5aee 100644
> --- a/arch/arm/boot/dts/marvell/armada-370-xp.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-370-xp.dtsi
> @@ -168,7 +168,6 @@ mbusc: mbus-controller@20000 {
>  			mpic: interrupt-controller@20a00 {
>  				compatible =3D "marvell,mpic";
>  				#interrupt-cells =3D <1>;
> -				#size-cells =3D <1>;
>  				interrupt-controller;
>  				msi-controller;
>  			};
> diff --git a/arch/arm/boot/dts/marvell/armada-375.dtsi b/arch/arm/boot/dt=
s/marvell/armada-375.dtsi
> index ddc49547d786..99778b4b7e7b 100644
> --- a/arch/arm/boot/dts/marvell/armada-375.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-375.dtsi
> @@ -376,7 +376,6 @@ mpic: interrupt-controller@20a00 {
>  				compatible =3D "marvell,mpic";
>  				reg =3D <0x20a00 0x2d0>, <0x21070 0x58>;
>  				#interrupt-cells =3D <1>;
> -				#size-cells =3D <1>;
>  				interrupt-controller;
>  				msi-controller;
>  				interrupts =3D <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-38x.dtsi
> index 446861b6b17b..1181b13deabc 100644
> --- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi
> @@ -408,7 +408,6 @@ mpic: interrupt-controller@20a00 {
>  				compatible =3D "marvell,mpic";
>  				reg =3D <0x20a00 0x2d0>, <0x21070 0x58>;
>  				#interrupt-cells =3D <1>;
> -				#size-cells =3D <1>;
>  				interrupt-controller;
>  				msi-controller;
>  				interrupts =3D <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm/boot/dts/marvell/armada-39x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-39x.dtsi
> index 9d1cac49c022..6d05835efb42 100644
> --- a/arch/arm/boot/dts/marvell/armada-39x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-39x.dtsi
> @@ -268,7 +268,6 @@ mpic: interrupt-controller@20a00 {
>  				compatible =3D "marvell,mpic";
>  				reg =3D <0x20a00 0x2d0>, <0x21070 0x58>;
>  				#interrupt-cells =3D <1>;
> -				#size-cells =3D <1>;
>  				interrupt-controller;
>  				msi-controller;
>  				interrupts =3D <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
> --=20
> 2.44.2
