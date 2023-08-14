Return-Path: <SRS0=UDJN=D7=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A145C04A94
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 16:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61173C433C9; Mon, 14 Aug 2023 16:07:09 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EB0EC433C8;
	Mon, 14 Aug 2023 16:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0EB0EC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37EG72Vh112542;
	Mon, 14 Aug 2023 11:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692029222;
	bh=XZyfSo6ohHY/EdWolmJW9TZ8Zh+ZSk+CarVutBuRzfo=;
	h=Date:From:To:CC:Subject;
	b=trPXEE4ljPDurE0Xp3csbtu1nWK1k4Y0MEFmKBnH62c2kl0HvUi8n0KuiuZl1Xlpa
	 Hz4bnlFhSPkQj+QDQJ6N31i0KFS1g+AI/lt0qGK3KuTSb1lYu8R1P2cb8RiZN3+j/+
	 Z7bH6W/2DJ8Frlj96T6k0jp4ugTZwQ0PFNP+lfeo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37EG729B077395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Aug 2023 11:07:02 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Aug 2023 11:07:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Aug 2023 11:07:02 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37EG72NV002219;
	Mon, 14 Aug 2023 11:07:02 -0500
Date: Mon, 14 Aug 2023 11:07:02 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Arnd <arnd@arndb.de>, Olof <olof@lixom.net>, SoC <soc@kernel.org>
CC: <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony
 Lindgren <tony@atomide.com>
Subject: [GIT PULL 4/4] ARM: keystone: Updates for v6.6
Message-ID: <20230814160702.6l2fcujbx33eogap@junction>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="piccxozeynrouoay"
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--piccxozeynrouoay
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull:

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-keys=
tone-soc-for-v6.6

for you to fetch changes up to d33dbddf43a055f69bda7f3488bb1e136d1b6bbc:

  ARM: keystone: Merge PM function into main support file (2023-08-01 23:57=
:28 -0500)

----------------------------------------------------------------
TI keystone SoC updates for v6.6

Updates:
 - Consolidation of files and drop pm_domain.c and keystone.h

----------------------------------------------------------------
Andrew Davis (2):
      ARM: keystone: Merge memory.h into the only file that uses it
      ARM: keystone: Merge PM function into main support file

Rob Herring (1):
      ARM: keystone: Drop unused includes

 arch/arm/mach-keystone/Makefile    |  3 ---
 arch/arm/mach-keystone/keystone.c  | 50 ++++++++++++++++++++++++++++++++++=
----
 arch/arm/mach-keystone/keystone.h  | 16 ------------
 arch/arm/mach-keystone/memory.h    | 18 --------------
 arch/arm/mach-keystone/pm_domain.c | 50 ----------------------------------=
----
 5 files changed, 45 insertions(+), 92 deletions(-)
 delete mode 100644 arch/arm/mach-keystone/keystone.h
 delete mode 100644 arch/arm/mach-keystone/memory.h
 delete mode 100644 arch/arm/mach-keystone/pm_domain.c

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--piccxozeynrouoay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmTaUR8ACgkQ3bWEnRc2
JJ1OWg/+LUTKhUedrxtJaFdYP9UJcZN5WDqjX9HQw2jvyGyWXibq08Sq5e6llAn5
pSvvExLdpyb65jLMGaCGCurrJLFkNUDcXBSkw+PzEL+qaipbNtvmpxijW2qJoG7E
fIVYkfssNB0Guko0dJxep3S/2NrFOYCSYdQBnopKbWbunJAdPwFEnuFIh3RckRVU
qBu5XMMceD/nt6wAqDSazSX9jJudLumjhEOf1SbpNIydvx3QpYgObECmbvlBf3Y+
gGxTv01rk/vLrbu6d2YGlQkQ1Gjrm89WTB9rFPzOHdWni0GfyIpkpYQsBSvFINm/
S4MMfHGp1iCifDrKXPs5ustUeyjZEBDpQVmP8n48GW6j/ddk1x+A3gAU7YyYHcsE
jolirSYdERbNQ6t6GNzGuMkFwFK4hAqDpYWTgSJ6rBthEMhArx3DO2cTkFUS9SQG
y0DXZNKleWQv4Jnjt3c67lCID/SAB8YjLXZWRm74fjd0tx20tGolJq0tshcoKWhs
+rusRl7DIntMp1VIHfylqqTL5V312PugQ4MTY5NmIBkQoGza8YtujxB3PTR96adw
LIEabEMLplj0LCzJC58XAr8zKGl7jCd9C/RW2q86FIk6qYunUy/d33lDNMX5pBNN
MmVC1Op46e/WPWgSWYbnFP42iq44yoh2Qz7bqqeIVFpAWGuyqaU=
=WROx
-----END PGP SIGNATURE-----

--piccxozeynrouoay--
