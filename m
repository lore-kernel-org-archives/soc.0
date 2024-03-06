Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F651C5475B
	for <soc@archiver.kernel.org>; Wed,  6 Mar 2024 18:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5533FC433F1; Wed,  6 Mar 2024 18:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414D9C433C7;
	Wed,  6 Mar 2024 18:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709748494;
	bh=aNvdoVB8CYkClyqqn06SdWt2NUie0KzhPE48rEF9VIU=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=pimsxjFhK+zyfYVmU1R9cldV/XdlNrXnhVvAHkPtupRuB9DnZawtNO7v7HSD2LDfa
	 3mDvleMRg5H/ab55L3/SHvlrLwfKFAXjh0MT407rknDKyhjXVPq6fkh7DHqRT8YGLe
	 74U2vLc6/FnxXCqWfVajtaO2KNPnvc2dZH8Aiv+ahsvdlV66Ud+3cYFBfbf3KR149p
	 ifACxqXlWHcyPPImTqc9xR0eQAs6wkQL1BFvUHW3k7yj4Dddh79rbPzZxyUkxEG9QG
	 ABQ9VeuOz3xkZ7ZX57Tu2M9KgMS9RauulJpW1AjE29ogbQuvBtAJ6h2cR9ya00QD06
	 xgOy6AHYnY/Lg==
Date: Wed, 6 Mar 2024 18:08:11 +0000
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetree fixes for v6.8-final
Message-ID: <20240306-waltz-facial-9e4e1b792053@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xRXufZSFrzlx0kDP"
Content-Disposition: inline


--xRXufZSFrzlx0kDP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

I know it is pretty late in the day here for fixes, and I would've kept
the builtin dtb fix as v6.9 material, but Geert reported yesterday that
boot was broken on the jh7100 platforms due to a fix that I sent in my
last PR.

Thanks,
Conor.

The following changes since commit ce6b6d1513965f500a05f3facf223fa01fd74920:

  riscv: dts: sifive: add missing #interrupt-cells to pmic (2024-02-14 09:09:33 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-fixes-for-v6.8-final

for you to fetch changes up to 2672031b20f6681514bef14ddcfe8c62c2757d11:

  riscv: dts: Move BUILTIN_DTB_SOURCE to common Kconfig (2024-03-06 00:08:32 +0000)

----------------------------------------------------------------
RISC-V Devicetree fixes for v6.8-final

Starfive:
The previous cleanup broke boot on the jh7100 as the driver depended on
the fallback clock name created based on the node-name when
clock-output-names is not present. Add clock-output-names to restore
working order.

Generic:
BUILTIN_DTB has been broken for ages on any platform other than the
nommu Canaan k210 SoC as the first dtb built (in alphanumerical order),
would get built into the image. This didn't get fixed for ages because
nobody actually cared about running it other than the k210 enough to
fix it. The folks doing Sophgo SG2042 development have come along and
fixed it, as they want to use builtin dtbs. linux-boot on that platform
reuses the dtb it was provided by OpenSBI when booting linux proper,
which is unfortunately not possible to boot a mainline kernel with.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      riscv: dts: starfive: jh7100: fix root clock names

Yangyu Chen (1):
      riscv: dts: Move BUILTIN_DTB_SOURCE to common Kconfig

 arch/riscv/Kconfig                             | 14 ++++++++++-
 arch/riscv/Kconfig.socs                        | 32 --------------------------
 arch/riscv/boot/dts/Makefile                   |  2 +-
 arch/riscv/boot/dts/canaan/Makefile            |  2 --
 arch/riscv/boot/dts/microchip/Makefile         |  1 -
 arch/riscv/boot/dts/sifive/Makefile            |  1 -
 arch/riscv/boot/dts/starfive/jh7100.dtsi       |  4 ++++
 arch/riscv/configs/nommu_k210_defconfig        |  2 ++
 arch/riscv/configs/nommu_k210_sdcard_defconfig |  2 ++
 9 files changed, 22 insertions(+), 38 deletions(-)

--xRXufZSFrzlx0kDP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeixCgAKCRB4tDGHoIJi
0sVUAQDA0DHhq7ioR+8EQAm5wUw5VjdsZ8xm+lipPkOywGpuTQEAtH6cyvFfdSSl
1RrJXne0Nn4UF+8FZg0bgzJNtFhTtQk=
=rXKb
-----END PGP SIGNATURE-----

--xRXufZSFrzlx0kDP--
