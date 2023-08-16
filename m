Return-Path: <SRS0=7/pu=EB=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6839CC27C41
	for <soc@archiver.kernel.org>; Wed, 16 Aug 2023 22:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F977C433CA; Wed, 16 Aug 2023 22:04:17 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 398D6C433C7;
	Wed, 16 Aug 2023 22:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 398D6C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875bbf.versanet.de ([83.135.91.191] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qWOcf-0007bd-AC; Thu, 17 Aug 2023 00:04:13 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.6 #1
Date: Thu, 17 Aug 2023 00:04:12 +0200
Message-ID: <40318909.XM6RcZxFsP@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.6-rockchip-drivers1

for you to fetch changes up to 6f6878ec6faf16a5f36761c93da6ea9cf09adb33:

  soc: rockchip: grf: Fix SDMMC not working on RK3588 with bus-width > 1 (2023-08-16 23:26:49 +0200)

----------------------------------------------------------------
PD_VO powerdomain for rv1126 and disabling of the automatic switch between
sdmmc and jtag for rk3588 (makes sdmmc unreliable).

This includes the shared genpd-v6.5-rc1-1 tag from Ulf Hansson, which moves
the powerdomain drivers into a new genpd subsystem.

----------------------------------------------------------------
Jagan Teki (1):
      genpd: rockchip: Add PD_VO entry for rv1126

Ondrej Jirman (1):
      soc: rockchip: grf: Fix SDMMC not working on RK3588 with bus-width > 1

Ulf Hansson (18):
      genpd: Create a new subsystem directory to host genpd providers
      soc: actions: Move power-domain driver to the genpd dir
      soc: amlogic: Move power-domain drivers to the genpd dir
      soc: apple: Move power-domain driver to the genpd dir
      soc: bcm: Move power-domain drivers to the genpd dir
      soc: imx: Move power-domain drivers to the genpd dir
      soc: mediatek: Move power-domain drivers to the genpd dir
      soc: qcom: Move power-domain drivers to the genpd dir
      soc: renesas: Move power-domain drivers to the genpd dir
      soc: rockchip: Mover power-domain driver to the genpd dir
      soc: samsung: Move power-domain driver to the genpd dir
      soc: starfive: Move the power-domain driver to the genpd dir
      soc: sunxi: Move power-domain driver to the genpd dir
      soc: tegra: Move powergate-bpmp driver to the genpd dir
      soc: ti: Mover power-domain drivers to the genpd dir
      soc: xilinx: Move power-domain driver to the genpd dir
      ARM: ux500: Convert power-domain code into a regular platform driver
      ARM: ux500: Move power-domain driver to the genpd dir

 MAINTAINERS                                        | 22 ++++++++++++----
 arch/arm/mach-ux500/Makefile                       |  1 -
 arch/arm/mach-ux500/cpu-db8500.c                   |  5 ----
 arch/arm/mach-ux500/pm_domains.h                   | 17 ------------
 drivers/Makefile                                   |  1 +
 drivers/genpd/Makefile                             | 16 ++++++++++++
 drivers/genpd/actions/Makefile                     |  2 ++
 drivers/{soc => genpd}/actions/owl-sps.c           |  0
 drivers/genpd/amlogic/Makefile                     |  4 +++
 drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c     |  0
 drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c |  0
 drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c |  0
 drivers/genpd/apple/Makefile                       |  2 ++
 .../apple/pmgr-pwrstate.c}                         |  0
 drivers/genpd/bcm/Makefile                         |  5 ++++
 drivers/{soc/bcm/bcm63xx => genpd/bcm}/bcm-pmb.c   |  0
 drivers/{soc => genpd}/bcm/bcm2835-power.c         |  0
 .../{soc/bcm/bcm63xx => genpd/bcm}/bcm63xx-power.c |  0
 drivers/{soc => genpd}/bcm/raspberrypi-power.c     |  0
 drivers/genpd/imx/Makefile                         |  7 +++++
 drivers/{soc => genpd}/imx/gpc.c                   |  0
 drivers/{soc => genpd}/imx/gpcv2.c                 |  0
 drivers/{soc => genpd}/imx/imx8m-blk-ctrl.c        |  0
 drivers/{soc => genpd}/imx/imx8mp-blk-ctrl.c       |  0
 drivers/{soc => genpd}/imx/imx93-blk-ctrl.c        |  0
 drivers/{soc => genpd}/imx/imx93-pd.c              |  0
 drivers/genpd/mediatek/Makefile                    |  3 +++
 .../{soc => genpd}/mediatek/mt6795-pm-domains.h    |  0
 .../{soc => genpd}/mediatek/mt8167-pm-domains.h    |  0
 .../{soc => genpd}/mediatek/mt8173-pm-domains.h    |  0
 .../{soc => genpd}/mediatek/mt8183-pm-domains.h    |  0
 .../{soc => genpd}/mediatek/mt8186-pm-domains.h    |  0
 .../{soc => genpd}/mediatek/mt8188-pm-domains.h    |  0
 .../{soc => genpd}/mediatek/mt8192-pm-domains.h    |  0
 .../{soc => genpd}/mediatek/mt8195-pm-domains.h    |  0
 drivers/{soc => genpd}/mediatek/mtk-pm-domains.c   |  0
 drivers/{soc => genpd}/mediatek/mtk-pm-domains.h   |  0
 drivers/{soc => genpd}/mediatek/mtk-scpsys.c       |  0
 drivers/genpd/qcom/Makefile                        |  4 +++
 drivers/{soc => genpd}/qcom/cpr.c                  |  0
 drivers/{soc => genpd}/qcom/rpmhpd.c               |  0
 drivers/{soc => genpd}/qcom/rpmpd.c                |  0
 drivers/genpd/renesas/Makefile                     | 30 ++++++++++++++++++++++
 drivers/{soc => genpd}/renesas/r8a7742-sysc.c      |  0
 drivers/{soc => genpd}/renesas/r8a7743-sysc.c      |  0
 drivers/{soc => genpd}/renesas/r8a7745-sysc.c      |  0
 drivers/{soc => genpd}/renesas/r8a77470-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a774a1-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a774b1-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a774c0-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a774e1-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a7779-sysc.c      |  0
 drivers/{soc => genpd}/renesas/r8a7790-sysc.c      |  0
 drivers/{soc => genpd}/renesas/r8a7791-sysc.c      |  0
 drivers/{soc => genpd}/renesas/r8a7792-sysc.c      |  0
 drivers/{soc => genpd}/renesas/r8a7794-sysc.c      |  0
 drivers/{soc => genpd}/renesas/r8a7795-sysc.c      |  0
 drivers/{soc => genpd}/renesas/r8a7796-sysc.c      |  0
 drivers/{soc => genpd}/renesas/r8a77965-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a77970-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a77980-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a77990-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a77995-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a779a0-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a779f0-sysc.c     |  0
 drivers/{soc => genpd}/renesas/r8a779g0-sysc.c     |  0
 drivers/{soc => genpd}/renesas/rcar-gen4-sysc.c    |  0
 drivers/{soc => genpd}/renesas/rcar-gen4-sysc.h    |  0
 drivers/{soc => genpd}/renesas/rcar-sysc.c         |  0
 drivers/{soc => genpd}/renesas/rcar-sysc.h         |  0
 drivers/{soc => genpd}/renesas/rmobile-sysc.c      |  0
 drivers/genpd/rockchip/Makefile                    |  2 ++
 .../pm_domains.c => genpd/rockchip/pm-domains.c}   |  1 +
 drivers/genpd/samsung/Makefile                     |  2 ++
 .../samsung/exynos-pm-domains.c}                   |  0
 drivers/genpd/st/Makefile                          |  2 ++
 .../genpd/st/ste-ux500-pm-domain.c                 | 25 ++++++++++++++----
 drivers/genpd/starfive/Makefile                    |  2 ++
 .../jh71xx_pmu.c => genpd/starfive/jh71xx-pmu.c}   |  0
 drivers/genpd/sunxi/Makefile                       |  2 ++
 drivers/{soc => genpd}/sunxi/sun20i-ppu.c          |  0
 drivers/genpd/tegra/Makefile                       |  2 ++
 drivers/{soc => genpd}/tegra/powergate-bpmp.c      |  0
 drivers/genpd/ti/Makefile                          |  3 +++
 drivers/{soc => genpd}/ti/omap_prm.c               |  0
 drivers/{soc => genpd}/ti/ti_sci_pm_domains.c      |  0
 drivers/genpd/xilinx/Makefile                      |  2 ++
 .../xilinx/zynqmp-pm-domains.c}                    |  0
 drivers/soc/actions/Makefile                       |  1 -
 drivers/soc/amlogic/Makefile                       |  3 ---
 drivers/soc/apple/Makefile                         |  2 --
 drivers/soc/bcm/Kconfig                            | 22 +++++++++++++++-
 drivers/soc/bcm/Makefile                           |  3 ---
 drivers/soc/bcm/bcm63xx/Kconfig                    | 21 ---------------
 drivers/soc/bcm/bcm63xx/Makefile                   |  3 ---
 drivers/soc/imx/Makefile                           |  7 +----
 drivers/soc/mediatek/Makefile                      |  2 --
 drivers/soc/qcom/Makefile                          |  3 ---
 drivers/soc/renesas/Makefile                       | 27 -------------------
 drivers/soc/rockchip/Makefile                      |  1 -
 drivers/soc/rockchip/grf.c                         | 14 ++++++++++
 drivers/soc/samsung/Makefile                       |  1 -
 drivers/soc/starfive/Makefile                      |  3 ---
 drivers/soc/sunxi/Makefile                         |  1 -
 drivers/soc/tegra/Makefile                         |  1 -
 drivers/soc/ti/Makefile                            |  2 --
 drivers/soc/xilinx/Makefile                        |  1 -
 107 files changed, 165 insertions(+), 115 deletions(-)
 delete mode 100644 arch/arm/mach-ux500/pm_domains.h
 create mode 100644 drivers/genpd/Makefile
 create mode 100644 drivers/genpd/actions/Makefile
 rename drivers/{soc => genpd}/actions/owl-sps.c (100%)
 create mode 100644 drivers/genpd/amlogic/Makefile
 rename drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c (100%)
 rename drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c (100%)
 rename drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c (100%)
 create mode 100644 drivers/genpd/apple/Makefile
 rename drivers/{soc/apple/apple-pmgr-pwrstate.c => genpd/apple/pmgr-pwrstate.c} (100%)
 create mode 100644 drivers/genpd/bcm/Makefile
 rename drivers/{soc/bcm/bcm63xx => genpd/bcm}/bcm-pmb.c (100%)
 rename drivers/{soc => genpd}/bcm/bcm2835-power.c (100%)
 rename drivers/{soc/bcm/bcm63xx => genpd/bcm}/bcm63xx-power.c (100%)
 rename drivers/{soc => genpd}/bcm/raspberrypi-power.c (100%)
 create mode 100644 drivers/genpd/imx/Makefile
 rename drivers/{soc => genpd}/imx/gpc.c (100%)
 rename drivers/{soc => genpd}/imx/gpcv2.c (100%)
 rename drivers/{soc => genpd}/imx/imx8m-blk-ctrl.c (100%)
 rename drivers/{soc => genpd}/imx/imx8mp-blk-ctrl.c (100%)
 rename drivers/{soc => genpd}/imx/imx93-blk-ctrl.c (100%)
 rename drivers/{soc => genpd}/imx/imx93-pd.c (100%)
 create mode 100644 drivers/genpd/mediatek/Makefile
 rename drivers/{soc => genpd}/mediatek/mt6795-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8167-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8173-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8183-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8186-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8188-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8192-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8195-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.c (100%)
 rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mtk-scpsys.c (100%)
 create mode 100644 drivers/genpd/qcom/Makefile
 rename drivers/{soc => genpd}/qcom/cpr.c (100%)
 rename drivers/{soc => genpd}/qcom/rpmhpd.c (100%)
 rename drivers/{soc => genpd}/qcom/rpmpd.c (100%)
 create mode 100644 drivers/genpd/renesas/Makefile
 rename drivers/{soc => genpd}/renesas/r8a7742-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7743-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7745-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77470-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a774a1-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a774b1-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a774c0-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a774e1-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7779-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7790-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7791-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7792-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7794-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7795-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7796-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77965-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77970-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77980-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77990-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77995-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a779a0-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a779f0-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a779g0-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/rcar-gen4-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/rcar-gen4-sysc.h (100%)
 rename drivers/{soc => genpd}/renesas/rcar-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/rcar-sysc.h (100%)
 rename drivers/{soc => genpd}/renesas/rmobile-sysc.c (100%)
 create mode 100644 drivers/genpd/rockchip/Makefile
 rename drivers/{soc/rockchip/pm_domains.c => genpd/rockchip/pm-domains.c} (99%)
 create mode 100644 drivers/genpd/samsung/Makefile
 rename drivers/{soc/samsung/pm_domains.c => genpd/samsung/exynos-pm-domains.c} (100%)
 create mode 100644 drivers/genpd/st/Makefile
 rename arch/arm/mach-ux500/pm_domains.c => drivers/genpd/st/ste-ux500-pm-domain.c (75%)
 create mode 100644 drivers/genpd/starfive/Makefile
 rename drivers/{soc/starfive/jh71xx_pmu.c => genpd/starfive/jh71xx-pmu.c} (100%)
 create mode 100644 drivers/genpd/sunxi/Makefile
 rename drivers/{soc => genpd}/sunxi/sun20i-ppu.c (100%)
 create mode 100644 drivers/genpd/tegra/Makefile
 rename drivers/{soc => genpd}/tegra/powergate-bpmp.c (100%)
 create mode 100644 drivers/genpd/ti/Makefile
 rename drivers/{soc => genpd}/ti/omap_prm.c (100%)
 rename drivers/{soc => genpd}/ti/ti_sci_pm_domains.c (100%)
 create mode 100644 drivers/genpd/xilinx/Makefile
 rename drivers/{soc/xilinx/zynqmp_pm_domains.c => genpd/xilinx/zynqmp-pm-domains.c} (100%)
 delete mode 100644 drivers/soc/bcm/bcm63xx/Kconfig
 delete mode 100644 drivers/soc/bcm/bcm63xx/Makefile
 delete mode 100644 drivers/soc/starfive/Makefile



