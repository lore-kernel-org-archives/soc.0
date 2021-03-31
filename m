Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AEFC433C1
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 04:10:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8906E619E1; Wed, 31 Mar 2021 04:10:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3A04619DE;
	Wed, 31 Mar 2021 04:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617163847;
	bh=DgGzkHxW4G29a9psNOm9T1yITCtqNJIP99IsxeGV3A0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dk9TW01tlCy9l3+eiw9C/fZ5Gqtszg3k4XG6MBMMlWJS0BMWKGm8NzZDZ8nKxIysf
	 xvFRmE7IMo9KsknriAiJJii2qEH1mIf+gyLCGpDWTYB5oZpyg+qQyyGu3kUGgT/gsO
	 mpnsbMbZwqII3obgeZuPKipl+HtP+XrSzA96PP1q1PKJdaJfLFfvFFUWJ0p6ja6x0W
	 3LJ+dgVOfG90eL9d8soGwp9xnOMH7SWKaxzn3XItlPc5A19/N2yw+lmV/OpeWpTIWI
	 ZXgt9xVMvkdqiHXT7ZPsqwtCBfQdR5mzp7b7hWFr41233S1nVW5xOEN2k06GAdEKCZ
	 pZIR0tVwxIAwA==
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
Subject: [GIT PULL 5/6] i.MX arm64 device tree update for 5.13
Date: Wed, 31 Mar 2021 12:10:18 +0800
Message-Id: <20210331041019.31345-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331041019.31345-1-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.13

for you to fetch changes up to 51c8eaa1b73e39d4f36a2a55ba5c68404b53fa78:

  arm64: dts: fsl-ls1028a-kontron-sl28: add rtc0 alias (2021-03-29 09:55:32 +0800)

----------------------------------------------------------------
i.MX arm64 device tree update for 5.13:

- A series from Dong Aisheng to update i.MX8Q device trees for adopting
  SS (SubSystems) based bindings.
- New board support:  Kontron pitx-imx8m, Engicam i.Core MX8M Mini.
- A series from Adrien Grassein to add various peripheral support for
  imx8mm-nitrogen-r2 board.
- A series from Guido Günther to update librem5-devkit device tree.
- A number of patches from Michael Walle to add Root Complex Event
  Collector interrupt, update MTD partitions and add rtc0 alias for
  ls1028a-kontron-sl28 board.
- Add EQOS MAC support for phyBOARD-Pollux-i.MX8MP.
- Add 2x2 SFP+ cage support for clearfog-itx boards.
- Small and random update for various boards.

----------------------------------------------------------------
Adam Ford (1):
      arm64: dts: imx8mn-beacon: Enable SDR104 on WiFi SDIO interface

Adrien Grassein (9):
      arm64: dts: imx8mm-nitrogen-r2: add wifi/bt chip
      arm64: dts: imx8mm-nitrogen-r2: rework USDHC1
      arm64: dts: imx8mm-nitrogen-r2: add USB support
      arm64: dts: imx8mm-nitrogen-r2: add UARTs
      arm64: dts: imx8mm-nitrogen-r2: rework UART 2
      arm64: dts: imx8mm-nitrogen-r2: add PWMs
      arm64: dts: imx8mm-nitrogen-r2: add FlexSPI
      arm64: dts: imx8mm-nitrogen-r2: add audio
      arm64: dts: imx8mm-nitrogen-r2: add ecspi2 support

Angus Ainslie (1):
      arm64: dts: librem5: protect some partitions of the nor-flash

Dong Aisheng (14):
      arm64: dts: imx8qxp: add fallback compatible string for scu pd
      arm64: dts: imx8qxp: move scu pd node before scu clock node
      arm64: dts: imx8qxp: orginize dts in subsystems
      arm64: dts: imx8: add lsio lpcg clocks
      arm64: dts: imx8: add conn lpcg clocks
      arm64: dts: imx8: add adma lpcg clocks
      arm64: dts: imx8: switch to two cell scu clock binding
      arm64: dts: imx8: switch to new lpcg clock binding
      arm64: dts: imx8qm: add lsio ss support
      arm64: dts: imx8qm: add conn ss support
      arm64: dts: imx8: split adma ss into dma and audio ss
      arm64: dts: imx8qm: add dma ss support
      arm64: dts: imx: add imx8qm common dts file
      arm64: dts: imx: add imx8qm mek support

Fabio Estevam (2):
      arm64: dts: imx8mm-nitrogen-r2: Pass the i2c3 unit name
      arm64: dts: imx8mp-evk: Improve the Ethernet PHY description

Guido Günther (8):
      arm64: dts: imx8mq-librem5-devkit: Drop buck3 startup-ramp-delay
      arm64: dts: librem5: Drop assigned-clocks from SAI2
      arm64: dts: librem5-devkit: Use a less generic codec name
      arm64: dts: librem5-devkit: Add speaker amplifier
      arm64: dts: librem5-devkit: "Drop Line In Jack"
      arm64: dts: librem5-devkit: Add mux for built-in vs headset mic
      arm64: dts: librem5-devkit: Move headphone detection to sound card
      arm64: dts: imx8mq-librem5: Hog the correct gpio

Heiko Thiery (1):
      arm64: dts: fsl: add support for Kontron pitx-imx8m board

Jagan Teki (3):
      arm64: dts: imx8mm: Add Engicam i.Core MX8M Mini SoM
      arm64: dts: imx8mm: Add Engicam i.Core MX8M Mini C.TOUCH 2.0
      arm64: dts: imx8mm: Add Engicam i.Core MX8M Mini EDIMM2.2 Starter Kit

Kuldeep Singh (2):
      arm64: dts: imx8mm: Reorder flexspi clock-names entry
      arm64: dts: imx8mn: Reorder flexspi clock-names entry

Marek Vasut (2):
      arm64: dts: imx8mp: add eqos node and alias
      arm64: dts: freescale: Add support EQOS MAC on phyBOARD-Pollux-i.MX8MP

Martin Kepplinger (1):
      arm64: dts: imx8mq-librem5-r2: set nearlevel to 120

Michael Walle (5):
      arm64: dts: ls1028a: add interrupt to Root Complex Event Collector
      arm64: dts: fsl-ls1028a-kontron-sl28: move MTD partitions
      arm64: dts: fsl-ls1028a-kontron-sl28: combine unused partitions
      arm64: dts: ls1028a: move rtc alias to individual boards
      arm64: dts: fsl-ls1028a-kontron-sl28: add rtc0 alias

Peng Fan (2):
      arm64: dts: imx8qxp: correct usdhc clock-names sequence
      arm64: dts: imx8mp: add wdog2/3 nodes

Russell King (1):
      arm64: dts: lx2160a-clearfog-itx: add SFP support

Sebastian Krzyszkowiak (1):
      arm64: dts: imx8mq-librem5-r3: Mark buck3 as always on

Teresa Remmet (1):
      arm64: dts: imx8mp-phyboard-pollux-rdk: Change debug UART

Vladimir Oltean (1):
      arm64: dts: ls1028a: set up the real link speed for ENETC port 2

 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts     |  80 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  12 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |  24 +
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |  64 +++
 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi    |   8 +
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |  68 +++
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    | 184 +++++++
 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi     |  18 +
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     | 202 +++++++
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi    | 311 +++++++++++
 .../dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts   |  97 ++++
 .../dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts  |  97 ++++
 .../boot/dts/freescale/imx8mm-icore-mx8mm.dtsi     | 232 ++++++++
 .../boot/dts/freescale/imx8mm-nitrogen-r2.dts      | 314 ++++++++++-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   2 +-
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |   6 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   2 +
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |  56 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  39 ++
 .../dts/freescale/imx8mq-kontron-pitx-imx8m.dts    | 613 +++++++++++++++++++++
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |  70 ++-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r2.dts |   2 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |   4 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |  24 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 144 +++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  |  21 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |  51 ++
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi  |  61 ++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          | 176 ++++++
 arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts    |  20 +-
 .../dts/freescale/imx8qxp-colibri-eval-v3.dtsi     |   8 +-
 arch/arm64/boot/dts/freescale/imx8qxp-colibri.dtsi |  12 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  50 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi |  37 ++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi |  25 +
 arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi |  61 ++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         | 423 +-------------
 41 files changed, 3102 insertions(+), 524 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-mek.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi
