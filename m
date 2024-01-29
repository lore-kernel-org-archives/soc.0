Return-Path: <lorenzo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F92C47DA9
	for <soc@archiver.kernel.org>; Mon, 29 Jan 2024 13:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D753C433F1; Mon, 29 Jan 2024 13:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9DEC433C7;
	Mon, 29 Jan 2024 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706534383;
	bh=y5CXI94G3cDdvg0pcCH5XgYbMc63lmzQNHlNCcB70es=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Xe0bYNUl9QMWFwqhe1MZa1YTZaKfcC3tIGjoUKBxu+Zx3Ye2SeoOy7al/5Ti5yxGo
	 v0lr4sM08W3nE4eIYDTuG5rJoC6SFdKvADTS2zF3TBgDvQalD3wpoV0NP01YDTeMyt
	 6FsQfq/HZOsAvZjV6HR4zX5PLkpSJ02WS6EHtThpeJxgKx45zrUHcQLXmj9c6xtybM
	 cKxrbblOBDq7azJZRFXxxlXNkOzBP9WbdWxm+UyOl0UxUt4Fmpw9Y1xq/+vgjG7eFd
	 ri+9FQr+/iz6ZmoMc2J6JK6GeEYtCvPqQ6ANZ+xA3Nh/byjPW3g4DT0gBBWni7P1Dp
	 FpqN5z1McHa6A==
Date: Mon, 29 Jan 2024 14:19:39 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
	soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, dd@embedd.com
Subject: Re: Support for airoha en7581 Soc
Message-ID: <Zbel62idW9Nsm3k6@lore-desk>
References: <ZbeJ5okKQ66FXGxP@lore-desk>
 <f16842b0-0086-41b6-a366-e27ccb2905c1@collabora.com>
 <20240129-gawk-strongly-91344f34d004@spud>
 <841e102c-c5ab-432c-bdba-efdd67a3c129@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uedfQUkScHt4J/Y/"
Content-Disposition: inline
In-Reply-To: <841e102c-c5ab-432c-bdba-efdd67a3c129@collabora.com>


--uedfQUkScHt4J/Y/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 29/01/24 12:39, Conor Dooley ha scritto:
> > On Mon, Jan 29, 2024 at 12:34:37PM +0100, AngeloGioacchino Del Regno wr=
ote:
> > > Il 29/01/24 12:20, Lorenzo Bianconi ha scritto:
> > > > Hi Matthias,
> > > >=20
> > > > I was wondering about the status of the following patches:
> > > > https://lore.kernel.org/linux-arm-kernel/20231001122418.2688120-4-d=
d@embedd.com/T/#rbafabf4bf2473327f35ce7d79623f63838630537
> > > >=20
> > > > Do we need to respin them? Thx in advance.
> > > >=20
> > >=20
> > > Lorenzo, I don't think you have to.
> >=20
> > The compatibles in en7581-evb.dts appear to be undocumented as of
> > whatever linux-next I have checked out from late last week.
> >=20
>=20
> Right, there's a 7523, but not a 7581.
> Needs one more commit :-)

ack, I will respin the series.

Regards,
Lorenzo

>=20
> > >=20
> > > Matthias, should we update the MAINTAINERS file to include the MediaT=
ek
> > > Airoha folder?
> > >=20
> > > Actually that question is for both ARM and ARM64.
> > >=20
> > > Cheers
>=20

--uedfQUkScHt4J/Y/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZbel6wAKCRA6cBh0uS2t
rLKKAP0X1DePP1bARIHXEF/5mypfT+arrtryoEQ7ehczSWXlTAEAinijWXxxK+CJ
RQLBIHlUy3mvQ1RYDtA4B5cy0Jvk6AQ=
=iF8F
-----END PGP SIGNATURE-----

--uedfQUkScHt4J/Y/--
