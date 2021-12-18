Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D89C433F5
	for <soc@archiver.kernel.org>; Sat, 18 Dec 2021 07:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ACF4CC36AE8; Sat, 18 Dec 2021 07:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A41C36AEA;
	Sat, 18 Dec 2021 07:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639811707;
	bh=HdXIzNNAvmnI5jLw9yjXGt//usUKuuwskjuht3FsXbI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W11DOHSmxf0gwA/MVEGmKntDyzEz5ZYibLM8jR9YN14EHdB2wBXMWwhcCVAcrhOe1
	 /MUgV7H9RXbIkJX8RKPw5oA76HsP2UuQDM7X6bPPEkKBQr1nm2uhN1q3q0qmHAQqQr
	 lmK1ig+GEuFfG0SHCK8aZ/WDzrTPPTofgorPUTrCfvgdiPQNARmIM+kIEqY2m17UFK
	 rvxvyU8ZYgc+KnETVieJzty9MWqfidiYAO8AVWDJfUiFPo2kQ1P0pLlL/J0+zH0ZEE
	 L3cnUfJW57CkALnTlC4EQbIpy4AVla/XOiRCUonNf4eV5rnUfFrUmZqAEyXfYjuaX7
	 m7ynXjUZMcsPw==
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
Subject: [GIT PULL 4/6] i.MX arm device tree change for 5.17
Date: Sat, 18 Dec 2021 15:14:25 +0800
Message-Id: <20211218071427.26745-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211218071427.26745-1-shawnguo@kernel.org>
References: <20211218071427.26745-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.17

for you to fetch changes up to 3951cc6bae4cd252a2efec5bad5d30265d525e0f:

  ARM: dts: imx6: phytec: Add PEB-WLBT-05 support (2021-12-17 10:43:55 +0800)

----------------------------------------------------------------
i.MX arm device tree change for 5.17:

- New board support: TQ-Systems MBa6x, Y Soft IOTA Crux/Crux+ board,
  JOZ Access Point, Phytec PEB-WLBT-05 support, BSH SMM-M2 IMX6ULZ
  SystemMaster.
- Update SPBA bus node name to match binding schema.
- A series from Christoph Niedermaier to update imx6qdl-dhcom board
  around Ethernet and USB support.
- A series from Giulio Benetti to clean up undocumented/unused fixed
  clock compatibles.
- A series from Laurent Pinchart to update i.MX7 MIPI_CSI support.
- A couple of changes from Russell to update phy-mode for
  vf610-zii-dev-rev-b board.
- Add Wacom digitizer support for imx7d-remarkable2 device.

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: imx: Change spba to spba-bus

Alistair Francis (1):
      ARM: dts: imx7d-remarkable2: add wacom digitizer device

Christoph Niedermaier (3):
      ARM: dts: imx6qdl-dhcom: Align PHY reset timing with other DHCOM SoMs
      ARM: dts: imx6qdl-dhcom: Identify the PHY by ethernet-phy-id0007.c0f0
      ARM: dts: imx6qdl-dhcom: Add USB overcurrent pin on SoM layer

Giulio Benetti (17):
      ARM: dts: imx1: drop "fsl,imx-clk32"
      ARM: dts: imx25: drop "fsl,imx-osc"
      ARM: dts: imx50: drop "fsl,imx-osc"
      ARM: dts: imx50: drop "fsl,imx-ckil"
      ARM: dts: imx50: drop "fsl,imx-ckih1"
      ARM: dts: imx50: drop "fsl,imx-ckih2"
      ARM: dts: imx51: drop "fsl,imx-osc"
      ARM: dts: imx51: drop "fsl,imx-ckil"
      ARM: dts: imx51: drop "fsl,imx-ckih1"
      ARM: dts: imx51: drop "fsl,imx-ckih2"
      ARM: dts: imx53: drop "fsl,imx-osc"
      ARM: dts: imx53: drop "fsl,imx-ckil"
      ARM: dts: imx53: drop "fsl,imx-ckih1"
      ARM: dts: imx53: drop "fsl,imx-ckih2"
      ARM: dts: imx6qdl: drop "fsl,imx-osc"
      ARM: dts: imx6qdl: drop "fsl,imx-ckil"
      ARM: dts: imx6qdl: drop "fsl,imx-ckih1"

Jason Wang (1):
      ARM: dts: imx: Fix typo in pinfunc comments

Laurent Pinchart (3):
      ARM: dts: imx7s-warp: Drop undefined property in mipi_csi node
      ARM: dts: imx7: Drop reset-names property for mipi_csi node
      ARM: dts: imx7: Group mipi_csi 'port' children in a 'ports' node

Markus Niebel (1):
      ARM: dts: imx6qdl: add TQ-Systems MBa6x device trees

Matthias Schiffer (1):
      ARM: dts: imx6qdl-tqma6: add ERR006687 hardware workaround for "a" variant

Michael Trimarchi (1):
      ARM: dts: imx6ulz-bsh-smm-m2: Add BSH SMM-M2 IMX6ULZ SystemMaster

Michal Vokáč (1):
      ARM: dts: imx6dl-yapp4: Add Y Soft IOTA Crux/Crux+ board

Oleksij Rempel (1):
      ARM: dts: add JOZ Access Point

Russell King (Oracle) (2):
      ARM: dts: vf610-zii-dev-rev-b: correct phy-mode for 6185 dsa link
      ARM: dts: vf610-zii-dev-rev-b: specify phy-mode for external PHYs

Yunus Bas (3):
      ARM: dts: imx6qdl: phytec: Add support for optional PEB-EVAL-01 board
      ARM: dts: imx6qdl: phytec: Add support for optional PEB-AV-02 LCD adapter
      ARM: dts: imx6: phytec: Add PEB-WLBT-05 support

 arch/arm/boot/dts/Makefile                         |  11 +-
 arch/arm/boot/dts/imx1-pinfunc.h                   |   6 +-
 arch/arm/boot/dts/imx1.dtsi                        |   2 +-
 arch/arm/boot/dts/imx25.dtsi                       |   4 +-
 arch/arm/boot/dts/imx27-pinfunc.h                  |   6 +-
 arch/arm/boot/dts/imx31.dtsi                       |   2 +-
 arch/arm/boot/dts/imx50.dtsi                       |  10 +-
 arch/arm/boot/dts/imx51.dtsi                       |  10 +-
 arch/arm/boot/dts/imx53.dtsi                       |  10 +-
 arch/arm/boot/dts/imx6dl-mba6.dtsi                 |  22 +
 arch/arm/boot/dts/imx6dl-mba6a.dts                 |  21 +
 arch/arm/boot/dts/imx6dl-mba6b.dts                 |  21 +
 arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dts  |   3 +
 arch/arm/boot/dts/imx6q-mba6.dtsi                  |  44 ++
 arch/arm/boot/dts/imx6q-mba6a.dts                  |  20 +
 arch/arm/boot/dts/imx6q-mba6b.dts                  |  20 +
 arch/arm/boot/dts/imx6q-phytec-mira-rdk-emmc.dts   |   3 +
 arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dts   |   3 +
 arch/arm/boot/dts/imx6q-yapp4-crux.dts             |  54 +++
 arch/arm/boot/dts/imx6qdl-dhcom-drc02.dtsi         |   4 +
 arch/arm/boot/dts/imx6qdl-dhcom-pdk2.dtsi          |   4 +
 arch/arm/boot/dts/imx6qdl-dhcom-som.dtsi           |   8 +-
 arch/arm/boot/dts/imx6qdl-mba6.dtsi                | 526 +++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-mba6a.dtsi               |  36 ++
 arch/arm/boot/dts/imx6qdl-mba6b.dtsi               |  52 ++
 .../boot/dts/imx6qdl-phytec-mira-peb-av-02.dtsi    | 119 +++++
 .../boot/dts/imx6qdl-phytec-mira-peb-eval-01.dtsi  |  71 +++
 .../boot/dts/imx6qdl-phytec-mira-peb-wlbt-05.dtsi  |  85 ++++
 arch/arm/boot/dts/imx6qdl-tqma6a.dtsi              |  20 +
 arch/arm/boot/dts/imx6qdl.dtsi                     |   8 +-
 arch/arm/boot/dts/imx6qp-mba6b.dts                 |  18 +
 arch/arm/boot/dts/imx6qp-phytec-mira-rdk-nand.dts  |   3 +
 arch/arm/boot/dts/imx6qp-yapp4-crux-plus.dts       |  54 +++
 .../boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts   |   1 +
 .../boot/dts/imx6ul-phytec-segin-peb-wlbt-05.dtsi  |  90 ++++
 arch/arm/boot/dts/imx6ull-jozacp.dts               | 456 ++++++++++++++++++
 .../boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dts  |   1 +
 .../boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dts  |   1 +
 .../boot/dts/imx6ull-phytec-segin-peb-wlbt-05.dtsi |  19 +
 arch/arm/boot/dts/imx6ulz-bsh-smm-m2.dts           | 146 ++++++
 arch/arm/boot/dts/imx7d-remarkable2.dts            |  59 +++
 arch/arm/boot/dts/imx7s-warp.dts                   |  14 +-
 arch/arm/boot/dts/imx7s.dtsi                       |  22 +-
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts          |   6 +-
 44 files changed, 2043 insertions(+), 52 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-mba6.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-mba6a.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-mba6b.dts
 create mode 100644 arch/arm/boot/dts/imx6q-mba6.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-mba6a.dts
 create mode 100644 arch/arm/boot/dts/imx6q-mba6b.dts
 create mode 100644 arch/arm/boot/dts/imx6q-yapp4-crux.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-mba6.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-mba6a.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-mba6b.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-phytec-mira-peb-av-02.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-phytec-mira-peb-eval-01.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-phytec-mira-peb-wlbt-05.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qp-mba6b.dts
 create mode 100644 arch/arm/boot/dts/imx6qp-yapp4-crux-plus.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-phytec-segin-peb-wlbt-05.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-jozacp.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-peb-wlbt-05.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ulz-bsh-smm-m2.dts
