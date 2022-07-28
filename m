Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F189AC04A68
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 22:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB211C43470; Thu, 28 Jul 2022 22:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CEDC4347C
	for <soc@kernel.org>; Thu, 28 Jul 2022 22:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659047579;
	bh=pFcFk6RMgO+cSRh5lcLWiEmuxgRmH1eKd1+7ROyam3A=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=bgZWb4OYt0Y4Zk1nm+Ry50CV2cCPf/9UYlhjHWt+6RQm2K8RF7+G+ATS7n9eL8sqi
	 8fQZqekN6pf8Gu4VUtUQ10G9vB4Cbyu7VwJWq8ccp/ZGntO5ZZLymMta5MxV4A7+0y
	 ZaFf1ETFJwc4PJ7YbHj+Qe7pzSoNlis1vumOIQfLQYtqSxFEScsUaPemT8O/uWXM4X
	 Dqi6QNkLhNlk7BnEG+hK2OkQRqktLYxiXK+5x0U8KFEEDxUkCTUjLF7cE1j9fbTjNv
	 nhZ1ORzJhqTy/q5/ToCSmSM+yXo7c7epGjr46iDBe5dTjhAzspAJcWfN3jJg5RgMp1
	 wRXz0qQcVvrHw==
Received: by mail-ed1-f51.google.com with SMTP id m8so3851082edd.9
        for <soc@kernel.org>; Thu, 28 Jul 2022 15:32:59 -0700 (PDT)
X-Gm-Message-State: AJIora8xpMPhtDJwZ78ScLTgBwvVIxQdyHAMi7pLNnS/RCFz+QGONRYm
	QJv9V627YD/b+2CTXiAyJHyqF+A8tcJK6DKv9zs=
X-Google-Smtp-Source: AGRyM1sb9oOCt+nVzoCh/xHOW0ohRUyYbQSImpBrxp4C0PRsMvFkl/eOR/9BtrkRhPtGVl2pbM1WF9cEmf3gQ61POjY=
X-Received: by 2002:a05:6402:28c4:b0:43a:cdde:e047 with SMTP id
 ef4-20020a05640228c400b0043acddee047mr1044904edb.368.1659047577830; Thu, 28
 Jul 2022 15:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
In-Reply-To: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 29 Jul 2022 00:32:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2VY8n16XU6+dxxGPSO0gkCwd8JiMj-g_8g-cG4ayWcyA@mail.gmail.com>
Message-ID: <CAK8P3a2VY8n16XU6+dxxGPSO0gkCwd8JiMj-g_8g-cG4ayWcyA@mail.gmail.com>
Subject: [GIT PULL 4/6] ARM: SoC defconfig updates for 5.20
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-defconfig-5.20

for you to fetch changes up to c95a5712beee635c4626f78218e52b978f075a17:

  arm64: defconfig: Sync some configs with savedefconfig (2022-07-27
15:46:11 +0200)

----------------------------------------------------------------
ARM: SoC defconfig updates for 5.20

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
      Merge tag 'renesas-arm-defconfig-for-v5.20-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/defconfig
      Merge tag 'sunxi-config64-for-5.20-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/defconfig
      Merge tag 'tegra-for-5.20-arm64-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/defconfig
      Merge tag 'imx-defconfig-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/defconfig
      Merge tag 'arm-soc/for-5.20/defconfig' of
https://github.com/Broadcom/stblinux into arm/defconfig
      Merge tag 'arm-soc/for-5.20/defconfig-arm64' of
https://github.com/Broadcom/stblinux into arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.20-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfig
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
