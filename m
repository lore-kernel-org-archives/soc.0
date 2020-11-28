Return-Path: <mripard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9575C63697
	for <soc@archiver.kernel.org>; Sat, 28 Nov 2020 11:28:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A7E26222C2; Sat, 28 Nov 2020 11:28:05 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 23BC522268;
	Sat, 28 Nov 2020 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606562885;
	bh=yL6yOiJsoBs8VnuA353EZ2heqALtChgfYWsGqfzPpvQ=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=EItJU/b61FIDeC8XcLqHZ0CjASC/BWE9Jnhv0w7yCbC8zPtPJZDkSU22nO5JB0SZE
	 w8XuIPTDv22UsN4VtMGtbDUqBlCI2TPetD4bpVxG96UwJY0TM5R5V5YDbgcXeZXMH8
	 ogSEpKm5lvXOw1l0fHCro7g0+SCjnY7zrTsGQjxQ=
Date: Sat, 28 Nov 2020 12:28:03 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Device Tree Changes for 5.11
Message-ID: <551fdf4f-8a0b-4a22-ba49-b4f61520a9ab.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-dt-for-5.11

for you to fetch changes up to 036b7334ee6dc10115fbaebd8b04c9e4a17eccb2:

  ARM: dts: sun8i-h2-plus-bananapi-m2-zero: add gpio-line-names (2020-11-24 15:24:59 +0100)

----------------------------------------------------------------
Our usual bunch of patches to support the Allwinner SoCs, this time
adding:
  - Some nice pinephone additions
  - I2S support for the A64, H3, H5 and H6
  - New boards: Elimo Impetus, Elimo Initium, FriendlyArm ZeroPi, NanoPi R1

----------------------------------------------------------------
Jernej Skrabec (2):
      arm64: dts: allwinner: h6: PineH64 model B: Add wifi
      arm64: dts: allwinner: h6: Add I2S1 node

Luca Weiss (1):
      arm64: dts: allwinner: pinephone: Add LED flash

Marcus Cooper (2):
      arm64: dts: allwinner: a64: Add I2S2 node
      arm: dts: sunxi: h3/h5: Add I2S2 node

Matteo Scordino (5):
      dt-bindings: vendors: add Elimo Engineering vendor prefix
      ARM: dts: sun8i: V3/S3: Add UART1 pin definitions to the V3/S3 dtsi
      ARM: dts: sun8i: s3: Add dtsi for the Elimo Impetus SoM
      dt-bindings: arm: sunxi: add Elimo bindings
      ARM: dts: sun8i: s3: Add dts for the Elimo Initium SBC

Michael Klein (1):
      ARM: dts: sun8i-h2-plus-bananapi-m2-zero: add gpio-line-names

Ondrej Jirman (3):
      arm64: dts: allwinner: pinephone: Add light/proximity sensor
      arm64: dts: allwinner: pinephone: Add WiFi support
      arm64: dts: allwinner: pinephone: Add Bluetooth support

Paul Kocialkowski (1):
      ARM: dts: sun8i-v3s: Add I2C1 PB pins description

Samuel Holland (3):
      arm64: dts: allwinner: pinephone: Remove AC power supply
      arm64: dts: allwinner: pinephone: Set ALDO3 to exactly 3v0
      arm64: dts: allwinner: pinephone: Use generic sensor node names

Serge Semin (1):
      arm64: dts: allwinner: h6: Harmonize DWC USB3 DT nodes name

Yu-Tung Chang (2):
      ARM: dts: sun8i: add FriendlyArm ZeroPi support
      ARM: dts: sun8i: h3: Add initial NanoPi R1 support


 Documentation/devicetree/bindings/arm/sunxi.yaml             |  23 ++-
 Documentation/devicetree/bindings/vendor-prefixes.yaml       |   2 +-
 arch/arm/boot/dts/Makefile                                   |   3 +-
 arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts         |  64 +++++-
 arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts                     | 169 ++++++++++++-
 arch/arm/boot/dts/sun8i-h3-zeropi.dts                        |  85 ++++++-
 arch/arm/boot/dts/sun8i-s3-elimo-impetus.dtsi                |  44 +++-
 arch/arm/boot/dts/sun8i-s3-elimo-initium.dts                 |  29 ++-
 arch/arm/boot/dts/sun8i-v3.dtsi                              |   5 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi                             |   6 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                           |  13 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts   |   5 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts   |   5 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.2.dts   |  14 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi      |  68 ++++-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi                |  14 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts |  15 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi                 |  15 +-
 18 files changed, 570 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts
 create mode 100644 arch/arm/boot/dts/sun8i-h3-zeropi.dts
 create mode 100644 arch/arm/boot/dts/sun8i-s3-elimo-impetus.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-s3-elimo-initium.dts



--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8I0QwAKCRDj7w1vZxhR
xZVmAP9CIl9EMkFZpij9BIoaDI0HQebi8atwLDof2GSNqEZZrgD/dc3QFXV8oeAB
uDg92AymSG5Ebgv+gMebiPtjI9oTZgs=
=gicQ
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
