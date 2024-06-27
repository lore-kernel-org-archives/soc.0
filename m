Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B67C2BD09
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 13:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B762C4AF0A; Thu, 27 Jun 2024 13:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B001CC2BBFC;
	Thu, 27 Jun 2024 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719496121;
	bh=K2j/+/Sf7zUX1DZVItPygh5PE8I2FDnvrkXpOJeHqzI=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=RybuiydqPX+IR2mNC8AovTDdp4m1D4t0xQtbER/clx/cLANba45LmfsVrb/GnmGBq
	 KvggKxbvrVJx+XUW9Ns/Z3EIwSJTxEyX4Gd8uh787Jn6WvLqHrvYEHi+Odh+o76w0s
	 mlva+kB7Z0orNoVlqarvn8LckuW3HmiESMe1Di5QI0xGRkv3YkokXlgxnpOzeF6qx8
	 SyWeLfv8GIGm8zaFdldKmxKKy3yN+rzcoyqvIElk0n0HBNGK+RFDDM4znbIVZA03Dr
	 1sJ+8RSG//2GHdWp5W6XLOMclXs4dKscTB+IdfpNXQIY2xbF5zzbT/t0mcXmCDc2cA
	 dQ6QAj0d0ocJw==
Date: Thu, 27 Jun 2024 14:48:38 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetree fixes for v6.10-rc5+ attempt 2
Message-ID: <20240627-wobbly-custody-5df564133088@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sH3ohF1cHr9HQSmN"
Content-Disposition: inline


--sH3ohF1cHr9HQSmN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a small set of fixes for the various platforms I'm
taking care of.

Thanks,
Conor.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes-for-v6.10-rc5+

for you to fetch changes up to e21de658f8e808551c2f9702727442980bdc0ad7:

  MAINTAINERS: thead: update Maintainer (2024-06-20 21:53:01 +0100)

----------------------------------------------------------------
RISC-V Devicetree fixes for v6.10-rc5+

T-Head:
Jisheng hasn't got enough time to look after the platform, so Drew
Fustini is going to take over.

StarFive:
A fix for a regulator voltage range that prevented using low performance
SD cards.

Canaan:
Cleanup for some "over eager" aliases for serial ports that did not
exist on some boards and I/O devices disabled on boards where they were
not actually in use.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Geert Uytterhoeven (2):
      riscv: dts: canaan: Clean up serial aliases
      riscv: dts: canaan: Disable I/O devices unless used

Jisheng Zhang (1):
      MAINTAINERS: thead: update Maintainer

Shengyu Qu (1):
      riscv: dts: starfive: Set EMMC vqmmc maximum voltage to 3.3V on JH7110 boards

 MAINTAINERS                                     |  2 +-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts     |  7 ++++++-
 arch/riscv/boot/dts/canaan/k210.dtsi            | 23 ++++++++++++++++-------
 arch/riscv/boot/dts/canaan/k210_generic.dts     |  5 ++++-
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  |  9 ++++++++-
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts |  7 ++++++-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   |  9 ++++++++-
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 10 ++++++++--
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi |  2 +-
 9 files changed, 58 insertions(+), 16 deletions(-)

--sH3ohF1cHr9HQSmN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn1tswAKCRB4tDGHoIJi
0it2AQDkEwnWXUoHSTgyf8qKJjet3/lFpaQohPHDOjpOqoRzWwD/V3gHDvQP6EXi
2GWRK8uMsE+ShjWLFUnTkpoGeRaZtA0=
=rHUT
-----END PGP SIGNATURE-----

--sH3ohF1cHr9HQSmN--
