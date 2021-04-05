Return-Path: <SRS0=X0hK=JC=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2ECC433ED
	for <soc@archiver.kernel.org>; Mon,  5 Apr 2021 15:49:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 374A8613B1; Mon,  5 Apr 2021 15:49:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06A0261242;
	Mon,  5 Apr 2021 15:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06A0261242
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=nm@ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135Fna7O113158;
	Mon, 5 Apr 2021 10:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617637776;
	bh=5ADTXn64PbR3KX66EJxu2v9pRAioJ4eCEZVVeKRJEeA=;
	h=Date:From:To:Subject;
	b=ZutuEx/qSmKpCCdPTt3xIkJkAfxT/ikNqhh/KCNy1z+CGz1VC37ufl61aglR7mfTl
	 10/tGqz/4krnlbDsxvdun7rr3nEolDByM9Q4AUD15EwP3eCJ/trzrSScsjGxmkX2M/
	 5uxbjW12e6AmOu7/tRWCS48a5zpTXOoS3XYO58lY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135Fna9p095285
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 10:49:36 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 5 Apr
 2021 10:49:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 5 Apr 2021 10:49:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 135FnZxl107526;
	Mon, 5 Apr 2021 10:49:35 -0500
Date: Mon, 5 Apr 2021 10:49:35 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] arm64: dts: TI K3 updates for v5.13
Message-ID: <20210405154935.4mey4ed2ukfve62q@september>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pcyoweo3utqjyedg"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--pcyoweo3utqjyedg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following device tree changes for v5.13 cycle.

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git tags/ti-k3=
-dt-for-v5.13

for you to fetch changes up to 112e5934ff3a7505e583365213a27f990922b76b:

  arm64: dts: ti: k3-am64-main: Fix ospi compatible (2021-04-01 08:50:33 -0=
500)

----------------------------------------------------------------
Devicetree changes for TI K3 platforms for v5.13 merge window:

* New SoCs:
  - AM642 mean for industrial control, motor control, remote IO, IoT gatewa=
y etc.
* New Boards:
  - AM65: Siemens SIMATIC IOT2050 advanced and basic boards
  - AM64: EVM and SK boards
* New peripherals:
  - AM65: watchdog
  - AM65,J721E: ICSSG
  - J7200: OSPI, GPIO
* Fixes:
  - AM65: pcie node fixup, ospi speed updates
  - J721e, J7200: MMC speed updates, ospi speed updates and compatibles fix=
ups.

----------------------------------------------------------------
Aswath Govindraju (7):
      arm64: dts: ti: k3-j721e-main: Update the speed modes supported and t=
heir itap delay values for MMCSD subsystems
      arm64: dts: ti: k3-am642-evm: Add support for SPI EEPROM
      arm64: dts: ti: k3-am64-main: Add DT node for USB subsystem
      arm64: dts: ti: k3-am642-evm: Add USB support
      arm64: dts: ti: k3-am64: Add GPIO DT nodes
      arm64: dts: ti: k3-am642: reserve gpio in mcu domain for firmware usa=
ge
      arm64: dts: ti: k3-j7200: Add support for higher speed modes and upda=
te delay select values for MMCSD subsystems

Dave Gerlach (4):
      dt-bindings: arm: ti: Add bindings for AM642 SoC
      dt-bindings: pinctrl: k3: Introduce pinmux definitions for AM64
      arm64: dts: ti: Add support for AM642 SoC
      arm64: dts: ti: Add support for AM642 EVM

Faiz Abbas (2):
      arm64: dts: ti: k3-j7200: Add gpio nodes
      arm64: dts: ti: k3-j7200-common-proc-board: Disable unused gpio modul=
es

Grygorii Strashko (1):
      arm64: dts: ti: k3-am64-main: add main CPTS entry

Jan Kiszka (5):
      arm64: dts: ti: k3-am65-main: Add device_type to pcie*_rc nodes
      arm64: dts: ti: k3-am65-mcu: Add RTI watchdog entry
      dt-bindings: Add Siemens vendor prefix
      dt-bindings: arm: ti: Add bindings for Siemens IOT2050 boards
      arm64: dts: ti: Add support for Siemens IOT2050 boards

Lokesh Vutla (2):
      dt-bindings: arm: ti: Add bindings for AM642 SK
      arm64: dts: ti: Add support for AM642 SK

Peter Ujfalusi (1):
      arm64: dts: ti: k3-am64-main: Enable DMA support

Pratyush Yadav (6):
      arm64: dts: ti: k3-j721e-som-p0: Enable 8D-8D-8D mode on OSPI
      arm64: dts: ti: am654-base-board: Enable 8D-8D-8D mode on OSPI
      arm64: dts: ti: k3-j7200-som-p0: Add nodes for OSPI0
      arm64: dts: ti: k3-j721e-mcu: Fix ospi compatible
      arm64: dts: ti: k3-j7200-mcu: Fix ospi compatible
      arm64: dts: ti: k3-am64-main: Fix ospi compatible

Suman Anna (5):
      arm64: dts: ti: k3-am65-main: Add ICSSG nodes
      arm64: dts: ti: k3-j721e-main: Add ICSSG nodes
      arm64: dts: ti: k3-am64-main: Add hwspinlock node
      arm64: dts: ti: k3-am64-main: Add mailbox cluster nodes
      arm64: dts: ti: k3-am642-evm/sk: Add IPC sub-mailbox nodes

Vignesh Raghavendra (6):
      arm64: dts: ti: k3-am64-main: Add CPSW DT node
      arm64: dts: ti: k3-am642-evm: add CPSW3g DT nodes
      arm64: dts: ti: k3-am642-sk: Add CPSW DT nodes
      arm64: dts: ti: k3-am64-main: Add ADC nodes
      arm64: dts: ti: k3-am64-main: Add OSPI node
      arm64: dts: ti: k3-am64-evm/sk: Add OSPI flash DT node

 Documentation/devicetree/bindings/arm/ti/k3.yaml   |   9 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/ti/Makefile                    |   8 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           | 675 +++++++++++++++++=
++++
 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi            | 103 ++++
 arch/arm64/boot/dts/ti/k3-am64.dtsi                | 105 ++++
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            | 468 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             | 334 ++++++++++
 arch/arm64/boot/dts/ti/k3-am642.dtsi               |  65 ++
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi | 655 +++++++++++++++++=
+++
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           | 395 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi            |   9 +
 arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dts |  61 ++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |   4 +-
 .../boot/dts/ti/k3-am6548-iot2050-advanced.dts     |  60 ++
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |  94 +++
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |  86 ++-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |  51 ++
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi        |  36 ++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 279 ++++++++-
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    |   4 +-
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi        |   4 +-
 include/dt-bindings/pinctrl/k3.h                   |   5 +-
 23 files changed, 3501 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am64-main.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am64.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642-sk.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dts
--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--pcyoweo3utqjyedg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmBrMYcACgkQ3bWEnRc2
JJ2BaA//R8LFWDCn64PwJzCZI47FfF0QMduinT5wjtVxJC931AdLIUrH34Oa9Rvl
j5MNYhMOwh4R1gKZQq9TV+6nLgPleSXwOgutd0g9C5X1B2eFpy3vlaokH+2IItu9
lgw44Bh08Dtc0uGkpukM1BSjU7NlU1H313deIBW09coszl8YT2jTpOco+rAmGOfk
d9Y080lt16/vHPMilXvksHsXLpAQFlQXZqJtBZrAyaSCaJa/O3FYtkHmCoC+U7nv
jbu3GMYa2sWv/NdB+2Z1fQRI1GnsALcZ1Oh0os1y7Lsr7VQiIkpLPSzfstW7l5eW
bGL9sPjaXto2T8Jv5Kpv0wXqMvMPx8U3qMIpuooFxMdWKLJEZREXNuecQ9DBDj6a
yTxeZ1nOszl1rqiEoX0BecSKTAqR/pGTUzAKVOh/APCcBZ0yl2zd8CHi3dSRmmXu
A5wEMxKgMXMKLdkMkGg34Ex6jGX9UeEjA4IvY8chmdRhESVQ6OOEEvR6d2Phiwp4
rLuZIU3J+LnwSL9QZkPNzlj3i37jZ/o1g7RK0Sy9jPRpEYfsUp5py8yanTr1n5Z0
VS6sk90qipTXyEs/rDkEuLPyKfyuFa7iQPaMPcJrc+eYcAdAHMixHfBh7kDK0LaN
RJ+l5qbsjSBJotDEvKDwf4gwBnSVCfrNhQ7mSpoOvsOcKvEjkak=
=4VZF
-----END PGP SIGNATURE-----

--pcyoweo3utqjyedg--
