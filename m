Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB83C64E7C
	for <soc@archiver.kernel.org>; Wed,  2 Dec 2020 14:27:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D65602224B; Wed,  2 Dec 2020 14:27:48 +0000 (UTC)
From: Shawn Guo <shawnguo@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] i.MX DT bindings update for 5.11
Date: Wed,  2 Dec 2020 22:27:14 +0800
Message-ID: <20201202142717.9262-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142717.9262-1-shawnguo@kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Message-ID: <20201202142714.Gzq1tHbd0sUWKs2V4G2Nd-wZK3qLkdmyTFZa9LfUpfE@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.11

for you to fetch changes up to 747ec53ea72a548693d0664817776d3634e9b63a:

  dt-bindings: arm: fsl: add Protonic WD3 board (2020-12-01 09:27:55 +0800)

----------------------------------------------------------------
i.MX DT bindings update for 5.11:

- Quite some patches that update vendor-prefixes.yaml and fsl.yaml to
  document missing board compatibles and add new board compatibles.
- A couple of patches from Dong Aisheng to update imx-scu firmware and
  imx-lpcg clock bindings for new SCU two cells clock support.
- A couple of net bindings update from Ioana Ciornei to complete the
  MAC/PCS/PHY representation on DPAA2 devices.
- Document watchdog compatibles for all i.MX and Layerscape devices.

----------------------------------------------------------------
Bruno Thomsen (1):
      dt-bindings: fsl: add kamstrup flex concentrator to schema

Dong Aisheng (2):
      dt-bindings: firmware: imx-scu: new binding to parse clocks from device tree
      dt-bindings: clock: imx-lpcg: add support to parse clocks from device tree

Frieder Schrempf (1):
      dt-bindings: arm: fsl: Add Kontron i.MX8M Mini SoMs and boards

Ioana Ciornei (2):
      dt-bindings: net: add the DPAA2 MAC DTS definition
      dt-bindings: net: add the 10gbase-r connection type

Krzysztof Kozlowski (21):
      dt-bindings: arm: fsl: document i.MX25 and i.MX27 boards
      dt-bindings: watchdog: fsl-imx: document NXP compatibles
      dt-bindings: vendor-prefixes: add MicroSys
      dt-bindings: vendor-prefixes: add Revotics
      dt-bindings: arm: fsl: document i.MX51 boards
      dt-bindings: arm: fsl: document i.MX53 boards
      dt-bindings: arm: fsl: document VF boards
      dt-bindings: arm: fsl: document i.MX6DL boards
      dt-bindings: vendor-prefixes: add ABB
      dt-bindings: arm: fsl: document i.MX6DL Aristainetos boards
      dt-bindings: vendor-prefixes: add Element14
      dt-bindings: arm: fsl: document i.MX6Q boards
      dt-bindings: arm: fsl: document i.MX6QP boards
      dt-bindings: arm: fsl: document i.MX6SL boards
      dt-bindings: arm: fsl: document i.MX6SX boards
      dt-bindings: arm: fsl: document i.MX6UL boards
      dt-bindings: arm: fsl: document i.MX6ULL boards
      dt-bindings: arm: fsl: document i.MX7D boards
      dt-bindings: arm: fsl: document LS1012A FRWY board
      dt-bindings: arm: fsl: document SolidRun LX2160A boards
      dt-bindings: arm: fsl: document i.MX7S boards

Matthias Schiffer (1):
      dt-bindings: arm: fsl: update TQ-Systems SoMs and boards based on i.MX7

Meenakshi Aggarwal (1):
      dt-bindings: fsl: add compatible for LX2162A QDS Board

Oleksij Rempel (6):
      dt-bindings: vendor-prefixes: Add an entry for Van der Laan b.v.
      dt-bindings: vendor-prefixes: Add an entry for Altus-Escon-Company
      dt-bindings: arm: fsl: add Altesco I6P board
      dt-bindings: arm: fsl: add Van der Laan LANMCU board
      dt-bindings: vendor-prefixes: add "virtual" prefix
      dt-bindings: arm: fsl: add Protonic WD3 board

 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  12 +-
 Documentation/devicetree/bindings/arm/fsl.yaml     | 360 +++++++++++++++++++--
 .../devicetree/bindings/clock/imx8qxp-lpcg.yaml    |  79 +++--
 .../bindings/net/ethernet-controller.yaml          |   1 +
 .../bindings/net/fsl,qoriq-mc-dpmac.yaml           |  60 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  14 +
 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  |  16 +
 include/dt-bindings/clock/imx8-lpcg.h              |  14 +
 8 files changed, 502 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml
 create mode 100644 include/dt-bindings/clock/imx8-lpcg.h
