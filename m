Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1317C5B54A
	for <soc@archiver.kernel.org>; Wed, 28 Aug 2024 15:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85538C51595; Wed, 28 Aug 2024 15:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A30EC51590;
	Wed, 28 Aug 2024 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724858803;
	bh=ZoERSQbjaOWh1gtlRlRypBVPk3FVstEDzvne1n0+4L0=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=gXu3J3Q6ji3pcOppqROGFvS52Itk4D2BM/KNtMctMB3kg6X+XrMJDJVVRLNkFyB28
	 l+qcMi97tg0VEJ8lJEC2/aox3OY/8G9xhzcGV4fAJddNWaIVVfUnYuyZcOkp3fLm3A
	 nIicJw+5vpylSqkXelHRUgkYOEGi3XM89RTpdXcOiTauLwjEg9v2bWza15Qqvc5BuA
	 lUm8kdaZw57XO1uLaBS5ezbGvy4iECcF4YQapHoHDxc4HZpyQoL+/LCkJI+Yj1QMKA
	 x4h1pMPhREYP9ovye66yTANtAJFOdJ0ySQWm1BG/oQzIHSclNlQmo0W3n+gd6fietm
	 gjXPC4gmRUUMg==
Date: Wed, 28 Aug 2024 16:26:40 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V soc driver fixes for v6.11-rc6
Message-ID: <20240828-fidelity-almighty-18d5434aaef0@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tkJBe2+XzIuRNfpc"
Content-Disposition: inline


--tkJBe2+XzIuRNfpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a single fix for 6.11, as things have been rather quiet on
this front over the summer.

Cheers,
Conor.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-fixes-for-v6.11-rc6

for you to fetch changes up to 591940e22e287fb64ac07be275e343d860cb72d6:

  firmware: microchip: fix incorrect error report of programming:timeout on success (2024-08-22 20:47:16 +0100)

----------------------------------------------------------------
RISC-V soc fixes for v6.11-rc6

Prevent an erroneous unconditional report of a timeout during firmware
upload in the mpfs-auto-update driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Steve Wilkins (1):
      firmware: microchip: fix incorrect error report of programming:timeout on success

 drivers/firmware/microchip/mpfs-auto-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--tkJBe2+XzIuRNfpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs9BsAAKCRB4tDGHoIJi
0gScAP497y8a5x23Y7/lmtqrptUo+066U7NdJ1/pSOB4HTaXAAD+LQRAWkVLxn4K
LG9Ha/nXoCN/9hJaQ3mRnO6VLlRfEgA=
=uRMf
-----END PGP SIGNATURE-----

--tkJBe2+XzIuRNfpc--
