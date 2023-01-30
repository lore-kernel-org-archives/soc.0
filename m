Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4116DC54EED
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 02:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 277CDC4339B; Mon, 30 Jan 2023 02:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1F6C433A0;
	Mon, 30 Jan 2023 02:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675046429;
	bh=DD9kJWUtPHb4L9B6qm/jw2hcyE9BzOu5pzOtx9e+a9Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cOC0rB/a+vqyyy/+4/1AkEXrxtxMdZRJQlOpWv41LOPXmlEaAs5A/3oxsfBO5/yY/
	 EGBXH6CO6LJPHm1QO/E1Ps90S9fr/UCEFb41/TfAztYaKNyrDr39JgxMBjnSQRG9Ew
	 hVc+E2E/eHqt0mVb2An2NFTVsCc9Vm7NSBHF/8koB9UcKK+rFjPx8NL7T/hjUrxl/H
	 sZ1NehAjWbd+EvmRPAjrdBvuKktWLweOW+tRDjEgzanceM2/WtsKu/slEuJ1RC90pF
	 keiPrkFEYPYuqkpW0vA47AQt4+GHb+Bg3Py5rPUHDRznCOKSDOqTukG+qXZLwPdMJP
	 YN1oSUcw+xMFA==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] i.MX arm64 device tree change for 6.3
Date: Mon, 30 Jan 2023 10:39:46 +0800
Message-Id: <20230130023947.11780-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230130023947.11780-1-shawnguo@kernel.org>
References: <20230130023947.11780-1-shawnguo@kernel.org>

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.3

for you to fetch changes up to 46e828026cc8daf29b251efca27b93eaaf906081:

  arm64: ls1046ardb: Use in-band-status for SFP module (2023-01-30 10:05:43 +0800)

----------------------------------------------------------------
i.MX arm64 device tree change for 6.3:

- New board support: i.MX8MP Beacon Kit, Debix Model A Board,
  Verdin Yavia boards.
- Add Flexcan and ADC support for i.MX93.
- A series from Krzysztof Kozlowski to align LED node names with
  dtschema and use generic node name for rave-sp.
- Move PCIe controller clock setup from board dts to SoC dtsi.
- Add clock-cells to i.MX8MP hsio-blk-ctrl device.
- Add TMU phandle to calibration data in OCOTP for i.MX8M.
- Improve bluetooth UART on DH electronics i.MX8M Plus DHCOM.
- Drop sd-vsel-gpios from i.MX8M Verdin SoM and DHCOM SoM.
- A series from Peng Fan to improve iomuxc-gpr device for i.MX8M.
- Declare IOMMU cache-coherent page table walk feature for LS1028A and
  LS1088A.
- A few small corrections and random updates.

----------------------------------------------------------------
Adam Ford (2):
      arm64: dts: imx8mp: Enable spba-bus on AIPS3
      arm64: dts: freescale: Introduce imx8mp-beacon-kit

Alexander Stein (3):
      arm64: dts: tqma8m*: Fix temperature sensor compatible
      arm64: dts: imx8mp: Add LCDIF2 & LDB nodes
      arm64: dts: freescale: Add LVDS overlay for TQMa8MPxL

Daniel Scally (1):
      arm64: dts: Add device tree for the Debix Model A Board

Frieder Schrempf (1):
      arm64: dts: imx8mm-kontron: Add RTC aliases

Haibo Chen (2):
      arm64: dts: imx93: add flexcan nodes
      arm64: dts: imx93: add ADC support

Krzysztof Kozlowski (3):
      arm64: dts: imx: align LED node names with dtschema
      arm64: dts: imx8dxl: drop 0x from unit address
      arm64: dts: imx8q: use generic node name for rave-sp

Lucas Stach (2):
      arm64: dts: imx8mp: move PCIe controller clock config to SoC dtsi
      arm64: dts: imx8mp: add clock-cells to hsio-blk-ctrl

Marcel Ziswiler (1):
      arm64: dts: verdin-imx8mp: unify gpio-key node name

Marco Felsch (1):
      arm64: dts: imx8mm-evk: use correct gpio-expander compatible

Marek Vasut (18):
      arm64: dts: imx8m: Align SoC unique ID node unit address
      arm64: dts: imx8m: Document the fuse address calculation
      arm64: dts: imx8m: Add TMU phandle to calibration data in OCOTP
      arm64: dts: imx8mp: Drop deprecated regulator-compatible from i.MX8M Plus DHCOM
      arm64: dts: imx8mm: Drop deprecated regulator-compatible from Variscite VAR-SOM-MX8MM
      arm64: dts: imx8mn: Drop deprecated regulator-compatible from Variscite VAR-SOM-MX8MN
      arm64: dts: imx8mn: Add LDO5 regulator-name to Variscite VAR-SOM-MX8MN
      arm64: dts: imx8mm: Update i.MX8M Mini Toradex Verdin based Menlo board compatible string
      arm64: dts: imx8mm: Drop dma-apb interrupt-names
      arm64: dts: imx8mn: Drop dma-apb interrupt-names
      arm64: dts: imx8mp: Add Hantro G1, G2 DT nodes
      arm64: dts: imx8mm: Deduplicate PCIe clock-names property
      arm64: dts: imx8mq: Deduplicate PCIe clock-names property
      arm64: dts: imx8mp: Reorder clock to match fsl,imx6q-pcie.yaml
      arm64: dts: imx8mp: Improve bluetooth UART on DH electronics i.MX8M Plus DHCOM
      arm64: dts: imx8mm: Drop sd-vsel-gpios from i.MX8M Mini Verdin SoM
      arm64: dts: imx8mp: Drop sd-vsel-gpios from i.MX8M Plus Verdin SoM
      arm64: dts: imx8mp: Drop sd-vsel-gpios from i.MX8M Plus DHCOM SoM

Martin Kepplinger (1):
      arm64: dts: imx8mq-librem5: use multicolor leds description for RGB led

Michael Walle (1):
      arm64: dts: ls1028a: sl28: get MAC addresses from VPD

Peng Fan (4):
      arm64: dts: imx8mq: correct iomuxc-gpr compatible
      arm64: dts: imx8mm: correct iomuxc-gpr compatible
      arm64: dts: imx8mn: update iomuxc-gpr node name
      arm64: dts: imx8mp: use syscon for iomuxc-gpr

Philippe Schenker (5):
      arm64: dts: verdin-imx8mm: Disable usb over-current
      arm64: dts: imx8mm-verdin-dev: Do not include dahlia dtsi
      arm64: dts: imx8mp-verdin-dev: Do not include dahlia dtsi
      arm64: dts: imx8mm-verdin: Add yavia carrier board
      arm64: dts: imx8mp-verdin: Add yavia carrier board

Sean Anderson (1):
      arm64: ls1046ardb: Use in-band-status for SFP module

Stefan Eichenberger (1):
      arm64: dts: imx8mm-verdin: enable hpd on hdmi-connector

Vladimir Oltean (2):
      arm64: dts: ls1028a: declare cache-coherent page table walk feature for IOMMU
      arm64: dts: ls1088a: declare cache-coherent page table walk feature for IOMMU

Wei Fang (1):
      arm64: dts: imx8dxl-evk: Disable hibernation mode of AR8031 for EQOS

 arch/arm64/boot/dts/freescale/Makefile             |  10 +
 .../fsl-ls1028a-kontron-kbox-a-230-ls.dts          |  12 +
 .../freescale/fsl-ls1028a-kontron-sl28-var1.dts    |   2 +
 .../freescale/fsl-ls1028a-kontron-sl28-var2.dts    |   8 +
 .../freescale/fsl-ls1028a-kontron-sl28-var4.dts    |   2 +
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts     |  17 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  |   4 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   1 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |   1 +
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi |   2 +-
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |   5 +-
 .../dts/freescale/imx8mm-data-modul-edm-sbc.dts    |   5 +-
 arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi    |   4 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   7 +-
 .../boot/dts/freescale/imx8mm-innocomm-wb15.dtsi   |   3 -
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts |   4 +-
 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   |   7 +-
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts  |   1 +
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |   3 -
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |   5 +-
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |   4 +-
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |   1 -
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |   5 +-
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |   5 +-
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   |   5 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   5 +-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   5 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |   5 +-
 .../boot/dts/freescale/imx8mm-venice-gw7904.dts    |   5 +-
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   |   2 +
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi      |  96 +++-
 .../dts/freescale/imx8mm-verdin-nonwifi-yavia.dts  |  18 +
 .../dts/freescale/imx8mm-verdin-wifi-yavia.dts     |  18 +
 .../boot/dts/freescale/imx8mm-verdin-yavia.dtsi    | 169 +++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  13 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  34 +-
 .../arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi |   4 +-
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |   2 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  28 +-
 .../arm64/boot/dts/freescale/imx8mp-beacon-kit.dts | 550 +++++++++++++++++++++
 .../boot/dts/freescale/imx8mp-beacon-som.dtsi      | 416 ++++++++++++++++
 .../boot/dts/freescale/imx8mp-debix-model-a.dts    | 506 +++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |  21 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   7 -
 .../freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso  |  61 +++
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |   5 +-
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi |   5 +-
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |   7 -
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      | 116 ++++-
 .../dts/freescale/imx8mp-verdin-nonwifi-yavia.dts  |  18 +
 .../dts/freescale/imx8mp-verdin-wifi-yavia.dts     |  18 +
 .../boot/dts/freescale/imx8mp-verdin-yavia.dtsi    | 213 ++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |   3 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          | 349 ++++++++-----
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |  10 +-
 .../dts/freescale/imx8mq-kontron-pitx-imx8m.dts    |  10 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |   2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |  32 +-
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      |   5 +-
 .../boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |  10 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi  |   4 +-
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |  12 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  32 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |  12 +
 arch/arm64/boot/dts/freescale/imx93.dtsi           |  41 ++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |   4 +-
 67 files changed, 2717 insertions(+), 280 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
