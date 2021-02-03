Return-Path: <SRS0=Uajl=HF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7F7C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 12:42:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CEFC64F99
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 12:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CEFC64F99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=seHs5KnZrJOLY916e1ZIKwjAPDeeQVblaDP0ql5U1so=; b=FEpZlgP3J3j+4HB9x7oxF0vJ93
	qEJWO3RJ5uJa1tXRfMSmPRH6MrvHPEojGpVqh1QPG9ssfQQgXx+hAvwT4ykdKO7Liz9/97JwhcxPu
	UA0gfBAMHHYvoATZ9XjIg+O74HM+jNK+ceCjJrkMygpjf/og0msKc4jP96coly5lsXVUMH8YQCv11
	C56ydQW7Cre6wYIqHVjwtGwBptIskpCsM80n4zcnJ+/I2olREWE9zXpKCq3mrfPnj/c7HZirKHAG7
	vZg0rnttYfvrQqxIRLNDzGwcTMDZI2CjPPxTuRO7equ9Mez6uh3vgIxBIqbnJrW2Mdui5f1npwjow
	N+XURVDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7HTc-0003EE-Jg; Wed, 03 Feb 2021 12:41:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7HTa-0003DS-4o
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Feb 2021 12:41:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BE0464E4A
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-ot1-f41.google.com with SMTP id 36so23171779otp.2
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Feb 2021 04:41:41 -0800 (PST)
X-Gm-Message-State: AOAM532lf2m65O6VLyuLzAQ37mgEJGb+ZVYACSsu4/8gKu7bxTa7jUJv
 5UpmMkC8IOQAtT5LJbu7kx+CKvaguZZqtapdLZU=
X-Google-Smtp-Source: ABdhPJyLp00x2R2SaV/rOpM9Uk0hpmPrjHB1aq7/yV2vW2twmX/LWRv8pEjJBo8c5/60UUkiFG4hxmi39E/c3aRDvxw=
X-Received: by 2002:a05:6830:139a:: with SMTP id
 d26mr1888240otq.305.1612356100569; 
 Wed, 03 Feb 2021 04:41:40 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 3 Feb 2021 13:41:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Ud0DtX+GGnap1r+Yu+KONeqq64q+2y2D3mVPGN4vwuQ@mail.gmail.com>
Message-ID: <CAK8P3a1Ud0DtX+GGnap1r+Yu+KONeqq64q+2y2D3mVPGN4vwuQ@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.11, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_074142_325378_8D87D89E 
X-CRM114-Status: GOOD (  15.18  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Heiko Stuebner <mmind@kernel.org>, Marek Vasut <marex@denx.de>,
 Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, SoC Team <soc@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210203124124.b9_D_xAh6wMQF-XuEP4GxExVgJa199h3VhOXE-VwtPU@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
