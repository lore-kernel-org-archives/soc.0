Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564E8281530
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253213; cv=none; b=Xm9K5DmiYhLp231juu56CBNMptpP2DCjzfn1J7OCbpF/TTCkVlpn5RKxSpACd5LZF16nXUhQeIVAu9WwfopYDkQUYFZXGVFh53z17VWyZuUH38CZEBXOlGM2cvuAB1enaJ1KaOutPVQ4GFH1U9yGsclxP15de/DCIu1yZYreSxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253213; c=relaxed/simple;
	bh=uysIVLJZCztAEjwOmQ1P4sUtYrAXTBRfvn++kKXbr/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcvP3m7RwI/MYgweUaKo2SZrmT+j587p9cQLBZQ/m9pkxxNr4qVJq2Y78b5RBN+wtz9fhQCL/ni9XzyU+h+0QgrYA5LO4V49mFefajeKsBSdwqYmdFOwfE2Mevnkrz8ZS4tf5MevCSkhtlz5TViSJiFA9lXCvLYuTz6g7OnX5NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pclsxn2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pclsxn2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E86C1F000E9;
	Fri, 12 Jun 2026 08:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781253211;
	bh=uysIVLJZCztAEjwOmQ1P4sUtYrAXTBRfvn++kKXbr/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pclsxn2qV8+X09bknAUQ+SrEdIONPw23DIvncL0pKNQ6Lvsfnkie5q+iJBNC5tu+Z
	 0SgziNuq1XJ+JLTjJvFbGeL/fjiLeu2swLvvqbCCr+qqkahDHvz5r2i4AvaBc7V5wf
	 UHYboANEP6oQL0a0Y79g32gAMyDntBIyi60WpZjORQncNfU5wXLXS7Gt4niJ3TQRgP
	 vplhb78u06EcUozFmGQoXxOIlGrj/43+D2df+UuhkOwEU/903DodMxugcha/b7nqGy
	 U4GbjzXcppTMJ6Oi4+sK7R48rU3421nWbtzrJ2zobIsAsWhMIXY8Kbf3lC66+BNFXP
	 9yaZHSRMzK93w==
Date: Fri, 12 Jun 2026 10:33:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	Andrew Davis <afd@ti.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
Message-ID: <20260612-indigo-sparrow-of-action-d2bcbe@houat>
References: <20260527084135.842736-1-mripard@kernel.org>
 <422d7885-67bf-485b-b2fc-f0604a2213db@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="k6fbkuxqftgx5kce"
Content-Disposition: inline
In-Reply-To: <422d7885-67bf-485b-b2fc-f0604a2213db@app.fastmail.com>


--k6fbkuxqftgx5kce
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
MIME-Version: 1.0

Hi Arnd,

On Wed, May 27, 2026 at 10:50:02AM +0200, Arnd Bergmann wrote:
> On Wed, May 27, 2026, at 10:41, Maxime Ripard wrote:
> > Now that the system and CMA heaps can be built as modules, enable both
> > as modules in the arm multi_v7_defconfig.
> >
> > Suggested-by: Andrew Davis <afd@ti.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> I'd like to wait until we have resolved the build regression
> from the earlier patch[1][2]. I don't have a strong opinion on how
> to resolve it, but at least for now Christoph is asking to have
> your change reverted.

I believe it's now fixed, even though not through a revert, and is on
its way to Linus:
https://lore.kernel.org/dri-devel/c7a9dbb0-a5c8-4e67-904e-1a52b3de9bb4@linu=
x.intel.com/

arch/arm doesn't select ARCH_HAS_MEM_ENCRYPT afaik, so this patch can be
applied as is I think?

Maxime

--k6fbkuxqftgx5kce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaivEWAAKCRAnX84Zoj2+
dhbrAYD57eZvBH+cq/9LQsd4gJLdQvbsUYv+8mvuMwFJqmH29XiZIYC2+xR9vKBH
kYgzUY0Bf3dDq0Lq213J5Koi7mI204icy6ip1jDzU6Gtbio65G6J5VFQUjBMY9yA
XCBekGbweQ==
=H72z
-----END PGP SIGNATURE-----

--k6fbkuxqftgx5kce--
