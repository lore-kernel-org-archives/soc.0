Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE591C433EF
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 16:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3FB4C340F3; Mon, 28 Feb 2022 16:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEA4C340F1
	for <soc@kernel.org>; Mon, 28 Feb 2022 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646066421;
	bh=JZ2IEi8B2xiT2teNn03pcH5jDOmY45Ss7Ss6C6zPwjk=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=EEC4Gcx9O/tQVj3ri30+TjubgtlNdS5F4Z1bZx4fbELmdb3+iAt4MHXhabYjXwCm2
	 mJ0Brxkg9W2CHInU4VNmoHKc1q7oX6iNfwDmOugaIAEF/mxY05LQHgcIFMZaER7naV
	 uYH5onaOfIwICipyLY/9YSAM+VlNOCrW9W5iwJnEvcvCsMjs7ChLq88mv2ZYZNqnzs
	 X8JEK4NLroxxO0w+cDourEZLmMFAr9tSuBZPteWV4U2JTC3lFU2IZl6tegbR9Vpj1d
	 B9RXac52pRDk+T+asJHZQV6kZHX7ZiC/LFWhQXOxbDpDwJ1it8LcLOitLVE3B9ZhLw
	 c5CHRs/EONN9g==
Received: by mail-wm1-f49.google.com with SMTP id n13-20020a05600c3b8d00b0037bff8a24ebso6073908wms.4
        for <soc@kernel.org>; Mon, 28 Feb 2022 08:40:21 -0800 (PST)
X-Gm-Message-State: AOAM533rl96RUOnn7prgo/uIOzaxXleW5ktnzQlDk/YByrPsggQGE854
	kjVpp8qDoReo8HZD2kFT72+ZbsIacnvWHhBrbIQ=
X-Google-Smtp-Source: ABdhPJwCxOGMtSHEHyPMgDnawgyKGiYtl8R9WWUJ+cPbtzVCLh7gg5naOv6D+xqinE+5V5Q6/bUQv8QzKd7TLaQmycw=
X-Received: by 2002:a7b:c001:0:b0:381:1afd:5caa with SMTP id
 c1-20020a7bc001000000b003811afd5caamr13937620wmb.35.1646066419814; Mon, 28
 Feb 2022 08:40:19 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 17:40:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2JGXOYJWWMga0bYbWA=x1yb5EpBUC4v+onpj0U=4e2pQ@mail.gmail.com>
Message-ID: <CAK8P3a2JGXOYJWWMga0bYbWA=x1yb5EpBUC4v+onpj0U=4e2pQ@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.17, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 754e0b0e35608ed5206d6a67a791563c631cec07:

  Linux 5.17-rc4 (2022-02-13 12:13:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-5.17-2

for you to fetch changes up to c253bf70c657b407286a6139d85c42fb41f3fcfd:

  Merge tag 'soc-fsl-fix-v5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux into arm/fixes
(2022-02-25 16:41:17 +0100)

----------------------------------------------------------------
ARM: SoC fixes for v5.17, part 2

The code changes address mostly minor problems:

 - Several NXP/FSL SoC driver fixes, addressing issues with error
   handling and compilation

 - Fix a clock disabling imbalance in gpcv2 driver.

 - Arm Juno DMA coherency issue

 - Trivial firmware driver fixes for op-tee and scmi firmware

The remaining changes address issues in the devicetree files:

 - a timer regression for the OMAP devkit8000, which has to use
   the alternative timer.

 - A hang in the i.MX8MM power domain configuration

 - Multiple fixes for the Rockchip RK3399 addressing issues
   with sound and eMMC

 - Cosmetic fixes for i.MX8ULP, RK3xxx, and Tegra124

----------------------------------------------------------------
Adam Ford (1):
      arm64: dts: imx8mm: Fix VPU Hanging

Alyssa Ross (1):
      firmware: arm_scmi: Remove space in MODULE_ALIAS name

Andy Shevchenko (3):
      soc: fsl: Replace kernel.h with the necessary inclusions
      soc: fsl: Correct MAINTAINERS database (QUICC ENGINE LIBRARY)
      soc: fsl: Correct MAINTAINERS database (SOC)

Anthoine Bourgeois (2):
      ARM: dts: switch timer config to common devkit8000 devicetree
      ARM: dts: Use 32KiHz oscillator on devkit8000

Arnd Bergmann (10):
      Merge tag 'at91-fixes-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/fixes
      Merge tag 'socfpga_dts_update_for_v5.18_part2' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/fixes
      Merge tag 'optee-fix2-for-v5.17' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'juno-fix-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'scmi-fix-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'v5.17-rockchip-dtsfixes1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/fixes
      Merge tag 'tegra-for-5.17-arm-dt-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/fixes
      Merge tag 'imx-fixes-5.17-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge tag 'omap-for-v5.17/fixes-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes
      Merge tag 'soc-fsl-fix-v5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux into arm/fixes

Brian Norris (1):
      arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output

Christophe JAILLET (2):
      soc: fsl: guts: Revert commit 3c0d64e867ed
      soc: fsl: guts: Add a missing memory allocation failure check

Corentin Labbe (1):
      ARM: dts: rockchip: fix a typo on rk3288 crypto-controller

Dinh Nguyen (2):
      dt-bindings: usb: dwc2: add compatible "intel,socfpga-agilex-hsotg"
      arm64: dts: agilex: use the compatible "intel,socfpga-agilex-hsotg"

Frank Wunderlich (2):
      arm64: dts: rockchip: fix dma-controller node names on rk356x
      arm64: dts: rockchip: drop pclk_xpcs from gmac0 on rk3568

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: fix rk3399-puma eMMC HS400 signal integrity

Jason Wang (1):
      soc: fsl: qe: fix typo in a comment

Jiasheng Jiang (1):
      soc: fsl: qe: Check of ioremap return value

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: align pl330 node name with dtschema

Laurent Pinchart (1):
      soc: imx: gpcv2: Fix clock disabling imbalance in error path

Li Yang (2):
      dt-bindings: qoriq-clock: add missing compatible for lx2160a
      dt-bindings: fsl,layerscape-dcfg: add missing compatible for lx2160a

Nicolas Ferre (2):
      MAINTAINERS: replace a Microchip AT91 maintainer
      dt-bindings: ARM: at91: update maintainers entry

Peter Geis (1):
      arm64: dts: rockchip: fix Quartz64-A ddr regulator voltage

Quentin Schulz (1):
      arm64: dts: rockchip: fix rk3399-puma-haikou USB OTG mode

Robin Murphy (1):
      arm64: dts: juno: Remove GICv2m dma-range

Sascha Hauer (2):
      arm64: dts: rockchip: reorder rk3399 hdmi clocks
      ARM: dts: rockchip: reorder rk322x hmdi clocks

Sudeep Holla (1):
      arm64: dts: imx8ulp: Set #thermal-sensor-cells to 1 as required

Thierry Reding (1):
      ARM: tegra: Move panels to AUX bus

Yang Yingliang (1):
      tee: optee: fix error return code in probe function

 CREDITS                                            |  6 ++++
 .../devicetree/bindings/arm/atmel-at91.yaml        |  3 +-
 .../bindings/arm/freescale/fsl,layerscape-dcfg.txt |  2 +-
 .../devicetree/bindings/clock/qoriq-clock.txt      |  1 +
 Documentation/devicetree/bindings/usb/dwc2.yaml    |  1 +
 MAINTAINERS                                        |  6 ++--
 arch/arm/boot/dts/omap3-devkit8000-common.dtsi     | 18 ++++++++++++
 arch/arm/boot/dts/omap3-devkit8000.dts             | 33 ----------------------
 arch/arm/boot/dts/rk322x.dtsi                      |  4 +--
 arch/arm/boot/dts/rk3288.dtsi                      |  2 +-
 arch/arm/boot/dts/tegra124-nyan-big.dts            | 15 ++++++----
 arch/arm/boot/dts/tegra124-nyan-blaze.dts          | 15 ++++++----
 arch/arm/boot/dts/tegra124-venice2.dts             | 14 ++++-----
 arch/arm64/boot/dts/arm/juno-base.dtsi             |  3 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  1 -
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |  2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |  4 +--
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       | 17 +++++++----
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      | 20 +++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  6 ++--
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |  2 --
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |  6 ++--
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  4 +--
 drivers/clocksource/timer-ti-dm-systimer.c         |  3 +-
 drivers/firmware/arm_scmi/driver.c                 |  2 +-
 drivers/soc/fsl/guts.c                             | 14 +++++----
 drivers/soc/fsl/qe/qe.c                            |  4 +--
 drivers/soc/fsl/qe/qe_io.c                         |  2 ++
 drivers/soc/imx/gpcv2.c                            |  3 +-
 drivers/tee/optee/ffa_abi.c                        |  4 ++-
 drivers/tee/optee/smc_abi.c                        |  4 ++-
 include/soc/fsl/dpaa2-fd.h                         |  3 +-
 include/soc/fsl/qe/immap_qe.h                      |  3 +-
 include/soc/fsl/qe/qe_tdm.h                        |  4 ++-
 include/soc/fsl/qe/ucc_fast.h                      |  2 +-
 include/soc/fsl/qe/ucc_slow.h                      |  2 +-
 39 files changed, 138 insertions(+), 102 deletions(-)
