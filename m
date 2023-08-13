Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FC0C001DB
	for <soc@archiver.kernel.org>; Sun, 13 Aug 2023 10:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D12C3C433C9; Sun, 13 Aug 2023 10:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBE9C433C8;
	Sun, 13 Aug 2023 10:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691922362;
	bh=uETOSNzKInr29sNq+hJMMvyUIpPd95CKHHZMib7LtuE=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=OIQ2uojDoJdFGm/AQFeWMSjkSTPVf1QXPARrML7CUoawTGwd/6LrOedQroFb05PIQ
	 hB5HuS6eJ6S860FNH5zii9wCYPVP30bV4qbfAiNMmS3Zs9YJ2oUrTNQ4EJd/FAoeD+
	 psnDXnR0xgqMJUIj0Ummi0o1soiFV8Iys6xbpbGlCCEmr1O434CukNAPzyVF829LqR
	 D9Sf8qPcP2LtOYHypPbhOv2Y+oQm/DVD81pHeUkt9cAr9r5yCL6AmNk+p8XnTWAkuY
	 nhU3h1amj5/P8ICFO+k41SiY54FFqj1XJVjYOc4u+ImrnP8A0Pmz6a61dFdAKg8gQL
	 n+/OyKy4TQbUA==
Date: Sun, 13 Aug 2023 11:25:59 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.6
Message-ID: <20230813-naturist-fragment-ac7d10c453ba@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oSUQ6CKENUuimYrJ"
Content-Disposition: inline


--oSUQ6CKENUuimYrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull what is entirely StarFive related changes for v6.6.
I noticed this morning that I had an s/0xf/15/ change sitting unstaged
on my system, hence the recency of the top-most commit in the branch.

The rest of this has been in linux-next and all that jazz.

Thanks,
Conor.

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.6

for you to fetch changes up to f331eb1f5454123f3cec51c18a3d86c2a53bddb9:

  riscv: dts: starfive: jh7110: Fix GMAC configuration (2023-08-13 11:12:20 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.6

StarFive:
There's only StarFive stuff this time around, starting with some
bindings to get clock ID defines out of the binding headers. Getting
these (and the syscon bindings) in unblocked a swathe of stuff sitting
on the list. Added are: new clock controllers and sycons, ethernet
support, thermal sensors, USB and PCIe PHYs, hwrng, mmc and a few more
besides for the VisionFive v2. The original VisionFive and BeagleV
Starlight got some the thermal sensor support too, as that is supported
by the same driver. These changes make the board actually usable with
something other than an initramfs.
Overlay support by way of the -@ flag set during dtb building, is added
also.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      Merge tag 'clk-starfive-bindings' into riscv-dt-for-next

Felix Moessbauer (1):
      riscv: dts: Enable device-tree overlay support for starfive devices

Hal Feng (2):
      riscv: dts: starfive: jh7100: Add temperature sensor node and thermal-zones
      riscv: dts: starfive: jh7110: Add temperature sensor node and thermal-zones

Jia Jie Ho (2):
      riscv: dts: starfive - Add crypto and DMA node for JH7110
      riscv: dts: starfive - Add hwrng node for JH7110 SoC

Minda Chen (2):
      riscv: dts: starfive: Add USB and PCIe PHY nodes for JH7110
      riscv: dts: starfive: Add USB dts node for JH7110

Samin Guo (3):
      riscv: dts: starfive: jh7110: Add ethernet device nodes
      riscv: dts: starfive: visionfive 2: Add configuration of gmac and phy
      riscv: dts: starfive: jh7110: Fix GMAC configuration

Walker Chen (2):
      riscv: dts: starfive: jh7110: add dma controller node
      riscv: dts: starfive: jh7110: add the node and pins configuration for tdm

William Qiu (6):
      dt-bindings: soc: starfive: Add StarFive syscon module
      riscv: dts: starfive: jh7110: Add syscon nodes
      riscv: dts: starfive: Add spi node and pins configuration
      riscv: dts: starfive: Add QSPI controller node for StarFive JH7110 SoC
      riscv: dts: starfive: enable DCDC1&ALDO4 node in axp15060
      riscv: dts: starfive: Add mmc nodes on VisionFive 2 board

Xingyu Wu (8):
      dt-bindings: clock: Add StarFive JH7110 PLL clock generator
      dt-bindings: clock: jh7110-syscrg: Add PLL clock inputs
      dt-bindings: clock: Add StarFive JH7110 System-Top-Group clock and reset generator
      dt-bindings: clock: Add StarFive JH7110 Image-Signal-Process clock and reset generator
      dt-bindings: clock: Add StarFive JH7110 Video-Output clock and reset generator
      riscv: dts: starfive: jh7110: Add DVP and HDMI TX pixel external clocks
      riscv: dts: starfive: jh7110: Add STGCRG/ISPCRG/VOUTCRG nodes
      riscv: dts: starfive: jh7110: Add PLL clocks source in SYSCRG node

 .../bindings/clock/starfive,jh7110-ispcrg.yaml     |  87 ++++
 .../bindings/clock/starfive,jh7110-pll.yaml        |  46 ++
 .../bindings/clock/starfive,jh7110-stgcrg.yaml     |  82 ++++
 .../bindings/clock/starfive,jh7110-syscrg.yaml     |  18 +-
 .../bindings/clock/starfive,jh7110-voutcrg.yaml    |  90 ++++
 .../soc/starfive/starfive,jh7110-syscon.yaml       |  93 ++++
 MAINTAINERS                                        |   7 +
 arch/riscv/boot/dts/starfive/Makefile              |   6 +
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |  37 ++
 .../jh7110-starfive-visionfive-2-v1.2a.dts         |  13 +
 .../jh7110-starfive-visionfive-2-v1.3b.dts         |  31 ++
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 284 ++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           | 503 ++++++++++++++++++++-
 include/dt-bindings/clock/starfive,jh7110-crg.h    |  80 ++++
 include/dt-bindings/reset/starfive,jh7110-crg.h    |  60 +++
 15 files changed, 1433 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml

--oSUQ6CKENUuimYrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNivtwAKCRB4tDGHoIJi
0k3oAQD4cBqqRsWiMErnX1Bk6HCncJk1Nw3PiALfYxbY+vRu/AD8CDILYW9pty8J
ex9yYTy9fSsHqOTOYy5QKd+Yx0QW7gs=
=S8UO
-----END PGP SIGNATURE-----

--oSUQ6CKENUuimYrJ--
