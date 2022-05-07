Return-Path: <SRS0=0pa8=VP=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8F7C433F5
	for <soc@archiver.kernel.org>; Sat,  7 May 2022 16:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54A4CC385A9; Sat,  7 May 2022 16:34:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86247C385A6;
	Sat,  7 May 2022 16:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86247C385A6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 247GYZsr111500;
	Sat, 7 May 2022 11:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651941275;
	bh=Hur27LN4fekLufj1k16EnyuF+7Y01NJ48WB1vYzscoU=;
	h=Date:From:To:CC:Subject;
	b=tXiML59uN5LW6pw2muk8PTW7+B1plviyQQwwtu3r5HFX7DEWEB7EWuhWunXpFMsCz
	 b1jYoWtoUpMmdEEXHjnuY0/Z+U2vuYpzz/UixyM3aQkk+hQo3aFbhIq19R5BlVuPDp
	 a60BB+QTflfPXsfndOJH+vxM/dt53FeJRIVP1ZPE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 247GYZHE028615
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 7 May 2022 11:34:35 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 7
 May 2022 11:34:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 7 May 2022 11:34:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 247GYZvu059962;
	Sat, 7 May 2022 11:34:35 -0500
Date: Sat, 7 May 2022 11:34:35 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Subject: [GIT PULL 2/2] ARM: dts: TI K2 updates for v5.19
Message-ID: <20220507163435.tcg46cacwqhe7n64@busily>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vqftsuyxs5fplaqg"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--vqftsuyxs5fplaqg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC maintainers,

    Please pull:

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-keysto=
ne-dt-for-v5.19

for you to fetch changes up to 6273a1864d437553ab4220d1abc010c5bb758ad2:

  ARM: dts: keystone: Fix missing fallback and case in SPI NOR node compati=
ble (2022-04-22 13:48:38 -0500)

----------------------------------------------------------------
Keystone2 device tree updates for v5.19

* Cleanups for SPI NOR / flash

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: keystone: Align SPI NOR node name with dtschema
      ARM: dts: keystone: Fix missing fallback and case in SPI NOR node com=
patible

 arch/arm/boot/dts/keystone-k2e-evm.dts  | 4 ++--
 arch/arm/boot/dts/keystone-k2g-evm.dts  | 2 +-
 arch/arm/boot/dts/keystone-k2g-ice.dts  | 2 +-
 arch/arm/boot/dts/keystone-k2hk-evm.dts | 4 ++--
 arch/arm/boot/dts/keystone-k2l-evm.dts  | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--vqftsuyxs5fplaqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmJ2n44ACgkQ3bWEnRc2
JJ0tFhAAqPLkuqmvJv1Y4utKl8Hpa4Pst3VI9H1+bVnz5tDwWzUSx+4a1zQLxgcv
ZcJkRTgMhlG8zGIzevGNErnVkbLmuqzdP/VNWNfsLN4ed/bxpMzMwg3DhUi/fyRg
ZpotfG3Rut/F5U/AGgY0Qx/r02pRdXudoOLCsX8ZK+if05y4me6uk0CYc5oep2hD
bTE/qAE04aCPhfUxSt6qULnj5vgITB7+EP2cDqLm6vpE+0pnu+zAYoLNsbv5jN9v
pBmVNemnr62nPOOwfLfUT3130tnkA5wvKEdBGQDfBdoDuJBqBbQ0epaDFoyncUxr
pJh2C2Y+Gs97G/04YiyADyalSmVBbe+CFOY6By+cYPBbOOkYdNY1etjdpGi1QaM1
Uf1e7EGCZHOPlkouby9M1mmxx8ep1C2kkwELJXuv1YpPRcb/0hEclGViLs9J47v8
LvEB4du31SqUiN0bs7z77OEUdgI8Fc9MzxziKaOmTHNwIkAHDTFMBhEHsBjZJes4
oiKxT6Pm+V87rFfe6z5JuGitjVBv8G/tNXW13ZsHo4dKI9UdjmZuGv0sKL2yTlvg
dTuQlTMlLC36Ax4fbSFBlluPOs0QDs9WGut+uVGrnGzu0spKInX0RIQ18m7FeHrg
7nDm0peVFbzu3G/2tIXQT6K9fVsJvDIXrAjtFmla+y/lLuQciX4=
=GYEt
-----END PGP SIGNATURE-----

--vqftsuyxs5fplaqg--
