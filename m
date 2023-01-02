Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A44AC4708E
	for <soc@archiver.kernel.org>; Mon,  2 Jan 2023 13:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 441CDC433F1; Mon,  2 Jan 2023 13:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522BFC433EF;
	Mon,  2 Jan 2023 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672665624;
	bh=pjKPiSVd/zhGPrMH62/ZthP11sQppZjNCecZL/U9QYg=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=oq+sOw1mKPd2TeAkLJN8RcrtjqwUOhndUUnZaSty68oM/swryiufDbSmvCpgJX+u1
	 NPNq6iWUpUkhXRm8UaB4agH827RwRwEHbPDkl68vvvY5OuMmDKK35kUUQtQilARzAb
	 Z1UsQwGEFxicLhyibWugSUBs/QCJ3NuqlSNHioZl5JJ3+LlN6NuMFdIDqviX0IWlns
	 39zObLK7JutgyyHdSHleXQaMlpKbg7XJIKsKlRMHQ6RUB1a/zw6YR+wH15UA454bMg
	 Nk3HMe32lX0mBKQhmKL7OhnQVjJK4wS37dlohlGithAVWbMdvJ25VYI2DiJzLSdtum
	 30SPeHfTO/3fw==
Date: Mon, 2 Jan 2023 21:20:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.2
Message-ID: <20230102132016.GA10699@T480>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.2

for you to fetch changes up to 490748874ebf1875420fc29b335bba2075dd1b5e:

  soc: imx8m: Fix incorrect check for of_clk_get_by_name() (2023-01-02 21:16:05 +0800)

----------------------------------------------------------------
i.MX fixes for 6.2:

- Fix i.MX8MP DT for missing GPC Interrupt, power-domain typo and USB
  clock error.
- Fix mach-imx cpu code to add missing of_node_put() call.
- A couple of verdin-imx8mm DT fixes for audio playback support.
- Fix pca9547 i2c-mux node name for i.MX and Vybrid device trees.
- Fix an imx93-11x11-evk uSDHC pad setting problem that causes Micron
  eMMC CMD8 CRC error in HS400ES/HS400 mode.
- A couple of imx8mp-blk-ctrl driver fixes from Lucas Stach, enabling
  pixclk with HDMI_TX_PHY PD, dropping power device name setting.
- Fix the error check for of_clk_get_by_name() in soc-imx8m driver.
- Other various DT fixes and cleanups.

----------------------------------------------------------------
Adam Ford (3):
      arm64: dts: imx8mm-beacon: Fix ecspi2 pinmux
      arm64: dts: imx8mp: Fix missing GPC Interrupt
      arm64: dts: imx8mp: Fix power-domain typo

Dario Binacchi (1):
      ARM: imx: add missing of_node_put()

Emanuele Ghidoli (2):
      arm64: dts: verdin-imx8mm: fix dahlia audio playback
      arm64: dts: verdin-imx8mm: fix dev board audio playback

Fabio Estevam (4):
      arm64: dts: imx8mp-phycore-som: Remove invalid PMIC property
      ARM: dts: imx6ul-pico-dwarf: Use 'clock-frequency'
      ARM: dts: imx7d-pico: Use 'clock-frequency'
      ARM: dts: imx6qdl-gw560x: Remove incorrect 'uart-has-rtscts'

Geert Uytterhoeven (3):
      ARM: dts: imx: Fix pca9547 i2c-mux node name
      ARM: dts: vf610: Fix pca9548 i2c-mux node names
      arm64: dts: freescale: Fix pca954x i2c-mux node names

Haibo Chen (1):
      arm64: dts: imx93-11x11-evk: correct clock and strobe pad setting

Krzysztof Kozlowski (1):
      arm64: dts: imx8mq-thor96: fix no-mmc property for SDHCI

Li Jun (1):
      arm64: dts: imx8mp: correct usb clocks

Lucas Stach (2):
      soc: imx: imx8mp-blk-ctrl: enable global pixclk with HDMI_TX_PHY PD
      soc: imx: imx8mp-blk-ctrl: don't set power device name

Marco Felsch (1):
      arm64: dts: imx8mp-evk: pcie0-refclk cosmetic cleanup

Marek Vasut (1):
      arm64: dts: imx8mm: Drop xtal clock specifier from eDM SBC

Miaoqian Lin (1):
      soc: imx8m: Fix incorrect check for of_clk_get_by_name()

Tim Harvey (1):
      arm64: dts: imx8mm-venice-gw7901: fix USB2 controller OC polarity

 arch/arm/boot/dts/imx53-ppd.dts                           |  2 +-
 arch/arm/boot/dts/imx6qdl-gw560x.dtsi                     |  1 -
 arch/arm/boot/dts/imx6ul-pico-dwarf.dts                   |  2 +-
 arch/arm/boot/dts/imx7d-pico-dwarf.dts                    |  4 ++--
 arch/arm/boot/dts/imx7d-pico-nymph.dts                    |  4 ++--
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts                 |  2 +-
 arch/arm/boot/dts/vf610-zii-dev-rev-c.dts                 |  2 +-
 arch/arm/mach-imx/cpu-imx25.c                             |  1 +
 arch/arm/mach-imx/cpu-imx27.c                             |  1 +
 arch/arm/mach-imx/cpu-imx31.c                             |  1 +
 arch/arm/mach-imx/cpu-imx35.c                             |  1 +
 arch/arm/mach-imx/cpu-imx5.c                              |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts         |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts         |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts         |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts         |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts         |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts       |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi        |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi        |  2 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi       |  2 +-
 .../arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi |  4 ++--
 .../boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts      |  2 +-
 arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts      |  2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts    |  1 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   |  1 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi      |  1 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts              |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi     | 10 ----------
 arch/arm64/boot/dts/freescale/imx8mp.dtsi                 | 15 ++++++++-------
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts         |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-thor96.dts           |  4 ++--
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts             |  2 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts         |  6 +++---
 drivers/soc/imx/imx8mp-blk-ctrl.c                         |  7 ++++---
 drivers/soc/imx/soc-imx8m.c                               |  4 ++--
 36 files changed, 53 insertions(+), 54 deletions(-)
