Return-Path: <mripard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7BCC433E0
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 17:49:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0F71564E49; Sun, 31 Jan 2021 17:49:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7739964E3F;
	Sun, 31 Jan 2021 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612115398;
	bh=o45F2DNylSBs42IMrTjFyOsU4MOYtEgGoumKmSvuIR8=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=mtSOmhIkDCkcpLgR2YNU+CkD//j03B/pVxJpHqPPzVit2B6Xxj0K15qvXyOQyiaNX
	 Drf16/DqmxQe0LGXBq0Jn1qb3KgJ/DvQwOID8us6OcBM4tkt7V0YE1x7XOTFT5Hf+4
	 BcAXrbiHBoTsxZZUnYMqV5UKNOp+3zkbWrgLs/qLP2YvkMCbbcWUT+F+m/YKIl7VCV
	 poh6v1lj9IFt8WfzuI0Jg9FwKoRD97zddzblKRUu7cQJbPbQI3z1XoQnqoWYpqLFLe
	 a0o6tmDxvJTDGJmKLPDkwWzbW0d0VUDUlbNU2RPx3dnXv1WBCqBDHViGWn9XV0ZUq0
	 vghctXLMJG6DQ==
Date: Sun, 31 Jan 2021 18:49:56 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.11
Message-ID: <50368e09-c84f-4015-a6f8-70e75e12720d.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.11

for you to fetch changes up to 4e238bfd83f320b6a272a08db7b3c0fbdbc3a633:

  ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode (2021-01-28 15:58:52 +0100)

----------------------------------------------------------------
One fix for a phy-mode ethernet issue, and one to fix the display output on
SoCs with the Display Engine 2

----------------------------------------------------------------
Hermann.Lauer@uni-heidelberg.de (1):
      ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode

Paul Kocialkowski (1):
      soc: sunxi: mbus: Remove DE2 display engine compatibles


 arch/arm/boot/dts/sun7i-a20-bananapro.dts | 2 +-
 drivers/soc/sunxi/sunxi_mbus.c            | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)



--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYBbtxAAKCRDj7w1vZxhR
xW+TAQDprceyuj02kMrcyldLK/ja7Asqb0vdYm7VFWKVGdtMfAEA3U3yUfDKNEyY
fYmRFtrjGI0xmQV4Clt5nuZTicN5DAk=
=47Ia
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
