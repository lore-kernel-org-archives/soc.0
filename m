Return-Path: <SRS0=qAFw=CD=ti.com=vigneshr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DDAEB64DA
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 16:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2B32C433CA; Thu, 15 Jun 2023 16:19:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AACD1C433C0;
	Thu, 15 Jun 2023 16:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AACD1C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FGJlPP119154;
	Thu, 15 Jun 2023 11:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686845988;
	bh=LmVOme9LHB02OdQvAZQoJWbInqaMM4fuGeRkihp0XUs=;
	h=Date:To:CC:From:Subject;
	b=JysRzWGJUiCBOxz/G1Uly1ZW3nSFJeM1zSe83n9W8+87wQ2ytUCiPGHZWZCHhHG5v
	 J9P9Wl9l2Km7togf68zMSSlTaKreWzXjg5GFi8u61hxyTbplO73tlbeoCTNGkso2lY
	 HqkqXAvGCKJIf8RylyHX3Hy5/744tpn+N2OM+XXU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FGJlte086827
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 11:19:47 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 11:19:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 11:19:47 -0500
Received: from [172.24.145.182] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FGJinQ029593;
	Thu, 15 Jun 2023 11:19:45 -0500
Message-ID: <97a49740-32e7-f899-d153-743b5a57eba7@ti.com>
Date: Thu, 15 Jun 2023 21:49:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        SoC
	<soc@kernel.org>, arm-soc <arm@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL 1/2] arm64: defconfig: TI K3 updates for v6.5
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------mFBPbzaHeTZD2ySUQ2VxO7pr"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--------------mFBPbzaHeTZD2ySUQ2VxO7pr
Content-Type: multipart/mixed; boundary="------------bomIt4xh3tp0SWDk089kYHA2";
 protected-headers="v1"
From: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 SoC <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <97a49740-32e7-f899-d153-743b5a57eba7@ti.com>
Subject: [GIT PULL 1/2] arm64: defconfig: TI K3 updates for v6.5

--------------bomIt4xh3tp0SWDk089kYHA2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d=
1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-config-for-v6.5

for you to fetch changes up to 95b4d23907f29de96f8757a43d16b7a440836ea1:

  arm64: defconfig: Enable UBIFS (2023-06-15 11:54:30 +0530)

----------------------------------------------------------------
TI K3 defconfig updates

Enable AM62 Verdin board peripherals
Enable UBIFS support for OSPI NOR/NAND Filesystem on K3 platforms

----------------------------------------------------------------
Dhruva Gole (1):
      arm64: defconfig: Enable UBIFS

Francesco Dolcini (1):
      arm64: defconfig: enable drivers for Verdin AM62

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

--=20
Regards
Vignesh

--------------bomIt4xh3tp0SWDk089kYHA2--

--------------mFBPbzaHeTZD2ySUQ2VxO7pr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEyRC2zAhGcGjrhiNExEYeRXyRFuMFAmSLOiAFAwAAAAAACgkQxEYeRXyRFuNq
8QgAslDtUxLVIFqYvdg+6We68vOc6tYFL+Xs3DHlqeIOTyGyhexj+zSTExOar7FMIrmlL/j1n1qK
0Gpn5hNMA4VUVaxdX9ufUkb8Ja7YlEKncyq2HxsdIqHC9OFPD3BoOXi/2C0hyY/ilqE46vDfxwMu
08+hZekrQe1nwufWmvM/VGsgwX6n1+6AvGL2ISp6mAoHeFd2BQvM5kEsGYxuJS+WYKPhAEotGPcj
1SlIsFO5v+meV+s9+9iWY/7xxEGkBKz7knSPgu+njIiib1zQ5hXPFlP2pKaO2i+aAJ6AW6kjn+T3
SmnL6ixePhH3oKHf1uv+C33SbC4QFHZXBIIISaO5BQ==
=tITu
-----END PGP SIGNATURE-----

--------------mFBPbzaHeTZD2ySUQ2VxO7pr--
