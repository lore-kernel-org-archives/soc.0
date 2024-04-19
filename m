Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EFBC4345F
	for <soc@archiver.kernel.org>; Fri, 19 Apr 2024 13:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC132C32781; Fri, 19 Apr 2024 13:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6949C072AA;
	Fri, 19 Apr 2024 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713534739;
	bh=fY+0iOG7auw+u/WWt7hwcicZp9xCy4zlB4ouADBllh4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=dI39Gi312O8FHE4uHaVJyldTfTUvAR1lB/AnLBsKmi8EceO6pBuKbP6sALopQoGCi
	 MlwDhIna0Tq0nBexYuye/Zo2FA/oUS8D50tjJ2EKLjZnX99/mBV9oQXZCxGMsl6i2V
	 a6iOg0Qe40uJxqHWheUNLQKQKiNzer385TJ4j3BmxzzrgJFmXEabb04tHGobQu/CrK
	 O8KnfNwrlwfJn/zfPj5RYJWZO1d+/Bs4D6uK7gy0ejskPEKZQzoy1H+Cff7a2xH/qL
	 q4qPf97ogEX7vCM/fMGp5ZFCaH7EfZDt1iPBIKbdeu5T5umgNjTzi1A0S7cYR9ikaF
	 /h7XkyskxO9vQ==
Date: Fri, 19 Apr 2024 14:52:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 01/11] dt-bindings: arm: add cznic,turris-omnia-mcu
 binding
Message-ID: <20240419-magnolia-entourage-dd8a690ee288@spud>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-2-kabel@kernel.org>
 <20240418-grain-ethics-8a3ee62ac9a1@spud>
 <20240419082337.646a54a5jam7x3x6@kandell>
 <20240419111445.wirqqjza4hbsekyp@kandell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LmHCYhuoA18M2vxz"
Content-Disposition: inline
In-Reply-To: <20240419111445.wirqqjza4hbsekyp@kandell>


--LmHCYhuoA18M2vxz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 01:14:45PM +0200, Marek Beh=FAn wrote:
> On Fri, Apr 19, 2024 at 10:23:37AM +0200, Marek Beh=FAn wrote:
> > On Thu, Apr 18, 2024 at 04:43:54PM +0100, Conor Dooley wrote:
> > > On Thu, Apr 18, 2024 at 02:11:06PM +0200, Marek Beh=FAn wrote:
> > > > Add binding for cznic,turris-omnia-mcu, the device-tree node
> > > > representing the system-controller features provided by the MCU on =
the
> > > > Turris Omnia router.
> > > >=20
> > > > Signed-off-by: Marek Beh=FAn <kabel@kernel.org>
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > ---
> > > >  .../bindings/arm/cznic,turris-omnia-mcu.yaml  | 86 +++++++++++++++=
++++
> > >=20
> > > Why's this in bindings/arm btw? Seems like it is some remote firmware=
 if
> > > it is running off-SoC on an MCU, so either remoteproc or firmware wou=
ld
> > > make more sense? Tying it to arm at least needs an explanation IMO.
> >=20
> > This was discussed with Krzysztof in v1, you can look it up at
> >   https://lore.kernel.org/soc/20230824131736.067c40e2@dellmb/
> >=20
> > Basically the SoC is an ARM board, and the MCU is also always ARM.
>=20
> What I wrote does not make sense. I wanted to say is that the driver
> drives the peripherals implemented by the Turris Omnia MCU firmware, and
> the Turris Omnia router is based on an ARM SoC, and that the MCU is also
> an ARM-based MCU.

Yeah, it didn't really make sense, but I read between the lines.
FWIW, I still don't really think that bindings/arm is the right place
for it.

>=20
> >=20
> > I'm guessing firmware would also make sense...
> >=20

--LmHCYhuoA18M2vxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiJ3AwAKCRB4tDGHoIJi
0kWJAQCzBaYHntWrc8f1wqbnivc/ITMcI1zyPd3QBi4hrxJICQD/alRGLCh44/j1
rmYojSioUDIXW05OouVo73EN/9viuws=
=DXoZ
-----END PGP SIGNATURE-----

--LmHCYhuoA18M2vxz--
