Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B824C43334
	for <soc@archiver.kernel.org>; Sat,  9 Jul 2022 08:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22B7CC341CA; Sat,  9 Jul 2022 08:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494B9C341CB;
	Sat,  9 Jul 2022 08:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657355423;
	bh=x9/406rfyPtIFI0wT/1m7327TFEwkbg9oUhhsf8uPUY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WInwcXobM5U5g9IU77MY344KhR8Oh3rwc2Ovopj3/2YpsPAR9jJTZZCOr2itYwKyp
	 Olm0pLKf4HoAoUU/ulPAbzm2wcq7AIkRg845PKB0fD8oNhJ3LgMQx5xgWWzSACf0us
	 0qsXjz7i9I+rS0QFB19df5eeXAI2Fo+5O66urK+EgGL/NMobmlAIvmaN6rbrsaLdHp
	 OPpJG6p3MqZuvC8EWDBEe4/PfhKkTp7igSBptZnSe7yl1Us4kZOZfCjkCIL2zexC+H
	 BjbTi8H8MwAaCRs2D0ONCJZb8s6NdwvcpYWXcF1k1G7siDIcNO6OLl1dHeatRu8Wtn
	 Qu/rGfmlaVRWA==
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
Subject: [GIT PULL 5/6] i.MX arm64 device tree update for 5.20
Date: Sat,  9 Jul 2022 16:29:50 +0800
Message-Id: <20220709082951.15123-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220709082951.15123-1-shawnguo@kernel.org>
References: <20220709082951.15123-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.20

for you to fetch changes up to 418d1d840e42183ac7f4dbaf40eca316b90fdd53:

  arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP (2022-07-09 10:49:39 +0800)

----------------------------------------------------------------
i.MX arm64 device tree update for 5.20:

- Add device tree support for i.MX93 SoC.
- New board device tree: TQMa8MPQL, DH electronics i.MX8M Plus DHCOM and
  PDK2, i.MX93 11x11 EVK, phyBOARD-Polis-i.MX8MM.
- A series from Abel Vesa and Viorel Suman to fix i.MX8QXP device tree
  to comply with DT schema.
- Disable job ring 0 device for i.MX8MM to avoid caam_jr probe error, due
  to that JR0 reservation is done in both upstream (v2.7) and downstream
  (NXP lf_v2.4) TF-A.
- A series from Krzysztof Kozlowski to align gpio-key and LED node names
  with dtschema.
- Add SNVS LPGPR device for i.MX8MM so that some preserving registers
  becomes available as NVMEM.
- Add NoC device support for i.MX8MP SoC.
- A couple of changes from Sean Anderson to add SFP node for TA devices
  for LayerScape SoCs.
- A series from Shengjiu Wang to enable bt-sco sound card support for
  NXP i.MX8M EVK boards.
- Other small and random board updates.

----------------------------------------------------------------
Abel Vesa (4):
      arm64: dts: freescale: imx8qxp: Fix thermal zone name for cpu0
      arm64: dts: freescale: imx8: Fix power controller name
      arm64: dts: freescale: imx8qxp: Add fallback compatible for clock controller
      arm64: dts: freescale: imx8qxp: Fix the keys node name

Alexander Stein (1):
      arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP

Fabio Estevam (4):
      arm64: dts: mba8mx: Remove unneeded comments
      arm64: dts: imx8m: Disable job ring 0 nodes
      arm64: dts: imx8m: Pass a label to the soc node
      arm64: dts: imx8mq: Pass a label to the AIPS nodes

Krzysztof Kozlowski (4):
      arm64: dts: fsl: ls1012a: fix Micron SPI NOR compatible
      arm64: dts: fsl: adjust whitespace around '='
      arm64: dts: freescale: align gpio-key node names with dtschema
      arm64: dts: freescale: align led node names with dtschema

Lucas Stach (1):
      arm64: dts: imx8mp-evk: add regulator supply to CPU nodes

Marek Vasut (2):
      arm64: dts: imx8mm: Add SNVS LPGPR
      arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM and PDK2

Peng Fan (5):
      arm64: dts: freescale: Add i.MX93 dtsi support
      arm64: dts: freescale: add i.MX93 11x11 EVK basic support
      arm64: dts: imx8ulp: address build warning
      arm64: dts: fsl-ls10xx: use generic dma node name
      arm64: dts: imx8mp: add NoC node

Philippe Schenker (1):
      arm64: dts: imx8m{m,p}-verdin: use IT temperatures

Sean Anderson (2):
      arm64: dts: layerscape: Add SFP node for TA 2.1 devices
      arm64: dts: Add SFP node for TA 3.0 devices

Shengjiu Wang (3):
      arm64: dts: imx8mm-evk: add bt-sco sound card support
      arm64: dts: imx8mq-evk: add bt-sco sound card support
      arm64: dts: imx8mn-evk: add bt-sco sound card support

Teresa Remmet (1):
      arm64: dts: freescale: Add phyBOARD-Polis-i.MX8MM support

Tim Harvey (1):
      arm64: dts: imx8mm-venice-gw7902: fix UART1 CTS

Uwe Kleine-König (1):
      arm64: freescale/imx8mp-evk.dts: reorder nodes alphabetically

Viorel Suman (3):
      arm64: dts: freescale: imx8qxp: Remove unnecessary clock related entries
      arm64: dts: freescale: imx8qxp: Fix the ocotp node name
      arm64: dts: freescale: imx8: Fix the system-controller node name

 arch/arm64/boot/dts/freescale/Makefile             |    4 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts  |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |   18 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   16 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |   20 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |   20 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |   10 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   16 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |   18 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts  |    4 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   16 +-
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  |    4 +-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |   10 +-
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |    4 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   43 +
 .../boot/dts/freescale/imx8mm-icore-mx8mm.dtsi     |   12 +-
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts  |    4 +-
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |  450 +++++++++
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |  440 +++++++++
 .../boot/dts/freescale/imx8mm-var-som-symphony.dts |    6 +-
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   |   24 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |    8 +-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   10 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |    6 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |   10 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   16 +-
 .../dts/freescale/imx8mn-beacon-baseboard.dtsi     |    4 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |   45 +-
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts |    6 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |    8 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   13 +-
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts |  163 ++++
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi | 1030 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   38 +-
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |  702 +++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi |  284 ++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |   10 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   31 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   43 +
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    6 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    4 +-
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts  |    6 +-
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   15 +-
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |    4 +-
 .../dts/freescale/imx8qxp-colibri-eval-v3.dtsi     |    8 +-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   14 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   14 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |  114 +++
 arch/arm64/boot/dts/freescale/imx93-pinfunc.h      |  623 ++++++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi           |  334 +++++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |    8 +-
 53 files changed, 4550 insertions(+), 172 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
 create mode 100755 arch/arm64/boot/dts/freescale/imx93-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx93.dtsi
