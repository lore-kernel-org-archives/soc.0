Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D2C302155
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 17:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764264076; cv=none; b=pd2Wd3zDZxodYXX/d9YK/Yw2jKUFuI1qP1X0YAf6o89E9alv4hdBU7p7Qy6vG6eRHIMLCPVUgZFlTpltlWMSHga3PMcydiYUgT9bS/ME4qoJ76w35SOiVfRBxoqU3ZwVtk1NKeYJG4SvU8oGMwayv3j2FHEAxQBh6ux60l1ECcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764264076; c=relaxed/simple;
	bh=HS77SmwEsYpkqDMSzAifIhnPv+Zayz1qcg96NR9gw48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=saHOD54l48e1eBD3efb8oGeVvqbOTraNXrFwUnpO7XD1/9uGUr3NzkclUPJa5piTDS/qST67Il/KjGr5Hbxlzh6sNPoYJ7ZtT+MdDB3xoTlTzTLKW8gDOLMAx7S83XUZvzdUff39vSUYGH04/yMLc/7Mw5ujXn3YaNzWiLFK00A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T87OKTeu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T87OKTeu"
Received: by smtp.kernel.org (Postfix)
	id 07B79C116C6; Thu, 27 Nov 2025 17:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16F0C4CEF8;
	Thu, 27 Nov 2025 17:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764264075;
	bh=HS77SmwEsYpkqDMSzAifIhnPv+Zayz1qcg96NR9gw48=;
	h=Date:From:To:Cc:Subject:From;
	b=T87OKTeu2ddm6MB8ijGVxO5FIYlPymZ4FbcXTSX7t8R8/PMNSugNLkR9hxkHcY5iF
	 SmjhItONkE2dlNraMKsHHwBgjqMWqkwwMvCixGsWV/wCBc+looPMixrtwc0Zrd84hD
	 iYBDFBWDWIUzZqzhy3jSVk0v21m3ZYtvkR9aR0Uegwq1zHwarHZM8gJiYEJJFEi6IN
	 5Sb/EJcgN0g3gbV6D3z2pCBOOTGCkoGSoTw1dVhTyj6VFDT/NbELnSfxAVHPbX3r6s
	 8lzMUYvGxo4JvrTOKUVPszFFPvCzWLvzHdPUvPvm6S/6UTRgVTH9U4pQIWz47xwaXv
	 Uff8qqsbpunkA==
Date: Thu, 27 Nov 2025 17:21:12 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, kernel@esmil.dk
Subject: [GIT PULL] RISC-V Devicetrees for v6.19
Message-ID: <20251127-unthread-probable-75bbd4e737f5@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vC5F/PZ6oQKMyVGD"
Content-Disposition: inline


--vC5F/PZ6oQKMyVGD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey folks,

Please pull my devicetree updates for 6.19.

Cheers,
Conor.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt=
-for-v6.19

for you to fetch changes up to 5b70764e10190d57e6cd3287d3a3b06f8c89f69c:

  riscv: dts: starfive: add Orange Pi RV (2025-11-25 22:20:54 +0000)

----------------------------------------------------------------
RISC-V Devicetrees for v6.19

MAINTAINERS:
There's some re-jigging of things to reduce duplication, by moving me
into the StarFive entry and my tree into the Microchip one. The
other platforms that I look after (SiFive and Canaan) are marked as Odd
Fixes to better represent their status. Nothing functionally changes.

Microchip:
Add adc and mmc nodes for the Beagle-V Fire.

SiFive:
Add pwm fans to the unmatched board.

StarFive:
Add the Orange PI RV board, another VisionFive 2 derived SBC. This
required moving a mmc related nodes out of the common file, into
<board>.dts. Yet more things moved out of the common file when the
VisionFive 2 Lite boards were added, which use the JH7110S SoC instead of
the JH7110. The difference here between SoCs is just temperature and
frequency ranges, but the boards differ enough that the pool of common
nodes decreases a little further.  There's an eMMC and an SD variant
here, that are different SKUs, bringing the total new StarFive boards to
three.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (5):
      riscv: dts: microchip: enable qspi adc/mmc-spi-slot on BeagleV Fire
      MAINTAINERS: add Conor to StarFive entry
      MAINTAINERS: remove patchwork from RISC-V MISC SOC SUPPORT
      MAINTAINERS: add tree to RISC-V Microchip entry
      MAINTAINERS: degrade RISC-V MISC SOC SUPPORT to Odd Fixes

E Shattow (1):
      dts: starfive: jh7110-common: split out mmc0 reset pins from common i=
nto boards

Hal Feng (5):
      dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite bo=
ard
      riscv: dts: starfive: jh7110-common: Move out some nodes to the board=
 dts
      riscv: dts: starfive: Add common board dtsi for VisionFive 2 Lite var=
iants
      riscv: dts: starfive: Add VisionFive 2 Lite board device tree
      riscv: dts: starfive: Add VisionFive 2 Lite eMMC board device tree

Icenowy Zheng (2):
      dt-bindings: riscv: starfive: add xunlong,orangepi-rv
      riscv: dts: starfive: add Orange Pi RV

Ren=E9 Rebe (1):
      riscv: dts: sifive: unmatched: Add PWM controlled fans

 .../devicetree/bindings/riscv/starfive.yaml        |   7 +
 MAINTAINERS                                        |   9 +-
 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts |  96 ++++++++++++
 .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts |  10 ++
 arch/riscv/boot/dts/starfive/Makefile              |   3 +
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |  19 ---
 .../dts/starfive/jh7110-deepcomputing-fml13v01.dts |  27 ++++
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts |  27 ++++
 .../boot/dts/starfive/jh7110-milkv-marscm-emmc.dts |   9 ++
 .../boot/dts/starfive/jh7110-milkv-marscm-lite.dts |   1 +
 .../boot/dts/starfive/jh7110-milkv-marscm.dtsi     |  13 ++
 .../riscv/boot/dts/starfive/jh7110-orangepi-rv.dts |  76 ++++++++++
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |  27 ++++
 .../jh7110-starfive-visionfive-2-lite-emmc.dts     |  22 +++
 .../starfive/jh7110-starfive-visionfive-2-lite.dts |  20 +++
 .../jh7110-starfive-visionfive-2-lite.dtsi         | 161 +++++++++++++++++=
++++
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi |  24 +++
 17 files changed, 528 insertions(+), 23 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-lite-emmc.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-lite.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-lite.dtsi

--vC5F/PZ6oQKMyVGD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSiIiAAKCRB4tDGHoIJi
0rFKAQCkfSkHhBqdMQ3GdKyUi1dJbZqUg86rEjb1P0Ijr1BN7wEAiZvcquFF+ANu
Jbqs6y+xNCqJ6w6hpuXe9foD0gSRKQQ=
=wPOI
-----END PGP SIGNATURE-----

--vC5F/PZ6oQKMyVGD--
