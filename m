Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4238D
	for <soc@lists.linux.dev>; Tue, 27 Jan 2026 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508322; cv=none; b=kqrKXjr9e3k1+OR6jc8vyTxiSlMzXifjaznbhNb0BLV0sW6ja+IW+Ok7ioF7n3YVdVqN20OR+gVT6x3nf03wCz21xmwaviyFPTPSaDEpPJuWZgxVMzNKqXz3VyrtyJEplCdJZ4/laeS9HyYlr2jVYSs11hkbm81nuHPtJXO0NqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508322; c=relaxed/simple;
	bh=lnv5v2fg4/DdlahzuPZPpsYPybhX62DGJmyUbVctMYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPitGxWFq6vMnJlFgbQmHNHEf0qBN9eGCpYHsIyi3D4JEofEJYuQnnZZp6vkkYYK+Y0gN8/ryLWqZghuaWBsDUWz+1goTuJwow/voC2XeJli3ghsfav5PiTFZAsESY0C/zWU5wRcglxaiXcA5nx3BFm3xmIIHCYSM4v+EmH/J8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXAPdLba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXAPdLba"
Received: by smtp.kernel.org (Postfix)
	id 8F7E4C4AF0B; Tue, 27 Jan 2026 10:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276AFC116C6;
	Tue, 27 Jan 2026 10:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508322;
	bh=lnv5v2fg4/DdlahzuPZPpsYPybhX62DGJmyUbVctMYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXAPdLbarZH2A7vHoDIUlTYJ9dtoBeJKz1kpsSU4fbEWe8dFYdGiSu00hOCNhNSR9
	 DH/p8hVkWspY5oiNWVt4RlYLuMTRQ+6Glt6wlP8erokLEUgouj2f7ibGy6xtVzobC5
	 A/VhAtJ3hdEqGDeo6kd2OFiUvLezxB2JqbPXsAzxn4NFg/9Ya9A5dQpbSJrRCD4HIL
	 PKqNvwMy8iGQ56nSwku1Ui2D39WEElwIHCvsaMOQxjZnCGTp5MzQxx5Rac0BHbp1eu
	 wh5HUOmrOAqTk/Q25S7T/eNi4b3BzVGldujrwnveP1+ibtzdlhO4UgVEiN1DKBcYMK
	 IABkh0HNYN/DA==
Date: Tue, 27 Jan 2026 11:05:20 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org, 
	soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Message-ID: <aXiNaDGyN2oiIR6O@orome>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
 <53d3a98f-3ad8-43c0-9094-39f229a5b698@kernel.org>
 <3b81369e-8cc7-4e9f-98ca-e6f528e1cab8@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7zmgzmlgkhcad7vw"
Content-Disposition: inline
In-Reply-To: <3b81369e-8cc7-4e9f-98ca-e6f528e1cab8@kernel.org>


--7zmgzmlgkhcad7vw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
MIME-Version: 1.0

On Fri, Jan 23, 2026 at 08:52:58AM +0100, Krzysztof Kozlowski wrote:
> On 23/01/2026 08:47, Krzysztof Kozlowski wrote:
> >=20
> >>
> >> Jon Hunter (4):
> >>       dt-bindings: tegra: pmc: Update aotag as an optional aperture
> >=20
> > ...
> >=20
> >>       ASoC: dt-bindings: realtek,rt5640: Document mclk
> >>       ASoC: dt-bindings: realtek,rt5640: Update jack-detect
> >>       ASoC: dt-bindings: realtek,rt5640: Document port node
> >=20
> > No, Mark always promptly picks up bindings patches, so I do not
> > understand why these are here. These should go via subsystem maintainer.
>=20
> Heh, and Mark actually did take them on 9th of Jan, so you just
> duplicated the patches by taking them one week later. Mark also sends TY
> letters so you were notified these are picked up.
>=20
> Also Rob was fixing the same in separate patchset and Mark also took
> these, but then Mark handles the conflicts since its all in his own tree.
>=20
> These should have never been picked up one week later after Mark to
> Tegra soc tree. Please drop.

Okay, I'll apologize a third time for this. Sorry for neglecting to
double-check the mailing list and relying solely on Patchwork. I promise
to do better next time.

Thierry

--7zmgzmlgkhcad7vw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAml4jeAACgkQ3SOs138+
s6FUQw//XuMr2GmVCEV7IsKoQMxS07o7BYY+4hO9faPqq+5/xlvflf5dRknmAA2O
BO5QMHylyB9TmQIz+2/ut/ulfTr0vUiAPuWxgax6raeYdFlqKAqGnnPD70MmY9tS
uq3E2p596jmkgHz60kwTY2JQjF3DN95mbcb3avnNrDK9d31YjIuVqP5m7mGuNS3y
kBlkn1Q71CS1F/UkUliwfdWj57fMnGWErH/mFjq0i9puB/Ky9zA0gffd/mfG4+7I
oalkKmvW8V/iNgUQ4JI7nZcBclNEpuqMoOFw2HUpoXdEB0C925GybJvPoe6yIbQE
rKhu4xns5iGWy8wrqojllhhvtjME85OWHcFXzxohNymaRsNOq7RdNa927uFXEcvD
OcjLtTE2GrssmY3VSB5NWMe823/2DjJuokczu7lEuBF8UhgpcwtlJTaW/j8dO+yI
r82kDgTofKMAV2pDrhzA3ibdREjieEHN83MjtVZxhGSkrYq8x1DNBgKtu6cRW5/k
pNgXXcyOhi2NMztjTi8SHiXbF8Aha8gOEkbSrr5eqOnwpaaxJvMBxKSmTuRcsXVK
KQJSNKc3OxkQFTIm5pq/cKntpvBuUDw/B7taXcyF8amWJ6sXOyrmnKY+8Qxqilpe
3ZjOwg0yjyuGnoqXmgLW4wjsf1XcA/sJcaFXZQX09bR3zghTNis=
=96RW
-----END PGP SIGNATURE-----

--7zmgzmlgkhcad7vw--
