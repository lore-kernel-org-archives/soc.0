Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091A8233927;
	Mon, 13 Jul 2026 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783964160; cv=none; b=LWNUej1GpaG+KJwV1Rr561Fx4QV3mU1dtf9RaBT/btI+c+cs5NRm+2tDqR0LeYA+lB7uE2dwQ0ht3nhgRsYCbQoKD838dIY7VoEPetPuYVraoJU5ow475cVZLj1+mlEhR76rB8pwxziwq+i2WqRHfvXbbbPFrTIvEYsoWpvfkgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783964160; c=relaxed/simple;
	bh=RWYgeB5KHd3Zfe0VCHDCOtsmZ1848gwCHPeYEeiUftU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZi0Y2C42N3v4jbDzArtMZmOHBK4ZcTY0yNSPlbDxNvFVoqaL1bIPaseRCgUSEd71XLbNpOu4MajxOmgH/HoHZifuF/SOyF6ZlPHG68nnvFqXfEyp7Qr+L+OpokEuAt0Q5BUG4iIK53WmPxoPCuXY4aAcJf/W82IdsTc9aIYeX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0zOCaNG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0zOCaNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D922B1F000E9;
	Mon, 13 Jul 2026 17:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783964158;
	bh=zRUyF1ctnKeaVshS9LdnIzYsBUOroWoyFeu5IMK8cd4=;
	h=Date:From:To:Cc:Subject;
	b=S0zOCaNG0IdAm1Ig3jPdJ3FzCCgTE5VBJvIkdvU13DpV4iG99Mbtgcfa/mj1dNAYF
	 nBfEb8p9uHBz3yvCfmy0qesj6GivWuPd9J/mu/CWIRPhfmCC9jOW/Oao8D+a9Lr7iF
	 nTF+KDyVWLZnXQ56IKDQF4VnWyMH+q6lnqOK3gJrbfjKLpt8VgU0WlydCK/U8Gg/yT
	 t+dv5QEZbtEhbq1s5gl/tfFwRxSEtoVL86X1kyvRVHJlIQnl6AnkATWKxzNKfiEqPk
	 iSHiQLniY+EKb/DrU6pGEzBW7xHYspFCmjgCtViIz5UOwllk50+pUmGrvf8pl+4bsP
	 ycD+cj26/eYyA==
Date: Mon, 13 Jul 2026 18:35:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the arm-soc tree
Message-ID: <alUh--gXbJNcbmuV@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6EpeWvc7BdVyk+nq"
Content-Disposition: inline


--6EpeWvc7BdVyk+nq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  923588dd861ba ("ARM: mark mv78xx0 support as deprecated")
  3a09d8c6b3688 ("ARM: mark axxia platform as deprecated")
  fa431f73cc18a ("ARM: mark Cortex-M3/M4/M7 based boards as deprecated")
  fd0148ccd1d8f ("ARM: mark footbridge as deprecated")
  faae50ff70799 ("ARM: mark RiscPC as deprecated")
  25592ecf80a17 ("ARM: mark mach-sa1100 as deprecated")
  7a9d2a5cb68f4 ("ARM: orion5x: mark all board files as deprecated")
  a28d72f93f209 ("ARM: PXA: mark remaining board files as deprecated")
  bb09fdba36e19 ("ARM: mark ARCH_DOVE as deprecated")
  337de957c1166 ("ARM: mark IWMMXT as deprecated")
  09b6757da5976 ("ARM: update FPE_NWFPE help text")
  8b0e28c2792ec ("ARM: s3c64xx: extend deprecation schedule")
  ef53a06103114 ("ARM: update DEPRECATED_PARAM_STRUCT removal timeline")
  ed1dab5e08938 ("ARM: mark CPU_ENDIAN_BE8 as deprecated")
  4d9226b820c16 ("ARM: turn CONFIG_ATAGS off by default")
  e61f27ee54497 ("ARM: deprecate support for ARM1136r0")
  07c06fe4622bb ("ARM: rework ARM11 CPU selection logic")
  a82f541ab97f0 ("ARM: limit OABI support to StrongARM CPUs")
  4122589d5488c ("ARM: use CONFIG_AEABI by default everywhere")

are missing a Signed-off-by from their committers

--6EpeWvc7BdVyk+nq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpVIfoACgkQJNaLcl1U
h9BX4Af/TgspL4pbH4R1jngAbgMQXyywyssLayIswa5p//GU9xhdvlNsH5g1dbMM
b6CXh7GnUulLCbMR7EtSS4X5RwySntuVCbt637BnBtAU2UfS21/jRvyq/zwnN1hE
QZyWIiFsckVNo1l00F8Vb1Yeaaxp3nsKxcVParvwa5PapvauKokzhH7yo0BudsK5
DhSefKguR+wGSCnos5bsdYkZJIVADv8E/AZEOPXfYvK39s+zSnT4d5K20BRLiTEN
zJ9JTRHXSls8KFJF7Yp8HT0lFteR+LL46x8CRIPgkCyyPyYNsAL7/PcSG26sq7lr
KY+QLf5IrWPWv5NBKKwsox24ikJCag==
=Ayta
-----END PGP SIGNATURE-----

--6EpeWvc7BdVyk+nq--
