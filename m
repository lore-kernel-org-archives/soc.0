Return-Path: <mripard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED56CC63697
	for <soc@archiver.kernel.org>; Sat, 28 Nov 2020 11:23:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8C38122267; Sat, 28 Nov 2020 11:23:22 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F229A2225B;
	Sat, 28 Nov 2020 11:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606562602;
	bh=Fb+Os1PYtt6COcev3JawUJMpwwVO5wyoTa/v/BR+q/k=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=Go20SRzZtpDNCgX+DB4nPWvRQwnNFBcuw2N3cZenMMDkDvMZ6nMzJMKm+Okj3c7vO
	 3ApPPIuoq52xvCR2MHy9mS45w2mSAYAV8NfQgvqbtTF7ZfG/USTs0A0uFcCq55+ZlB
	 JIiVNq4zgmsoIKXHXuN4+GhDBHIEC4HhmA7NC7Qc=
Date: Sat, 28 Nov 2020 12:23:20 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner arm Defconfig Changes for 5.11
Message-ID: <dffb8a7e-27ea-4025-868a-caa5868eb1ef.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-config-for-5.11

for you to fetch changes up to 38c212c90bf172547dc7df7c11fcaacef2c78696:

  ARM: configs: sunxi: enable Realtek PHY (2020-11-16 16:52:06 +0100)

----------------------------------------------------------------
One patch to add the Realtek PHY driver to sunxi_defconfig

----------------------------------------------------------------
Corentin Labbe (1):
      ARM: configs: sunxi: enable Realtek PHY


 arch/arm/configs/sunxi_defconfig | 1 +
 1 file changed, 1 insertion(+)



--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8IzKAAKCRDj7w1vZxhR
xcIUAQDO82yvQVfOTAuPgiq/RuUy46PKcdeiXzkX7HHpXyOvgQD/V+WpyLCMxPxu
8VQ//kvm3Kcu8FzKfIH48ZDgXxT0pw4=
=I+yx
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
