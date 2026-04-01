Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F9477988
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 16:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062148; cv=none; b=OgQAmh+WDKmzgfPaSksN/X140DWc4H/zMPHwR+6NIX0XUhj5qrOrCIEprFZ7qDXpfuf5DzSoSeYbnDFWVdHwH8JBMRxBSCOlqQdf0EhjJx6ZkDd7XoidwIY3Orb2lcdefGgtf3LKqOPtDnHnbb1GDa69/nbp+jXRgYeSka1I8Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062148; c=relaxed/simple;
	bh=DSZwO5Mif+Vhwk6ofKHhQfQlLyhs9TiQOThWjRWUT/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tn+siya5gDVwoqRBZdlwPLO9cYh8rCpRRIyNrGNHzFb64QSfD6YUD4mKaGz9G+FapHCTFtE2hLYhunbQY/lYoQ9K3g+wP9czccbyxWUdAU0JyvNzVJNOPHtYUBUrRz/mll/4t+cApWZpOy937gu1boTchDN1YaohQkMDIv9TtnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWS3l2pa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWS3l2pa"
Received: by smtp.kernel.org (Postfix)
	id 486C9C19421; Wed,  1 Apr 2026 16:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF837C4CEF7;
	Wed,  1 Apr 2026 16:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062148;
	bh=DSZwO5Mif+Vhwk6ofKHhQfQlLyhs9TiQOThWjRWUT/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWS3l2pam6A5zd7/u5kCi+AOJ1e8nRxmkx6ILbMw2YJqwT0GyxSw8pwOpQ/UEZAYK
	 +gYucg9IxUD1Z58js0N8YqPmoHV95J5USJbr3/DDLz+ECtNsX8ANq64pzMbR9BfAbd
	 LiRgwn4CeJBbGXLkUOlnP6Jmi08FZLzzzId4AtLpafiXK4UnsuPKoUeaogyy1SVbOr
	 WroaajTS08hCSmd1HTZuQcGfveMIutSGC/SIzTY3vNFp257oepqbONx/u1xGn1bZE3
	 gT5YUTAQLKYhOSt9CY9q5CJmZ30GUWrt/HVuiraJXe17syjelL7l7509EtOAbQ8SZl
	 b3ypXgvAe2h+g==
Date: Wed, 1 Apr 2026 17:49:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Rob Herring <robh@kernel.org>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	Kevin Hilman <khilman@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
Message-ID: <510f1ba7-ce05-4e9c-9405-c49903357916@sirena.org.uk>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
 <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
 <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
 <df52b2ae-4b8b-487a-bb6b-07bf021500b5@app.fastmail.com>
 <3f7879d0-9e5d-4c00-a5dc-4871a049afd0@kernel.org>
 <83a52edc-1d46-4eaf-996e-924ed3a00c83@app.fastmail.com>
 <8d8925ad-22eb-4b9b-b6eb-6ae7dc3b2073@kernel.org>
 <e060307f-5c85-468f-8f5d-6101dc0a2015@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mE/kOQCX78MoT/V7"
Content-Disposition: inline
In-Reply-To: <e060307f-5c85-468f-8f5d-6101dc0a2015@broadcom.com>
X-Cookie: "Yo baby yo baby yo."


--mE/kOQCX78MoT/V7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 01, 2026 at 09:41:03AM -0700, Florian Fainelli wrote:

> OK, I will get going with moving the hosting to kernel.org. What about this
> specific pull request, will it go through or is relocating the hosting
> mandatory for it to be accepted?

Whenever you get round to it please remember to let me know so I can
update where -next is fetching from (this is a common gotcha!).

--mE/kOQCX78MoT/V7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNTH4ACgkQJNaLcl1U
h9Brcgf/RNCkNU/dCgw0ggR/qjiCIvomgcPtbhBSuAnknPjymUhUE6ohNzvfwsWL
Lls/qmxzVRMnVGABFsGyHB7pTeW6SPvAM3cvYm2vzvPMuG606pMqhvl+5Hwi52ty
+3qG5xBFYJIwrHHqMFnglFmFrbJyZ5ns0iBX4PUA6Mu9MA5rGFp/Sfxy3wP/trJC
UMYhwz68AOwbtitqCnwQrQnysyWboyzn8mT0IZANtDbiuOkNujRoVpLxlsbeh8rJ
Nm0a3LM/mR6Vmr9Ie1Ndx3YSia3kK6XXLP+w3OOvYCLynNqPpwaV1mXfb8ztg+rI
j80tfY5Qcm7+JHDtXtGE4FXNvlddtA==
=Daaf
-----END PGP SIGNATURE-----

--mE/kOQCX78MoT/V7--
