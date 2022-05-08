Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E413C433F5
	for <soc@archiver.kernel.org>; Sun,  8 May 2022 03:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 447C6C385A4; Sun,  8 May 2022 03:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1000C385B4;
	Sun,  8 May 2022 03:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651981178;
	bh=R54NjX8GKfbEjrznSVrjfxSU1rNZA2IEzZezAkHXCPY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bChFABnJLr//aTdDSxZdkBJ4mbvkQgIzVOUMNj5lCdnqIk/u5nxIJbXBFxVIQsmYk
	 C4LHbMYM4mygS30ALyPHOMSKUVfxoJawNMHzoUoU0C0tZgbzjoPfa1dUi+To7CyU2/
	 V33CxopQy50dOo+t257Ll8l/dz9NpDqclDwMF7gKbhXlbQEmhC1T89AU0cHCe6fGjy
	 apIfJZ8PvmB9yfrg64W6kHIz19c7w7u9RZQowJphP8xsOuuAYwaQcM3+xHJ5I+qYqD
	 goHRsDhbG/a4rYlbfSwYkspXS8QSgvoroLYz2HSg9CzkkCe/NxGbDIkm6PWistqAy7
	 jnSTp2las7qzg==
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
Subject: [GIT PULL 4/5] i.MX arm64 device tree update for 5.19
Date: Sun,  8 May 2022 11:38:42 +0800
Message-Id: <20220508033843.2773685-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220508033843.2773685-1-shawnguo@kernel.org>
References: <20220508033843.2773685-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.19

for you to fetch changes up to d80b9c8422fa8e02b9a92b90fbb328e3e069c649:

  arm64: dt: imx8mp: support pwm polarity inversion (2022-05-05 15:46:31 +0800)

----------------------------------------------------------------
i.MX arm64 device tree update for 5.19:

- New board support: Engicam i.Core MX8M Plus SoM and EDIMM2.2 Starter
  Kit, Toradex Verdin i.MX8M Plus devices, Data Modul i.MX8M Mini eDM SBC,
  Verdin based MX8Menlo, 8MNANOD3L EVK, i.MX8M Plus Gateworks GW7400.
- Enable RTS-CTS on UART3 for imx8mm-beacon and imx8mn-beacon boards.
- Enable HS400-ES support for i.MX8MN and i.MX8MP uSDHC devices by
  updating the compatible.
- A few updates on imx8mq-librem5 to increase boost regulation
  current, add panel compatible for r4 ("Evergreen") revision and volume
  buttons a wakeup source.
- Clean up vendor specific 'fsl,uart-has-rtscts' property by using
  standard 'uart-has-rtscts'.
- Add GPC, GPU, MEDIAMIX, and HSIO power domains for i.MX8M Plus SoC.
- A series from Marcel Ziswiler to improve imx8mm-verdin support,
  including cosmetic changes and functional improvements like SD1 sleep
  pinctrl and fully validated IOMUX configuration.
- Add PWM polarity inversion support for i.MX8 SoCs.
- A couple of changes from Michael Walle to update PMIC output names and
  min/max voltages for imx8mn-evk board.
- A series from Tim Harvey to improve imx8mm-venice boards, add missing
  uart-has-rtscts property to UARTs, clock-names to pcie_phy, and
  vdd_5p0 ADC channel.
- Add VPU codec  devices for i.MX8QXP SoC.
- Other small and random changes.

----------------------------------------------------------------
Adam Ford (4):
      arm64: dts: imx8mn: Enable HS400-ES
      arm64: dts: imx8mp: Enable HS400-ES
      arm64: dts: imx8mm-beacon: Enable RTS-CTS on UART3
      arm64: dts: imx8mn-beacon: Enable RTS-CTS on UART3

Angus Ainslie (1):
      arm64: dts: imx8mq-librem5: add a RO firmware partition

Ariel D'Alessandro (1):
      arm64: dts: imx8mn-bsh-smm-s2pro: Add tlv320aic31xx audio card node

Fabio Estevam (3):
      arm64: dts: imx8mn-evk: Add UART3 support
      arm64: dts: imx8mp-verdin: Use the standard 'uart-has-rtscts'
      arm64: dts: imx8mq-kontron-pitx-imx8m: Use the standard 'uart-has-rtscts'

Guido Günther (2):
      arm64: dts: imx8mq-librem5: higher boost regulation current
      arm64: dts: imx8mq-librem5-r4: add the correct panel

Krzysztof Kozlowski (1):
      arm64: dts: freescale: align SPI NOR node name with dtschema

Kuldeep Singh (1):
      arm64: dts: lx2160a: Update can node property

Laurent Pinchart (1):
      arm64: dts: imx8mp: Add MEDIAMIX power domains

Li Yang (2):
      arm64: dts: remove "simple-bus" compatible from ifc node
      arm64: dts: freescale: update ifc node name to be memory-controller

Lucas Stach (3):
      arm64: dts: imx8mp: add GPC node with GPU power domains
      arm64: dts: imx8mp: add GPU nodes
      arm64: dts: imx8mp: add HSIO power-domains

Manoj Sai (2):
      arm64: dts: imx8mp: Add Engicam i.Core MX8M Plus SoM
      arm64: dts: imx8mp: Add Engicam i.Core MX8M Plus EDIMM2.2 Starter Kit

Marcel Ziswiler (12):
      arm64: dts: imx8mm-verdin: update regulator names
      arm64: dts: imx8mm-verdin: multi-line comment style
      arm64: dts: imx8mm-verdin: alphabetically re-order nodes
      arm64: dts: imx8mm-verdin: only dashes in node names
      arm64: dts: imx8mm-verdin: comment about i2c level shifter
      arm64: dts: imx8mm-verdin: update iomux configuration
      arm64: dts: imx8mm-verdin: re-order pinctrl groups
      arm64: dts: imx8mm-verdin: capitalisation of verdin comments
      arm64: dts: imx8mm-verdin: note about disabled sd1 pull-ups
      arm64: dts: imx8mm-verdin: add sd1 sleep pinctrl
      arm64: dts: imx8mp: add uart2 dma
      arm64: dts: freescale: add initial support for verdin imx8m plus

Marek Vasut (7):
      arm64: dts: imx8mm: Add support for Data Modul i.MX8M Mini eDM SBC
      arm64: dts: imx8mp: Add missing speed grade phandle
      arm64: dts: imx8mp: Add cpu-freq support
      arm64: dts: imx8mm: Add i.MX8M Mini Toradex Verdin based Menlo board
      arm64: dts: imx8mm: Add CPLD on MX8Menlo board
      arm64: dts: imx8mm: Disable USB2 OC on Data Modul i.MX8M Mini eDM SBC
      arm64: dts: imx8mm: Use 100 kHz I2C2 on Data Modul i.MX8M Mini eDM SBC

Markus Niebel (4):
      arm64: dt: imx8mq: support pwm polarity inversion
      arm64: dt: imx8mm: support pwm polarity inversion
      arm64: dt: imx8mn: support pwm polarity inversion
      arm64: dt: imx8mp: support pwm polarity inversion

Martin Kepplinger (2):
      arm64: dts: imx8mq-librem5: make the volume buttons a wakeup source
      arm64: dts: imx8mq-librem5: remove description of CHG_STATUS_B

Michael Walle (7):
      arm64: dts: imx8mn-evk: use proper names for PMIC outputs
      arm64: dts: imx8mn-evk: fix the min/max voltages of the PMIC
      arm64: dts: imx8mn-evk: add QSPI flash
      arm64: dts: ls1028a: sl28: use ocelot-8021q tagging by default
      arm64: dts: ls1028a: default to OTG mode for USB
      arm64: dts: imx8mn: add 8MNANOD3L-EVK device tree
      arm64: dts: freescale: reduce the interrup-map-mask

Ming Qian (1):
      arm64: dts: freescale: imx8q: add imx vpu codec entries

Oleksij Rempel (1):
      arm64: dts: imx8mm-kontron: fix ethernet node name

Paul Elder (1):
      arm64: dts: imx8mp: Add MEDIA_BLK_CTRL

Peng Fan (1):
      arm64: dts: imx8mq: add hdmi phy 27m clock

Sherry Sun (1):
      arm64: dts: imx8mp: add ddr controller node to support EDAC on imx8mp

Tim Harvey (6):
      arm64: dts: imx8m{m,n}-venice-*: add missing uart-has-rtscts property to UARTs
      arm64: dts: imx: Add i.MX8M Plus Gateworks gw7400 dts support
      arm64: dts: imx8mm-venice-gw7902: fix pcie bindings
      arm64: dts: imx8m*venice: add missing clock-names to pcie_phy
      arm64: dts: imx8mm-venice-gw7902: add vdd_5p0 ADC channel
      arm64: dts: imx8mm-venice-gw7901: remove unnecessary cpu temp override

Tommaso Merciai (1):
      arm64: dts: imx8mm-evk: add pwm1/backlight support

 arch/arm64/boot/dts/freescale/Makefile             |    9 +
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts     |    9 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |    2 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |    2 -
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |    6 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |    6 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |    6 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi |   10 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |    6 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |    6 +-
 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi     |   74 ++
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |    3 +
 .../dts/freescale/imx8mm-data-modul-edm-sbc.dts    |  997 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi    |    2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   20 +
 .../boot/dts/freescale/imx8mm-kontron-n801x-s.dts  |    2 +-
 .../dts/freescale/imx8mm-kontron-n801x-som.dtsi    |    2 +-
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts  |  334 +++++
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |    1 +
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |    1 +
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   |    2 +
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   16 +-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   17 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |    1 +
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   |    2 +-
 .../boot/dts/freescale/imx8mm-verdin-wifi.dtsi     |   26 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  411 +++---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |    8 +-
 .../dts/freescale/imx8mn-beacon-baseboard.dtsi     |    3 +
 .../boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts    |   90 ++
 arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dts |  114 ++
 arch/arm64/boot/dts/freescale/imx8mn-evk.dts       |   54 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |   45 +
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |    8 +
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   14 +-
 .../dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts  |  175 +++
 .../boot/dts/freescale/imx8mp-icore-mx8mp.dtsi     |  186 +++
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |  896 +++++++++++++
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   |  129 ++
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      |   46 +
 .../dts/freescale/imx8mp-verdin-nonwifi-dahlia.dts |   18 +
 .../dts/freescale/imx8mp-verdin-nonwifi-dev.dts    |   18 +
 .../boot/dts/freescale/imx8mp-verdin-nonwifi.dtsi  |   54 +
 .../dts/freescale/imx8mp-verdin-wifi-dahlia.dts    |   18 +
 .../boot/dts/freescale/imx8mp-verdin-wifi-dev.dts  |   18 +
 .../boot/dts/freescale/imx8mp-verdin-wifi.dtsi     |   82 ++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   | 1380 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  247 +++-
 .../dts/freescale/imx8mq-kontron-pitx-imx8m.dts    |    2 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    2 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r4.dts |    4 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   15 +-
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   15 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   25 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   24 +
 58 files changed, 5355 insertions(+), 314 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
