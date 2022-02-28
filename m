Return-Path: <SRS0=UCcl=TL=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F4CC433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 12:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4554AC340F2; Mon, 28 Feb 2022 12:07:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D553C340EE;
	Mon, 28 Feb 2022 12:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D553C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21SC74vS013090;
	Mon, 28 Feb 2022 06:07:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646050024;
	bh=OE2dyfvTaV7jYkykYv2m9tXz/vdhVrONt7WuBzBqx64=;
	h=Date:From:To:CC:Subject;
	b=ZGWV8RzXTNLzEBuX5FUgrWgJwybZFw/TMH4/rktbBotn/RRw0oy3g9PD+c3zkA6TJ
	 uwJ1Rc+qFwBMrSL0V5vfU5rmT7dH6lSJdZaK9PKGKqu5JFYM7W5VtcQCzbSAkuhj/r
	 ave5t7uECAUVKVS7WJhK0ORej3epvPFzs0VX0R58=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21SC743w040374
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Feb 2022 06:07:04 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 28
 Feb 2022 06:07:04 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 28 Feb 2022 06:07:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21SC74jS024353;
	Mon, 28 Feb 2022 06:07:04 -0600
Date: Mon, 28 Feb 2022 06:07:04 -0600
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 2/3] TI K3 defconfig updates for v5.18
Message-ID: <20220228120704.346bn5c56e53qylb@finless>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="275kuad22ifcrufq"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--275kuad22ifcrufq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC maintainers,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-con=
fig-for-v5.18

for you to fetch changes up to 3bc04fba357a269f4b7ff824b146d82ad1ebf9de:

  arm64: defconfig: Enable USB controller drivers for TI K3 SoC (2022-01-24=
 13:40:42 -0600)

----------------------------------------------------------------
TI K3 defconfig updates for v5.18

* Enable USB modules

----------------------------------------------------------------
Vignesh Raghavendra (1):
      arm64: defconfig: Enable USB controller drivers for TI K3 SoC

 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 8=
49D 1736 249D

--275kuad22ifcrufq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmIcuuEACgkQ3bWEnRc2
JJ25zA//bbA+CQZnsd5DQjJJdnI0OE7zz+czU0bItYQMNLGP6EAZX+3FPPWBLOW6
dnWZCKc78oHGzE01b0W5dgCpOz/z/8pdTXc3kkjB5GyNDkzsxECdmpbud4w+cwFP
UvwvU+eVHiXTGSxhzu9RVwlwnEkMtdeFGRqEy3PzX102wZVdzDweaAo44wFzTBS3
nYIklBacbjgfL0GB6d80IqVA4xPZxZzYj95v2Wl8fxCXNdboW7zym3YrAn+mt/Bn
2O0XH7HhRYLrwvxroQayT6H/d6gesmAqTjw4j+N2ZeCfj13jGKxwnCTwQ8t0vKGG
2+en9zu3MfdwiGg3vdtkGfRF8pJWlrJKeqmU0bngCvgNE5Gk4oUPqGoW6O+kKLfI
nc+qPsBJAFbkpGoAer8PHwZDBCQ2Fyaq6QB+SkIotTfgXd1BWRHjc9gJ+qJfXiNE
VibUKA2UsVJcQmcSelzvANLoAtNiWqJgpx+jwNGBmtfMi+PgRYqoV0BNFv7WK9av
OGIouPFeaWooNAIbmofkfCR3gOCZDuiGQRq5XzyiiTwUCir8V+CRzz59DAoh6fWO
MY9gX7vV07KnkA/PHS3dkzBNxz6aGwswJ4LPzXlgRjE1V46+RCCIF7OGtTu7Jf/P
FkxeHgR8eIqWKC9/yvIIMKpdmBhFD5avp8msDhTmZJW/NhJAh+Y=
=/hIi
-----END PGP SIGNATURE-----

--275kuad22ifcrufq--
