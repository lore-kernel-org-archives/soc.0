Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3A7C54EE9
	for <soc@archiver.kernel.org>; Sun, 18 Sep 2022 09:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CBFCC433B5; Sun, 18 Sep 2022 09:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8333FC43470;
	Sun, 18 Sep 2022 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663493318;
	bh=weYHgqwoaL7rhy7zrbc2WdD6aY0Q1wC9ifd2mUHjrzM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DftuGipYpGwEn8NwHPBvE6TMdolxQIvbEgMxkBs8aLiHtBPZlUcQ0RSFd2tYEzsJm
	 +w+XNSu3GwOt0+kHIhnXKBvqTh8Cn8wG7GvSkBwEq/GzJRQvEmF0gr9+XQ3ZV0p4jH
	 owJdMYrreltcTI2yQJLIzDVVUsbRbKKK5oJYMyy5k59cFECSwhd15NMU7zsnTUmp5R
	 F0TIr8Nsuixf55eQgsORgyDAuihC2+iMSQ3Ye3MgR2ZYjoyiYoPEIdXszlemMbslLj
	 UtlFu2WOnVR/FIJ/58aplr3yPGTGqzG3V/fXQZfX8Uas4appbzZQMvX0F+uQ7KAi8E
	 3Ju8y7b7E1yvw==
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
Subject: [GIT PULL 4/4] i.MX arm64 device tree update for 6.1
Date: Sun, 18 Sep 2022 17:28:06 +0800
Message-Id: <20220918092806.2152700-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220918092806.2152700-1-shawnguo@kernel.org>
References: <20220918092806.2152700-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This is the i.MX arm64 device tree changeset for 6.1 .  It's built
on top of imx/bindings branch (tag imx-bindings-6.1) to resolve the
dependency on DT bindings header.  Please consider to pull, thanks!

Shawn


The following changes since commit 64e61a940d96184d294f431848a28765f44525fa:

  dt-bindings: arm: imx: update fsl.yaml for imx8dxl (2022-09-17 16:25:50 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.1

for you to fetch changes up to d4e87e4e8486ce255e46e4b866e84416cc0d2a89:

  arm64: dts: ls1046a-qds: Modify the qspi flash frequency (2022-09-17 16:35:25 +0800)

----------------------------------------------------------------
i.MX arm64 device tree change for 6.1:

- New board support: i.MX8DXL EVK, Kontron SL/BL i.MX8MM OSM-S, i.MX8MM
  Gateworks GW7904, MSC SM2S-IMX8PLUS SoM and carrier board, NXP
  LS2081ARDB.
- Update i.MX8MQ device tree to use generic name 'dma-controller' for
  SDMA.
- A number of i.MX8ULP device tree improvements and updates: correct
  parent clock of LPI2C & LPSPI, increase the clock speed of LPSPI, add
  PMU and mailbox device, drop undocumented CGC property, enable FEC, etc.
- Add interconnect property for various i.MX8MP blk-ctrl devices.
- Enable VPU PGC, blk-ctrl and PCIe support for i.MX8MP SoC.
- A set of changes from Peng Fan to add various devices for i.MX93 SoC,
  including MU, blk-ctrl, PMU, LPI2C, LPSPI, SRC, etc.
- Two set of changes to update LS1043A and LS1046A device trees on
  various aspects, including USB3, PCIe, DMA, mdio-mux, QSPI Flash, etc.
- Board imx8mq-librem5 update: add USB role switching, add RGB PWM
  notification LEDs, add voice coil motor for focus control, fix MIPI_CSI
  description.
- A series from Frieder Schrempf to improve imx8mm-kontron device trees
  for VSELECT switch, DDRC operating point, SPI NOR partition layout etc.
- A set of display and PMIC related additions and improvements on
  imx8mm-verdin board.
- A number of i.MX8M Plus DHCOM PDK2 device tree improvments from Marek
  Vasut.
- A few imx8mp-venice device tree updates on USB, cpufreq and WiFi/BT.
- A series from Vladimir Oltean to enable multiple switch CPU ports
  support.
- Other small and random board specific updates.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: tqma8mpql: add USB DR support

Angus Ainslie (2):
      arm64: dts: imx8mq-librem5: add USB type-c properties for role switching
      arm64: dts: imx8mq-librem5: add usb-role-switch property to dwc3

Biwen Li (1):
      arm64: dts: ls208xa-rdb: fix errata E-00013

Clark Wang (1):
      arm64: dts: imx8ulp: increase the clock speed of LPSPI

Fabio Estevam (1):
      arm64: dts: imx8mm/n-venice-gw7902: Remove invalid property

Frieder Schrempf (6):
      arm64: dts: imx8mm-kontron: Adjust compatibles, file names and model strings
      arm64: dts: imx8mm-kontron: Use the VSELECT signal to switch SD card IO voltage
      arm64: dts: imx8mm-kontron: Remove low DDRC operating point
      arm64: dts: imx8mm-kontron: Use voltage rail names from schematic for PMIC regulator-names
      arm64: dts: imx8mm-kontron: Add SPI NOR partition layout
      arm64: dts: Add support for Kontron SL/BL i.MX8MM OSM-S

Guido Günther (1):
      arm64: dts: imx8mq-librem5: add RGB pwm notification leds

Hou Zhiqiang (3):
      arm64: dts: ls1043a: Add SCFG phandle for PCIe nodes
      arm64: dts: ls1043a: Add big-endian property for PCIe nodes
      arm64: dts: ls1046a: Add big-endian property for PCIe nodes

Ioana Radulescu (1):
      arm64: dts: ls2080a-rdb: add phy nodes

Jagan Teki (1):
      arm64: dts: imx8mm: Fix typo in license text for Engicam boards

Joy Zou (1):
      arm64: dts: imx8mq: update sdma node name format

Laurentiu Tudor (4):
      arm64: dts: ls1043a: add missing dma ranges property
      arm64: dts: ls1043a: use a pseudo-bus to constrain usb and sata dma size
      arm64: dts: ls1046a: add missing dma ranges property
      arm64: dts: ls1046a: use a pseudo-bus to constrain usb and sata dma size

Li Yang (12):
      arm64: dts: ls208xa-qds: add mdio mux nodes from on-board FPGA
      arm64: dts: ls1043a: fix the wrong size of dcfg space
      arm64: dts: ls1043a: Enable usb3-lpm-capable for usb3 node
      arm64: dts: ls1043a: use pcie aer/pme interrupts
      arm64: dts: ls1043a: make dma-coherent global to the SoC
      arm64: dts: ls1043a: add gpio based i2c recovery information
      arm64: dts: ls1043a-qds: add mmio based mdio-mux support
      arm64: dts: ls1043a-rdb: add pcf85263 rtc node
      arm64: dts: ls1046a: Enable usb3-lpm-capable for usb3 node
      arm64: dts: ls1046a: make dma-coherent global to the SoC
      arm64: dts: ls1046a: add gpios based i2c recovery information
      arm64: dts: ls1046a-qds: add mmio based mdio-mux nodes for FPGA

Marcel Ziswiler (6):
      arm64: dts: imx8mm-venice-gw72xx-0x: blank line at end of file
      arm64: dts: imx8mp-verdin: don't use multiple blank lines
      arm64: dts: mnt-reform2: don't use multiple blank lines
      arm64: dts: imx8ulp: no executable source file permission
      arm64: dts: verdin-imx8mm: rename sn65dsi83 to sn65dsi84
      arm64: dts: verdin-imx8mm: add lvds panel node

Marek Vasut (4):
      arm64: dts: imx8mp: Add HW variant details to i.MX8M Plus DHCOM PDK2
      arm64: dts: imx8mp: Drop Atheros PHY header from i.MX8M Plus DHCOM PDK2
      arm64: dts: imx8mp: Add SoM compatible to i.MX8M Plus DHCOM PDK2
      arm64: dts: imx8mp: Add SNVS LPGPR

Martin Kepplinger (2):
      arm64: dts: imx8mq-librem5: describe the voice coil motor for focus control
      arm64: dts: imx8mq-librem5: fix mipi_csi description

Martyn Welch (1):
      arm64: dts: imx8mp-msc-sm2s: Add device trees for MSC SM2S-IMX8PLUS SoM and carrier board

Max Krummenacher (1):
      arm64: dts: imx8mp-verdin: add cpu-supply

Pankaj Bansal (2):
      arm64: dts: ls208x: remove NXP Erratum A008585 from LS2088A.
      arm64: dts: ls1046a-qds: Modify the qspi flash frequency

Peng Fan (18):
      arm64: dts: imx8mp: add interconnects for media blk ctrl
      arm64: dts: imx8mp: add interconnect for hsio blk ctrl
      arm64: dts: imx8mp: add vpu pgc nodes
      arm64: dts: imx8mp: add VPU blk ctrl node
      arm64: dts: imx8-ss-dma: add IPG clock for i2c
      arm64: dts: imx8ulp: drop undocumented property in cgc
      arm64: dts: imx8ulp: correct the scmi sram node name
      arm64: dts: imx8ulp: add pmu node
      arm64: dts: imx8ulp: add mailbox node
      arm64: dts: imx93: correct SDHC clk entry
      arm64: dts: imx93: add gpio clk
      arm64: dts: imx93: add s4 mu node
      arm64: dts: imx93: add blk ctrl node
      arm64: dts: imx93: add a55 pmu
      arm64: dts: imx93: add lpi2c nodes
      arm64: dts: imx93: add lpspi nodes
      arm64: dts: imx93: add src node
      arm64: dts: imx93: add mediamix blk ctrl node

Philippe Schenker (1):
      arm64: dts: verdin-imx8mm: introduce hdmi-connector

Priyanka Jain (1):
      arm64: dts: ls2081a-rdb: Add DTS for NXP LS2081ARDB

Richard Zhu (2):
      arm64: dts: imx8mp: Add iMX8MP PCIe support
      arm64: dts: imx8mp-evk: Add PCIe support

Sebastian Krzyszkowiak (1):
      arm64: dts: imx8mq-librem5: Add bq25895 as max17055's power supply

Shenwei Wang (3):
      arm64: dts: imx8: add a node label to ddr-pmu
      arm64: dts: freescale: add i.MX8DXL SoC support
      arm64: dts: freescale: add support for i.MX8DXL EVK board

Tim Harvey (6):
      arm64: dts: imx8mm-venice-gw7903: add digital I/O ctl gpios
      arm64: dts: imx8mp-venice-gw74xx: add USB DR support
      arm64: dts: imx8mp-venice-gw74xx: add cpu-supply node for cpufreq
      arm64: dts: imx8mp-venice-gw74xx: add WiFi/BT module support
      arm64: dts: imx: Add i.mx8mm Gateworks gw7904 dts support
      arm64: dts: imx8mp-venice-gw74xx: add PCIe support

Vladimir Oltean (4):
      arm64: dts: ls1028a: move DSA CPU port property to the common SoC dtsi
      arm64: dts: ls1028a: mark enetc port 3 as a DSA master too
      arm64: dts: ls1028a: enable swp5 and eno3 for all boards
      arm64: dts: ls1028a-rdb: add more ethernet aliases

Wei Fang (2):
      arm64: dts: imx8ulp: Add the fec support
      arm64: dts: imx8ulp-evk: Add the fec support

Xiaowei Bao (1):
      arm64: dts: ls1046a: Add the PME interrupt and big-endian to PCIe EP nodes

 arch/arm64/boot/dts/freescale/Makefile             |   7 +-
 .../fsl-ls1028a-kontron-kbox-a-230-ls.dts          |   9 +-
 .../freescale/fsl-ls1028a-kontron-sl28-var2.dts    |   9 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |  12 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts  | 173 +++-
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts  |  10 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     | 132 +--
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts  | 157 +++-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     | 117 +--
 arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dts  |  69 ++
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |   4 +
 arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dts  | 132 +++
 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi |  65 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |   3 +-
 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi     |   2 +-
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     |  20 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      | 426 ++++++++++
 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi |  52 ++
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 142 ++++
 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi  |   9 +
 arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi |  74 ++
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         | 238 ++++++
 .../boot/dts/freescale/imx8mm-icore-mx8mm.dtsi     |   2 +-
 .../boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts | 376 +++++++++
 ...m-kontron-n801x-s.dts => imx8mm-kontron-bl.dts} |   9 +-
 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   | 330 ++++++++
 ...ntron-n801x-som.dtsi => imx8mm-kontron-sl.dtsi} |  53 +-
 .../boot/dts/freescale/imx8mm-venice-gw72xx-0x.dts |   1 -
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   1 -
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |   4 +-
 .../boot/dts/freescale/imx8mm-venice-gw7904.dts    | 888 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  19 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |   1 -
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts |   9 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  53 ++
 .../dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts  |   2 +-
 .../boot/dts/freescale/imx8mp-icore-mx8mp.dtsi     |   2 +-
 .../dts/freescale/imx8mp-msc-sm2s-14N0600E.dtsi    |  68 ++
 .../boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts     |  52 ++
 arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi | 820 +++++++++++++++++++
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |  48 ++
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    | 150 +++-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |  19 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          | 110 +++
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |  40 +-
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      |   1 -
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   4 +-
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  57 ++
 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h    |   0
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |  65 +-
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 206 ++++-
 53 files changed, 5060 insertions(+), 196 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
 rename arch/arm64/boot/dts/freescale/{imx8mm-kontron-n801x-s.dts => imx8mm-kontron-bl.dts} (96%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
 rename arch/arm64/boot/dts/freescale/{imx8mm-kontron-n801x-som.dtsi => imx8mm-kontron-sl.dtsi} (87%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-14N0600E.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
 mode change 100755 => 100644 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
