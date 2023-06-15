Return-Path: <SRS0=1Cd5=CD=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C375CEB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 16:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5052C433CB; Thu, 15 Jun 2023 16:41:36 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED2D4C433C0;
	Thu, 15 Jun 2023 16:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED2D4C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FGfSEV062184;
	Thu, 15 Jun 2023 11:41:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686847288;
	bh=LldNaLPMKW1sH6LoWrQyE7GLvDTDzcc9LQ6ceeamv7w=;
	h=Date:From:To:CC:Subject;
	b=m/FV71U8MKYpg1voRGdFnG0L5BcAvaZVXiR4VyEDepUnJz0dMuTpqAqYONYF19L4t
	 eq090TVbF1C3XZOSybKRG+rk2pnnJZkEamU0u7g32nIaRim+Y1L4nYjcAJQNZ325Js
	 zXIunWzqhWOVqKglBF71HNgM4711tKNMk7fIt0AA=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FGfSpu002787
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 11:41:28 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 11:41:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 11:41:27 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FGfRI6007852;
	Thu, 15 Jun 2023 11:41:27 -0500
Date: Thu, 15 Jun 2023 11:41:27 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Arnd <arnd@arndb.de>, Olof <olof@lixom.net>, SoC <soc@kernel.org>,
        <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Subject: [GIT PULL 2/2] arm: dts: Keystone2 updates for v6.5
Message-ID: <20230615164127.qcgwrbwpmclx5wlm@landscape>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lyv3kle6zf2xf6ac"
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--lyv3kle6zf2xf6ac
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-keys=
tone-dt-for-v6.5

for you to fetch changes up to 2d62aab57d2ace03d840c08fb323ed1b9bd83a94:

  ARM: dts: keystone: Do not capitalize hex digits (2023-06-07 09:02:46 -05=
00)

----------------------------------------------------------------
Keystone2 device tree updates for v6.5

Cosmetic cleanups:
* Do not capitalize hex digits
* Unify pinctrl-single pin group nodes for keystone
* Fix eeprom node names

----------------------------------------------------------------
Andrew Davis (3):
      ARM: dts: keystone: Fix EEPROM node names
      ARM: dts: keystone: Remove ti,keystone from soc node compatible
      ARM: dts: keystone: Do not capitalize hex digits

Tony Lindgren (1):
      ARM: dts: Unify pinctrl-single pin group nodes for keystone

 arch/arm/boot/dts/keystone-k2e-evm.dts    |  4 +--
 arch/arm/boot/dts/keystone-k2e-netcp.dtsi |  2 +-
 arch/arm/boot/dts/keystone-k2g-evm.dts    | 42 +++++++++++++++------------=
----
 arch/arm/boot/dts/keystone-k2g-ice.dts    | 30 +++++++++++-----------
 arch/arm/boot/dts/keystone-k2g.dtsi       |  6 ++---
 arch/arm/boot/dts/keystone-k2hk-evm.dts   |  2 +-
 arch/arm/boot/dts/keystone-k2l-evm.dts    |  4 +--
 arch/arm/boot/dts/keystone-k2l.dtsi       | 30 +++++++++++-----------
 arch/arm/boot/dts/keystone.dtsi           |  8 +++---
 9 files changed, 64 insertions(+), 64 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--lyv3kle6zf2xf6ac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmSLPyoACgkQ3bWEnRc2
JJ32pg/9GmyggfMMorPMPJjyhgU6Y+hROI/0hx1neKcDQ+xgDfqA9CVqWUKH9vVD
cUjBjF9pXtrqzl8D5b5N5gAWRWTRcNEcdwwWNhFH5nQMtYpGBDQF6FeT9U68fqz8
0MjcAn+F7BfxCLfbWLJPxXD9J4Ul2f0XidSV7d602uMpGp0dkfeTLkSOMnO9Qif3
gB8DHmZjczo7QuERd1o0I44BxxQQwvnd1IJIIB+IK3yfC+dVtOEpiTeiid5O7NVk
rkuATxFbFWakrxJq9EshkQtNI+teQxvh/jzwWB1hO2O4V8IbMbUqLl2YTogYKpDG
LfmkHercFP+RQ6nVO7FP8zQMfLKOoBsGm6YP95Bk/kaltHAsLefUcoyV/eihFLTM
10AKXqdxmB7QItsm5p6jfiLLjjKMarthDvTqL5Nl0baWd565VyB3l+JkoEFdzoT/
0HnsPLBgwF/OuhssJFBJ9TllW8V59yroaFfrRs7y3C6xxHdHtpUrTGrVF+qh5CI8
JkgfTIJtVKygk3DoeyH7ks3EEa1SlOCVQxnMQxWRkt24r+Ix7eAeGGt4JwbpFKx2
YbCsBz1nSLS88B32FhqA628sM0gvyJE6XlcynCwxN1lZ4tvwD+H706v/kflZ4DEX
fTRbgi4y4HKUgs+T0SZmT4J9ZtWv8ddRtaIJJuWrcrXdyuZtC1k=
=QppP
-----END PGP SIGNATURE-----

--lyv3kle6zf2xf6ac--
