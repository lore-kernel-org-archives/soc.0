Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BBEC4167B
	for <soc@archiver.kernel.org>; Sat, 16 Dec 2023 06:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72277C433C8; Sat, 16 Dec 2023 06:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F750C433C9;
	Sat, 16 Dec 2023 06:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702709193;
	bh=CpFedIf1YSgXor8rE2ylvveqISYf8g819jczIYWbfvo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HoPOob39oXhGUPjNyPLAPsDrAAmGg0OpQ0YVjnqur93Y7+N/unh1YHBGSHCufJhNz
	 75txSFaPykJh1AGu0VDr1La09fcRVmupGitA7DIL0T37/Nb9OqRkGEhGyshOhBK2p6
	 st7MbUMYyZnHpKOUcQZ0al4eMXyaWTK5Wtq43bDbgFvokYLVCj4ks8QpwO5tsTwJaE
	 V4ICARHY6Pm9nm5/wunPGcjOfhlqjar+Urj0sbjmd3ISR2TWL+G88f4q00jZhvvzeq
	 rG6i0QQWvEANNSF2YqqVH1u+/DkBbedf5tNVzeiOX/r30wM0m9ZsxPE89TbdGR2a8C
	 nPd19sm2aTRtw==
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
Subject: [GIT PULL 5/5] i.MX arm64 device tree for 6.8
Date: Sat, 16 Dec 2023 14:46:05 +0800
Message-Id: <20231216064605.876196-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231216064605.876196-1-shawnguo@kernel.org>
References: <20231216064605.876196-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.8

for you to fetch changes up to f43c3a62e7d57e5da8d5f0c50d7254808af15920:

  arm64: dts: freescale: fix the schema check errors for fsl,tmu-calibration (2023-12-16 09:48:35 +0800)

----------------------------------------------------------------
i.MX arm64 device tree for 6.8:

- New board support: MBa93xxCA starter kit, LX2160A based MBLX2160A,
  Dimonoff Gateway EVK, Verdin i.MX8M based Mallow, and SKOV i.MX8MP revB.
- A set of changes from Adam Ford to enable MIPI_DSI, overdrive mode and
  NPU support for Beacon i.MX8M boards.
- A number of changes from Alexander Stein to add CCM interrupts for
  CCM, 'chassis-type' property, and enable VPU and LVDS display for
  TQ-Systems boards.
- i.MX93 update for AUDIO, I3C, ANATOP and uSDHC.
- A couple of changes from David Heidelberg to correct dt-schema check
  errors for 'fsl,tmu-calibration' and 'gpio-fan,speed-map'.
- A bunch of nice dt-schema check fix-ups from Fabio Estevam.
- A couple of debix-som update from Kieran Bingham adding heartbeat LED
  and CSI power regulators.
- White-space cleanup from Krzysztof Kozlowski.
- Add display support for imx8mn-bsh-smm-s2/pro board.
- A series from Tim Harvey to add TPM support for i.MX8M Venice devices.

----------------------------------------------------------------
Adam Ford (10):
      arm64: dts: imx8mp-beacon-kit: Enable DSI to HDMI Bridge
      arm64: dts: imx8mp: Add NPU Node
      arm64: dts: imx8mm: Simplify mipi_dsi clocks
      arm64: dts: imx8mm: Remove video_pll1 clock rate from clk node
      arm64: dts: imx8mm: Slow default video_pll1 clock rate
      arm64: dts: imx8mm: Reduce GPU to nominal speed
      arm64: dts: imx8mm: Add optional overdrive DTSI
      arm64: dts: imx8mm-beacon: Enable overdrive mode
      arm64: dts: imx8mn: Enable Overdrive mode
      arm64: dts: imx8mn-beacon: Support overdrive mode

Alexander Stein (11):
      arm64: dts: freescale: tqma9352-mba93xxla: add 'chassis-type' property
      arm64: dts: freescale: add initial device tree for MBa93xxCA starter kit
      arm64: dts: imx8mp: Add CCM interrupts
      arm64: dts: imx8mn: Add CCM interrupts
      arm64: dts: imx8mm: Add CCM interrupts
      arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8MPxL
      arm64: dts: imx8mp: Disable dsp reserved memory by default
      arm64: dts: tqma8mpql: Remove invalid/unused property
      arm64: dts: imx8m*-tqma8m*: Add chassis-type
      arm64: dts: imx8qxp: Add VPU subsystem file
      arm64: dts: freescale: imx8qxp: Disable dsp reserved memory by default

Andrejs Cainikovs (1):
      arm64: dts: imx8-apalis: add can power-up delay on ixora board

Chancel Liu (2):
      arm64: dts: imx93: Add audio device nodes
      arm64: dts: imx93: Configure clock rate for audio PLL

David Heidelberg (2):
      arm64: dts: imx8mq-phanbell: make dts use gpio-fan matrix instead of array
      arm64: dts: freescale: fix the schema check errors for fsl,tmu-calibration

Fabio Estevam (21):
      arm64: dts: imx8mm-venice-gw7: Fix pci sub-nodes
      arm64: dts: imx8qm-ss-dma: Pass lpuart dma-names
      arm64: dts: imx8mm-emcon-avari: Fix gpio-cells
      arm64: dts: imx8dxl-ss-conn: Fix Ethernet interrupt-names order
      arm64: dts: imx8mm-nitrogen-r2: Fix I2C mux subnode name
      arm64: dts: imx8mp-debix-model-a: Use phy-mode
      arm64: dts: imx8qxp-mek: Fix gpio-sbu-mux compatible
      arm64: dts: imx93: Remove unexistent 'shared-interrupt'
      arm64: dts: imx8-ss-audio: Remove unexistent'shared-interrupt'
      arm64: dts: imx8mm-venice-gw7: Adjust PCI Ethernet nodes
      arm64: dts: ls1012a: Remove big-endian from thermal
      arm64: dts: imx93: Fix the micfil clock-names entries
      arm64: dts: imx8mm-evk: Move port under USB connector
      arm64: dts: imx8mn-evk: Move port under USB connector
      arm64: dts: imx8dxl-ss-conn: Move clk_dummy out of USB node
      arm64: dts: imx8mp-verdin: Fix USB connector description
      arm64: dts: imx8mp-venice: Fix USB connector description
      arm64: dts: imx8mp-tqma8mpql-mba8mpxl: Fix USB connector description
      arm64: dts: imx8mn-var-som-symphony: Describe the USB-C connector
      arm64: dts: imx8mp-dhcom-pdk3: Describe the USB-C connector
      arm64: dts: imx8qxp-mek: Move port under USB connector

Frank Li (1):
      arm64: dts: freescale: imx93: add i3c1 and i3c2

Gregor Herburger (1):
      arm64: dts: freescale: add fsl-lx2160a-mblx2160a board

Haibo Chen (3):
      arm64: dts: imx93-11x11-evk: set SION for cmd and data pad of USDHC
      arm64: dts: imx93: change tuning start to get a large scan range for standard tuning
      arm64: dts: imx93-11x11-evk: add 12 ms delay to make sure the VDD_SD power off

Hugo Villeneuve (4):
      arm64: dts: imx8mn-var-som: add fixed 3.3V regulator for EEPROM
      arm64: dts: freescale: introduce rve-gateway board
      arm64: dts: imx8mn-var-som-symphony: add vcc supply for PCA9534
      arm64: dts: freescale: introduce dimonoff-gateway-evk board

Joao Paulo Goncalves (2):
      arm64: dts: freescale: verdin-imx8mm: add support to mallow board
      arm64: dts: freescale: verdin-imx8mp: add support to mallow board

Kieran Bingham (2):
      arm64: dts: freescale: debix-som: Add heartbeat LED
      arm64: dts: freescale: debix-som-a-bmb-08: Add CSI Power Regulators

Krzysztof Kozlowski (1):
      arm64: dts: freescale: minor whitespace cleanup around '='

Marek Vasut (1):
      arm64: dts: imx8mp: Describe M24C32-D write-lockable page in DH i.MX8MP DHCOM DT

Michael Trimarchi (1):
      arm64: dts: imx8mn-bsh-smm-s2/pro: add display setup

Oleksij Rempel (1):
      arm64: dts: freescale: Add SKOV IMX8MP CPU revB board

Peng Fan (1):
      arm64: dts: imx93: update anatop node

Tim Harvey (3):
      arm64: dts: imx8mm-venice-gw72xx: add TPM device
      arm64: dts: imx8mp-venice-gw72xx: add TPM device
      arm64: dts: imx8mp-venice-gw74xx: remove unecessary propreties in tpm node

Xu Yang (1):
      arm64: dts: imx8dxl-ss-ddr: change ddr_pmu0 compatible

 arch/arm64/boot/dts/freescale/Makefile             |  38 ++
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |  80 +--
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  87 +--
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  81 +--
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  74 +--
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |  74 +--
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |  73 +--
 .../freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts | 338 ++++++++++
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_12_x_x.dtso   |  29 +
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_14_x_x.dtso   |  17 +
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso   |  49 ++
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso    |  55 ++
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_x_8_x.dtso    |  47 ++
 .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |  97 +++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   4 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |   2 +
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |   2 -
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi |  16 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi  |   2 +-
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |   2 +
 .../boot/dts/freescale/imx8mm-emcon-avari.dtsi     |   2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |  12 +-
 .../boot/dts/freescale/imx8mm-nitrogen-r2.dts      |   2 +-
 .../arm64/boot/dts/freescale/imx8mm-overdrive.dtsi |  29 +
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |   1 +
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |  39 +-
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   |  29 +-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |  13 +-
 .../boot/dts/freescale/imx8mm-verdin-mallow.dtsi   | 173 +++++
 .../dts/freescale/imx8mm-verdin-nonwifi-mallow.dts |  18 +
 .../dts/freescale/imx8mm-verdin-wifi-mallow.dts    |  18 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  18 +-
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |   2 +
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    |   1 +
 .../dts/freescale/imx8mn-bsh-smm-s2-display.dtsi   | 121 ++++
 .../dts/freescale/imx8mn-dimonoff-gateway-evk.dts  | 160 +++++
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |  12 +-
 .../arm64/boot/dts/freescale/imx8mn-overdrive.dtsi |  18 +
 .../boot/dts/freescale/imx8mn-rve-gateway.dts      | 285 +++++++++
 .../boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts |   1 +
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts |  21 +-
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |   9 +
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   2 +
 .../arm64/boot/dts/freescale/imx8mp-beacon-kit.dts |  92 +++
 .../boot/dts/freescale/imx8mp-debix-model-a.dts    |   2 +-
 .../dts/freescale/imx8mp-debix-som-a-bmb-08.dts    |  56 ++
 .../boot/dts/freescale/imx8mp-debix-som-a.dtsi     |  22 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts |  12 +-
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |  12 +
 .../boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts     |   4 +-
 .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 711 +++++++++++++++++++++
 .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts   |  20 +
 .../boot/dts/freescale/imx8mp-skov-revb-lt6.dts    | 101 +++
 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  | 100 +++
 .../imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso  |  77 +++
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |  28 +-
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi   |  26 +-
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi   |  36 +-
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi   |  26 +-
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |  28 +-
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   | 199 ++++++
 .../dts/freescale/imx8mp-verdin-nonwifi-mallow.dts |  18 +
 .../dts/freescale/imx8mp-verdin-wifi-mallow.dts    |  18 +
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |  30 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  28 +-
 arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts  |   2 +-
 .../boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |   1 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |   4 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  21 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-vpu.dtsi  |  17 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   3 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |  31 +-
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     | 709 ++++++++++++++++++++
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |   1 +
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 127 +++-
 75 files changed, 4326 insertions(+), 389 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_12_x_x.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_14_x_x.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_8_x.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-overdrive.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-overdrive.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-vpu.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
