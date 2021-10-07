Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339ECC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 20:56:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F2D2361248; Thu,  7 Oct 2021 20:56:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC2216120D;
	Thu,  7 Oct 2021 20:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633640167;
	bh=4bqT29C3yJjlBiNz0FiOJFtZ9e6yC8MS3oScyViDs8I=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=j0SJiztMU3tXzRIDUoGIqC/egOuEolfQuFLlgFcNboc5D20p3WwLglhZ3UECiSaE+
	 TS5bqlpWZpsjO0uXsL7Q5sg+Ww+tUNhZqSMMjaPa6LI6BBWji2o+jubbclQiV0UcXj
	 NRJ0BNFAbw0cxE+tQif+ysVZQ03Kj7xtrc/cnTA8mHEQV2uLc6eZYjl9qtJafMhuB9
	 99JHjlmT3cx3R1IBnfamewiynIvjixTochJlTMDy5gVj/aDbj4WprET9wt7cF/nedC
	 35t8OlDvLdL82efw1/v7vpVkMwf/Ktxi3YaISatuVGOEajDJ6x32vTTEFrL1HopvIL
	 4gkpSeyqXyyXQ==
Received: by mail-wr1-f50.google.com with SMTP id t2so22942730wrb.8;
        Thu, 07 Oct 2021 13:56:07 -0700 (PDT)
X-Gm-Message-State: AOAM53089dzcmNt/3Hq58UzeyDTvPMm5Ly2B9maf9vEr0c6VtkCLi32u
	WYXX7MigsFOyfPBbQQ/oMKFQpQ50gzbNDMW870I=
X-Google-Smtp-Source: ABdhPJxQCcjWusyHMbMUs0Vz48hNZMgxTY0XNMoW9DOb/F1ZUUnrkWpnJ+2Akfi8NA57G+4hWei8LpSeF251tR3erfo=
X-Received: by 2002:adf:a3da:: with SMTP id m26mr7959309wrb.336.1633640166461;
 Thu, 07 Oct 2021 13:56:06 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 7 Oct 2021 22:55:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2aqDaL0dh0k+ZXJ2xq5LKa5z2r2r_WUBdC9m8eKxavXA@mail.gmail.com>
Message-ID: <CAK8P3a2aqDaL0dh0k+ZXJ2xq5LKa5z2r2r_WUBdC9m8eKxavXA@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.15
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f=
:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/armsoc-fixes-5.15

for you to fetch changes up to 897c2e746cc795870361fcf9cbf282524589fa5f:

  Merge tag 'asahi-soc-fixes-5.15' of
https://github.com/AsahiLinux/linux into arm/fixes (2021-10-07
21:14:13 +0200)

----------------------------------------------------------------
ARM: SoC fixes for v5.15

This is a larger than normal update for Arm SoC specific code, most
of it in device trees, but also drivers and the omap and at91/sama7
platforms:

 - There are four new entries to the MAINTAINERS file: Sven Peter and
   Alyssa Rosenzweig for Apple M1, Romain Perier for Mstar/sigmastar,
   and Vignesh Raghavendra for TI K3

 - Build fixes to address randconfig warnings in sharpsl, dove, omap1,
   and qcom platforms as well as the  scmi and op-tee subsystems

 - Regression fixes for missing CONFIG_FB and other options for several
   defconfigs

 - Several bug fixes for the newly added Microchip SAMA7 platform,
   mostly regarding power management

 - Missing SMP barriers to protect accesses to SCMI virtio device

 - Regression fixes for TI OMAP, including a boot-time hang on am335x.

 - Lots of bug fixes for NXP i.MX, mostly addressing incorrect settings
   in devicetree files, and one revert for broken suspend.

 - Fixes for ARM Juno/Vexpress devicetree files, addressing a couple
   of schema warnings.

 - Regression fixes for qualcomm SoC specific drivers and devicetree
   files, reverting an mdt_loader change and at least pastially
   reverting some of the 5.15 DTS changes, plus some minor bugfixes

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Alyssa Rosenzweig (1):
      MAINTAINERS: Add Alyssa Rosenzweig as M1 reviewer

Amit Pundir (1):
      arm64: dts: qcom: sdm850-yoga: Reshuffle IPA memory mappings

Antonio Martorana (1):
      soc: qcom: socinfo: Fixed argument passed to platform_set_data()

Arnd Bergmann (16):
      Merge tag 'at91-fixes-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/fixes
      firmware: arm_scmi: Remove __exit annotation
      Merge tag 'optee-fix-for-v5.15' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'at91-fixes-5.15-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/fixes
      Merge tag 'qcom-dts-fixes-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes
      Merge tag 'juno-fixes-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'qcom-arm64-fixes-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes
      Merge tag 'qcom-drivers-fixes-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes
      ARM: omap1: move omap15xx local bus handling to usb.c
      ARM: dove: mark 'putc' as inline
      Merge tag 'imx-fixes-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      ARM: sharpsl_param: work around -Wstringop-overread warning
      Merge tag 'imx-fixes-5.15-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge tag 'omap-for-v5.15/fixes-rc4' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes
      Merge tag 'scmi-fixes-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'asahi-soc-fixes-5.15' of
https://github.com/AsahiLinux/linux into arm/fixes

Claudiu Beznea (11):
      ARM: at91: pm: do not panic if ram controllers are not enabled
      ARM: dts: at91: sama7g5: add ram controllers
      ARM: dts: at91: sama7g5: add securam node
      ARM: dts: at91: sama7g5: add shdwc node
      ARM: dts: at91: sama7g5: add chipid
      ARM: at91: pm: switch backup area to vbat in backup mode
      ARM: dts: at91: sama7g5ek: add suspend voltage for ddr3l rail
      ARM: at91: pm: group constants and addresses loading
      ARM: at91: pm: preload base address of controllers in tlb
      ARM: dts: at91: sama7g5ek: use proper slew-rate settings for GMACs
      ARM: dts: at91: sama7g5ek: to not touch slew-rate for SDMMC pins

Cristian Marussi (3):
      firmware: arm_scmi: Fix virtio transport Kconfig dependency
      firmware: arm_scmi: Simplify spinlocks in virtio transport
      firmware: arm_scmi: Add proper barriers to scmi virtio device

David Heidelberg (2):
      ARM: dts: qcom: apq8064: use compatible which contains chipid
      ARM: dts: qcom: apq8064: update Adreno clock names

Dmitry Baryshkov (3):
      arm64: dts: qcom: pm8150: use qcom,pm8998-pon binding
      arm64: dts: qcom: pm8150: specify reboot mode magics
      arm64: dts: qcom: qrb5165-rb5: enabled pwrkey and resin nodes

Douglas Anderson (1):
      Revert "arm64: dts: qcom: sc7280: Fixup the cpufreq node"

Eugen Hristev (1):
      ARM: dts: at91: sama5d2_som1_ek: disable ISC node by default

Fabio Estevam (2):
      Revert "ARM: imx6q: drop of_platform_default_populate() from init_mac=
hine"
      ARM: dts: imx6qdl-pico: Fix Ethernet support

Geert Uytterhoeven (1):
      firmware: qcom_scm: QCOM_SCM should depend on ARCH_QCOM

Haibo Chen (2):
      ARM: dts: imx: change the spi-nor tx
      arm64: dts: imx8: change the spi-nor tx

Heiko Thiery (1):
      arm64: dts: imx8mm-kontron-n801x-som: do not allow to switch off buck=
2

Joel Stanley (2):
      ARM: config: multi v7: Enable dependancies
      ARM: config: mutli v7: Reenable FB dependency

Krzysztof Kozlowski (3):
      arm64: dts: arm: align watchdog and mmc node names with dtschema
      ARM: dts: arm: align watchdog and mmc node names with dtschema
      arm64: dts: arm: drop unused interrupt-names in MHU

Linus Walleij (1):
      ARM: defconfig: gemini: Restore framebuffer

Marcel Ziswiler (1):
      ARM: imx_v6_v7_defconfig: enable fb

Marek Vasut (2):
      ARM: dts: imx: Add missing pinctrl-names for panel on M53Menlo
      ARM: dts: imx: Fix USB host power regulator polarity on M53Menlo

Marijn Suijten (1):
      ARM: dts: qcom: apq8064: Use 27MHz PXO clock as DSI PLL reference

Michael Walle (1):
      arm64: dts: ls1028a: fix eSDHC2 node

Michal Vok=C3=A1=C4=8D (1):
      ARM: dts: imx6dl-yapp4: Fix lp5562 LED driver probe

Nathan Chancellor (1):
      bus: ti-sysc: Add break in switch statement in sysc_init_soc()

Nishanth Menon (1):
      MAINTAINERS: Add Vignesh to TI K3 platform maintainership

Oleksij Rempel (1):
      ARM: imx6: disable the GIC CPU interface before calling
stby-poweroff sequence

Rob Herring (4):
      arm: dts: vexpress: Drop unused properties from motherboard node
      arm: dts: vexpress-v2p-ca9: Fix the SMB unit-address
      arm: dts: vexpress: Fix addressing issues with 'motherboard-bus' node=
s
      arm: dts: vexpress: Fix motherboard bus 'interrupt-map'

Robin Murphy (1):
      arm64: dts: fvp: Remove panel timings

Roger Quadros (1):
      ARM: dts: omap3430-sdp: Fix NAND device node

Romain Perier (1):
      MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC maintainers

Shawn Guo (2):
      soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
      arm64: dts: qcom: sdm630: Add missing a2noc qos clocks

Stephen Boyd (1):
      arm64: dts: qcom: sc7180-trogdor: Fix lpass dai link for HDMI

Sven Peter (1):
      MAINTAINERS: Add Sven Peter as ARM/APPLE MACHINE maintainer

Tim Harvey (1):
      arm64: dts: imx8m*-venice-gw7902: fix M2_RST# gpio

Tony Lindgren (3):
      soc: ti: omap-prm: Fix external abort for am335x pruss
      Merge branch 'pruss-fix' into fixes
      bus: ti-sysc: Use CLKDM_NOAUTO for dra7 dcan1 for errata i893

jing yangyang (1):
      tee/optee/shm_pool: fix application of sizeof to pointer

 MAINTAINERS                                        |   5 +
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |   1 -
 arch/arm/boot/dts/at91-sama7g5ek.dts               |  45 ++++++-
 arch/arm/boot/dts/imx53-m53menlo.dts               |   4 +-
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi         |   5 +
 arch/arm/boot/dts/imx6qdl-pico.dtsi                |  11 ++
 arch/arm/boot/dts/imx6sx-sdb.dts                   |   4 +-
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi            |   2 +-
 arch/arm/boot/dts/omap3430-sdp.dts                 |   2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                |  15 ++-
 arch/arm/boot/dts/sama7g5.dtsi                     |  39 +++++++
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi            |  67 +++++++++--
 arch/arm/boot/dts/vexpress-v2m.dtsi                |  65 ++++++++++-
 arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts        |  57 +--------
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts         |  57 +--------
 arch/arm/boot/dts/vexpress-v2p-ca5s.dts            |  57 +--------
 arch/arm/boot/dts/vexpress-v2p-ca9.dts             |  58 ---------
 arch/arm/common/sharpsl_param.c                    |   4 +-
 arch/arm/configs/gemini_defconfig                  |   1 +
 arch/arm/configs/imx_v6_v7_defconfig               |   1 +
 arch/arm/configs/multi_v7_defconfig                |   3 +
 arch/arm/mach-at91/pm.c                            | 130 +++++++++++++++++=
+---
 arch/arm/mach-at91/pm_suspend.S                    |  42 +++++--
 arch/arm/mach-dove/include/mach/uncompress.h       |   4 +-
 arch/arm/mach-imx/mach-imx6q.c                     |   3 +
 arch/arm/mach-imx/pm-imx6.c                        |   2 +
 arch/arm/mach-omap1/include/mach/memory.h          |  12 --
 arch/arm/mach-omap1/usb.c                          | 116 ++++++++++++-----=
-
 arch/arm/mach-omap2/omap_hwmod.c                   |   2 +
 arch/arm64/boot/dts/arm/foundation-v8.dtsi         |   1 -
 arch/arm64/boot/dts/arm/fvp-base-revc.dts          |  23 ----
 arch/arm64/boot/dts/arm/juno-base.dtsi             |  12 --
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi      |  21 ++--
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts         |  11 --
 .../boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi      |   2 +-
 arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi   |  20 +++-
 .../boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts      |  57 +--------
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   4 +-
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |   2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts       |   2 +-
 .../dts/freescale/imx8mm-kontron-n801x-som.dtsi    |   1 +
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   2 +-
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |   2 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |   2 +-
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |   2 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   2 +
 .../dts/freescale/imx8mq-kontron-pitx-imx8m.dts    |   2 +-
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  10 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   9 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   6 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  15 ++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  21 ++--
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  34 ++++++
 drivers/bus/ti-sysc.c                              |   4 +
 drivers/firmware/Kconfig                           |   2 +-
 drivers/firmware/arm_scmi/Kconfig                  |   2 +-
 drivers/firmware/arm_scmi/virtio.c                 |  44 ++++---
 drivers/soc/qcom/mdt_loader.c                      |   2 +-
 drivers/soc/qcom/socinfo.c                         |   2 +-
 drivers/soc/ti/omap_prm.c                          |  27 +++--
 drivers/tee/optee/shm_pool.c                       |   2 +-
 drivers/usb/host/ohci-omap.c                       |  72 +-----------
 include/linux/platform_data/usb-omap1.h            |   2 +
 64 files changed, 662 insertions(+), 578 deletions(-)
