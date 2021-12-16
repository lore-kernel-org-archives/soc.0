Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27281C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 21:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CA45C36AEA; Thu, 16 Dec 2021 21:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB38C36AE9
	for <soc@kernel.org>; Thu, 16 Dec 2021 21:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639689821;
	bh=kQEe/9F97cQuoBhsW/RYNf5vjhRItzfA89nH9Zjgc1I=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=CaY06NNWGfiUW4HkeIad1eTN8SxL8O0EAPKBAB78XtLq62iJ0/gbCa+3noh6q4A+4
	 YtiphIIVwZFGuoT67pIjJSCiM9qfMLcfXfNjX2eP2JioHKVVp5S/0NhUojmwnSJnqh
	 2trDujfyiR1p3uVz7PWmyB5eLBZsecmifcU2iA9EET3yHWaWQpjeTbG+1XORFxzvvN
	 pXSGZc31gqeYbAkJ1z3lQ3Op/n3Ve0R4YSPFjyo1NuTVj/YzhXy8+4w6NsFmUvXZt9
	 ldIWVbunwk8Uaf+wOEA9MgmfD3yC5RBz/WuYtVJSA5lMg2XALi56p4SdRBvshM8Kpl
	 13DDveVtK7+ag==
Received: by mail-wr1-f51.google.com with SMTP id j18so412634wrd.2
        for <soc@kernel.org>; Thu, 16 Dec 2021 13:23:40 -0800 (PST)
X-Gm-Message-State: AOAM530rIWS0XhN0GIJoO5DU47y63XhiRHZvvkj+NIKA8gnArqRGNrZQ
	AX0rqZ/TaM5bSDs2NbAiyR7FSUZoG/YV+AnWjes=
X-Google-Smtp-Source: ABdhPJxTKDqsdPyxr0x9aLcBOFr6XyLV3INpoLbwNnYEd8ExF0RPPjW8L1w6aq2j6uowWCeA4pgOdFilrp2NQqZEV6I=
X-Received: by 2002:adf:f051:: with SMTP id t17mr230776wro.192.1639689819275;
 Thu, 16 Dec 2021 13:23:39 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 16 Dec 2021 22:23:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0L+x_rxG+xO5KFG53VtxDb_ycB5+4axWR6yRpG_YLzqA@mail.gmail.com>
Message-ID: <CAK8P3a0L+x_rxG+xO5KFG53VtxDb_ycB5+4axWR6yRpG_YLzqA@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.16, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1:

  Linux 5.16-rc4 (2021-12-05 14:08:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.16-3

for you to fetch changes up to 4bc73b7d4880a304e1ef1f2a82415292d31b70de:

  Merge tag 'tegra-for-5.16-soc-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/fixes (2021-12-16 15:02:26 +0100)

----------------------------------------------------------------
ARM: SoC fixes for v5.16, part 3

There are a number of DT fixes, mostly for mistakes found through
static checking of the dts files again, as well as a couple of
minor changes to address incorrect DT settings.

For i.MX, there is yet another series of devitree changes to update
RGMII delay settings for ethernet, which is an ongoing problem after
some driver changes.

For SoC specific device drivers, a number of smaller fixes came up:

 - i.MX SoC identification was incorrectly registered non-i.MX
   machines when the driver is built-in

 - One fix on imx8m-blk-ctrl driver to get i.MX8MM MIPI reset work
   properly

 - a few compile fixes for warnings that get in the way of -Werror

 - a string overflow in the scpi firmware driver

 - a boot failure with FORTIFY_SOURCE on Rockchips machines

 - broken error handling in the AMD TEE driver

 - a revert for a tegra reset driver commit that broke HDA

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Adam Ford (1):
      soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset

Alex Bee (1):
      arm64: dts: rockchip: fix audio-supply for Rock Pi 4

Arnd Bergmann (11):
      Merge tag 'reset-fixes-for-v5.16' of
git://git.pengutronix.de/pza/linux into arm/fixes
      Merge tag 'imx-fixes-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge tag 'amdtee-fix-for-v5.16' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge branch 'v5.16/fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/fixes
      Merge tag 'socfpga_fix_for_v5.16_part_2' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/fixes
      Merge tag 'asahi-soc-fixes-5.16' of
https://github.com/AsahiLinux/linux into arm/fixes
      Merge tag 'tegra-for-5.16-firmware-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/fixes
      Merge tag 'imx-fixes-5.16-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge tag 'v5.16-rockchip-dtsfixes1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/fixes
      Merge tag 'v5.16-rockchip-socfixes1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/fixes
      Merge tag 'tegra-for-5.16-soc-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/fixes

Artem Lapkin (1):
      arm64: dts: rockchip: remove mmc-hs400-enhanced-strobe from
rk3399-khadas-edge

Dan Carpenter (1):
      tee: amdtee: fix an IS_ERR() vs NULL bug

Dinh Nguyen (1):
      ARM: socfpga: dts: fix qspi node compatible

Fabio Estevam (1):
      ARM: dts: imx6ull-pinfunc: Fix CSI_DATA07__ESAI_TX0 pad name

Florian Klink (1):
      arm64: dts: rockchip: fix poweroff on helios64

Ivan T. Ivanov (1):
      ARM: rockchip: Use memcpy_toio instead of memcpy on smp bring-up

Janne Grunau (3):
      arm64: dts: apple: change ethernet0 device type to ethernet
      dt-bindings: i2c: apple,i2c: allow multiple compatibles
      arm64: dts: apple: add #interrupt-cells property to pinctrl nodes

Jerome Brunet (1):
      arm64: meson: remove COMMON_CLK

John Keeping (2):
      arm64: dts: rockchip: fix rk3308-roc-cc vcc-sd supply
      arm64: dts: rockchip: fix rk3399-leez-p710 vcc3v3-lan supply

Jon Hunter (1):
      reset: tegra-bpmp: Revert Handle errors in BPMP response

Lv Ruyi (1):
      firmware: tegra: Fix error application of sizeof() to pointer

Martin Kepplinger (1):
      arm64: dts: imx8mq: remove interconnect property from lcdif

Mathew McBride (1):
      arm64: dts: ten64: remove redundant interrupt declaration for gpio-keys

Nathan Chancellor (1):
      soc/tegra: fuse: Fix bitwise vs. logical OR warning

Stephan Gerhold (1):
      soc: imx: Register SoC device only on i.MX boards

Sudeep Holla (1):
      firmware: arm_scpi: Fix string overflow in SCPI genpd driver

Vladimir Oltean (3):
      ARM: dts: imx6qp-prtwd3: update RGMII delays for sja1105 switch
      ARM: dts: ls1021a-tsn: update RGMII delays for sja1105 switch
      arm64: dts: lx2160abluebox3: update RGMII delays for sja1105 switch

Vyacheslav Bocharov (1):
      arm64: meson: fix dts for JetHub D1

 .../devicetree/bindings/i2c/apple,i2c.yaml         |  8 +++---
 arch/arm/boot/dts/imx6qp-prtwd3.dts                |  2 ++
 arch/arm/boot/dts/imx6ull-pinfunc.h                |  2 +-
 arch/arm/boot/dts/ls1021a-tsn.dts                  |  2 ++
 arch/arm/boot/dts/socfpga_arria10_socdk_qspi.dts   |  2 +-
 arch/arm/boot/dts/socfpga_arria5_socdk.dts         |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts      |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_socrates.dts    |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sodia.dts       |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts |  4 +--
 arch/arm/mach-rockchip/platsmp.c                   |  2 +-
 arch/arm64/Kconfig.platforms                       |  1 -
 .../dts/amlogic/meson-axg-jethome-jethub-j100.dts  | 30 +++++++++++-----------
 arch/arm64/boot/dts/apple/t8103-j274.dts           |  2 +-
 arch/arm64/boot/dts/apple/t8103.dtsi               |  4 +++
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |  2 --
 .../boot/dts/freescale/fsl-lx2160a-bluebox3.dts    |  4 +++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  2 --
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts     |  2 +-
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi      |  1 -
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  2 +-
 drivers/firmware/scpi_pm_domain.c                  | 10 +++++---
 drivers/firmware/tegra/bpmp-debugfs.c              |  5 ++--
 drivers/reset/tegra/reset-bpmp.c                   |  9 +------
 drivers/soc/imx/imx8m-blk-ctrl.c                   | 19 ++++++++++++++
 drivers/soc/imx/soc-imx.c                          |  4 +++
 drivers/soc/tegra/fuse/fuse-tegra.c                |  2 +-
 drivers/soc/tegra/fuse/fuse.h                      |  2 +-
 drivers/tee/amdtee/core.c                          |  5 ++--
 32 files changed, 84 insertions(+), 57 deletions(-)
