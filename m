Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C54FA373D
	for <soc@archiver.kernel.org>; Tue,  1 Nov 2022 03:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ABF9BC43470; Tue,  1 Nov 2022 03:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CD6C433C1;
	Tue,  1 Nov 2022 03:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667272554;
	bh=9nCzKG1OoiZ7SIb8k1BwqDTHzNXUkAISJTRP6bUTYgE=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=b1wl48nFb8T9f96lAxBYP3D4EghPm8x/anXaX0gZIxao5gSlDf8T/8G2zkRcoN3mI
	 BFvfuFfCT5Fzu60KmLXE65AR0kXMosswKGocMktPUKiGb1MnZT/nm8R43v1HKjGgeS
	 H+RrdTNgsD5SShA5hKGZ0i79Ft2RLlbEvvRWeF4ttKmi0IFMw7rBQcPk4KEtkmxQiM
	 GNGTDCwStUSPlQ8zvMDxE4OSqv+RgXpgNVpJ7Yy7jOgP0X3Wav95iyH+fTlTxLhpsu
	 wa/7KHU1LwTYKw0YgN/ldLR0hR32pXQk5e9PSewtlkKeWy7//wAIsMrftC/axlWzRQ
	 g/RLhfqDtPuDA==
Date: Tue, 1 Nov 2022 11:15:47 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.1
Message-ID: <20221101031547.GB125525@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.1

for you to fetch changes up to d5c921a53c80dfa942f6dff36253db5a50775a5f:

  arm64: dts: ls208xa: specify clock frequencies for the MDIO controllers (2022-10-29 20:31:24 +0800)

----------------------------------------------------------------
i.MX fixes for 6.1:

- Fix imx93-pd driver to release resources when error occurs in probe.
- A series from Ioana Ciornei to add missing clock frequencies for MDIO
  controllers on LayerScape SoCs, so that the kernel driver can work
  independently from bootloader.
- A series from Li Jun to fix USB power domain setup in i.MX8MM/N device
  trees.
- Fix CPLD_Dn pull configuration for MX8Menlo board to avoid interfering
  with CPLD power off functionality.
- Fix ctrl_sleep_moci GPIO setup for verdin-imx8mp board.
- Fix DT schema check warnings on uSDHC clocks for imx8-ss-conn device
  tree.
- Fix up gpcv2 DT bindings to have an optional `power-domains` property.
- A couple of i.MX93 device tree fixes on S4MU interrupt and gpio-ranges
  of GPIO controllers.
- Keep PU regulator on for Quad and QuadPlus based imx6dl-yapp4 boards to
  work around a hardware design flaw in supply voltage distribution.
- Fix user push-button GPIO offset on imx6qdl-gw59 boards.

----------------------------------------------------------------
Christophe JAILLET (1):
      soc: imx: imx93-pd: Fix the error handling path of imx93_pd_probe()

Ioana Ciornei (3):
      arm64: dts: lx2160a: specify clock frequencies for the MDIO controllers
      arm64: dts: ls1088a: specify clock frequencies for the MDIO controllers
      arm64: dts: ls208xa: specify clock frequencies for the MDIO controllers

Li Jun (4):
      arm64: dts: imx8mm: remove otg1/2 power domain dependency on hsio
      arm64: dts: imx8mm: correct usb power domains
      arm64: dts: imx8mn: remove otg1 power domain dependency on hsio
      arm64: dts: imx8mn: Correct the usb power domain

Marek Vasut (1):
      arm64: dts: imx8mm: Enable CPLD_Dn pull down resistor on MX8Menlo

Max Krummenacher (1):
      arm64: dts: verdin-imx8mp: fix ctrl_sleep_moci

Peng Fan (4):
      arm64: dts: imx8: correct clock order
      dt-bindings: power: gpcv2: add power-domains property
      arm64: dts: imx93: correct s4mu interrupt names
      arm64: dts: imx93: correct gpio-ranges

Petr Benes (1):
      ARM: dts: imx6dl-yapp4: Do not allow PM to switch PU regulator off on Q/QP

Tim Harvey (1):
      ARM: dts: imx6qdl-gw59{10,13}: fix user pushbutton GPIO offset

 .../devicetree/bindings/power/fsl,imx-gpcv2.yaml     |  3 +++
 arch/arm/boot/dts/imx6q-yapp4-crux.dts               |  4 ++++
 arch/arm/boot/dts/imx6qdl-gw5910.dtsi                |  2 +-
 arch/arm/boot/dts/imx6qdl-gw5913.dtsi                |  2 +-
 arch/arm/boot/dts/imx6qp-yapp4-crux-plus.dts         |  4 ++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi       |  6 ++++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi       |  6 ++++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi       |  6 ++++++
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi      | 18 +++++++++---------
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts    | 16 ++++++++--------
 arch/arm64/boot/dts/freescale/imx8mm.dtsi            |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8mn.dtsi            |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi     | 20 ++++++++++----------
 arch/arm64/boot/dts/freescale/imx93.dtsi             | 11 ++++++-----
 drivers/soc/imx/imx93-pd.c                           | 17 +++++++++++++++--
 15 files changed, 85 insertions(+), 42 deletions(-)
