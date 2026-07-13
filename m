Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C851E5714;
	Mon, 13 Jul 2026 17:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783964302; cv=none; b=pNpqymiyO+R2+XVlIG30+lDRiIXuVuAqcxnmKTW+jhbezUHOB4bsM+oHvtkSrzykKYjPIbXBaiCX1JIvM8riaVpeqKsb85QDEI8gspLGr45F0nMN6J2dIKWCeaTQnUtHnRf77BkmmjzT8GFewJ0y97pGoWWaz6D18xHQlKoufoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783964302; c=relaxed/simple;
	bh=01INAX2Y8DPYfSQsrUjrGASKwAv52d8zIuZVY59AdPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwWAPna9OY659OtCu8goaY/FQS/NRy1ZL06DFKfXSgYjaK867bpMR0F1Xk+mDbElvsxEXXECL8mYMs9o82kWsnpMl4vePZMxky0lz+PUpziloWqxmnsAiuTcfiKBKwPDkV5nEAAAUZG/WkoqGoREapIlVrgPayWHhGLbP9AjLXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eiyb9NvN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eiyb9NvN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55521F000E9;
	Mon, 13 Jul 2026 17:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783964300;
	bh=4lH49CaaJIbmJWvZ5DF9ibb3dGDWGmyp0/L1ll6qpWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eiyb9NvNxspY4/y1hPnPptNkdLBNqwUr0+23op2aHLRbkbACU3eJLfQJJzt61u/+5
	 CfCzQiihniRnGScFL+Pxtn/xGHn33Z41D4Z/JAGUn6NucOsnUcZfkcYamnws2cfWKc
	 YTsX/3FzTOKQJv/35WIErtumsxLJzTcoT9g1IfEBJ+cmUMMGxAb++uoguJvQoSf4Q8
	 AHqeev0VPOiRhwi2GBhML+Kbv1zQHzJ+tVHcgQ7ltFfecb1t19L0FuXZ0Y0cwpBdPW
	 NxZhlCyYl6BXuSTeiFKMNfQ+JNitplsa2HdGLiZlWJm4U9jjHB7S5KPNoPRJbI6KY3
	 wHHm5xwfFQYLQ==
Date: Mon, 13 Jul 2026 18:38:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the arm-soc tree
Message-ID: <eeef7a7e-22a6-4b88-b23c-cade1b62edb2@sirena.org.uk>
References: <alUh--gXbJNcbmuV@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ycI2eDvzFSQ1zZKD"
Content-Disposition: inline
In-Reply-To: <alUh--gXbJNcbmuV@sirena.org.uk>
X-Cookie: Courage is grace under pressure.


--ycI2eDvzFSQ1zZKD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 06:35:55PM +0100, Mark Brown wrote:
> Commits
>=20
>   923588dd861ba ("ARM: mark mv78xx0 support as deprecated")

> are missing a Signed-off-by from their committers

Alexandre, you did a rebase which makes you the committer of all the
commits you rebased - you need to add a signoff (git rebase --signoff
might help).

--ycI2eDvzFSQ1zZKD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpVIogACgkQJNaLcl1U
h9CwAwf/UHpOCjYOHOsLDEabf6IdBbOr+unKZMH5G5z0oE2RcLbD8wr8O7x4t1ud
UZ2+cLNrASL8qvUZXUIqzpVnvTXyQNZefWJUw1fAcS6/pCl7NFuAEDZ/Oq7hCpbQ
pAi+cD+Fj0rTmCTHNzKTMw/ciMTk15yOcBr0QFtgH5OaOTBBDRtdNdh4o91IIPbe
mFzwOCGe87GTMzSjpU9Ar+IAIYSEK3BB1vZ7FAQfYHi8i2ak68CfjhTRwCm/5xvC
Pwb67MjJFVZumKtpjtjNVC4gn/Z4xMMBJN5utbq4Ea9BACOsNEQex1lmEuYX2Vpg
FVANJIE4X0CFbNOzOtF+pthL7DUpyQ==
=pPTE
-----END PGP SIGNATURE-----

--ycI2eDvzFSQ1zZKD--
