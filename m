Return-Path: <SRS0=TXPA=KF=ti.com=vigneshr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D131C5478C
	for <soc@archiver.kernel.org>; Wed, 28 Feb 2024 04:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82C04C43394; Wed, 28 Feb 2024 04:22:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41119C43390;
	Wed, 28 Feb 2024 04:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41119C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41S4MO8o088288;
	Tue, 27 Feb 2024 22:22:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709094144;
	bh=uOMXxiLvdKL4AtXcYa6qxw/0JHnggNcnG64J5RnQQLs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ph7xNvBwh0dZFGGU4+pvLBLEd+xZlaXU4/SxQ+mKwyxWMWcJ+ajx5a1XH3ut/C6yJ
	 Pq3Roo0GJ4whIR1GB+afmNI2Icakam/fRrqnKp2j941bPoaYTSh+On8U7KPEKI+TzS
	 cCBlGgXjr1tmVzWdUrCcDecyHopBGJMatHUok8pk=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41S4MOgC016064
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Feb 2024 22:22:24 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Feb 2024 22:22:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Feb 2024 22:22:24 -0600
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41S4MK5R111529;
	Tue, 27 Feb 2024 22:22:21 -0600
Message-ID: <a555943a-45d0-4e8e-ad25-682638cfcff7@ti.com>
Date: Wed, 28 Feb 2024 09:52:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [GIT PULL 2/2] ARM/arm64: defconfig: Updates for v6.9 for TI K2/K3
 platforms
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm-soc
	<arm@kernel.org>, SoC <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>
References: <e7e984db-47b9-404a-9471-5d2ed0effe1d@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <e7e984db-47b9-404a-9471-5d2ed0effe1d@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------9fx309zh3wgVxU6L6u2LMj0K"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--------------9fx309zh3wgVxU6L6u2LMj0K
Content-Type: multipart/mixed; boundary="------------ZCdoKbjb0TEaZdVZTsgy4z18";
 protected-headers="v1"
From: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>
Message-ID: <a555943a-45d0-4e8e-ad25-682638cfcff7@ti.com>
Subject: [GIT PULL 2/2] ARM/arm64: defconfig: Updates for v6.9 for TI K2/K3
 platforms
References: <e7e984db-47b9-404a-9471-5d2ed0effe1d@ti.com>
In-Reply-To: <e7e984db-47b9-404a-9471-5d2ed0effe1d@ti.com>

--------------ZCdoKbjb0TEaZdVZTsgy4z18
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd3=
3d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-config-for-v6.9

for you to fetch changes up to 02b645583e26f38261711f2a8b36c5db06862527:

  arm64: defconfig: Enable Wave5 Video Encoder/Decoder (2024-02-21 23:41:=
39 +0530)

----------------------------------------------------------------
TI K2/K3 defconfig updates for v6.9

- Enable Wave5 encoder/decoder driver present on multiple K3 SoCs
- Enable K2 boards via multi_v7_defconfig to move away from keystone
  specific defconfig.

----------------------------------------------------------------
Andrew Davis (1):
      ARM: multi_v7_defconfig: Add more TI Keystone support

Brandon Brnich (1):
      arm64: defconfig: Enable Wave5 Video Encoder/Decoder

 arch/arm/configs/multi_v7_defconfig | 16 ++++++++++
 arch/arm64/configs/defconfig        |  1 +
 2 files changed, 17 insertions(+)

--------------ZCdoKbjb0TEaZdVZTsgy4z18--

--------------9fx309zh3wgVxU6L6u2LMj0K
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEyRC2zAhGcGjrhiNExEYeRXyRFuMFAmXetPsFAwAAAAAACgkQxEYeRXyRFuPG
NQf9Hmj4ji1Z/XzFGIS8bGCbXDhVaJCRfpv4aJsnia5rWQvsGUiifFq2p/MqQ0fzbBdZNC1ZSVRy
HNn/Ww4jU6rQvbUetQU99SECUKVyap/3wOUKmIGoyX1Dg9eYRR1/03oOqO6r1L5ySsJ9eRLnrMIY
a/yAKlsBrsoExMvw2gRQGFfUlzkdIP+yVlfsqqCBHUY1beWaIdlBGfZXCMrY2kMJ1JFfK36h88lt
k9/VFaOCFgm9JGyVVI8In+Jj8NqfyaZGsu3w92qA982zCIrAr1KgOl3FpH8CINjbPzU7Vt9EKGpX
V/D+sjCoP45JjADL+EXgHb9tLKzKEDR14Tts3Fvt8Q==
=+QhN
-----END PGP SIGNATURE-----

--------------9fx309zh3wgVxU6L6u2LMj0K--
