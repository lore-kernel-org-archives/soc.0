Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF58C636CD
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 14:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 557D1C4339B; Fri, 10 Feb 2023 14:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9605FC433EF;
	Fri, 10 Feb 2023 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676040683;
	bh=PPvltjLDgZAgvSlBIu7JZLk3SiwG0gVQkc8PVLV7FjQ=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=IpNQsA24Tlt2+hbp5+zgQitHahpLK1D96mLY91NiJMY5Qfpwgw1Ae/y/QJcjVdMf3
	 NFfkfwP9q82D+rcD9JFTLu3kvIGLE2cFHDXWp5UaHCIti9amCbkh9UdqSycbwjmu7L
	 Ib9Uuw/5b5nKJls3FPwqr5gpclPgzjwzGFbqSsUfqcfa7l2mREYFSVRgBAEdHTxD/8
	 f9wPiKscP7X88vqOTaJiK4IV/3dcK4CpmOishg5n92EUdxVITzDbJJi+sEmKbdWV5E
	 DdxjNfpfzNjVKBqa8tYku/xFOmfarE+xPQeCiCw5yXMVoo8FWgwlqtCTLuOHyv9J8U
	 qZN6OTPkvcgIA==
Date: Fri, 10 Feb 2023 14:51:17 +0000
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
Message-ID: <Y+ZZ5XFUT/Bw1lDj@sirena.org.uk>
References: <20230203-arm64-defconfigs-v1-0-6d0d03a6dbd2@kernel.org>
 <c67dff61-37a8-49a9-855b-c69fcf275f59@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CzUXZ86Safs1A8K7"
Content-Disposition: inline
In-Reply-To: <c67dff61-37a8-49a9-855b-c69fcf275f59@app.fastmail.com>
X-Cookie: Brain fried -- Core dumped


--CzUXZ86Safs1A8K7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2023 at 02:34:03PM +0100, Arnd Bergmann wrote:

> I definitely like the idea of splitting the platform specific
> options from generic settings, that seems extremely useful. My fear
> with your specific patch is that this will lead to the config
> getting out of sync because it is very hard to compare the
> contents with the 'make savedefconfig' output, at least with
> the tools I usually use.

You can do a hack with removing all the options that are defined in one
config file from another but yes, the tooling isn't ideal for that right
now AFAICT.

> I wonder if we could get to a similar result by having 'defconfig'
> still contain all platform support, but then use a fragment to
> turn off most of the CONFIG_ARCH_* symbols which in theory
> should also disable any platform specific drivers, provided
> they have the usual 'depends on ARCH* || COMPILE_TEST' guard.

That does knock out quite a lot of stuff (about 2400 options), but
there's still a bunch of widely deployed architecture neutral stuff -
it's about 25% of the build time of defconfig for me, whereas the
virtconfig in these patches is about 50% of the build time.  It's a=20
combination of widely used IPs, subsystems that can't be used in
mach-virt and off SoC devices.  We can obviously build on that approach
though, and 25% of a big number is still a win.

> A related fragment we could have would be to configure anything
> as built-in that is needed for booting a typical Debian rootfs
> in a virtual machine, and then just run 'make Image' to boot
> that without having to even build the modules.

That should already be true AFAIR for defconfig, I don't bother with
modules for testing on virtual systems.

--CzUXZ86Safs1A8K7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPmWeUACgkQJNaLcl1U
h9BJGwf6A75vP83EcP3RUe4GNPerqA0vg3gRmyYxVNqcO7yXOmqNKb8874Oh3HID
s4/VS7UvDJ8JoJHDYUZFTuLcVq/CGhBzwNka7M5jDgj5HNzDlGuPqsmELMPyj3Lh
81IiT1U1oxviHqO3qLvYL5TBb7XeBUgYlxCsL8ABSedmATErFrLZjKBcLsaYNwdC
5N/Zf71Tpzq+zobJwR2/+WtibhowK8L1nqkOB6jvebxNvxug+LQaoknC7HStl20N
kFQr+uS/wbSXsbA1jNV0uKfv2kLg92RCpm7B6N2tKyCKVTbs2rptdVJlZDVxxA6u
9wit/LSNAsYqudVfQDlu/Y4e7aBWDQ==
=oiKv
-----END PGP SIGNATURE-----

--CzUXZ86Safs1A8K7--
