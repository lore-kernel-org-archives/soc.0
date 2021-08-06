Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A07C4338F
	for <soc@archiver.kernel.org>; Fri,  6 Aug 2021 14:26:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 42EC8611C6; Fri,  6 Aug 2021 14:26:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26D3460F35;
	Fri,  6 Aug 2021 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628260004;
	bh=1V40m9J7u74ExPdnQHOo1zitT9C2WI7fUkNGv9JS+Ng=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=Zy92C0uowbZ5/1RQAfmFbhAQJXGSNmLWkPZ/77mw2hj2Taaxf5Q76O6ePAPnORHtS
	 sk9usOVS3XaYGI6/631XC6E7fQzjmNCMf0BMmd/EmKHwnUG3BbgkIRQWIbtFJ1QEuo
	 b9cURQX+VZVa0IgB0iZLUjw2ZAshbprPZmN4SX1ZfIR/oVXi6N6dJNSUt6WsMPXQ1e
	 ekz7yY+1YuQ2+sFh0rqpmlliZz7MenW1M8jlEWWjMS2zYxZEfzIeBwEMAQ3/xsZSfn
	 PyXNlxyqnSyLUWdH+aAXun+76C+KPcj1VOgyi9fgexy7Fbe0hIXCC1PpVmlmkyT6Fp
	 OWD8gC2RCWkUA==
Received: by mail-wr1-f49.google.com with SMTP id c16so11312460wrp.13;
        Fri, 06 Aug 2021 07:26:44 -0700 (PDT)
X-Gm-Message-State: AOAM531wU+Ey/Cz8XSbLnXBq0LDbCPLe/kupAv9j/bL/h/tGriJCfP6V
	WpJaHgePRXYM3NCMLJOeyYgTKmS7s/61wk3j9bk=
X-Google-Smtp-Source: ABdhPJzKTM5Fvtiecma5pmcB2NkqLXKu9TT/ncTmHIdtjvSh6fmsZ9GAkn9GATYGDmuKbMRlnDs28VI9/9w1ETSdpOg=
X-Received: by 2002:adf:f7c5:: with SMTP id a5mr11137061wrq.99.1628260002713;
 Fri, 06 Aug 2021 07:26:42 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 6 Aug 2021 16:26:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1u+0tJUqnSOWmC5ixdeGGoBb+mVv30rc65Bjy7a1Wo7w@mail.gmail.com>
Message-ID: <CAK8P3a1u+0tJUqnSOWmC5ixdeGGoBb+mVv30rc65Bjy7a1Wo7w@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.14, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit c500bee1c5b2f1d59b1081ac879d73268ab0ff17=
:

  Linux 5.14-rc4 (2021-08-01 17:04:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.14-2

for you to fetch changes up to 19c1eb3605a1bcd784726380f520925948b2962e:

  Merge tag 'omap-for-v5.14/fixes-rc5-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes (2021-08-03 17:05:36 +0200)

----------------------------------------------------------------
ARM: SoC fixes for v5.14, part 2

Lots of small fixes for Arm SoCs this time, nothing
too worrying:

 - omap/beaglebone boot regression fix in gpt12 timer

 - revert for i.mx8 soc driver breaking as a platform_driver

 - kexec/kdump fixes for op-tee

 - various fixes for incorrect DT settings on imx, mvebu, omap,
   stm32, and tegra causing problems.

 - device tree fixes for static checks in nomadik, versatile, stm32

 - code fixes for issues found in build testing and with static
   checking on tegra, ixp4xx, imx, omap

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Allen Pais (2):
      optee: fix tee out of memory failure seen during kexec reboot
      firmware: tee_bnxt: Release TEE shm, session, and context during kexe=
c

Arnd Bergmann (10):
      Merge tag 'tegra-for-5.14-rc3-arm64-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/fixes
      ARM: ixp4xx: fix compile-testing soc drivers
      ARM: ixp4xx: goramo_mlr depends on old PCI driver
      Merge tag 'imx-fixes-5.14' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge tag 'tee-kexec-fixes-for-v5.14' of
git://git.linaro.org:/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'stm32-dt-for-v5.14-fixes-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into
arm/fixes
      Merge tag 'mvebu-fixes-5.14-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/fixes
      soc: ixp4xx: fix printing resources
      soc: ixp4xx/qmgr: fix invalid __iomem access
      Merge tag 'omap-for-v5.14/fixes-rc5-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes

Colin Ian King (1):
      ARM: imx: fix missing 3rd argument in macro imx_mmdc_perf_init

Dario Binacchi (1):
      ARM: dts: am437x-l4: fix typo in can@0 node

Dave Gerlach (1):
      ARM: dts: am43x-epos-evm: Reduce i2c0 bus speed for tps65218

Dmitry Osipenko (1):
      soc/tegra: Make regulator couplers depend on CONFIG_REGULATOR

Fabio Estevam (1):
      ARM: imx: common: Move prototype outside the SMP block

H. Nikolaus Schaller (1):
      omap5-board-common: remove not physically existing vdds_1v8_main
fixed-regulator

Jens Wiklander (1):
      tee: add tee_shm_alloc_kernel_buf()

Kevin Hilman (1):
      bus: ti-sysc: AM3: RNG is GP only

Lucas Stach (1):
      Revert "soc: imx8m: change to use platform driver"

Marek Vasut (4):
      ARM: dts: imx: Swap M53Menlo pinctrl_power_button/pinctrl_power_out p=
ins
      ARM: dts: stm32: Prefer HW RTC on DHCOM SoM
      ARM: dts: stm32: Disable LAN8710 EDPD on DHCOM
      ARM: dts: stm32: Fix touchscreen IRQ line assignment on DHCOM

Maxime Chevallier (1):
      ARM: dts: imx6qdl-sr-som: Increase the PHY reset duration to 10ms

Michael Walle (1):
      arm64: dts: ls1028: sl28: fix networking for variant 2

Oleksandr Suvorov (1):
      ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz

Pali Roh=C3=A1r (1):
      arm64: dts: armada-3720-turris-mox: remove mrvl,i2c-fast-mode

Sudeep Holla (1):
      ARM: dts: nomadik: Fix up interrupt controller node names

Sumit Garg (1):
      tee: Correct inappropriate usage of TEE_SHM_DMA_BUF flag

Tero Kristo (1):
      ARM: omap2+: hwmod: fix potential NULL pointer access

Tony Lindgren (2):
      bus: ti-sysc: Fix gpt12 system timer issue with reserved status
      Merge branch 'fixes-v5.14' into fixes

Tyler Hicks (4):
      optee: Fix memory leak when failing to register shm pages
      optee: Refuse to load the driver under the kdump kernel
      optee: Clear stale cache entries during initialization
      tpm_ftpm_tee: Free and unregister TEE shared memory during kexec

Vidya Sagar (1):
      arm64: tegra: Enable SMMU support for PCIe on Tegra194

Vladimir Oltean (2):
      arm64: dts: ls1028a: fix node name for the sysclk
      arm64: dts: armada-3720-turris-mox: fixed indices for the SDHC contro=
llers

Yang Yingliang (2):
      ARM: imx: add missing iounmap()
      ARM: imx: add missing clk_disable_unprepare()

 arch/arm/boot/dts/am437x-l4.dtsi                   |  2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts               |  2 +-
 arch/arm/boot/dts/imx53-m53menlo.dts               |  4 +-
 arch/arm/boot/dts/imx6qdl-sr-som.dtsi              |  8 ++-
 arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi        |  1 +
 arch/arm/boot/dts/omap5-board-common.dtsi          |  9 +--
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi         |  4 +-
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      | 24 ++++---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |  5 +-
 arch/arm/mach-imx/common.h                         |  2 +-
 arch/arm/mach-imx/mmdc.c                           | 17 ++++-
 arch/arm/mach-ixp4xx/Kconfig                       |  1 +
 arch/arm/mach-omap2/omap_hwmod.c                   | 10 ++-
 .../freescale/fsl-ls1028a-kontron-sl28-var2.dts    |  2 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  2 +-
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |  3 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 60 ++++++++++++++--
 drivers/bus/ti-sysc.c                              | 22 ++++--
 drivers/char/tpm/tpm_ftpm_tee.c                    |  8 +--
 drivers/firmware/broadcom/tee_bnxt_fw.c            | 14 +++-
 drivers/soc/Makefile                               |  2 +-
 drivers/soc/imx/soc-imx8m.c                        | 84 ++++--------------=
----
 drivers/soc/ixp4xx/ixp4xx-npe.c                    | 12 ++--
 drivers/soc/ixp4xx/ixp4xx-qmgr.c                   | 10 +--
 drivers/soc/tegra/Kconfig                          |  6 +-
 drivers/tee/optee/call.c                           | 38 ++++++++--
 drivers/tee/optee/core.c                           | 43 ++++++++++-
 drivers/tee/optee/optee_private.h                  |  1 +
 drivers/tee/optee/rpc.c                            |  5 +-
 drivers/tee/optee/shm_pool.c                       | 20 ++++--
 drivers/tee/tee_shm.c                              | 20 +++++-
 include/linux/tee_drv.h                            |  2 +
 32 files changed, 292 insertions(+), 151 deletions(-)
