Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315C8C7EE2E
	for <soc@archiver.kernel.org>; Sat, 10 Jun 2023 07:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF521C433A8; Sat, 10 Jun 2023 07:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C38C433EF;
	Sat, 10 Jun 2023 07:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686381964;
	bh=AInjaszxz/gBDzUmDwjiqpO5MJwA0ltMIvCxVknBHp0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pWtohSd767heMYOpu3q0NrI1OXprJ+8h8bIqbbitPSSGee4bOJYI0WlCbBfJKbkXW
	 ZsUXgw9TAtoc1PEYkWiACU7WA0pdv/82x0dEH/RddthRbHaQ44jF4JlyoEyujngu/Y
	 WxwLShA/yJfE4xsOhhkwwonEnlQ5itirrNvU+SPLDC++RTg5omON1ScctAcf2QwCCX
	 XmKgmlKk7bYBtIOMv5M0+68c4oHk5lMs0xccPkmMYt/fAyK9Lrc/1Wl8zpTYW0fhJI
	 Ft0XbCHa+x/IE/5Qy2YlB31YfZLNobAZkImm8SrkVrerujFFGK+KgL5E/pMpqCQnqx
	 +Bz9sLW71Z0cQ==
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
Subject: [GIT PULL 3/4] i.MX arm64 device tree for 6.5
Date: Sat, 10 Jun 2023 15:25:29 +0800
Message-Id: <20230610072530.418847-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230610072530.418847-1-shawnguo@kernel.org>
References: <20230610072530.418847-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.5

for you to fetch changes up to 8e2facfe904a20e306536aeadd737dfaeab5cb38:

  arm64: dts: imx8mq: Pass address-cells/size-cells to mipi_dsi (2023-06-09 22:34:35 +0800)

----------------------------------------------------------------
i.MX arm64 device tree for 6.5:

- New board support: i.MX8MM based Emtop SoM & Baseboard, NXP i.MX8MM EVKB
  board, i.MX8MP based Gateworks Venice gw7905-2x device.
- A series from Adam Ford to add Camera and Audio support for i.MX8M
  based Beacon boards.
- Add Audio output support for i.MX8MP TQMa8MPxL/MBa8MPxL board.
- Add HDMI and display support for imx8mm-evk and imx8mm-phg board.
- Add coresight trace devices support for i.MX8MP SoC.
- A couple of changes from Krzysztof Kozlowski to add missing cache
  properties.
- A couple of changes from Laurent Pinchart to add CSIS and ISI devices
  for i.MX8MP SoC.
- A series from Marek Vasut to add more devices for i.MX8MP, and enable
  SAI audio on i.MX8MP DHCOM PDK2 and PDK3.
- Correct GSC vdd_bat data size for Gateworks Venice devices.
- Add more device support for i.MX93, Watchdog, OCOTP, idle states, DDR
  performance monitor, etc.
- Small and random clean-ups and device node additions.

----------------------------------------------------------------
Adam Ford (4):
      arm64: dts: imx8mn: Add CSI and ISI Nodes
      arm64: dts: imx8mn-beacon: Add support for OV5640 Camera
      arm64: dts: imx8mp-beacon-kit: Enable WM8962 Audio CODEC
      arm64: dts: imx8mn-beacon: Migrate sound card to simple-audio-card

Alexander Stein (7):
      arm64: dts: imx8mp: move noc node to correct position
      arm64: dts: imx8mp: Add analog audio output on i.MX8MP TQMa8MPxL/MBa8MPxL
      arm64: dts: tqma8mqml: Add vcc supply to i2c eeproms
      arm64: dts: imx8mq: Fix lcdif compatible
      arm64: dts: imx8mq: Fix lcdif clocks
      arm64: dts: imx8mq: Add missing pci property
      arm64: dts: imx8mq-tqma8mq-mba8mx: Remove invalid properties

Andrew Lunn (1):
      arm64: dts: freescale: ZII: Add missing phy-mode

Fabio Estevam (4):
      arm64: dts: imx8mm-evk: Add HDMI support
      arm64: dts: imx8mm-phg: Add display support
      arm64: dts: imx8mq: Use 'dsi' as node name
      arm64: dts: imx8mq: Pass address-cells/size-cells to mipi_dsi

Frank Li (1):
      arm64: dts: imx8mp: Add coresight trace components

Himanshu Bhavani (1):
      arm64: dts: Add support for Emtop SoM & Baseboard

Hugo Villeneuve (3):
      arm64: dts: imx8mn-var-som: add SOM EEPROM
      arm64: dts: imx8mn-var-som: add 20ms delay to ethernet regulator enable
      arm64: dts: imx8mn-var-som-symphony: adapt FEC pinctrl for SOMs with onboard PHY

Johannes Schneider (1):
      arm64: dts: add NXP i.MX8MM-EVKB support

Krzysztof Kozlowski (3):
      arm64: dts: imx8mq-mnt-reform2: drop invalid simple-panel compatible
      arm64: dts: imx: add missing cache properties
      arm64: dts: freescale: add missing cache properties

Laurent Pinchart (2):
      arm64: dts: imx8mp: Add CSIS DT nodes
      arm64: dts: imx8mp: Add ISI DT node

Luca Ceresoli (1):
      arm64: dts: imx8mp-msc-sm2s: Add sound card

Lucas Stach (1):
      arm64: dts: imx8mp: don't initialize audio clocks from CCM node

Marek Vasut (7):
      arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
      arm64: dts: imx8mp: Add analog audio output on i.MX8MP EVK
      arm64: dts: imx8mp: Describe PCIe clock generator on DH electronics i.MX8M Plus DHCOM on PDK3
      arm64: dts: imx8mp: Sort AIPS4 nodes
      arm64: dts: imx8mp: Add DeWarp Engine DT node
      arm64: dts: imx8mp: Add TC9595 bridge on DH electronics i.MX8M Plus DHCOM
      arm64: dts: imx8mp: Enable SAI audio on MX8MP DHCOM PDK2 and PDK3

Nicolas Cavallari (1):
      arm64: dts: imx8mm-venice: Fix GSC vdd_bat data size.

Peng Fan (5):
      arm64: dts: imx93: add watchdog node
      arm64: dts: imx93: add ocotp node
      arm64: dts: imx93: reorder device nodes
      arm64: dts: imx93: add cpuidle node
      arm64: dts: imx93-11x11-evk: enable wdog3

Tim Harvey (3):
      arm64: dts: freescale: Add imx8mp-venice-gw7905-2x
      arm64: dts: imx8mm-venice-gw700x: remove invalid props from fan-controller
      arm64: dts: imx8mp-venice-gw702x: fix GSC vdd_bat data size

Wei Fang (1):
      arm64: dts: imx93: add fsl,stop-mode property to support WOL

Xu Yang (1):
      arm64: dts: imx93: add ddr performance monitor node

 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |   4 +
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi     |   4 +
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |   1 +
 .../boot/dts/freescale/imx8mm-emtop-baseboard.dts  |  15 +
 .../arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi | 261 +++++++++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |  67 +++
 arch/arm64/boot/dts/freescale/imx8mm-evkb.dts      | 128 +++++
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts       |  87 +++
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |   2 +
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   |   4 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   2 +-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   2 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |   2 +-
 .../dts/freescale/imx8mn-beacon-baseboard.dtsi     | 103 +++-
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts |  40 --
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |   7 +
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |   2 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  60 +++
 .../arm64/boot/dts/freescale/imx8mp-beacon-kit.dts |  89 ++++
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts |  54 ++
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts |  60 ++-
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |  72 +++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  80 +++
 .../boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts     |  70 +++
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |  46 ++
 .../boot/dts/freescale/imx8mp-venice-gw702x.dtsi   | 587 +++++++++++++++++++++
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |   2 +-
 .../boot/dts/freescale/imx8mp-venice-gw7905-2x.dts |  28 +
 .../boot/dts/freescale/imx8mp-venice-gw7905.dtsi   | 309 +++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          | 490 ++++++++++++++++-
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      |   2 +-
 .../boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |   4 -
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |   2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  13 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   1 +
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |   4 +
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 135 +++--
 41 files changed, 2727 insertions(+), 118 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-evkb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905-2x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905.dtsi
