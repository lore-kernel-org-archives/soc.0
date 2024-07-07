Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E9AC3DA44
	for <soc@archiver.kernel.org>; Sun,  7 Jul 2024 17:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81421C4AF0A; Sun,  7 Jul 2024 17:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D9DC3277B;
	Sun,  7 Jul 2024 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720375083;
	bh=72I96rI7uiyl+GtQJzcvhkozVJ9pOKlNEA5uOq7BpIs=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=JAybygcrTvuH83kAC4TxwlscOgj+cJxWEaLAjJN/zaM5HUwXbiN3ziPuew3ERgnou
	 p1ZA0ZxwFGZxcW66Bvw1D2IviZG8/ZybL+UyU1jHIFxk00WbN1dvf1COALD95uzMem
	 OicBOlq16TEUE8GiENSDQC0y190UVYyqnckoRLzQKXycn6OSeEsO24FLgbZy7mhWYh
	 OpsZz0Yk+9/XBpyIzILkKc+LT9UuDGVDCGWXY8m9csaTdtlSi9UUOw1GHBszkxEK3v
	 PMnrafxWbq9BLyzqMJEnEF3tSn02tVwuWCY4PEP4sFOpntL5/c4nvR0u2EojqmYpa2
	 h6GRhiWmIwTOg==
Date: Sun, 7 Jul 2024 18:58:00 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.11
Message-ID: <20240707-nuttiness-lustfully-4aaf03c991b2@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4tXnFVVA6r14f/tL"
Content-Disposition: inline


--4tXnFVVA6r14f/tL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Should be the final PR from me. I meant to send this stuff out end of
last week but I ended up getting sick - and I'm going to blame screwing
up my PR subjects on that...

There's not really a huge amount in here, I ended up dropping the k230
that missed last window cos there's been no further interest in getting
it support outside of the basic uart + interrupt controllers + memory
configuration dts that Yangyu Chen sent. The board is fairly frustrating
to work with due to the bootloader setup, and maybe nobody really cares
since it's fairly underpowered, especially compared to the Spacemit k1
equipped Banana Pi board. I've stashed it in a branch in case anyone
surfaces that cares about it. So no vector 1.0 hardware with a dts in the
kernel yet.

Cheers,
Conor.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.11

for you to fetch changes up to 2904244a8c46bdd0fee181df693a495f4628a575:

  riscv: dts: starfive: add PCIe dts configuration for JH7110 (2024-07-01 13:20:19 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.11

T-Head:
Last change from me before this starts going via Drew's tree is the
addition of the SBI PMU events node for the th1520.

StarFive:
A dts for the Pin64 Star64, another board with a jh7110 SoC. This board
is almost identical to the existing Milk-v Mars and VisionFive 2 boards
that are already support - just with a different PHY configuration and
only one of the two PCIe ports exposed. Additionally, the Mars and
VisionFive 2 get their PCie configuration added.

Microchip:
A dts for the BeagleV Fire. PCIe is disabled on it for now, as some
binding and driver changes are required.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      dt-bindings: riscv: microchip: document beaglev-fire
      riscv: dts: microchip: add an initial devicetree for the BeagleV Fire

Henry Bell (2):
      dt-bindings: riscv: starfive: add Star64 board compatible
      riscv: dts: starfive: add Star64 board devicetree

Inochi Amaoto (1):
      riscv: dts: thead: th1520: Add PMU event node

Matthias Brugger (1):
      riscv: dts: starfive: Update flash partition layout

Minda Chen (1):
      riscv: dts: starfive: add PCIe dts configuration for JH7110

Yangyu Chen (1):
      dt-bindings: riscv: Add T-HEAD C908 compatible

 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/microchip.yaml       |   1 +
 .../devicetree/bindings/riscv/starfive.yaml        |   1 +
 arch/riscv/boot/dts/microchip/Makefile             |   1 +
 .../dts/microchip/mpfs-beaglev-fire-fabric.dtsi    |  82 ++++++++
 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts | 223 +++++++++++++++++++++
 arch/riscv/boot/dts/starfive/Makefile              |   1 +
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |  69 ++++++-
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts |   7 +
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |  65 ++++++
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi |   8 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |  86 ++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  81 ++++++++
 13 files changed, 621 insertions(+), 5 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts

--4tXnFVVA6r14f/tL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorXKAAKCRB4tDGHoIJi
0uo/AP98wGZ+35lf668q1VOJ3CAeMAkQwYt7AgPabvq7aO1hHAEAygP3TIHcsK/U
RitSn2i8ioggSeskCNm5i3NtmHP+sA0=
=SVga
-----END PGP SIGNATURE-----

--4tXnFVVA6r14f/tL--
