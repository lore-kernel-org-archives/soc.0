Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFD9E7E62E
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 12:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55D73C433CA; Tue, 26 Sep 2023 12:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73144C433C8;
	Tue, 26 Sep 2023 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695731843;
	bh=HeAzOmb4gHqIunW4Em3wVSXPtDUqRUMXa9c6r2btXXo=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=VKDIjSOAVrd/2mpxSXOurFjaAoelCMHqbQjcUCs2GZ/0ruaZdxl1IFEnxwXuRSzrH
	 t7+LBUlgPYrChu/i/Wr6/tBvTLGBPbiDlgBcv5dJGbLxV4v0RFRUR4y8CR8eTHQXH1
	 hwR4gkddHVjJmxCCxEscmzXI4zwKk2srwn9Kj+fEAiFwp5yFtks8WSDxF4piJokeCn
	 fbwjl6+h7kOOssQ6ueKNNtzY07BBH0GYVeGzGB2/214sgf7pgHuChiLRr2ZXnU4+zU
	 Mf1QZG0j/y1Ftru3DJrtGPiNa1aYe4GOnSsireayhikQWeFYRoHz30z8OU9dkwicuV
	 uP4kbPq1XX5Pg==
Date: Tue, 26 Sep 2023 20:37:10 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.6
Message-ID: <20230926123710.GT7231@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.6

for you to fetch changes up to f09752eaf0e8f8befc26b44c4d3e15633e56d16a:

  arm64: dts: imx: Add imx8mm-prt8mm.dtb to build (2023-09-25 10:19:52 +0800)

----------------------------------------------------------------
i.MX fixes for 6.6:

- A couple of i.MX8MP device tree changes from Adam Ford to fix clock
  configuration regressions caused by 16c984524862 ("arm64: dts: imx8mp:
  don't initialize audio clocks from CCM node").
- Fix pmic-irq-hog GPIO line in imx93-tqma9352 device tree.
- Fix a mmemory leak with error handling path of imx_dsp_setup_channels()
  in imx-dsp driver.
- Fix HDMI node in imx8mm-evk device tree.
- Add missing clock enable functionality for imx8mm_soc_uid() function
  in soc-imx8m driver.
- Add missing imx8mm-prt8mm.dtb build target.

----------------------------------------------------------------
Adam Ford (2):
      arm64: dts: imx8mp: Fix SDMA2/3 clocks
      arm64: dts: imx8mp-beacon-kit: Fix audio_pll2 clock

Alexander Stein (1):
      arm64: dts: freescale: tqma9352: Fix gpio hog

Christophe JAILLET (1):
      firmware: imx-dsp: Fix an error handling path in imx_dsp_setup_channels()

Liu Ying (1):
      arm64: dts: imx8mm-evk: Fix hdmi@3d node

Nathan Rossi (1):
      soc: imx8m: Enable OCOTP clock for imx8mm before reading registers

Rob Herring (1):
      arm64: dts: imx: Add imx8mm-prt8mm.dtb to build

 arch/arm64/boot/dts/freescale/Makefile             |  1 +
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      | 32 ++++++++++++++--------
 .../arm64/boot/dts/freescale/imx8mp-beacon-kit.dts |  5 ++--
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  6 ++++
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  |  2 +-
 drivers/firmware/imx/imx-dsp.c                     |  1 +
 drivers/soc/imx/soc-imx8m.c                        | 10 +++++++
 7 files changed, 42 insertions(+), 15 deletions(-)
