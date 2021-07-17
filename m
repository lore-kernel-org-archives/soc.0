Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5844AC636CA
	for <soc@archiver.kernel.org>; Sat, 17 Jul 2021 22:22:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0FC3061158; Sat, 17 Jul 2021 22:22:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDF7161103
	for <soc@kernel.org>; Sat, 17 Jul 2021 22:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626560551;
	bh=F+pe8G5tf1odjLKk1aOh3knoF5FZEOkua0uvvlUMwGA=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=sS9Mm4Zl7lq59NKA3yvdYX9rGhsch7E/2EtK+h56ds0M732N+yy9MF0Fuh3YX2cBZ
	 1jsbe1QzzeDDK1wiFeUndZI5XuprLHEVsazTcU24cwlFNwLx5zn34MsJvtwgiBd1zx
	 vH3efIoN3IX6Fs5yKqVAaiigAJdddNmF+HahYvXMHWUcRKyXaSU8Dr/+LIyhIM5ggO
	 zAgbODFhPZHMULDdgFZQXZdH2f+biqzgiIRyrN8RLdnm8oLE386UJFLXqUwNKrRXjg
	 P4zZ5aDfuL4h/453InJ0cjNt3iZLQ0ZdzXeBZPPCiXKubc0zGWQczgqpe0qt5FBG91
	 dz4HwlENfGdGg==
Received: by mail-wr1-f45.google.com with SMTP id d2so16448506wrn.0
        for <soc@kernel.org>; Sat, 17 Jul 2021 15:22:30 -0700 (PDT)
X-Gm-Message-State: AOAM530vVEp3L6lQ5P6DUZ8SRUeGs25A6t0KEtZ0/sVkYuoTpx6563N5
	6JmjmEouItE35CCupdETMoNDNnswHVCMZDrU+60=
X-Google-Smtp-Source: ABdhPJww3v2WZIz1aVBdlRBNtjhm3FDEjVVLoCUihUAupuKZjcqFEYEieJ0OpGJ6KIfW2jHTrrSzt4YTgvKC+mVPds4=
X-Received: by 2002:a5d:438c:: with SMTP id i12mr21144071wrq.99.1626560549510;
 Sat, 17 Jul 2021 15:22:29 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 18 Jul 2021 00:22:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2ZaPZ7y6-GKTuZ1QseNNmNOQP=kS8y8rEnF5LCvOF56Q@mail.gmail.com>
Message-ID: <CAK8P3a2ZaPZ7y6-GKTuZ1QseNNmNOQP=kS8y8rEnF5LCvOF56Q@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.14
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3=
:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.14-1

for you to fetch changes up to 82a1c67554dff610d6be4e1982c425717b3c6a23:

  ARM: dts: versatile: Fix up interrupt controller node names
(2021-07-16 23:05:35 +0200)

----------------------------------------------------------------
ARM: SoC fixes for v5.14

Here are the patches for this week that came as the fallout of
the merge window:

 - Two fixes for the NVidia memory controller driver

 - multiple defconfig files get patched to turn CONFIG_FB back on
   after that is no longer selected by CONFIG_DRM

 - ffa and scmpi firmware drivers fixes, mostly addressing compiler
   and documentation warnings

 - Platform specific fixes for device tree files on ASpeed,
   Renesas and NVidia SoC, mostly for recent regressions.

 - A workaround for a regression on the USB PHY with devlink when
   the usb-nop-xceiv driver is not available until the rootfs is
   mounted.

 - Device tree compiler warnings in Arm Versatile-AB

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Andrew Jeffery (2):
      ARM: dts: tacoma: Add phase corrections for eMMC
      ARM: dts: everest: Add phase corrections for eMMC

Arnd Bergmann (6):
      Merge tag 'memory-controller-drv-tegra-5.14-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/fixes
      Merge tag 'renesas-fixes-for-v5.14-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/fixes
      Merge tag 'tegra-for-5.14-arm64-dt-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/fixes
      Merge tag 'arm-ffa-fixes-5.14' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'scmi-fixes-5.14' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'aspeed-5.14-devicetree-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/fixes

B. J. Wyman (1):
      ARM: dts: aspeed: everest: PSU #3 address change

Biju Das (5):
      clk: renesas: rzg2l: Add multi clock PM support
      clk: renesas: r9a07g044: Rename divider table
      clk: renesas: r9a07g044: Fix P1 Clock
      clk: renesas: r9a07g044: Add P2 Clock support
      dt-bindings: clock: r9a07g044-cpg: Update clock/reset definitions

Cristian Marussi (3):
      firmware: arm_scmi: Fix kernel doc warnings about return values
      firmware: arm_scmi: Avoid padding in sensor message structure
      firmware: arm_scmi: Fix range check for the maximum number of
pending messages

Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Restore graphical consoles
      arm: Typo s/PCI_IXP4XX_LEGACY/IXP4XX_PCI_LEGACY/

Joel Stanley (1):
      ARM: dts: aspeed: Fix AST2600 machines line names

Linus Walleij (5):
      ARM: configs: Update Integrator defconfig
      ARM: configs: Update RealView defconfig
      ARM: configs: Update Versatile defconfig
      ARM: configs: Update Vexpress defconfig
      ARM: configs: Update u8500_defconfig

Stefan Wahren (1):
      ARM: multi_v7_defconfig: Make NOP_USB_XCEIV driver built-in

Sudeep Holla (8):
      firmware: arm_scmi: Simplify device probe function on the bus
      firmware: arm_scmi: Ensure drivers provide a probe function
      firmware: arm_scmi: Fix possible scmi_linux_errmap buffer overflow
      firmware: arm_ffa: Fix the comment style
      firmware: arm_ffa: Fix a possible ffa_linux_errmap buffer overflow
      firmware: arm_scmi: Fix kernel doc warnings
      firmware: arm_scpi: Fix kernel doc warnings
      ARM: dts: versatile: Fix up interrupt controller node names

Thierry Reding (4):
      memory: tegra: Add compile-test stub for tegra_mc_probe_device()
      dt-bindings: arm-smmu: Fix json-schema syntax
      arm64: tegra: Enable audio IOMMU support on Tegra194
      arm64: tegra: Enable SMMU support for USB on Tegra194

Uwe Kleine-K=C3=B6nig (2):
      firmware: arm_ffa: Ensure drivers provide a probe function
      firmware: arm_ffa: Simplify probe function

Zev Weiss (1):
      ARM: dts: aspeed: Update e3c246d4i vuart properties

 .../devicetree/bindings/iommu/arm,smmu.yaml        |   6 +-
 arch/arm/Kconfig                                   |   2 +-
 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  |   4 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |   9 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |   5 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |   6 +-
 arch/arm/boot/dts/versatile-ab.dts                 |   5 +-
 arch/arm/boot/dts/versatile-pb.dts                 |   2 +-
 arch/arm/configs/integrator_defconfig              |   5 +-
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm/configs/realview_defconfig                |   4 +-
 arch/arm/configs/shmobile_defconfig                |   1 +
 arch/arm/configs/u8500_defconfig                   |   5 +
 arch/arm/configs/versatile_defconfig               |   4 +-
 arch/arm/configs/vexpress_defconfig                |  17 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  13 ++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   4 +-
 drivers/clk/renesas/r9a07g044-cpg.c                |  79 ++++---
 drivers/clk/renesas/renesas-rzg2l-cpg.c            | 110 +++++-----
 drivers/clk/renesas/renesas-rzg2l-cpg.h            |  37 +++-
 drivers/firmware/arm_ffa/bus.c                     |   6 +-
 drivers/firmware/arm_ffa/driver.c                  |   8 +-
 drivers/firmware/arm_scmi/bus.c                    |   8 +-
 drivers/firmware/arm_scmi/driver.c                 |  14 +-
 drivers/firmware/arm_scmi/notify.c                 |   4 +
 drivers/firmware/arm_scmi/sensors.c                |   6 +-
 include/dt-bindings/clock/r9a07g044-cpg.h          | 236 ++++++++++++++++-=
----
 include/linux/scmi_protocol.h                      |  14 +-
 include/linux/scpi_protocol.h                      |   8 +
 include/soc/tegra/mc.h                             |   9 +-
 30 files changed, 418 insertions(+), 215 deletions(-)
