Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAF4C433EF
	for <soc@archiver.kernel.org>; Fri, 29 Apr 2022 21:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E5DFC385B1; Fri, 29 Apr 2022 21:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76146C385B0;
	Fri, 29 Apr 2022 21:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651267211;
	bh=G2bBIuAJ6tjznIzkRKEjvXutW57SqPenloijlkWwSj8=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=RVR7cpoZCaa9joyOOTOCw/MvNMTC1plbo52bDWGjxO0H88RrE04vxxAmTr0z3qkRV
	 BGvKhrpivkPJP68scZ+k4oPniX574sjXT4zD7epprjGfDxRE6nJfSW94ExralA0k6Z
	 Yp4yQKkzSewVwUXjJ+LewDJfCHuTPse5Gb4C79eLZVWGWMSB7oCBsHbmptK6sk2HxZ
	 eS12WV0Sok8Xc/fX73lb6Lunm2NdLvyjkjBCPp0omPchS+duu3VP3Aailr1ri8npWo
	 NBjzipCKv2DaLk3T730XkjCeSa6wl5Qp4hbJhl1/JkD1qix8AgRhVDhQ0AYjzebc2p
	 IER0UxaxtFl3w==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2ebf4b91212so98007477b3.8;
        Fri, 29 Apr 2022 14:20:11 -0700 (PDT)
X-Gm-Message-State: AOAM5326yuRLm7hTMGD0LKrbGH3MiHPTbDkG0xmwBNj3kaydspHZTz/6
	tHIiQ7sS1XahHwKhYQG/RdcntsfcDm2NdKlkXUo=
X-Google-Smtp-Source: ABdhPJwriDiEtFNCKszJEbM10Nz0xyvAZ4aYWbfZrbc3MsBYWIygupGh0Xcj30ZmWR1+dTmeFMkpcjMInp8JIoedigM=
X-Received: by 2002:a0d:d804:0:b0:2f4:e47d:1c2c with SMTP id
 a4-20020a0dd804000000b002f4e47d1c2cmr1352803ywe.320.1651267210258; Fri, 29
 Apr 2022 14:20:10 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 29 Apr 2022 23:19:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2fFzrMJJZqiN7B1HnwKcCgPzbobvBZzs2_L19pkM+tYw@mail.gmail.com>
Message-ID: <CAK8P3a2fFzrMJJZqiN7B1HnwKcCgPzbobvBZzs2_L19pkM+tYw@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.18, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 24a4351e1c04de8e580bf06cae7f3a79094fe7f0:

  ARM: config: Update Gemini defconfig (2022-04-14 22:59:24 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.18-3

for you to fetch changes up to adee8aa22a9298148b3f86a83a7940e7a3329ad9:

  Revert "arm: dts: at91: Fix boolean properties with values"
(2022-04-29 23:09:49 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 5.18, part 3

 - A fix for a regression caused by the previous set of bugfixes
   changing tegra and at91 pinctrl properties. More work is needed
   to figure out what this should actually be, but a revert makes
   it work for the moment.

 - Defconfig regression fixes for tegra after renamed symbols

 - Build-time warning and static checker fixes for imx, op-tee,
   sunxi, meson, at91, and omap

 - More at91 DT fixes for audio, regulator and spi nodes

 - A regression fix for Renesas Hyperflash memory probe

 - A stability fix for amlogic boards, modifying the allowed
   cpufreq states

 - Multiple fixes for system suspend on omap2+

 - DT fixes for various i.MX bugs

 - A probe error fix for imx6ull-colibri MMC

 - A MAINTAINERS file entry for samsung bug reports

----------------------------------------------------------------
Adam Ford (3):
      soc: imx: imx8m-blk-ctrl: Fix IMX8MN_DISPBLK_PD_ISI hang
      ARM: dts: am3517-evm: Fix misc pinmuxing
      ARM: dts: logicpd-som-lv: Fix wrong pinmuxing on OMAP35

Alexander Stein (1):
      arm64: dts: imx8mq-tqma8mq: change the spi-nor tx

Arnd Bergmann (10):
      Merge tag 'imx-fixes-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge branch 'v5.18/fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/fixes
      Merge tag 'optee-fix-for-v5.18' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'at91-fixes-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/fixes
      Merge tag 'omap-for-v5.18/fixes-take2' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes
      Revert "arm64: dts: tegra: Fix boolean properties with values"
      Merge tag 'sunxi-fixes-for-5.18-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/fixes
      Merge tag 'imx-fixes-5.18-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge tag 'tegra-for-5.18-arm-defconfig-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/fixes
      Revert "arm: dts: at91: Fix boolean properties with values"

Christian Hewitt (2):
      arm64: dts: meson: remove CPU opps below 1GHz for G12B boards
      arm64: dts: meson: remove CPU opps below 1GHz for SM1 boards

Christophe JAILLET (1):
      bus: sunxi-rsb: Fix the return value of sunxi_rsb_device_create()

Claudiu Beznea (2):
      ARM: dts: at91: sama5d4_xplained: fix pinctrl phandle name
      ARM: dts: at91: fix pinctrl phandles

Dmitry Osipenko (2):
      ARM: tegra_defconfig: Update CONFIG_TEGRA_VDE option
      ARM: config: multi v7: Enable NVIDIA Tegra video decoder driver

Dongliang Mu (1):
      tee: optee: add missing mutext_destroy in optee_ffa_probe

Eugen Hristev (1):
      ARM: dts: at91: sama7g5ek: enable pull-up on flexcom3 console lines

Fabio Estevam (2):
      ARM: dts: imx6qdl-apalis: Fix sgtl5000 detection issue
      arm64: dts: imx8mn-ddr4-evk: Describe the 32.768 kHz PMIC clock

Geert Uytterhoeven (1):
      memory: renesas-rpc-if: Fix HF/OSPI data transfer in Manual Mode

Guillaume Giraudon (1):
      arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin labeling for CON1

H. Nikolaus Schaller (1):
      ARM: dts: Fix mmc order for omap3-gta04

Johan Hovold (1):
      arm64: dts: imx8mm-venice: fix spi2 pin configuration

Krzysztof Kozlowski (3):
      ARM: dts: at91: align SPI NOR node name with dtschema
      ARM: dts: at91: use generic node name for dataflash
      MAINTAINERS: add Bug entry for Samsung and memory controller drivers

Liu Ying (1):
      arm64: dts: imx8qm: Correct SCU clock controller's compatible property

Marek Vasut (1):
      arm64: dts: imx8mn: Fix SAI nodes

Mark Brown (2):
      ARM: dts: at91: Map MCLK for wm8731 on at91sam9g20ek
      ARM: dts: at91: Describe regulators on at91sam9g20ek

Max Krummenacher (1):
      ARM: dts: imx6ull-colibri: fix vqmmc regulator

Miaoqian Lin (1):
      ARM: OMAP2+: Fix refcount leak in omap_gic_of_init

Miquel Raynal (1):
      ARM: dts: am33xx-l4: Add missing touchscreen clock properties

Rob Herring (3):
      ARM: dts: imx: Fix boolean properties with values
      arm64: dts: imx: Fix imx8*-var-som touchscreen property sizes
      ARM: dts: at91: Fix boolean properties with values

Sergiu Moga (1):
      ARM: dts: at91: sama7g5: Swap `rx` and `tx` for `i2c` nodes

Tim Harvey (1):
      ARM: dts: imx8mm-venice-gw{71xx,72xx,73xx}: fix OTG controller OC mode

Tony Lindgren (2):
      bus: ti-sysc: Make omap3 gpt12 quirk handling SoC specific
      ARM: dts: dra7: Fix suspend warning for vpe powerdomain

Tudor Ambarus (1):
      ARM: dts: at91: sama7g5ek: Align the impedance of the QSPI0's
HSIO and PCB lines

Wan Jiabing (1):
      bus: imx-weim: fix NULL but dereferenced coccicheck error

Wei Yongjun (1):
      bus: imx-weim: make symbol 'weim_of_notifier' static

Xianwei Zhao (1):
      arm64: dts: remove cpu compatible "arm,armv8" for s4

 .../devicetree/bindings/mfd/atmel-flexcom.txt      |  2 +-
 MAINTAINERS                                        |  7 +++
 arch/arm/boot/dts/am33xx-l4.dtsi                   |  2 +
 arch/arm/boot/dts/am3517-evm.dts                   | 45 ++++++++++++++--
 arch/arm/boot/dts/am3517-som.dtsi                  |  9 ++++
 arch/arm/boot/dts/at91-dvk_su60_somc.dtsi          |  2 +-
 arch/arm/boot/dts/at91-kizbox3-hs.dts              |  2 +-
 arch/arm/boot/dts/at91-kizbox3_common.dtsi         |  2 +-
 arch/arm/boot/dts/at91-q5xr5.dts                   |  2 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi        |  2 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts      |  2 +-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |  2 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts        |  8 +--
 arch/arm/boot/dts/at91-sama5d4_ma5d4.dtsi          |  2 +-
 arch/arm/boot/dts/at91-sama5d4_xplained.dts        |  6 +--
 arch/arm/boot/dts/at91-sama5d4ek.dts               |  2 +-
 arch/arm/boot/dts/at91-sama7g5ek.dts               |  4 +-
 arch/arm/boot/dts/at91-vinco.dts                   |  2 +-
 arch/arm/boot/dts/at91rm9200ek.dts                 |  4 +-
 arch/arm/boot/dts/at91sam9260ek.dts                |  2 +-
 arch/arm/boot/dts/at91sam9261ek.dts                |  2 +-
 arch/arm/boot/dts/at91sam9263ek.dts                |  2 +-
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi        | 45 +++++++++++++++-
 arch/arm/boot/dts/at91sam9m10g45ek.dts             |  2 +-
 arch/arm/boot/dts/at91sam9n12ek.dts                |  2 +-
 arch/arm/boot/dts/at91sam9rlek.dts                 |  2 +-
 arch/arm/boot/dts/at91sam9x5ek.dtsi                |  2 +-
 arch/arm/boot/dts/dra7-l4.dtsi                     |  4 +-
 arch/arm/boot/dts/imx6qdl-apalis.dtsi              | 10 +++-
 arch/arm/boot/dts/imx6ull-colibri.dtsi             |  2 +-
 arch/arm/boot/dts/logicpd-som-lv-35xx-devkit.dts   | 15 ++++++
 arch/arm/boot/dts/logicpd-som-lv-37xx-devkit.dts   | 15 ++++++
 arch/arm/boot/dts/logicpd-som-lv.dtsi              | 15 ------
 arch/arm/boot/dts/omap3-gta04.dtsi                 |  2 +
 arch/arm/boot/dts/sama5d3xmb.dtsi                  |  2 +-
 arch/arm/boot/dts/sama5d3xmb_cmp.dtsi              |  2 +-
 arch/arm/boot/dts/sama7g5.dtsi                     | 18 +++----
 arch/arm/boot/dts/usb_a9263.dts                    |  2 +-
 arch/arm/configs/multi_v7_defconfig                |  1 +
 arch/arm/configs/tegra_defconfig                   |  3 +-
 arch/arm/mach-omap2/omap4-common.c                 |  2 +
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  | 40 ---------------
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  | 40 ---------------
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  8 +--
 .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |  1 +
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         | 20 --------
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |  4 +-
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |  4 +-
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   |  4 +-
 arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts  |  4 ++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          | 10 ++--
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi  |  2 +-
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  8 +--
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |  8 +--
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  6 +--
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |  6 +--
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |  6 +--
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |  8 +--
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  8 +--
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  4 +-
 drivers/bus/imx-weim.c                             |  5 +-
 drivers/bus/sunxi-rsb.c                            |  2 +
 drivers/bus/ti-sysc.c                              | 16 +++++-
 drivers/iommu/omap-iommu.c                         |  2 +-
 drivers/memory/renesas-rpc-if.c                    | 60 +++++++++++++++++-----
 drivers/soc/imx/imx8m-blk-ctrl.c                   |  2 +-
 drivers/tee/optee/ffa_abi.c                        |  1 +
 include/memory/renesas-rpc-if.h                    |  1 +
 69 files changed, 312 insertions(+), 229 deletions(-)
