Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DDB32AADA;
	Wed, 28 Jan 2026 20:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632011; cv=none; b=Ytpx2xETSWNEVg6XrKrnXdiMXSxfblzfhT6ubxxGkSxqcouOJTfSl+CB8/s/5QDhTATxdhTW6zm90eORfFjdc76ZcrjcFUXI87n2yZRBeHffPdnI7HktQqqsWiEcPHHurmWD1XIfYlwOmSwah9O2xSamB8ozmfFDN1HO+ENm/a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632011; c=relaxed/simple;
	bh=C77+mCpSHaVxG1mzh3ENBI8IAmLY1mtzTRPSxucoY0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I2kNB3/xexwzw5YgHqLHFtFNectkHw/iVEysvrmC76LYEel70sQDBT/uP4yTuq/kgzK4gH9X3g+xBQCCNNXZYcVKsE3UfVK0qjSBIZzjIaM6VwbXHV4VtZLC/ipPUC45wndg3Z1xLYxPjpaLWgr679rs7cY7giwZ0CAkyrLDpTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P622kvNX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P622kvNX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F547C4CEF1;
	Wed, 28 Jan 2026 20:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632010;
	bh=C77+mCpSHaVxG1mzh3ENBI8IAmLY1mtzTRPSxucoY0s=;
	h=Date:From:To:Cc:Subject:From;
	b=P622kvNXKZ5DesR+Lb5vOCDAwielrUaKu4BigXxiZbDdRedzB1XOk6CyOJJJkU1WF
	 oXatT8yFfAIlUNy11s0jsG3km15HlaiWXbJfQeXe1Xlii6BZCK/VLca4CrNFL6blDo
	 LdNGjQuQZS+hiqwtr13hHk8V/8/7pK5jVzFLjG5qdefNvu5gnq0PLTxbDUUH6OfHX5
	 s8Q9hsBRv863DP0oTTgGJepoD/sYLFrBnQ1WUNthCJayqd6p7/YXGof1fag+j/uzFz
	 C2D4dO6SEFxcFH6f9GQUN0ALOK8rBtDigqjUnMkdeuYbkZ2h6+IxWVkjsWXDlbljfM
	 BchQGWvvTLzRg==
Date: Wed, 28 Jan 2026 20:26:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the arm-soc tree
Message-ID: <aXpxBvISbsMCgyPk@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JzdMEqeYdXR8lrj+"
Content-Disposition: inline


--JzdMEqeYdXR8lrj+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0516c548883bb ("arm64: dts: mediatek: mt7986: add dtbs with applied overlays for bpi-r3")

Fixes tag

  Fixes: a58c36806741 ("arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc  overlays")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--JzdMEqeYdXR8lrj+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6cQUACgkQJNaLcl1U
h9ANlwgAhGxk6OcE9IhD5vC/ttlErN6i10reTCNao0ENIfNSanJvIN4kRrgxhfQb
FDZhtX+GTAZs9HpnmjH3zp3qH+ghmncwMDUGRCTtaNEITJt9FQbgzcw4o7LI6qDS
yLatG/ySPx+Cf0ZFQTfLy0WcPgUrN5JFU5gEQ7fv4EpTXjtJ6ZhZlpAgXZMxPKNM
Lkm79qfWXN6j9g05mF6T6JAujYK7wEdEIu4p7+UpxmsrTDuIe5svX5B2jAu75/NB
kVE9GPglqWlYF9uPfTESLTVwnK9pJAIPR0xNACj5pLB73HXjyAoPCl6/Y79lFX8V
kHOpOFIchnOL5SstWk+RVGShW22s0w==
=IRlW
-----END PGP SIGNATURE-----

--JzdMEqeYdXR8lrj+--
