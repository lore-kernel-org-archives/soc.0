Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B361C38147
	for <soc@archiver.kernel.org>; Sat, 16 Dec 2023 06:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D607C433C7; Sat, 16 Dec 2023 06:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A909C433C8;
	Sat, 16 Dec 2023 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702709191;
	bh=rLi2WB5XQf9RngenekfLY54ux3QLMfiZDfyRhjJ8KCg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qDFB63Q7v+p5dkRB6A3IYpqWon657GGgTmdiZwAR4GHB+dZDIhP2s4yMilCchrOSS
	 uV2IPVdLZQQRszO13NRiXl8vE6AAeiUL/7aXAFVR0c0RBUhDeKwa59lbbmkQbfpBBq
	 Up6lI+DDh0/GgNKnu2t8UMQFPddJ2/lqfg8hdoXtzI/vmzokeUrQd2y1pT9Vi8hswM
	 5Hby7AVBfOsY7jEB/f641/lJd90zEzrpCFMu2HfuCehcbtNCYsSf9m9PDVhUMgyvAp
	 zXpY4xe1Mdhj9pxEs0Wjb49bYuo2O2yYm/RRX/ruLXcamzTOXogglZat+lia/QzaMY
	 jX8mZty+NkVRQ==
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
Subject: [GIT PULL 4/5] i.MX ARM device tree for 6.8
Date: Sat, 16 Dec 2023 14:46:04 +0800
Message-Id: <20231216064605.876196-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231216064605.876196-1-shawnguo@kernel.org>
References: <20231216064605.876196-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.8

for you to fetch changes up to 47360e40dcb92c09f417ccbe956e646bd95a09b6:

  ARM: dts: imx27-phytec-phycore-som: Use 'rtc' as node name (2023-12-16 09:46:40 +0800)

----------------------------------------------------------------
i.MX ARM device tree for 6.8:

- A bunch of changes from Fabio Estevam cleaning up dt-schema warnings.
- A number of i.MX7 related small fixes and peripheral addition from
  Alexander Stein.
- A set of changes from Hiago De Franco adding usdhc aliases for Apalis
  and Colibri boards.
- A white-space cleanup from Krzysztof Kozlowski.
- A change from Linus Walleij to correct errors in the Marvell MV88E6xxx
  switch descriptions.
- Fix a couple of typo in comment for MBA6 and MBA6ULX board.
- Add on-chip memory and enable MIPI-DSI support for i.MX7.
- Add LM75A sensor for TQMA7 board.

----------------------------------------------------------------
Alexander Stein (5):
      ARM: dts: imx7d: Fix coresight funnel ports
      ARM: dts: imx7s: Fix lcdif compatible
      ARM: dts: imx7s: Fix nand-controller #size-cells
      ARM: dts: imx7s: Add missing #thermal-sensor-cells
      ARM: dts: imx7s: Add DMA channels for CSPI peripherals

Andrejs Cainikovs (1):
      ARM: dts: imx6q-apalis: add can power-up delay on ixora board

Fabio Estevam (24):
      ARM: dts: imx28-tx28: Pass #sound-dai-cells
      ARM: dts: imx23/28: Remove unneeded "fsl,mxs-gpio"
      ARM: dts: imx28-lwe: Pass device_type to the memory node
      ARM: dts: imx23/28: Remove undocumented "fsl,clkctrl"
      ARM: dts: imx25: Pass I2C clock-names property
      ARM: dts: imx25-pdk: Pass #sound-dai-cells
      ARM: dts: imx25/27-eukrea: Fix RTC node name
      ARM: dts: imx: Use flash@0,0 pattern
      ARM: dts: imx27: Fix sram node
      ARM: dts: imx1: Fix sram node
      ARM: dts: imx27-phytec-phycore-som: Use the mux- prefix
      ARM: dts: imx27: Use 'bus' for AIPI bus
      ARM: dts: imx27: Use 'bus' for EMI bus
      ARM: dts: imx27-pdk: Move usbphy0 out of simple-bus
      ARM: dts: imx27-phytec-phycore-rdk: Move usbphy nodes out of simple-bus
      ARM: dts: imx1: Use 'bus' for AIPI bus
      ARM: dts: imx25: Move usbphy nodes out of simple-bus
      ARM: dts: imx25: Fix the iim compatible string
      ARM: dts: imx25/27: Pass timing0
      ARM: dts: imx27-apf27dev: Fix LED name
      ARM: dts: imx23-sansa: Use preferred i2c-gpios properties
      ARM: dts: imx23/28: Fix the DMA controller node name
      ARM: dts: imx25: Remove unneeded keypad properties
      ARM: dts: imx27-phytec-phycore-som: Use 'rtc' as node name

Hiago De Franco (3):
      ARM: dts: imx6qdl-apalis: Add usdhc aliases
      ARM: dts: imx6qdl-colibri: Add usdhc aliases
      ARM: dts: imx7d-colibri-emmc: Add usdhc aliases

João Rodrigues (1):
      ARM: dts: imx: tqma7: add lm75a sensor (rev. 01xxx)

Krzysztof Kozlowski (1):
      ARM: dts: nxp: minor whitespace cleanup around '='

Lech Perczak (1):
      ARM: dts: nxp: imx7d-pico: add cpu-supply nodes

Linus Walleij (1):
      ARM: dts: nxp: Fix some common switch mistakes

Marco Felsch (1):
      ARM: dts: imx7: add MIPI-DSI support

Markus Niebel (2):
      ARM: dts: imx6qdl: mba6: fix typo in comments
      ARM: dts: imx6ul: mba6ulx: fix typo in comments

Philipp Zabel (1):
      ARM: dts: imx7s: Add on-chip memory

 arch/arm/boot/dts/nxp/imx/imx1-ads.dts             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts         |  2 +-
 arch/arm/boot/dts/nxp/imx/imx1.dtsi                |  9 ++-
 .../boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi    |  2 +-
 .../imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts  |  2 +-
 .../imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dts  |  2 +-
 .../imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts            |  3 +-
 arch/arm/boot/dts/nxp/imx/imx25.dtsi               | 41 +++++-------
 arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts       |  4 +-
 .../boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi    |  4 +-
 .../nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx27-pdk.dts            | 18 ++----
 .../dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts     |  2 +-
 .../boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts  | 17 ++---
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi | 28 ++++----
 arch/arm/boot/dts/nxp/imx/imx27.dtsi               |  7 +-
 arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts         |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b105pv2.dts       |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b105v2.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts       |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts        |  2 +-
 .../boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts   |  2 +
 .../boot/dts/nxp/imx/imx6q-var-mx6customboard.dts  |  4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      |  9 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |  7 ++
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi        |  6 +-
 .../boot/dts/nxp/imx/imx6qdl-skov-cpu-revc.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |  8 +--
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          |  9 ++-
 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc.dtsi  |  4 ++
 arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts      |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi          |  8 +++
 arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d.dtsi               |  3 -
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               | 74 +++++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi              |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts          | 12 ++--
 arch/arm/boot/dts/nxp/mxs/imx23.dtsi               | 10 +--
 arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi           |  1 +
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts           |  1 +
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi               | 14 ++--
 arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/vf/vf610-bk4.dts             |  4 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts        | 14 ++--
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dts   |  6 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts    | 70 ++++++++++----------
 arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dts        | 18 +++---
 arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dts    | 20 +++---
 arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dts   | 18 +++---
 56 files changed, 289 insertions(+), 212 deletions(-)
