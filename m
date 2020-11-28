Return-Path: <mripard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6BDC63697
	for <soc@archiver.kernel.org>; Sat, 28 Nov 2020 11:24:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7B96A22267; Sat, 28 Nov 2020 11:24:32 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E90A82225B;
	Sat, 28 Nov 2020 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606562672;
	bh=l5VaVAUHW2WhwZ3kOPXLkWqghbtPx8Xk8vffBHP7pME=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=x+gWyFvljzi6k50hI/6u41O2XHyr5zxNztD0h1j2Hfec0eUff/cCEyTQmGERIJXLg
	 QQMKP5n1OFMLf0zQgnLPssg31+RBXlfYt4ycXVG1hl/1Q1neCoio7Ldx0hxzpRB3oP
	 OHQ4FmNuqriXpyAyVy4YVzmicssYea3j4UGB9oBs=
Date: Sat, 28 Nov 2020 12:24:30 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner arm64 Defconfig Changes for 5.11
Message-ID: <5ddf5486-a20c-467a-bc67-d5e8fbc38856.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Olof,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags=
/sunxi-config64-for-5.11

for you to fetch changes up to 0536f70989601c64c162107354a03112ab1bb9e6:

  arm64: defconfig: Enable Allwinner i2s driver (2020-11-02 15:09:53 +0100)

----------------------------------------------------------------
One patch to enable the Allwinner I2S controller on arm64's defconfig

----------------------------------------------------------------
Cl=E9ment P=E9ron (1):
      arm64: defconfig: Enable Allwinner i2s driver


 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)



--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8IzbgAKCRDj7w1vZxhR
xfbiAP40iLCU1EivEBOQxmISITs8GZaOeZaQ7Cp1Gbp7m7cR3wD/WLb9zSsSJW6R
DTdJPmSi8pgMr4j/YqsQfYYccwy5Owk=
=oOEs
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
