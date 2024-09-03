Return-Path: <SRS0=EMoo=QB=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EE1CD3447
	for <soc@archiver.kernel.org>; Tue,  3 Sep 2024 15:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC499C4CECB; Tue,  3 Sep 2024 15:56:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 658ACC4CEC8;
	Tue,  3 Sep 2024 15:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 658ACC4CEC8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 483FulIV053355;
	Tue, 3 Sep 2024 10:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725379007;
	bh=lNboAUPHi4YBTwEpNuGV9LWf+wbkGzQEcG6L8MZqy38=;
	h=Date:From:To:CC:Subject;
	b=ROpa+ORreO1reUsrAxEwguBwGT5qLJEv/+TR8pYb0OXAmawtp4zbfs5wr/XtZTRfv
	 e80BLgf6nDJNM0mW9QJ4hG5QkMby2LBmWIeZZi/piTVT62QRBu81vzImJT7J/dubXA
	 3TL+0ug8VxbXivXl5B43yGJYAlQ0yCbqFefu0p2A=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 483FulGV070614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Sep 2024 10:56:47 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Sep 2024 10:56:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Sep 2024 10:56:47 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 483FulXb002487;
	Tue, 3 Sep 2024 10:56:47 -0500
Date: Tue, 3 Sep 2024 10:56:47 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 2/3] arm64: defconfig: TI K3 platform updates for v6.12
Message-ID: <20240903155647.jy2uparewobeekrd@dreamless>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="liknjytimeji63s3"
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--liknjytimeji63s3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-c=
onfig-for-v6.12

for you to fetch changes up to e8c643daeaa9040e18f8349993b9bc504e9d2117:

  arm64: defconfig: Enable E5010 JPEG Encoder (2024-08-28 12:22:58 -0500)

----------------------------------------------------------------
TI K3 defconfig updates for v6.12

- Enable E5010 JPEG Encoder as kernel module

----------------------------------------------------------------
Devarsh Thakkar (1):
      arm64: defconfig: Enable E5010 JPEG Encoder

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--liknjytimeji63s3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmbXMbkACgkQ3bWEnRc2
JJ05/g//TJEYAMPe4pTqwhF/aZH/Ys/pKjbzPpAAAaEpNUw9RYjWLaLykeVkImCN
HukIc3AyfNQMgrUOVjXZacyhXQ6/CY40BvfpQeiTcj8inM/h6Z2JFqjY7KIuRc4a
3ll1//Y2CEx01JtAJ6acLtMhVPvpEdDJ8e7zVpP68DRDyJ5iqkmoI8EbAzwgXFrG
Q5poIXM6f7kKvrhRxzY7Z6W3sjwvUtjK7t55J6rjQxcm3YXAzroUyel92AmzIEhm
gniJ5POXiO+q0D+t7XGUa62qNga0Rz0CCNdTYQd3CRsrXyh2xkmHxHgjd1Tekng0
XNbCB+uL0W2dP7dHvr1Ic1UwJi41wxmxWeMs6EfqYYmDLcUC/Zyd2QCkcGQfh3WS
ON3YEGbAAlQzui4UL7ZBeF1Z4c5gQf2OrvsPCdougZ+U8C9SR74VW2cglOZIl9hM
LcfuiRM5Vi3LgFlzH5SeSIaiwjDjZZIPxy11vuqmmFA0jE8RB4W/Gy2RRFNsa/de
M1ez3Pz9bvp9d8Ee5+V1uPvasyA+p+TgZat1LB4+b0R6QmTx45a8y1i5BSY3O9ef
x2RdHxWr0+DcP1wPwVxLNsvqVq8KWid4Lknsrv7p2sIcUVhfU2OWtRyj0xh3Lk7N
+PpXdxuSNFOJmakQLav3dCovdXd1SKRUWBb1mRCYFpqNTNPxUsY=
=2WIJ
-----END PGP SIGNATURE-----

--liknjytimeji63s3--
