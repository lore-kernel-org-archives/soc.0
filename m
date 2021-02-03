Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA81C433E0
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:41:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7AD8664E55; Wed,  3 Feb 2021 12:41:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5356364E4B;
	Wed,  3 Feb 2021 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612356101;
	bh=xAfRqBE+pAbxUC34HhBy+qHGodXdkQJi03i/yKzhH1o=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=a6IA724npiEh0d/XEpy5Yc/YitSsfE5rqy6UxcAjO1hsS+Wb3R9MXjkhPNJGFlhgj
	 PFF0ggzfcMCORTOr3xL/ZmM8S0MNu9RY/qJ6P39m84U9czdYI2S5NNIdwkyytGMxQm
	 mhONBTuw/HCfR+HOAkglUkFpOfUPHp8emseXt5Wd9HKFgf95zYPnyH49GDUzsiv13A
	 WNVrtY+N07DeUTZOO8DxXxU8ENgeAOhtGbxpSJub1rDFrrjn2KhE5KrDpFMUNcuGC4
	 OJXdgBHSxoPVUS49i1WTSc2eGLj64D2D2RhUtXXeyr43w2IPTmnQBPlvHev3CAnVvr
	 PqdiwqzvS2OZA==
Received: by mail-ot1-f43.google.com with SMTP id t25so13082510otc.5;
        Wed, 03 Feb 2021 04:41:41 -0800 (PST)
X-Gm-Message-State: AOAM533mMkCA0aT1SWJd29SPK5+oonUqL61OD7Fh4VodsAlD0QB3Y9XU
	Q7AMkM9KRfoLxQBkBM2FBeV3iwVQxdnEZ197MyQ=
X-Google-Smtp-Source: ABdhPJyLp00x2R2SaV/rOpM9Uk0hpmPrjHB1aq7/yV2vW2twmX/LWRv8pEjJBo8c5/60UUkiFG4hxmi39E/c3aRDvxw=
X-Received: by 2002:a05:6830:139a:: with SMTP id d26mr1888240otq.305.1612356100569;
 Wed, 03 Feb 2021 04:41:40 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 3 Feb 2021 13:41:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Ud0DtX+GGnap1r+Yu+KONeqq64q+2y2D3mVPGN4vwuQ@mail.gmail.com>
Message-ID: <CAK8P3a1Ud0DtX+GGnap1r+Yu+KONeqq64q+2y2D3mVPGN4vwuQ@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.11, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, 
	Heiko Stuebner <mmind@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Marek Vasut <marex@denx.de>, Alexandre TORGUE <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit e49c24c8cd00ea9d7471520fff562fb4e7e9f61a:

  Merge tag 'imx-fixes-5.11-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes (2021-01-22 23:52:42 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-fixes-v5.11-3

for you to fetch changes up to 459630a3ebb4110c571f103fbc2d8120be001e39:

  Merge tag 'sunxi-fixes-for-5.11-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/fixes (2021-02-03 11:24:01 +0100)

----------------------------------------------------------------
The code fixes in this round are all for the Texas Instruments OMAP
platform, addressing several regressions related to the ti-sysc
interconnect changes that were merged in linux-5.11 and one recently
introduced RCU usage warning.

Tero Kristo updates his maintainer file entries as he is changing
to a new employer.

The other changes are for devicetree files across eight different
platforms:

TI OMAP:
 - multiple gpio related one-line fixes

Allwinner/sunxi:
 - ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode
 - soc: sunxi: mbus: Remove DE2 display engine compatibles

NXP lpc32xx:
 - ARM: dts: lpc32xx: Revert set default clock rate of HCLK PLL

STMicroelectronics stm32
 - multiple minor fixes for DHCOM/DHCOR boards

NXP Layerscape:
 - Fix DCFG address range on LS1046A SoC

Amlogic meson:
 - fix reboot issue on odroid C4
 - revert an ethernet change that caused a regression
 - meson-g12: Set FL-adj property value

Rockchip:
 - multiple minor fixes on 64-bit rockchip machines

Qualcomm:
 - Regression fixes for Lenovo Yoga touchpad and for
   interconnect configuration
 - Boot fixes for 'LPASS' clock configuration on two machines

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Alexandre Belloni (1):
      ARM: dts: lpc32xx: Revert set default clock rate of HCLK PLL

Arnd Bergmann (11):
      Merge tag 'stm32-dt-for-v5.11-fixes-1' of
git://git.kernel.org/.../atorgue/stm32 into arm/fixes
      Merge tag 'amlogic-fixes' of
git://git.kernel.org/.../khilman/linux-amlogic into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-5.11' of
git://git.kernel.org/.../qcom/linux into arm/fixes
      Merge tag 'qcom-arm64-defconfig-fixes-for-5.11' of
git://git.kernel.org/.../qcom/linux into arm/fixes
      Merge tag 'omap-for-v5.11/fixes-rc5' of
git://git.kernel.org/.../tmlind/linux-omap into arm/fixes
      Merge tag 'v5.11-rockchip-dtsfixes1' of
git://git.kernel.org/.../mmind/linux-rockchip into arm/fixes
      Merge tag 'amlogic-fixes-2' of
git://git.kernel.org/.../khilman/linux-amlogic into arm/fixes
      Merge tag 'amlogic-fixes-3' of
git://git.kernel.org/.../khilman/linux-amlogic into arm/fixes
      Merge tag 'ti-k3-maintainer-for-v5.12' of
git://git.kernel.org/.../nmenon/linux into arm/fixes
      Merge tag 'imx-fixes-5.11-3' of
git://git.kernel.org/.../shawnguo/linux into arm/fixes
      Merge tag 'sunxi-fixes-for-5.11-2' of
git://git.kernel.org/.../sunxi/linux into arm/fixes

Bjorn Andersson (2):
      arm64: defconfig: Make INTERCONNECT_QCOM_SDM845 builtin
      arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc

H. Nikolaus Schaller (2):
      DTS: ARM: gta04: remove legacy spi-cs-high to make display work again
      ARM: dts; gta04: SPI panel chip select is active low

Hermann Lauer (1):
      ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode

Johan Jonker (1):
      arm64: dts: rockchip: remove interrupt-names property from
rk3399 vdec node

Linus Walleij (1):
      ARM: OMAP1: OSK: fix ohci-omap breakage

Marc Zyngier (1):
      arm64: dts: rockchip: Fix PCIe DT properties on rk3399

Marek Szyprowski (1):
      arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain on Odroid-C4

Marek Vasut (7):
      ARM: dts: stm32: Fix polarity of the DH DRC02 uSD card detect
      ARM: dts: stm32: Connect card-detect signal on DHCOM
      ARM: dts: stm32: Disable WP on DHCOM uSD slot
      ARM: dts: stm32: Disable optional TSC2004 on DRC02 board
      ARM: dts: stm32: Fix GPIO hog names on DHCOM
      ARM: dts: stm32: Fix GPIO hog flags on DHCOM PicoITX
      ARM: dts: stm32: Fix GPIO hog flags on DHCOM DRC02

Neil Armstrong (1):
      Revert "arm64: dts: amlogic: add missing ethernet reset ID"

Paul Kocialkowski (1):
      soc: sunxi: mbus: Remove DE2 display engine compatibles

Robin Murphy (1):
      arm64: dts: rockchip: Disable display for NanoPi R2S

Sandy Huang (1):
      arm64: dts: rockchip: fix vopl iommu irq on px30

Serge Semin (1):
      arm64: dts: amlogic: meson-g12: Set FL-adj property value

Shawn Guo (1):
      arm64: dts: qcom: c630: keep both touchpad devices enabled

Simon South (1):
      arm64: dts: rockchip: Use only supported PCIe link speed on Pinebook Pro

Tero Kristo (1):
      MAINTAINERS: Update my email address and maintainer level status

Tony Lindgren (7):
      Merge branch 'fixes-omap3' into fixes
      soc: ti: omap-prm: Fix boot time errors for rst_map_012 bits 0 and 1
      ARM: OMAP2+: Fix suspcious RCU usage splats for omap_enter_idle_coupled
      Merge branch 'cpuidle-fix' into fixes
      ARM: OMAP2+: Fix booting for am335x after moving to simple-pm-bus
      drivers: bus: simple-pm-bus: Fix compatibility with simple-bus for auxdata
      ARM: dts: omap4-droid4: Fix lost keypad slide interrupts for droid4

Zyta Szpak (1):
      arm64: dts: ls1046a: fix dcfg address range

 MAINTAINERS                                        | 12 +++++-----
 arch/arm/boot/dts/lpc32xx.dtsi                     |  3 ---
 arch/arm/boot/dts/omap3-gta04.dtsi                 |  3 +--
 arch/arm/boot/dts/omap4-droid4-xt894.dts           |  5 ++++
 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     | 16 +++++++++----
 arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   |  4 ++--
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |  3 ++-
 arch/arm/boot/dts/sun7i-a20-bananapro.dts          |  2 +-
 arch/arm/mach-omap1/board-osk.c                    |  2 ++
 arch/arm/mach-omap2/Kconfig                        | 28 +++++++++++-----------
 arch/arm/mach-omap2/cpuidle44xx.c                  | 16 ++++++-------
 arch/arm/mach-omap2/pdata-quirks.c                 |  1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  2 --
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  4 +---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  3 ---
 .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  4 +++-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 14 ++++-------
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  2 +-
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts |  4 ++++
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |  1 -
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  3 +--
 arch/arm64/configs/defconfig                       |  2 +-
 drivers/bus/simple-pm-bus.c                        |  3 ++-
 drivers/soc/sunxi/sunxi_mbus.c                     |  5 ----
 drivers/soc/ti/omap_prm.c                          | 11 +++++++++
 27 files changed, 84 insertions(+), 73 deletions(-)
