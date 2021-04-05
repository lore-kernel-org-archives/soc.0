Return-Path: <SRS0=X0hK=JC=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F291C43461
	for <soc@archiver.kernel.org>; Mon,  5 Apr 2021 15:53:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 563CE613C2; Mon,  5 Apr 2021 15:53:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CB7B61242;
	Mon,  5 Apr 2021 15:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CB7B61242
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=nm@ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135FrakX026643;
	Mon, 5 Apr 2021 10:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617638016;
	bh=XzdvO63rXWf3P2WtQR8d9niH7a/a7k2jE16Ocu2gFic=;
	h=Date:From:To:CC:Subject;
	b=ppEsL70szLYBp7luCxrvxqZx/ScT1y6H+LiyzessOaauRdvXk3NCC10aeFtniQA4X
	 QK6hpnSPWf6JCYuPwc86yhpWyFjNhBA9GuPVRlzrBgys5YxpFzdFxXCVpx9HdROZJP
	 mmwCi23/uD1vqLc+H6iu/xbACGjddGtkXs683+IM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135Frabm026079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 10:53:36 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 5 Apr
 2021 10:53:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 5 Apr 2021 10:53:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 135FraXT048160;
	Mon, 5 Apr 2021 10:53:36 -0500
Date: Mon, 5 Apr 2021 10:53:36 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] arm64: dts: TI K3 updates for v5.13
Message-ID: <20210405155336.smohb7uzkperqwuz@reflex>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jwcdnqty5rcpu6zp"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--jwcdnqty5rcpu6zp
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

--jwcdnqty5rcpu6zp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmBrMnoACgkQ3bWEnRc2
JJ3leQ/9Et1pA6dl4ie7sWlORWQDpc9DvJijI8xP0R8wZjLzhsZo+2KcrYaoHDOl
npBnqezmgoN37dXt5O0DHKou/srLNlQSREGqFXjTHxMJCncDfOsH3tynIjk0EnIf
Ss+hQRynCqa4vPjpVXfriqfwmUf8B6+IaVxMRcJnY1+36OQ+qDUYWmy7eqVxp4x0
zjKlYuum875csGCPKyXbQafiGQGVa/5jfTNd1yuvB19iUW9kuExWmKVn5cKZ8K3K
oN1P150JDiybEthc5I4ynqUeYcTprADJrBi3QAA2zguSY5Hognl3hCZNb7My+cMt
Tr1+HFWxnBUAisNKv/HQI+x3xgeJsjdijHk46RS5c0AtivAKBBcFA01EyPVuwBkQ
qEvhWcH0uvayj+kK4AgTcrW6b3Rmre3tvM/4YhEwrORfhGnWpcYMB0a+7524L2rN
vLGxFaDoVPbJsPwgGeaf9I/lzXHRzlBzPsl7M5h7hKPe7L52gd4UYHSCONMhtcHc
IFujPh3QwGYpELjG+RanKbsPwTqMkE5d/AzSsmoH2U8LhTx6JtP+JC0t/qveMtdf
RJZWuy3gYr3iN0BDaU37+nCMKmLdomIF0SPX2C0BKh9Fk0R9Y2WEC0Ga85VAYNPM
YKp/Mf+qlLQFVkvQsmcphPQ2BK8zKVp8+A8Zql3fiOWX4sVn/fw=
=zMlz
-----END PGP SIGNATURE-----

--jwcdnqty5rcpu6zp--
