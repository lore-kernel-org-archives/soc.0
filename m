Return-Path: <mripard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558A2C63697
	for <soc@archiver.kernel.org>; Sat, 28 Nov 2020 10:57:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DD49222363; Sat, 28 Nov 2020 10:57:11 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4EA3C21534;
	Sat, 28 Nov 2020 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606561031;
	bh=/cYCB9ubtMCYTyW8pXjqV4uW11YWkL9TfmjWd+n+iag=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=ionA9ywttwYEAEJVyHYxwU4L0L0Gp3+elpQ9ISYpew0EXy+MQk92MbJCjNMTpJnmE
	 1/JgQrrxEJnAv5LzFFmXrs1WpRU1TiPZyPMwUvV5nCAhrsfwzgVNPBZ5GBEfJQMbFx
	 59xU9AC8aUM4OZyGuDVDrU1b146NlgQs77tnHQVc=
Date: Sat, 28 Nov 2020 11:57:09 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner Fixes for 5.10
Message-ID: <1280f1de-1b6d-4cc2-8448-e5a9096a41e8.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 107954afc5df667da438644aa4982606663f9b17:

  arm64: dts: allwinner: h5: OrangePi Prime: Fix ethernet node (2020-10-29 10:29:49 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.10-2

for you to fetch changes up to a7361b9c4615951f52ffd2b1afa09a1384c7b4e4:

  ARM: dts: sun7i: pcduino3-nano: enable RGMII RX/TX delay on PHY (2020-11-24 15:24:28 +0100)

----------------------------------------------------------------
A few more RGMII-ID fixes, and a bunch of other more random fixes
-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8Is4AAKCRDj7w1vZxhR
xbAjAP4ohHei2PZ3mHF6wU9kBv4lM2aV60mqvKDFirMdfQBNoAD/Y5fMBAVp6yJn
lRECtoJdPWI4x97ZNZMR4xX1XVSXoQk=
=aO5k
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Adam Sampson (1):
      ARM: dts: sun7i: pcduino3-nano: enable RGMII RX/TX delay on PHY

Icenowy Zheng (1):
      ARM: dts: sun8i: v3s: fix GIC node memory range

Jernej Skrabec (1):
      arm64: dts: allwinner: h6: orangepi-one-plus: Fix ethernet

Matteo Scordino (1):
      ARM: dts: s3: pinecube: align compatible property to other S3 boards

Pablo Greco (3):
      ARM: dts: sun7i: bananapi: Enable RGMII RX/TX delay on Ethernet PHY
      ARM: dts: sun8i: r40: bananapi-m2-berry: Fix dcdc1 regulator
      ARM: dts: sun8i: v40: bananapi-m2-berry: Fix ethernet node

Paul Kocialkowski (1):
      ARM: sunxi: Add machine match for the Allwinner V3 SoC


 arch/arm/boot/dts/sun7i-a20-bananapi.dts                      |  2 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts                 |  4 ++--
 arch/arm/boot/dts/sun8i-s3-pinecube.dts                       |  2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi                              |  2 +-
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts             | 12 ++++++------
 arch/arm/mach-sunxi/sunxi.c                                   |  1 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts |  2 +-
 7 files changed, 13 insertions(+), 12 deletions(-)



--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8ItBQAKCRDj7w1vZxhR
xRJrAPoDDYc5fQDvi9gismOGix+4mdxZuVMpmRjezPkIhjGMgAD7B9Z9mZBTXkDS
CG1stNc0tv7CouM0c895t9wAe4rsWQg=
=63O7
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
