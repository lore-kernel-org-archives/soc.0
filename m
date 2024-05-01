Return-Path: <SRS0=oGBH=ME=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CA0C4345F
	for <soc@archiver.kernel.org>; Wed,  1 May 2024 12:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB933C4AF18; Wed,  1 May 2024 12:43:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41F72C4AF14;
	Wed,  1 May 2024 12:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41F72C4AF14
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 441ChJkQ074427;
	Wed, 1 May 2024 07:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714567399;
	bh=eEZ4BDEg7x2nO8XPyZ9LA6BdNAGNNb3ynVqcIlv0zAk=;
	h=Date:From:To:CC:Subject;
	b=RUbLiaHjzTqprB+ujBfewHV/j0LGFd5gpXY8PYAORVOId8FkGqbVH8XEt/ZNF6PcO
	 yuK99zKztTkFML2UtlzC++9/QhP6/WgwhH55wLW8fcl4CifOZKuDC/WlY/1rMmPpO9
	 bcLJ4vyM5UP71lELxjyh8oDupABbi/cDIlAFgV84=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 441ChJl3106358
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 May 2024 07:43:19 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 1
 May 2024 07:43:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 1 May 2024 07:43:19 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 441ChJ6A020280;
	Wed, 1 May 2024 07:43:19 -0500
Date: Wed, 1 May 2024 07:43:19 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 3/3] arm64: dts: TI K3 updates for v6.10
Message-ID: <20240501124319.ake5j2oc5pbnn5nb@contour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p2iv5ftoftgbij6y"
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--p2iv5ftoftgbij6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please note that this pull has a ti,am654-sr1-icssg-prueth compatible
that is available in linux-next but not on v6.9-rc1 - which is
accepted to allow v6.10 support. In addition, usb424,2744 property is
present in yaml but the vendor ID usb424 is generic.

With that, please pull:

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-d=
t-for-v6.10

for you to fetch changes up to f329598c27332ff9e85e5551bed3cab280971678:

  arm64: dts: ti: Fix csi2-dual-imx219 dtb names (2024-05-01 06:10:43 -0500)

----------------------------------------------------------------
TI K3 device tree updates for v6.10

Generic Cleanups/Fixes:
- fixup of generated dtb imx219 overlay file names
- Remove UART baud rate selection in device tree.
- Use exact ranges for FSS.

SoC specific Fixes/Features:

AM625:
- Add USB PHY2 region and usb phy control registers

AM62A
- Add USB PHY2 region and usb phy control registers, Disable USB LPM.
- Add wave-512 video encoder/decoder support
- Enable UHS mode for SD

AM62P:
- Disable ethernet by default
- Add USB support

AM654
- Serdes fixups
- SDHCI fixups.

AM67/j722s:
- Disable ethernet by default
- Add USB support

AM68/J721s2:
- Add main ESM range
- Add support for SDR104

AM69/J784S4:
- Add main ESM range
- Enable support for UHS mode

Board specific fixes/Features:

AM625:
- BeaglePlay: Fixes for wlan mmc-pwrseq and ethernet phy reset
- phyboard-lyra: Add Audio codec, USB-C, increase CAN bit rate and enable
  ability to apply overlays
- verdin: GPIO pinctrl fixups, Switch SD carddetect to GPIO, fixup memory
  to 2GB, and audio clock, PCIe reset GPIO hog, sleep-moci
- lp-sk: Drop power button
- sk: minor white space cleanup.

AM64
- phyboard-electra: Increase CAN bit rate, enable overlay to enable GPIO fan

AM65:
- iot2050: Add icssg-prueth for PG1

AM67/j722s:
- evm: Enable UHS support for SD card and eMMC support.

AM69/J784s4:
- evm/sk: Fix uart pins and pinctrl macro usage.

----------------------------------------------------------------
Andrejs Cainikovs (1):
      arm64: dts: ti: verdin-am62: dahlia: fix audio clock

Andrew Davis (12):
      arm64: dts: ti: k3-am65: Remove UART baud rate selection
      arm64: dts: ti: k3-am64: Remove UART baud rate selection
      arm64: dts: ti: k3-j7200: Remove UART baud rate selection
      arm64: dts: ti: k3-j721e: Remove UART baud rate selection
      arm64: dts: ti: k3-j721s2: Remove UART baud rate selection
      arm64: dts: ti: k3-j784s4: Remove UART baud rate selection
      arm64: dts: ti: k3-am65: Add full compatible to SerDes control nodes
      arm64: dts: ti: k3-am65: Move SerDes mux nodes under the control node
      arm64: dts: ti: k3-am65: Use exact ranges for FSS node
      arm64: dts: ti: k3-j7200: Use exact ranges for FSS node
      arm64: dts: ti: k3-j721e: Use exact ranges for FSS node
      arm64: dts: ti: k3-j784s4: Use exact ranges for FSS node

Bhavya Kapoor (2):
      arm64: dts: ti: k3-j721s2-main: Enable support for SDR104 speed mode
      arm64: dts: ti: k3-j722s-evm: Enable UHS support for MMCSD

Brandon Brnich (1):
      arm64: dts: ti: k3-am62a-main: Add Wave5 Video Encoder/Decoder Node

Dasnavis Sabiya (1):
      arm64: dts: ti: k3-j784s4-main: Enable support for UHS mode

Francesco Dolcini (3):
      arm64: dts: ti: verdin-am62: use SD1 CD as GPIO
      arm64: dts: ti: verdin-am62: mallow: fix GPIOs pinctrl
      arm64: dts: ti: k3-am625-verdin: add PCIe reset gpio hog

Garrett Giordano (2):
      arm64: dts: ti: k3-am625-phyboard-lyra-rdk: Add Audio Codec
      arm64: dts: ti: k3-am625-phyboard-lyra-rdk: Add USB-C

Jai Luthra (1):
      arm64: dts: ti: Fix csi2-dual-imx219 dtb names

Jan Kiszka (1):
      arm64: dts: ti: iot2050: Add icssg-prueth nodes for PG1 devices

Judith Mendez (2):
      arm64: dts: ti: k3-am65-main: Fix sdhci node properties
      arm64: dts: ti: k3-am65-main: Remove unused properties in sdhci nodes

Krzysztof Kozlowski (1):
      arm64: dts: ti: k3-am62p5-sk: minor whitespace cleanup

Markus Schneider-Pargmann (1):
      arm64: dts: ti: k3-am62-lp-sk: Remove tps65219 power-button

Max Krummenacher (1):
      arm64: dts: ti: verdin-am62: Set memory size to 2gb

Michael Walle (2):
      arm64: dts: ti: k3-{am62p,j722s}: Disable ethernet by default
      arm64: dts: ti: k3-j722s-evm: Enable eMMC support

Nathan Morrisson (4):
      arm64: dts: ti: k3-am625-phyboard-lyra-rdk: Increase CAN max bitrate
      arm64: dts: ti: k3-am642-phyboard-electra-rdk: Increase CAN max bitra=
te
      arm64: dts: ti: am64-phyboard-electra: Add overlay to enable a GPIO f=
an
      arm64: dts: ti: Enable overlays for the am625-phyboard-lyra

Roger Quadros (5):
      arm64: dts: ti: k3-am62*: Add PHY2 region to USB wrapper node
      arm64: dts: ti: k3-am62/a: use sub-node for USB_PHY_CTRL registers
      arm64: dts: ti: k3-am62p: add the USB sub-system
      arm64: dts: ti: k3-am62a: Disable USB LPM
      arm64: dts: ti: k3-am625-beagleplay: Fix Ethernet PHY RESET GPIOs

Stefan Eichenberger (2):
      arm64: dts: ti: k3-am62-verdin: replace sleep-moci hog with regulator
      arm64: dts: ti: k3-am62-verdin-dahlia: support sleep-moci

Sukrut Bellary (1):
      arm64: dts: ti: k3-am625-beagleplay: Use mmc-pwrseq for wl18xx enable

Udit Kumar (4):
      arm64: dts: ti: k3-j784s4-evm: Fix UART pin type and macro type
      arm64: dts: ti: k3-am69-sk: Fix UART pin type and macro type
      arm64: dts: ti: k3-j721s2: Add main esm address range
      arm64: dts: ti: k3-j784s4: Add main esm address range

Vignesh Raghavendra (1):
      arm64: dts: ti: k3-am62a: Enable UHS mode support for SD cards

 arch/arm64/boot/dts/ti/Makefile                    |  11 +-
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts           |   1 -
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |  10 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi  |  32 +++++-
 arch/arm64/boot/dts/ti/k3-am62-verdin-dev.dtsi     |   8 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-mallow.dtsi  |  22 +++-
 arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi   |   8 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi         |  47 ++++++--
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi         |  10 ++
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts     |  35 +++---
 .../boot/dts/ti/k3-am625-phyboard-lyra-rdk.dts     | 127 +++++++++++++++++=
+++-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi          |  23 +++-
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi        |  10 ++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            |  21 ++++
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi          |  55 +++++++++
 arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi        |  10 ++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            |  72 +++++++++++-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            |   1 -
 .../dts/ti/k3-am642-phyboard-electra-gpio-fan.dtso |  50 ++++++++
 .../boot/dts/ti/k3-am642-phyboard-electra-rdk.dts  |   6 +-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             |   1 -
 .../boot/dts/ti/k3-am65-iot2050-common-pg1.dtsi    |  32 +++++-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |  56 ++++-----
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi            |   7 +-
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi         |   1 -
 arch/arm64/boot/dts/ti/k3-am69-sk.dts              |  12 +-
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |  10 --
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |   8 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          |  10 --
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    |  10 +-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |  12 --
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi   |   2 -
 arch/arm64/boot/dts/ti/k3-j721s2.dtsi              |   1 +
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts            |  13 ++-
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts           |   8 +-
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi         |  12 --
 arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi   |   9 +-
 arch/arm64/boot/dts/ti/k3-j784s4.dtsi              |   1 +
 38 files changed, 597 insertions(+), 167 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-f=
an.dtso

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--p2iv5ftoftgbij6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmYyOOAACgkQ3bWEnRc2
JJ2iHg//f/+kzo0wGU4UeXydDnNj8x/aGr7aw5WixCyXa2cqrr7PA0z/xPutWlSF
mPVIAFX7lY+WhwnsgTWqHueQbaWl3uE6Qaas7Zs9E2SBNegK7G3rIce38AKqlMIS
ObiTnUVTbmQvBVMy1VrL00c7yD2Y1dlse4y67AdlB+XGrCvg9UTdagiZmNo6wwly
HsdhVIxhhXiQXjcOS7zcpJxQtkusjF5frieTtjOYkD922PPtzXyXtwNlY5xGHZGz
vSoTFKhVLAADfwj4aYBuTgLSJTOT2X2keSUdTfWGfqMs6cDVmpLCIdx3QXDMrfmb
FUGbJjq32+GlsH9j32fOCUfNaF5rKlr4rOp2ZPON/ROOaVK5esK88lTeso26VIiP
4DtFPsVrPxJWt1TFpTPkDTGnmwpEao4WvqNz4Gw/BH9ECLX5P/nr8uBACC/HxUdR
9Qcr8/i/BZ0vNT7j0yGCsXDyO+z8ZXANy5Hj2pQNNuAVRVobsBo3fiAqdeArdOEI
amVsMssZwMXoFk74E16nJLsS5H7ykR2fALEoiMLM23SfMgPl99Als4xAvTe/ep62
xYoV+/bsmr5VrRoGR2gojizHJwDeYfG6zTSaxCswDvrSqojQj20LcLQCTFEKrbrw
aEeRbhcaPmt3fA/dLkLzOwYDdMFFcrit1OUVkoTemjyFCxIyB90=
=C3u1
-----END PGP SIGNATURE-----

--p2iv5ftoftgbij6y--
