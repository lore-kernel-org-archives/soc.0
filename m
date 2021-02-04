Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3D2C433DB
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 12:02:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1090564F51; Thu,  4 Feb 2021 12:02:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06EB564F60;
	Thu,  4 Feb 2021 12:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612440133;
	bh=m3KkFW4SlsQW3SplHlh8ujHEAr+TQ0eNJIisFIW1mTc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L9eP0Y6Q/S9ZFex0pLNy93rpo9Cen5mi/9l7X2L/qG3eP1XwH51NWytFb1cW3of4I
	 pf3FA7RAy8e1UBjsqW3w/cYgBdnHjroppYmGdb4pmUDIA6YBga+iNJo+Rp8taimP5i
	 uWV+dXSpbyl0k9cLw/q1kHA1iOcQbhUJg3u04q55DnfmZZ58+66m9LrZX+9GQYf2d0
	 /l22orjaMe5TEZC71dPDj4ExIPiHf7Zo5zK+7YxGTToReyt76yuEtSVrhLxVjbCG6P
	 p0Bb/NpRjDGYiW263g6KxO6OZOO42HHs1JTNGwtAaNvhkNIOe4dLk+vLwNx/BTcSHU
	 qw2icxwVPkORg==
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
Subject: [GIT PULL 5/6] i.MX arm64 device tree update for 5.12
Date: Thu,  4 Feb 2021 20:01:49 +0800
Message-Id: <20210204120150.26186-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204120150.26186-1-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.12

for you to fetch changes up to da1a6b8bec881b67f0e234ed19e8b7e2fb1e7812:

  arm64: dts: imx: Add i.mx8mm nitrogen basic dts support (2021-01-30 22:26:17 +0800)

----------------------------------------------------------------
i.MX arm64 device tree update for 5.12:

- New board support: Beacon i.MX8M Nano development kit, i.MX8MM Nitrogen,
  Gateworks i.MX 8M Mini Development Kits, phyBOARD-Pollux-i.MX8MP,
  Librem5 Evergreen.
- Update imx8mm-beacon to drop unused clock-names reference, and add
  more pinctrl states for USDHC1.
- Support soc unique ID read with NVMEM on i.MX8M SoCs.
- A series from Biwen Li to add interrupt line for RTC device on
  Layerscape SoCs.
- A couple of patch sets to update imx8mq-librem5 support around
  regulators, RTC, charger, display, etc.
- A series from Joakim Zhang to improve i.MX8M FEC device configuration.
- A series from Kuldeep Singh to enable flexcan support for LX2160A and
  LS1028A.
- A series from Lucas Stach to update ZII devices around audio, USB, I2C
  pin configuration and UCS1002 ALERT.
- A series from Michael Walle to update Layerscape device trees to use
  constants in the clockgen phandle, add sl28 variant 1 and enable SATA.
- A few patches from Russell King to improve support for a couple of
  LX2160A boards.
- A series from Shengjiu Wang to add more audio support for imx8mn-evk.
- Other small and random updates.

----------------------------------------------------------------
Adam Ford (6):
      arm64: dts: imx: Add Beacon i.MX8M Nano development kit
      arm64: dts: imx8mm-beacon: Drop unused clock-names reference
      arm64: dts: imx8mm-beacon: add more pinctrl states for usdhc1
      arm64: dts: imx8mn-beacon-som: Configure RTC aliases
      arm64: dts: imx8mn: Add fspi node
      arm64: dts: imx8mn-beacon-som: Enable QSPI on SOM

Adrien Grassein (1):
      arm64: dts: imx: Add i.mx8mm nitrogen basic dts support

Alice Guo (2):
      arm64: dts: imx8m: add SoC ID compatible
      arm64: dts: imx8m: add NVMEM provider and consumer to read soc unique ID

Biwen Li (8):
      arm64: dts: ls1043a: add DT node for external interrupt lines
      arm64: dts: ls1046a: add DT node for external interrupt lines
      arm64: dts: ls1088a: add DT node for external interrupt lines
      arm64: dts: ls1088ardb: fix interrupt line for RTC node
      arm64: dts: ls208xa: add DT node for external interrupt lines
      arm64: dts: ls208xa-rdb: add interrupt line for RTC node
      arm64: dts: lx2160a: add DT node for external interrupt lines
      arm64: dts: lx2160ardb: fix interrupt line for RTC node

Fabio Estevam (1):
      arm64: dts: imx8mq: Add eCSPI DMA support

Guido Günther (8):
      arm64: dts: imx8mq-librem5-devkit: Tweak pmic regulators
      arm64: dts: imx8mq-librem5-devkit: Disable snvs_rtc
      arm64: dts: imx8mq-librem5-devkit: Drop custom clock settings
      arm64: dts: imx8mq: Add clock parents for mipi dphy
      arm64: dts: imx8mq-librem5: Mark charger IRQ as High-Z
      arm64: dts: imx8mq-librem5: Don't mark buck3 as always on
      arm64: dts: imx8mq-librem5: Add usb-c chip as supplier for the charger
      arm64: dts: imx8mq-librem5: Add LCD_1V8 regulator

Hou Zhiqiang (1):
      arm64: dts: ls1046ardb: Add interrupt line for RTC node

Joakim Zhang (4):
      arm64: dts: imx8m: correct assigned clocks for FEC
      arm64: dts: imx8mq: assign clock parents for FEC
      arm64: dts: imx8m: add mac address for FEC
      arm64: dts: imx8m: add fsl,stop-mode property for FEC

Kuldeep Singh (3):
      arm64: dts: lx2160a: Add flexcan support
      arm64: dts: ls1028a: Update flexcan properties
      arm64: dts: ls1028a: Enable flexcan support for LS1028A-RDB/QDS

Leonard Crestez (1):
      arm64: dts: imx8mq: Add NOC node

Lucas Stach (5):
      arm64: dts: zii-ultra: add sound support
      arm64: dts: zii-ultra: fix i2c pin configuration
      arm64: dts: zii-ultra: limit USB ports to USB2 speed
      arm64: dts: zii-ultra: only trigger IRQ on falling edge ucs1002 ALERT pin
      arm64: dts: zii-rmb3: enable RMI4 reduced reporting

Martin Kepplinger (9):
      arm64: dts: imx8mq-librem5: add vin-supply to VDD_1V8
      arm64: dts: imx8mq-librem5: add pinctrl for the touchscreen description
      arm64: dts: imx8mq-librem5: Move usdhc clocks assignment to board DT
      arm64: dts: imx8mq-librem5-r3: workaround i2c1 issue with 1GHz cpu voltage
      arm64: dts: imx8mq: Add interconnect provider property
      arm64: dts: imx8mq: Add interconnect for lcdif
      arm64: dts: imx8mq-librem5: enable the LCD panel
      arm64: dts: imx8mq-librem5: set regulators boot-on
      arm64: dts: Add Librem5 Evergreen

Michael Walle (10):
      arm64: dts: ls1012a: use constants in the clockgen phandle
      arm64: dts: ls1028a: use constants in the clockgen phandle
      arm64: dts: ls1043a: use constants in the clockgen phandle
      arm64: dts: ls1046a: use constants in the clockgen phandle
      arm64: dts: ls1088a: use constants in the clockgen phandle
      arm64: dts: ls208xa: use constants in the clockgen phandle
      arm64: dts: lx2160a: use constants in the clockgen phandle
      arm64: dts: freescale: sl28: add variant 1
      arm64: dts: freescale: sl28: enable SATA support
      arm64: dts: ls1028a: fix FlexSPI clock

Pawel Dembicki (2):
      arm64: dts: fsl-ls1012a-rdb: add i2c devices
      arm64: dts: fsl-ls1012a-frdm: add spi-uart device

Peng Fan (1):
      arm64: dts: imx8mq: use_dt_domains for pci node

Russell King (3):
      arm64: dts: lx2160a-clearfog-itx: add power button support
      arm64: dts: lx2160a-cex7: delete RTC interrupt
      arm64: dts: lx2160a-cex7: increase at8035 PHY gigabit Tw parameter

Shengjiu Wang (3):
      arm64: dts: imx8mn: Configure clock rate for audio plls
      arm64: dts: imx8mn-evk: Add sound-wm8524 card nodes
      arm64: dts: imx8mn-evk: Add sound-spdif card nodes

Teresa Remmet (1):
      arm64: dts: freescale: Add support for phyBOARD-Pollux-i.MX8MP

Tim Harvey (1):
      arm64: dts: imx8mm: Add Gateworks i.MX 8M Mini Development Kits

Yangbo Lu (1):
      arm64: dts: freescale: use fixed index mmcN for NXP layerscape reference boards

 arch/arm64/boot/dts/freescale/Makefile             |   8 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts |  21 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts  |   5 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts  |  50 +++
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |  60 ++-
 .../fsl-ls1028a-kontron-kbox-a-230-ls.dts          |   4 +
 .../freescale/fsl-ls1028a-kontron-sl28-var1.dts    |  62 +++
 .../fsl-ls1028a-kontron-sl28-var3-ads2.dts         |   5 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |   8 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |  16 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     | 182 ++++++--
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  98 ++--
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  |   3 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  98 ++--
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts  |   6 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     | 122 +++--
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |  17 +-
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi     |  17 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi |   4 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     | 118 ++++-
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |   3 +-
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |  12 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts  |  10 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |  24 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     | 147 ++++--
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  |   2 +
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |   1 -
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |   4 +-
 .../boot/dts/freescale/imx8mm-nitrogen-r2.dts      | 393 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   | 495 +++++++++++++++++++++
 .../boot/dts/freescale/imx8mm-venice-gw71xx-0x.dts |  19 +
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   | 186 ++++++++
 .../boot/dts/freescale/imx8mm-venice-gw72xx-0x.dts |  20 +
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   | 311 +++++++++++++
 .../boot/dts/freescale/imx8mm-venice-gw73xx-0x.dts |  19 +
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   | 362 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  23 +-
 .../dts/freescale/imx8mn-beacon-baseboard.dtsi     | 307 +++++++++++++
 .../arm64/boot/dts/freescale/imx8mn-beacon-kit.dts |  19 +
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      | 466 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |  75 ++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  44 +-
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   | 161 +++++++
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     | 293 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  23 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |  20 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |   6 +
 .../arm64/boot/dts/freescale/imx8mq-librem5-r4.dts |  35 ++
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  | 113 ++++-
 .../boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts   |  93 ++++
 .../boot/dts/freescale/imx8mq-zii-ultra-zest.dts   |  30 ++
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi | 118 ++++-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  72 ++-
 arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi   |   6 +-
 54 files changed, 4542 insertions(+), 274 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts
