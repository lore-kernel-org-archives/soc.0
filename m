Return-Path: <SRS0=cimL=XN=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABA7C43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 23:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F831C341CF; Fri,  8 Jul 2022 23:27:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57D0EC341CB;
	Fri,  8 Jul 2022 23:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57D0EC341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 268NR2vY050721;
	Fri, 8 Jul 2022 18:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657322822;
	bh=/l66EDmlTvebaz7rMBT5nrrxoVxvFD53AWlGdpXy5Ww=;
	h=Date:From:To:CC:Subject;
	b=M2Px2fQDy1ofEYPyvS4+embTgEBmv6DE/XhNeKGzg2DkUJ/mqrH/9UlNSzQWMEFmT
	 c4hxJ6RAJYa1G7lDLmdChSTYKpvz6Ud7KdyRUSBnnUrAQ1DN/T2sSkop7yVR/dpUel
	 mtSXq+MSqFUBpoHg8b3LxDWX9+jxiY16Htla23eA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 268NR2iB050786
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Jul 2022 18:27:02 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 8
 Jul 2022 18:27:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 8 Jul 2022 18:27:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 268NR1VH025318;
	Fri, 8 Jul 2022 18:27:01 -0500
Date: Fri, 8 Jul 2022 18:27:01 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 2/3] arm64: dts: TI K3 updates for v5.20
Message-ID: <20220708232701.vpk45lwogpasaaay@enchilada>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jj3fhufvf7wg5wfs"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--jj3fhufvf7wg5wfs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC maintainers,

Please pull (baseline used is v5.19-rc1 based
ti-k3-dt-fixes-for-v5.19[1] which was merged in 5.19 rc cycle).

The following changes since commit 0c0af88f3f318e73237f7fadd02d0bf2b6c996bb:

  arm64: dts: ti: k3-am64-main: Remove support for HS400 speed mode (2022-0=
6-17 20:24:01 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-dt-=
for-v5.20

for you to fetch changes up to 8af893654c027fb679f67851aedb569ce7acb1e4:

  arm64: dts: ti: k3-am62-main: Enable crypto accelerator (2022-07-06 19:34=
:30 -0500)

----------------------------------------------------------------
TI K3 device tree updates for v5.20

* AM62: fixups, sa2ul enabled, ramoops for sk
* others: whitespace and gpio-key cleanup.

----------------------------------------------------------------
Aswath Govindraju (1):
      arm64: dts: ti: k3-am642-sk: Add pinmux corresponding to main_uart0

Guillaume La Roque (1):
      arm64: dts: ti: k3-am625-sk: Enable ramoops

Jayesh Choudhary (1):
      arm64: dts: ti: k3-am62-main: Enable crypto accelerator

Krzysztof Kozlowski (2):
      arm64: dts: ti: Adjust whitespace around '=3D'
      arm64: dts: ti: Align gpio-key node names with dtschema

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi              | 17 +++++++++++++++=
--
 arch/arm64/boot/dts/ti/k3-am625-sk.dts                | 11 ++++++++++-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi              |  4 ++--
 arch/arm64/boot/dts/ti/k3-am642-evm.dts               |  2 +-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts                | 16 +++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi    |  4 ++--
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi              | 14 +++++++-------
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi            |  4 ++--
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts        |  8 ++++----
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi       |  4 ++--
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts |  4 ++--
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi       |  4 ++--
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi            |  4 ++--
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi      |  4 ++--
 14 files changed, 68 insertions(+), 32 deletions(-)

[1] https://lore.kernel.org/all/165608641371.3411.17669885978824514952.git-=
patchwork-summary@kernel.org/
--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--jj3fhufvf7wg5wfs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmLIvT4ACgkQ3bWEnRc2
JJ3wbQ/+MBG3CjdJDxvz9COgCQuH/NXvRF8cbdF1CxCqdenvILPQJcFtncQ2Fyda
WrsmHEho1r7XU4kqE04Kex4a5CW9vgBhVL+dQjSsIw+sIZzawtSr4WXW1mEM3p/m
ATXDqT2jRafM8wmIG1wVJ63jtniO4ImJBzIvZf9RYLZymmwIeFAmJ4L0jm4cZJWa
CFOG+f9ebi33wrqkygdCOKpdhNw8AM01k1qQ/utkdxLaCIIWrM/OaNi51tjo2Fxg
+TFBpkYx2D+cla2fHnKb6XSM3grBCe/F+tv+dTLm4k+uNOn47hrOWZWwfR0N+K80
IP/u3ouVDXRrvihk1iryc3Fq5ECliqn1NHDg1WmdoHQaP4uYBCLtbDf3TUr9IKF7
Un0PvGcFjDKENy53IKuVe9gV3mmdVbNcA9q/jTZ6rbn3Xkc8ByMaYdXlecC00WqV
PdG/3PBO3YcDLBGJV38hVjYobvVOCMEhmzGSR6jEYRZImhkCj7SsuPNrBcIs8g5g
PeIliIHYNAzX768G1EX+PFl3EfQZ0Hv5jguG7Pmq/03cj805MXdDxt5m2Q+EIXQE
jaU0bbR+KSyspkfPL44MDJh0oKZ3vl/hxMsZsNkGAyAJhPZkFxrXxmOa0n5vuOFh
UFfghk2GXA0KO/BHKnyJAXRCZ0NyMtTflDL3P6GBnBl2vsBDj7o=
=TI/X
-----END PGP SIGNATURE-----

--jj3fhufvf7wg5wfs--
