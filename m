Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AAF1BC2A
	for <soc@lists.linux.dev>; Wed, 25 Sep 2024 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727280973; cv=none; b=l6jbuXhDFjyrdsaJ7ZdrflQ/dWoCI0SzwjfuJJ6RUMRFeZiqvSSSPNMpbB39Bkp4BU5nHCGpsyfFUE+2tLldO+tIlpsczat/s5pD/Vw8IHEGH4zthug+0lvYQwYaRg4+4oApu/uH73cq0oXLOUk23RP4/uR9oiU+lRbtHw5rMEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727280973; c=relaxed/simple;
	bh=+HN0nSWKLyfVrl9glioBTKD1Mbw3nzasOY//9e7DJQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQsod1pet4gQiEDhxcMmL8GTM2CKX1P/ZJRTRRZBkrqlWmxN8qSydDRuk9PKEwCIkPsMmkioZvhqG5iGLHg5n49Oh3woatTBdMQjbZy98KDkJeoWrFvZWmSshuwOb+9TBvRCJfrI+1yRCdTk/43b64dhhYoYgimyMzhE6SV+TEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeZ9Dsg9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeZ9Dsg9"
Received: by smtp.kernel.org (Postfix)
	id 7C642C4CEC6; Wed, 25 Sep 2024 16:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3ACC4CEC3;
	Wed, 25 Sep 2024 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727280973;
	bh=+HN0nSWKLyfVrl9glioBTKD1Mbw3nzasOY//9e7DJQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CeZ9Dsg9fsx1MKTlQR48io58g8q5LwM9MwhuLqPEq2kI7RaLFOtYb3ij60O+Yf5//
	 TnM53ygVaWtIF+SF+yhicVo7Y/6Vts36ASRy42x43pEsVIfs+wkMYM9AMMSbmwPCGJ
	 xf/W2hV+kGvNbLCAMiY+KSOLTknyPgo1gXmAglFmTiGJ8Ug4Qu9Gl4ayXhijEDrHWl
	 J2dyFHja6v1l2Ap3S2qUvtEZDyV7rUcPqZWalyBEaDpfZklvQL06g/6hn6AZYFjpff
	 Qt0Z/t661AyqM67N0N82IEl0ELySv/Q5gqyhtm7M1W6tXDpfMdjXQyryEiUj90bvAP
	 FGkG7fLLDt7cg==
Date: Wed, 25 Sep 2024 17:16:10 +0100
From: Conor Dooley <conor@kernel.org>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, soc@kernel.org
Subject: Re: microchip soc maintainance change proposal
Message-ID: <20240925-absolute-jockey-1518cceb2884@spud>
References: <20240924-overtime-entourage-bcf3d6ff8c80@spud>
 <6d6ab21d-44fa-491c-98f7-8a2d8ab86c62@microchip.com>
 <202409241424582a8b426d@mail.local>
 <70f1981a-5956-4abb-afd2-4321f4b21e8b@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t56mcPqeU1AmyoBN"
Content-Disposition: inline
In-Reply-To: <70f1981a-5956-4abb-afd2-4321f4b21e8b@tuxon.dev>


--t56mcPqeU1AmyoBN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:34:10AM +0300, claudiu beznea wrote:
>=20
>=20
> On 24.09.2024 17:24, Alexandre Belloni wrote:
> > On 24/09/2024 16:05:45+0200, Nicolas Ferre wrote:
> >> On 24/09/2024 at 13:46, Conor Dooley wrote:
> >>> Hey folks,
> >>>
> >>> I mentioned this to Arnd and Alexandre at LPC, and to Nicolas before
> >>> that, but I would like to propose some changes to how the Microchip s=
oc
> >>> support is maintained - mostly affecting the riscv side of things that
> >>> I've been maintaining in my personal tree, alongside other platforms.
> >>> I'd like to propose moving those from my tree, into the at91 tree.
> >>
> >> I don't know if the "at91" naming will remain a right designation of w=
hat
> >> we're doing in the future, but well, let's stick to it for now.
> >> Some find it a little too much tight to the old Atmel brand...
> >>
> >=20
> > We could take this opportunity to rename the tree microchip or mchp.=20
>=20
> +1

I personally don't care at all about the tree being called at91 or w/e,
but I wouldn't object to a rename to either. I can whip up a mail to the
helpdesk if yous like.

>=20
> >=20
> >>> While the dts bits for the arm and riscv platforms have no overlap
> >>> and nothing is particularly gained from me moving which tree
> >>> location they're in, I'm far more interested in disambiguating the tr=
ee
> >>> that soc and/or firmware bindings and drivers end up in.
> >>>
> >>> I was going to add the bindings/soc/microchip directory to the
> >>> maintainers entry I have for drivers/soc/microchip, but while doing
> >>> that, I noticed that there have been recent patches for sam and sparx5
> >>
> >> FYI: and we have the older drivers/soc/atmel directory (which is caugh=
t by
> >> "ARM/Microchip (AT91) SoC support" entry).
> >>
> >>> bits that have added files to that bindings directory that went via a=
t91
> >>> and I figure it's almost certain that there'll be drivers added before
> >>> too long. Having a single location, like we do at the moment for cloc=
ks,
> >>> would make the route upstream for things a bit clearer - and I figured
> >>> that while moving one thing, might as well move the firmware and dts
> >>> stuff too.
> >>>
> >>> My assumption is that the riscv dts bits would retain their own branc=
h,
> >>> and that I'd still send the PRs for them and for the firmware stuff g=
iven
> >>> that there's no !riscv soc content in that directory yet - and I don't
> >>> want to saddle Claudiu with more work for devices he probably doesn't
> >>> care about...
> >>>
> >>> Seem reasonable?
> >>
> >> That's fine with me Conor. It makes a lot of sense as we're working on=
 more
> >> and more topics together.
> >=20
> > Looks good to me.
>=20
> Looks good to me, too.

Cool. I'll take a look at what makes the most sense in terms of
maintainers entries then. Thanks guys.

--t56mcPqeU1AmyoBN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvQ3SgAKCRB4tDGHoIJi
0jVNAQCRYEunmysd5Bvg2Yy6pYbtG7DsD2wroCNjbRn8B8vV/QD+JpKOQNgWd5Th
C2Y63AemD+f7qmHMk1Tz6w3HGkuKdQg=
=gV6s
-----END PGP SIGNATURE-----

--t56mcPqeU1AmyoBN--
