Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FC2C3DA41
	for <soc@archiver.kernel.org>; Sun,  7 Jul 2024 17:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E7BCC4AF07; Sun,  7 Jul 2024 17:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACB6C3277B;
	Sun,  7 Jul 2024 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720373028;
	bh=4r/fjz6JfKzrR0LEZ5O0zQ+ECsAhunRdItLDMwFHRgM=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=NDchqJFaFhYl/dU7GlLYcrZrzJK6tMHMISW5qLAVysVM7cN5MuLuWexuuosk33ReC
	 Ddg5AtkFSkBB3KpgxbV0ROBgWLjtVgeB0VQ6LZbqUcivsLqq2UeTuMlY2a2d4YnvJx
	 9AhSxUiPbdEaKI1L2014W4psY4MRVkJf5R1RBld1l9vbtUHhYnzxUnmI4jZbLSU8wz
	 JxDBYyjeTV9jV5wN7jGoQnnjuoIWzAepzmcqWqJVGUi3/JtpldJRhjskb2mdQXr1ty
	 Z7OGOJJKsGYt6FiGUIlTBqr48ujHExZZwEVmFqPfHV77OAv9BORhzQIoowA7R2Ojko
	 BP3Vcg5qvz21w==
Date: Sun, 7 Jul 2024 18:23:45 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V firmware drivers for v6.11
Message-ID: <20240707-lukewarm-film-8a9da40a1c27@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dzNMppHeLU5ud5xK"
Content-Disposition: inline


--dzNMppHeLU5ud5xK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Attempt 2 with a fixed $subject. I blame being sick for missing that..

Please pull a handful of changes to the Auto Update driver.

Cheers,
Conor.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-firmware-for-v6.11

for you to fetch changes up to d930eb4fdfee32e0a3e9a5c9c2af8d65857ac4de:

  firmware: microchip: use scope-based cleanup where possible (2024-06-05 19:36:17 +0100)

----------------------------------------------------------------
RISC-V firmware drivers for v6.11

Microchip:
Support for writing "bitstream info" to the flash using the auto-update
driver. At this point the "bitstream info" is a glorified dtbo wrapper,
but there's plans to add more info there in the future. Additionally,
rework some allocations in the driver and use scope-based cleanup on
them.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (3):
      firmware: microchip: support writing bitstream info to flash
      firmware: microchip: move buffer allocation into mpfs_auto_update_set_image_address()
      firmware: microchip: use scope-based cleanup where possible

 drivers/firmware/microchip/mpfs-auto-update.c | 136 +++++++++++++-------------
 1 file changed, 67 insertions(+), 69 deletions(-)

--dzNMppHeLU5ud5xK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorPIQAKCRB4tDGHoIJi
0sANAP9bG1K7y/ld1oIlIANO1X2CSkjouvdLAZI4cGnCvgF5NgD9HFkF+Ehehl9b
9cDjuyr0WS+aDzXGGqwTqrGeDuaQrQE=
=XXpr
-----END PGP SIGNATURE-----

--dzNMppHeLU5ud5xK--
