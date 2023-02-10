Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D39BC05027
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 15:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE649C433D2; Fri, 10 Feb 2023 15:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31535C433EF;
	Fri, 10 Feb 2023 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676043450;
	bh=FRy96nD5c1SzZmyz4HC/kFO04B5b4qW5UfIkYsHYbUE=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=nsYZt0T9KVUpE3NuFBvt7c6o6xQXqEjdJk67IOK8Y38EHKBa7AsXeC69rFKMeT9NX
	 eoJRHl5aOhbt5uX2tjhNkFEY13GQXK+62YDs8m8/qpNZZOpHLNF8TnRPb6C7feEXXR
	 830PSmam4AsM755O4G3B90+XXn6Y22EyR+V+ffgcFQBGfMT7JfxBX+bS3/CJYIcXXr
	 0SX7c8YZ+M2njD15kzKFdNLNhk8Dzagu0TwtayLtwTQ9M1nj/BEKt4uUtxj2ACOFza
	 NPAI/9J1nAaImas7uAOL/FUlkjw4Mo5ORmU73UOfkOwIohrtXO7EuX95ms95EAgVxN
	 XKhUm73Sdglzg==
Date: Fri, 10 Feb 2023 15:37:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, soc@kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: configs: Provide slimmed down configuration
 for guests
Message-ID: <Y+ZktXBAXouDriwA@sirena.org.uk>
References: <20230203-arm64-defconfigs-v1-0-6d0d03a6dbd2@kernel.org>
 <c67dff61-37a8-49a9-855b-c69fcf275f59@app.fastmail.com>
 <Y+ZZ5XFUT/Bw1lDj@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XTbVySs69WGQWquA"
Content-Disposition: inline
In-Reply-To: <Y+ZZ5XFUT/Bw1lDj@sirena.org.uk>
X-Cookie: Brain fried -- Core dumped


--XTbVySs69WGQWquA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2023 at 02:51:23PM +0000, Mark Brown wrote:
> On Fri, Feb 10, 2023 at 02:34:03PM +0100, Arnd Bergmann wrote:

> > I wonder if we could get to a similar result by having 'defconfig'
> > still contain all platform support, but then use a fragment to
> > turn off most of the CONFIG_ARCH_* symbols which in theory
> > should also disable any platform specific drivers, provided
> > they have the usual 'depends on ARCH* || COMPILE_TEST' guard.

> That does knock out quite a lot of stuff (about 2400 options), but
> there's still a bunch of widely deployed architecture neutral stuff -
> it's about 25% of the build time of defconfig for me, whereas the
> virtconfig in these patches is about 50% of the build time.  It's a=20
> combination of widely used IPs, subsystems that can't be used in
> mach-virt and off SoC devices.  We can obviously build on that approach
> though, and 25% of a big number is still a win.

Ah, now I try it properly I remember the problem with this approach: the
tooling doesn't like turning off configuration options that were
explicitly set by the base configuration:

| Value of CONFIG_ARCH_ZYNQMP is redefined by fragment ./arch/arm64/configs=
/virt.config:
| Previous value: CONFIG_ARCH_ZYNQMP=3Dy
| New value: # CONFIG_ARCH_ZYNQMP is not set

It produces the expected result but does so rather loudly.  It looks
like those warnings have just been there from the start and not thought
about too hard so we should be able to fix the tool though.

--XTbVySs69WGQWquA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPmZLUACgkQJNaLcl1U
h9CA2gf/fPurlq+BjHuNlhZnIbNFx+KoB6OOuX0iCBxGEMzlZhnCESnF99CffhZE
TDvz8kRnpl8YemTE5ICmgtNxPA9VA4MtyBJvsDuu263m2LUJRcAny0/v35dpPbA4
yjIIELqugHXTsKv5LKDKIfBW4bC7g8+RPHCaZEyVBu/EJCK3+xzOaauCM67iSBQr
NEkgkZ03q/RVuMkTGRMShAf2ivC9FIxpd/fWkaX3Yk5LcfK+VGV6EooiOzLZHSXL
Xq4/t38EJH3kZu8OTXH4MZ9zpelRA4GtJFf5selPF4BsEilA2XzIiwIPmERHLHDh
f0Q2ts+bOZRNl8d/STNiecSRXaZ5WA==
=iU1G
-----END PGP SIGNATURE-----

--XTbVySs69WGQWquA--
