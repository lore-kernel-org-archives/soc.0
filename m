Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5D7C3DA41
	for <soc@archiver.kernel.org>; Sun,  7 Jul 2024 17:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 829A1C32781; Sun,  7 Jul 2024 17:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FF9C3277B;
	Sun,  7 Jul 2024 17:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720371917;
	bh=6isU5fd4Ff8et7J99YWWb4jkt/7UfQgXgszUz1Ircl0=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=g3S9Vf5T91MKsk0d3O7rVzb6QI2+qrhTcL6L0xjavHxy0ZKmdCMn2ulyalt4Zowvq
	 RIj0zMWNiDcIE/NDkjrwue+ktPuUqLomUdJQ2rqQscAxOeCIJCjygJQEE5UM2vWd0K
	 RCsoK2WDNowysomx5TjdhB405uI9rJVzNI2b0LXIFet2PT4cWyRDdBpoGsDk/4TY1q
	 Ua9XB2OkWNZ0SmrhMqAjpx6Nelxm+xko5FWK1Hz0IWKgZ0e0vybnaTlWjGAvivSqMV
	 C5aBViwEvtBDKu4dpQW31D6jY34ky4ByQY32IAIjJtZYQMbsNbRAU7VwZQyudwyRkT
	 uhTx6jUrPY4Hw==
Date: Sun, 7 Jul 2024 18:05:14 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC drivers for v6.11
Message-ID: <20240707-hardwired-decree-cc7da3b34f68@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xGmgvF5AKXzK9lgj"
Content-Disposition: inline


--xGmgvF5AKXzK9lgj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

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

--xGmgvF5AKXzK9lgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorKygAKCRB4tDGHoIJi
0trFAP4wCehxgeMtIUbFBhtUjWWvb4WPWehGCmpjuWYSWwhcLgEA4bHZd2Dxro1s
Sw96HJ0lkKIj0o8MZDfAepbYm94eIAQ=
=czaE
-----END PGP SIGNATURE-----

--xGmgvF5AKXzK9lgj--
