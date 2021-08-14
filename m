Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65212C4338F
	for <soc@archiver.kernel.org>; Sat, 14 Aug 2021 13:39:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3222161038; Sat, 14 Aug 2021 13:39:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 599BA60FC1;
	Sat, 14 Aug 2021 13:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628948355;
	bh=Uz+k76+ZiIdevKZSx9MzATnh91HYkonud3g76O28pQc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R5kuGfKHSkM80pG4kBxeVDgU+tDVHOw8jJaDWMA8FIpq6EjbuCXRrUcfQG8+OpQqI
	 R8iP4p1yNsflW0ayBOcMLUeclv/dV8jLV7vq0QIN8xtWIJrQsVICoEW3VxOHZYivGa
	 Znh8ySCwS542ucyRUby+VS1Nw7YaTRthOIMDv25zl0qhxOPWlb78GIkIo5WZTCHSD0
	 3n+I1tDcHbNUtEGtCVoyIM4rzc+UQyJg8c7J9GRVruTM5YjJcpGuEFbysClK3J5Gfs
	 544CiJKKbyC4OAj44I6+d5s/Elb3pGUBUDwJCBFZVFqPHf87IMrcdrw3P/Zv4FNd/a
	 Kl+2IOys7SjNA==
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
Subject: [GIT PULL 3/4] i.MX arm64 device tree changes for 5.15
Date: Sat, 14 Aug 2021 21:38:52 +0800
Message-Id: <20210814133853.9981-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210814133853.9981-1-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.15

for you to fetch changes up to 418962eea35869b8e07766d8728ae660d75800a9:

  arm64: dts: add device tree for Traverse Ten64 (LS1088A) (2021-08-14 13:51:28 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 5.15:

- New board support: Nitrogen8 SoM and MNT Reform2, LS1088A based
  Traverse Ten64, i.MX8M based GW7902.
- A series from Ioana Ciornei to update PHY IRQ configuration for
  LayerScape SoCs.
- A series from Tim Harvey to update Gateworks imx8mm-venice devices.
- Replace deprecated `fsl,usbphy` property with phys phandle.
- Add MIPI CSI phy and bridge descriptions for i.MX8MQ SoC.
- Add JPEG encoder/decoder device nodes for i.MX8M SoCs.
- Update PMU compatible and drop interrupt-affinity for i.MX8M SoCs.
- Add Cadence HIFI4 DSP for i.MX8 MPlus SoC.
- A few small and random updates on various boards.

----------------------------------------------------------------
Daniel Baluta (1):
      arm64: dts: imx8mp: Add dsp node

Fabio Estevam (1):
      arm64: dts: imx8mm-venice-gw7901: Remove unnecessary #address-cells/#size-cells

Ioana Ciornei (3):
      arm64: dts: lx2160ardb: update PHY nodes with IRQ information
      arm64: dts: ls2088ardb: update PHY nodes with IRQ information
      arm64: dts: ls1088ardb: update PHY nodes with IRQ information

Kwon Tae-young (3):
      arm64: dts: imx8qxp-ai_ml: Fix checkpatch warnings
      arm64: dts: imx8mq-evk: add CD pinctrl for usdhc2
      arm64: dts: imx8mq-evk: Remove unnecessary blank lines

Lucas Stach (3):
      arm64: dts: imx8mq: add Nitrogen8 SoM
      arm64: dts: imx8mq: add support for MNT Reform2
      arm64: dts: imx8mq-reform2: add sound support

Marek Vasut (1):
      arm64: dts: imx8m: Replace deprecated fsl,usbphy DT props with phys

Martin Kepplinger (1):
      arm64: dts: imx8mq: add mipi csi phy and csi bridge descriptions

Mathew McBride (3):
      arm64: dts: ls1088a: add internal PCS for DPMAC1 node
      arm64: dts: ls1088a: add missing PMU node
      arm64: dts: add device tree for Traverse Ten64 (LS1088A)

Mirela Rabulea (1):
      arm64: dts: imx8: Add jpeg encoder/decoder nodes

Peng Fan (3):
      arm64: dts: imx8mm: update pmu compatible
      arm64: dts: imx8qxp: update pmu compatible
      arm64: dts: imx8m: drop interrupt-affinity for pmu

Raag Jadav (1):
      arm64: dts: ls1046a: fix eeprom entries

Tim Harvey (6):
      arm64: dts: imx: Add i.mx8mm/imx8mn Gateworks gw7902 dts support
      arm64: dts: imx8mm-venice-gw700x: fix mp5416 pmic config
      arm64: dts: imx8mm-venice-gw700x: fix invalid pmic pin config
      arm64: dts: imx8mm-venice-gw71xx: fix USB OTG VBUS
      arm64: dts: imx8mm-venice-gw7901: add support for USB hub subload
      arm64: dts: imx8mm-venice-gw7901: enable pull-down on gpio outputs

 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts |   8 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  |   7 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts  |   9 +
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 389 +++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |  18 +
 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts  |   4 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |   4 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  80 ++
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   |  64 +-
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |   5 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |  15 +-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    | 911 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   9 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    | 884 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   4 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  31 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |  14 +-
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      | 213 +++++
 .../boot/dts/freescale/imx8mq-nitrogen-som.dtsi    | 275 +++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          | 105 ++-
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  12 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   2 +
 arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts    |   2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  13 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   4 +-
 26 files changed, 3021 insertions(+), 65 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-nitrogen-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
