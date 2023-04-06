Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA89C76196
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 20:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 067A1C4339B; Thu,  6 Apr 2023 20:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1186C433EF;
	Thu,  6 Apr 2023 20:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680812683;
	bh=fNAH6oByliNVJGPsjQKf//hNT9wlLmgPCJOQ5f+y+q0=;
	h=Date:From:To:List-Id:Cc:Subject:From;
	b=apSwemx/cueu0FjJ5zqnNjvw9YjvErT73t5ryQoTnmW7N7wTp9BYb8UhUhRUTXFn+
	 yKCzes0KWeWYTkL5Mj5WdhgrvJi2ezoulDcqv2X6PE1u3PK+knHSyjPase/LEg6nKr
	 b9BPgOWT0LLjwB2wvc/I3SIIRGt74PzLiJMQkYEsN7XERgYyENSGsPkgCIvhZuGvBt
	 hSFhoRPQIk4IBZS/P8udxFUnSXW+ITmLHUK1ugsbhNX8nJIfnRG/G+rhmrZ7x/7CpH
	 Wxo23QdF7p2esUUUpyAnOsH6EojR4NVhaSKKIp9V6S5Bog5b5J+mEkTcOKCl3e4Orp
	 9OlkghjswdSrA==
Date: Thu, 6 Apr 2023 21:24:40 +0100
From: Conor Dooley <conor@kernel.org>
To: arnd@arndb.de
List-Id: <soc.lore.kernel.org>
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.4
Message-ID: <20230406-shank-impromptu-3d483bbc249f@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0SfrAMaAlVV1aTTn"
Content-Disposition: inline


--0SfrAMaAlVV1aTTn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Arnd,

Please pull some Devicetree updates for v6.4, mainly adding the base
level of support for the StarFive VisionFive v2.
I wanted to get an initial PR out before -rc6, but I may have another
PR adding some of the peripherals (pmu, mmc) for the StarFive stuff
that are already reviewed etc, but need a rebase on top of what
actually got applied. Is that okay, or will the end of next week be
too late for you?

As a note, this is against -rc2, rather than -rc1, as I wanted to
apply the StarFive stuff to a branch there'd be a chance of it booting
on for the sake of testing.

Cheers,
Conor.

git request-pull complained that the tag was not present, but I
checked my repo and it is there. =C2=AF\_(=E3=83=84)_/=C2=AF

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt=
-for-v6.4

for you to fetch changes up to 4cd4beb98fe5ac2c4bcb995ba6e82322be174abb:

  Merge branch 'riscv-jh7110_initial_dts' into riscv-dt-for-next (2023-04-0=
5 22:23:17 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.4

Microchip:
A "fix" for the system controller's regs on PolarFire SoC, adding a
missing reg property.
The patch had been sitting there for months and I only re-found it
recently, so you can guess how much of a "fix" it actually is. It'll
become needed when the system controller's QSPI gets added in the future,
but at present there's no urgency as the driver can handle both the
current and "fixed" versions.

StarFive:
Basic support for the JH7110 & the associated first-party dev board, the
VisionFive v2 (in two forms). There's a bunch of dt-bindings required
for this too, all of which have had input from the DT folk. There's
enough in this tag to boot to a console w/ an initramfs but little more.
The SoC supports some of the "new" bit manipulation instructions, which
is a good test for the recently added Zbb support in the kernel.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (3):
      riscv: dts: microchip: add mpfs specific macb reset support
      riscv: dts: microchip: fix the mpfs' mailbox regs
      Merge branch 'riscv-jh7110_initial_dts' into riscv-dt-for-next

Emil Renner Berthing (6):
      dt-bindings: clock: Add StarFive JH7110 system clock and reset genera=
tor
      dt-bindings: clock: Add StarFive JH7110 always-on clock and reset gen=
erator
      dt-bindings: timer: Add StarFive JH7110 clint
      dt-bindings: interrupt-controller: Add StarFive JH7110 plic
      riscv: dts: starfive: Add initial StarFive JH7110 device tree
      riscv: dts: starfive: Add StarFive JH7110 VisionFive 2 board device t=
ree

Hal Feng (1):
      dt-bindings: riscv: Add SiFive S7 compatible

Jianlong Huang (1):
      riscv: dts: starfive: Add StarFive JH7110 pin function definitions

 .../bindings/clock/starfive,jh7110-aoncrg.yaml     | 107 +++++
 .../bindings/clock/starfive,jh7110-syscrg.yaml     | 104 +++++
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |  10 +-
 arch/riscv/boot/dts/starfive/Makefile              |   6 +-
 arch/riscv/boot/dts/starfive/jh7110-pinfunc.h      | 308 +++++++++++++
 .../jh7110-starfive-visionfive-2-v1.2a.dts         |  13 +
 .../jh7110-starfive-visionfive-2-v1.3b.dts         |  13 +
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 215 +++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           | 500 +++++++++++++++++=
++++
 include/dt-bindings/clock/starfive,jh7110-crg.h    | 221 +++++++++
 include/dt-bindings/reset/starfive,jh7110-crg.h    | 154 +++++++
 14 files changed, 1650 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110=
-aoncrg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110=
-syscrg.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-v1.2a.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-v1.3b.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110.dtsi
 create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
 create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h

--0SfrAMaAlVV1aTTn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC8qiAAKCRB4tDGHoIJi
0qhcAQCM7InEIij/sPxm86jJxcCIC/GZwU78+cTUWy5qeRNq3AD+KL4NNY5BUpRD
RxCDbFTkGVvy+EOe9zpEu48AGZaODQw=
=pZyK
-----END PGP SIGNATURE-----

--0SfrAMaAlVV1aTTn--
