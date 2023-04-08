Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B88C77B61
	for <soc@archiver.kernel.org>; Sat,  8 Apr 2023 10:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50696C4339E; Sat,  8 Apr 2023 10:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22ACFC433D2;
	Sat,  8 Apr 2023 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680949219;
	bh=H6L2jBxnl0d9qRQzwsa5xsF5sle+jTBgjzOXTOqWSNw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzvFM9HpJVKsInPuQ5RdD80CUzveKHNijFPUGXOS/3OFFm86Oj3EFshd5zTf7GwSb
	 uIqyjr15thMVxDQY/badqyhuwLmGL2MPDDtA+prGHso/4MtyrUra10Nl3RGwuYBRoA
	 U81Gm423Bh5YYW0PhwX4hxE4AdWHR54HdbJncfheV76u3xx7kS4trZXE4sxLF2mUsL
	 Okhq7Aaewtgug4ldz/asgvqtkj1q00Ro4dugI69iTEETSjut4L4yWKO77MtVQEu32u
	 IlZGPkHOoohlQkZTIzeVoP7rqPiNwDE77AFALAVxh9l3CgPV8w+/4khSs+MkmB23Ry
	 zn6b6V/NfyqXw==
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
Subject: [GIT PULL 5/6] i.MX arm64 device tree changes for 6.4
Date: Sat,  8 Apr 2023 18:19:27 +0800
Message-Id: <20230408101928.280271-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230408101928.280271-1-shawnguo@kernel.org>
References: <20230408101928.280271-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.4

for you to fetch changes up to 562d222f23f0fbdf76a8ba87ce0c9cdcd39e30f8:

  arm64: dts: imx8mp: Add support for Data Modul i.MX8M Plus eDM SBC (2023-04-08 15:25:57 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 6.4:

- New board device trees: Apalis quadmax, DH electronics i.MX8M Plus
  DHCOM and PDK3, Data Modul i.MX8M Plus eDM SBC, Colibri Aster and
  Iris, etc.
- Add FlexSPI, BBNSM and TPM PWM devices for i.MX93 SoC.
- A series of imx8mq-librem5 udpates which includes minor fixes,
  magnetometer, CSI/camera support, and powersaving improvements.
- Add Cadence USB3 support for i.MX8QXP.
- Add FlexCAN support for i.MX8QXP and i.MX8QM.
- Add UART DMA support for i.MX8MQ.
- Add GPT devices for i.MX8MP.
- Add VPU decoder and encoder support for i.MX8QM.
- Add display pipeline and PCIe EP support for i.MX8M family SoCs.
- A series from Peng Fan updating various i.MX8M device trees to pinctrl
  nodes match DT schema.
- A series from Philippe Schenker improving colibri-imx8x device trees
  in various aspects.
- Other random device tree updates.

----------------------------------------------------------------
Alexander Stein (2):
      arm64: dts: imx93: Add FlexSPI support
      arm64: dts: imx8mp-tqma8mpql-mba8mpxl: Enable wakeup-source for GPIO buttons

Angus Ainslie (1):
      arm64: dts: imx8mq-librem5: add the magnetometer mount matrix

Frank Li (2):
      arm64: dts: imx8qxp: add cadence usb3 support
      arm64: dts: freescale: imx8qxp-mek: enable cadence usb3

Jacky Bai (1):
      arm64: dts: imx93: Add the bbnsm dts node

Joakim Zhang (2):
      arm64: dts: imx8qxp: add flexcan in adma
      arm64: dts: imx8qm: add can node in devicetree

Krzysztof Kozlowski (1):
      arm64: dts: imx8: align thermal node names with bindings

Laurent Pinchart (1):
      arm64: dts: freescale: imx8mm-phyboard: Add I2C4 pinmuxing

Lucas Stach (1):
      arm64: dts: imx8mp-debix: add USB host support

Marcel Ziswiler (4):
      arm64: dts: freescale: add initial apalis imx8 aka quadmax module support
      arm64: dts: freescale: add apalis imx8 aka quadmax carrier board support
      arm64: dts: verdin-imx8mp: add pcie support
      arm64: dts: imx8mp-verdin-yavia: trivial minor updates

Marek Vasut (14):
      arm64: dts: imx8mp: Add PCIe support to DH electronics i.MX8M Plus DHCOM and PDK2
      arm64: dts: imx8mp: Update GPIO M to CLKOUT1 on DH electronics i.MX8M Plus DHCOM and PDK2
      arm64: dts: imx8mp: Do not delete PHY nodes on i.MX8MP DHCOM PDK2
      arm64: dts: imx8mp: Adjust EQoS reset comment on i.MX8MP DHCOM
      arm64: dts: imx8mp: Adjust EQoS PHY address on i.MX8MP DHCOM
      arm64: dts: imx8mp: Add EQoS RMII pin mux on i.MX8MP DHCOM
      arm64: dts: imx8mp: Add FEC RMII pin mux on i.MX8MP DHCOM
      arm64: dts: imx8mp: Drop simple-bus from fsl,imx8mp-media-blk-ctrl
      arm64: dts: imx8mp: Reorder clock and reg properties
      arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM and PDK3
      arm64: dts: imx8mm: Add display pipeline components
      arm64: dts: imx8mn: Add display pipeline components
      arm64: dts: imx8mp: Add display pipeline components
      arm64: dts: imx8mp: Add support for Data Modul i.MX8M Plus eDM SBC

Markus Niebel (1):
      arm64: dts: imx93: add missing tpm pwm instances

Martin Kepplinger (4):
      arm64: dts: imx8mq-librem5: lower the mipi csi 1 frequencies
      arm64: dts: imx8mq-librem5: describe the clock for the csi sensors
      arm64: dts: imx8mq-librem5: fix audio-1v8 regulator name
      arm64: dts: imx8mq-librem5: add brightness levels to led-backlight

Max Krummenacher (1):
      arm64: dts: imx8-ss-dma: add io-channel-cells to adc nodes

Peng Fan (11):
      arm64: dts: imx8mq: tqma8mq-mba8mx: drop disable-over-current
      arm64: dts: imx8mp: verdin-yavia: drop disable-over-current
      arm64: dts: imx8dxl: drop clocks from scu clock controller
      arm64: dts: imx8-apalis-v1.1: drop ci-disable-lpm
      arm64: dts: imx8mn-evk: update i2c pinctrl to match dtschema
      arm64: dts: imx8mm-ddr4-evk: update gpmi pinctrl to match dtschema
      arm64: dts: imx8mq-librem5: update pinctrl to match dtschema
      arm64: dts: imx8mm-emcon: update pinctrl to match dtschema
      arm64: dts: imx8mn-bsh-smm: update pinctrl to match dtschema
      arm64: dts: imx8mm-prt8mm: update pinctrl to match dtschema
      arm64: dts: imx8mq-librem5: add missing #clock-cells

Philippe Schenker (24):
      arm64: dts: freescale: imx8-ss-lsio: add support for lsio_pwm0-3
      arm64: dts: freescale: imx8-ss-dma: set lpspi0 max frequency to 60mhz
      arm64: dts: colibri-imx8x: Prepare for qxp and dx variants
      arm64: dts: colibri-imx8x: Update spdx license
      arm64: dts: colibri-imx8x: Use new bracket format
      arm64: dts: colibri-imx8x: Add atmel pinctrl groups
      arm64: dts: colibri-imx8x: Add pinctrl group for csi_mclk
      arm64: dts: colibri-imx8x: Split pinctrl_hog1
      arm64: dts: colibri-imx8x: Correct pull on lcdif
      arm64: dts: colibri-imx8x: Add separate pinctrl group for cs2
      arm64: dts: colibri-imx8x: Add pinctrl group for hdmi hpd
      arm64: dts: colibri-imx8x: Add SPI
      arm64: dts: colibri-imx8x: Add gpio-line-names
      arm64: dts: colibri-imx8x: Disable touchscreen by default
      arm64: dts: colibri-imx8x: Add jpegenc/dec
      arm64: dts: colibri-imx8x: Add colibri pwm b, c, d
      arm64: dts: colibri-imx8x: eval: Add spi-to-can
      arm64: dts: colibri-imx8x: Add no-1-8-v to sd-card
      arm64: dts: colibri-imx8x: Set thermal thresholds
      arm64: dts: colibri-imx8x: Move gpio-keys to som level
      arm64: dts: colibri-imx8x: Add todo comments
      arm64: dts: colibri-imx8x: Add aster carrier board
      arm64: dts: colibri-imx8x: Add iris carrier board
      arm64: dts: colibri-imx8x: Add iris v2 carrier board

Richard Zhu (3):
      arm64: dts: Add i.MX8MM PCIe EP support
      arm64: dts: Add i.MX8MQ PCIe EP support
      arm64: dts: Add i.MX8MP PCIe EP support

Rob Herring (1):
      arm64: dts: layerscape: Fix GICv3 ITS node names

Sebastian Krzyszkowiak (10):
      arm64: dts: imx8mq: Add UART DMA support
      arm64: dts: imx8mq-librem5: Describe MIC_2V4 regulator
      arm64: dts: imx8mq-librem5: Set charger parameters for each batch
      arm64: dts: imx8mq-librem5: Set the DVS voltages lower
      arm64: dts: imx8mq-librem5: Bump usdhc2 frequency to 100MHz
      arm64: dts: imx8mq-librem5: Adjust proximity sensor's near levels
      arm64: dts: imx8mq-librem5: Remove dis_u3_susphy_quirk from usb_dwc3_0
      arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage to 0.81V
      arm64: dts: imx8mq-librem5: Reduce I2C frequency to 384kHz
      arm64: dts: imx8mq-librem5: Add 166MHz to DDRC OPP table

Stefan Eichenberger (1):
      arm64: dts: imx8mp-verdin: add 88W8997 serdev to uart4

Uwe Kleine-König (1):
      arm64: dts: imx8mp: Add GPT blocks

Zhou Peng (1):
      arm64: dts: imx8qm: add vpu decoder and encoder

 arch/arm64/boot/dts/freescale/Makefile             |   10 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |    2 +-
 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |  144 ++
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |  220 +++
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |  270 ++++
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 1484 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |   69 +
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     |   76 +-
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi    |   48 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |    2 +-
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |    4 +-
 arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dts  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi    |    4 +-
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |   13 +
 arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts    |    4 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   79 ++
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    |    6 +-
 .../arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts |    2 +-
 .../boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts    |    4 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |    4 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   55 +
 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |  977 +++++++++++++
 .../boot/dts/freescale/imx8mp-debix-model-a.dts    |   59 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts |   30 +-
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts |  306 ++++
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |   52 +-
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |    2 +
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   |    9 +-
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      |    9 +-
 .../boot/dts/freescale/imx8mp-verdin-wifi.dtsi     |    5 +
 .../boot/dts/freescale/imx8mp-verdin-yavia.dtsi    |    5 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |   15 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  135 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    2 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r2.dts |   12 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |    2 +-
 .../boot/dts/freescale/imx8mq-librem5-r3.dtsi      |   10 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r4.dts |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   79 +-
 .../boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |    2 -
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   40 +
 .../boot/dts/freescale/imx8qm-apalis-eval.dts      |   16 +
 .../dts/freescale/imx8qm-apalis-ixora-v1.1.dts     |   16 +
 .../boot/dts/freescale/imx8qm-apalis-v1.1-eval.dts |   16 +
 .../freescale/imx8qm-apalis-v1.1-ixora-v1.1.dts    |   16 +
 .../freescale/imx8qm-apalis-v1.1-ixora-v1.2.dts    |   16 +
 .../boot/dts/freescale/imx8qm-apalis-v1.1.dtsi     |   16 +
 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi   |  340 +++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |   44 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |    4 +
 .../boot/dts/freescale/imx8qxp-colibri-aster.dts   |   16 +
 .../boot/dts/freescale/imx8qxp-colibri-eval-v3.dts |    6 +-
 .../dts/freescale/imx8qxp-colibri-eval-v3.dtsi     |   62 -
 .../boot/dts/freescale/imx8qxp-colibri-iris-v2.dts |   16 +
 .../boot/dts/freescale/imx8qxp-colibri-iris.dts    |   16 +
 arch/arm64/boot/dts/freescale/imx8qxp-colibri.dtsi |  592 +-------
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   87 +-
 .../boot/dts/freescale/imx8x-colibri-aster.dtsi    |   44 +
 .../boot/dts/freescale/imx8x-colibri-eval-v3.dtsi  |   90 ++
 .../boot/dts/freescale/imx8x-colibri-iris-v2.dtsi  |   45 +
 .../boot/dts/freescale/imx8x-colibri-iris.dtsi     |  115 ++
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   |  776 ++++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi           |   47 +
 66 files changed, 5912 insertions(+), 745 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dts
 delete mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8x-colibri-iris-v2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
