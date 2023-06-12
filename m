Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3F7C88CB2
	for <soc@archiver.kernel.org>; Mon, 12 Jun 2023 18:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E803C433EF; Mon, 12 Jun 2023 18:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E74AC433D2;
	Mon, 12 Jun 2023 18:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686594198;
	bh=jWxLW+e9VJqjBQY+02do6tXnaUXv5x7vDrB66cETASI=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=FPMd+StO/QmUu2T44+rFGTJfAs/lypWwpMKfKeQE6pVmMKw1FBHZomFipTC0xFg2f
	 /pIM4VKm8Y4a0i9/SWF3kKdbOorGxFWBHR04MAI5ywTphFPZbFnGjEKcS+kntQlZuM
	 EfZzUxoGoh1Jx8ZQb1fUpNFCdz15Q0ojOGSPjCWKpdFBoLBgBzfhoNlSMITMLtWonx
	 N9xHeZ2XfWeq9kprfZyvZ1er/Y1nNpu7KVQNWTT/D5RFXNEl5Eq7UyrfNByNhAQ5pP
	 qBnzfoI5Vn3ShgHg4Gjvud/VRvemlhDjsDKJzwl//5ed7x4xWK9P3/LzKsf8jOUyNC
	 tlLIpZUVroknQ==
Date: Mon, 12 Jun 2023 19:23:14 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: conor@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
	linux-riscv@lists.infradead.org, soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.5
Message-ID: <20230612-fasting-floss-0bc05a08bc7a@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SPHo1XrUdCMqV28R"
Content-Disposition: inline


--SPHo1XrUdCMqV28R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

A wee bunch of changes this time around as a bunch of the jh7110 stuff
is still blocked on clock drivers. This'll probably be my only PR for
the window, haven't got anything SoC-driver wise & it's unlikely that
any of the other bits will be ready in the coming week.

Thanks,
Conor.

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.5

for you to fetch changes up to e2c510d6d630fe6593a0cf87531913b4b08ebeb1:

  riscv: dts: starfive: Add cpu scaling for JH7110 SoC (2023-06-06 12:32:06 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.5

StarFive:
Watchdog nodes for both the JH7110 & its forerunner, the JH7100. PMU, P
being power, support for the JH7110. PMIC and frequency scaling support
for the JH7110 equipped VisionFive 2.
Most of the DT bits for the JH7110, and the SBCs using it, are pending
support for one of the clock controllers, so it's a smaller set of
changes than I would have hoped for.

Misc:
Pick up some dt-binding cleanup that Palmer assigned to me & had no
uptake from the respective maintainers. My powers of estimation failed
me again, with part of my motivation for picking them up being the
addition of new platforms that ended up not making it. Hopefully next
window for those, as they were relatively close.
Exclude the Allwinner and Renesas subdirectories from the Misc.
MAINTAINERS entry, since I do not take care of those.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      MAINTAINERS: exclude maintained subdirs in RISC-V misc DT entry

Geert Uytterhoeven (2):
      dt-bindings: timer: sifive,clint: Clean up compatible value section
      dt-bindings: interrupt-controller: sifive,plic: Sort compatible values

Mason Huo (2):
      riscv: dts: starfive: Enable axp15060 pmic for cpufreq
      riscv: dts: starfive: Add cpu scaling for JH7110 SoC

Walker Chen (1):
      riscv: dts: starfive: Add PMU controller node

Xingyu Wu (2):
      riscv: dts: starfive: jh7100: Add watchdog node
      riscv: dts: starfive: jh7110: Add watchdog node

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |  2 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    | 21 ++++-----
 MAINTAINERS                                        |  2 +
 arch/riscv/boot/dts/starfive/jh7100.dtsi           | 10 +++++
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 33 ++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           | 50 ++++++++++++++++++++++
 6 files changed, 104 insertions(+), 14 deletions(-)

--SPHo1XrUdCMqV28R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIdikgAKCRB4tDGHoIJi
0kAsAP43klKSezOHEa+QjF/QQ1f1fyxvtAySDNTSsEgojKc4fwEApbFEslQl464M
jxjezMJexYghxGs/PE8sYABSIHdfmwM=
=pmTY
-----END PGP SIGNATURE-----

--SPHo1XrUdCMqV28R--
