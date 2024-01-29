Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0FBC47422
	for <soc@archiver.kernel.org>; Mon, 29 Jan 2024 11:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 589C6C43390; Mon, 29 Jan 2024 11:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B59C433C7;
	Mon, 29 Jan 2024 11:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706528369;
	bh=BZCTPuHkr53/fiFd/hictNBJruiJNTZi6Ino45cyYmk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ohjrvhYB79+TmXuUYRkhN+8cIDWiAnUgvmf5TiyDi+X5XexxEmvo0tvfDIvDzBN4k
	 pv9CdIOPJfYXEhnai68KOfZYrbmzLrE/I/6whDqQdfENs2GrXlI1TPkmJhA18ffuqD
	 Kl/cltjfONb9GW0R6ecxkY8cwaROxolNj8l2Lg22FHZPWQ2kCAQhVxquFCcP/I9id6
	 tUMsZ/yN3Ihv9dCThEJbwdXGoJdanwlDXLfFAfS8g8IxNh5tl5jM3usyWJFWnvY3Vw
	 rHEu2FIvm9R+i1vUVVUIH2HW7mGYGV2iBitaFidgOwX3MI/qLg/v7p4KmPctMfNIAM
	 UvvhMkzVD928Q==
Date: Mon, 29 Jan 2024 11:39:24 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
	soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, dd@embedd.com
Subject: Re: Support for airoha en7581 Soc
Message-ID: <20240129-gawk-strongly-91344f34d004@spud>
References: <ZbeJ5okKQ66FXGxP@lore-desk>
 <f16842b0-0086-41b6-a366-e27ccb2905c1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DWS7EwZsWub5O+8A"
Content-Disposition: inline
In-Reply-To: <f16842b0-0086-41b6-a366-e27ccb2905c1@collabora.com>


--DWS7EwZsWub5O+8A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 12:34:37PM +0100, AngeloGioacchino Del Regno wrote:
> Il 29/01/24 12:20, Lorenzo Bianconi ha scritto:
> > Hi Matthias,
> >=20
> > I was wondering about the status of the following patches:
> > https://lore.kernel.org/linux-arm-kernel/20231001122418.2688120-4-dd@em=
bedd.com/T/#rbafabf4bf2473327f35ce7d79623f63838630537
> >=20
> > Do we need to respin them? Thx in advance.
> >=20
>=20
> Lorenzo, I don't think you have to.

The compatibles in en7581-evb.dts appear to be undocumented as of
whatever linux-next I have checked out from late last week.

>=20
> Matthias, should we update the MAINTAINERS file to include the MediaTek
> Airoha folder?
>=20
> Actually that question is for both ARM and ARM64.
>=20
> Cheers

--DWS7EwZsWub5O+8A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbeObAAKCRB4tDGHoIJi
0u7nAP9KiZHlscFnJqhvxnnPfAIecdNaWArb6yhErrefStvP4wEAzuZUr73i/R5z
clHOA9OY1MB8gL9f8KRylQIBejJWqAA=
=S7cE
-----END PGP SIGNATURE-----

--DWS7EwZsWub5O+8A--
