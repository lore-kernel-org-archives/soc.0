Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C209AC54798
	for <soc@archiver.kernel.org>; Tue,  5 Mar 2024 20:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8C09C433C7; Tue,  5 Mar 2024 20:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97502C433F1;
	Tue,  5 Mar 2024 20:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709668845;
	bh=17Wh5GpfBMEAEfVPD7Mh1BrDB5q05dVOlvQzlOBQ1Zo=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=WIwEKLv2yPKqXUuwdM17FfWIcgAcXgDfQZen/BkuiU8EFZqqHBexyB4wdHdftCQWs
	 6wb1TQknmtcvI3bLQlwbwtlMBBOAq3LZUiadSr/L/I3unjVRsRf6fu4xsZnK2VRjHC
	 jQUJFAhJ9ZXgRMPEg1rm+ViBlV1URn5vWb6Sl3yTlHJx3n12iyYNB+zSvV1wxU3vq1
	 ReS0ooVgG3FFn9gWQrlF5XUqnFzm/f8AHM03KquWxMDdD/wZZHd/z37j75w6uqRkHz
	 z9IjOh8VGwBfUZEXvyh2KzmrxEktsAlvUvYLdn6sElAZ7URzcIcC/gfKFfT5rq3hl5
	 bHZPxsDNb+fqQ==
Date: Tue, 5 Mar 2024 20:00:42 +0000
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V firmware drivers for v6.9
Message-ID: <20240305-vicinity-dumpling-8943ef26f004@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wPm0oy/W+799syCQ"
Content-Disposition: inline


--wPm0oy/W+799syCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Feel free to cherry pick this either if it makes more sense (or even
send it to fixes instead). It's a fix for an oversize allocation, so
given how late it is in the merge window I opted to send it as 6.9
material.

Cheers,
Conor.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-firmware-for-v6.9

for you to fetch changes up to af1e0a7d39f98c0dea1b186a76fcee7da6a5f7bc:

  firmware: microchip: Fix over-requested allocation size (2024-03-04 19:18:16 +0000)

----------------------------------------------------------------
RISC-V firmware drivers for v6.9

A single minor fix for an oversized allocation due to sizeof() misuse by
yours truly that came in since I sent my last fixes PR.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Dawei Li (1):
      firmware: microchip: Fix over-requested allocation size

 drivers/firmware/microchip/mpfs-auto-update.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--wPm0oy/W+799syCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZed56gAKCRB4tDGHoIJi
0kJKAQCOfMZo0TwwMP8IrOmjFf826qr9nCj0CAXAF1U3zpdaSgD/eCZgGksOtX00
DFGZZ1ornDNWi/ggXIFQQukytKNgwgM=
=Cv2+
-----END PGP SIGNATURE-----

--wPm0oy/W+799syCQ--
