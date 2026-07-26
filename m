Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343EC3CFF61;
	Sun, 26 Jul 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785083345; cv=none; b=BtdBFTAkp3HRnpzSTHuwnl25T78Erz1PBbIf2rKHxUmk+/iaE/tKn7AAiiBQeS9PfKNUlftoYjbHXsNjF4CrVhd4elxU3UOpPRnXLkWKkyD6mTQk4tkt8+nzVn9+YQjDGPL0B3mE5LpoxAhpwLen0lnTVhdjg7wOqrM6dU7GuIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785083345; c=relaxed/simple;
	bh=Q1yyPu98BObSvdAEEnsgVoPIaTcGHmOE6hQAdNyhaAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LgQao9CojS3PKHkRQP2M23VOn/si96hP8M/nlyBDIjToFhM6yVamY3PsVmP/yqKSr7kz9ygMaBuUf+gwtXpIKoNGHI8EPoiuPxflsf2A2j3QrMQtP4XPRwKf9aJVM1sdSJbJC9RD1k/jLUxcjZ03ZeevnzSgTmlY+MU5nYoAd+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcYKXLaL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcYKXLaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B751F000E9;
	Sun, 26 Jul 2026 16:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785083343;
	bh=77PZY/RRKnNhFSHQlteTWvec07eax5q/s69+2NrFvCA=;
	h=Date:From:To:Cc:Subject;
	b=YcYKXLaL9++PpQdv6eb8zndDhZxKXXugTlQ/aAD8M8zEm6aeIrV9tySVPuloWkVDf
	 ixtNADFAq5ptH2L89EWb7msAhMKbXo22ntDrbdNoOm0ZX2ue+tin3qU2Xo9k45xXoI
	 DjbYheQH4fLXxJ7hbP7q96BwuXVAXDYSSTXLgmCLERDk16nbbD0pFX0iYs/4KhAEGi
	 +lEnoEMftQt0A3mEGlwGeS0niMSiWTqD+3SP01u6jcij6IiL7uJbMXggvI0DgqJAOP
	 Xl4tjotgUWgrthS5nUQqEa3/VJNRMXZpxCheEDD4MgibAS64kuP7mgowLevx/E8AT9
	 RN1N4hB1fOolQ==
Date: Sun, 26 Jul 2026 17:29:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the arm-soc tree
Message-ID: <amY1zEUOGFe4Op6W@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DobpySCgCxM3oVoX"
Content-Disposition: inline


--DobpySCgCxM3oVoX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  3edcea7f0413e ("Merge branch 'arm/fixes' into for-next")

is missing a Signed-off-by from its committer (and also isn't showing up
as a merge).

--DobpySCgCxM3oVoX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmNcsACgkQJNaLcl1U
h9Bo0wf/TuGy5j5WpliSPK1mT8xUSOhwjtNY7dFGOOz4JFBasD7FWjM03NLhy47g
IQFQKGQa5CSOyxkq+5tiqF47bZTa+nGH4wvdtBNa4bDxqS4/WMgFbOvpVeCEtic+
LiOVmXf3jEzpuJPGfhgJgLkRXhJRmfHt9X8LgLpTtuBsLOtHCOtkqLMJA1bXH6gm
tLexD5RVvl9wDD2/wQquL4lIaSOwf67ZTDd5+8pfXKy8DfhBYDCWhP3Nm9lYBqo3
LFSxcgX7+Veu4Ru+iHoMchVkLDaQREe2iLN86SZ4JQN6Pv/Vvibc/PcJWO/X2XRp
YXlUtxxcxR5e64LOvXoAyvWsMh7IVQ==
=AAFi
-----END PGP SIGNATURE-----

--DobpySCgCxM3oVoX--
