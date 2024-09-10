Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537EEEE01E9
	for <soc@archiver.kernel.org>; Tue, 10 Sep 2024 22:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 182E4C4CECC; Tue, 10 Sep 2024 22:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062EEC4CEC3;
	Tue, 10 Sep 2024 22:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726005741;
	bh=y7w4sfdixGiLqhSxoJLTOPd76eVwqCLaa3m6abWtlAg=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=uK+hucoTvT6mn0wIHUCiZ0FtZW7XoFZiopsIWf3ErpwV58udUTGtH75AedtBi6cCk
	 bzlEdYrLb14pHgxJvb15YATCd0+H8hYlmDgVPiXhWvKIZf5nCX+d534CZAffLqW4wf
	 wxr5YhMkd5qNROBCBDq4dvtyrgedUS0nqf1d3xjE+gzQPnOZ6B8pGRfooHUBKTAhpv
	 8n0tOMn1Hwhtb+NnlZBmDmNl2nbcUBuK2esMTXn7+Fx4mg8M1YrSlGHe10iyWnJRRJ
	 GO9CHWBdJy9rNA+9uLeyCnmKZjTTLJn1ydOpGOKlOz7Wm+ArQiy+/QDTwAY6cUQr4n
	 hy1jteLKfc5rA==
Date: Tue, 10 Sep 2024 23:02:17 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V config for v6.12
Message-ID: <20240910-annex-ravage-07d63041a7c5@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yP0QS5j1N9BokM1p"
Content-Disposition: inline


--yP0QS5j1N9BokM1p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Practically nothing for you this cycle, so this will be my only PR.
There's both Microchip and Spacemit stuff on the lists, but none of it
ready for this cycle.

Cheers,
Conor.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-config-for-v6.12

for you to fetch changes up to 72160ec6cb12613663f26d89049b95f8dc9fa000:

  riscv: defconfig: Enable pinctrl support for CV18XX Series SoC (2024-09-09 12:55:53 +0100)

----------------------------------------------------------------
RISC-V config for v6.12

Two patches, enabling clock and pinctrl support in defconfig for Sopghgo
devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Chen Wang (1):
      riscv: defconfig: sophgo: enable clks for sg2042

Inochi Amaoto (1):
      riscv: defconfig: Enable pinctrl support for CV18XX Series SoC

 arch/riscv/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

--yP0QS5j1N9BokM1p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuDB6QAKCRB4tDGHoIJi
0hNXAP0YwgjXERXateyyMSzrmh3Ax84qnZUGVW/ofoKk2cVTLAEAx6V6QwqDSvuW
ELWvPRfyrTazD2XyC/ukrX05gjbSsQw=
=0yyF
-----END PGP SIGNATURE-----

--yP0QS5j1N9BokM1p--
