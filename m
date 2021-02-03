Return-Path: <mripard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703A3C433DB
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 10:12:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2F07464F76; Wed,  3 Feb 2021 10:12:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91C8264F59;
	Wed,  3 Feb 2021 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612347134;
	bh=lYZV+iTt8iwzbM/OGTI6+G2prOyqKi7zswaG66UM5Zw=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=HEnTTH61qzLPofWT4a32iv0uUQM4TlTbrdVUduKHy6rItL48B7d4YunAXXVTLUzdZ
	 LxtWN2JoDZnRRDXZwmNDMIfmsrGNUbwavk0xrDOIEu/DZaZ7xQnTAA98N6WL7vC6ZS
	 uI+VLzyFYMntLq1mR5an1KWBxQqlA2F+VH0FX2Q4RRM++MD3EP9IpjKyBtNJBSOQXf
	 9g9O+tQCugx6Kux6kj21D+4sXrXoIIlleiQRsxT0IhZPxfZf9vay7O07hNuGBtZI7U
	 MPhep2FixIoSX3OPpoH3kXyY4d30J+0/rB27bCyztgjs5DI3WD1aks78GJNYOhl5MW
	 Jf8AGZL6IDjOQ==
Date: Wed, 3 Feb 2021 11:12:11 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.11, Take 2
Message-ID: <f8298059-f9ca-43b4-9e29-35bc0e0c9b15.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the current release. It supersedes
the one you reverted that was missing my Sob.

Thanks!
Maxime

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.11-2

for you to fetch changes up to a900cac3750b9f0b8f5ed0503d9c6359532f644d:

  ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode (2021-02-03 11:09:05 +0100)

----------------------------------------------------------------
One fix for a phy-mode ethernet issue, and one to fix the display output on
SoCs with the Display Engine 2

----------------------------------------------------------------
Hermann Lauer (1):
      ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode

Paul Kocialkowski (1):
      soc: sunxi: mbus: Remove DE2 display engine compatibles


 arch/arm/boot/dts/sun7i-a20-bananapro.dts | 2 +-
 drivers/soc/sunxi/sunxi_mbus.c            | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)



--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYBp2+wAKCRDj7w1vZxhR
xUP5AP43pAg3hZ/nZkLO0e81/ViMks02nezv/o7am6vQX8AShgD/dsWe5hj1JFIO
xOUMRPY8zyqVi+tHEeFk+YRKkoz+HwQ=
=xjkk
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
