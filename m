Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030FBC433ED
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 15:54:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BBF6F61107; Mon, 26 Apr 2021 15:54:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A644E610A2
	for <soc@kernel.org>; Mon, 26 Apr 2021 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619452442;
	bh=TE7uIUuIOd16ye9QIYhsbNWruh7Bx1Fy1JdO96nYQ4Q=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Kfn01iFQBY3HYEBVxS8sd8QjagNaccMyd9pTsZfqYBBrn0LFSEpcW/ODnE8bkTXxV
	 BI/DT2ojCSd7l/l8EO+lI2yz2gBa6o+KA/Gw0mvvwTZEJ6iIdx5p1sKH7D6aRRMKyY
	 ckCoO1Ctuc9RslLa62raYI2WxipqbRMvFNzRBXSVIgiomM9qrmQVRDW/iTvjkYySIt
	 DFopSYBLc5soucq1DQhx1CY7Knm5UipAcntkKP7s86RsaclST+F5CdeIuJP6JY/O5O
	 p01y/QwTO9vTUeEVN1qz4yJum0VyCeX+YgTs6V0nJ9xfcydxUlyM+G08vNGp/CiNjh
	 hA9s/FJFE91cA==
Received: by mail-wr1-f43.google.com with SMTP id a4so56438224wrr.2
        for <soc@kernel.org>; Mon, 26 Apr 2021 08:54:02 -0700 (PDT)
X-Gm-Message-State: AOAM532FJvihAAzk9o6yYJRvMe1nTZv7OaKlltil+tYc+1yPkgn4W5kw
	/YyIwN2mQK7/0IsUFuUAaAB1EQ6GBTtahmrf71s=
X-Google-Smtp-Source: ABdhPJxFbQu8riTUQC+1nsiYnTb+GcS9yx3yczeqwR8QBUJqtxR3x3Tov+wftq/u5PyK2TgPmj+ME5+zsaXwmd8p7qw=
X-Received: by 2002:adf:db4f:: with SMTP id f15mr23845275wrj.99.1619452441026;
 Mon, 26 Apr 2021 08:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 26 Apr 2021 17:53:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a08ONpuYxcNOOr1Yr04SYosAPKH+i=PPp9h0hvhknn+Mg@mail.gmail.com>
Message-ID: <CAK8P3a08ONpuYxcNOOr1Yr04SYosAPKH+i=PPp9h0hvhknn+Mg@mail.gmail.com>
Subject: [GIT PULL 1/6] ARM: SoC changes for v5.13
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 4c9f4865f4604744d4f1a43db22ac6ec9dc8e587=
:

  Merge branch 'fixes-rc2' into fixes (2021-03-08 11:34:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.=
13

for you to fetch changes up to d92e5e32fb4fce7ae939ad322aad77955dd5dcda:

  Merge tag 'arm-soc/for-5.13/maintainers' of
https://github.com/Broadcom/stblinux into arm/soc (2021-04-09 21:48:03
+0200)

----------------------------------------------------------------
ARM: SoC changes for v5.13

Almost all SoC code changes this time are for the TI OMAP
platform, which continues its decade-long quest to move from
describing a complex SoC in code to device tree.

Aside from this, the Uniphier platform has a new maintainer
and some platforms have minor bugfixes and cleanups that were
not urgent enough for v5.12.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Aditya Srivastava (2):
      ARM: OMAP2+: fix incorrect kernel-doc comment syntax in file
      ARM: OMAP1: fix incorrect kernel-doc comment syntax in file

Arnd Bergmann (7):
      Merge tag 'omap-for-v5.13/genpd-cleanup-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/soc
      Merge tag 'imx-soc-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/soc
      Merge tag 'at91-soc-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/soc
      Merge tag 'hisi-armv7soc-for-5.13' of
git://github.com/hisilicon/linux-hisi into arm/soc
      Merge tag 'omap-for-v5.13/soc-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/soc
      Merge tag 'samsung-soc-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/soc
      Merge tag 'arm-soc/for-5.13/maintainers' of
https://github.com/Broadcom/stblinux into arm/soc

Ben Dooks (1):
      ARM: ux500: make ux500_cpu_die static

Bhaskar Chowdhury (1):
      ARM: mach-imx: Fix a spelling in the file pm-imx5.c

Hao Fang (1):
      ARM: hisi: use the correct HiSilicon copyright

Jiapeng Chong (1):
      ARM: OMAP2+: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTR=
IBUTE

Krzysztof Kozlowski (2):
      MAINTAINERS: use Krzysztof Kozlowski's Canonical address
      ARM: exynos: correct kernel doc in platsmp

Kunihiko Hayashi (1):
      MAINTAINERS: Update ARM/UniPhier SoCs maintainers and status

Lee Jones (1):
      ARM: at91: pm: Move prototypes to mutually included header

Lifu Chen (1):
      ARM: OMAP2+: Use DEFINE_SPINLOCK() for spinlock

Nicolas Saenz Julienne (2):
      MAINTAINERS: Update BCM2711/BCM2335 maintainer's mail
      mailmap: Update email address for Nicolas Saenz

Nobuhiro Iwamatsu (1):
      ARM: imx: Kconfig: Fix typo in help

Tony Lindgren (81):
      bus: ti-sysc: Fix initializing module_pa for modules without sysc reg=
ister
      bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first
      bus: ti-sysc: Detect more modules for debugging
      bus: ti-sysc: Check for old incomplete dtb
      ARM: OMAP2+: Init both prm and prcm nodes early for clocks
      soc: ti: omap-prm: Allow hardware supported retention when idle
      clk: ti: omap5: Add missing gpmc and ocmc clkctrl
      PCI: pci-dra7xx: Prepare for deferred probe with module_platform_driv=
er
      ARM: dts: Update pcie ranges for dra7
      ARM: dts: Configure interconnect target module for dra7 pcie
      ARM: dts: Properly configure dra7 edma sysconfig registers
      ARM: OMAP2+: Drop legacy platform data for dra7 pcie
      ARM: dts: Move dra7 l3 noc to a separate node
      ARM: OMAP2+: Drop legacy platform data for dra7 qspi
      ARM: dts: Configure interconnect target module for dra7 qspi
      ARM: OMAP2+: Drop legacy platform data for dra7 sata
      ARM: dts: Configure interconnect target module for dra7 sata
      ARM: OMAP2+: Drop legacy platform data for dra7 mpu
      ARM: dts: Configure interconnect target module for dra7 mpu
      ARM: OMAP2+: Drop legacy platform data for dra7 dmm
      ARM: dts: Configure interconnect target module for dra7 dmm
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_wkup
      ARM: dts: Configure simple-pm-bus for dra7 l4_wkup
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_per1
      ARM: dts: Configure simple-pm-bus for dra7 l4_per1
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_per2
      ARM: dts: Configure simple-pm-bus for dra7 l4_per2
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_per3
      ARM: dts: Configure simple-pm-bus for dra7 l4_per3
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_cfg
      ARM: dts: Configure simple-pm-bus for dra7 l4_cfg
      ARM: OMAP2+: Drop legacy platform data for dra7 l3
      ARM: dts: Configure simple-pm-bus for dra7 l3
      ARM: OMAP2+: Drop legacy platform data for dra7 hwmod
      ARM: dts: Configure power-domain for omap4 gfx
      ARM: dts: Configure power-domain for omap4 dts iss
      ARM: dts: Configure interconnect target module for omap4 dmm
      ARM: dts: Configure interconnect target module for omap4 emif
      ARM: dts: Configure interconnect target module for omap4 debugss
      ARM: dts: Configure interconnect target module for omap4 mpu
      ARM: dts: Move omap4 mmio-sram out of l3 interconnect
      ARM: dts: Move omap4 l3-noc to a separate node
      ARM: dts: Configure simple-pm-bus for omap4 l4_wkup
      ARM: dts: Configure simple-pm-bus for omap4 l4_per
      ARM: dts: Configure simple-pm-bus for omap4 l4_cfg
      ARM: OMAP2+: Drop legacy platform data for omap4 iss
      ARM: OMAP2+: Drop legacy platform data for omap4 control modules
      ARM: dts: Prepare for simple-pm-bus for omap4 l3
      ARM: OMAP2+: Drop legacy platform data for omap4 dmm
      ARM: OMAP2+: Drop legacy platform data for omap4 emif
      ARM: OMAP2+: Drop legacy platform data for omap4 debugss
      ARM: OMAP2+: Drop legacy platform data for omap4 mpu
      ARM: OMAP2+: Drop legacy platform data for omap4 l4_wkup
      ARM: OMAP2+: Drop legacy platform data for omap4 l4_per
      ARM: OMAP2+: Drop legacy platform data for omap4 l4_cfg
      ARM: OMAP2+: Drop legacy platform data for omap4 l3
      ARM: OMAP2+: Drop legacy platform data for omap4 hwmod
      ARM: dts: Configure interconnect target module for omap5 dmm
      ARM: dts: Configure interconnect target module for omap5 emif
      ARM: dts: Configure interconnect target module for omap5 mpu
      ARM: dts: Configure interconnect target module for omap5 gpmc
      ARM: dts: Configure interconnect target module for omap5 sata
      ARM: dts: Move omap5 mmio-sram out of l3 interconnect
      ARM: dts: Move omap5 l3-noc to a separate node
      ARM: dts: Configure simple-pm-bus for omap5 l4_wkup
      ARM: dts: Configure simple-pm-bus for omap5 l4_per
      ARM: dts: Configure simple-pm-bus for omap5 l4_cfg
      ARM: dts: Configure simple-pm-bus for omap5 l3
      ARM: OMAP2+: Drop legacy platform data for omap5 dmm
      ARM: OMAP2+: Drop legacy platform data for omap5 emif
      ARM: OMAP2+: Drop legacy platform data for omap5 mpu
      ARM: OMAP2+: Drop legacy platform data for omap5 sata
      ARM: OMAP2+: Drop legacy platform data for omap5 l4_wkup
      ARM: OMAP2+: Drop legacy platform data for omap5 l4_per
      ARM: OMAP2+: Drop legacy platform data for omap5 l4_cfg
      ARM: OMAP2+: Drop legacy platform data for omap5 l3
      ARM: OMAP2+: Drop legacy platform data for omap5 hwmod
      Merge tags 'genpd-dts-dra7', 'genpd-dts-omap4' and
'genpd-dts-omap5' into omap-for-v5.13/dts-genpd
      Merge branches 'omap-for-v5.13/genpd-dra7',
'omap-for-v5.13/genpd-omap4' and 'omap-for-v5.13/genpd-omap5' into
omap-for-v5.13/genpd-drop-legacy
      ARM: OMAP2+: Stop building legacy code for dra7 and omap4/5
      bus: ti-sysc: Warn about old dtb for dra7 and omap4/5

Uwe Kleine-K=C3=B6nig (1):
      ARM: s3c: Use pwm_get() in favour of pwm_request() in RX1950

Yang Li (2):
      ARM: OMAP2+: add missing call to of_node_put()
      ARM: OMAP2+: use true and false for bool variable

 .mailmap                                   |   2 +
 MAINTAINERS                                |  30 +-
 arch/arm/boot/dts/dra7-l4.dtsi             |  75 ++-
 arch/arm/boot/dts/dra7.dtsi                | 220 +++++---
 arch/arm/boot/dts/omap4-l4.dtsi            |  43 +-
 arch/arm/boot/dts/omap4.dtsi               | 169 ++++--
 arch/arm/boot/dts/omap4460.dtsi            |  13 +-
 arch/arm/boot/dts/omap5-l4.dtsi            |  67 ++-
 arch/arm/boot/dts/omap5.dtsi               | 204 ++++---
 arch/arm/mach-at91/pm.c                    |  19 +-
 arch/arm/mach-exynos/platsmp.c             |  28 +-
 arch/arm/mach-hisi/hisilicon.c             |   4 +-
 arch/arm/mach-hisi/hotplug.c               |   2 +-
 arch/arm/mach-hisi/platmcpm.c              |   2 +-
 arch/arm/mach-hisi/platsmp.c               |   2 +-
 arch/arm/mach-imx/Kconfig                  |   2 +-
 arch/arm/mach-imx/pm-imx5.c                |   2 +-
 arch/arm/mach-omap1/timer.c                |   2 +-
 arch/arm/mach-omap2/Kconfig                |   3 -
 arch/arm/mach-omap2/Makefile               |  11 +-
 arch/arm/mach-omap2/common.h               |   9 -
 arch/arm/mach-omap2/io.c                   |  12 +-
 arch/arm/mach-omap2/omap_hwmod.c           |   9 +-
 arch/arm/mach-omap2/omap_hwmod.h           |  14 +-
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 877 -------------------------=
----
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 467 ---------------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c  | 719 -----------------------
 arch/arm/mach-omap2/omap_twl.c             |   2 +-
 arch/arm/mach-omap2/pdata-quirks.c         |  31 +-
 arch/arm/mach-omap2/pm-debug.c             |   4 +-
 arch/arm/mach-omap2/powerdomain.c          |  12 +-
 arch/arm/mach-omap2/sr_device.c            |   7 +
 arch/arm/mach-s3c/mach-rx1950.c            |  11 +-
 arch/arm/mach-ux500/platsmp.c              |   2 +-
 arch/arm/plat-omap/dma.c                   |   3 +-
 drivers/bus/ti-sysc.c                      |  81 ++-
 drivers/clk/ti/clk-54xx.c                  |   2 +
 drivers/pci/controller/dwc/pci-dra7xx.c    |  13 +-
 drivers/pinctrl/pinctrl-at91.c             |   2 +
 drivers/soc/ti/omap_prm.c                  |  16 +-
 include/dt-bindings/clock/omap5.h          |   2 +
 include/soc/at91/pm.h                      |  16 +
 42 files changed, 758 insertions(+), 2453 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_44xx_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_54xx_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_7xx_data.c
 create mode 100644 include/soc/at91/pm.h
