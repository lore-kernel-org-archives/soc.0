Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908683A14
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 17:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758735500; cv=none; b=NnZ3hk7WHpGC29w8JnNdxvbeMNL99pdtL5hp3NxAn/w2qSjPOnkTF8rMpOhnj4vScpPVwzT9hL602pBWCFbR+kLHRA3/DpVdaBWJgDplwstj4+NORO9piKxbVvRE7agN6+g/gOUJkHFTSW9aNibsbFfqSPa1Kk8+B5eYrRNhq8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758735500; c=relaxed/simple;
	bh=4c+S5dIladl46SxZRNzfOo7hGdC6o/Akf3Cc+iPm/uE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FoR+/fYGzHNDkJ+4ZQtgw8YVrRv53xZlyTp3jW64HDyfuCQHELWyFPE2viNNnTePIqWNaZmws/dLxCaMCDrIlcqa5eQVgXY/R2ju3NQ535klIrOawfFYRufV37JSsJR0CTrq6h9/PVUFHySY2a0NgR1PnsD3LyuojaMOGfjs8Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5U3CELa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5U3CELa"
Received: by smtp.kernel.org (Postfix)
	id 1739BC113CF; Wed, 24 Sep 2025 17:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313DEC4CEE7;
	Wed, 24 Sep 2025 17:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758735500;
	bh=4c+S5dIladl46SxZRNzfOo7hGdC6o/Akf3Cc+iPm/uE=;
	h=Date:From:To:Cc:Subject:From;
	b=a5U3CELaSBP9qnO1bUd8jtflqhpNVJ+9Rgi9Po19OzwS5n/Lfhq32NDL3nGohgYX/
	 /9Hr/TLvpPCKtS+dBW5w5iBSH+ulURdH1YUjaIYDmGriEpuo8MVsxFUIjpmWAti7Sx
	 I9KLgYmmKM065sI5cJxM3umWfa8m0n+QTAwJGhRRUC/FSFLCU6W4nnHL4CCCcYH2HM
	 ModQjW2sWaC9HS3hqNi2HaBaKe3AvUK5zbYJvf/i/RZB2u2H8F/sWRpTmXU5Pn4EMh
	 K9HdIgI7Lo4a+SpZXrGLvdZvRBMLcI/9ILyIHMxe9jcl8VyeUe7nFYPiRflAIzkBct
	 ZqVwHpW4iHWPw==
Date: Wed, 24 Sep 2025 18:38:16 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Misc Devicetrees for v6.18
Message-ID: <20250924-frighten-magazine-ee2f16e64638@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="57lsGZaqux8LNYeQ"
Content-Disposition: inline


--57lsGZaqux8LNYeQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Wee bit late (meant to do this last week and forgot, sorry) but here's my
dt content for v6.18.

Thanks,
Conor.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.18

for you to fetch changes up to 4cce8b2503ab50f75a2dbc3eef2e55722836588e:

  riscv: dts: starfive: add Milk-V Mars CM Lite system-on-module (2025-09-16 20:35:01 +0100)

----------------------------------------------------------------
RISC-V Misc Devicetrees for v6.18

Starfive:
The main new addition is support for the JH7110 Milk-V Mars CM lite SoM.
Other than that, there's several cleanups done to the common JH7110 dtsi
file, some relating to properties used by U-Boot or encountered during
U-Boot development. Additionally, there's a binding and devicetree node
for the memory controller on the JH7110. The memory controller only sees
use in U-Boot, so the binding is here rather than in Krzysztof's
branch.

SiFive:
Support for SiFive vendor-specific extensions in the binding file for
extensions. These currently only see use in the SBI implementation.

Microchip:
Addition of support for the PolarFire SoC Discovery kit and
non-engineering sample Icicle kit. The latter differs very slightly from
the final ES devices due to bug fixes affecting functionality, and needs
its own dts. To reduce duplication, the common portion of the two Icicle
kits are moved into a dtsi. There's a few minor fixes here too, mostly
low-hanging fruit detected during the addition of the Discovery kit that
were then applied to the Icicle.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
E Shattow (11):
      riscv: dts: starfive: jh7110-common: drop no-sdio property from mmc1
      dt-bindings: memory-controllers: add StarFive JH7110 SoC DMC
      riscv: dts: starfive: jh7110: add DMC memory controller
      riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot loader
      riscv: dts: starfive: jh7110-common: drop no-mmc property from mmc1
      riscv: dts: starfive: jh7110-common: drop mmc post-power-on-delay-ms
      riscv: dts: starfive: add common board dtsi for Milk-V Mars CM variants
      dt-bindings: riscv: starfive: add milkv,marscm-emmc
      riscv: dts: starfive: add Milk-V Mars CM system-on-module
      dt-bindings: riscv: starfive: add milkv,marscm-lite
      riscv: dts: starfive: add Milk-V Mars CM Lite system-on-module

Krzysztof Kozlowski (1):
      riscv: dts: microchip: Minor whitespace cleanup

Nick Hu (1):
      dt-bindings: riscv: Add SiFive vendor extensions description

Valentina Fernandez (6):
      riscv: dts: microchip: add common board dtsi for icicle kit variants
      dt-bindings: riscv: microchip: document icicle kit with production device
      riscv: dts: microchip: add icicle kit with production device
      riscv: dts: microchip: rename icicle kit ccc clock and other minor fixes
      dt-bindings: riscv: microchip: document Discovery Kit
      riscv: dts: microchip: add a device tree for Discovery Kit

 .../memory-controllers/starfive,jh7110-dmc.yaml    |  74 ++++++
 .../devicetree/bindings/riscv/extensions.yaml      |  18 ++
 .../devicetree/bindings/riscv/microchip.yaml       |  13 ++
 .../devicetree/bindings/riscv/starfive.yaml        |   2 +
 arch/riscv/boot/dts/microchip/Makefile             |   2 +
 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts |   2 +-
 .../boot/dts/microchip/mpfs-disco-kit-fabric.dtsi  |  58 +++++
 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts   | 190 ++++++++++++++++
 .../boot/dts/microchip/mpfs-icicle-kit-common.dtsi | 249 +++++++++++++++++++++
 .../boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi |  25 ++-
 .../boot/dts/microchip/mpfs-icicle-kit-prod.dts    |  23 ++
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts  | 244 +-------------------
 arch/riscv/boot/dts/starfive/Makefile              |   2 +
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |   4 -
 .../boot/dts/starfive/jh7110-milkv-marscm-emmc.dts |  12 +
 .../boot/dts/starfive/jh7110-milkv-marscm-lite.dts |  25 +++
 .../boot/dts/starfive/jh7110-milkv-marscm.dtsi     | 159 +++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |  24 ++
 18 files changed, 876 insertions(+), 250 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi

--57lsGZaqux8LNYeQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNQsiAAKCRB4tDGHoIJi
0m7rAQDZTnjH0+4P3yhjHm59JpRD26B/TsKm5jXT4jjOUEtd+QD9HOmWjXkEecK2
dQzBi215SMUVfOMr4d3EP1AiFMbJ6Q4=
=3xfW
-----END PGP SIGNATURE-----

--57lsGZaqux8LNYeQ--
