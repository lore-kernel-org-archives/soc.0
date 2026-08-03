Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0669B40DB5A;
	Mon,  3 Aug 2026 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777962; cv=none; b=bmoGO3n80eMnL09pJw6z0jlt70MCxAxekmQenMQJrajxkjT9xFP/qgHB2eKreBARHpvtjIkfxH7MJEnVQycsQXilxIcpDvBrh7hS+pEGuNUuzvUnDzW4dgZP/V37Xdg0gjdvuxAuoCOCnKzGi+YWfNxE8mQST1Eowg5mle2NMYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777962; c=relaxed/simple;
	bh=d2hGcTcHsu+OuR1fDXz1oPiEChcDx832vWiS8P4b7Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUmbIQX2KLHwZL6gYJTEAYbdAGWO8E9ouUqKgXFdsBoHOeLBOTeozQrZl71ic1klZPQShRD/yNwn7RhEutm/9vDMUJyC/W7kFb350w+Bzt2/f/kgPJdLY2H91eyB2cTZQzZcLElKPmIOhAUxi2mPLGz/4zFQZrCi6EDod93PfYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEnI9HfK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEnI9HfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04A01F000E9;
	Mon,  3 Aug 2026 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777960;
	bh=h3SpdjXPKUCNLo24kjga6L/Ssi5ZLwKbFa4rjRscvJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IEnI9HfKkpjRQ7FBonhaeSHLJEYZsajgJz8C1uwVhzD6d0+pEAa7W8E7by5vsffQZ
	 qi7V19ChFrCm7tXWfBwP1dBvOANwdyVrOmwN7g5p9d8H8FH4ShYvSsH0krFsewPb25
	 Rj8QCRt3yVf9nRlQ+T9vZazbHxM+jfeFyzAk405rAJJ+X7yH0PeWsdPdSGGmR8zMc0
	 8yDJPywqui2WXmlpR1DePA2Ax6oVhD5xp9MCZLq6M+fF6fgb11MKhEbefGIAxXFQKt
	 7C+LUoyQ4vc1TD2NXey7+dm4GnexUwotcutt2orbs5udEIyiT8i9p9svUneCHrJpYN
	 OV7dw43rc2dAQ==
Date: Mon, 3 Aug 2026 18:25:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the arm-soc tree
Message-ID: <fd352f58-8100-4b0f-ac8c-25b08d0e2886@sirena.org.uk>
References: <amY1zEUOGFe4Op6W@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a/qBI8WET/XRgLSw"
Content-Disposition: inline
In-Reply-To: <amY1zEUOGFe4Op6W@sirena.org.uk>
X-Cookie: We have DIFFERENT amounts of HAIR --


--a/qBI8WET/XRgLSw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2026 at 05:29:00PM +0100, Mark Brown wrote:
> Commit
>=20
>   3edcea7f0413e ("Merge branch 'arm/fixes' into for-next")
>=20
> is missing a Signed-off-by from its committer (and also isn't showing up
> as a merge).

This issue (and the matching author signoff) is still present today.

--a/qBI8WET/XRgLSw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwzyQACgkQJNaLcl1U
h9C/NQf+M8AGrbnIjoyWKgUSJoElsJ59EzhP0JeCdjKMzuk2oiDSIy6AuPzPgYmF
kDUpMexgaDv88CTjfmAsJhOR8J2gJWCyLFE3dHRQD8caSHKq5Q8jSHyh6U9CG8b+
eWuQ9CizHP7O3Ixr9a32FHYTgZ6i5vr3eXR6MQzf+FnlyKyn2BewsQjs2vVaEjuz
31MkhwLeNg1FZSVn/gF4QA5cvASyxDMgUCwMLRbJ5sLXLOHg/rdoqOxlH8JSYA7w
VFXLtwEN1syUiDwGvepsh8E4F2c+DhyBdk7sVCP7cZ3jG429NXATb6YcWzC4GPEw
bPtPFoarDccExGJa2jf9FamfkQ8tmw==
=NNSU
-----END PGP SIGNATURE-----

--a/qBI8WET/XRgLSw--
