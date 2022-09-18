Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44377C54EE9
	for <soc@archiver.kernel.org>; Sun, 18 Sep 2022 09:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9D20C43141; Sun, 18 Sep 2022 09:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94A2C433C1;
	Sun, 18 Sep 2022 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663493311;
	bh=yslJbxb8Vum7JAX4OpwVlSomKX2Cl2U156Ri7rCL2JI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=jbIPBqO9x1TKV/Yg2YtV90fuxmr/AliNgsGetSxWKCG6L5fIwYtcaAnzk1oKU49QI
	 LrK9cm0YUvUzKQX45GuV9tV7EXKPj2zRTfVN5BISdzLnP1YIttAfWrB76r/EquFTqa
	 t0hfLhUlu7bk/XaPUE0ylO/Y3/tKqdoF6J1funi+jt5/BSBPHy9T09TEOidB+FxYPm
	 cGE2/2G+qFYlSygT78GjyM1br3bLc5XNQ5ALzXN6HMdkYyTJSJQc852bYHHHxFuhVh
	 i6AZH1HMX/AydyDDC1jXVv9nWXMXCHBdoJ4nkIVKRGKvRUJfwBkWj5RmEi3zQB2h4k
	 NovmU6LzrQi6w==
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
Subject: [GIT PULL 1/4] i.MX DT bindings update for 6.1
Date: Sun, 18 Sep 2022 17:28:03 +0800
Message-Id: <20220918092806.2152700-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.1

for you to fetch changes up to 64e61a940d96184d294f431848a28765f44525fa:

  dt-bindings: arm: imx: update fsl.yaml for imx8dxl (2022-09-17 16:25:50 +0800)

----------------------------------------------------------------
i.MX DT bindings for 6.1:

- Add compatible for new boards: Kontron BL i.MX8MM OSM-S, MSC
  SM2S-IMX8PLUS SoM and SM2-MB-EP1 Carrier, i.MX8M Mini Gateworks
  GW7904 board, i.MX8DXL EVK Board.
- Add add interconnect property for i.MX8MP various blk-ctrl devices.
- Add i.MX8MP HDMI HDCP and HRV power domain DT IDs.
- Add bindings for i.MX93 SRC and MEDIAMIX blk-ctrl.
- A minor style fix on i.MX8MM clock binding header.

----------------------------------------------------------------
Frieder Schrempf (3):
      dt-bindings: arm: fsl: imx6ul-kontron: Update bindings
      dt-bindings: arm: fsl: Rename compatibles for Kontron i.MX8MM SoM/board
      dt-bindings: arm: fsl: Add Kontron BL i.MX8MM OSM-S board

Marcel Ziswiler (1):
      dt-bindings: clk: imx8mm: don't use multiple blank lines

Martyn Welch (1):
      dt-bindings: arm: fsl: Add MSC SM2S-IMX8PLUS SoM and SM2-MB-EP1 Carrier

Peng Fan (10):
      dt-bindings: soc: imx: add interconnect property for i.MX8MP media blk ctrl
      dt-bindings: soc: imx: add interconnect property for i.MX8MP hdmi blk ctrl
      dt-bindings: soc: imx: add interconnect property for i.MX8MP hsio blk ctrl
      dt-bindings: power: imx8mp-power: add HDMI HDCP/HRV
      dt-bindings: soc: imx: drop minItems for i.MX8MM vpu blk ctrl
      dt-bindings: soc: imx: add interconnect property for i.MX8MM vpu blk ctrl
      dt-bindings: soc: imx: add i.MX8MP vpu blk ctrl
      dt-bindings: mfd: syscon: Add i.MX93 blk ctrl system registers
      dt-bindings: soc: add i.MX93 SRC
      dt-bindings: soc: add i.MX93 mediamix blk ctrl

Shenwei Wang (2):
      dt-bindings: firmware: add missing resource IDs for imx8dxl
      dt-bindings: arm: imx: update fsl.yaml for imx8dxl

Tim Harvey (1):
      dt-bindings: arm: Add i.MX8M Mini Gateworks GW7904 board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  58 ++++++-----
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   2 +
 .../bindings/soc/imx/fsl,imx8mm-vpu-blk-ctrl.yaml  | 110 ++++++++++++++++++---
 .../bindings/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml |   9 ++
 .../bindings/soc/imx/fsl,imx8mp-hsio-blk-ctrl.yaml |  10 ++
 .../soc/imx/fsl,imx8mp-media-blk-ctrl.yaml         |  14 +++
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |  80 +++++++++++++++
 .../devicetree/bindings/soc/imx/fsl,imx93-src.yaml |  96 ++++++++++++++++++
 include/dt-bindings/clock/imx8mm-clock.h           |   1 -
 include/dt-bindings/firmware/imx/rsrc.h            |   7 ++
 include/dt-bindings/power/fsl,imx93-power.h        |  15 +++
 include/dt-bindings/power/imx8mp-power.h           |   6 ++
 12 files changed, 374 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx93-src.yaml
 create mode 100644 include/dt-bindings/power/fsl,imx93-power.h
