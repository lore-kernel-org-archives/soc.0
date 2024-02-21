Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D708FC48BEB
	for <soc@archiver.kernel.org>; Wed, 21 Feb 2024 16:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9228C43390; Wed, 21 Feb 2024 16:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6D2C433C7;
	Wed, 21 Feb 2024 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708534503;
	bh=g4LFYsR/DPELH1aH2ZKnHYrmTL6y33oCe947sVDwrMQ=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=CzIaz8G146RtHlN24fYN375OSPPCtWn43NswLeZr/U7GMjzXpRILNwu3kTKkVugku
	 IoLeuxpmc+R7rkUhqsh7uUl9Q0pBBpdyeRIrYAKy4LN1bNuGM/aAvoFRYPSkpkcCN9
	 8/0DlD/LAvWDJ9bYsLvSwaHBrS5tPnZOUsspt/prRi7Drl3Bo5tniKfMEk2auiL7mP
	 AEVf/fH/h9GNlpYVkgTKh9foosQxgUEMWZ1eUYZI10/FsU5tiEegYzwGG7GZdho2tk
	 nvpJt8M5R/tS0fU8l0apWEnzdfLYjlD+zgGoMXRr5L/cYjc4n70TnYK6Q+zWFfPGh6
	 JP6q6QJHSWx/Q==
Date: Wed, 21 Feb 2024 16:55:00 +0000
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetree fixes for v6.8-rc6
Message-ID: <20240221-foil-glade-09dbf1aa3fe2@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lXJxKJvQ53XlUP2V"
Content-Disposition: inline


--lXJxKJvQ53XlUP2V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Two small fixes for W=2 issues. The commit from me here co-incidentally
solves the riscv instance of the warning that the series yall were
talking with SFR about today promotes out of W=2.

Cheers,
Conor.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-fixes-for-v6.8-rc6

for you to fetch changes up to ce6b6d1513965f500a05f3facf223fa01fd74920:

  riscv: dts: sifive: add missing #interrupt-cells to pmic (2024-02-14 09:09:33 +0000)

----------------------------------------------------------------
RISC-V Devicetree fixes for v6.8-rc6

Two fixes for W=2 issues in devicetrees, which should constitute fixes
for all reasonable-to-fix W=2 problems on RISC-V. The others are caused
by standard USB and MMC property names containing underscores that are
not likely to ever change.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: sifive: add missing #interrupt-cells to pmic

Krzysztof Kozlowski (1):
      riscv: dts: starfive: replace underscores in node names

 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts |  1 +
 arch/riscv/boot/dts/starfive/jh7100.dtsi            | 12 ++++++------
 arch/riscv/boot/dts/starfive/jh7110.dtsi            |  4 ++--
 3 files changed, 9 insertions(+), 8 deletions(-)

--lXJxKJvQ53XlUP2V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdYq5AAKCRB4tDGHoIJi
0ixNAQC53v6HrBXJxr/nGhVarwPJEC413aGoezjd9ScUzWZDXgEAspL7ZY0YUgU5
JAYggwXriidpJjrDxK04mfn9EiQf1AE=
=nbos
-----END PGP SIGNATURE-----

--lXJxKJvQ53XlUP2V--
