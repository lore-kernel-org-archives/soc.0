Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE4EC35274
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 12:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B21D0C433C9; Thu, 21 Dec 2023 12:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725BAC433C7;
	Thu, 21 Dec 2023 12:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703163476;
	bh=0gL04RciAH1GJbtSVRyq/UZwV+St7gyPSP7QIFrKX6A=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=KxeDm+XMTbGH/jT4L5Vo4/35ZuW+bfgGwR4YYpbrzRAJ0XHqFV/8280JlBFlAzLFa
	 qOAYZ/6WFcFs+TJ4nPvTWkxr3uJe2TvSemryWxYXUQG+CrgGIeG1hJDxnfJpWQD3KC
	 zd2BPqYonDqgc3rm6oCEczSLRpjg5mrK2fqhUweambE8e8t0jsC5qwMHSZOphH99HO
	 sfyrxy2Dwb0dPMJy2buBewzKsVOrs5yJjQ8KxVigQgVD1b5yLRz5IC7JDqaxWGMCdX
	 TbVkgu7kpMpVxAoG7xiW3dEzZdrb+ljmVidMGScHRZkWkVaRvlgQYxYRjNda0GNDkW
	 2Bir0HpAxUp6A==
Date: Thu, 21 Dec 2023 12:57:53 +0000
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: conor@kernel.org, arnd@arndb.de, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V cache drivers for v6.8
Message-ID: <20231221-catatonic-monday-d4c61283b136@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uVYq/yheRuBdIaKE"
Content-Disposition: inline


--uVYq/yheRuBdIaKE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull the move of the ccache driver out of drivers/soc and the
addition of support for the non-standard non-coherent cache operations
on the jh7100. Despite it being an early(ish) SoC and being succeeded by
the jh7110, there's still people actively adding mainline support for
some of the peripherals etc.

Cheers,
Conor.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-cache-for-v6.8

for you to fetch changes up to 9a9e8d8d2b6e61a516cbb8a43c5cec51c065ffa4:

  riscv: errata: Make ERRATA_STARFIVE_JH7100 depend on !DMA_DIRECT_REMAP (2023-12-16 23:37:38 +0000)

----------------------------------------------------------------
RISC-V cache drivers for v6.8

The SiFive composable cache driver moves to the cache driver
subdirectory from the drivers/soc and grows support for non-coherent
cache operations. The immediate user for these is the jh7100 SoC, that
a rake of people have on VisionFive v1 or Beagle-V Starlight boards.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      soc: sifive: shunt ccache driver to drivers/cache

Emil Renner Berthing (4):
      dt-bindings: cache: sifive,ccache0: Add StarFive JH7100 compatible
      soc: sifive: ccache: Add StarFive JH7100 support
      riscv: errata: Add StarFive JH7100 errata
      riscv: errata: Make ERRATA_STARFIVE_JH7100 depend on !DMA_DIRECT_REMAP

 .../devicetree/bindings/cache/sifive,ccache0.yaml  |  6 ++-
 MAINTAINERS                                        | 14 ++---
 arch/riscv/Kconfig.errata                          | 19 +++++++
 drivers/cache/Kconfig                              |  6 +++
 drivers/cache/Makefile                             |  3 +-
 drivers/{soc/sifive => cache}/sifive_ccache.c      | 62 +++++++++++++++++++++-
 drivers/soc/Kconfig                                |  1 -
 drivers/soc/Makefile                               |  1 -
 drivers/soc/sifive/Kconfig                         | 10 ----
 drivers/soc/sifive/Makefile                        |  3 --
 10 files changed, 99 insertions(+), 26 deletions(-)
 rename drivers/{soc/sifive => cache}/sifive_ccache.c (81

--uVYq/yheRuBdIaKE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYQ2UAAKCRB4tDGHoIJi
0hLcAP9r9ufLZVUIUusGttE1oB6bJTtc0vRjp5TtpaDv3OcwRwEAkUJmIyM5IN9b
gE3FS8lsl5j5GU06/6F15kDT/s5BAwc=
=p52w
-----END PGP SIGNATURE-----

--uVYq/yheRuBdIaKE--
