Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92B8C3DA44
	for <soc@archiver.kernel.org>; Sun,  7 Jul 2024 17:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A221DC4AF07; Sun,  7 Jul 2024 17:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0C2C3277B;
	Sun,  7 Jul 2024 17:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720373321;
	bh=dec1lMOTT+MCuRCKzG2P+w3SGTySw92Kkt3knjpum+g=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=DWs9Ps9bxmvsAWPEh4l4pMiv+4azWznAGl7lv3ysVo8dzIXVbSrNVy4thXeXtfAgu
	 r+hLX/ex8YdE+m3PblD0yJpHVKbDjrcUoO7pjbOpFFRVjGQN62BS9XQhi0w6nBN8OT
	 0Ly//sW+2zVz2uIDojiMaz5KfXqJCAVetirBss7AYgo/6F9Ls23RP8loYq1xFhmwVa
	 JTcMnRcEfs0dVudaRK7G36L46VaKHUXcw789gcxkwvKm+myDcWnnxQeD7Ohtwc3d8m
	 7kT1qn7aHc93CMZs1LTRHwapxTV12FOur9SxoRJE3WXxXa/aQjz2IY/CJabeXpEHOB
	 TVb5UVVKIHDLw==
Date: Sun, 7 Jul 2024 18:28:38 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: [GIT PULL] RISC-V defconfig for v6.11
Message-ID: <20240707-unused-outflank-aa127ccb2cfe@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8e9vZ7cZueqeuYTs"
Content-Disposition: inline


--8e9vZ7cZueqeuYTs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

The 3rd attempt 2 with a fixed $subject.

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

--8e9vZ7cZueqeuYTs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorQRgAKCRB4tDGHoIJi
0q2mAQCIlXjes04MsCW7Tk1ZKu26x6dn7lrn2YLHs7cy1Kt0ngD/Yca8ptVoIVNT
I+DwPcZgC1lvwW/zu4C/q7gdgR4rTgw=
=uqw1
-----END PGP SIGNATURE-----

--8e9vZ7cZueqeuYTs--
