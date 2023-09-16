Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5ABCD37BB
	for <soc@archiver.kernel.org>; Sat, 16 Sep 2023 11:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC5B8C433CA; Sat, 16 Sep 2023 11:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4849CC433C8;
	Sat, 16 Sep 2023 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694864414;
	bh=cHMPcuPh8+Za+hDzq8C00lnzde6XX7qIJ9RyXmaUUh8=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=jcRZmLLGwZ6Lf5bKBSxzxKccFZCNOyhveRcIOPWof8VTHN0rbmm+DLMJxzXO/0r8k
	 U2rb6XtCaCmMgimVjrkf+1D7Y5l9MpWI6NT0Luc+PwywyaLEbH4agj2duIhpic0ir/
	 Nr8qeFzHGJ0eKyyuB+ICdGISg6A0ncT+murGHEzCnKR2p2svjA3zGoJOwBiVfnacfw
	 sce9QNeXoTKcORHwgTZAodC6w78rNgrG/X3G9RNrYBWwykgFcf3mj6f4NmGHyvai5u
	 vjl1LzfkdSIhp9dKKIQlmNsOXt0tNSjkMWXXGc2Zi7jO8z+SxGl421hJG6rnr2mYcZ
	 ZkMLMsA+iVCvA==
Date: Sat, 16 Sep 2023 12:40:10 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: conor@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
	linux-riscv@lists.infradead.org, soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetree fixes for v6.6-rc3
Message-ID: <20230916-previous-oversold-9d30891ac6cf@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dDqUBxu6tEVz3/8G"
Content-Disposition: inline


--dDqUBxu6tEVz3/8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull some fixes for the Starfive devicetrees, been sitting around
since before the mw (but after my last PR), so figured I'd get them out
sooner rather than later.

Thanks!

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes-for-v6.6-rc3

for you to fetch changes up to 1558209533f140624a00408bdab796ab3f309450:

  riscv: dts: starfive: visionfive 2: Fix uart0 pins sort order (2023-09-13 14:24:56 +0100)

----------------------------------------------------------------
RISC-V Devicetree fixes for v6.6-rc3

Starfive:
A fix for the size of the NOR flash that was causing complaints from the
MTD subsystem during boot & two issues that a certain someone introduced
while resolving merge conflicts. Of the latter, one is a cosmetic
ordering change & the other lead to the usb controller being disabled.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Aurelien Jarno (1):
      riscv: dts: starfive: fix NOR flash reserved-data partition size

Hal Feng (2):
      riscv: dts: starfive: visionfive 2: Enable usb0
      riscv: dts: starfive: visionfive 2: Fix uart0 pins sort order

 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 51 +++++++++++-----------
 1 file changed, 26 insertions(+), 25 deletions(-)

--dDqUBxu6tEVz3/8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQWUGgAKCRB4tDGHoIJi
0kqfAP4kEKCUZ1FF4QNq9Uh2Zbg+JEc4kthnW91iNSWANbWO0gEAjtcWhnLmEgvM
sBhAN/4oH2p76ENwsod6nkM2u4q9hgk=
=6Dnk
-----END PGP SIGNATURE-----

--dDqUBxu6tEVz3/8G--
