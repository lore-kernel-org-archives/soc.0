Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61B5C04FFE
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 20:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E6F0C32781; Wed,  8 May 2024 20:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4694C113CC;
	Wed,  8 May 2024 20:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715199237;
	bh=TU+XskjpMH/W29fIjZitPeykjM+cnjdakCXTCjOr550=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=A75mbKb/aiiHxmU1Up8YMXFXApkc0ZC7IR5+Plz9JBqsZEqNTGXtbPZ82tGmHDRDN
	 BW7BcKpzYlo7+j1jb1TbW6zDgu3M+9s0xQVDTTaOG6gl7LhhCSgB09lJgUuIxL2c6W
	 4VBFKTRIRuK85b1c4fIgRKo/HDMJcC6cpEZnowwqeJYWqwhZEf5yP+m1w3D3NyOTdn
	 lNO70RGRb4daWRzIBMhTe6GgzUH0+8PTrQ0Knce0GK+qpk9TcveOHq+K4EoPO4xufo
	 a2t244kix9f4xDilFEr/nHhD9gz1nJdE/mq85AijDXX8nKjgqgrxlBRR1vG8in6cyG
	 Jfg3SKTYtZWyg==
Date: Wed, 8 May 2024 21:13:54 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.10 Take 2
Message-ID: <20240508-crafter-cement-4f54e4182270@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K3O2MsiTfJ8u8tPf"
Content-Disposition: inline


--K3O2MsiTfJ8u8tPf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Here's a second attempt for ya.. The canaan stuff is dropped and I'll
send it to you for 6.11 instead.

Cheers,
Conor.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.10-take2

for you to fetch changes up to 1c80d50bb697f84bfbc3876e08e1a1d42bfbdddb:

  riscv: dts: microchip: add pac1934 power-monitor to icicle (2024-05-07 17:14:06 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.10

Microchip:
A simple addition of a power-monitor on the Icicle dev board, as the
binding for it is now in mainline.

StarFive:
Support for the Milk-V Mars. This board is incredibly similar to the
VisionFive v2 that is already supported, with only the really ethernet
configuration being slightly different. Emil requested that a common
dtsi file, so my fixes branch is pulled into for-next to avoid an
annoying conflict between moved content and some erroneously added
nodes that were removed as fixes this cycle.

T-Head:
Re-ordering of some nodes to match the DTS coding style on the th1520.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      RISC-V: add Milkv Mars board devicetree
      riscv: dts: microchip: add pac1934 power-monitor to icicle

Hannah Peuckmann (2):
      riscv: dts: starfive: visionfive 2: Remove non-existing TDM hardware
      riscv: dts: starfive: visionfive 2: Remove non-existing I2S hardware

Jisheng Zhang (8):
      riscv: dts: starfive: add 'cpus' label to jh7110 and jh7100 soc dtsi
      dt-bindings: riscv: starfive: add Milkv Mars board
      riscv: dts: starfive: visionfive 2: update sound and codec dt node name
      riscv: dts: starfive: visionfive 2: use cpus label for timebase freq
      riscv: dts: starfive: visionfive 2: add tf cd-gpios
      riscv: dts: starfive: visionfive 2: add "disable-wp" for tfcard
      riscv: dts: starfive: introduce a common board dtsi for jh7110 based boards
      riscv: dts: starfive: add Milkv Mars board device tree

Shengyu Qu (1):
      riscv: dts: starfive: Remove PMIC interrupt info for Visionfive 2 board

Thomas Bonnefille (1):
      riscv: dts: thead: Fix node ordering in TH1520 device tree

 .../devicetree/bindings/riscv/starfive.yaml        |   1 +
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts  |  32 +
 arch/riscv/boot/dts/starfive/Makefile              |   1 +
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |   2 +-
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 599 ++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts |  30 +
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 683 +--------------------
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |   2 +-
 arch/riscv/boot/dts/thead/th1520.dtsi              |  54 +-
 9 files changed, 693 insertions(+), 711 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-common.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts

--K3O2MsiTfJ8u8tPf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjvdAgAKCRB4tDGHoIJi
0sBcAQC7ySvcubiZQEtf9Mrrm1fNGhwbao5K/iBXy7rjQhJxywEAtgXftgRxdH2e
FM0a5kA3a6d44ZfZR5fpj5rgUJHkoAE=
=1OZ7
-----END PGP SIGNATURE-----

--K3O2MsiTfJ8u8tPf--
