Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04065C19F28
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1147C433C1; Tue,  2 Aug 2022 14:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824B0C433B5;
	Tue,  2 Aug 2022 14:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659448931;
	bh=oewzBKSeXYyYSKSkJfBD+EWBeSeth2kOdiN0Z7foP+k=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=K5lPiViaeYb3SWr1o6DZh5447jSUK8DcDWyxAwWgI/RiNFxm8zWM6TJim+GPnwx5C
	 W/IjctJlDrnjEZBOe07lU3RKlEw3iIcP42tWrdOxMUtnLMPzzSC3aO2gMoagYTGXyn
	 pwkwYpcf+YbHp27qq4fXaMu9qfF6H9xaPIWqRL62JZaP3WmBj4ICJk7st/70D2eUxq
	 T/O1bNNe6+WNWFdJDEszzuoIJlba1jKejqRbyQyBGwOMFH6ycUBy5J3e6o0Dosf/UV
	 6UpaZYMLzYSFhg+ChpeCwhPAFus52pNdUjBXEjirXZxBx3B5zpK3/emSwfejy9TZgH
	 3nVmMUhJzqwuw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: SoC defconfig updates for 6.0
Date: Tue,  2 Aug 2022 16:01:58 +0200
Message-Id: <20220802140200.3987874-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220802140200.3987874-1-arnd@kernel.org>
References: <20220802140200.3987874-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-6.0

for you to fetch changes up to c95a5712beee635c4626f78218e52b978f075a17:

  arm64: defconfig: Sync some configs with savedefconfig (2022-07-27 15:46:11 +0200)

----------------------------------------------------------------
ARM: SoC defconfig updates for 6.0

This branch includes the usual updates to defconfig files, enabling
additional driver support for the supported platforms.

There is also a global refresh for all of them that reorders the
lines according to the 'savedefconfig' output, but without removing
lines that are no longer part of the refresh.

I went through the most common removed lines to also address them
while making sure to catch renamed options and add them back
under the new name.

The boardfile deprecation branch is based on top of this to avoid
conflicts against removing the unused boardfile configs from the
generic defconfig files.

----------------------------------------------------------------
Arnd Bergmann (15):
      Merge tag 'renesas-arm-defconfig-for-v5.20-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/defconfig
      Merge tag 'sunxi-config64-for-5.20-1' of git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/defconfig
      Merge tag 'tegra-for-5.20-arm64-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/defconfig
      Merge tag 'imx-defconfig-5.20' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/defconfig
      Merge tag 'arm-soc/for-5.20/defconfig' of https://github.com/Broadcom/stblinux into arm/defconfig
      Merge tag 'arm-soc/for-5.20/defconfig-arm64' of https://github.com/Broadcom/stblinux into arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.20' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.20-2' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/defconfig
      ARM: refresh defconfig files
      ARM: defconfig: remove irda remnants
      ARM: defconfig: remove stale CONFIG_ZBOOT_ROM entries
      ARM: defconfig: address renamed CONFIG_DEBUG_INFO=y
      ARM: defconfig: remove broken CONFIG_THUMB disables
      ARM: defconfig: kill remnants of CONFIG_LEDS
      arm64: refresh defconfig file

Bjorn Andersson (2):
      arm64: defconfig: Enable Qualcomm SC8280XP providers
      arm64: defconfig: Demote Qualcomm USB PHYs to modules

Dmitry Baryshkov (1):
      arm64: defconfig: enable Qualcomm LPG leds driver

Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Refresh for v5.19-rc1
      arm64: defconfig: Enable R8A779G0 SoC

John Garry (1):
      arm64: defconfig: Sync some configs with savedefconfig

Krzysztof Kozlowski (1):
      arm64: defconfig: enable Qualcomm Bandwidth Monitor

Mark Brown (1):
      arm64: defconfig: Enable Allwinner built in CODECs

Nicolas Saenz Julienne (1):
      arm64: defconfig: Enable DRM_V3D

Peng Fan (1):
      arm64: defconfig: enable i.MX93 clk & pinctrl

Peter Robinson (1):
      ARM: configs: Enable DRM_V3D

Sameer Pujar (1):
      arm64: defconfig: Build Tegra OPE module

Teresa Remmet (1):
      arm64: defconfig: Enable gpio-fan support

Vinod Koul (2):
      arm64: defconfig: Enable qcom ss & hs usb phy
      arm64: defconfig: Enable qcom interconnect drivers

William Zhang (2):
      arm64: defconfig: enable bcmbca soc support
      ARM: multi_v7_defconfig: Update configs for BCM63138

 arch/arm/configs/am200epdkit_defconfig    |  28 +++---
 arch/arm/configs/aspeed_g4_defconfig      |  17 ++--
 arch/arm/configs/aspeed_g5_defconfig      |  17 ++--
 arch/arm/configs/assabet_defconfig        |  19 ++--
 arch/arm/configs/at91_dt_defconfig        |  10 +--
 arch/arm/configs/axm55xx_defconfig        |  26 +++---
 arch/arm/configs/badge4_defconfig         |  17 ++--
 arch/arm/configs/bcm2835_defconfig        |  39 +++++----
 arch/arm/configs/cerfcube_defconfig       |  24 ++---
 arch/arm/configs/clps711x_defconfig       |   6 +-
 arch/arm/configs/cm_x300_defconfig        |  28 +++---
 arch/arm/configs/cns3420vb_defconfig      |  20 ++---
 arch/arm/configs/colibri_pxa270_defconfig |  41 ++++-----
 arch/arm/configs/colibri_pxa300_defconfig |  12 +--
 arch/arm/configs/collie_defconfig         |  22 +++--
 arch/arm/configs/corgi_defconfig          |  51 +++++------
 arch/arm/configs/davinci_all_defconfig    |  28 +++---
 arch/arm/configs/dove_defconfig           |  32 ++++---
 arch/arm/configs/ep93xx_defconfig         |  18 ++--
 arch/arm/configs/eseries_pxa_defconfig    |  36 +++-----
 arch/arm/configs/exynos_defconfig         |  24 +++--
 arch/arm/configs/ezx_defconfig            |  74 ++++++++--------
 arch/arm/configs/footbridge_defconfig     |  31 +++----
 arch/arm/configs/h3600_defconfig          |  16 ++--
 arch/arm/configs/h5000_defconfig          |  20 ++---
 arch/arm/configs/hackkit_defconfig        |  12 +--
 arch/arm/configs/hisi_defconfig           |  24 ++---
 arch/arm/configs/imx_v4_v5_defconfig      |  10 +--
 arch/arm/configs/imx_v6_v7_defconfig      |   8 +-
 arch/arm/configs/integrator_defconfig     |   2 +-
 arch/arm/configs/iop32x_defconfig         |  23 +++--
 arch/arm/configs/ixp4xx_defconfig         |   1 -
 arch/arm/configs/jornada720_defconfig     |  16 ++--
 arch/arm/configs/keystone_defconfig       |  64 +++++++-------
 arch/arm/configs/lart_defconfig           |  21 ++---
 arch/arm/configs/lpc18xx_defconfig        |  16 ++--
 arch/arm/configs/lpc32xx_defconfig        |  12 ++-
 arch/arm/configs/lpd270_defconfig         |  11 +--
 arch/arm/configs/lubbock_defconfig        |  21 +++--
 arch/arm/configs/magician_defconfig       |  41 ++++-----
 arch/arm/configs/mainstone_defconfig      |  15 ++--
 arch/arm/configs/milbeaut_m10v_defconfig  |   6 +-
 arch/arm/configs/mini2440_defconfig       |   8 +-
 arch/arm/configs/mmp2_defconfig           |  32 ++++---
 arch/arm/configs/moxart_defconfig         |  20 ++---
 arch/arm/configs/mps2_defconfig           |  18 ++--
 arch/arm/configs/multi_v4t_defconfig      |   6 +-
 arch/arm/configs/multi_v5_defconfig       |  14 +--
 arch/arm/configs/multi_v7_defconfig       |  67 +++++++-------
 arch/arm/configs/mv78xx0_defconfig        |  36 ++++----
 arch/arm/configs/mvebu_v5_defconfig       |  32 ++++---
 arch/arm/configs/mvebu_v7_defconfig       |   4 +-
 arch/arm/configs/mxs_defconfig            |   6 +-
 arch/arm/configs/neponset_defconfig       |  30 ++++---
 arch/arm/configs/netwinder_defconfig      |  18 ++--
 arch/arm/configs/nhk8815_defconfig        |   8 +-
 arch/arm/configs/omap1_defconfig          |  80 ++++++++---------
 arch/arm/configs/omap2plus_defconfig      |  17 ++--
 arch/arm/configs/orion5x_defconfig        |  36 ++++----
 arch/arm/configs/oxnas_v6_defconfig       |  14 +--
 arch/arm/configs/palmz72_defconfig        |  16 ++--
 arch/arm/configs/pcm027_defconfig         |  24 +++--
 arch/arm/configs/pleb_defconfig           |   8 +-
 arch/arm/configs/pxa168_defconfig         |  22 +++--
 arch/arm/configs/pxa255-idp_defconfig     |  21 +++--
 arch/arm/configs/pxa3xx_defconfig         |  20 ++---
 arch/arm/configs/pxa910_defconfig         |  26 +++---
 arch/arm/configs/pxa_defconfig            | 140 ++++++++++++++----------------
 arch/arm/configs/qcom_defconfig           |  62 ++++++-------
 arch/arm/configs/realview_defconfig       |   8 +-
 arch/arm/configs/rpc_defconfig            |  20 ++---
 arch/arm/configs/s3c2410_defconfig        |  12 ++-
 arch/arm/configs/s3c6400_defconfig        |   4 +-
 arch/arm/configs/s5pv210_defconfig        |   6 +-
 arch/arm/configs/sama5_defconfig          |   8 +-
 arch/arm/configs/sama7_defconfig          |   8 +-
 arch/arm/configs/shannon_defconfig        |  10 +--
 arch/arm/configs/shmobile_defconfig       |   4 +-
 arch/arm/configs/simpad_defconfig         |  29 +++----
 arch/arm/configs/socfpga_defconfig        |   8 +-
 arch/arm/configs/spear13xx_defconfig      |  18 ++--
 arch/arm/configs/spear3xx_defconfig       |  12 +--
 arch/arm/configs/spear6xx_defconfig       |  10 +--
 arch/arm/configs/spitz_defconfig          |  51 +++++------
 arch/arm/configs/stm32_defconfig          |  18 ++--
 arch/arm/configs/sunxi_defconfig          |   2 +-
 arch/arm/configs/tct_hammer_defconfig     |  14 ++-
 arch/arm/configs/tegra_defconfig          |  20 ++---
 arch/arm/configs/trizeps4_defconfig       |  66 +++++++-------
 arch/arm/configs/u8500_defconfig          |   2 +-
 arch/arm/configs/versatile_defconfig      |   4 +-
 arch/arm/configs/vexpress_defconfig       |   8 +-
 arch/arm/configs/vf610m4_defconfig        |   2 +-
 arch/arm/configs/viper_defconfig          |  30 +++----
 arch/arm/configs/vt8500_v6_v7_defconfig   |   2 +-
 arch/arm/configs/xcep_defconfig           |  32 ++++---
 arch/arm/configs/zeus_defconfig           |  28 +++---
 arch/arm64/configs/defconfig              |  82 ++++++++++-------
 arch/sh/configs/ecovec24_defconfig        |   2 -
 99 files changed, 1044 insertions(+), 1220 deletions(-)
