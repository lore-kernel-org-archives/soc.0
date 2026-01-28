Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E4C2F744A;
	Wed, 28 Jan 2026 20:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632020; cv=none; b=UY2QS123Nv2YXEfYMsT++x2pV4OC0e6xwEX6Utf1+1LkylCyU3ErO+eothaC7HbwQUhCL0wtu8hHUulQ4NpcxMW8ZmmWAFuFhlGCrSVo8MpJTPt2fWuZnhvhHhnG+HVwhmhHK1etR6j9lZSFAxtiJXtP3+5FLkTW59kFA7BMXoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632020; c=relaxed/simple;
	bh=b6gz1XBjPf04sgwYHrQIGJKnkHkxyFX7yYogGv5x03k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h+Bi6f/tep/zPtKurb/0icSM2cBpr884aMfWNMwloWbXm/wHPTHv6C1WMncHVUlUrL6lYWU/1OCCwaVwEGFRS4NFRtFgkVvWJMscUmcb8Usm1JOC+fb3hqMkzDFSk8zO36Bq+FH8cOu8aowBVqDYRT4wA5CF5MMkGdVHgPFurW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pN+boUZX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pN+boUZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEF9C4CEF1;
	Wed, 28 Jan 2026 20:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632020;
	bh=b6gz1XBjPf04sgwYHrQIGJKnkHkxyFX7yYogGv5x03k=;
	h=Date:From:To:Cc:Subject:From;
	b=pN+boUZX2kUDXlClswvssS7S5Nzs3+cs6hhzPTqIAA9Quh/+1QR6DYY6RMpcedHnI
	 F5cK9KSk9e53rWsdlj1VanRnS2mXYFksU618i7ScYU6ZXxrtpq+4ShMHo7npecLVRD
	 WGvrHe5rVdBX4pnFbOBBdQBMnMuo/QVluC+QQeSZ9YaK1FrVSPjEhR94fgRggWwzd2
	 Viwo7AJI7wSpiyeCBe6zvpkN8Hs0onTAXd3v4DcOZIWqRV0qAT/c9/wk8JQNRdofke
	 GBpX6sNcIGYSKx5B55izAF7n63wjtE5d/migu6qP3VRQdsMW7GLg+P/3yD7xpIwTN5
	 4IewLO/GeRQxw==
Date: Wed, 28 Jan 2026 20:26:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the arm-soc tree
Message-ID: <aXpxEDH9VZy8eKMm@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6DSN8mlDYdW7LibP"
Content-Disposition: inline


--6DSN8mlDYdW7LibP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes tag

  Fixes: 714a80ced07a ("arm64: dts: mediatek: mt7988a-bpi-r4: Add dt  overlays for sd + emmc")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--6DSN8mlDYdW7LibP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6cQ8ACgkQJNaLcl1U
h9DnhAf+KihlkZnpIRnad5K86TkWu+tmz8XuEQu6Y1yTadORP/nKKClU1HuY3NKN
D1NZBe06arTPO24b2iFIBGIMmoIpwB/rPHfczbS2KURURBI7Wb9vF2UUTDvLOIWS
Wsuean6/msQjyqFp9CXJO+WDIC0v9VEzbZ6mszQ/52KIyUut09Mq6SKwAa2ZHylT
3l1Rk6K+N02T8VTT8wIfeZ89t9tFduycqCfk4NIFp+LnDeqiNp6Zfh6NEMUW9jL2
TrV6BlHrVEt6BGOPDRA3C3aIKt82XUeASzV15I8nobtvMqsZTLbS3XC9xeSlzZOl
UWrPG4dbSUQ1i49UZIajw+C+p+ce1A==
=3Mmf
-----END PGP SIGNATURE-----

--6DSN8mlDYdW7LibP--
