Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE8DCDB465
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 15:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7F00C433C8; Mon, 16 Oct 2023 15:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A343C433C7;
	Mon, 16 Oct 2023 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697469356;
	bh=vEzJGBXUu/OKelM/2/t55GZH/fvxsRTVz4U9XMjAYJ8=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=YIX69MX6AFf0/bu6OatlhiAjwC4MEyIKIxTk3Ozqu1q9tL4/MHIxWy1aWMGEPBiGP
	 aw1O5RsnRLhShVeOii9u6GOTDS1Nzfgs26EDvA5Ofee8kj6Jx8iGYAwRVM1KUFfrjp
	 eEczjpMPOPAMfP+L9GzVXW6d7A0ZbiWKe25GoleUefiWjhbnlrp0tIHFjh+4THIut5
	 z8qCNB1EcIZdoVVG43O/0ddsmc4+wXwL+erFhmgjJXtxX3g/rI5ctxe6zGMWjUn4mp
	 n50GjKWQ330NWAauSn7zd+uSLOmHqC6secgKYxBWf1k3XXEyfRR4Ihy5HXj7tCU0c0
	 WKCSFfFD5s29g==
Date: Mon, 16 Oct 2023 16:15:53 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V SoC drivers for v6.7
Message-ID: <20231016-predator-affiliate-e8affd3a7be9@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bXdUww3AwGtESCFa"
Content-Disposition: inline


--bXdUww3AwGtESCFa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Arnd,

Please pull a small number of soc driver changes for 6.7

Thanks,
Conor.

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-so=
c-for-v6.7

for you to fetch changes up to 22dedf8f4570897f15e156ac5547cef93e802182:

  soc/microchip: mpfs-sys-controller: Convert to platform remove callback r=
eturning void (2023-09-25 11:17:09 +0100)

----------------------------------------------------------------
RISC-V SoC drivers for v6.7

Minor changes here only. There's the treewide remove callback work from
Uwe, some of my own gradual conversion of SOC_ Kconfig options and a
selection of the ARM AMBA protocol required for the crypto driver on
StarFive JH7110 SoCs. The latter was supposed to be in v6.6, but I
forgot to send a PR.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      soc: sifive: replace SOC_FOO with ARCH_FOO

Jia Jie Ho (1):
      riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE

Uwe Kleine-K=F6nig (1):
      soc/microchip: mpfs-sys-controller: Convert to platform remove callba=
ck returning void

 arch/riscv/Kconfig.socs                     | 1 +
 drivers/soc/microchip/mpfs-sys-controller.c | 6 ++----
 drivers/soc/sifive/Kconfig                  | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

--bXdUww3AwGtESCFa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS1TqQAKCRB4tDGHoIJi
0sCiAP0Rh39/J4T9blHrzTWFRq8qSNmgKf/Fdebnsl3XEr/m3AEAgUOD8QICo8WL
fpz0ZOhHz5ZChBEeUAcufTFuqv88OgY=
=9+MA
-----END PGP SIGNATURE-----

--bXdUww3AwGtESCFa--
