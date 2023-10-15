Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FEECDB47E
	for <soc@archiver.kernel.org>; Sun, 15 Oct 2023 13:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E849C433CA; Sun, 15 Oct 2023 13:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19CBC433C8;
	Sun, 15 Oct 2023 13:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697376219;
	bh=xbQ3hNyx46JO/sSzgJ5Kymmel8t9LiUjbEUnL3x880s=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=djswcW99wKwhVARqcWdvluvjBHKJ7N3q/ri1Fp/rpAYLA2TvzUqrrEFLiUi1HDu8h
	 WQ7OaPolKJ7Yv1j0Gz0OfRjeUG6el2f1D2XRM2RCMwTJDECvTwmqtsV/mTnMCmHghV
	 ZbG9K9h81l/KfTJa22ARBgYIE2xvMtyFWjhPE/pnoGq9yABS2CkEsADP+qF282ZmVM
	 So93lb0SpoXM1ENkEaCaU3z6hzlsDettp8tsmMA+o+07ejx6RiyHhnifQkjzGYdV4G
	 rn+ZC3AJJPS+QMl0za8XbzM9f8xmAx9iE2f2mlT1psV2pGeceVXHxOSHbhiDfJirMe
	 FyeGGCMY9XaIg==
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
Subject: [GIT PULL 3/4] i.MX arm64 device tree chanages for 6.7
Date: Sun, 15 Oct 2023 21:22:59 +0800
Message-Id: <20231015132300.2268016-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231015132300.2268016-1-shawnguo@kernel.org>
References: <20231015132300.2268016-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is i.MX arm64 device tree changes for 6.7.  A couple of notes:

- Tag imx-fixes-6.6 is merged here to resolve a conflict in file
  arch/arm64/boot/dts/freescale/Makefile. 

- It has a merge conflict with net tree [1] in file
  arch/arm64/boot/dts/freescale/imx93.dtsi.

Please consider to pull, thanks!

Shawn

[1] https://lore.kernel.org/lkml/20231012101434.1e5e7340@canb.auug.org.au/


The following changes since commit f09752eaf0e8f8befc26b44c4d3e15633e56d16a:

  arm64: dts: imx: Add imx8mm-prt8mm.dtb to build (2023-09-25 10:19:52 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.7

for you to fetch changes up to 2651723668870357ab2786985004235a74fdccad:

  arm64: dts: imx8mp: Drop i.MX8MP DHCOM rev.100 PHY address workaround from PDK3 DT (2023-10-12 18:18:55 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 6.7

- New board support: TQ-Systems LS1043A/LS1046A and LS1088 based boards,
  VAR-SOM-MX6 SoM, SolidRun LX2162A SoM & Clearfog, and phyGATE-Tauri
  i.MX 8M Mini board.
- A set of changes from Adam Ford adding audio related devices for i.MX8M
  SoCs, migrating sound card to simple-audio-card for imx8mm-beacon board,
  and adding DMIC support i.MX8M Beacon boards.
- A series from Alexander Stein to add LVDS overlay support for i.MX8M
  based MBA8Mx boards.
- A couple of changes from Cem Tenruh to add gpio-line-names for i.MX8MP
  based phycore boards.
- A bunch of dt-schema check fixes from Fabio Estevam.
- A few changes from Frank Li to add edma devices and enable UART
  support for i.MX93 and i.MX8 SoCs and related boards.
- A series from Marek Vasut to improve various aspects of i.MX8MP based
  DHCOM boards support.
- A series from Teresa Remmet to enable Flexcan, USB and RS232/RS485
  support for imx8mp-phyboard-pollux board.
- A number of changes from Tim Harvey to add imx219 overlay and TPM
  device support for Gateworks boards.
- Other small and random changes.

----------------------------------------------------------------
Adam Ford (9):
      arm64: dts: imx8mp: Add easrc node
      arm64: dts: imx8mp: Add micfil node
      arm64: dts: imx8mm: Add sound-dai-cells to micfil node
      arm64: dts: imx8mn: Add sound-dai-cells to micfil node
      arm64: dts: imx8mp-beacon: Configure 100MHz PCIe Ref Clk
      arm64: dts: imx8mm-beacon: Migrate sound card to simple-audio-card
      arm64: dts: imx8mm-beacon: Add DMIC support
      arm64: dts: imx8mn-beacon: Add DMIC support
      arm64: dts: imx8mp-beacon: Add DMIC support

Alexander Stein (5):
      arm64: dts: imx8qxp: add adma_pwm in adma
      arm64: dts: mba8mx: Add DSI-LVDS bridge nodes
      arm64: dts: imx8mm-tqma8mqml-mba8mx: Add LVDS overlay
      arm64: dts: imx8mn-tqma8mqnl-mba8mx: Add LVDS overlay
      arm64: dts: imx8mq-tqma8mq-mba8mx: Add LVDS overlay

Cem Tenruh (2):
      arm64: dts: imx8mp-phycore-som: Add gpio-line-names
      arm64: dts: imx8mp-phyboard-pollux: Add gpio-line-names

Fabio Estevam (43):
      arm64: dts: imx8mm-phg: Disable flexspi
      arm64: dts: imx8dxl-evk: Remove invalid SPI property
      arm64: dts: imx8mq-librem5: Fix gpio-hog property
      arm64: dts: imx8mq-pico-pi: Fix PMIC properties
      arm64: dts: imx8mq-thor96: Fix sdio-pwrseq GPIO property
      arm64: dts: imx8qm-apalis: Remove invalid FEC property
      arm64: dts: imx8mp: Move funnel outside from soc
      arm64: dts: imx8mq: Move funnel outside from soc
      arm64: dts: imx8-ss-lsio: Remove unused clock
      arm64: dts: imx8-ss-lsio: Move lsio_bus_clk outside of soc
      arm64: dts: imx8-ss-dma: Move dma_ipg_clk outside of soc
      arm64: dts: imx8-ss-conn: Move conn clocks outside of soc
      arm64: dts: imx8-ss-img: Move img_ipg_clk outside of soc
      arm64: dts: imx8-ss-audio: Move audio_ipg_clk outside of soc
      arm64: dts: imx8dxl-ss-conn: Move conn_enet0_root_clk outside of soc
      arm64: dts: imx8dxl-evk: Remove invalid spi property
      arm64: dts: imx8ulp: Fix the SPI clock-names order
      arm64: dts: imx8mm/p-venice: Remove lis2de12 interrupt-names
      arm64: dts: imx8mq-nitrogen: Fix PCA9546 I2C subnodes
      arm64: dts: imx8mq-zii-ultra: Fix mdio node name
      arm64: dts: imx8-apalis-ixora: Remove invalid ngpios property
      arm64: dts: imx8-apalis-v1.1: Remove invalid GPIO properties
      arm64: dts: imx8mq-librem5: Remove invalid charger properties
      arm64: dts: imx8-ss-lsio: Add PWM interrupts
      arm64: dts: imx8mp-debix-som-a-bmb: Fix EEPROM #size-cells
      arm64: dts: imx8m: Remove 'nand-on-flash-bbt' from nand controller
      arm64: dts: imx8dxl-ss-conn: Complete the FEC compatibles
      arm64: dts: imx8x-colibri-iris-v2: Fix pinctrl node names
      arm64: dts: imx8dxl-ss-adma: Fix i2c compatible entries
      arm64: dts: imx93: Add the TMU interrupt
      arm64: dts: imx8dxl: Pass fsl,imx8dl-scu-pd
      arm64: dts: imx8dxl: Remove wakeup-irq
      arm64: dts: imx8dxl: Pass fsl,imx8dxl-sc-thermal
      arm64: dts: imx8dxl: Pass fsl,imx8dxl-sc-wdt
      arm64: dts: imx8mm-venice-gw790: Pass GSC address/size-cells
      arm64: dts: imx93: Fix the dmas entries order
      arm64: dts: imx8qm-ss-img: Fix jpegenc compatible entry
      arm64: dts: imx8mp-verdin: Remove invalid property from eqos
      arm64: dts: imx8mm-venice-gw790: Remove phy-mode from switch node
      arm64: dts: imx8-apalis-v1.1: Fix Ethernet PHY reset-names
      arm64: dts: imx8mp-debix-model-a: Remove USB hub reset-gpios
      arm64: dts: imx8mq-librem5: Fix tps65132 compatible
      arm64: dts: imx8mn-evk: Remove codec clocks/clock-names

Frank Li (9):
      arm64: dts: imx93: add edma1 and edma2
      arm64: dts: imx93: add dma support for lpuart[1..8]
      arm64: dts: imx93-evk: add uart5
      arm64: dts: imx8: add edma[0..3]
      arm64: dts: imx8: add edma for uart[0..3]
      arm64: dts: imx8qm: Update edma channel for uart[0..3]
      arm64: dts: imx8: update lpuart[0..3] irq number
      arm64: dts: imx8qxp-mek: enable 8qxp lpuart2 and lpuart3
      arm64: dts: imx8qm-mek: enable 8qm lpuart2 and lpuart3

Gregor Herburger (3):
      arm64: dts: ls1043a: remove second dspi node
      arm64: dts: freescale: add initial device tree for TQMLS1043A/TQMLS1046A
      arm64: dts: freescale: add initial device tree for TQMLS1088A

Josua Mayer (2):
      arm64: dts: lx2160a: describe the SerDes block #2
      arm64: dts: freescale: Add support for LX2162 SoM & Clearfog Board

Laurentiu Tudor (1):
      arm64: dts: ls208xa: use a pseudo-bus to constrain usb dma size

Marek Vasut (9):
      arm64: dts: imx8mp: Switch PCIe to HSIO PLL on i.MX8MP DHCOM PDK2 and generate clock from SoC
      arm64: dts: imx8mp: Simplify USB C on DH i.MX8M Plus DHCOM PDK3
      arm64: dts: imx8mp: Describe VDD_ARM run and standby voltage for Data Modul i.MX8M Plus eDM SBC
      arm64: dts: imx8mp: Describe VDD_ARM run and standby voltage for DH i.MX8M Plus DHCOM SoM
      arm64: dts: imx8mp: Fix property indent on DH i.MX8M Plus DHCOM PDK3
      arm64: dts: imx8mp: Switch WiFI enable signal to mmc-pwrseq-simple on i.MX8MP DHCOM SoM
      arm64: dts: imx8mp: Add UART1 and RTC wake up source on DH i.MX8M Plus DHCOM SoM
      arm64: dts: imx8mp: Update i.MX8MP DHCOM SoM DT to production rev.200
      arm64: dts: imx8mp: Drop i.MX8MP DHCOM rev.100 PHY address workaround from PDK3 DT

Ming Qian (1):
      arm64: dts: imx8-ss-img: Assign slot for imx jpeg encoder/decoder

Peng Fan (2):
      arm64: dts: imx8ulp: update gpio node
      arm64: dts: imx93: update gpio node

Shawn Guo (1):
      Merge tag 'imx-fixes-6.6' into imx/dt64

Teresa Remmet (3):
      arm64: dts: imx8mp-phyboard-pollux: Add flexcan support
      arm64: dts: imx8mp-phyboard-pollux: Enable USB support
      arm64: dts: imx8mp-phyboard-pollux: Add support for RS232/RS485

Tim Harvey (4):
      arm64: dts: imx8mp: add imx8mp-venice-gw74xx-imx219 overlay for rpi v2 camera
      arm64: dts: freescale: imx8m*-venice: remove label = "cpu" from DSA dt-binding
      arm64: dts: imx8mm-venice-gw73xx: add TPM device
      arm64: dts: imx8mp-venice-gw73xx: add TPM device

Yannic Moog (1):
      arm64: dts: freescale: add phyGATE-Tauri i.MX 8M Mini Support

 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |  19 +
 .../freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts |  49 +++
 .../boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi |  32 ++
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  14 -
 .../freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts |  56 +++
 .../boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi |  42 ++
 .../freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts |  64 +++
 .../boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi |  42 ++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |  46 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   7 +
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts    | 376 ++++++++++++++++
 .../boot/dts/freescale/fsl-lx2162a-sr-som.dtsi     |  73 +++
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |   1 -
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |   1 -
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |  11 +-
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |  98 ++++-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |  42 +-
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     | 117 ++++-
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  36 +-
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi    |  25 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |   2 -
 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi |  38 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi |   6 +-
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |   8 +-
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |  76 +++-
 arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dts  |   1 -
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts       |   5 +
 .../boot/dts/freescale/imx8mm-phygate-tauri-l.dts  | 489 +++++++++++++++++++++
 .../imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso  |  45 ++
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |   5 +
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |   1 -
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |   1 -
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   |  11 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   4 +-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   3 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |   3 +-
 .../boot/dts/freescale/imx8mm-venice-gw7904.dts    |   3 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   1 +
 .../dts/freescale/imx8mn-beacon-baseboard.dtsi     |  38 ++
 .../arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts |   1 -
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |   2 -
 .../imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso  |  45 ++
 .../arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi |   5 +
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |   3 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   1 +
 .../arm64/boot/dts/freescale/imx8mp-beacon-kit.dts |  65 ++-
 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |   2 +
 .../boot/dts/freescale/imx8mp-debix-model-a.dts    |   3 -
 .../dts/freescale/imx8mp-debix-som-a-bmb-08.dts    |   2 +-
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts |   4 +-
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts |  70 +--
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi | 154 ++++---
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   | 154 +++++++
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |  13 +
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi   |   1 -
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi   |   1 -
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi   |  10 +-
 .../dts/freescale/imx8mp-venice-gw74xx-imx219.dtso |  80 ++++
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |   2 -
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |   1 -
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          | 148 ++++---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   7 +-
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts  |  14 +-
 arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts   |   2 +-
 arch/arm64/boot/dts/freescale/imx8mq-thor96.dts    |   2 +-
 .../imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso    |  49 +++
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |   2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          | 106 ++---
 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi   |   1 -
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  26 ++
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |  56 +++
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |   2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  26 ++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |  23 +-
 .../boot/dts/freescale/imx8x-colibri-iris-v2.dtsi  |   4 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |  15 +
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 159 ++++++-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |  93 ++++
 .../dts/freescale/tqmls104xa-mbls10xxa-fman.dtsi   | 104 +++++
 .../dts/freescale/tqmls1088a-mbls10xxa-mc.dtsi     | 146 ++++++
 .../boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi   | 136 ++++++
 arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi      |  58 +++
 83 files changed, 3249 insertions(+), 442 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/tqmls104xa-mbls10xxa-fman.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/tqmls1088a-mbls10xxa-mc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi
