Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6318C433EF
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 21:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D21F0C36AED; Thu, 23 Dec 2021 21:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B828AC36AE9
	for <soc@kernel.org>; Thu, 23 Dec 2021 21:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640295275;
	bh=8CWUGbHM/OuqQ2v63YBOubYxV7LdsZFAKvQ3ZO/jx+E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=o0Td/Xh2kvkAAG6NF+Zj9RJKcxXlLiXvlcJqAlIu0JpqQjGeO2iQyDJ/tOIYSm3HR
	 SYZ00BdKzGbFLsYl+QHdSkEeUAxFHJfEOcRD5qL5lXPWSISKxEPejr5f+8QQsGEqBA
	 VmmleWMv3x2m7/lc9BesZUJC/i2A2f/QUp7DwcY08FwmW+Z8mOJ6wc2fS2wGHmX5i7
	 wl3N+1m5UOj+debpSDsHLJdHjKVF/3h1QBKLR87VVdGkBhODdu6JQb8mRjPn1CgGwr
	 PFjhUIfelnSBT5hRziifr18JLRIDWsOOe3M9VgEOcFitjO9LyWdm7WneEZRSlWarvR
	 CdWGywkdu75Jw==
Received: by mail-wm1-f42.google.com with SMTP id bg2-20020a05600c3c8200b0034565c2be15so6358881wmb.0
        for <soc@kernel.org>; Thu, 23 Dec 2021 13:34:35 -0800 (PST)
X-Gm-Message-State: AOAM533pV9LPFvdUypUEXxUy+1S4gmRNx2A0XPaPJSLYb436wLzUBiNC
	fVmUHHt4l8EaiciCwB8JUzWSTXgYbURE0GKpKUs=
X-Google-Smtp-Source: ABdhPJxikkPHx5HHm6jH68aIg4cQ/BaewHUg1lQ214H0yj1mOE6ONR8Kg6kHeJcDiJBJb7A1KatvSu2P2a9EU/1F8WU=
X-Received: by 2002:a7b:c198:: with SMTP id y24mr2989829wmi.1.1640295274032;
 Thu, 23 Dec 2021 13:34:34 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 23 Dec 2021 22:34:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2WjTojdOwr-k6HHQuBXMHU-2wRC3rQacQx8SL6W2cK-g@mail.gmail.com>
Message-ID: <CAK8P3a2WjTojdOwr-k6HHQuBXMHU-2wRC3rQacQx8SL6W2cK-g@mail.gmail.com>
Subject: [GIT PULL 3/5] ARM: SoC driver updates for v5.17
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.17

for you to fetch changes up to 13ee75c7b57c546f7973984d9a87cfa7d73cbf5c:

  Merge tag 'qcom-drivers-for-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/drivers (2021-12-21 13:42:52 +0100)

----------------------------------------------------------------
ARM: SoC driver updates for v5.17

There are cleanups and minor bugfixes across several SoC specific
drivers, for Qualcomm, Samsung, NXP i.MX, AT91, Tegra, Keystone,
Renesas, ZynqMP

Noteworthy new features are:

 - The op-tee firmware driver gains support for asynchronous
   notifications from secure-world firmware.

 - Qualcomm platforms gain support for new SoC types in various
   drivers: power domain, cache controller, RPM sleep, soc-info

 - Samsung SoC drivers gain support for new SoCs in ChipID and PMU,
   as well as a new USIv2 driver that handles various types of
   serial communiction (uart, i2c, spi)

 - Renesas adds support for R-Car S4-8 (R8A779F0) in multiple
   drivers, as well as memory controller support for RZ/G2L
   (R9A07G044).

 - Apple M1 gains support for the PMGR power management driver

----------------------------------------------------------------
Adam Ford (5):
      soc: imx: gpcv2: keep i.MX8MM VPU-H1 bus clock active
      soc: imx: gpcv2: keep i.MX8MN gpumix bus clock enabled
      soc: imx: gpcv2: Add dispmix and mipi domains to imx8mn
      dt-bindings: power: imx8mn: add defines for DISP blk-ctrl domains
      soc: imx: imx8m-blk-ctrl: add i.MX8MN DISP blk-ctrl

Arnd Bergmann (14):
      Merge tag 'renesas-drivers-for-v5.17-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/drivers
      Merge tag 'asahi-soc-pmgr-5.17' of
https://github.com/AsahiLinux/linux into arm/drivers
      Merge tag 'zynqmp-soc-for-v5.17' of
https://github.com/Xilinx/linux-xlnx into arm/drivers
      Merge tag 'optee-async-notif-for-v5.17' of
https://git.linaro.org/people/jens.wiklander/linux-tee into
arm/drivers
      Merge tag 'memory-controller-drv-renesas-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'asahi-soc-pmgr-5.17-v2' of
https://github.com/AsahiLinux/linux into arm/drivers
      Merge tag 'renesas-drivers-for-v5.17-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/drivers
      Merge tag 'ti-driver-soc-fixes-for-v5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into
arm/drivers
      Merge tag 'tegra-for-5.17-drivers' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/drivers
      Merge tag 'tegra-for-5.17-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/drivers
      Merge tag 'at91-soc-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/drivers
      Merge tag 'imx-drivers-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/drivers
      Merge tag 'samsung-drivers-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into
arm/drivers
      Merge tag 'qcom-drivers-for-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/drivers

Aswath Govindraju (1):
      soc: ti: k3-socinfo: Add entry for J721S2 SoC family

Changcheng Deng (1):
      PM: AVS: qcom-cpr: Use div64_ul instead of do_div

David Virag (1):
      soc: samsung: exynos-chipid: add Exynos7885 SoC support

Dmitry Baryshkov (4):
      soc: qcom: smem: Update max processor count
      dt-bindings: power: rpmpd: Add SM8450 to rpmpd binding
      soc: qcom: rpmhpd: Add SM8450 power domains
      soc: qcom: socinfo: add SM8450 ID

Dmitry Osipenko (15):
      soc/tegra: Don't print error message when OPPs not available
      soc/tegra: fuse: Reset hardware
      soc/tegra: fuse: Use resource-managed helpers
      soc/tegra: regulators: Prepare for suspend
      soc/tegra: Enable runtime PM during OPP state-syncing
      soc/tegra: pmc: Rename 3d power domains
      soc/tegra: Add devm_tegra_core_dev_init_opp_table_common()
      soc/tegra: pmc: Rename core power domain
      usb: chipidea: tegra: Add runtime PM and OPP support
      bus: tegra-gmi: Add runtime PM and OPP support
      pwm: tegra: Add runtime PM and OPP support
      mmc: sdhci-tegra: Add runtime PM and OPP support
      mtd: rawnand: tegra: Add runtime PM and OPP support
      spi: tegra20-slink: Add OPP support
      media: staging: tegra-vde: Support generic power domain

Geert Uytterhoeven (2):
      soc: renesas: Consolidate product register handling
      Merge tag 'renesas-r8a779f0-dt-binding-defs-tag' into
renesas-drivers-for-v5.17

Hector Martin (3):
      soc: apple: Add driver for Apple PMGR power state controls
      soc: apple: apple-pmgr-pwrstate: Add auto-PM min level support
      soc: apple: apple-pmgr-pwrstate: Do not build as a module

Ivan Bornyakov (1):
      bus: imx-weim: optionally enable continuous burst clock

Jan Kiszka (1):
      soc: ti: pruss: fix referenced node in error message

Jason Wang (3):
      soc: qcom: qmi: Fix a typo in a comment
      firmware: ti_sci: rm: remove unneeded semicolon
      soc: qcom: rpmh-rsc: Fix typo in a comment

Jens Wiklander (6):
      docs: staging/tee.rst: add a section on OP-TEE notifications
      dt-bindings: arm: optee: add interrupt property
      tee: fix put order in teedev_close_context()
      tee: export teedev_open() and teedev_close_context()
      optee: separate notification functions
      optee: add asynchronous notifications

Jon Hunter (1):
      soc/tegra: pmc: Add reboot notifier

Julien Massot (1):
      soc: renesas: rcar-rst: Add support to set rproc boot address

Konrad Dybcio (2):
      soc: qcom: llcc: Add configuration data for SM8350
      dt-bindings: arm: msm: Add LLCC for SM6350

Krzysztof Kozlowski (3):
      soc: samsung: exynos-chipid: describe which SoCs go with compatibles
      Merge tag 'samsung-dt64-exynos-usi-5.17' into next/drivers
      dt-bindings: soc: samsung: keep SoC driver bindings together

Lad Prabhakar (6):
      dt-bindings: memory: renesas,rpc-if: Add support for the R9A07G044
      dt-bindings: memory: renesas,rpc-if: Add optional interrupts property
      memory: renesas-rpc-if: Return error in case devm_ioremap_resource() fails
      memory: renesas-rpc-if: Drop usage of RPCIF_DIRMAP_SIZE macro
      memory: renesas-rpc-if: Add support for RZ/G2L
      memory: renesas-rpc-if: Silence clang warning

Luca Weiss (3):
      dt-bindings: firmware: scm: Add SM6350 compatible
      dt-bindings: arm: msm: Don't mark LLCC interrupt as required
      soc: qcom: socinfo: Add SM6350 and SM7225

Marek Vasut (1):
      soc: imx: gpcv2: Synchronously suspend MIX domains

Martin Botka (2):
      dt-bindings: qcom-rpmpd: Add sm6125 power domains
      soc: qcom: rpmpd: Add support for sm6125

Miaoqian Lin (1):
      soc: ti: knav_dma: Fix NULL vs IS_ERR() checking in dma_init

Michael Tretter (4):
      soc: xilinx: move PM_INIT_FINALIZE to zynqmp_pm_domains driver
      soc: xilinx: cleanup debug and error messages
      soc: xilinx: use a properly named field instead of flags
      soc: xilinx: add a to_zynqmp_pm_domain macro

Rajan Vaja (1):
      firmware: xilinx: check return value of zynqmp_pm_get_api_version()

Rajendra Nayak (4):
      soc: qcom: rpmhpd: sm8450: Add the missing .peer for sm8450_cx_ao
      soc: qcom: rpmhpd: Rename rpmhpd struct names
      soc: qcom: rpmhpd: Remove mx/cx relationship on sc7280
      soc: qcom: rpmhpd: Sort power-domain definitions and lists

Rikard Falkeborn (1):
      soc: qcom: aoss: constify static struct thermal_cooling_device_ops

Sam Protsenko (4):
      dt-bindings: samsung: pmu: Document Exynos850
      soc: samsung: exynos-pmu: Add Exynos850 support
      dt-bindings: soc: samsung: Add Exynos USI bindings
      soc: samsung: Add USI driver

Shawn Guo (3):
      soc: qcom: rpmpd: Drop unused res_name from struct rpmpd
      dt-bindings: power: rpmpd: Add QCM2290 support
      soc: qcom: rpmpd: Add QCM2290 support

Stephan Gerhold (2):
      dt-bindings: soc: qcom: stats: Document compatibles with fixed offset
      soc: qcom: stats: Add fixed sleep stats offset for older RPM firmwares

Thierry Reding (1):
      Merge branch 'tegra-for-5.17-soc-opp' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
for-5.17/drivers

Vinod Koul (3):
      dt-bindings: arm: cpus: Add kryo780 compatible
      dt-bindings: firmware: scm: Add SM8450 compatible
      dt-bindings: arm: qcom: Document SM8450 SoC and boards

Wan Jiabing (1):
      ARM: at91: pm: Add of_node_put() before goto

Wolfram Sang (3):
      memory: renesas-rpc-if: simplify register update
      memory: renesas-rpc-if: avoid use of undocumented bits
      memory: renesas-rpc-if: refactor MOIIO and IOFV macros

Yang Li (1):
      optee: Fix NULL but dereferenced coccicheck error

Yoshihiro Shimoda (6):
      dt-bindings: power: Add r8a779f0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779f0 CPG Core Clock Definitions
      soc: renesas: rcar-gen4-sysc: Introduce R-Car Gen4 SYSC driver
      soc: renesas: r8a779f0-sysc: Add r8a779f0 support
      soc: renesas: Identify R-Car S4-8
      soc: renesas: rcar-rst: Add support for R-Car S4-8

 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 .../bindings/arm/firmware/linaro,optee-tz.yaml     |   8 +
 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   2 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |   2 +
 .../memory-controllers/renesas,rpc-if.yaml         |  54 ++-
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   3 +
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |   5 +
 .../{arm => soc}/samsung/exynos-chipid.yaml        |   2 +-
 .../pmu.yaml => soc/samsung/exynos-pmu.yaml}       |   4 +-
 .../bindings/soc/samsung/exynos-usi.yaml           | 159 +++++++++
 Documentation/staging/tee.rst                      |  30 ++
 MAINTAINERS                                        |   1 +
 arch/arm/mach-at91/pm.c                            |   2 +
 drivers/bus/imx-weim.c                             |  18 +-
 drivers/bus/tegra-gmi.c                            |  50 ++-
 drivers/firmware/ti_sci.c                          |   2 +-
 drivers/firmware/xilinx/zynqmp.c                   |   5 +-
 drivers/memory/renesas-rpc-if.c                    | 109 +++---
 drivers/mmc/host/sdhci-tegra.c                     |  81 ++++-
 drivers/mtd/hyperbus/rpc-if.c                      |   4 +-
 drivers/mtd/nand/raw/tegra_nand.c                  |  58 +++-
 drivers/pwm/pwm-tegra.c                            |  82 ++++-
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/apple/Kconfig                          |  22 ++
 drivers/soc/apple/Makefile                         |   2 +
 drivers/soc/apple/apple-pmgr-pwrstate.c            | 324 ++++++++++++++++++
 drivers/soc/imx/gpcv2.c                            |  29 +-
 drivers/soc/imx/imx8m-blk-ctrl.c                   |  77 ++++-
 drivers/soc/qcom/cpr.c                             |   2 +-
 drivers/soc/qcom/llcc-qcom.c                       |  28 ++
 drivers/soc/qcom/qcom_aoss.c                       |   2 +-
 drivers/soc/qcom/qcom_stats.c                      |  13 +
 drivers/soc/qcom/qmi_interface.c                   |   2 +-
 drivers/soc/qcom/rpmh-rsc.c                        |   2 +-
 drivers/soc/qcom/rpmhpd.c                          | 326 ++++++++++--------
 drivers/soc/qcom/rpmpd.c                           |  42 ++-
 drivers/soc/qcom/smem.c                            |   2 +-
 drivers/soc/qcom/socinfo.c                         |   3 +
 drivers/soc/renesas/Kconfig                        |  15 +
 drivers/soc/renesas/Makefile                       |   2 +
 drivers/soc/renesas/r8a779a0-sysc.c                | 380 +--------------------
 drivers/soc/renesas/r8a779f0-sysc.c                |  47 +++
 drivers/soc/renesas/rcar-gen4-sysc.c               | 376 ++++++++++++++++++++
 drivers/soc/renesas/rcar-gen4-sysc.h               |  43 +++
 drivers/soc/renesas/rcar-rst.c                     |  50 ++-
 drivers/soc/renesas/renesas-soc.c                  | 127 +++----
 drivers/soc/samsung/Kconfig                        |  14 +
 drivers/soc/samsung/Makefile                       |   2 +
 drivers/soc/samsung/exynos-chipid.c                |   3 +
 drivers/soc/samsung/exynos-pmu.c                   |   2 +
 drivers/soc/samsung/exynos-usi.c                   | 285 ++++++++++++++++
 drivers/soc/tegra/common.c                         |  29 +-
 drivers/soc/tegra/fuse/fuse-tegra.c                |  51 ++-
 drivers/soc/tegra/fuse/fuse-tegra20.c              |  33 +-
 drivers/soc/tegra/fuse/fuse.h                      |   1 +
 drivers/soc/tegra/pmc.c                            |  41 ++-
 drivers/soc/tegra/regulators-tegra20.c             |  99 ++++++
 drivers/soc/tegra/regulators-tegra30.c             | 122 +++++++
 drivers/soc/ti/k3-socinfo.c                        |   3 +-
 drivers/soc/ti/knav_dma.c                          |  20 +-
 drivers/soc/ti/pruss.c                             |   2 +-
 drivers/soc/xilinx/zynqmp_pm_domains.c             |  91 ++---
 drivers/soc/xilinx/zynqmp_power.c                  |   1 -
 drivers/spi/spi-rpc-if.c                           |   4 +-
 drivers/spi/spi-tegra20-slink.c                    |   9 +-
 drivers/staging/media/tegra-vde/vde.c              |  63 +++-
 drivers/tee/optee/Makefile                         |   1 +
 drivers/tee/optee/core.c                           |   2 +-
 drivers/tee/optee/ffa_abi.c                        |   6 +-
 drivers/tee/optee/notif.c                          | 125 +++++++
 drivers/tee/optee/optee_msg.h                      |   9 +
 drivers/tee/optee/optee_private.h                  |  28 +-
 drivers/tee/optee/optee_rpc_cmd.h                  |  31 +-
 drivers/tee/optee/optee_smc.h                      |  75 +++-
 drivers/tee/optee/rpc.c                            |  71 +---
 drivers/tee/optee/smc_abi.c                        | 237 +++++++++++--
 drivers/tee/tee_core.c                             |  10 +-
 drivers/usb/chipidea/ci_hdrc_tegra.c               |  53 ++-
 include/dt-bindings/clock/r8a779f0-cpg-mssr.h      |  64 ++++
 include/dt-bindings/power/imx8mn-power.h           |   5 +
 include/dt-bindings/power/qcom-rpmpd.h             |  33 ++
 include/dt-bindings/power/r8a779f0-sysc.h          |  30 ++
 include/dt-bindings/soc/samsung,exynos-usi.h       |  17 +
 include/linux/soc/qcom/llcc-qcom.h                 |   3 +
 include/linux/soc/renesas/rcar-rst.h               |   2 +
 include/linux/tee_drv.h                            |  14 +
 include/memory/renesas-rpc-if.h                    |   8 +-
 include/soc/tegra/common.h                         |  15 +
 90 files changed, 3402 insertions(+), 918 deletions(-)
 rename Documentation/devicetree/bindings/{arm =>
soc}/samsung/exynos-chipid.yaml (93%)
 rename Documentation/devicetree/bindings/{arm/samsung/pmu.yaml =>
soc/samsung/exynos-pmu.yaml} (95%)
 create mode 100644
Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
 create mode 100644 drivers/soc/apple/Kconfig
 create mode 100644 drivers/soc/apple/Makefile
 create mode 100644 drivers/soc/apple/apple-pmgr-pwrstate.c
 create mode 100644 drivers/soc/renesas/r8a779f0-sysc.c
 create mode 100644 drivers/soc/renesas/rcar-gen4-sysc.c
 create mode 100644 drivers/soc/renesas/rcar-gen4-sysc.h
 create mode 100644 drivers/soc/samsung/exynos-usi.c
 create mode 100644 drivers/tee/optee/notif.c
 create mode 100644 include/dt-bindings/clock/r8a779f0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779f0-sysc.h
 create mode 100644 include/dt-bindings/soc/samsung,exynos-usi.h
