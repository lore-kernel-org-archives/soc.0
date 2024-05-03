Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505F1C4345F
	for <soc@archiver.kernel.org>; Fri,  3 May 2024 16:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 378F2C4AF14; Fri,  3 May 2024 16:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48015C116B1;
	Fri,  3 May 2024 16:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714752192;
	bh=1DF8MTdEcurrfCDFZH0EYVWr5xZUopaexeJrbXqbJOU=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=qFvB3OehGcLpvJqbdovEvLVClsc269X2VvgUWI2j6EZaQQrobJ2C/T9WsJNI3Zsht
	 MoSnwTDzVrA7XkjY4NNrKRiPw8z2hi4VtTclGizZ934shuFSUNUi7eun5WwDmOhpSY
	 Xl1aqRri80issRyCIkObQUjz9cPZ9iT7X8oDp/j+DoRjgL9BreXZ8Kve0lLw4Nu+Za
	 b6AfMu18cEqAV69HQHlxm3iOW6tdMmOIKCbXcVvSTNVtO9AQFwTN6h2RT7SZu/KtrT
	 pyqzvpdzVpLfUa2unTrA5L4f9I/9MOYgQ4V3x5iC1/qhUt0rJfRG5OnEI2bcMNbtp9
	 oP3INTqI/4NDQ==
Date: Fri, 3 May 2024 17:03:04 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC Kconfig Updates for v6.10 was ([GIT PULL]
 RISC-V SoC drivers for v6.10)
Message-ID: <20240503-levers-desktop-ccfb6f2e8967@spud>
References: <20240503-mardi-underling-3d81a9f97329@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jN0SBJSWeALE/+dO"
Content-Disposition: inline
In-Reply-To: <20240503-mardi-underling-3d81a9f97329@spud>


--jN0SBJSWeALE/+dO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2024 at 05:00:18PM +0100, Conor Dooley wrote:
> Hey Arnd,
>=20
> Please pull some SoC-related Kconfig changes for v6.10. LMK if you
> think this stuff should really be going through the actual riscv tree
> in the future and I'll just harass Palmer about it instead of taking
> it myself. That said, Palmer did Ack it all...

Whoops, $subject should be "RISC-V SoC Kconfig Updates for v6.10" to
match the tag... I'll fix up my script if I send any more of these.

>=20
> Cheers,
> Conor.
>=20
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-=
config-for-v6.10
>=20
> for you to fetch changes up to cd899f85b1e454188fa2f14c3396a894f440b15f:
>=20
>   riscv: config: enable ARCH_CANAAN in defconfig (2024-04-10 11:42:13 +01=
00)
>=20
> ----------------------------------------------------------------
> RISC-V SoC Kconfig Updates for v6.10
>=20
> A few different bits of SoC-related Kconfig work. The first part of
> this is shared with the DT updates - the modification of all SOC_CANAAN
> users to SOC_CANAAN_K210 to split the existing m-mode nommu k210 away
> from the k230 that is able to be used in a "common" kernel.
>=20
> The other thing here is the removal of most of the SOC_VENDOR options,
> with their ARCH_VENDOR equivalents that've been waiting in the wings for
> 1 year+ now made visible. Due a lapse on my part when originally adding
> the ARCH_VENDOR stuff, the Microchip transition isn't complete - the
> _POLARFIRE was a mistake to keep as there's gonna be non-PolarFire
> RISC-V stuff from Microchip soonTM.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> ----------------------------------------------------------------
> Conor Dooley (4):
>       RISC-V: Drop unused SOC_CANAAN
>       RISC-V: drop SOC_MICROCHIP_POLARFIRE for ARCH_MICROCHIP
>       RISC-V: drop SOC_SIFIVE for ARCH_SIFIVE
>       RISC-V: drop SOC_VIRT for ARCH_VIRT
>=20
> Yangyu Chen (6):
>       riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
>       soc: canaan: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
>       clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>       pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>       reset: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>       riscv: config: enable ARCH_CANAAN in defconfig
>=20
>  arch/riscv/Kconfig.socs                            | 22 +++++++++-------=
------
>  arch/riscv/Makefile                                |  2 +-
>  arch/riscv/configs/defconfig                       |  7 ++++---
>  arch/riscv/configs/nommu_k210_defconfig            |  3 ++-
>  arch/riscv/configs/nommu_k210_sdcard_defconfig     |  3 ++-
>  arch/riscv/configs/nommu_virt_defconfig            |  2 +-
>  drivers/clk/Kconfig                                |  4 ++--
>  drivers/pinctrl/Kconfig                            |  4 ++--
>  drivers/reset/Kconfig                              |  4 ++--
>  drivers/soc/Makefile                               |  2 +-
>  drivers/soc/canaan/Kconfig                         |  4 ++--
>  tools/testing/kunit/qemu_configs/riscv.py          |  2 +-
>  .../selftests/wireguard/qemu/arch/riscv32.config   |  2 +-
>  .../selftests/wireguard/qemu/arch/riscv64.config   |  2 +-
>  14 files changed, 31 insertions(+), 32 deletions(-)



--jN0SBJSWeALE/+dO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjUKuAAKCRB4tDGHoIJi
0hRGAPwOLQksHCz98q6orWSJ+zMqrzZC2HpDSP0Z9XEWZmasSAEAmEffSIu2Vdvi
KQawAOXE76m2GCWzh0s4Txzvw+YCUwE=
=gAQ5
-----END PGP SIGNATURE-----

--jN0SBJSWeALE/+dO--
