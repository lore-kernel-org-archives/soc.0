Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833F6C433F5
	for <soc@archiver.kernel.org>; Tue, 22 Feb 2022 07:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72106C340EB; Tue, 22 Feb 2022 07:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66879C340F1;
	Tue, 22 Feb 2022 07:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645516377;
	bh=8RfF7EN2uwmRqOMXPoPOpOmEUT1/fsPUpdDCcGtKkvE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kils32/jKIdnOFWYfb4V41/8Okinj5T5SSjplVmjYjjypsXAxPudVZfYjJemSlNWO
	 +NzSfPfZ622r5XzOTD+xckbOWrHi/PEAsxyvHB7RxYLR9Tm7vFse5qCS2kGeq8jYme
	 w9UFdBaN3CrkN/hVqYA5NlRZ1NlvxtEZPvdgV8pTS+Jz4YBj1b3jnt931fS1h2/YTr
	 +uR8OnQyiYO+/q9eaCNDO/Oxwn9/TyUxVS3VYjyZoh4Zwf49xE7js2wgqIFq6TTKI9
	 6jgxgZwLpD3VSxm+aKzXd5HYd3rS6zHNeD6fTSEBXfUMv+xQRt9xB1WhmGBStLLHQ9
	 mdnVSuj3DPEtQ==
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
Subject: [GIT PULL 5/6] i.MX arm64 device tree change for 5.18
Date: Tue, 22 Feb 2022 15:52:25 +0800
Message-Id: <20220222075226.160187-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222075226.160187-1-shawnguo@kernel.org>
References: <20220222075226.160187-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Commit 7a7b1414ea9a ("dt-bindings: power: imx8mq: add defines for VPU
blk-ctrl domains") on imx/bindings branch is merged here to resolve
the dependency on VPU blk-ctrl domain defines.

Please consider to pull, thanks!

Shawn


The following changes since commit 7a7b1414ea9a3641672be768afe16f583f0b76e7:

  dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains (2022-02-11 10:49:26 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.18

for you to fetch changes up to 59f5ae05c18a2f4a3f0494ec814155bb44a08dd7:

  arm64: dts: imx8mp-phycore-som: Set usdhc root clock for eMMC (2022-02-21 14:10:07 +0800)

----------------------------------------------------------------
i.MX arm64 device tree change for 5.18:

- New support for a number of i.MX8M Mini based boards: Protonic PRT8MM,
  emCON-MX8M Mini, Toradex Verdin, Gateworks GW7903.
- A series from Adam Ford to enable GPC, USB and display support for
  i.MX8M Nano.
- Enable G1 and G2 video decoder devices for i.MX8MM and i.MX8MQ.
- Enable PCIe support on imx8mm-beacon, tqma8mqml, imx8mm-evk,
  imx8mq-evk and imx8mm-venice board.
- A series from Hugo Villeneuve to add PCA6416 interrupt controller
  configuration, GPIO line names and i2C5 support for imx8mp-evk board.
- Correct I2C3 pad-ctrl and add internal display support for mnt-reform2
  board.
- Improve fsl-ls1028a-qds overlay support by dropping syntax hard coding
  and using overlay target for build.
- Add overlay support for serial modes and imx219 rpi v2 camera on
  Gateworks imx8mm-venice devices.
- A set of patches from Teresa Remmet to update phyCORE-i.MX8MP SoM
  device tree, including drive strength updates of different interfaces
  and PMIC configuration changes.
- Device additions on various boards and some small random changes.

----------------------------------------------------------------
Abel Vesa (2):
      arm64: dts: imx8qm: Add SCU RTC node
      arm64: dts: imx8qxp-ss-adma: Drop fsl,imx7ulp-lpuart comaptible

Adam Ford (8):
      arm64: dts: imx8mn: add GPC node
      arm64: dts: imx8mn: put USB controller into power-domains
      arm64: dts: imx8mn: add DISP blk-ctrl
      arm64: dts: imx8mn: Enable GPU
      arm64: dts: imx8mq-tqma8mq: Remove redundant vpu reference
      arm64: dts: imx8mq: Enable both G1 and G2 VPU's with vpu-blk-ctrl
      arm64: dts: imx8mm: Enable Hantro G1 and G2 video decoders
      arm64: dts: imx8mm-beacon: Enable PCIe

Alexander Stein (1):
      arm64: dts: tqma8mqml: add PCIe support

David Jander (1):
      arm64: dts: imx: add Protonic PRT8MM board

Hugo Villeneuve (3):
      arm64: dts: imx8mp-evk: add PCA6416 interrupt controller mode
      arm64: dts: imx8mp-evk: add PCA6416 gpio line names
      arm64: dts: imx8mp-evk: add support for I2C5

Jonas Kuenstler (1):
      arm64: dts: imx8mp-phycore-som: Set usdhc root clock for eMMC

Li Yang (1):
      arm64: dts: ls1028a-qds: define mdio slots for networking options

Lucas Stach (4):
      arm64: dts: imx8mq: disable DDRC node by default
      arm64: dts: mnt-reform2: add internal display support
      arm64: dts: mnt-reform2: correct i2c3 pad-ctrl
      arm64: dts: imx8mp: disable usb3_phy1

Marcel Ziswiler (2):
      arm64: dts: imx8mm: fix strange hex notation
      arm64: dts: freescale: add initial support for verdin imx8m mini

Marek Vasut (1):
      arm64: dts: imx8mm: Add missing MX8MM_IOMUXC_NAND_READY_B_SD3_RESET_B

Michael Walle (1):
      arm64: dts: ls1028a: add efuse node

Oliver Graute (2):
      arm64: dts: imx8qm: add compatible string for usdhc3
      arm64: dts: imx8qm: added more serial alias to dts

Peng Fan (1):
      arm64: dts: imx8: add mu5/6 node

Reinhold Mueller (1):
      arm64: dts: imx8mm: Add support for emtrion emCON-MX8M Mini

Richard Zhu (4):
      arm64: dts: imx8mm: Add the pcie phy support
      arm64: dts: imx8mm: Add the pcie support
      arm64: dts: imx8mm-evk: Add the pcie support on imx8mm evk board
      arm64: dts: imx8mq-evk: Add second PCIe port support

Rob Herring (1):
      arm64: dts: imx8qm: Drop CPU 'arm,armv8' compatible

Shawn Guo (3):
      Merge commit '7a7b1414ea9a3641672be768afe16f583f0b76e7' into imx/dt64
      arm64: dts: fsl-ls1028a-qds: Drop overlay syntax hard coding
      arm64: dts: freescale: Use overlay target for simplicity

Teresa Remmet (6):
      arm64: dts: imx8mp-phycore-som: Set minimum output impedance for eth phy
      arm64: dts: imx8mp-phycore-som: Adapt eMMC drive strength
      arm64: dts: imx8mp-phycore-som: Reduce drive strength for fec tx lines
      arm64: dts: imx8mp-phycore-som: Update WDOG muxing
      arm64: dts: imx8mp-phycore-som: Set VDD_ARM run and standby voltage
      arm64: dts: imx8mp-phycore-som: LDO5 needs to be enabled instead of LDO4

Tim Harvey (8):
      arm64: dts: imx8mm-venice*: add PCIe support
      arm64: dts: imx8mn-venice-gw7902: disable gpu
      arm64: dts: imx8m{m,n}_venice*: add gpio-line-names
      arm64: dts: imx: Add i.mx8mm Gateworks gw7903 dts support
      arm64: dts: imx8mm-venice-gw73xx-0x: add dt overlays for serial modes
      arm64: dts: imx8mm-venice-gw72xx-0x: add dt overlays for serial modes
      arm64: dts: imx8mm-venice-gw73xx-0x: add dt overlay for imx219 rpi v2 camera
      arm64: dts: imx8mm-venice-gw72xx-0x: add dt overlay for imx219 rpi v2 camera

 arch/arm64/boot/dts/freescale/Makefile             |   55 +-
 .../boot/dts/freescale/fsl-ls1028a-qds-13bb.dts    |  146 +--
 .../boot/dts/freescale/fsl-ls1028a-qds-65bb.dts    |  138 +--
 .../boot/dts/freescale/fsl-ls1028a-qds-7777.dts    |   99 +-
 .../boot/dts/freescale/fsl-ls1028a-qds-85bb.dts    |  134 +--
 .../boot/dts/freescale/fsl-ls1028a-qds-899b.dts    |   86 +-
 .../boot/dts/freescale/fsl-ls1028a-qds-9999.dts    |   97 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |   24 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   11 +
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi    |   16 +
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |   57 +
 .../boot/dts/freescale/imx8mm-emcon-avari.dts      |   23 +
 .../boot/dts/freescale/imx8mm-emcon-avari.dtsi     |  139 +++
 arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi    |  627 ++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   55 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |    7 +-
 arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts    |  304 +++++
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |   19 +
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |    5 +
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |   49 +
 .../freescale/imx8mm-venice-gw72xx-0x-imx219.dts   |   93 ++
 .../imx8mm-venice-gw72xx-0x-rs232-rts.dts          |   53 +
 .../freescale/imx8mm-venice-gw72xx-0x-rs422.dts    |   61 +
 .../freescale/imx8mm-venice-gw72xx-0x-rs485.dts    |   61 +
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |   78 ++
 .../freescale/imx8mm-venice-gw73xx-0x-imx219.dts   |   93 ++
 .../imx8mm-venice-gw73xx-0x-rs232-rts.dts          |   53 +
 .../freescale/imx8mm-venice-gw73xx-0x-rs422.dts    |   61 +
 .../freescale/imx8mm-venice-gw73xx-0x-rs485.dts    |   61 +
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   |   78 ++
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   59 +
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   89 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |  836 +++++++++++++
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   |  150 +++
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi      |   67 ++
 .../dts/freescale/imx8mm-verdin-nonwifi-dahlia.dts |   18 +
 .../dts/freescale/imx8mm-verdin-nonwifi-dev.dts    |   18 +
 .../boot/dts/freescale/imx8mm-verdin-nonwifi.dtsi  |   75 ++
 .../dts/freescale/imx8mm-verdin-wifi-dahlia.dts    |   18 +
 .../boot/dts/freescale/imx8mm-verdin-wifi-dev.dts  |   18 +
 .../boot/dts/freescale/imx8mm-verdin-wifi.dtsi     |   94 ++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   | 1264 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   68 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |   51 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  104 ++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   50 +
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |   39 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |    1 +
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   39 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    1 +
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      |  144 ++-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi  |    4 -
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   64 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  |    4 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi  |    8 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   18 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi |    8 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi |    8 +
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |    6 +
 59 files changed, 5625 insertions(+), 481 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
