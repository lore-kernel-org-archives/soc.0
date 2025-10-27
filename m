Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158942C3274
	for <soc@lists.linux.dev>; Mon, 27 Oct 2025 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761576611; cv=none; b=nv8UYJWOye0UX86VDkxwZ173aUGHd+4K9iVqXZB6PCVYS9cUCsLpzH11iAPRl+o2mYRiMrjZLQ+Unpsxdh5UMSF7b6oKpTe6tki/ZwkZOxGm1qyTgAwXcDmDA6EXDrhWOxpha22QelK9kX/w/nHudXRTLiQx8XojdY8FfS+LxE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761576611; c=relaxed/simple;
	bh=FE3hWpfbYIAESQkCdu8paBkJdZ3DdO9pXcI6pCl6tOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHNsvAhQG62OqAb4rXAXYaDLCcqheC+e0vYJAAdx7QHsTP3VuYvE6CVMn/O2/T4KdsYPIRexFnjgcCImYSnDu3uQ1WyFiguuGXEySAI2v0+l2LganqWgO8/nu5BQFdiJd+1Ae0t82ZqHYCWClIXFv/QLQPW6ys/BmRkzVle3wVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcalxHsv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcalxHsv"
Received: by smtp.kernel.org (Postfix)
	id BD797C4CEF1; Mon, 27 Oct 2025 14:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A201C4CEFF;
	Mon, 27 Oct 2025 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761576610;
	bh=FE3hWpfbYIAESQkCdu8paBkJdZ3DdO9pXcI6pCl6tOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcalxHsvXSgErORlqVI3RUUOSmgY9D3IyGJsIkB4moAiYgwYmTxPHLwPtfUk0n2OL
	 5y6rtH7GtfFFSxXxdDuioyGhvOXmZpKWhXUnXpGTvN6etosNcams+0KeNaSIKqnOEE
	 GzxpYkPoVskissdwGhNd8AZMSf24d0wQR+ZmUYqw9HVcp47S3nkz6z4kHPxN/9k7G+
	 uJ3n30FUUr18ng60PjJvBufjo7kKFr1XhS+xjtRI5yTy7IAZus4DbgBPUuNlNnq3F5
	 vo1LNJj3vrcdYS+JfWKnbvBCGBDIYuvV1uzP6bkRk7I646+/i2DendFjoeUdpjbAfw
	 P61k8Iw3Bcjqw==
Date: Mon, 27 Oct 2025 14:50:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>, kernel-dev@igalia.com,
	kernel-list@raspberrypi.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, soc@kernel.org
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
Message-ID: <2458083f-25a9-41a5-a2a6-2343e7402701@sirena.org.uk>
References: <20251005113816.6721-1-wahrenst@gmx.net>
 <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uyIigU5Jew+IUWXr"
Content-Disposition: inline
In-Reply-To: <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
X-Cookie: How do I get HOME?


--uyIigU5Jew+IUWXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 01:09:49PM +0100, Mark Brown wrote:
> On Sun, Oct 05, 2025 at 01:38:16PM +0200, Stefan Wahren wrote:
> > Until commit 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off
> > when preparing/unpreparing") the clk-raspberrypi driver wasn't able
> > to change the state of the V3D clock. Only the clk-bcm2835 was able
> > to do this before. After this commit both drivers were able to work
> > against each other, which could result in a system freeze. One step
> > to avoid this conflict is to switch all V3D consumer to the firmware
> > clock.

> I'm seeing the GPU start to fail probing on the Raspberry Pi 4 in
> today's pending-fixes:

> # # v3d fec00000.gpu: probe with driver v3d failed with error -110
> # not ok 1 +platform:fec00000.gpu=20
>=20
> which bisects to this commit.  I'm not sure if that's just a preexisting
> issue which is now being properly detected or if it's an actual issue,
> I'm not testing the GPU at all so I couldn't tell you if it was actually
> working.

This issue is now present in mainline.

--uyIigU5Jew+IUWXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj/hpsACgkQJNaLcl1U
h9AMdAf/aU3Ii257L2u1kqcyUERQx4ZKdMtKxsYKCxqla7DPkzrEMiqFMlwLsBj0
KdRyRCklCX1o0DXb/evMro0kMjmVDKVFnUvofZqAzNn2yXNTmtl0sNtmDC6cP4cR
UhvDkCpM/eWE/A84r4i0SvX/cATbGIQ8u7dfGb6HWc2vNwuu1GpQMf/brOqkGEbB
84ELNH+hsji1BYetV+1cuE+7K6RnhfLkRtiArRuSQK2XcIv1SNmMzCgILY73b56Y
xdzjnCjFWpemIWP1ONuZEtttzqSn3YuEOashCmYPofVZB0TLeQTaSSUEBSNXsjfJ
hReuwEPZTI4FOERo3wcqn9roGDmdsA==
=vhsL
-----END PGP SIGNATURE-----

--uyIigU5Jew+IUWXr--
