Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704ADC3DA44
	for <soc@archiver.kernel.org>; Sun,  7 Jul 2024 17:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C864C32781; Sun,  7 Jul 2024 17:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49713C3277B;
	Sun,  7 Jul 2024 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720373265;
	bh=OFczwIa8qC/88c1+uwlpiovoMIvU0lo/YpTlvmzj9hY=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=cNLgJ/JwV3S79jPtWnJIDMz2KRGizDrFFHAXi8Vfkdn9+7s0/t/I8n1YTqubC2K4o
	 vTAh3o32QwTGiupNvvIqSL9DD4JLY+qalFPu8aDsRPEDWrJkNfTSDsaLaQpVLiFNZe
	 hqSefJxJ4sLPkVqFiDJIDoQ7QTGCf6EVTdVJtVtdE19Vz3Brdd9BD/MqCEGSWnj1Lr
	 /fgG8dpuJjxKRoH6cLjGFPip+JZ/EMJRGU7stcSVipZYYa027WmXo83ysskcuAQ0be
	 EHwgkpoFlJOs1HQR5CNZGuvk6AGE4Cxb4XbXBOyUEdyXq0xKTK9eS45L4r4NSEs+7o
	 tz7+AG+hXEe0A==
Date: Sun, 7 Jul 2024 18:27:42 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V cache drivers for v6.11
Message-ID: <20240707-whoever-undesired-c5f6e96ae403@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KT7UcFXDAuTnOBPW"
Content-Disposition: inline


--KT7UcFXDAuTnOBPW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Another attempt 2 with a fixed $subject.

Please pull the addition of a new cache driver.

There's a wee maintainers update in here too, I put the series on this
branch as one patch is cache related and I have no soc driver patches.

Cheers,
Conor.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-cache-for-v6.11

for you to fetch changes up to 3d41249c1dee0fa22ebd8d27aa0a280edf943a0e:

  MAINTAINERS: add microchip soc binding directory to microchip soc driver entry (2024-06-27 17:33:06 +0100)

----------------------------------------------------------------
RISC-V cache drivers for v6.11

StarFive:
A new driver for the cache controller on the jh8100, which didn't
implement Zicbom and thus needs an implementation of non-standard cache
management operations.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      MAINTAINERS: add cache binding directory to cache driver entry
      MAINTAINERS: add microchip soc binding directory to microchip soc driver entry

Joshua Yeong (2):
      dt-bindings: cache: Add docs for StarFive Starlink cache controller
      cache: Add StarFive StarLink cache management

 .../cache/starfive,jh8100-starlink-cache.yaml      |  66 +++++++++++
 MAINTAINERS                                        |   2 +
 drivers/cache/Kconfig                              |   9 ++
 drivers/cache/Makefile                             |   5 +-
 drivers/cache/starfive_starlink_cache.c            | 130 +++++++++++++++++++++
 5 files changed, 210 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml
 create mode 100644 drivers/cache/starfive_starlink_cache.c

--KT7UcFXDAuTnOBPW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorQDgAKCRB4tDGHoIJi
0iTyAQC6E5jYycKU+W7zDH3Kc7JAcmcrw06+Um3pNJEHi3T+/gEA6V2PtoEkU1Al
cYhBwKBi41JgCH/GmSmCHGT8I8TXkwQ=
=I61w
-----END PGP SIGNATURE-----

--KT7UcFXDAuTnOBPW--
