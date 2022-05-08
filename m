Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4CEC433EF
	for <soc@archiver.kernel.org>; Sun,  8 May 2022 03:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55772C385AC; Sun,  8 May 2022 03:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B788FC385A4;
	Sun,  8 May 2022 03:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651981173;
	bh=A2d/l6euFf/iifUg6yl5pBLDIdKrTPcT2lPIjp2wAMg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CFZkbXd3l6yeoZZOhhEm413zp7DFHydz335gL7l2O5la+tPrZjIsFe2mxRaZqutPg
	 7K4WwDF394M1g+XjJLmRi10voEd/592VcRRTBvW9O/YdfzIB5xbmtdV83CrqqfeeN2
	 3jqwougxnCCYDNLzfmNkDKGPVio1ihpERGWb+56lHCPpGMfad5+vtxHwt4JrEEPZVx
	 Wsd+VFt0nhEfVMxtKpiVRgAYHvBdWtQd74nHxY/5OOIrA4yzqYe8BQhTz2UIsjrX3I
	 98ED4oNgazGb3P9pp7aUqiFXeOpVi0WXX0CS8xmztUZJHi/5gWnusLRCs7PFdjcUkS
	 wyGggIHW8gp1w==
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
Subject: [GIT PULL 3/5] i.MX ARM device tree update for 5.19
Date: Sun,  8 May 2022 11:38:41 +0800
Message-Id: <20220508033843.2773685-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220508033843.2773685-1-shawnguo@kernel.org>
References: <20220508033843.2773685-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.19

for you to fetch changes up to 19a434aa3ebc29fda4799454afe882a5edcb1b94:

  ARM: dts: imx6ull-colibri: improve pinctrl node names (2022-05-07 09:53:37 +0800)

----------------------------------------------------------------
i.MX ARM device tree update for 5.19:

- New board support: PHYTEC phyGATE-Tauri-S, TQ-Systems MBa6UL,
  LS1021A IoT board, Toradex Iris and Aster carrier, i.MX7D SMEGW01,
  i.MXRT1050 EVK, Bosch ACC board.
- A series from Alexander Stein to update i.MX51 based digi-connectcore
  board, regarding to DMA of UART devices, PMIC voltages, USB
  vbus-supply and usbphy.
- A series of changes from David Jander and Oleksij Rempel to remove
  prototype specific deprecated code not used in production from
  i.MX6Q/DL Vicut1 board, and unify Vicut1 and Victgo variants to reduce
  maintaining overhead.
- Quite some changes from different people to update imx6ull-colibri board
  on various aspects, touchscreen, device tree overlays, NAND BCH geometry,
  GPIO line names, FEC phy-supply, etc.
- A couple of changes from Fabio Estevam to switch imx6dl-plybas and
  imx6ul-kontron-n6x1x-s to use standard 'uart-has-rtscts' property.
- A couple of patches from Li Yang to update IFC device compatible and
  node name for LayerScape SoCs.
- Disable USB host to work around boot issue on imx6qdl-udoo board.
- A series from Max Krummenacher to update Colibri i.MX6DL device trees,
  drop dedicated v1.1 DT, disable add-on accessories, cleanups, etc.
- Various random and small updates on i.MX28 and i.MX6 boards.

----------------------------------------------------------------
Alexander Bauer (1):
      ARM: dts: imx6ull: Add support for PHYTEC phyGATE-Tauri-S with i.MX 6ULL

Alexander Shiyan (6):
      ARM: dts: imx51: Add generic DMA bindings for UART nodes
      ARM: dts: i.MX51: digi-connectcore-som: Remove unused regulators
      ARM: dts: i.MX51: digi-connectcore-som: Update PMIC voltages
      ARM: dts: i.MX51: digi-connectcore-som: Setup usbotg vbus-supply
      ARM: dts: i.MX51: digi-connectcore-jsk: Use usb-nop-xceiv usbphy for USB1
      ARM: dts: imx6qdl-phytec: Add LED labels

Alexander Stein (5):
      ARM: dts: imx6ul: add TQ-Systems MBa6ULx device trees
      ARM: dts: imx6ul: add TQ-Systems MBa6ULxL device trees
      ARM: dts: imx6ull: add TQ-Systems MBa6ULLx device trees
      ARM: dts: imx6ull: add TQ-Systems MBa6ULLxL device trees
      ARM: dts: imx7s: fix iomuxc_lpsr node name

Andrej Picej (1):
      ARM: dts: imx6ul: peb-av-02: move to 3 cell pwm

Changming Huang (1):
      ARM: dts: Add initial LS1021A IoT board dts support

David Jander (21):
      ARM: dts: imx6qdl-vicut1/vicutgo: Set default backlight brightness to maximum
      ARM: dts: imx6qdl-vicut1/vicutgo: Rename backlight to backlight_lcd
      ARM: dts: imx6qdl-vicut1/vicutgo: Add backlight_led node
      ARM: dts: imx6qdl-vicut1: update gpio-line-names for some GPIOs
      ARM: dts: imx6qdl-victgo: add CAN termination support
      ARM: dts: imx6qdl-vicut1.dtsi: remove TiWi module
      ARM: dts: imx6qdl-vicut1.dtsi: Put nON_SWITCH in own pinctrl grp
      ARM: dts: imx6qdl-vicut1.dtsi: Remove PCIe
      ARM: dts: imx6qdl-vicut1/victgo: Remove UART2
      ARM: dts: imx6qdl-vicut1.dtsi: Fix LED names
      ARM: dts: imx6qdl-vicut1.dtsi: Fix debug LED gpio pins
      ARM: dts: imx6qdl-vicut1.dtsi: Update GPIO line names
      ARM: dts: imx6qdl-vicut1.dtsi: Remove conflicting pinctrl entry
      ARM: dts: imx6q-vicut1.dts: remove sata node
      ARM: dts: imx6dl-victgo.dts: update gpio names
      ARM: dts: imx6dl-victgo.dts: Factor out common parts to imx6qdl-victgo.dtsi
      ARM: dts: imx6qdl-vicut1.dtsi: Move some node out to DTS files
      ARM: dts: Remove imx6qdl-victgo.dtsi
      ARM: dts: imx6qdl-vicut1: Factor out common parts of 12inch board variants
      ARM: dts: imx6dl-victgo.dts: Remove touchscreen x axis inversion
      ARM: dts: imx6qdl-vicut1.dtsi: Add missing ISB led node

Denys Drozdov (4):
      ARM: dts: imx6ull-colibri: add touchscreen device nodes
      ARM: dts: imx6ull-colibri: update device trees to support overlays
      ARM: dts: imx6ull-colibri: add support for toradex iris carrier boards
      ARM: dts: imx6ull-colibri: add support for toradex aster carrier boards

Fabio Estevam (5):
      ARM: dts: mba6ulx: Remove unnecessary #address-cells/#size-cells
      ARM: dts: imx6dl-plybas: Use the standard 'uart-has-rtscts'
      ARM: dts: imx6ul-kontron-n6x1x-s: Use the standard 'uart-has-rtscts'
      ARM: dts: imx6sl: Add a label for the cpu node
      ARM: dts: imx7d-smegw01: Add support for i.MX7D SMEGW01 board

Giulio Benetti (1):
      ARM: dts: imx: Add i.MXRT1050-EVK support

Krzysztof Kozlowski (2):
      ARM: dts: imx: align SPI NOR node name with dtschema
      ARM: dts: imx27: use new 'dma-channels' property

Li Yang (2):
      ARM: dts: ls1021a: remove "simple-bus" compatible from ifc node
      ARM: dts: update ifc node name to be memory-controller

Marcel Ziswiler (4):
      ARM: dts: imx6ull-colibri: fix nand bch geometry
      ARM: dts: imx6ull-colibri: add/update some comments
      ARM: dts: imx6ull-colibri: move gpio-keys node to som dtsi
      ARM: dts: imx6ull-colibri: improve pinctrl node names

Mark Brown (1):
      ARM: dts: imx6qdl-udoo: Disable USB host to work around boot issues

Max Krummenacher (11):
      ARM: dts: imx6dl-colibri: Drop dedicated v1.1 device tree
      ARM: dts: imx6dl-colibri: Fix I2C pinmuxing
      ARM: dts: imx6dl-colibri: Disable add-on accessories
      ARM: dts: imx6dl-colibri: Command pmic to standby for poweroff
      ARM: dts: imx6dl-colibri: Add additional pingroups
      ARM: dts: imx6dl-colibri: Move common nodes to SoM dtsi
      ARM: dts: imx6dl-colibri: Cleanup
      ARM: dts: imx6dl-colibri: Add usdhc1 sleep pin configuration
      ARM: dts: imx6dl-colibri: Add support for Toradex Iris carrier boards
      ARM: dts: imx6dl-colibri: Add support for Toradex Aster carrier board
      ARM: dts: imx6ull-colibri: change touch i2c parameters

Michael Walle (1):
      ARM: dts: ls1021a: reduce the interrupt-map-mask

Oleksandr Suvorov (2):
      ARM: dts: imx6dl-colibri: Add gpio-line-names
      ARM: dts: imx6ull-colibri: add gpio-line-names

Oleksij Rempel (1):
      ARM: dts: imx6qdl-vicut1.dtsi: add thermal zone and attach tmp103 to it.

Philip Oberfichtner (1):
      ARM: dts: Add bosch acc board

Philippe Schenker (3):
      ARM: dts: imx6ull-colibri: use pull-down for adc pins
      ARM: dts: imx6ull-colibri: add phy-supply to fec
      ARM: dts: imx6ull-colibri: update usdhc1 pixmux and signaling

Robin van der Gracht (2):
      ARM: dts: imx6dl-victgo: Add interrupt-counter nodes
      ARM: dts: imx6dl-victgo: The TGO uses a lg,lb070wv8 compatible 7" display

Thorsten Scherer (1):
      ARM: dts: ci4x10: Adapt to changes in imx6qdl.dtsi regarding fec clocks

Uwe Kleine-König (1):
      ARM: dts: imx6qdl-tx6: Drop some duplicated properties

 arch/arm/boot/dts/Makefile                         |  25 +-
 arch/arm/boot/dts/imx27.dtsi                       |   2 +-
 arch/arm/boot/dts/imx28-evk.dts                    |   2 +-
 arch/arm/boot/dts/imx28-m28evk.dts                 |   2 +-
 arch/arm/boot/dts/imx28-sps1.dts                   |   2 +-
 arch/arm/boot/dts/imx51-digi-connectcore-jsk.dts   |   8 +
 arch/arm/boot/dts/imx51-digi-connectcore-som.dtsi  |  25 +-
 arch/arm/boot/dts/imx51.dtsi                       |   6 +
 arch/arm/boot/dts/imx6dl-colibri-aster.dts         | 113 +++
 arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts       | 110 +--
 arch/arm/boot/dts/imx6dl-colibri-iris-v2.dts       |  46 ++
 arch/arm/boot/dts/imx6dl-colibri-iris.dts          | 152 ++++
 arch/arm/boot/dts/imx6dl-colibri-v1_1-eval-v3.dts  |  31 -
 arch/arm/boot/dts/imx6dl-eckelmann-ci4x10.dts      |   6 +-
 arch/arm/boot/dts/imx6dl-plybas.dts                |   2 +-
 arch/arm/boot/dts/imx6dl-rex-basic.dts             |   2 +-
 arch/arm/boot/dts/imx6dl-victgo.dts                | 657 +----------------
 arch/arm/boot/dts/imx6dl-vicut1.dts                |   1 +
 arch/arm/boot/dts/imx6q-ba16.dtsi                  |   2 +-
 arch/arm/boot/dts/imx6q-bosch-acc.dts              | 779 +++++++++++++++++++++
 arch/arm/boot/dts/imx6q-bx50v3.dtsi                |   2 +-
 arch/arm/boot/dts/imx6q-cm-fx6.dts                 |   2 +-
 arch/arm/boot/dts/imx6q-dmo-edmqmx6.dts            |   2 +-
 arch/arm/boot/dts/imx6q-dms-ba16.dts               |   2 +-
 arch/arm/boot/dts/imx6q-gw5400-a.dts               |   2 +-
 arch/arm/boot/dts/imx6q-marsboard.dts              |   2 +-
 arch/arm/boot/dts/imx6q-rex-pro.dts                |   2 +-
 arch/arm/boot/dts/imx6q-vicut1.dts                 |   5 +-
 arch/arm/boot/dts/imx6qdl-aristainetos.dtsi        |   2 +-
 arch/arm/boot/dts/imx6qdl-aristainetos2.dtsi       |   2 +-
 arch/arm/boot/dts/imx6qdl-colibri-v1_1-uhs.dtsi    |  44 --
 arch/arm/boot/dts/imx6qdl-colibri.dtsi             | 771 +++++++++++++++-----
 arch/arm/boot/dts/imx6qdl-dfi-fs700-m60.dtsi       |   2 +-
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi      |   2 +-
 arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi           |   2 +-
 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi       |   2 +-
 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi      |   2 +-
 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi          |   2 +-
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi       |   4 +-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi           |   2 +-
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi           |   2 +-
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi             |   2 +-
 arch/arm/boot/dts/imx6qdl-tx6.dtsi                 |   5 -
 arch/arm/boot/dts/imx6qdl-udoo.dtsi                |   2 +-
 arch/arm/boot/dts/imx6qdl-vicut1-12inch.dtsi       | 128 ++++
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi              | 261 ++-----
 arch/arm/boot/dts/imx6qp-vicutp.dts                |   1 +
 arch/arm/boot/dts/imx6sl-evk.dts                   |   2 +-
 arch/arm/boot/dts/imx6sl.dtsi                      |   2 +-
 arch/arm/boot/dts/imx6sx-nitrogen6sx.dts           |   2 +-
 arch/arm/boot/dts/imx6sx-sdb-reva.dts              |   4 +-
 arch/arm/boot/dts/imx6sx-sdb.dts                   |   4 +-
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi            |   2 +-
 arch/arm/boot/dts/imx6ul-kontron-n6310-som.dtsi    |   2 +-
 arch/arm/boot/dts/imx6ul-kontron-n6311-som.dtsi    |   2 +-
 arch/arm/boot/dts/imx6ul-kontron-n6x1x-s.dtsi      |   2 +-
 .../boot/dts/imx6ul-kontron-n6x1x-som-common.dtsi  |   2 +-
 .../boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi    |   3 +-
 arch/arm/boot/dts/imx6ul-tqma6ul-common.dtsi       | 211 ++++++
 arch/arm/boot/dts/imx6ul-tqma6ul1-mba6ulx.dts      |  55 ++
 arch/arm/boot/dts/imx6ul-tqma6ul1.dtsi             |  37 +
 arch/arm/boot/dts/imx6ul-tqma6ul2-mba6ulx.dts      |  15 +
 arch/arm/boot/dts/imx6ul-tqma6ul2.dtsi             |  71 ++
 arch/arm/boot/dts/imx6ul-tqma6ul2l-mba6ulx.dts     |  15 +
 arch/arm/boot/dts/imx6ul-tqma6ul2l.dtsi            |  71 ++
 arch/arm/boot/dts/imx6ul-tqma6ulx-common.dtsi      |  43 ++
 arch/arm/boot/dts/imx6ul-tqma6ulxl-common.dtsi     |  48 ++
 arch/arm/boot/dts/imx6ull-colibri-aster.dts        |  20 +
 arch/arm/boot/dts/imx6ull-colibri-aster.dtsi       | 145 ++++
 arch/arm/boot/dts/imx6ull-colibri-emmc-aster.dts   |  17 +
 arch/arm/boot/dts/imx6ull-colibri-emmc-iris-v2.dts |  17 +
 arch/arm/boot/dts/imx6ull-colibri-emmc-iris.dts    |  17 +
 .../arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi |   8 +-
 arch/arm/boot/dts/imx6ull-colibri-eval-v3.dts      |   6 +-
 arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi     |  63 +-
 arch/arm/boot/dts/imx6ull-colibri-iris-v2.dts      |  65 ++
 arch/arm/boot/dts/imx6ull-colibri-iris-v2.dtsi     |  27 +
 arch/arm/boot/dts/imx6ull-colibri-iris.dts         |  20 +
 arch/arm/boot/dts/imx6ull-colibri-iris.dtsi        | 132 ++++
 arch/arm/boot/dts/imx6ull-colibri-nonwifi.dtsi     | 145 +++-
 arch/arm/boot/dts/imx6ull-colibri-wifi-aster.dts   |  20 +
 arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dts |   4 +-
 arch/arm/boot/dts/imx6ull-colibri-wifi-iris-v2.dts |  65 ++
 arch/arm/boot/dts/imx6ull-colibri-wifi-iris.dts    |  20 +
 arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi        | 144 +++-
 arch/arm/boot/dts/imx6ull-colibri.dtsi             | 285 +++++---
 arch/arm/boot/dts/imx6ull-kontron-n6411-som.dtsi   |   2 +-
 arch/arm/boot/dts/imx6ull-phytec-tauri-emmc.dts    |  20 +
 arch/arm/boot/dts/imx6ull-phytec-tauri-nand.dts    |  20 +
 arch/arm/boot/dts/imx6ull-phytec-tauri.dtsi        | 588 ++++++++++++++++
 arch/arm/boot/dts/imx6ull-tqma6ull2-mba6ulx.dts    |  15 +
 arch/arm/boot/dts/imx6ull-tqma6ull2.dtsi           |  76 ++
 arch/arm/boot/dts/imx6ull-tqma6ull2l-mba6ulx.dts   |  15 +
 arch/arm/boot/dts/imx6ull-tqma6ull2l.dtsi          |  76 ++
 arch/arm/boot/dts/imx7d-smegw01.dts                | 469 +++++++++++++
 arch/arm/boot/dts/imx7s.dtsi                       |   2 +-
 arch/arm/boot/dts/imxrt1050-evk.dts                |  72 ++
 arch/arm/boot/dts/imxrt1050.dtsi                   | 160 +++++
 arch/arm/boot/dts/ls1021a-iot.dts                  | 227 ++++++
 arch/arm/boot/dts/ls1021a.dtsi                     |   6 +-
 arch/arm/boot/dts/mba6ulx.dtsi                     | 569 +++++++++++++++
 101 files changed, 5920 insertions(+), 1440 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-colibri-aster.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-colibri-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-colibri-iris.dts
 delete mode 100644 arch/arm/boot/dts/imx6dl-colibri-v1_1-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/imx6q-bosch-acc.dts
 delete mode 100644 arch/arm/boot/dts/imx6qdl-colibri-v1_1-uhs.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-vicut1-12inch.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ul-tqma6ul-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ul-tqma6ul1-mba6ulx.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-tqma6ul1.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ul-tqma6ul2-mba6ulx.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-tqma6ul2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ul-tqma6ul2l-mba6ulx.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-tqma6ul2l.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ul-tqma6ulx-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ul-tqma6ulxl-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-aster.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-aster.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-aster.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-iris.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-iris-v2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-wifi-aster.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-wifi-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-wifi-iris.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-tauri-emmc.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-tauri-nand.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-tauri.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-tqma6ull2-mba6ulx.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tqma6ull2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-tqma6ull2l-mba6ulx.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tqma6ull2l.dtsi
 create mode 100644 arch/arm/boot/dts/imx7d-smegw01.dts
 create mode 100644 arch/arm/boot/dts/imxrt1050-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1050.dtsi
 create mode 100644 arch/arm/boot/dts/ls1021a-iot.dts
 create mode 100644 arch/arm/boot/dts/mba6ulx.dtsi
