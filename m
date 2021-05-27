Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAD4C47089
	for <soc@archiver.kernel.org>; Thu, 27 May 2021 01:18:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9C8E5613CD; Thu, 27 May 2021 01:18:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E4C961059;
	Thu, 27 May 2021 01:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622078284;
	bh=mrU0f/4PzECYrgli7WZl27Qts9aZpcs3dMPNJ7AnXHA=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=Ez25bpDkQsBn694hIm9x4bj/1ZgDGxHacQjxslECtVOfwjS2XxnU3htOP1RO+6S/W
	 oblrjzrJDq8pFrEbqfYdbFetfKjWwZl0U9buGJ16ToOdlRNvJKqwPAg9Qi24CmrUYk
	 6WaNH0ZqZlBAZkH8BJBdavLI9Xl1YSMCfoBeB7YtvUZ52BUuvrwbiQPWW5ZByuJom5
	 mJ50G32MnSe9mlkzRB4hVXsUsv90L3kD7qe+qYfJm9IsHqcPE/9mLcEe85YUbm916+
	 1eow0VIUmerzAW0UhwobZY5hzPgDZLvK604kO2l30In1MfaxjnH7Ma/ALFSP9RuDj9
	 ybQJOUrgpaZ1Q==
Date: Thu, 27 May 2021 09:17:59 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.13
Message-ID: <20210527011758.GD8194@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.13

for you to fetch changes up to b73eb6b3b91ff7d76cff5f8c7ab92fe0c51e3829:

  ARM: dts: imx: emcon-avari: Fix nxp,pca8574 #gpio-cells (2021-05-23 13:36:59 +0800)

----------------------------------------------------------------
i.MX fixes for 5.13:

- Fix missing-prototypes warning of 'imx27_pm_init' in i.MX27 platform
  pm code.
- A couple of patches from Fabio Estevam to fix 'tuning-step' property
  in imx7d-meerkat96 and imx7d-pico DT.
- Fix '#gpio-cells' of nxp,pca8574 device in imx6qdl-emcon-avari DT.
- A couple of patches from Lucas Stach to fix regulator and voltage for
  imx8mq-zii-ultra board.
- Add missing regulators for imx6q-dhcom to avoid possible instability
  issues.
- Fix memory-controller settings for fsl-ls1028a DT.
- Fix RGMII clock and voltage for a couple of fsl-ls1028a-kontron-sl28
  boards.
- Fix RGMII connection to QCA8334 switch for imx6dl-yapp4 board.

----------------------------------------------------------------
Fabio Estevam (3):
      ARM: imx: pm-imx27: Include "common.h"
      ARM: dts: imx7d-meerkat96: Fix the 'tuning-step' property
      ARM: dts: imx7d-pico: Fix the 'tuning-step' property

Geert Uytterhoeven (1):
      ARM: dts: imx: emcon-avari: Fix nxp,pca8574 #gpio-cells

Lucas Stach (2):
      arm64: dts: zii-ultra: remove second GEN_3V3 regulator instance
      arm64: dts: zii-ultra: fix 12V_MAIN voltage

Marek Vasut (1):
      ARM: dts: imx6q-dhcom: Add PU,VDD1P1,VDD2P5 regulators

Michael Walle (3):
      arm64: dts: ls1028a: fix memory node
      arm64: dts: freescale: sl28: var4: fix RGMII clock and voltage
      arm64: dts: freescale: sl28: var1: fix RGMII clock and voltage

Michal Vokáč (1):
      ARM: dts: imx6dl-yapp4: Fix RGMII connection to QCA8334 switch

 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi         |  6 +++++-
 arch/arm/boot/dts/imx6q-dhcom-som.dtsi             | 12 +++++++++++
 arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi         |  2 +-
 arch/arm/boot/dts/imx7d-meerkat96.dts              |  2 +-
 arch/arm/boot/dts/imx7d-pico.dtsi                  |  2 +-
 arch/arm/mach-imx/pm-imx27.c                       |  1 +
 .../freescale/fsl-ls1028a-kontron-sl28-var1.dts    |  3 ++-
 .../freescale/fsl-ls1028a-kontron-sl28-var4.dts    |  5 ++---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  4 ++--
 .../boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts   | 10 +++++-----
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi | 23 +++++++---------------
 11 files changed, 39 insertions(+), 31 deletions(-)
