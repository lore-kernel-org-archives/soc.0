Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60F2C3DA44
	for <soc@archiver.kernel.org>; Sun,  7 Jul 2024 17:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B067EC32781; Sun,  7 Jul 2024 17:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDDBC3277B;
	Sun,  7 Jul 2024 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720372268;
	bh=gpTwWmvknrcSzqHHR4kTECWm3tNiLqZgFbWoTnP+b84=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=uMVGdK3ICV+VFpr5VOLY2wKGjC1rw5pmYy7BJwZUhBIqZp6poucepMyjVLBM9Pj1v
	 5OzSezuVO84HT3ZmzgfYb8JTw+0/FjPbgrD1Sysa1jJGaznDyMjKNRVxwEYUpzWgT6
	 aDX4u3CA27FO4HGaCY1pxualt8aajOsAFBRimefJZ0g/Sx8jCsJAm4k8jnbtldC094
	 hqMPeWmbYLK7k63dgm3vZgNGKC61slef5lgbOSmWPmg/OoBC6XsZPAABKhx+XEZhB+
	 n5HdOd/F37D0IZ6SmXQHjusrqC+lZDlIe0O9o7iY4NJYdrxlhzevOz01WI6WK5ey6R
	 nv4bPJJFQGBWg==
Date: Sun, 7 Jul 2024 18:11:05 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC drivers for v6.11
Message-ID: <20240707-getting-unhealthy-bbb3c67346bb@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ri8/7/7BqJ3GSS4x"
Content-Disposition: inline


--Ri8/7/7BqJ3GSS4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Single commit here, I discussed with Palmer about taking these defconfig
patches for board support etc via the soc tree, so we're gonna try that.
For now, only one commit here.

Cheers,
Conor.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-config-for-v6.11

for you to fetch changes up to d8a7d89abb091fe4c1744241c7a40dbad570fd9e:

  riscv: defconfig: Enable StarFive JH7110 drivers (2024-06-12 23:16:55 +0100)

----------------------------------------------------------------
RISC-V config update for v6.11

StarFive:
Enable most of the options needed for the jh7100 based boards to be
properly testable with defconfig.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Hal Feng (1):
      riscv: defconfig: Enable StarFive JH7110 drivers

 arch/riscv/configs/defconfig | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

--Ri8/7/7BqJ3GSS4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorMKQAKCRB4tDGHoIJi
0m9rAQDSRDFBr9wyNQGIbFthyjF08NwDYmzot4/4UrCfkz2nQgEAhEV9ToaAWJCy
25375xQXWfJhGM3xwwqVd4m61HBUfg4=
=nYmR
-----END PGP SIGNATURE-----

--Ri8/7/7BqJ3GSS4x--
