Return-Path: <SRS0=jJFC=GA=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824B0CDB482
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 16:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37219C433CC; Wed, 18 Oct 2023 16:52:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5DB2C433C7;
	Wed, 18 Oct 2023 16:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5DB2C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39IGqQvm021734;
	Wed, 18 Oct 2023 11:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697647946;
	bh=pBfx41kuQIcNj3y4wPggeqMsrvCf7MYOqAKNKkwRtwc=;
	h=Date:From:To:CC:Subject;
	b=dgIY9p1o+GzLZCv7cplu62l6SSbIy0IVJX8Dgc2kHlmudwiU/HoOx/Fv7UdD2f4L8
	 Rnj4vbKlQDkeF4UV0iY5CqlE78Lqk8aoZWcOHBAVmfH5e+8tAfFM9oP8VFtLqcXOUT
	 4HHKS17BnY6pKVgd+jRxQpjLdmF+9UDw2VNjei9c=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39IGqQf0057054
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Oct 2023 11:52:26 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Oct 2023 11:52:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Oct 2023 11:52:26 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39IGqQak130574;
	Wed, 18 Oct 2023 11:52:26 -0500
Date: Wed, 18 Oct 2023 11:52:26 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Arnd <arnd@arndb.de>, Olof <olof@lixom.net>, SoC <soc@kernel.org>
CC: <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony
 Lindgren <tony@atomide.com>
Subject: [GIT PULL] soc: ti: Driver updates for v6.7
Message-ID: <20231018165226.33x5cjn5jmgnm3di@magnolia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="67bzctord3thzjmi"
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--67bzctord3thzjmi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull:

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driv=
er-soc-for-v6.7

for you to fetch changes up to 3aeb0d3694e16b5066db82aa1152884f2e6aace0:

  soc: ti: k3-socinfo: Avoid overriding return value (2023-10-16 11:38:17 -=
0500)

----------------------------------------------------------------
TI SoC driver updates for v6.7

- Generic fixups: Convert to platform remove callback returning void
- ti_sci: Minor fixups and mark driver as non-removable
- k3-socinfo: Documentation fixups, cosmetic fixups
- knav_qmss_queue: Optimize with device_get_match_data

Signed-off-by: Nishanth Menon <nm@ti.com>

----------------------------------------------------------------
Dhruva Gole (1):
      firmware: ti_sci: Mark driver as non removable

Jinjie Ruan (1):
      firmware: ti_sci: Use list_for_each_entry() helper

Justin Stitt (1):
      firmware: ti_sci: refactor deprecated strncpy

Neha Malcom Francis (2):
      soc: ti: k3-socinfo: Fix typo in bitfield documentation
      soc: ti: k3-socinfo: Avoid overriding return value

Rob Herring (2):
      firmware: ti_sci: Use device_get_match_data()
      soc: ti: knav_qmss_queue: Use device_get_match_data()

Uwe Kleine-K=F6nig (7):
      soc/ti: k3-ringacc: Convert to platform remove callback returning void
      soc/ti: knav_dma: Convert to platform remove callback returning void
      soc/ti: knav_qmss_queue: Convert to platform remove callback returnin=
g void
      soc/ti: pm33xx: Convert to platform remove callback returning void
      soc/ti: pruss: Convert to platform remove callback returning void
      soc/ti: smartreflex: Convert to platform remove callback returning vo=
id
      soc/ti: wkup_m3_ipc: Convert to platform remove callback returning vo=
id

 drivers/firmware/ti_sci.c        | 69 ++++++------------------------------=
----
 drivers/soc/ti/k3-ringacc.c      |  5 ++-
 drivers/soc/ti/k3-socinfo.c      |  7 ++--
 drivers/soc/ti/knav_dma.c        |  6 ++--
 drivers/soc/ti/knav_qmss_queue.c | 13 ++++----
 drivers/soc/ti/pm33xx.c          |  5 ++-
 drivers/soc/ti/pruss.c           |  6 ++--
 drivers/soc/ti/smartreflex.c     |  5 ++-
 drivers/soc/ti/wkup_m3_ipc.c     |  6 ++--
 9 files changed, 30 insertions(+), 92 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--67bzctord3thzjmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmUwDUMACgkQ3bWEnRc2
JJ1mGg/9EC44giOXUZQCKO4js1WLxploOGsEAhxRIu40Be6deOSKyiTn5lHNLI5S
GxO5SkQuFq0StYEVGWcEN3Xo5ABZl7n7WBFH8FGTVx1bflh8yQj4gLscmhe+7iqd
OX6eEgAGnc2Z1vywPQHGUg/4wQJdChOuFFY4EsZH1lSERvpRZeh95T5/MnYvMU/T
ExL9uIyF7WbNVWFs+SYfhYShSHP/jhsLbEnJpQw27KzBo3eKX5d0XgC4QDiD0DU6
XENtghktgMv/lqaMEsrYn4MDq5edg2s27ba05f3Rs+EoHvt/gNcH/leGEWSC44/x
vGPGRiR43KlJfmun7dByHIBrg/JryXEvE4biJ4PbCDzlq4zFt9wqRBCmGuvHdZi/
BCn1scPBf7IPkfPdS7aR/Qw4F11ubMq8Pf2rlP1mdGCTOODfQxjuK6QLNOKdhS7M
RandG0vVc7OMVia/OUskcA6eEmTjUh4yF52AH95UKpFPVI1en93CgjLco/Z4/U3f
ByWOExozTcx7G3RYCsMF4YDOfXMIcM/M6ERtymzNwVvpIqSboCex7rrAa4YG2LJ/
YbpN/NHT9WPGdPq/qgEAtRxN6Rt+/+dB78D2eVb+ZeLVraTspie2Lgnh6rZ+J5XU
5yFQ8nbobrWdpMKdJsyCDNaKbboUBxfhKhP07Elce9xET9lwt/M=
=/wMu
-----END PGP SIGNATURE-----

--67bzctord3thzjmi--
