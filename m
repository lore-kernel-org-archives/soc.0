Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56060C433F5
	for <soc@archiver.kernel.org>; Wed,  3 Nov 2021 22:55:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 25348611C6; Wed,  3 Nov 2021 22:55:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E347A611C3
	for <soc@kernel.org>; Wed,  3 Nov 2021 22:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635980133;
	bh=0P0CHcVXnDxwxlqYBsjbllsc+Q6QdqRGnjmJNMVLIFM=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=RrGyH/k9rsPp/RxhLP1nBJicBzgA1X+bISiKfgnddvlbIMwwJ29nls96lCBYv3+hv
	 lDO74Zw1SgcHF1Cw13aLdx+7ZhcXd55XD3uwzErjfFvY3Mf5VqSt9/YpHyEbVBjXMK
	 i5Oc3bf0ySkb/vI0KJkCOWhe+4na8eq+U13nYGTKwbcRH7hf5aRGh+LEpM5NLLLv9z
	 Fqlx1/TS+yoijvu+AWL/13UGNQxM819bJrHUs1Vh4deApcS/wmSDrOQ5roF09h1v1F
	 aTf2QN3xTwE+53I1QeaH5wDSuqVR1RarqzqHFnhVDKoYkjGVtWrXgA1dXcqf9iXlW9
	 zC/cdf49Zyt6g==
Received: by mail-wr1-f50.google.com with SMTP id d27so5841198wrb.6
        for <soc@kernel.org>; Wed, 03 Nov 2021 15:55:32 -0700 (PDT)
X-Gm-Message-State: AOAM5330GpjHyndwcGibxguafi3p5cMr1vv7jjff9In/0R28p79OwVPd
	d9E16uwampFWRMFASljBugkfvZ68ZPmMFPklIzs=
X-Google-Smtp-Source: ABdhPJwBxzzdD9FlcynkcRrrWyg+NY2nzYHbLNXETVN6kAO8ZUK8QtvEF+Udhn+eUbv34pE0f08SDJ2qGM8XTaf1qxM=
X-Received: by 2002:adf:efc6:: with SMTP id i6mr36222164wrp.428.1635980131250;
 Wed, 03 Nov 2021 15:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 3 Nov 2021 23:55:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2gzowTrpNtuMN6RH2J2BbrSBihJG5hh2EOSpxwZ=jYog@mail.gmail.com>
Message-ID: <CAK8P3a2gzowTrpNtuMN6RH2J2BbrSBihJG5hh2EOSpxwZ=jYog@mail.gmail.com>
Subject: [GIT PULL 3/4] ARM: SoC drivers for 5.16
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:

  Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.16

for you to fetch changes up to 6a03568932b2711c91e1572f08867690b52a18df:

  Merge tag 'optee-ffa-fix-for-v5.16' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/drivers
(2021-11-02 09:22:48 +0100)

----------------------------------------------------------------
ARM: SoC drivers for 5.16

These are all the driver updates for SoC specific drivers. There
are a couple of subsystems with individual maintainers picking up
their patches here:

 - The reset controller subsystem add support for a few new SoC
   variants to existing drivers, along with other minor improvements

 - The OP-TEE subsystem gets a driver for the ARM FF-A transport

 - The memory controller subsystem has improvements for Tegra,
   Mediatek, Renesas, Freescale and Broadcom specific drivers.

 - The tegra cpuidle driver changes get merged through this
   tree this time. There are only minor changes, but they depend
   on other tegra driver updates here.

 - The ep93xx platform finally moves to using the drivers/clk/
   subsystem, moving the code out of arch/arm in the process.
   This depends on a small sound driver change that is included
   here as well.

 - There are some minor updates for Qualcomm and Tegra specific
   firmware drivers.

The other driver updates are mainly for drivers/soc, which contains
a mixture of vendor specific drivers that don't really fit elsewhere:

 - Mediatek drivers gain more support for MT8192, with new support for
   hw-mutex and mmsys routing, plus support for reset lines in the
   mmsys driver.

 - Qualcomm gains a new "sleep stats" driver, and support for
   the "Generic Packet Router" in the APR driver.

 - There is a new user interface for routing the UARTS on ASpeed
   BMCs, something that apparently nobody else has needed so far.

 - More drivers can now be built as loadable modules, in particular
   for Broadcom and Samsung platforms.

 - Lots of improvements to the TI sysc driver for better suspend/resume
   support

Finally, there are lots of minor cleanups and new device IDs for
amlogic, renesas, tegra, qualcomm, mediateka, samsung, imx, layerscape,
allwinner, broadcom, and omap.

----------------------------------------------------------------
Alexander Sverdlin (1):
      ASoC: cirrus: i2s: Prepare clock before using it

Andrew Gabbasov (1):
      memory: renesas-rpc-if: Avoid unaligned bus access for HyperFlash

AngeloGioacchino Del Regno (5):
      cpuidle: qcom_spm: Detach state machine from main SPM handling
      dt-bindings: soc: qcom: Add devicetree binding for QCOM SPM
      soc: qcom: spm: Implement support for SAWv4.1, SDM630/660 L2 AVS
      soc: qcom: spm: Add compatible for MSM8998 SAWv4.1 L2
      dt-bindings: soc: qcom: spm: Document SDM660 and MSM8998 compatibles

Arnd Bergmann (26):
      Merge tag 'renesas-drivers-for-v5.16-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/drivers
      firmware: tegra: Reduce stack usage
      Merge tag 'amlogic-drivers-for-v5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/drivers
      Merge tag 'tegra-for-5.16-firmware' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/drivers
      Merge tag 'tegra-for-5.16-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/drivers
      Merge tag 'tegra-for-5.16-cpuidle' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/drivers
      Merge tag 'memory-controller-drv-tegra-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'memory-controller-drv-mtk-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'memory-controller-drv-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'v5.15-next-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/drivers
      Merge tag 'omap-for-v5.16/ti-sysc-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/drivers
      Merge tag 'qcom-drivers-for-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/drivers
      Merge tag 'arm-soc/for-5.16/drivers' of
https://github.com/Broadcom/stblinux into arm/drivers
      Merge tag 'imx-drivers-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/drivers
      Merge tag 'sunxi-drivers-for-5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/drivers
      Merge tag 'optee-ffa-for-v5.16' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/drivers
      Merge tag 'reset-for-v5.16' of
git://git.pengutronix.de/pza/linux into arm/drivers
      Merge tag 'memory-controller-drv-5.16-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'soc-fsl-next-v5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux into
arm/drivers
      firmware: arm_ffa: Remove unused 'compat_version' variable
      Merge tag 'samsung-drivers-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into
arm/drivers
      Merge tag 'qcom-drivers-for-5.16-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/drivers
      Merge tag 'arm-ffa-updates-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/drivers
      qcom: spm: allow compile-testing
      Revert "firmware: qcom: scm: Add support for MC boot address API"
      Merge tag 'optee-ffa-fix-for-v5.16' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/drivers

Bartosz Dudziak (2):
      dt-bindings: arm: Add SMP enable-method for MSM8226
      arm: qcom: Add SMP support for MSM8226

Bjorn Andersson (8):
      Merge tag
'1630420228-31075-2-git-send-email-deesin@codeaurora.org' into
drivers-for-5.16
      Merge tag '20210927135559.738-6-srinivas.kandagatla@linaro.org'
into drivers-for-5.16
      dt-bindings: sram: Document qcom,rpm-msg-ram
      dt-bindings: soc: smem: Make indirection optional
      soc: qcom: smem: Support reserved-memory description
      soc: qcom: rpmhpd: Make power_on actually enable the domain
      soc: qcom: socinfo: Add PM8150C and SMB2351 models
      firmware: qcom: scm: Don't break compile test on non-ARM platforms

Cai Huoqing (16):
      soc: sunxi_sram: Make use of the helper function
devm_platform_ioremap_resource()
      soc: amlogic: canvas: Make use of the helper function
devm_platform_ioremap_resource()
      soc: amlogic: meson-clk-measure: Make use of the helper function
devm_platform_ioremap_resource()
      soc: bcm: bcm-pmb: Make use of the helper function
devm_platform_ioremap_resource()
      soc: bcm63xx-power: Make use of the helper function
devm_platform_ioremap_resource()
      PM: AVS: qcom-cpr: Make use of the helper function
devm_platform_ioremap_resource()
      soc: qcom: ocmem: Make use of the helper function
devm_platform_ioremap_resource_byname()
      soc: qcom: geni: Make use of the helper function
devm_platform_ioremap_resource()
      soc: qcom: aoss: Make use of the helper function
devm_platform_ioremap_resource()
      soc: qcom: gsbi: Make use of the helper function
devm_platform_ioremap_resource()
      soc: qcom: rpmh-rsc: Make use of the helper function
devm_platform_ioremap_resource_byname()
      memory: tegra: Make use of the helper function devm_add_action_or_reset()
      firmware: tegra: bpmp: Use devm_platform_ioremap_resource()
      soc/tegra: pmc: Use devm_platform_ioremap_resource()
      soc: fsl: guts: Make use of the helper function
devm_platform_ioremap_resource()
      soc: fsl: rcpm: Make use of the helper function
devm_platform_ioremap_resource()

Chanho Park (1):
      soc: samsung: exynos-chipid: add exynosautov9 SoC support

Chia-Wei Wang (1):
      soc: aspeed: Add UART routing support

Chris Lew (1):
      soc: qcom: smp2p: add feature negotiation and ssr ack feature support

Christian Hewitt (1):
      soc: amlogic: meson-gx-socinfo: Add S905Y2 ID for Radxa Zero

Christophe JAILLET (1):
      soc/tegra: Fix an error handling path in tegra_powergate_power_up()

Colin Ian King (2):
      memory: tegra: make the array list static const, makes object smaller
      optee: Fix spelling mistake "reclain" -> "reclaim"

Dan Carpenter (1):
      soc: imx: imx8m-blk-ctrl: off by one in imx8m_blk_ctrl_xlate()

David Virag (1):
      soc: samsung: exynos-pmu: Fix compilation when nothing selects
CONFIG_MFD_CORE

Deepak Kumar Singh (2):
      soc: qcom: aoss: Expose send for generic usecase
      soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ

Dmitry Baryshkov (2):
      soc: qcom: socinfo: add two missing PMIC IDs
      soc: qcom: rpmhpd: fix sm8350_mxc's peer domain

Dmitry Osipenko (17):
      memory: tegra: Remove interconnect state syncing hack
      soc/tegra: fuse: Add stubs needed for compile testing
      soc/tegra: irq: Add stubs needed for compile testing
      soc/tegra: pm: Make stubs usable for compile testing
      soc/tegra: pmc: Disable PMC state syncing
      soc/tegra: pmc: Expose USB regmap to all SoCs
      cpuidle: tegra: Enable compile testing
      cpuidle: tegra: Check whether PMC is ready
      dt-bindings: Relocate DDR bindings
      dt-bindings: memory: lpddr2: Convert to schema
      dt-bindings: memory: lpddr2: Add revision-id properties
      dt-bindings: memory: lpddr2: Document Elpida B8132B2PB-6D-F
      dt-bindings: Add vendor prefix for Elpida Memory
      dt-bindings: memory: tegra20: emc: Document new LPDDR2 sub-node
      memory: Add LPDDR2-info helpers
      memory: tegra20-emc: Support matching timings by LPDDR2 configuration
      memory: tegra20-emc: Add runtime dependency on devfreq governor module

Dongliang Mu (1):
      memory: fsl_ifc: fix leak of irq and nand_irq in fsl_ifc_ctrl_probe

Enric Balletbo i Serra (2):
      soc: mediatek: mmsys: Add reset controller support
      drm/mediatek: mtk_dsi: Reset the dsi0 hardware

Ezequiel Garcia (1):
      imx: soc: Select REGMAP_MMIO

Florian Fainelli (5):
      soc: bcm: brcmstb: biuctrl: Tune MCP settings for 72113
      soc: bcm: brcmstb: biuctrl: Tune MCP settings for 72116
      bus: brcmstb_gisb: Allow building as module
      memory: brcmstb_dpfe: Allow building Broadcom STB DPFE as module
      reset: Allow building Broadcom STB RESCAL as module

Geert Uytterhoeven (2):
      soc: renesas: Identify more R-Car Gen3e SoCs
      memory: renesas-rpc-if: RENESAS_RPCIF should select RESET_CONTROLLER

Guru Das Srinagesh (1):
      firmware: qcom_scm: Fix error retval in __qcom_scm_is_call_available()

Horatiu Vultur (2):
      dt-bindings: reset: Add lan966x support
      reset: mchp: sparx5: Extend support for lan966x

Ioana Ciornei (1):
      soc: fsl: dpio: use an explicit NULL instead of 0

Jens Wiklander (6):
      tee: add sec_world_id to struct tee_shm
      optee: simplify optee_release()
      optee: refactor driver with internal callbacks
      optee: isolate smc abi
      optee: add FF-A support
      optee: smc_abi.c: add missing #include <linux/mm.h>

Jernej Skrabec (1):
      bus: sun50i-de2: Adjust printing error message

Jing Yangyang (1):
      memory: tegra210-emc: replace DEFINE_SIMPLE_ATTRIBUTE with
DEFINE_DEBUGFS_ATTRIBUTE

Kai Song (1):
      memory: tegra210-emc: replace DEFINE_SIMPLE_ATTRIBUTE with

Konrad Dybcio (4):
      soc: qcom: rpmhpd: Add SM6350
      soc: qcom: llcc: Add configuration data for SM6350
      dt-bindings: soc: qcom: aoss: Add SM6350 compatible
      dt-bindings: power: rpmpd: Add SM6350 to rpmpd binding

Krzysztof Kozlowski (6):
      memory: samsung: describe drivers in KConfig
      soc: samsung: exynos-chipid: avoid soc_device_to_device()
      soc: samsung: exynos-chipid: convert to a module
      soc: samsung: exynos-chipid: do not enforce built-in
      soc: samsung: pm_domains: drop unused is_off field
      Merge branch 'for-v5.16/renesas-rpc' into mem-ctrl-next

Kunihiko Hayashi (3):
      reset: uniphier: Add audio system and video input reset control for PXs3
      dt-bindings: reset: uniphier: Add NX1 reset control binding
      reset: uniphier: Add NX1 reset support

Len Baker (1):
      soc: qcom: pdr: Prefer strscpy over strcpy

Lina Iyer (1):
      soc: qcom: spm: Add 8916 SPM register data

Luca Weiss (1):
      dt-bindings: firmware: scm: Add compatible for msm8226

Lucas Stach (8):
      soc: imx: gpcv2: allow to disable individual power domains
      Revert "soc: imx: gpcv2: move reset assert after requesting
domain power up"
      soc: imx: gpcv2: add lockdep annotation
      soc: imx: gpcv2: add domain option to keep domain clocks enabled
      soc: imx: gpcv2: keep i.MX8M* bus clocks enabled
      soc: imx: gpcv2: support system suspend/resume
      soc: imx: add i.MX8M blk-ctrl driver
      soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl

Mahesh Sivasubramanian (2):
      dt-bindings: Introduce QCOM Sleep stats bindings
      soc: qcom: Add Sleep stats driver

Marc Bonnici (1):
      firmware: arm_ffa: Add support for MEM_LEND

Marek Vasut (2):
      soc: imx: gpcv2: Turn domain->pgc into bitfield
      soc: imx: gpcv2: Set both GPC_PGC_nCTRL(GPU_2D|GPU_3D) for MX8MM
GPU domain

Maulik Shah (1):
      soc: qcom: qcom_stats: Fix client votes offset

Mikko Perttunen (2):
      memory: tegra186-emc: Handle errors in BPMP response
      soc/tegra: Add Tegra186 ARI driver

Naina Mehta (1):
      soc: qcom: llcc: Disable MMUHWT retention

Nikita Shubin (1):
      ep93xx: clock: convert in-place to COMMON_CLK

Robert Marko (1):
      soc: qcom: socinfo: Add IPQ8074 family ID-s

Sam Protsenko (3):
      soc: samsung: exynos-chipid: Pass revision reg offsets
      dt-bindings: samsung: exynos-chipid: Document Exynos850 compatible
      soc: samsung: exynos-chipid: Add Exynos850 support

Shawn Guo (2):
      dt-bindings: soc: qcom: smd-rpm: Add QCM2290 compatible
      soc: qcom: smd-rpm: Add QCM2290 compatible

Sibi Sankar (4):
      dt-bindings: soc: qcom: aoss: Drop the load state power-domain
      soc: qcom: aoss: Drop power domain support
      dt-bindings: msm/dp: Remove aoss-qmp header
      dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions

Srinivas Kandagatla (5):
      soc: dt-bindings: qcom: apr: convert to yaml
      soc: dt-bindings: qcom: apr: deprecate qcom,apr-domain property
      soc: qcom: apr: make code more reuseable
      soc: dt-bindings: qcom: add gpr bindings
      soc: qcom: apr: Add GPR support

Stephan Gerhold (4):
      dt-bindings: soc: qcom: spm: Document qcom,msm8916-saw2-v3.0-cpu
      firmware: qcom: scm: Add support for MC boot address API
      ARM: qcom: Add qcom,msm8916-smp enable-method identical to MSM8226
      dt-bindings: arm: cpus: Document qcom,msm8916-smp enable-method

Sudeep Holla (3):
      firmware: arm_ffa: Add missing remove callback to ffa_bus_type
      firmware: arm_ffa: Fix __ffa_devices_unregister
      firmware: arm_ffa: Handle compatibility with different firmware versions

Sumit Garg (1):
      tee: optee: Fix missing devices unregister during optee_remove

Thierry Reding (3):
      clk: tegra: Add stubs needed for compile testing
      Merge branch 'for-5.16/clk' into for-5.16/cpuidle
      Merge branch 'for-5.16/soc' into for-5.16/cpuidle

Tony Lindgren (10):
      bus: ti-sysc: Fix timekeeping_suspended warning on resume
      bus: ti-sysc: Check for lost context in sysc_reinit_module()
      bus: ti-sysc: Add quirk handling for reinit on context lost
      bus: ti-sysc: Add quirk handling for reset on re-init
      bus: ti-sysc: Use context lost quirks for gpmc
      bus: ti-sysc: Use context lost quirk for otg
      bus: ti-sysc: Handle otg force idle quirk
      bus: ti-sysc: Drop legacy quirk flag for gpio
      bus: ti-sysc: Drop legacy quirk flag for sham
      bus: ti-sysc: Fix variable set but not used warning for reinit_modules

Vladimir Lypak (6):
      dt-bindings: soc: qcom: smd-rpm: Add compatible for MSM8953 SoC
      soc: qcom: smd-rpm: Add compatible for MSM8953 SoC
      dt-bindings: power: rpmpd: Add MSM8953 to rpmpd binding
      soc: qcom: rpmpd: Add power domains for MSM8953
      dt-bindings: firmware: qcom-scm: Document msm8953 bindings
      firmware: qcom_scm: Add compatible for MSM8953 SoC

Wan Jiabing (2):
      soc: qcom: apr: Add of_node_put() before return
      soc: qcom: smp2p: Add of_node_put() before goto

Will McVicker (2):
      arm64: exynos: don't have ARCH_EXYNOS select EXYNOS_CHIPID
      rtc: s3c: remove HAVE_S3C_RTC in favor of direct dependencies

Wolfram Sang (2):
      dt-bindings: rpc: renesas-rpc-if: Add support for the R8A779A0 RPC-IF
      memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode

Yang Yingliang (1):
      memory: tegra186-emc: Fix error return code in tegra186_emc_probe()

Yong Wu (13):
      dt-bindings: memory: mediatek: Add mt8195 smi binding
      dt-bindings: memory: mediatek: Add mt8195 smi sub common
      memory: mtk-smi: Use clk_bulk clock ops
      memory: mtk-smi: Rename smi_gen to smi_type
      memory: mtk-smi: Adjust some code position
      memory: mtk-smi: Add error handle for smi_probe
      memory: mtk-smi: Add device link for smi-sub-common
      memory: mtk-smi: Add clocks for smi-sub-common
      memory: mtk-smi: Use devm_platform_ioremap_resource
      memory: mtk-smi: mt8195: Add smi support
      memory: mtk-smi: mt8195: Add initial setting for smi-common
      memory: mtk-smi: mt8195: Add initial setting for smi-larb
      MAINTAINERS: Add entry for MediaTek SMI

Yongqiang Niu (3):
      soc: mediatek: mmsys: add comp OVL_2L2/POSTMASK/RDMA4
      soc: mediatek: mmsys: Add mt8192 mmsys routing table
      soc: mediatek: add mtk mutex support for MT8192

Youri Querry (1):
      soc: fsl: dpio: rename the enqueue descriptor variable

jing yangyang (2):
      tee/optee/shm_pool: fix application of sizeof to pointer
      memory: tegra30-emc: replace DEFINE_SIMPLE_ATTRIBUTE with
DEFINE_DEBUGFS_ATTRIBUTE

 .../ABI/testing/sysfs-driver-aspeed-uart-routing   |   27 +
 Documentation/devicetree/bindings/arm/cpus.yaml    |    6 +-
 .../bindings/arm/samsung/exynos-chipid.yaml        |    5 +-
 Documentation/devicetree/bindings/ddr/lpddr2.txt   |  102 --
 .../bindings/display/msm/dp-controller.yaml        |    1 -
 .../devicetree/bindings/firmware/qcom,scm.txt      |    4 +-
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |  223 ++++
 .../ddr/lpddr2-timings.txt                         |    0
 .../ddr/lpddr3-timings.txt                         |    0
 .../{ => memory-controllers}/ddr/lpddr3.txt        |    5 +-
 .../memory-controllers/mediatek,smi-common.yaml    |   34 +-
 .../memory-controllers/mediatek,smi-larb.yaml      |    3 +
 .../memory-controllers/nvidia,tegra20-emc.yaml     |   23 +-
 .../memory-controllers/renesas,rpc-if.yaml         |    1 +
 .../memory-controllers/samsung,exynos5422-dmc.yaml |    3 +-
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    2 +
 .../devicetree/bindings/reset/microchip,rst.yaml   |    4 +-
 .../reset/socionext,uniphier-glue-reset.yaml       |    1 +
 .../bindings/reset/socionext,uniphier-reset.yaml   |    3 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   12 +-
 .../devicetree/bindings/soc/qcom/qcom,apr.txt      |  134 --
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml     |  177 +++
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |    3 +
 .../devicetree/bindings/soc/qcom/qcom,smem.yaml    |   34 +-
 .../devicetree/bindings/soc/qcom/qcom,spm.yaml     |   81 ++
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |   47 +
 Documentation/devicetree/bindings/sram/sram.yaml   |    5 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |    8 +
 arch/arm/Kconfig                                   |    3 +-
 arch/arm/mach-ep93xx/clock.c                       |  975 ++++++++------
 arch/arm/mach-ep93xx/core.c                        |    2 +-
 arch/arm/mach-ep93xx/soc.h                         |   42 +-
 arch/arm/mach-exynos/Kconfig                       |    2 -
 arch/arm/mach-qcom/platsmp.c                       |   72 ++
 arch/arm/mach-s5pv210/Kconfig                      |    1 -
 arch/arm64/Kconfig.platforms                       |    2 -
 drivers/bus/Kconfig                                |    2 +-
 drivers/bus/brcmstb_gisb.c                         |    7 +-
 drivers/bus/sun50i-de2.c                           |    7 +-
 drivers/bus/ti-sysc.c                              |  276 +++-
 drivers/cpuidle/Kconfig.arm                        |    3 +-
 drivers/cpuidle/cpuidle-qcom-spm.c                 |  318 +----
 drivers/cpuidle/cpuidle-tegra.c                    |    3 +
 drivers/firmware/arm_ffa/bus.c                     |   10 +-
 drivers/firmware/arm_ffa/driver.c                  |   53 +-
 drivers/firmware/qcom_scm.c                        |    6 +-
 drivers/firmware/tegra/bpmp-debugfs.c              |   26 +-
 drivers/firmware/tegra/bpmp-tegra210.c             |    7 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    5 +-
 drivers/memory/Kconfig                             |    5 +-
 drivers/memory/fsl_ifc.c                           |   13 +-
 drivers/memory/jedec_ddr.h                         |   47 +
 drivers/memory/jedec_ddr_data.c                    |   41 +
 drivers/memory/mtk-smi.c                           |  596 +++++----
 drivers/memory/of_memory.c                         |   87 ++
 drivers/memory/of_memory.h                         |    9 +
 drivers/memory/renesas-rpc-if.c                    |  159 ++-
 drivers/memory/samsung/Kconfig                     |   13 +-
 drivers/memory/tegra/Kconfig                       |    1 +
 drivers/memory/tegra/mc.c                          |   25 +-
 drivers/memory/tegra/tegra186-emc.c                |    5 +
 drivers/memory/tegra/tegra20-emc.c                 |  200 ++-
 drivers/memory/tegra/tegra210-emc-cc-r21021.c      |    2 +-
 drivers/memory/tegra/tegra210-emc-core.c           |    6 +-
 drivers/memory/tegra/tegra30-emc.c                 |    4 +-
 drivers/of/platform.c                              |    1 +
 drivers/reset/Kconfig                              |    4 +-
 drivers/reset/reset-microchip-sparx5.c             |   40 +-
 drivers/reset/reset-uniphier-glue.c                |    4 +
 drivers/reset/reset-uniphier.c                     |   27 +
 drivers/rtc/Kconfig                                |   10 +-
 drivers/soc/amlogic/meson-canvas.c                 |    4 +-
 drivers/soc/amlogic/meson-clk-measure.c            |    4 +-
 drivers/soc/amlogic/meson-gx-socinfo.c             |    1 +
 drivers/soc/aspeed/Kconfig                         |   10 +
 drivers/soc/aspeed/Makefile                        |    9 +-
 drivers/soc/aspeed/aspeed-uart-routing.c           |  603 +++++++++
 drivers/soc/bcm/bcm63xx/bcm-pmb.c                  |    4 +-
 drivers/soc/bcm/bcm63xx/bcm63xx-power.c            |    4 +-
 drivers/soc/bcm/brcmstb/biuctrl.c                  |    2 +
 drivers/soc/fsl/dpio/dpio-service.c                |    2 +-
 drivers/soc/fsl/dpio/qbman-portal.c                |    8 +-
 drivers/soc/fsl/guts.c                             |    4 +-
 drivers/soc/fsl/rcpm.c                             |    7 +-
 drivers/soc/imx/Kconfig                            |    1 +
 drivers/soc/imx/Makefile                           |    1 +
 drivers/soc/imx/gpcv2.c                            |  134 +-
 drivers/soc/imx/imx8m-blk-ctrl.c                   |  523 ++++++++
 drivers/soc/mediatek/mt8192-mmsys.h                |   76 ++
 drivers/soc/mediatek/mtk-mmsys.c                   |   79 ++
 drivers/soc/mediatek/mtk-mmsys.h                   |    2 +
 drivers/soc/mediatek/mtk-mutex.c                   |   35 +
 drivers/soc/qcom/Kconfig                           |   21 +-
 drivers/soc/qcom/Makefile                          |    2 +
 drivers/soc/qcom/apr.c                             |  289 ++++-
 drivers/soc/qcom/cpr.c                             |    4 +-
 drivers/soc/qcom/llcc-qcom.c                       |   18 +-
 drivers/soc/qcom/ocmem.c                           |    4 +-
 drivers/soc/qcom/pdr_interface.c                   |   12 +-
 drivers/soc/qcom/qcom-geni-se.c                    |    4 +-
 drivers/soc/qcom/qcom_aoss.c                       |  165 +--
 drivers/soc/qcom/qcom_gsbi.c                       |    4 +-
 drivers/soc/qcom/qcom_stats.c                      |  277 ++++
 drivers/soc/qcom/rpmh-rsc.c                        |    4 +-
 drivers/soc/qcom/rpmhpd.c                          |   36 +-
 drivers/soc/qcom/rpmpd.c                           |   24 +
 drivers/soc/qcom/smd-rpm.c                         |    2 +
 drivers/soc/qcom/smem.c                            |   57 +-
 drivers/soc/qcom/smp2p.c                           |  154 ++-
 drivers/soc/qcom/socinfo.c                         |   18 +-
 drivers/soc/qcom/spm.c                             |  279 ++++
 drivers/soc/renesas/Kconfig                        |    7 +-
 drivers/soc/renesas/renesas-soc.c                  |    7 +
 drivers/soc/samsung/Kconfig                        |    5 +-
 drivers/soc/samsung/Makefile                       |    3 +-
 drivers/soc/samsung/exynos-chipid.c                |   94 +-
 drivers/soc/samsung/exynos5422-asv.c               |    1 +
 drivers/soc/samsung/pm_domains.c                   |    1 -
 drivers/soc/sunxi/sunxi_sram.c                     |    4 +-
 drivers/soc/tegra/Makefile                         |    1 +
 drivers/soc/tegra/ari-tegra186.c                   |   80 ++
 drivers/soc/tegra/pmc.c                            |   28 +-
 drivers/tee/optee/Makefile                         |    5 +-
 drivers/tee/optee/call.c                           |  445 +------
 drivers/tee/optee/core.c                           |  720 ++---------
 drivers/tee/optee/device.c                         |   22 +
 drivers/tee/optee/ffa_abi.c                        |  911 +++++++++++++
 drivers/tee/optee/optee_ffa.h                      |  153 +++
 drivers/tee/optee/optee_msg.h                      |   27 +-
 drivers/tee/optee/optee_private.h                  |  156 ++-
 drivers/tee/optee/rpc.c                            |  237 +---
 drivers/tee/optee/shm_pool.c                       |  101 --
 drivers/tee/optee/shm_pool.h                       |   14 -
 drivers/tee/optee/smc_abi.c                        | 1362 ++++++++++++++++++++
 include/dt-bindings/power/qcom-aoss-qmp.h          |   14 -
 include/dt-bindings/power/qcom-rpmpd.h             |   17 +
 include/dt-bindings/soc/qcom,gpr.h                 |   19 +
 include/linux/arm_ffa.h                            |    2 +
 include/linux/clk/tegra.h                          |   24 +-
 include/linux/platform_data/ti-sysc.h              |    3 +
 include/linux/soc/mediatek/mtk-mmsys.h             |    3 +
 include/linux/soc/qcom/apr.h                       |   70 +-
 include/linux/soc/qcom/qcom_aoss.h                 |   38 +
 include/linux/soc/samsung/exynos-chipid.h          |    6 +-
 include/linux/tee_drv.h                            |    7 +-
 include/memory/renesas-rpc-if.h                    |    1 +
 include/soc/qcom/spm.h                             |   43 +
 include/soc/tegra/fuse.h                           |   31 +-
 include/soc/tegra/irq.h                            |    9 +-
 include/soc/tegra/pm.h                             |    2 +-
 sound/soc/cirrus/ep93xx-i2s.c                      |   12 +-
 152 files changed, 8493 insertions(+), 3150 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
 delete mode 100644 Documentation/devicetree/bindings/ddr/lpddr2.txt
 create mode 100644
Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
 rename Documentation/devicetree/bindings/{ =>
memory-controllers}/ddr/lpddr2-timings.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
memory-controllers}/ddr/lpddr3-timings.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
memory-controllers}/ddr/lpddr3.txt (94%)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
 create mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c
 create mode 100644 drivers/soc/imx/imx8m-blk-ctrl.c
 create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
 create mode 100644 drivers/soc/qcom/qcom_stats.c
 create mode 100644 drivers/soc/qcom/spm.c
 create mode 100644 drivers/soc/tegra/ari-tegra186.c
 create mode 100644 drivers/tee/optee/ffa_abi.c
 create mode 100644 drivers/tee/optee/optee_ffa.h
 delete mode 100644 drivers/tee/optee/shm_pool.c
 delete mode 100644 drivers/tee/optee/shm_pool.h
 create mode 100644 drivers/tee/optee/smc_abi.c
 delete mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h
 create mode 100644 include/linux/soc/qcom/qcom_aoss.h
 create mode 100644 include/soc/qcom/spm.h
