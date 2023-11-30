Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153A6C4167B
	for <soc@archiver.kernel.org>; Thu, 30 Nov 2023 11:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2D1EC433C7; Thu, 30 Nov 2023 11:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB754C433C8;
	Thu, 30 Nov 2023 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701345286;
	bh=uloZUNW5ey3hM4mum0GKdS/g8cqruhOwU6aMx6keMqg=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=Yfw1liF+EwisUbW/e66jpzSNuvC54kH9pRgWd9/eR0RfFWN9CsnjW5SUFgUnKL7fc
	 21qtXkmBqd7DziaAoxM+3HP5kFOIjequ7KNcYpziyXCE9Zc0mIW3JK1Uo+MXHdAP9N
	 vF4lh0NrNWmZk7Ql1WXMQRDgRbRF3KlfsDSYOat+cg5YQfxebIuAyMM+cdHq1QpWbn
	 nB3m7luiKRQj3H023Slcy2hTh7kkoziA5xCIImGGvylPJdZ/cQgS173otcHPiwItcj
	 XeyKxku49u33oCyVJ8+9fuMr+G+ZC5v5P0+Wjo/LPft5fEG3ugwsB8JRyyu5V2Uy3i
	 XEI84qD8XirZg==
Date: Thu, 30 Nov 2023 11:54:43 +0000
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetree fixes for v6.7-rc4
Message-ID: <20231130-maternity-majestic-dd29f0170050@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/SaH/acr2lICzyUl"
Content-Disposition: inline


--/SaH/acr2lICzyUl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

There's barely anything here, but it was annoying me seeing the
dtbs_check issues in mainline so I figured I'd send a PR anyway.

Cheers,
Conor.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes-for-v6.7-rc4

for you to fetch changes up to 79997eda0d31bc68203c95ecb978773ee6ce7a1f:

  riscv: dts: microchip: move timebase-frequency to mpfs.dtsi (2023-11-26 11:44:51 +0000)

----------------------------------------------------------------
RISC-V Devicetree fixes for v6.7-rc4

Two fixes, both rather minor. The first fixes some dtbs_check warnings
introduced after an update to the bindings, that returns the
architecture to being clean of dtbs_check issues. The second relocates
a soc-specific property to the appropriate location in $soc.dtsi, and
hopefully avoids the same mistake being copy-pasted into more
devicetrees.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      riscv: dts: sophgo: remove address-cells from intc node
      riscv: dts: microchip: move timebase-frequency to mpfs.dtsi

 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts    | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts    | 7 -------
 arch/riscv/boot/dts/microchip/mpfs.dtsi           | 1 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi           | 1 -
 7 files changed, 1 insertion(+), 36 deletions(-)

--/SaH/acr2lICzyUl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWh4AwAKCRB4tDGHoIJi
0uD1AP41ASM/NINZRhHMzxuIj0DARhKNBd9Nc190aZXZm9QRWAEA1q6ntbtNTUo0
Ousy9rTtXSAwKQUYSSHvqFTu48QDQA8=
=ex0/
-----END PGP SIGNATURE-----

--/SaH/acr2lICzyUl--
