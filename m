Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CDFC433F5
	for <soc@archiver.kernel.org>; Wed, 23 Mar 2022 23:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D61BC36AE7; Wed, 23 Mar 2022 23:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647F5C36AE3
	for <soc@kernel.org>; Wed, 23 Mar 2022 23:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648077029;
	bh=qD19zGIVU3fi2JTBKD6tguXBezF8QrcxgqEPoKhzTjk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=F30/EvXes++I90/ClO/EYz3stjfO+yBP56ewm4egBw9svmdzYLZ21T4j60qVigY1C
	 3qeVg6MLlt2KpvAwEcs4pbLT5Revd9+qvo2Sb0z1+jlXNmgzH/zzl9ofEEbUh81brE
	 Kcyw6Dcy+Yn8rgr4qDSWwg0R1c3kFprt6SLX1egoaynKyPZtTSOSorlFJSkQ2Xs9wY
	 qq2ky2rhObd617ZDBLjOU7hFird1d9jitwDk8Br2ygE+W6HkWFDucOAEh2QrcaVxkH
	 a+eyfGImnZN02xQE/Y9IAw/u5iA/6jNkv2VXwZOMxW/cKpYuNSKjWoEzLVsz/0aeyN
	 YYEXB54PsUk9g==
Received: by mail-wr1-f52.google.com with SMTP id d7so4229608wrb.7
        for <soc@kernel.org>; Wed, 23 Mar 2022 16:10:29 -0700 (PDT)
X-Gm-Message-State: AOAM5338EHRvvr/eVA7JzFdNoQooXzagQyEMqyxFyzWgDf2SPZNTKved
	faAd4Kzv3r3ZyarMb0x+aH4XiyeyRyWmc05nDM8=
X-Google-Smtp-Source: ABdhPJxXhpD2vdsKGJZCI8UI9jWSq5YUE6qbqcV35M8WuPC7dyIRQPla0OKOT9K+GkddYDr9LsBWikcrB4wzou2Ljlc=
X-Received: by 2002:a5d:66ca:0:b0:203:fb72:a223 with SMTP id
 k10-20020a5d66ca000000b00203fb72a223mr2031029wrw.12.1648077027544; Wed, 23
 Mar 2022 16:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
 <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com>
In-Reply-To: <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 24 Mar 2022 00:10:11 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1w7YStPoL0+u_tjdjuVpb1bpK60m0EnGT+dq3EzZhfdA@mail.gmail.com>
Message-ID: <CAK8P3a1w7YStPoL0+u_tjdjuVpb1bpK60m0EnGT+dq3EzZhfdA@mail.gmail.com>
Subject: [GIT PULL 3/4] ARM: driver updates for 5.18
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566:

  Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-drivers-5.18

for you to fetch changes up to 339ac71b233ee9ab5036be3abca0e5df793b5f64:

  ARM: spear: fix typos in comments (2022-03-19 22:33:59 +0100)

----------------------------------------------------------------
ARM driver updates for 5.18

There are a few separately maintained driver subsystems that we merge through
the SoC tree, notable changes are:

 - Memory controller updates, mainly for Tegra and Mediatek SoCs,
   and clarifications for the memory controller DT bindings

 - SCMI firmware interface updates, in particular a new transport based
   on OPTEE and support for atomic operations.

 - Cleanups to the TEE subsystem, refactoring its memory management

For SoC specific drivers without a separate subsystem, changes include

 - Smaller updates and fixes for TI, AT91/SAMA5, Qualcomm and NXP
   Layerscape SoCs.

 - Driver support for Microchip SAMA5D29, Tesla FSD, Renesas RZ/G2L,
   and Qualcomm SM8450.

 - Better power management on Mediatek MT81xx, NXP i.MX8MQ
   and older NVIDIA Tegra chips

----------------------------------------------------------------
Alim Akhtar (9):
      dt-bindings: clock: Add bindings definitions for FSD CMU blocks
      dt-bindings: clock: Document FSD CMU bindings
      clk: samsung: fsd: Add initial clock support
      clk: samsung: fsd: Add cmu_peric block clock information
      clk: samsung: fsd: Add cmu_fsys0 clock information
      clk: samsung: fsd: Add cmu_fsys1 clock information
      clk: samsung: fsd: Add cmu_imem block clock information
      clk: samsung: fsd: Add cmu_mfc block clock information
      clk: samsung: fsd: Add cam_csi block clock information

Alyssa Rosenzweig (1):
      soc: mediatek: mtk-infracfg: Disable ACP on MT8192

AngeloGioacchino Del Regno (4):
      memory: mtk-smi: Use ARRAY_SIZE to define MTK_SMI_CLK_NR_MAX
      firmware: qcom: scm: Add function to set the maximum IOMMU pool size
      firmware: qcom: scm: Add function to set IOMMU pagetable addressing
      memory: mtk-smi: Enable sleep ctrl safety function for MT8195

Ard Biesheuvel (1):
      firmware: arm_scmi: Disable ftrace for Clang Thumb2 builds

Arnd Bergmann (18):
      Merge tag 'renesas-drivers-for-v5.18-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/drivers
      Merge tag 'renesas-drivers-for-v5.18-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/drivers
      Merge tag 'amdtee-for-v5.18' of
git://git.linaro.org:/people/jens.wiklander/linux-tee into arm/drivers
      Merge tag 'tee-shm-for-v5.18' of
git://git.linaro.org:/people/jens.wiklander/linux-tee into arm/drivers
      Merge tag 'imx-drivers-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/drivers
      Merge tag 'scmi-updates-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/drivers
      Merge tag 'samsung-clk-fsd-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into
arm/drivers
      Merge tag 'tegra-for-5.18-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/drivers
      Merge tag 'ti-driver-soc-for-v5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into
arm/drivers
      Merge tag 'memory-controller-drv-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'memory-controller-drv-mediatek-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'memory-controller-drv-tegra-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'v5.17-next-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/drivers
      Merge tag 'qcom-drivers-for-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/drivers
      Merge tag 'v5.17-next-soc.2' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/drivers
      Merge tag 'at91-soc-5.18-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/drivers
      Merge tag 'memory-controller-drv-5.18-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'amlogic-drivers-for-v5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/drivers

Biju Das (2):
      soc: renesas: Identify RZ/V2L SoC
      soc: renesas: Add support for reading product revision for RZ/G2L family

Bjorn Andersson (13):
      firmware: qcom: scm: Introduce pas_metadata context
      soc: qcom: mdt_loader: Split out split-file-loader
      soc: qcom: mdt_loader: Allow hash segment to be split out
      soc: qcom: mdt_loader: Allow hash to reside in any segment
      soc: qcom: mdt_loader: Extend check for split firmware
      soc: qcom: mdt_loader: Reorder parts of __qcom_mdt_load()
      soc: qcom: mdt_loader: Always invoke PAS mem_setup
      soc: qcom: mdt_loader: Extract PAS operations
      remoteproc: qcom: pas: Carry PAS metadata context
      dt-bindings: remoteproc: qcom: pas: Add SM8450 PAS compatibles
      remoteproc: qcom: pas: Add SM8450 remoteproc support
      soc: qcom: socinfo: Add some more PMICs and SoCs
      soc: qcom: mdt_loader: Fix split-firmware condition

Cai Huoqing (1):
      tee: amdtee: Make use of the helper macro LIST_HEAD()

Christophe JAILLET (3):
      soc: qcom: llcc: Use devm_bitmap_zalloc() when applicable
      soc: ti: k3-ringacc: Use devm_bitmap_zalloc() when applicable
      firmware: ti_sci: Fix compilation failure when
CONFIG_TI_SCI_PROTOCOL is not defined

Chun-Jie Chen (7):
      dt-bindings: power: Add MT8195 power domains
      soc: mediatek: pm-domains: Add wakeup capacity support in power domain
      soc: mediatek: pm-domains: Remove unused macro
      soc: mediatek: pm-domains: Move power status offset to power domain data
      soc: mediatek: pm-domains: Add support for mt8195
      dt-bindings: power: Add MT8186 power domains
      soc: mediatek: pm-domains: Add support for mt8186

Claudiu Beznea (5):
      ARM: at91: ddr: remove CONFIG_SOC_SAMA7 dependency
      ARM: at91: ddr: align macro definitions
      ARM: at91: ddr: fix typo to align with datasheet naming
      ARM: at91: PM: add cpu idle support for sama7g5
      ARM: at91: Kconfig: select PM_OPP

Conor Dooley (2):
      soc: add microchip polarfire soc system controller
      soc/microchip: fix invalid free in mpfs_sys_controller_delete

Cristian Marussi (23):
      firmware: arm_scmi: Review some virtio log messages
      firmware: arm_scmi: Make virtio Version_1 compliance optional
      firmware: arm_scmi: Perform earlier cinfo lookup call in do_xfer
      firmware: arm_scmi: Set polling timeout to max_rx_timeout_ms
      firmware: arm_scmi: Refactor message response path
      include: trace: Add new scmi_xfer_response_wait event
      firmware: arm_scmi: Use new trace event scmi_xfer_response_wait
      firmware: arm_scmi: Add configurable polling mode for transports
      firmware: arm_scmi: Make smc transport use common completions
      firmware: arm_scmi: Add sync_cmds_completed_on_ret transport flag
      firmware: arm_scmi: Make smc support sync_cmds_completed_on_ret
      firmware: arm_scmi: Make optee support sync_cmds_completed_on_ret
      firmware: arm_scmi: Add support for atomic transports
      firmware: arm_scmi: Add atomic mode support to smc transport
      firmware: arm_scmi: Add new parameter to mark_txdone
      firmware: arm_scmi: Add a virtio channel refcount
      firmware: arm_scmi: Review virtio free_list handling
      firmware: arm_scmi: Add atomic mode support to virtio transport
      dt-bindings: firmware: arm,scmi: Add atomic-threshold-us optional property
      firmware: arm_scmi: Support optional system wide atomic-threshold-us
      firmware: arm_scmi: Add atomic support to clock protocol
      firmware: arm_scmi: Add support for clock_enable_latency
      clk: scmi: Support atomic clock enable/disable API

Daniel Thompson (1):
      soc: qcom: aoss: remove spurious IRQF_ONESHOT flags

Dmitry Osipenko (3):
      memory: tegra30-emc: Print additional memory info
      memory: tegra20-emc: Correct memory device mask
      soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30

Etienne Carriere (2):
      dt-bindings: arm: Add OP-TEE transport for SCMI
      firmware: arm_scmi: Add optee transport

Fabio Estevam (1):
      soc: imx: Remove Layerscape check

Huang Yiwei (1):
      soc: qcom: llcc: Add support for 16 ways of allocation

Ivan Bornyakov (1):
      bus: imx-weim: add DT overlay support for WEIM bus

Jason Wang (1):
      memory: brcmstb_dpfe: fix typo in a comment

Jens Wiklander (10):
      hwrng: optee-rng: use tee_shm_alloc_kernel_buf()
      tee: remove unused tee_shm_pool_alloc_res_mem()
      tee: add tee_shm_alloc_user_buf()
      tee: simplify shm pool handling
      tee: replace tee_shm_alloc()
      optee: add optee_pool_op_free_helper()
      tee: add tee_shm_register_{user,kernel}_buf()
      KEYS: trusted: tee: use tee_shm_register_kernel_buf()
      tee: replace tee_shm_register()
      tee: refactor TEE_SHM_* flags

Jia-Ju Bai (1):
      memory: emif: check the pointer temp in get_device_details()

Jiasheng Jiang (2):
      soc: qcom: rpmpd: Check for null return of devm_kcalloc
      memory: emif: Add check for setup_interrupts

Johnson Wang (2):
      soc: mediatek: pwrap: add pwrap driver for MT8186 SoC
      dt-bindings: mediatek: add compatible for MT8186 pwrap

Julia Lawall (1):
      ARM: spear: fix typos in comments

Julius Werner (2):
      dt-bindings: memory: lpddr2: Adjust revision ID property to match lpddr3
      memory: Update of_memory lpddr2 revision-id binding

Krzysztof Kozlowski (8):
      clk: samsung: fix missing Tesla FSD dependency on Exynos
      dt-bindings: memory: lpddr2-timings: convert to dtschema
      dt-bindings: memory: lpddr3-timings: convert to dtschema
      dt-bindings: memory: lpddr3: convert to dtschema
      dt-bindings: memory: lpddr3: adjust IO width to spec
      dt-bindings: memory: lpddr3: deprecate manufacturer ID
      dt-bindings: memory: lpddr3: deprecate passing timings frequency
as unit address
      memory: of: parse max-freq property

Lad Prabhakar (4):
      soc: ti: smartreflex: Use platform_get_irq_optional() to get the interrupt
      soc: renesas: Kconfig: Explicitly select PM and PM_GENERIC_DOMAINS configs
      soc: renesas: Kconfig: Introduce ARCH_RZG2L config option
      dt-bindings: memory: renesas,rpc-if: Document RZ/V2L SoC

Li Yang (2):
      dt-bindings: memory: fsl: convert ifc binding to yaml schema
      memory: fsl_ifc: populate child devices without relying on simple-bus

Luca Weiss (2):
      dt-bindings: power: rpmpd: Add MSM8226 to rpmpd binding
      soc: qcom: rpmpd: Add MSM8226 support

Lucas Stach (2):
      dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
      soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl

Marijn Suijten (1):
      firmware: qcom: scm: Remove reassignment to desc following initializer

Miaoqian Lin (3):
      soc: qcom: ocmem: Fix missing put_device() call in of_get_ocmem
      soc: qcom: aoss: Fix missing put_device call in qmp_get
      soc: ti: wkup_m3_ipc: Fix IRQ check in wkup_m3_ipc_probe

Mihai Sain (1):
      ARM: at91: add support in soc driver for new SAMA5D29

Ming Qian (1):
      firmware: imx: scu-pd: imx8q: add vpu mu resources

Peiwei Hu (1):
      firmware: ti_sci: inproper error handling of ti_sci_probe

Peng Fan (1):
      firmware: imx: add get resource owner api

Rex-BC Chen (3):
      soc: mediatek: mmsys: add mmsys reset control for MT8186
      dt-bindings: arm: mediatek: mmsys: add support for MT8186
      soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver data

Rikard Falkeborn (1):
      memory: tegra: Constify struct thermal_cooling_device_ops

Sai Prakash Ranjan (7):
      soc: qcom: llcc: Update the logic for version info extraction
      soc: qcom: llcc: Add write-cache cacheable support
      soc: qcom: llcc: Add missing llcc configuration data
      soc: qcom: llcc: Update register offsets for newer LLCC HW
      soc: qcom: llcc: Add configuration data for SM8450 SoC
      dt-bindings: arm: msm: Add LLCC compatible for SM8350
      dt-bindings: arm: msm: Add LLCC compatible for SM8450

Shawn Guo (1):
      Merge commit '7a7b1414ea9a3641672be768afe16f583f0b76e7' into imx/drivers

Shunzhou Jiang (2):
      dt-bindings: power: add Amlogic s4 power domains bindings
      soc: s4: Add support for power domains controller

Stephan Gerhold (4):
      cpuidle: qcom-spm: Check if any CPU is managed by SPM
      firmware: qcom: scm: Simplify set_cold/warm_boot_addr()
      firmware: qcom: scm: Drop cpumask parameter from set_boot_addr()
      firmware: qcom: scm: Add support for MC boot address API

Sudeep Holla (2):
      firmware: arm_scmi: optee: Drop the support for the OPTEE shared
dynamic buffer
      Merge tag 'scmi-updates-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
for-next/scmi

Thierry Reding (1):
      soc/tegra: fuse: Explicitly cast to/from __iomem

Tom Rix (1):
      soc/tegra: bpmp: cleanup double word in comment

Vignesh Raghavendra (1):
      soc: ti: k3-socinfo: Add AM62x JTAG ID

Wei Yongjun (1):
      firmware: arm_scmi: optee: Fix missing mutex_init()

Xu Wang (1):
      soc: qcom: apr: Remove redundant 'flush_workqueue()' calls

Yang Li (1):
      firmware: qcom: scm: Fix some kernel-doc comments

Yong Wu (7):
      dt-bindings: memory: mtk-smi: Rename clock to clocks
      dt-bindings: memory: mtk-smi: No need mediatek,larb-id for mt8167
      dt-bindings: memory: mtk-smi: Correct minItems to 2 for the gals clocks
      dt-bindings: memory: mediatek: Add mt8186 support
      memory: mtk-smi: handle positive return value for clk_bulk_prepare_enable
      memory: mtk-smi: Add sleep ctrl function
      memory: mtk-smi: mt8186: Add smi support

Yongqiang Niu (2):
      soc: mediatek: mmsys: add mt8186 mmsys routing table
      soc: mediatek: add MTK mutex support for MT8186

kartik (2):
      soc/tegra: fuse: Update nvmem cell list
      soc/tegra: pmc: Add Tegra234 wake events

 .../bindings/arm/mediatek/mediatek,mmsys.yaml      |    1 +
 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |    2 +
 .../devicetree/bindings/clock/tesla,fsd-clock.yaml |  198 +++
 .../devicetree/bindings/firmware/arm,scmi.yaml     |   75 +
 .../ddr/jedec,lpddr2-timings.yaml                  |  135 ++
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |   23 +-
 .../ddr/jedec,lpddr3-timings.yaml                  |  157 ++
 .../memory-controllers/ddr/jedec,lpddr3.yaml       |  263 +++
 .../memory-controllers/ddr/lpddr2-timings.txt      |   52 -
 .../memory-controllers/ddr/lpddr3-timings.txt      |   58 -
 .../bindings/memory-controllers/ddr/lpddr3.txt     |  107 --
 .../bindings/memory-controllers/fsl/fsl,ifc.yaml   |  113 ++
 .../bindings/memory-controllers/fsl/ifc.txt        |   82 -
 .../memory-controllers/mediatek,smi-common.yaml    |   32 +-
 .../memory-controllers/mediatek,smi-larb.yaml      |   19 +-
 .../memory-controllers/renesas,rpc-if.yaml         |    3 +-
 .../memory-controllers/samsung,exynos5422-dmc.yaml |    3 +-
 .../bindings/power/amlogic,meson-sec-pwrc.yaml     |    3 +-
 .../bindings/power/mediatek,power-controller.yaml  |    3 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   16 +
 .../devicetree/bindings/soc/mediatek/pwrap.txt     |    1 +
 arch/arm/mach-at91/Kconfig                         |    1 +
 arch/arm/mach-at91/pm.c                            |   27 +-
 arch/arm/mach-at91/pm_suspend.S                    |    4 +-
 arch/arm/mach-qcom/platsmp.c                       |    3 +-
 arch/arm/mach-spear/spear13xx.c                    |    2 +-
 drivers/bus/imx-weim.c                             |  135 +-
 drivers/char/hw_random/optee-rng.c                 |    6 +-
 drivers/clk/clk-scmi.c                             |   71 +-
 drivers/clk/samsung/Kconfig                        |    9 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-fsd.c                      | 1803 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |    1 +
 drivers/clk/samsung/clk-pll.h                      |    1 +
 drivers/cpuidle/cpuidle-qcom-spm.c                 |   28 +-
 drivers/firmware/arm_scmi/Kconfig                  |   56 +
 drivers/firmware/arm_scmi/Makefile                 |    8 +
 drivers/firmware/arm_scmi/clock.c                  |   34 +-
 drivers/firmware/arm_scmi/common.h                 |   26 +-
 drivers/firmware/arm_scmi/driver.c                 |  234 ++-
 drivers/firmware/arm_scmi/mailbox.c                |    3 +-
 drivers/firmware/arm_scmi/optee.c                  |  567 ++++++
 drivers/firmware/arm_scmi/smc.c                    |   98 +-
 drivers/firmware/arm_scmi/virtio.c                 |  613 +++++--
 drivers/firmware/imx/rm.c                          |   45 +
 drivers/firmware/imx/scu-pd.c                      |    4 +
 drivers/firmware/qcom_scm.c                        |  215 +--
 drivers/firmware/qcom_scm.h                        |    7 +
 drivers/firmware/ti_sci.c                          |    2 +-
 drivers/memory/brcmstb_dpfe.c                      |    2 +-
 drivers/memory/emif.c                              |    8 +-
 drivers/memory/fsl_ifc.c                           |    9 +
 drivers/memory/mtk-smi.c                           |   57 +-
 drivers/memory/of_memory.c                         |   29 +-
 drivers/memory/tegra/Kconfig                       |    1 +
 drivers/memory/tegra/tegra20-emc.c                 |    2 +-
 drivers/memory/tegra/tegra210-emc-core.c           |    2 +-
 drivers/memory/tegra/tegra30-emc.c                 |  131 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |    7 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |   36 +-
 drivers/soc/Kconfig                                |    1 +
 drivers/soc/Makefile                               |    1 +
 drivers/soc/amlogic/meson-secure-pwrc.c            |   22 +
 drivers/soc/atmel/soc.c                            |    3 +
 drivers/soc/atmel/soc.h                            |    1 +
 drivers/soc/imx/imx8m-blk-ctrl.c                   |   66 +
 drivers/soc/imx/soc-imx.c                          |    3 -
 drivers/soc/mediatek/mt8167-pm-domains.h           |   16 +-
 drivers/soc/mediatek/mt8173-pm-domains.h           |   22 +-
 drivers/soc/mediatek/mt8183-mmsys.h                |    2 +
 drivers/soc/mediatek/mt8183-pm-domains.h           |   32 +-
 drivers/soc/mediatek/mt8186-mmsys.h                |  115 ++
 drivers/soc/mediatek/mt8186-pm-domains.h           |  344 ++++
 drivers/soc/mediatek/mt8192-pm-domains.h           |   44 +-
 drivers/soc/mediatek/mt8195-pm-domains.h           |  613 +++++++
 drivers/soc/mediatek/mtk-infracfg.c                |   19 +
 drivers/soc/mediatek/mtk-mmsys.c                   |   18 +-
 drivers/soc/mediatek/mtk-mmsys.h                   |    3 +-
 drivers/soc/mediatek/mtk-mutex.c                   |   45 +
 drivers/soc/mediatek/mtk-pm-domains.c              |   17 +-
 drivers/soc/mediatek/mtk-pm-domains.h              |    8 +-
 drivers/soc/mediatek/mtk-pmic-wrap.c               |   71 +
 drivers/soc/microchip/Kconfig                      |   10 +
 drivers/soc/microchip/Makefile                     |    1 +
 drivers/soc/microchip/mpfs-sys-controller.c        |  197 +++
 drivers/soc/qcom/apr.c                             |    1 -
 drivers/soc/qcom/llcc-qcom.c                       |  107 +-
 drivers/soc/qcom/mdt_loader.c                      |  232 ++-
 drivers/soc/qcom/ocmem.c                           |    1 +
 drivers/soc/qcom/qcom_aoss.c                       |    8 +-
 drivers/soc/qcom/rpmpd.c                           |   20 +
 drivers/soc/qcom/socinfo.c                         |   12 +
 drivers/soc/renesas/Kconfig                        |   12 +
 drivers/soc/renesas/renesas-soc.c                  |   68 +-
 drivers/soc/tegra/fuse/fuse-tegra.c                |   24 +-
 drivers/soc/tegra/pmc.c                            |   16 +-
 drivers/soc/ti/k3-ringacc.c                        |   15 +-
 drivers/soc/ti/k3-socinfo.c                        |    1 +
 drivers/soc/ti/smartreflex.c                       |   13 +-
 drivers/soc/ti/wkup_m3_ipc.c                       |    4 +-
 drivers/tee/amdtee/call.c                          |    2 +-
 drivers/tee/amdtee/shm_pool.c                      |   55 +-
 drivers/tee/optee/Kconfig                          |    8 -
 drivers/tee/optee/call.c                           |    2 +-
 drivers/tee/optee/core.c                           |   22 +-
 drivers/tee/optee/device.c                         |    5 +-
 drivers/tee/optee/ffa_abi.c                        |  136 +-
 drivers/tee/optee/optee_private.h                  |   12 +-
 drivers/tee/optee/smc_abi.c                        |  167 +-
 drivers/tee/tee_core.c                             |    5 +-
 drivers/tee/tee_private.h                          |   15 +-
 drivers/tee/tee_shm.c                              |  320 ++--
 drivers/tee/tee_shm_pool.c                         |  162 +-
 include/dt-bindings/clock/fsd-clk.h                |  150 ++
 include/dt-bindings/power/imx8mq-power.h           |    3 +
 include/dt-bindings/power/meson-s4-power.h         |   19 +
 include/dt-bindings/power/mt8186-power.h           |   32 +
 include/dt-bindings/power/mt8195-power.h           |   46 +
 include/dt-bindings/power/qcom-rpmpd.h             |    5 +
 include/linux/clk/at91_pmc.h                       |    4 +
 include/linux/firmware/imx/svc/rm.h                |    5 +
 include/linux/qcom_scm.h                           |   16 +-
 include/linux/scmi_protocol.h                      |   15 +
 include/linux/soc/mediatek/infracfg.h              |  133 ++
 include/linux/soc/qcom/llcc-qcom.h                 |    9 +-
 include/linux/soc/qcom/mdt_loader.h                |   17 +-
 include/linux/soc/ti/ti_sci_protocol.h             |    2 +-
 include/linux/tee_drv.h                            |  138 +-
 include/soc/at91/sama7-ddr.h                       |   15 +-
 include/soc/microchip/mpfs.h                       |    4 +-
 include/soc/tegra/bpmp-abi.h                       |    2 +-
 include/trace/events/scmi.h                        |   28 +
 security/keys/trusted-keys/trusted_tee.c           |   23 +-
 134 files changed, 7930 insertions(+), 1490 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
 create mode 100644
Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2-timings.yaml
 create mode 100644
Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3-timings.yaml
 create mode 100644
Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
 delete mode 100644
Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2-timings.txt
 delete mode 100644
Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3-timings.txt
 delete mode 100644
Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3.txt
 create mode 100644
Documentation/devicetree/bindings/memory-controllers/fsl/fsl,ifc.yaml
 delete mode 100644
Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
 create mode 100644 drivers/clk/samsung/clk-fsd.c
 create mode 100644 drivers/firmware/arm_scmi/optee.c
 create mode 100644 drivers/soc/mediatek/mt8186-mmsys.h
 create mode 100644 drivers/soc/mediatek/mt8186-pm-domains.h
 create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h
 create mode 100644 drivers/soc/microchip/Kconfig
 create mode 100644 drivers/soc/microchip/Makefile
 create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c
 create mode 100644 include/dt-bindings/clock/fsd-clk.h
 create mode 100644 include/dt-bindings/power/meson-s4-power.h
 create mode 100644 include/dt-bindings/power/mt8186-power.h
 create mode 100644 include/dt-bindings/power/mt8195-power.h
