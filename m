Return-Path: <SRS0=fG3y=KN=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7898C433ED
	for <soc@archiver.kernel.org>; Tue, 18 May 2021 11:56:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BEBCC611B0; Tue, 18 May 2021 11:56:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69BFE61042;
	Tue, 18 May 2021 11:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69BFE61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=nm@ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14IBuYGT020544;
	Tue, 18 May 2021 06:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621338994;
	bh=3a8XgCUkDM0gwvT+vx6EOynoKwpvMs8jnRG6dXTrM78=;
	h=Date:From:To:CC:Subject;
	b=jnRgrF+ULiqLFkIgLeqy8jl40GA5xMgiLBMxoKa5T7zYAxzIWMVWXsrIhbU4lY4an
	 hOeBMT3hp3zUBrIG+8c/IaTJqG/mKK/I0ny9L8wSBPmvWJXKH82dEOQCfJw4IXelOL
	 aH4dctKcqc9URMG2WjSOB1sJthSAylut0A0P6ik8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14IBuYOq056851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 May 2021 06:56:34 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 18
 May 2021 06:56:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 18 May 2021 06:56:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14IBuYdG013864;
	Tue, 18 May 2021 06:56:34 -0500
Date: Tue, 18 May 2021 06:56:34 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] arm64: dts: TI K3 fixups for v5.13 rc
Message-ID: <20210518115634.467vgpbzplal5kou@obituary>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yhtujcuvugprpbgc"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--yhtujcuvugprpbgc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

These are minor fixups for the 5.13-rc towards making the yaml
conversion of various txt files in 5.14-rc1.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git tags/ti-k3=
-dt-fixes-for-v5.13

for you to fetch changes up to cab12badfc99f93c1dccf192dd150f94b687a27c:

  arm64: dts: ti: k3*: Introduce reg definition for interrupt routers (2021=
-05-14 12:48:11 -0500)

----------------------------------------------------------------
Devicetree fixes for TI K3 platforms for v5.13 merge window:

These minor fixes include:
* Fixups for device tree discovered during yaml conversion
* Fixups for missing dma-coherent property in j7200
* Removal of camera sensor node from am65 evm dts to overlay
  as camera sensor boards are variable.

----------------------------------------------------------------
Nishanth Menon (6):
      arm64: dts: ti: k3-*: Rename the TI-SCI clocks node name
      arm64: dts: ti: k3-am65-wakeup: Add debug region to TI-SCI node
      arm64: dts: ti: k3-am65-wakeup: Drop un-necessary properties from dms=
c node
      arm64: dts: ti: k3-*: Rename the TI-SCI node
      arm64: dts: ti: k3-am65|j721e|am64: Map the dma / navigator subsystem=
 via explicit ranges
      arm64: dts: ti: k3*: Introduce reg definition for interrupt routers

Tomi Valkeinen (1):
      arm64: dts: ti: k3-am654-base-board: remove ov5640

Vignesh Raghavendra (1):
      arm64: dts: ti: j7200-main: Mark Main NAVSS as dma-coherent

 arch/arm64/boot/dts/ti/k3-am64-main.dtsi        | 11 +++++----
 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi         |  3 ++-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi        | 10 ++++----
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi         |  4 ++--
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi      | 13 ++++++-----
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts  | 31 ---------------------=
----
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi       |  8 +++++--
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi |  7 +++---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi       | 10 ++++----
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi | 11 +++++----
 10 files changed, 45 insertions(+), 63 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 8=
49D 1736 249D

--yhtujcuvugprpbgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmCjq2sACgkQ3bWEnRc2
JJ26fBAAqDSOfEQwwvN8isory0jYTqqQ9Qi6P2Oq+LbP8U2XxuTA8K8eamBAzfOc
4jpoplbyx0Fde3b0s6H7ChEbxE/GqaXlPLw6RrneAfUKAFaf1OBlupfzhJ1/4f+e
FiqT4BJnQXAMmQsygfvnItIQKu4wbSW3OsMnUIZFWFbpIyGqc5OkcoL30AIGmnxR
e6FdfwNCD+o8FZ8ggsbGPrsaa6M4TRnMeyTIp8JXPA/JQGyNnIlC+hgkxs5qrAG+
2++EelRGKOGBgzSgo+zBqIfajGy58ra4Ts+aQo6c/iCX0HduQVQeuAOvLRR9bQov
UBGgw02kq8hA35LslLOkooFFfizrcqhFFUJexbR4hDC4/1IKZ+Npgi+gy+9SeS0i
/aTJbtZrF7P13EeShpe6GbgzlgNyibito0CuQT/HoMBTDV/b0HMHiJSxSxQKz/C/
7NfYGBOi6wYqnGlrY1SVqq5nxZUN8+ehhklKKYvIlbKxTpRbyYSEXYTgaRTULdMW
+axRpOkNZUziKY/rHOlGqbMNGEysw3AH2eaWMStvhdOM5MT+c6GRuV0D6OxdvVyE
artE0EYV9ZUaDenVwDfEwd3FCBq9SHgfenZkKUcQiIMZLD+C4UntxniFs15Gbqo0
Vi2f6fYTjjZg8ri92Vrn8WSqQeoHVWXy6JJNZsK9N0AzLGaSTx8=
=ud9O
-----END PGP SIGNATURE-----

--yhtujcuvugprpbgc--
