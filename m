Return-Path: <SRS0=oGBH=ME=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE89C25B10
	for <soc@archiver.kernel.org>; Wed,  1 May 2024 12:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97335C4AF18; Wed,  1 May 2024 12:43:15 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55843C113CC;
	Wed,  1 May 2024 12:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55843C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 441Ch9ga092554;
	Wed, 1 May 2024 07:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714567389;
	bh=b6+HFCug5vQ2GRv1Ea9ULWGuw4+2ownJxXx2GP8o3oM=;
	h=Date:From:To:CC:Subject;
	b=LyxxFLnvoqOw1w6NIT6MHfgxagEkqjawqmvmRwYunKaB9G7+QpY3AvqO6jz64VvJB
	 ZO5bGODMuIdUmQ6EX87xLwv46uwCxKd5vti0dqpH9Bc7Gmg3ucVNgCePrwzb4aOAO9
	 /E0NjLqM0z+oqLj7z4wwc8hVTZD4wzPyJA0qmCRQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 441Ch926032256
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 May 2024 07:43:09 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 1
 May 2024 07:43:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 1 May 2024 07:43:09 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 441Ch9At020040;
	Wed, 1 May 2024 07:43:09 -0500
Date: Wed, 1 May 2024 07:43:09 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Arnd <arnd@arndb.de>, Olof <olof@lixom.net>, SoC <soc@kernel.org>
CC: <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony
 Lindgren <tony@atomide.com>
Subject: [GIT PULL 2/3] ARM: dts: ti: keystone: Updates for v6.9
Message-ID: <20240501124309.3cj5b3gjf3cpimut@outsell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="krkzotcydfsasbxt"
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--krkzotcydfsasbxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull:

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-keys=
tone-dt-for-v6.10

for you to fetch changes up to 60242b20fe784ef9142050be8b68bd85e94be557:

  dt-bindings: arm: keystone: Remove ti,system-reboot-controller property (=
2024-04-09 11:05:19 -0500)

----------------------------------------------------------------
Keystone2 device tree updates for v6.10

Generic Cleanups/Fixes:
-  Remove custom ti,system-reboot-controller property

----------------------------------------------------------------
Andrew Davis (2):
      ARM: dts: ti: keystone: k2g: Remove ti,system-reboot-controller prope=
rty
      dt-bindings: arm: keystone: Remove ti,system-reboot-controller proper=
ty

 Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml | 5 -----
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi            | 5 -----
 2 files changed, 10 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--krkzotcydfsasbxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmYyONcACgkQ3bWEnRc2
JJ2zcQ/+Lv+lbU1R9RJjv5K0YL+eqU6fMHqLOntWBXGbW57d5EFDNoqJiWz/dzVC
N6r9nTw0eibjmcOUmoqRUJz78qBF+T46noBZWHut8z+UC0BhkoVR+bIIYhxPntdW
75G986Oas8Ghm/bontpVO7JQtNso866uWWFHJF6MQlaFGQtgscHQkZwhliFWlyCX
VtXVdr/4pIQjVN01y9En3AJIjnpv86sc9VZyLModyJDNBNT5+Aeu3qOs1sTajWFo
ftiMMAXYPJJqIOA86UsgeRNdc4AtTvVpKDhQtgM2HoduQAztnjNTJxXBOQLxu90T
2yF9p7pLCpBlzD62wC24QHfGOE/itwMl0VzMLMottT5L/s575FlK+sPemHrvejdT
ngS9dXacsZAW4E5ucGPtmGzGya3cNGsFdsYy2PAlbMg9Y8rx+gvY99N0QOQbNKF/
wu6gaOpSRYLgNChU4dYiz1Q8FLH4zderHTH8G69YNh0jIdGnpwffntAQYeIENOg1
jfA+RJrAsPnI2pML6+lbaS5+b90GUTjM1s5HrDLHQoXR55dh9BZf9d6MXQ+Wzi9n
KSKXJOCcOr8MxOERi2u/nWUOYxSzXSowb2BC+bAkC41tqirFHyoTvYpNVu1W08/r
0ufiN8C7vcrt5yrkT+m6qu8X2dpL/PFK0nuqQycGQhS1rhnufC8=
=VN1A
-----END PGP SIGNATURE-----

--krkzotcydfsasbxt--
