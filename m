Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C468CC433F5
	for <soc@archiver.kernel.org>; Sat, 16 Oct 2021 14:02:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A2D33610D2; Sat, 16 Oct 2021 14:02:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51B10611C3;
	Sat, 16 Oct 2021 14:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634392936;
	bh=fAceuljAgSt4ycdaT0OV51wbYrC1XGwW6wCwEoSUElQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a1khe6s+DUEpyF8akg155GWXKXhO2ZXakDVyLpW4c8VmYqrjTz45El6hKC5DmQPDw
	 Wn2w8vdAnPSXrJjedctNhXt1Oc5OGtHNNEIRAmBfPiIZQ1u6kPj5bM2bcO4P9UBvD6
	 LwQcJ7xYyp09S7GRxxepZzP69yT5kx9KeuZgz2/1DvowVG0dota4muoqp0tc0MljFI
	 VaiFTNWrI7NNkaUG1ouznTcJTJQNb2g8/HY6jzfW8aawluXXKQkKiUcRcZzIq46eZj
	 7M2U40gc9B2jaGuFBg3sD/x6+/2VAkdKoK7t8NE2pXvPXYsH1iA/rk49tDbKmwl5s4
	 BSOxIBqQasfNw==
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
Subject: [GIT PULL 3/6] i.MX device tree changes for 5.16
Date: Sat, 16 Oct 2021 22:01:35 +0800
Message-Id: <20211016140138.1603-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016140138.1603-1-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

To resolve the dependency on a fix, the pull-request is built on commit
9b663b34c94a ("ARM: dts: imx6dl-yapp4: Fix lp5562 LED driver probe"),
which had landed on mainline.  Please consider to pull, thanks!

Shawn


The following changes since commit 9b663b34c94a78f39fa2c7a8271b1f828b546e16:

  ARM: dts: imx6dl-yapp4: Fix lp5562 LED driver probe (2021-09-22 11:06:49 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.16

for you to fetch changes up to 05e63b48b20fa70726be505a7660d1a07bc1cffb:

  ARM: dts: ls1021a-tsn: use generic "jedec,spi-nor" compatible for flash (2021-10-15 11:16:58 +0800)

----------------------------------------------------------------
i.MX device tree changes for 5.16:

- New board support: Kobo Libra H2O, Tolino Vision 5, SKOV LT2 and
  Colibri i.MX6ULL eMMC variants.
- A series from Fabio Estevam to correct SPI chipselect polarity for
  various i.MX6/7 boards.
- A couple of patches from Krzysztof Kozlowski to clean up unsupported
  properties from imx6dl-b1x5v2 and imx6dl-prtrvt boards.
- A series from Li Yang to clean up LS1021a based boards and add missing
  device nodes.
- A series from Matthias Schiffer to fix typo, add SPI-NOR flash and
  partition layout for imx7-tqma7/mba7 boards.
- Fix the schema check errors in i.MX PCIe device nodes.
- Other random and small fix-up and device additions.

----------------------------------------------------------------
Andreas Kemnade (6):
      ARM: dts: add Netronix E70K02 board common file
      ARM: dts: imx: add devicetree for Kobo Libra H2O
      ARM: dts: imx: add devicetree for Tolino Vision 5
      ARM: dts: imx: e60k02: correct led node name
      ARM: dts: imx6sl: fixup of operating points
      ARM: dts: imx6sll: fixup of operating points

Fabio Estevam (8):
      ARM: dts: imx6dl-alti6p: Fix the SPI chipselect polarity
      ARM: dts: imx6qp-prtwd3: Fix the SPI chipselect polarity
      ARM: dts: imx6qdl-tqma6: Fix the SPI chipselect polarity
      ARM: dts: imx7d-sdb: Fix the SPI chipselect polarity
      ARM: dts: imx6qdl-apalis: Avoid underscore in node name
      ARM: dts: imx6qdl-apalis: Pass 'io-channel-cells' to the ADC
      ARM: dts: imx6qdl-apalis: Add a label for the touchscreen
      ARM: dts: imx6qdl-apalis: Fix typo in ADC comment

Krzysztof Kozlowski (2):
      ARM: dts: imx6dl-b1x5v2: drop unsupported vcc-supply for MPL3115A2
      ARM: dts: imx6dl-prtrvt: drop undocumented TRF7970A NFC properties

Li Yang (16):
      ARM: dts: ls1021a: remove clock-names property for i2c nodes
      ARM: dts: ls1021a: change dma channels order to match schema
      ARM: dts: ls1021a: change to use SPDX identifiers
      ARM: dts: ls1021a-qds: Add node for QSPI flash
      ARM: dts: ls1021a: update pcie nodes for dt-schema check
      ARM: dts: ls1021a: fix board compatible to follow binding schema
      ARM: dts: ls1021a: breakup long values in thermal node
      ARM: dts: ls1021a: disable ifc node by default
      ARM: dts: ls1021a: remove regulators simple-bus
      ARM: dts: ls1021a: fix memory node for schema check
      ARM: dts: ls1021a: add #dma-cells to qdma node
      ARM: dts: ls1021a: add #power-domain-cells for power-controller node
      ARM: dts: ls1021a-qds: change fpga to simple-mfd device
      ARM: dts: ls1021a-tsn: remove undocumented property "position" from mma8452 node
      ARM: dts: ls1021a: move thermal-zones node out of soc/
      ARM: dts: ls1021a-tsn: use generic "jedec,spi-nor" compatible for flash

Matthias Schiffer (3):
      ARM: dts: imx7-tqma7/mba7: correct spelling of "TQ-Systems"
      ARM: dts: imx7-tqma7: add SPI-NOR flash
      ARM: dts: imx7-mba7: add default SPI-NOR flash partition layout

Max Krummenacher (1):
      ARM: dts: colibri-imx6ull-emmc: add device tree

Michal Vokáč (1):
      ARM: dts: imx6dl-yapp4: Remove the unused white LED channel

Oleksij Rempel (1):
      ARM: dts: imx6: skov: provide panel support for lt2 variants

Richard Zhu (1):
      ARM: dts: imx: fix the schema check errors

Yunus Bas (2):
      ARM: dts: imx6: phycore-som: Disable micro-SD write protection
      ARM: dts: imx6: phytec: Add gpio pinctrl for i2c bus recovery

 arch/arm/boot/dts/Makefile                         |   5 +-
 arch/arm/boot/dts/e60k02.dtsi                      |   2 +-
 arch/arm/boot/dts/e70k02.dtsi                      | 320 +++++++++++++++++++
 arch/arm/boot/dts/imx6dl-alti6p.dts                |   2 +-
 arch/arm/boot/dts/imx6dl-b1x5v2.dtsi               |   1 -
 arch/arm/boot/dts/imx6dl-prtrvt.dts                |   2 -
 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts         |   1 +
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi         |   8 -
 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts          |   1 +
 arch/arm/boot/dts/imx6qdl-apalis.dtsi              |   7 +-
 arch/arm/boot/dts/imx6qdl-phytec-mira.dtsi         |  31 +-
 arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi  |  12 +-
 arch/arm/boot/dts/imx6qdl-skov-revc-lt2.dtsi       |  99 ++++++
 arch/arm/boot/dts/imx6qdl-tqma6.dtsi               |   2 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     |   7 +-
 arch/arm/boot/dts/imx6qp-prtwd3.dts                |   4 +-
 arch/arm/boot/dts/imx6qp.dtsi                      |   2 +-
 arch/arm/boot/dts/imx6sl-tolino-vision5.dts        | 349 +++++++++++++++++++++
 arch/arm/boot/dts/imx6sl.dtsi                      |  18 +-
 arch/arm/boot/dts/imx6sll-kobo-librah2o.dts        | 339 ++++++++++++++++++++
 arch/arm/boot/dts/imx6sll.dtsi                     |  22 +-
 arch/arm/boot/dts/imx6sx.dtsi                      |   6 +-
 arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi   |  12 +-
 arch/arm/boot/dts/imx6ul-phytec-segin.dtsi         |   1 +
 arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dts |  17 +
 .../arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi | 185 +++++++++++
 arch/arm/boot/dts/imx6ull-colibri.dtsi             |  32 +-
 arch/arm/boot/dts/imx7-mba7.dtsi                   |  42 ++-
 arch/arm/boot/dts/imx7-tqma7.dtsi                  |  47 ++-
 arch/arm/boot/dts/imx7d-mba7.dts                   |   6 +-
 arch/arm/boot/dts/imx7d-sdb.dts                    |   2 +-
 arch/arm/boot/dts/imx7d-tqma7.dtsi                 |   4 +-
 arch/arm/boot/dts/imx7d.dtsi                       |   7 +-
 arch/arm/boot/dts/imx7s-mba7.dts                   |   6 +-
 arch/arm/boot/dts/imx7s-tqma7.dtsi                 |   4 +-
 arch/arm/boot/dts/ls1021a-qds.dts                  |  85 ++---
 arch/arm/boot/dts/ls1021a-tsn.dts                  |   4 +-
 arch/arm/boot/dts/ls1021a-twr.dts                  |  63 +---
 arch/arm/boot/dts/ls1021a.dtsi                     | 219 ++++++-------
 39 files changed, 1649 insertions(+), 327 deletions(-)
 create mode 100644 arch/arm/boot/dts/e70k02.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-revc-lt2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6sl-tolino-vision5.dts
 create mode 100644 arch/arm/boot/dts/imx6sll-kobo-librah2o.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi
