Return-Path: <SRS0=St56=H5=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66BBC35274
	for <soc@archiver.kernel.org>; Mon, 18 Dec 2023 15:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85554C433C9; Mon, 18 Dec 2023 15:30:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 621CCC433C8;
	Mon, 18 Dec 2023 15:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 621CCC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BIFUd77126252;
	Mon, 18 Dec 2023 09:30:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702913439;
	bh=xAs4EhyOhWeylnCWSyUBeu/JKufN7phFIzjaz4yET0U=;
	h=Date:From:To:CC:Subject;
	b=ITlzFuuL5Po6nuGOKxcImazOOCo4CaHOSUBsH8IeMnGDMx1OrEScGJA2OEYT2U5K2
	 ezGDS3XFkiD8W8MFfNkvnPZgMHMpnSTrLZEbUHlYQkT5fxeMlkeo21osincgbdi6g4
	 1vo3KxQ5pqiGHMy2EVIMDatGXGJtmB0AE/GuW96M=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BIFUd4U126529
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Dec 2023 09:30:39 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 18
 Dec 2023 09:30:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 18 Dec 2023 09:30:39 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BIFUdNJ022454;
	Mon, 18 Dec 2023 09:30:39 -0600
Date: Mon, 18 Dec 2023 09:30:39 -0600
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Subject: [GIT PULL] ARM: dts: ti: keystone: Updates for v6.8
Message-ID: <20231218153039.dok52xazqshbr6ie@playroom>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="doilzwmdfk4qzhlv"
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--doilzwmdfk4qzhlv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-keys=
tone-dt-for-v6.8

for you to fetch changes up to c1170c1d04d5bfbd9b38cb968d45b77e6bda2098:

  ARM: dts: ti: keystone: minor whitespace cleanup around '=3D' (2023-11-24=
 12:53:00 -0600)

----------------------------------------------------------------
Keystone2 device tree updates for v6.8

Cosmetic cleanups:
* white space cleanup around '=3D'

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: ti: keystone: minor whitespace cleanup around '=3D'

 arch/arm/boot/dts/ti/keystone/keystone-k2e-netcp.dtsi  | 6 +++---
 arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dts     | 2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi  | 6 +++---
 arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dts    | 2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk-netcp.dtsi | 6 +++---
 arch/arm/boot/dts/ti/keystone/keystone-k2l-netcp.dtsi  | 6 +++---
 6 files changed, 14 insertions(+), 14 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--doilzwmdfk4qzhlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmWAZZoACgkQ3bWEnRc2
JJ0JJQ//VQcObzcDIJZDklf8LEuzFOg0mI+6T48fkHy+Q7ZBQTkxwN/zPTps+bwg
X/yL6DaidcOncPGrHDHRj/dbDIwpl/BzJLc4FCRPcpygVjFEzEoVU42h2TuSwSf3
czVtT+C8x2zCb6vMkYSLFeXvIBqC29oHWvQ+G8NGkzAs5XyudspB1mU9vkh/sXnR
WgsS+PcaJK5RXI3zjr3PEEtvTQV0ADQP5id9vUv1hkQYbKISuVB0sjpCvpCWVbu+
vDOyFd/VNu9/Sprt3FE1G7b6pwS+xaWOMG6xDoeoyMvb/oof5F6S48i1qKC6L970
XpWqLD8AevluVxwEWkKw4v6sTaFQY3jIBIihqoO/wSLaxlKPq8JkYSbNuHucKKzD
s6ryuI1yDose9Nxg0TT0sN/P+eX4RvKZfmjtiSINVsZ7J386wQi/gN8fuRU+zRur
kaQGsJVlN58Pc72yXEaiWvQHN1XWk9fIHTYLC7fP9wSB05MH9NcV8tyLdTqmJtYQ
Lx801W6xE5X4Hc3jeYZBxSjRrnZ/rYDhONH3trbkXZ905C9gbOv8ozkZa3Gad3n5
e3AFS4O931Ru5aCcNhwyK3B+46DiAvAv2oARFqHExrSF1ExtJOG1HZqTKGDCLbDp
/wLs1PkMAw4IpUwZ+elRqgdz7x+7UFluAvbiuUYsDtXFjgHVH7U=
=nYP9
-----END PGP SIGNATURE-----

--doilzwmdfk4qzhlv--
