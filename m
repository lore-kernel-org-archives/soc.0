Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD7C54EED
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 02:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28F7BC433D2; Mon, 30 Jan 2023 02:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ADFC433EF;
	Mon, 30 Jan 2023 02:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675046424;
	bh=Fl7MrY9KAdhhkVQaK8TKcAkX5ewsxV/DJw73UCLnuzE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eIlk6od2xa8QO35Wei/r6m3UKAZuUFxgpqSt/9/HZwWbyUBle8Mq2Q2Oumu2TqMN5
	 F8CE9J2cNg4EEWNaOV3ZZnYmboFovAE3ZfOryHDu1tpW49RpnIfZtybY9XQw01rz8X
	 Or6v7bm7DA/BlJJRKbv1l/H2Wa05+VKZHtAU1KldqjnM4OyyPEIFfeVC5LhAg1fp4Z
	 TiuiZxvIBYoHtDYWozYkwOtLvPTFZxtxWGU3bHy+E+NAvPF80mtXzayUFtryVR3iH5
	 rdIP2eR+lJQ8+E16dd8ahJo8mtRlN0xtZnqwxSoJIGv3aw3/+V2DmyweGA2kYKBAbl
	 NbA2n6K2sYR8w==
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
Subject: [GIT PULL 4/6] i.MX arm device tree change for 6.3
Date: Mon, 30 Jan 2023 10:39:45 +0800
Message-Id: <20230130023947.11780-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230130023947.11780-1-shawnguo@kernel.org>
References: <20230130023947.11780-1-shawnguo@kernel.org>

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.3

for you to fetch changes up to addaaf0a18b7964913a289f5933f618974a408b3:

  ARM: dts: imx6ull-dhcom: Add DHSOM based DRC02 board (2023-01-30 09:57:12 +0800)

----------------------------------------------------------------
i.MX arm device tree change for 6.3:

- New board support: SK-iMX53, DHCOM i.MX6ULL based boards.
- Increase MMC maximum frequency for i.MXRT1050.
- A series from Krzysztof Kozlowski to align LED node names with
  dtschema, and use use generic node name for rave-sp device.
- Use new media bus type macros for i.MX device trees.
- A series from Marcel Ziswiler to improve gpio-key for Colibri and
  Apalis device trees.
- A series from Marek Vasut to drop interrupt-names from dma-apb device.
- A series from Philippe Schenker to disable USB over-current for
  Colibri and Apalis boards.
- A few other small corrections and random changes.

----------------------------------------------------------------
Alexander Stein (2):
      ARM: dts: tqma6ul + mba6ulx: Fix temperature sensor compatible
      ARM: dts: ls1021a: Disable CAN nodes by default

Andreas Kemnade (1):
      ARM: dts: imx: e70k02: Add touchscreen

Christoph Niedermaier (3):
      ARM: dts: imx6ull-dhcom: Add DH electronics DHCOM i.MX6ULL SoM and PDK2 board
      ARM: dts: imx6ull-dhcom: Add DHCOM based PicoITX board
      ARM: dts: imx6ull-dhcom: Add DHSOM based DRC02 board

Dmitry Baryshkov (1):
      ARM: dts: imx: Add support for SK-iMX53 board

Fabio Estevam (2):
      ARM: dts: imx53: Fix sram.yaml warnings
      ARM: dts: imx51: Fix sram.yaml warnings

Giulio Benetti (1):
      ARM: dts: imxrt1050: increase mmc max-frequency property

Krzysztof Kozlowski (3):
      ARM: dts: imx: align LED node names with dtschema
      ARM: dts: vf610: align LED node names with dtschema
      ARM: dts: imx: use generic node name for rave-sp

Laurent Pinchart (1):
      ARM: dts: freescale: Use new media bus type macros

Marcel Ziswiler (3):
      ARM: dts: colibri-imx6: improve wake-up with gpio key
      ARM: dts: colibri-imx6ull: improve wake-up with gpio key
      ARM: dts: apalis/colibri-imx6/6ull/7: proper gpio-key node names

Marek Vasut (6):
      ARM: dts: mxs: Drop dma-apb interrupt-names
      ARM: dts: imx6qdl: Drop dma-apb interrupt-names
      ARM: dts: imx6sx: Drop dma-apb interrupt-names
      ARM: dts: imx6ul: Drop dma-apb interrupt-names
      ARM: dts: imx7s: Drop dma-apb interrupt-names
      ARM: dts: vfxxx: Swap SAI DMA order

Nikolaus Voss (1):
      ARM: dts: imx6qdl: use MAC-address from nvmem

Peng Fan (1):
      ARM: dts: imx7s: correct iomuxc gpr mux controller cells

Philippe Schenker (4):
      ARM: dts: apalis-imx6: Disable usb over-current
      ARM: dts: colibri-imx6: Disable usb over-current
      ARM: dts: colibri-imx6ull: Disable usb over-current
      ARM: dts: colibri-imx7: Disable usb over-current

 arch/arm/boot/dts/Makefile                         |   4 +
 arch/arm/boot/dts/e70k02.dtsi                      |  11 +-
 arch/arm/boot/dts/imx23.dtsi                       |   2 -
 arch/arm/boot/dts/imx28.dtsi                       |   8 -
 arch/arm/boot/dts/imx50-kobo-aura.dts              |   2 +-
 arch/arm/boot/dts/imx51-zii-rdu1.dts               |   2 +-
 arch/arm/boot/dts/imx51-zii-scu2-mezz.dts          |   2 +-
 arch/arm/boot/dts/imx51-zii-scu3-esb.dts           |   2 +-
 arch/arm/boot/dts/imx51.dtsi                       |   3 +
 arch/arm/boot/dts/imx53-cx9020.dts                 |  10 +-
 arch/arm/boot/dts/imx53-m53evk.dts                 |   4 +-
 arch/arm/boot/dts/imx53-m53menlo.dts               |   6 +-
 arch/arm/boot/dts/imx53-sk-imx53.dts               | 357 ++++++++++++
 arch/arm/boot/dts/imx53-tx53.dtsi                  |   2 +-
 arch/arm/boot/dts/imx53-usbarmory.dts              |   2 +-
 arch/arm/boot/dts/imx53.dtsi                       |   3 +
 arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi              |   6 +-
 arch/arm/boot/dts/imx6dl-colibri-aster.dts         |   2 +
 arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts       |   2 +
 arch/arm/boot/dts/imx6dl-colibri-iris.dts          |   2 +
 arch/arm/boot/dts/imx6dl-riotboard.dts             |   4 +-
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi         |   6 +-
 arch/arm/boot/dts/imx6q-apalis-eval.dts            |   2 +
 arch/arm/boot/dts/imx6q-apalis-ixora-v1.2.dts      |   2 +
 arch/arm/boot/dts/imx6q-apalis-ixora.dts           |   2 +
 arch/arm/boot/dts/imx6q-gw5400-a.dts               |   6 +-
 arch/arm/boot/dts/imx6q-h100.dts                   |   6 +-
 arch/arm/boot/dts/imx6q-kp.dtsi                    |   4 +-
 arch/arm/boot/dts/imx6q-marsboard.dts              |   4 +-
 arch/arm/boot/dts/imx6q-tbs2910.dts                |   2 +-
 arch/arm/boot/dts/imx6qdl-apalis.dtsi              |   3 +-
 arch/arm/boot/dts/imx6qdl-colibri.dtsi             |   5 +-
 arch/arm/boot/dts/imx6qdl-emcon.dtsi               |   4 +-
 arch/arm/boot/dts/imx6qdl-gw51xx.dtsi              |   4 +-
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi              |   6 +-
 arch/arm/boot/dts/imx6qdl-gw53xx.dtsi              |   6 +-
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi              |   6 +-
 arch/arm/boot/dts/imx6qdl-gw551x.dtsi              |   2 +-
 arch/arm/boot/dts/imx6qdl-gw552x.dtsi              |   6 +-
 arch/arm/boot/dts/imx6qdl-gw553x.dtsi              |   4 +-
 arch/arm/boot/dts/imx6qdl-gw560x.dtsi              |   6 +-
 arch/arm/boot/dts/imx6qdl-gw5903.dtsi              |   2 +-
 arch/arm/boot/dts/imx6qdl-gw5904.dtsi              |   6 +-
 arch/arm/boot/dts/imx6qdl-gw5907.dtsi              |   4 +-
 arch/arm/boot/dts/imx6qdl-gw5910.dtsi              |   6 +-
 arch/arm/boot/dts/imx6qdl-gw5912.dtsi              |   6 +-
 arch/arm/boot/dts/imx6qdl-gw5913.dtsi              |   4 +-
 arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi           |  10 +-
 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi       |   4 +-
 arch/arm/boot/dts/imx6qdl-phytec-mira.dtsi         |   6 +-
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi       |   4 +-
 arch/arm/boot/dts/imx6qdl-rex.dtsi                 |   2 +-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi           |   2 +-
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi             |   2 +-
 arch/arm/boot/dts/imx6qdl-ts7970.dtsi              |   4 +-
 arch/arm/boot/dts/imx6qdl-tx6.dtsi                 |   2 +-
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi            |   2 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     |   7 +-
 arch/arm/boot/dts/imx6sl-evk.dts                   |   2 +-
 arch/arm/boot/dts/imx6sl-tolino-vision5.dts        |   7 +
 arch/arm/boot/dts/imx6sll-evk.dts                  |   2 +-
 arch/arm/boot/dts/imx6sll-kobo-librah2o.dts        |   7 +
 arch/arm/boot/dts/imx6sx-sabreauto.dts             |   2 +-
 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi             |   4 +-
 arch/arm/boot/dts/imx6sx.dtsi                      |   1 -
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi            |   4 +-
 arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi   |   2 +-
 arch/arm/boot/dts/imx6ul-tqma6ul-common.dtsi       |   4 +-
 arch/arm/boot/dts/imx6ul-tx6ul.dtsi                |   2 +-
 arch/arm/boot/dts/imx6ul.dtsi                      |   1 -
 arch/arm/boot/dts/imx6ull-colibri-aster.dtsi       |   2 +
 arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi     |   2 +
 arch/arm/boot/dts/imx6ull-colibri-iris.dtsi        |   2 +
 arch/arm/boot/dts/imx6ull-colibri.dtsi             |   4 +-
 arch/arm/boot/dts/imx6ull-dhcom-drc02.dts          |  99 ++++
 arch/arm/boot/dts/imx6ull-dhcom-pdk2.dts           | 222 ++++++++
 arch/arm/boot/dts/imx6ull-dhcom-picoitx.dts        | 101 ++++
 .../arm/boot/dts/imx6ull-dhcom-som-cfg-sdcard.dtsi |  97 ++++
 arch/arm/boot/dts/imx6ull-dhcom-som.dtsi           | 633 +++++++++++++++++++++
 arch/arm/boot/dts/imx6ull-dhcor-som.dtsi           | 255 +++++++++
 arch/arm/boot/dts/imx7-colibri-aster.dtsi          |   1 +
 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi        |   1 +
 arch/arm/boot/dts/imx7-colibri-iris-v2.dtsi        |   1 +
 arch/arm/boot/dts/imx7-colibri-iris.dtsi           |   1 +
 arch/arm/boot/dts/imx7-colibri.dtsi                |   2 +-
 arch/arm/boot/dts/imx7d-colibri-aster.dts          |   1 +
 arch/arm/boot/dts/imx7d-colibri-emmc-aster.dts     |   1 +
 arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dts   |   1 +
 arch/arm/boot/dts/imx7d-colibri-emmc-iris-v2.dts   |   1 +
 arch/arm/boot/dts/imx7d-colibri-emmc-iris.dts      |   1 +
 arch/arm/boot/dts/imx7d-colibri-emmc.dtsi          |   1 +
 arch/arm/boot/dts/imx7d-colibri-eval-v3.dts        |   1 +
 arch/arm/boot/dts/imx7d-colibri-iris-v2.dts        |   1 +
 arch/arm/boot/dts/imx7d-colibri-iris.dts           |   1 +
 arch/arm/boot/dts/imx7d-zii-rmu2.dts               |   2 +-
 arch/arm/boot/dts/imx7d-zii-rpu2.dts               |   2 +-
 arch/arm/boot/dts/imx7s.dtsi                       |   3 +-
 arch/arm/boot/dts/imxrt1050.dtsi                   |   2 +-
 arch/arm/boot/dts/ls1021a.dtsi                     |   4 +
 arch/arm/boot/dts/mba6ulx.dtsi                     |   2 +-
 arch/arm/boot/dts/vf610-bk4.dts                    |   2 +-
 arch/arm/boot/dts/vf610-zii-dev.dtsi               |   2 +-
 arch/arm/boot/dts/vf610-zii-scu4-aib.dts           |   2 +-
 arch/arm/boot/dts/vf610-zii-spb4.dts               |   2 +-
 arch/arm/boot/dts/vf610-zii-ssmb-spu3.dts          |   2 +-
 arch/arm/boot/dts/vfxxx.dtsi                       |  20 +-
 106 files changed, 1965 insertions(+), 145 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx53-sk-imx53.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-dhcom-drc02.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-dhcom-pdk2.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-dhcom-picoitx.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-dhcom-som-cfg-sdcard.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-dhcom-som.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-dhcor-som.dtsi
