Return-Path: <SRS0=/kpj=QT=bootlin.com=herve.codina@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BEBC433EF
	for <soc@archiver.kernel.org>; Thu,  2 Dec 2021 11:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55614C53FD1; Thu,  2 Dec 2021 11:49:05 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FDB4C00446;
	Thu,  2 Dec 2021 11:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FDB4C00446
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: herve.codina@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4E29B240004;
	Thu,  2 Dec 2021 11:48:58 +0000 (UTC)
Date: Thu, 2 Dec 2021 12:48:55 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim
 <shiraz.linux.kernel@gmail.com>, soc@kernel.org, Rob Herring
 <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
 <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/6] spear: Fix SPEAr3XX plgpio support
Message-ID: <20211202124855.1c1298e7@bootlin.com>
In-Reply-To: <20211202112700.mkjmwibabj2cpr6u@vireshk-i7>
References: <20211202095255.165797-1-herve.codina@bootlin.com>
	<20211202112700.mkjmwibabj2cpr6u@vireshk-i7>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Dec 2021 16:57:00 +0530
Viresh Kumar <viresh.kumar@linaro.org> wrote:

> On 02-12-21, 10:52, Herve Codina wrote:
> > Hi,
> >=20
> > This patch series fixes the plgpio support on SPEAr3xx SOCs.
> >=20
> > The first four patches of this series fixes a ressources
> > sharing issue between the plgpio driver and the pinmux
> > driver.
> > Indeed, these two drivers can use the same IO address range
> > on some SPEAr3xx SOCs.
> > To solve the issue, a regmap (syscon managed) is used in both
> > drivers and the plgpio driver can reference the pinmux regmap
> > to use it.
> >=20
> > The second part of this series is related to IRQs.
> > The plgpio on SPEAr320s SOC uses an IRQ line in the reserve
> > range (from SPEAr320 point of view).
> > This issue is fixed enabling all the 'reserved' IRQs and
> > adding a dtsi file for the SPEAr320s with the correct interrupt
> > for the plgpio node. =20
>=20
> Are these changes backwards compatible ? I mean new kernel will work
> with old DTBs ? It may be quite important to not break that here.
>=20

Yes they are.
- the regmap reference (phandle) is optional.
- The IRQ for plgpio is used only on the new spear320s.dtsi.

I have not seen any issues on my board (spear320s SOC) when I only add supp=
ort
for the 'reserved' IRQs (ie no spurious interrupts occur when I apply the p=
atch
related to shirq).
I cannot test on SPEAr320 SOC as I haven't got any board with this SOC.

Herve

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
