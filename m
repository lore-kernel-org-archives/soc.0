Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C357FC35274
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 13:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84FC3C433C9; Thu, 21 Dec 2023 13:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A2BC433C8;
	Thu, 21 Dec 2023 13:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703165074;
	bh=7FWVcSzZbrEwSEb8LbF4qRX3FUJBV3gJMuupWAzoceQ=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=IJJnao2idCriu6ysD3D2WnPhXVYVkZbaEvnXQ2Npaibn1G4jtp14eFqf2FA7Fz4ZL
	 B8LSJi5hT8j5rmrR0GitZDT7peRvbDPQW0MnST2bSkmArLrarb8c3is9dkWfkhgCfg
	 oRFHZlubjVO9yu2wPWA3YbeLkme93rFWBaUMozYCFnS30g/AN55WJHsEutN7w+2cx5
	 H2/hmh9+7yRXIbXRWBZBofe7WuSpRMtgv1ELlZgpClXkIqJz0ZVbhlBaPHZAqgYmdE
	 xNXOkGmDCd+GQkejs0glUgia7L8GbjJ7CkzLM3UwuHsZIxKhfyWWphnVi/NPHxeTw/
	 ouKlN8ub/oROg==
Date: Thu, 21 Dec 2023 13:24:30 +0000
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: conor@kernel.org, arnd@arndb.de, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.8
Message-ID: <20231221-skimmed-boxy-b78aed8afdc4@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FxKS5Jqh9/jL3T9S"
Content-Disposition: inline


--FxKS5Jqh9/jL3T9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull dt changes for RISC-V. I've got the T-Head SoCs here as
Jisheng has been busy IRL this cycle and not had the time to set up
branches etc yet.

Happy Christmas and all that jazz,
Conor.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.8

for you to fetch changes up to 56b10953da7e9e92eb1a72860db656ac6a5699a1:

  riscv: dts: starfive: Enable SDIO wifi on JH7100 boards (2023-12-13 15:50:23 +0000)

----------------------------------------------------------------
RISC-V Devicetrees for v6.8

StarFive:
Key peripheral support for the jh7100 that depended on the non-standard
non-coherent DMA operations, namely mmc, sdcard and sdio wifi. This
platform has long been supported out of tree by Emil and Ubuntu etc ship
images for it, so having mainline support for a wider range of
peripherals (at last) is great.

Microchip:
The flash used by Auto Update support and the corresponding QSPI
controller are added. On publicly available Icicle kits this flash is
not usable (engineering sample silicon issues) but in the future Icicle
kits will be available that have production silicon.

T-Head:
Jisheng is busy with RL this cycle and hence T-Head appears here. The
Lichee Pi and BeagleV both grow eMMC and uSD support.

Sopgho:
Support for the Huashan Pi and the cv1812h SoC it uses. The cv1812h is
almost identical to the existing cv1800b SoC. These SoCs are intended
for use in IP camera type systems but also appear on SBCs, with the last
digit denoting the amount integrated DDR3 the device has. The difference
between the cv1812h and the existing cv180x devices appears to be the
addition of video output interfaces.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      Merge patch series "Add Huashan Pi board support"
      riscv: dts: microchip: add the mpfs' system controller qspi & associated flash

Drew Fustini (3):
      riscv: dts: thead: Add TH1520 mmc controllers and sdhci clock
      riscv: dts: thead: Enable BeagleV Ahead eMMC and microSD
      riscv: dts: thead: Enable LicheePi 4A eMMC and microSD

Emil Renner Berthing (6):
      riscv: dts: starfive: Mark the JH7100 as having non-coherent DMAs
      riscv: dts: starfive: Add JH7100 cache controller
      riscv: dts: starfive: Add pool for coherent DMA memory on JH7100 boards
      riscv: dts: starfive: Add JH7100 MMC nodes
      riscv: dts: starfive: Enable SD-card on JH7100 boards
      riscv: dts: starfive: Enable SDIO wifi on JH7100 boards

Geert Uytterhoeven (1):
      riscv: dts: starfive: Group tuples in interrupt properties

Inochi Amaoto (7):
      dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
      dt-bindings: timer: Add SOPHGO CV1812H clint
      dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
      riscv: dts: sophgo: Separate compatible specific for CV1800B soc
      riscv: dts: sophgo: cv18xx: Add gpio devices
      riscv: dts: sophgo: add initial CV1812H SoC device tree
      riscv: dts: sophgo: add Huashan Pi board device tree

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 .../devicetree/bindings/riscv/sophgo.yaml          |   4 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts  |  21 +++
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |  17 ++
 arch/riscv/boot/dts/sophgo/Makefile                |   1 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi            | 123 +------------
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts  |  48 +++++
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi            |  24 +++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi             | 193 +++++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7100-common.dtsi    | 131 ++++++++++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |  48 ++++-
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  20 +++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  20 +++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  34 ++++
 15 files changed, 568 insertions(+), 118 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx.dtsi

--FxKS5Jqh9/jL3T9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYQ8jgAKCRB4tDGHoIJi
0j6zAQDYw4UJXtlMCyPcWXiX3EUkP6TbpOlVJyWUyb9ecJH1vAD/b22b+u2cTzUe
Qikxq0vinYqnUqElSYqyvr7p9265Tgc=
=bQtm
-----END PGP SIGNATURE-----

--FxKS5Jqh9/jL3T9S--
