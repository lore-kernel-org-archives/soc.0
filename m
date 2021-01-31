Return-Path: <mripard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E907C433DB
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 17:59:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1340E64E4C; Sun, 31 Jan 2021 17:59:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CA0764E43;
	Sun, 31 Jan 2021 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612115939;
	bh=tOIxTGcXlIsZPlM/axqMMBVDJKMuW295OToS+3m6rfY=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=GFxyAcgublKxyHZhC0EOlY39FQusllGDrEoXZNOq8ei+guxJHkbe2t8Zpm3GhLUI7
	 Xq2lKcwFhKjo+eVR+lKI0dXYtmP+kT9SaQU7ZNbOxPfb9FELOGlw+dhuyLWB0wIfAC
	 q8cYkhMv7EyecReFy2tZliifFlRUy1CMZm/2k2WrLIm0z63+3h/+1c/Pp3ZTDqwSJB
	 mLP3N5B0b89SI3HBIjiqm3q5LHzFE6vyaUGZtQUb4pb77Nmcu8SPRHmbJaE6BWg3pP
	 n2eLjLgA5X6g2gkEizuXTV4IPCGYgAdgFb2CJLbUPMgTinsLIXbgUqjZf9LsF6cU38
	 POGmI4UQimAiA==
Date: Sun, 31 Jan 2021 18:58:57 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Drivers Changes for 5.12
Message-ID: <91f2980f-266f-41f2-ba10-5a395625498c.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Olof,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags=
/sunxi-drivers-for-5.12

for you to fetch changes up to 308e78946a73e2bfe0ebd4ca9559c153c80bd45f:

  dt-bindings: bus: rsb: Add H616 compatible string (2021-01-28 11:20:12 +0=
100)

----------------------------------------------------------------
Some new drivers changes for the Allwinner SoCs, but mostly runtime_pm and
suspend / resume  support for our RSB bus, and support for the H616


----------------------------------------------------------------
Andre Przywara (3):
      dt-bindings: sram: sunxi-sram: Add H616 compatible string
      soc: sunxi: sram: Add support for more than one EMAC clock
      dt-bindings: bus: rsb: Add H616 compatible string

Chen-Yu Tsai (1):
      Merge remote-tracking branch 'mfd/ib-mfd-bus-5.12' into sunxi/drivers=
-for-5.12

Samuel Holland (4):
      bus: sunxi-rsb: Move OF match table
      bus: sunxi-rsb: Split out controller init/exit functions
      bus: sunxi-rsb: Implement suspend/resume/shutdown callbacks
      bus: sunxi-rsb: Implement runtime power management

Uwe Kleine-K=F6nig (1):
      mfd/bus: sunxi-rsb: Make .remove() callback return void


 Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        =
     |   4 +-
 Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.=
yaml |   1 +-
 drivers/bus/sunxi-rsb.c                                                   =
     | 215 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------=
----------------
 drivers/mfd/axp20x-i2c.c                                                  =
     |   4 +-
 drivers/mfd/axp20x-rsb.c                                                  =
     |   4 +-
 drivers/mfd/axp20x.c                                                      =
     |   4 +-
 drivers/soc/sunxi/sunxi_sram.c                                            =
     |  31 ++++++++----
 include/linux/mfd/axp20x.h                                                =
     |   2 +-
 include/linux/sunxi-rsb.h                                                 =
     |   2 +-
 9 files changed, 188 insertions(+), 79 deletions(-)



--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYBbv4QAKCRDj7w1vZxhR
xXsaAQDM+gtsf7QFU6d4Dl5HfZJL1cxx+5wqJLKLEvznyq7R1gD7Bc5PxCWOXL8r
OGD96cunddq+Tnna66oICSXa0U/CEgc=
=tTu/
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
