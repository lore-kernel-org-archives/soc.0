Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F8834D4CB
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 12:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613805; cv=none; b=KLRU7eIZXTL6nBo2bf5CX/aq75jim3tX4S23UdFWEox93q10+JojpfHfq+6kRlDq8FpqH0NaOl49bobl1CZk1qQw7TcX18cIGjxQPurWzLF6kY54ksksOglFVDFaCRVrYJgwfMU558qsE9Mdkr6KmHwW5yhVrEZEN5DogTp2laE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613805; c=relaxed/simple;
	bh=p1EvqaRPmdk10yaubx9fxgSlq9skPOeLojhbClIq170=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaNApNyNv1jxTpz/topCB9rjlA2pBT0Ft9ri/SVHurlUsV2E4KX/RZafm4eBRXd81kySsvTrlGp0aARd5JYLc8DsCnrwHgpHBUZAc+RAls7ydDsIQhj2PdjHAoBRBb+RwTKSc0/hF6lchKLdgVDucyqlFfBBM0NIi8eUJmnVfDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEntcwza; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEntcwza"
Received: by smtp.kernel.org (Postfix)
	id 91E34C2BC87; Fri, 27 Mar 2026 12:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D841AC19423;
	Fri, 27 Mar 2026 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774613805;
	bh=p1EvqaRPmdk10yaubx9fxgSlq9skPOeLojhbClIq170=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cEntcwzak8m8KsVpXRIYAPnTFc0qqZo+uPkyM0QuM8/7UzsMnbZK+3NGJeoORxc1R
	 vGEnKCQU78yJUItt9TsT/yy9Nwz82/jIlgATiRUGhMXhaZi7QQJnc6g6JCsVAbczMA
	 j+L1OwbxKAKZTyOetmYixQGfEX1C5F5iIRB15tXoI6+y3wgXWjMUzxvdM/aEMKjjro
	 JLA3+X0zTO7sXoLUnzP/ZUvZV0kP1mwdSk9875Wd1o38tl+IOJhNLpgjXb8GccUc0j
	 iIMh3/uMhCzKdnY3pmLXtXZHRjNdsn2VSFfMGZKHewU9Ou90Al5qt35ZJGwyjryIMY
	 7v005gkot9dOw==
Date: Fri, 27 Mar 2026 12:16:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>, soc@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Ilya Sorochan <k0tran@altlinux.org>
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
Message-ID: <20260327-duress-swoop-81695580967f@spud>
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
 <d7eb716d-9b9c-4474-a9ca-d44e96c46fc8@kernel.org>
 <20260327-tapestry-frightful-de17113da7d3@spud>
 <c88af06a-596c-4793-a043-dcb018c2c95b@kernel.org>
 <8c411e55-7043-4987-bd6b-cb5b139902c5@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IpEh6h8ktcVqjQnK"
Content-Disposition: inline
In-Reply-To: <8c411e55-7043-4987-bd6b-cb5b139902c5@kernel.org>


--IpEh6h8ktcVqjQnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 11:50:39AM +0100, Krzysztof Kozlowski wrote:
> On 27/03/2026 10:49, Krzysztof Kozlowski wrote:
> > On 27/03/2026 10:45, Conor Dooley wrote:
> >>
> >>> The commit touches only DTS, not DTSO, so how can you claim that a DTS
> >>> file change breaks some completely other board (Raspberry)?
> >>>
> >>> This DTS file is nowhere included (and should not be).
> >>>
> >>> Of course maybe the true question would be why anyone described a hat=
 as
> >>> DTS file...
> >>>
> >>>>
> >>>> E. we know that by chance you have found a base board that ignores t=
he=20
> >>>> standard.
> >>>>
> >>>> Your patch 4cce8b2503ab5 made my standard compliant baseboard unusab=
le.=20
> >>>
> >>> DTS of some board is a final product, so it cannot be applied to a
> >>> baseboard, that's pretty messed DTS tree...
> >>
> >> The cm-lite is a rpi compute module compatible device, the base boards
> >> don't have any devices on them in a lot of cases and just provide
> >> physical connectors, so there's no point having a distinct dts for eve=
ry
> >> baseboard of that type.
> >> https://www.waveshare.com/product/cm4-io-base-a.htm
> >>
> > I saw the picture and it looked like it should never be a DTS, because
> > it is not usable on its own. You cannot run it.
>=20
>=20
> ... although what I found earlier was different. I typed the model name
> from DTS "Milk-V Mars CM Lite" and it gave me this:
>=20
> https://milkv.io/mars-cm
> which misses the "Lite" suffix.

Lite is the same thing without an emmc.

>=20
> What you pasted is called "Mini Base Board (A) Designed for Raspberry Pi
> Compute Module 4" and it also does not have "Lite" in the name and
> picture does not have the SoM.
>=20
> I am confused now and I do not know what the DTS "Milk-V Mars CM Lite"
> is. Answering to this is crucial, because it determines whether this
> particular deviec has broken-cd or not.

It's an Raspberry Pi compatible SoM, what you linked.
I was linking to the kind of base-board that Heinrich has, to show that
it pretty much is a connector to the SoM and the physical connectors for
ethernet etc and nothing else on the board.

The dts was done the way it was, IIRC, to permit using overlays on top
of the $som.dts file to describe the minor differences between the
pretty trivial I/O boards, such as the one I linked to or the standard
RPi one: https://www.raspberrypi.com/products/compute-module-4-io-board/

It's akin to having "jh7110-milkv-marscm-lite-generic-trivial-base-board.dt=
s"
which I think isn't problematic. There's a jh7110-milkv-marscm.dtsi that
is what actually describes the bulk of the SoM.

> Arguments that something else has broken-cd, thus you add such property
> to "Milk-V Mars CM Lite" are obviously wrong.

The argument is that "broken-cd" is the standard for RPi compute module
baseboards, so the rare baseboard that doesn't do that is the one which
would have to use an overlay to function.
I think that that is the right approach to take, in a world where having
a dts for the SoM is permitted.

--IpEh6h8ktcVqjQnK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacZ1KQAKCRB4tDGHoIJi
0sAGAQDcgloPzO/VZ01ZRQbO/tRekbC2ImvByO2EdV2ztg8U9wD8CpD9NDYj+Ipu
Lwuplu0NSQMIhpvD6Co18e09DjvbQQY=
=ULM2
-----END PGP SIGNATURE-----

--IpEh6h8ktcVqjQnK--
