Return-Path: <SRS0=Xp6/=ZY=ti.com=vigneshr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D711ECAAD8
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 14:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7A61C433B5; Wed, 21 Sep 2022 14:17:30 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53EF1C433D7;
	Wed, 21 Sep 2022 14:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53EF1C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28LEHOxI064264;
	Wed, 21 Sep 2022 09:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1663769845;
	bh=Yje3e6ar5KkGoCXgtFMDAWVDWFox1uievni6T2XKpDM=;
	h=Date:To:CC:From:Subject;
	b=jxAPo5nkxdq+VXr8B7oV9VNmzyTvaB0vsIdzsK4orNZe9sJ8Karl2oQCVFe1FzrZK
	 sskhuf+J19taTgaGLfoS0WeZcdu84jhxhaaWn0BofiCTmjIF92ML2U+Nel71WHoBvW
	 itfknKOMBGS5cm3+u+s1GNBpvsTuQ2IF2QwtAr38=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28LEHODg002352
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Sep 2022 09:17:24 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 21
 Sep 2022 09:17:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 21 Sep 2022 09:17:24 -0500
Received: from [172.24.145.182] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28LEHL3b008776;
	Wed, 21 Sep 2022 09:17:22 -0500
Message-ID: <44729b46-27f9-94a0-17ed-8868649a4a0a@ti.com>
Date: Wed, 21 Sep 2022 19:47:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm-soc
	<arm@kernel.org>, SoC <soc@kernel.org>
CC: Nishanth Menon <nm@ti.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Tero Kristo <kristo@kernel.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL] TI K3 device tree updates for v6.1
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------xt0FPp6ilFhTwxcpF1dbXIje"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--------------xt0FPp6ilFhTwxcpF1dbXIje
Content-Type: multipart/mixed; boundary="------------dHkObYdDcWtk4qYzMOu7MQlh";
 protected-headers="v1"
From: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
Cc: Nishanth Menon <nm@ti.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <kristo@kernel.org>
Message-ID: <44729b46-27f9-94a0-17ed-8868649a4a0a@ti.com>
Subject: [GIT PULL] TI K3 device tree updates for v6.1

--------------dHkObYdDcWtk4qYzMOu7MQlh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC maintainers,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b8=
68:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-dt-for-v6.1

for you to fetch changes up to 0d0a0b4413460383331088b2203ba09a6971bc3a:

  arm64: dts: ti: k3-j7200: fix main pinmux range (2022-09-21 15:24:37 +0=
530)

----------------------------------------------------------------
TI K3 device tree updates for v6.1

New Features:
AM62A:
* Basic support for AM62A SoC and SK Board
AM62:
* EPWM support
AM64:
* GPMC, LED, Crypto accelerator support

Fixes:
J7200 pinmux node update
Fixes for Crypto and RNG accelerators on AM65, J721e, J7200

Cleanups:
Reorder SoC compatible and pinmux macros alphabetically

----------------------------------------------------------------
Andrew Davis (4):
      arm64: dts: ti: k3-am65-main: Disable RNG node
      arm64: dts: ti: k3-am65-main: Move SA2UL to unused PSI-L thread ID
      arm64: dts: ti: k3-am65-main: Do not exclusively claim SA2UL
      arm64: dts: ti: k3-j7200-mcu-wakeup: Add SA2UL node

Aparna M (1):
      arm64: dts: ti: k3-am642-sk: Add DT entry for onboard LEDs

Christian Gmeiner (1):
      arm64: dts: ti: k3-am64-main: Add main_cpts label

Daniel Parks (1):
      arm64: dts: ti: k3-j721e-main: fix RNG node clock id

Georgi Vlaev (2):
      arm64: dts: ti: k3-am62-main: Add epwm nodes
      arm64: dts: ti: k3-am625-sk: Add epwm nodes

Gowtham Tammana (1):
      arm64: dts: ti: k3-j7200-main: Add main domain watchdog entries

Matt Ranostay (1):
      arm64: dts: ti: k3-j7200: fix main pinmux range

Nishanth Menon (2):
      dt-bindings: arm: ti: k3: Sort the am654 board enums
      dt-bindings: arm: ti: k3: Sort the SoC definitions alphabetically

Peter Ujfalusi (1):
      arm64: dts: ti: k3-am64-main: Enable crypto accelerator

Roger Quadros (2):
      arm64: dts: ti: k3-am64-main: Add GPMC memory controller node
      arm64: dts: ti: k3-am64-main: Add ELM (Error Location Module) node

Suman Anna (1):
      arm64: dts: ti: k3-am64: Add SA2UL address space to Main CBASS rang=
es

Vignesh Raghavendra (5):
      dt-bindings: arm: ti: Rearrange IOPAD macros alphabetically
      dt-bindings: arm: ti: Add bindings for AM62A7 SoC
      dt-bindings: pinctrl: k3: Introduce pinmux definitions for AM62A
      arm64: dts: ti: Introduce AM62A7 family of SoCs
      arm64: dts: ti: Add support for AM62A7-SK

 Documentation/devicetree/bindings/arm/ti/k3.yaml      |  54 +-
 arch/arm64/boot/dts/ti/Makefile                       |   2 +
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi              |  33 +
 arch/arm64/boot/dts/ti/k3-am625-sk.dts                |  12 +
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi             | 298 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi              |  39 ++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi           |  54 ++
 arch/arm64/boot/dts/ti/k3-am62a.dtsi                  | 122 ++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts               | 223 +++++++
 arch/arm64/boot/dts/ti/k3-am62a7.dtsi                 | 103 ++++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi              |  50 +-
 arch/arm64/boot/dts/ti/k3-am64.dtsi                   |   1 +
 arch/arm64/boot/dts/ti/k3-am642-evm.dts               |   8 +
 arch/arm64/boot/dts/ti/k3-am642-sk.dts                |  85 +++
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi              |   7 +-
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts |  10 +-
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi             |  29 +-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi       |  20 +
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi             |   2 +-
 include/dt-bindings/pinctrl/k3.h                      |  15 +-
 20 files changed, 1127 insertions(+), 40 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7.dtsi

--=20
Regards
Vignesh

--------------dHkObYdDcWtk4qYzMOu7MQlh--

--------------xt0FPp6ilFhTwxcpF1dbXIje
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEyRC2zAhGcGjrhiNExEYeRXyRFuMFAmMrHPEFAwAAAAAACgkQxEYeRXyRFuMp
Jwf+M2Pm7GAJmawAUqCXDMEH/CvgpGUn/4RCXGIBJ0kxjKfiPaOYebYOtldshIsNRk/zVKFNATvK
1DyQoAS+5n3f7JRKgQnXDzC4/pdrwvoYoew/O0CSbasXlplxpbBnvz+YKFpt6JErswjLnutwIkRb
uKYBswZmOm6iXYHRhlqG11Wl2WtgVE31uJ+U5XzC8dwmRywgNMszMUNH6U5SBwWJTrWOMWf9pIvp
F478BtcaxHGAODUQH8D+mquTxanSUViXpBZTjgaUiZByye/KcujiXDbRQsqAmP6nhG3w/0E1/mlA
PBcP9swaWw1knoEYwmZBvomxo2bj2YMtw5/YkC87TA==
=vGg7
-----END PGP SIGNATURE-----

--------------xt0FPp6ilFhTwxcpF1dbXIje--
