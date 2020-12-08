Return-Path: <mripard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB44C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:23:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5ABCD23B00; Tue,  8 Dec 2020 16:23:34 +0000 (UTC)
Date: Tue, 8 Dec 2020 17:23:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607444614;
	bh=/7QotKMWAMqIFwyw338k97dDjO+o3q03uwwUE5E3RKA=;
	h=From:List-Id:To:Cc:Subject:From;
	b=P7DF03n4eUjr9tBDl1rg2KPWkQ4ofiZqHHh57fY9t1YgBH1BIuonsDLK+h2KlbUp7
	 akFTcetKDKnf7+7HZP61SdrWXUYnCEEHMRsPx/3YyN88VvPcC62Qs9lrqv1FLnA7cU
	 x3YCDHD2Ksu8+8gPHMmj/ZgNZLSyYzkKqUIR0+ubcucQWgDy+MGVeHVkUqB3RUcucq
	 KZwy5MljE2XX1OJaUZaGbwcTM430Kq2bG7Wg5bUK8pLDHodGj33gHeYr+2uFlXaZen
	 MCW+BFTUBmOGviX1VlFIs3owPuVA3V21ESPSgootI8AbmqS3o1UYVnbYp5sHzk6KqS
	 kHvRHQO7lyTlA==
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.10, Take 3
Message-ID: <2a351c9c-470f-4c5e-ba37-80065ae0586d.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit a7361b9c4615951f52ffd2b1afa09a1384c7b4e4:

  ARM: dts: sun7i: pcduino3-nano: enable RGMII RX/TX delay on PHY (2020-11-24 15:24:28 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.10-3

for you to fetch changes up to d0c6707ca4235b78d06bcd62f0e24fbeac3e6d10:

  arm64: dts: allwinner: H5: NanoPi Neo Plus2: phy-mode rgmii-id (2020-12-01 11:33:33 +0100)

----------------------------------------------------------------
A few more RGMII-ID fixes

----------------------------------------------------------------
Heinrich Schuchardt (2):
      arm64: dts: allwinner: A64 Sopine: phy-mode rgmii-id
      arm64: dts: allwinner: H5: NanoPi Neo Plus2: phy-mode rgmii-id


 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)



--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8+ohAAKCRDj7w1vZxhR
xYUWAP0ZyJrIhbE+bfOEIV9L5bVa3ohWM0ZHKW5WS40pwl9d2gD/dTcN3awvmSfu
BB8VOtBFHppL1t89EPwjbNnHbxfQPw4=
=KU8G
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
