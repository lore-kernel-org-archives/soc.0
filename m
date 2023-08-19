Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2A5EE4993
	for <soc@archiver.kernel.org>; Sat, 19 Aug 2023 09:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7A55C433C9; Sat, 19 Aug 2023 09:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28A9C433C7;
	Sat, 19 Aug 2023 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692435637;
	bh=BvLLtPHmuVn5jXoaUEc5QwpHH/VMreVnaclIg/9H7VI=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=POIAZ7rYBOL08BxML3S0bWrzDqZeA8eR+usM0Lxc3W1wtByMTCXkam5hJZ+G2OjpV
	 hwoSPHGdx5k/r+4AlCcyaFs1C8TH0DIfWOqUAe+LJ84OYFJv71KmzaLPK9eNG7/WpJ
	 3bjyppQ1lSFJyekQ7x/k8nOYxLjXvy3g98AhyXhCrghP14HBu8MGUt5LeW5uoEeNjY
	 KG9t7vapjivhu60KXsh0PoL+WYQynWFp394udTlHGsMsNL+JhWjjHKB8HF5egXOusi
	 shfhm1+MBcf/6xo3MXBiefIFZ06TsqGoVbWMn1895ruEtMJ0WoZA/Yzq2sBvkII0eO
	 43xB/9HLSn9+Q==
Date: Sat, 19 Aug 2023 10:00:34 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.6-pt2
Message-ID: <20230819-unwieldy-railing-9bba2b176aa7@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YbUXnae9IuboxlbM"
Content-Disposition: inline


--YbUXnae9IuboxlbM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

If it's not too late, could you please take this part 2? There's not too
much in here, mainly another minimal th1520-based devicetree for the
BeagleV Ahead.

Thanks,
Conor.

The following changes since commit f331eb1f5454123f3cec51c18a3d86c2a53bddb9:

  riscv: dts: starfive: jh7110: Fix GMAC configuration (2023-08-13 11:12:20 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.6-pt2

for you to fetch changes up to a3ce3ff28385c7c0f8503e83f5d42d2083e16390:

  riscv: dts: change TH1520 files to dual license (2023-08-16 18:59:30 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.6 Part 2

T-Head:
Add a second minimal devicetree for the second board using the th1520
SoC, the BeagleV Ahead. As with the Lichee Pi 4a, this is sufficient
only for booting to a console, with work on the mmc, clocks and ethernet
sides of things under way. A relicense to a dual licence for the
existing devicetree files is also done, for good measure.
RISC-V Devicetrees for v6.6-pt2

StarFive:
Fix the sort order of some nodes that I resolved incorrectly during a
merge conflict.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: starfive: fix jh7110 qspi sort order

Drew Fustini (3):
      dt-bindings: riscv: Add BeagleV Ahead board compatibles
      riscv: dts: thead: add BeagleV Ahead board device tree
      riscv: dts: change TH1520 files to dual license

 Documentation/devicetree/bindings/riscv/thead.yaml |  4 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           | 38 +++++++-------
 arch/riscv/boot/dts/thead/Makefile                 |  2 +-
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 61 ++++++++++++++++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  2 +-
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  2 +-
 arch/riscv/boot/dts/thead/th1520.dtsi              |  2 +-
 7 files changed, 88 insertions(+), 23 deletions(-)
 create mode 100644 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts

--YbUXnae9IuboxlbM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOCEsgAKCRB4tDGHoIJi
0nwpAP97ZJZHIF7AkudTpUPS3lAKv0jhD/WkAb3okaY9O8A7CAEA1jcwLI64e+NO
NxOLJ9HqChVyq2BWbJeF9Uh/IXbupQo=
=BjEr
-----END PGP SIGNATURE-----

--YbUXnae9IuboxlbM--
