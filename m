Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C99C4345F
	for <soc@archiver.kernel.org>; Thu, 18 Apr 2024 15:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD0D5C116B1; Thu, 18 Apr 2024 15:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD7EC113CC;
	Thu, 18 Apr 2024 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713455038;
	bh=xJuCAMEMI4H0VXMOYYN8BJoikiiTJ0i9X5lKoXkiLGM=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=HrTLOtSODv3tRummfG2jsSqfToL8pxAZXVhngDITqillR0l7xD8SNLnkM1We9aBGb
	 dvLmeuRlQXfbAb44SIO2e3Ojc5nwNBft6FNV0bgEd0ya7ZWhtCSV3IlKvyALsZEZe4
	 VS+YnsgYYJiDyjnI47YntoI/M8bEWp539AVZ2zJiRxzlr9hBP6EpFOOwaDGSqVUpjF
	 pIuw5veweCkjMVOJoA8o1koGK9M86SFOe8sEz+oh70KEeporb/Y0BnWYOoeiLs9TgL
	 5nhrAimI957YpT/AQi04bHn4orBve98gsCkyjEALMXOwkqtPG9fCLGneSbTpnrWdw0
	 QQ1p69b0L6pvA==
Date: Thu, 18 Apr 2024 16:43:54 +0100
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
Message-ID: <20240418-grain-ethics-8a3ee62ac9a1@spud>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-2-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fNry77T239LsQMX4"
Content-Disposition: inline
In-Reply-To: <20240418121116.22184-2-kabel@kernel.org>


--fNry77T239LsQMX4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 02:11:06PM +0200, Marek Beh=FAn wrote:
> Add binding for cznic,turris-omnia-mcu, the device-tree node
> representing the system-controller features provided by the MCU on the
> Turris Omnia router.
>=20
> Signed-off-by: Marek Beh=FAn <kabel@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/arm/cznic,turris-omnia-mcu.yaml  | 86 +++++++++++++++++++

Why's this in bindings/arm btw? Seems like it is some remote firmware if
it is running off-SoC on an MCU, so either remoteproc or firmware would
make more sense? Tying it to arm at least needs an explanation IMO.

--fNry77T239LsQMX4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiE/ugAKCRB4tDGHoIJi
0kBMAP0dMGUS965+90f3LCJ0ZFw9sNu6BYih/dx8ZIq4ycCMvQEAhw6JDxT7LFqJ
a3d3KKeKFEg16PejV+LaHIqbodOsZwU=
=NUXN
-----END PGP SIGNATURE-----

--fNry77T239LsQMX4--
