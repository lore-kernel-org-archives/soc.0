Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62197C3DA44
	for <soc@archiver.kernel.org>; Sun,  7 Jul 2024 17:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37253C4AF07; Sun,  7 Jul 2024 17:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1D7C3277B;
	Sun,  7 Jul 2024 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720372817;
	bh=MX4MNKSjeZRri9K3RjooKv2nOI0XPcRzj3ZqAlyamO0=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=bnLhkqPpzfdD1frBb3MQJClmhauzeLIeXftUr/2dTp9x5vtp0rPAzsw093oYyyc2Z
	 +x9JVMoQysPDvHnpUZGA8COlYUQMyAcOAik+q4N4AOnHzC8igsB8q2Ob7PpomIz6bq
	 VrvgstLtUuSbdj69fnzBeZjEC4CiEoI3ZQQhw4zw7QRb3Gj6kM1zv+lxeaP0XsKVx8
	 p+e7EwZsf3n6iCchw0qphwshQ+KUebY7KLsuCz6uZnZxx+otsn7WB8kJHXq65IJLS9
	 ZRR1dLGMvsZLq1JSE8+qvNMD1rM2DiU67wcMQ9WNGo8kAYtuBAxw8S8CFjAdY3v8j6
	 n2ppJPOda4Iyw==
Date: Sun, 7 Jul 2024 18:20:14 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC drivers for v6.11
Message-ID: <20240707-renovator-coat-bfb979436bcd@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LQbIIb9DOF9VsMd1"
Content-Disposition: inline


--LQbIIb9DOF9VsMd1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

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

--LQbIIb9DOF9VsMd1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorOTgAKCRB4tDGHoIJi
0tU8APsG402BUKYU4sG18yezDQxes03LamExL1FEzqwjP2oZWAD9G5L3ffXIX15a
Wegp/0q9sPUgmCjM4DKjGhY+sSRHUAM=
=JcM2
-----END PGP SIGNATURE-----

--LQbIIb9DOF9VsMd1--
