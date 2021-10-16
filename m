Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99B5C433F5
	for <soc@archiver.kernel.org>; Sat, 16 Oct 2021 14:02:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BA30F61244; Sat, 16 Oct 2021 14:02:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 134FA61212;
	Sat, 16 Oct 2021 14:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634392939;
	bh=J6Egu8iKzm0l6OmLd6MKkBuibN7S/2beuAcLWYh36tg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t/+jLSVGNvZt2GRmZ8rGJ69326aYhiaoPypiDS+7jTe1BlPt3B6PREQpQSCHysFwH
	 MqdioKchG8u+eigTdJ6kvLuAMfpe9h7pLEcoCLlbfz6UG9UI0R212/eC/T1tzGb3xa
	 +qw0mdvg21ONnCu/KbHsBp0/c+AYsloOrjREhr1rvapj0N1Cb4W970qIHNTsKz/WSz
	 TjA+nhTn6fGuFT8dsNrtiWODSwltgSjTXiCKn3pMoAlWA/4YY356C3EOn9aUHWds5i
	 e9VjMKlcEKpPlbCLre1UdDH88tQoDsFZLiaRqwZZoixnFOS71+b1mMnNqxGnY6HMc7
	 VVmkiu1tppwWA==
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
Subject: [GIT PULL 4/6] i.MX arm64 device tree changes for 5.16
Date: Sat, 16 Oct 2021 22:01:36 +0800
Message-Id: <20211016140138.1603-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016140138.1603-1-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.16

for you to fetch changes up to ec1e91d400bf21def54c441552bdf2976ce36e3b:

  arm64: dts: imx8mm-kontron: Add support for ultra high speed modes on SD card (2021-10-16 15:28:27 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 5.16:

- New board support: LX2160A based BlueBox3, S32G2 EVB and RDB2 boards.
- Quite some updates on imx8mq-librem5 board: delay the startup of the
  SDIO, add power sequencing for M.2 cards, add wifi regulator, add
  panel reset GPIO, fix led_r and led_g pinctrl, etc.
- Fix the SPI chipselect polarity for a couple of i.MX8MM boards.
- Add GPU nodes for i.MX8MM 2D and 3D core.
- Add VPU and DISP blk-ctrl devices for i.MX8MM.
- A series from Michael Walle to LS1028A device trees and add GPU
  support.
- Random and small updates on various boards.

----------------------------------------------------------------
Angus Ainslie (3):
      arm64: dts: imx8mq-librem5: delay the startup of the SDIO
      arm64: dts: imx8mq-librem5: add power sequencing for M.2 cards
      arm64: dts: imx8mq-librem5: Limit the max sdio frequency

Chester Lin (4):
      arm64: dts: add NXP S32G2 support
      arm64: dts: s32g2: add serial/uart support
      arm64: dts: s32g2: add VNP-EVB and VNP-RDB2 support
      arm64: dts: s32g2: add memory nodes for evb and rdb2

Fabio Estevam (2):
      arm64: dts: imx8mm-kontron-n801x-som: Fix the SPI chipselect polarity
      arm64: dts: imx8mm-venice: Fix the SPI chipselect polarity

Frieder Schrempf (3):
      arm64: dts: imx8mm: Add GPU nodes for 2D and 3D core
      arm64: dts: imx8mm-kontron: Fix reset delays for ethernet PHY
      arm64: dts: imx8mm-kontron: Add support for ultra high speed modes on SD card

Guido Günther (1):
      arm64: dts: imx8mq-librem5: wire up the wifi regulator

Krzysztof Kozlowski (1):
      arm64: dts: freescale: imx8mq-librem5: align operating-points table name with dtschema

Kuldeep Singh (2):
      arm64: dts: imx8mp: Reorder flexspi clock-names entry
      arm64: dts: ls1012a: Add serial alias for ls1012a-rdb

Lucas Stach (6):
      arm64: dts: imx8mq-reform2: add uSDHC2 CD pinctrl
      arm64: dts: zii-ultra: add PCIe PHY supply
      arm64: dts: imx8mm: add GPC node
      arm64: dts: imx8mm: put USB controllers into power-domains
      arm64: dts: imx8mm: add VPU blk-ctrl
      arm64: dts: imx8mm: add DISP blk-ctrl

Martin Kepplinger (1):
      arm64: dts: imx8mq-librem5: add reset gpio to mantix panel description

Michael Walle (7):
      arm64: dts: freescale: fix arm,sp805 compatible string
      arm64: dts: ls1028a: move pixel clock pll into /soc
      arm64: dts: ls1028a: move Mali DP500 node into /soc
      arm64: dts: ls1028a: add Vivante GPU node
      arm64: dts: ls1028a: disable usb controller by default
      arm64: dts: ls1028a: move PHY nodes to MDIO controller
      arm64: dts: ls1028a: use phy-mode instead of phy-connection-type

Richard Zhu (1):
      arm64: dts: imx8mq: fix the schema check errors

Rob Herring (1):
      arm64: dts: freescale: Fix 'interrupt-map' parent address cells

Sebastian Krzyszkowiak (2):
      arm64: dts: imx8mq-librem5: Fix led_r and led_g pinctrl assignments
      arm64: dts: imx8mq-librem5: set debounce interval of volume buttons to 50ms

Tim Harvey (1):
      arm64: dts: imx8mm-venice-gw7901.dts: disable pgc_gpumix

Vladimir Oltean (1):
      arm64: dts: ls1028a: mark internal links between Felix and ENETC as capable of flow control

Wasim Khan (1):
      arm64: dts: add device tree for the LX2160A on the NXP BlueBox3 board

 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts  |   1 +
 .../freescale/fsl-ls1028a-kontron-sl28-var1.dts    |  60 +-
 .../freescale/fsl-ls1028a-kontron-sl28-var2.dts    |  17 +-
 .../freescale/fsl-ls1028a-kontron-sl28-var4.dts    |  49 +-
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts     |  31 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |  10 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |  19 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  72 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |  40 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |  40 +-
 .../dts/freescale/fsl-lx2160a-bluebox3-rev-a.dts   |  34 ++
 .../boot/dts/freescale/fsl-lx2160a-bluebox3.dts    | 658 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  24 +-
 .../boot/dts/freescale/imx8mm-kontron-n801x-s.dts  |  32 +-
 .../dts/freescale/imx8mm-kontron-n801x-som.dtsi    |   4 +-
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |   2 +-
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |   2 +-
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   |   2 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |  24 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          | 180 ++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |  46 +-
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      |   1 +
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |   2 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  10 +-
 arch/arm64/boot/dts/freescale/s32g2.dtsi           | 124 ++++
 arch/arm64/boot/dts/freescale/s32g274a-evb.dts     |  34 ++
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts    |  40 ++
 29 files changed, 1374 insertions(+), 190 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dts
 create mode 100644 arch/arm64/boot/dts/freescale/s32g2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32g274a-evb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
