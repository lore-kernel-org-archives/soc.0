Return-Path: <SRS0=OsNm=VD=pengutronix.de=r.czerwinski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E97C433EF
	for <soc@archiver.kernel.org>; Mon, 25 Apr 2022 10:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60318C385AB; Mon, 25 Apr 2022 10:30:43 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1574C385A4
	for <soc@kernel.org>; Mon, 25 Apr 2022 10:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C1574C385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <r.czerwinski@pengutronix.de>)
	id 1nivzH-0005Ci-Ci; Mon, 25 Apr 2022 12:30:35 +0200
Message-ID: <72c1f0b80e76b7f4ab1c59f09e6edeffe892fbdc.camel@pengutronix.de>
Subject: Re: [PATCH 6/8] ARM: dts: stm32: enable optee firmware and SCMI
 support on STM32MP15
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Marek Vasut <marex@denx.de>, Etienne CARRIERE <etienne.carriere@st.com>,
  Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>, "arnd@arndb.de"
 <arnd@arndb.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>, "soc@kernel.org" <soc@kernel.org>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
	 <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 25 Apr 2022 12:30:32 +0200
In-Reply-To: <71c0dd94-8cd3-9ca0-f06d-ee13ad063618@denx.de>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
	 <20220422150952.20587-7-alexandre.torgue@foss.st.com>
	 <174bea56-3e99-e01c-4133-f1350d34448d@denx.de>
	 <PAXPR10MB4687B8C3DF485E814AE8158BFDF89@PAXPR10MB4687.EURPRD10.PROD.OUTLOOK.COM>
	 <71c0dd94-8cd3-9ca0-f06d-ee13ad063618@denx.de>
Organization: Pengutronix e.K.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: r.czerwinski@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Hi,

On Mon, 2022-04-25 at 12:25 +0200, Marek Vasut wrote:
> On 4/25/22 12:19, Etienne CARRIERE wrote:
> > Hello Marek,
>=20
> Hi,
>=20
> > > From: Marek Vasut <marex@denx.de>
> > >=20
> > > > On 4/22/22 17:09, Alexandre Torgue wrote:
> > > > Enable optee and SCMI clocks/reset protocols support.
> > > >=20
> > > > Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > >=20
> > > > diff --git a/arch/arm/boot/dts/stm32mp151.dtsi
> > > > b/arch/arm/boot/dts/stm32mp151.dtsi
> > > > index 7fdc324b3cf9..1b2fd3426a81 100644
> > > > --- a/arch/arm/boot/dts/stm32mp151.dtsi
> > > > +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> > > > @@ -115,6 +115,33 @@
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "disabled";
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > >    =20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 firmware {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 optee: optee {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "lina=
ro,optee-tz";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 method =3D "smc";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "disabled=
";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 };
> > >=20
> > > Doesn't this TEE node get automatically generated and patched into DT=
 by
> > > the TEE ? I think OpTee-OS does that.
> >=20
> > OP-TEE OS does that if it gets passed the DT from early boot stage whic=
h is not always the case.
>=20
> Shouldn't that be something to fix ?
>=20
> I think R-Car3 does that already.

FWIW it's also possible for OP-TEE to generate a device tree overlay
which can be applied by later boot stages.

Drawback is that you either need an additional parameter to pass
between boot stages (address of the DT overlay) or it needs to be
hardcoded. Hardcoding has it's own bag of drawbacks, but it's what we
do for some i.MX6 platforms within barebox. However there is no TF-A
there, so only OP-TEE and Barebox need to agree on the fixed location
beforehand.

Best regards,
Rouven Czerwinski

--=20
Pengutronix e.K.           | Rouven Czerwinski          |
Steuerwalder Str. 21       | http://www.pengutronix.de/ |
31137 Hildesheim, Germany  | Phone: +49-5121-206917-0   |

