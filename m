Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD73C4338F
	for <soc@archiver.kernel.org>; Mon, 26 Jul 2021 02:32:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BD2C160EB4; Mon, 26 Jul 2021 02:32:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 345176052B;
	Mon, 26 Jul 2021 02:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627266747;
	bh=f9+bxKqv/Sbfs02pnB0L78IU7T9ttqigp+msLHtScBs=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=Zk+KQkClTxsxyaeayzoVYG+zkvbvhNUcfyw4YRy4FS4/uxcOhurAEkUiMIegbeaeB
	 f0HHoy2q5C2aG7Vot4ofJ+aVN90C+40E8vq5K3Zj+dhNxKLHXtJDx0R1LJ5kt0eA/A
	 RtWSQGqPIHJuMbQqns1x5boRP1tcUelAcS8w4F1KDVfAc/FlqiaZevJMzVVvynTu/F
	 XgQOGOwpBaBu9b5qkOiKhaL3vmwyXvOlGF0q/RHk3Tf9kPkMdh7SVTLY/XT8wiJj5W
	 NdRqFLAdtiMalfPx+d5IhkIV1bilKB/diHhDVnrT7N1lIrfsiApRDk6J41FvNk2BQ3
	 6HwkYfEMpoHwg==
Date: Mon, 26 Jul 2021 10:32:22 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.14
Message-ID: <20210726023221.GF5901@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.14

for you to fetch changes up to 3d9e30a52047f2d464efdfd1d561ae1f707a0286:

  ARM: dts: imx: Swap M53Menlo pinctrl_power_button/pinctrl_power_out pins (2021-07-23 16:14:07 +0800)

----------------------------------------------------------------
i.MX fixes for 5.14:

- A couple of fixes on MMDC driver to add missing iounmap() and
  clk_disable_unprepare(), and a follow-up fix.
- Fix missing-prototypes warning in SRC driver.
- Revert commit 7d981405d0fd ("soc: imx8m: change to use platform
  driver"), which breaks i.MX8M system that has CAAM driver enabled.
- One fix on imx53-m53menlo pinctrl configuration.
- Increase the PHY reset duration for imx6qdl-sr-som to fix intermittent
  issues where the PHY would be unresponsive every once in a while.
- Add missing flag for in-band signalling between PHY and MAC on
  kontron-sl28-var2 board to fix network support.
- Limit the SDIO Clock on Colibri iMX6ULL to 25MHz for fixing wireless
  noise issue.
- Fix sysclk node name for LS1028A so that U-Boot is able to update the
  "clock-frequency" property.

----------------------------------------------------------------
Colin Ian King (1):
      ARM: imx: fix missing 3rd argument in macro imx_mmdc_perf_init

Fabio Estevam (1):
      ARM: imx: common: Move prototype outside the SMP block

Lucas Stach (1):
      Revert "soc: imx8m: change to use platform driver"

Marek Vasut (1):
      ARM: dts: imx: Swap M53Menlo pinctrl_power_button/pinctrl_power_out pins

Maxime Chevallier (1):
      ARM: dts: imx6qdl-sr-som: Increase the PHY reset duration to 10ms

Michael Walle (1):
      arm64: dts: ls1028: sl28: fix networking for variant 2

Oleksandr Suvorov (1):
      ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz

Vladimir Oltean (1):
      arm64: dts: ls1028a: fix node name for the sysclk

Yang Yingliang (2):
      ARM: imx: add missing iounmap()
      ARM: imx: add missing clk_disable_unprepare()

 arch/arm/boot/dts/imx53-m53menlo.dts               |  4 +-
 arch/arm/boot/dts/imx6qdl-sr-som.dtsi              |  8 ++-
 arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi        |  1 +
 arch/arm/mach-imx/common.h                         |  2 +-
 arch/arm/mach-imx/mmdc.c                           | 17 ++++-
 .../freescale/fsl-ls1028a-kontron-sl28-var2.dts    |  2 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  2 +-
 drivers/soc/imx/soc-imx8m.c                        | 84 ++++------------------
 8 files changed, 40 insertions(+), 80 deletions(-)
