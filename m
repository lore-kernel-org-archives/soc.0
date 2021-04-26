Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FEBC433ED
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 15:56:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 89AEC610A2; Mon, 26 Apr 2021 15:56:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FE0F6105A
	for <soc@kernel.org>; Mon, 26 Apr 2021 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619452578;
	bh=uXxkKoadgG9OPlxc+K0bJdTxlIqjFyVc0dZGyBwBKQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pGgWaeNEbXwi5cdp/vRViYhb+rVGXXqe0ukYDEuZwOBaAE4McMY0ondbwbyJ+a4Ce
	 FORrQhr8brO1slhj/Top1plpmkRQ6VjjWyaJNSIKZ6RlrsIhbhEmGyVVCfA+HVekZk
	 Rt715JM1MhYme+8kW7UfpMFIDoLAgaS0Gi70VbPx0S0o1M84YNU5rClI846IHkxxx4
	 Fu7ZpoK8q5OD6MtHezw44rFO1B/HqFBc09jl1d3o1y7IlI3Xz/DpNmXxuJyt4CQrus
	 uQcOTnrix2ICmAG8CYbJyrrKE/0llmOwN2k/Oa8YwznjOxJG0T9qjLkfc56/gDiNZs
	 hPxsAJa5iz1FA==
Received: by mail-wr1-f46.google.com with SMTP id x7so56393377wrw.10
        for <soc@kernel.org>; Mon, 26 Apr 2021 08:56:18 -0700 (PDT)
X-Gm-Message-State: AOAM530IIF429nqRiFcfSihtcWThtbswODhaqTa7F9tKyomhwtb4st4d
	7mwFXzqu5GyopOxf7XfgndYZAU9WK/dJc+D4f1w=
X-Google-Smtp-Source: ABdhPJy7N6PHzOEf7dtcyjW0eNqcWYNJk0XJyg4yagYgBclVZgw51WiXQxg6QH7heULLmMjPgtP/BxeuzOkSfFBwXPo=
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr24777876wrz.105.1619452576658;
 Mon, 26 Apr 2021 08:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 26 Apr 2021 17:55:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3uSjSyrRAq2BjR2fo6S7kCfOo+3szQ2cvBt8-D2KybwQ@mail.gmail.com>
Message-ID: <CAK8P3a3uSjSyrRAq2BjR2fo6S7kCfOo+3szQ2cvBt8-D2KybwQ@mail.gmail.com>
Subject: [GIT PULL 3/6] ARM: SoC drivers for v5.13
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

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-drivers-5.13

for you to fetch changes up to 5ffa828534036348fa90fb3079ccc0972d202c4a:

  soc: aspeed: fix a ternary sign expansion bug (2021-04-23 11:16:47 +0200)

----------------------------------------------------------------
ARM: SoC drivers for v5.13

Updates for SoC specific drivers include a few subsystems that
have their own maintainers but send them through the soc tree:

TEE/OP-TEE:
 -  Add tracepoints around calls to secure world

Memory controller drivers:
 - Minor fixes for Renesas, Exynos, Mediatek and Tegra platforms
 - Add debug statistics to Tegra20 memory controller
 - Update Tegra bindings and convert to dtschema

ARM SCMI Firmware:
 - Support for modular SCMI protocols and vendor specific extensions
 - New SCMI IIO driver
 - Per-cpu DVFS

The other driver changes are all from the platform maintainers
directly and reflect the drivers that don't fit into any other
subsystem as well as treewide changes for a particular platform.

SoCFPGA:
 - Various cleanups contributed by Krzysztof Kozlowski

Mediatek:
 - add MT8183 support to mutex driver
 - MMSYS: use per SoC array to describe the possible routing
 - add MMSYS support for MT8183 and MT8167
 - add support for PMIC wrapper with integrated arbiter
 - add support for MT8192/MT6873

Tegra:
 - Bug fixes to PMC and clock drivers

NXP/i.MX:
 - Update SCU power domain driver to keep console domain power on.
 - Add missing ADC1 power domain to SCU power domain driver.
 - Update comments for single global power domain in SCU power domain
   driver.
 - Add i.MX51/i.MX53 unique id support to i.MX SoC driver.

NXP/FSL SoC driver updates for v5.13
 - Add ACPI support for RCPM driver
 - Use generic io{read,write} for QE drivers after performance optimized
   for PowerPC
 - Fix QBMAN probe to cleanup HW states correctly for kexec
 - Various cleanup and style fix for QBMAN/QE/GUTS drivers

OMAP:
 - Preparation to use devicetree for genpd
 - ti-sysc needs iorange check improved when the interconnect target module
   has no control registers listed
 - ti-sysc needs to probe l4_wkup and l4_cfg interconnects first to avoid
   issues with missing resources and unnecessary deferred probe
 - ti-sysc debug option can now detect more devices
 - ti-sysc now warns if an old incomplete devicetree data is found as we
   now rely on it being complete for am3 and 4
 - soc init code needs to check for prcm and prm nodes for omap4/5 and dra7
 - omap-prm driver needs to enable autoidle retention support for omap4
 - omap5 clocks are missing gpmc and ocmc clock registers
 - pci-dra7xx now needs to use builtin_platform_driver instead of using
   builtin_platform_driver_probe for deferred probe to work

Raspberry Pi:
 - Fix-up all RPi firmware drivers so as for unbind to happen in an
   orderly fashion
 - Support for RPi's PoE hat PWM bus

Qualcomm
 - Improved detection for SCM calling conventions
 - Support for OEM specific wifi firmware path
 - Added drivers for SC7280/SM8350: RPMH, LLCC< AOSS QMP

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Aditya Srivastava (1):
      soc: fsl: guts: fix comment syntax in file

Arnd Bergmann (23):
      Merge tag 'optee-tracepoints-for-v5.13' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/drivers
      Merge tag 'renesas-drivers-for-v5.13-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/drivers
      Merge tag 'optee-tracepoints-fix-for-v5.13' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'rpi-poe-v5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/nsaenz/linux-rpi into
arm/drivers
      Merge tag 'omap-for-v5.13/ti-sysc-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/drivers
      Merge tag 'optee-memref-size-for-v5.13' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/drivers
      Merge tag 'arm-soc/for-5.13/drivers' of
https://github.com/Broadcom/stblinux into arm/drivers
      Merge tag 'imx-drivers-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/drivers
      Merge tag 'tegra-for-5.13-clk' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/drivers
      Merge tag 'tegra-for-5.13-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/drivers
      Merge tag 'v5.12-next-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/drivers
      Merge tag 'socfpga_update_for_v5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/drivers
      Merge tag 'scmi-updates-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/drivers
      Merge tag 'qcom-drivers-for-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/drivers
      Merge tag 'socfpga_update_for_v5.13_part2' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/drivers
      Merge tag 'v5.12-next-soc.2' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/drivers
      Merge tag 'memory-controller-drv-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'memory-controller-drv-tegra-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'aspeed-5.13-lpc' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into
arm/drivers
      Merge tag 'qcom-drivers-for-5.13-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/drivers
      Merge tag 'zynqmp-soc-for-v5.13' of
https://github.com/Xilinx/linux-xlnx into arm/drivers
      Merge tag 'soc-fsl-next-v5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux into
arm/drivers
      Merge tag 'memory-controller-drv-5.13-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers

Bhaskar Chowdhury (1):
      soc: qcom: Fix typos in the file qmi_encdec.c

Bjorn Andersson (5):
      dt-bindings: soc: qcom: wcnss: Add firmware-name property
      soc: qcom: wcnss_ctrl: Introduce local variable "dev"
      soc: qcom: wcnss_ctrl: Allow reading firmware-name from DT
      soc: qcom: mdt_loader: Validate that p_filesz < p_memsz
      soc: qcom: mdt_loader: Detect truncated read of segments

CK Hu (2):
      soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
      soc: mediatek: mmsys: Use an array for setting the routing registers

Chia-Wei, Wang (5):
      dt-bindings: aspeed-lpc: Remove LPC partitioning
      ARM: dts: Remove LPC BMC and Host partitions
      ipmi: kcs: aspeed: Adapt to new LPC DTS layout
      pinctrl: aspeed-g5: Adapt to new LPC device tree layout
      soc: aspeed: Adapt to new LPC device tree layout

Christophe Leroy (3):
      soc: fsl: qe: replace qe_io{read,write}* wrappers by generic
io{read,write}*
      tty: serial: ucc_uart: replace qe_io{read,write}* wrappers by
generic io{read,write}*
      Revert "soc: fsl: qe: introduce qe_io{read,write}* wrappers"

Colin Ian King (1):
      memory: gpmc: fix out of bounds read and dereference on gpmc_cs[]

Cristian Marussi (38):
      firmware: arm_scmi: Extend protocol registration interfaces
      firmware: arm_scmi: Introduce protocol handle definitions
      firmware: arm_scmi: Introduce devres get/put protocols operations
      firmware: arm_scmi: Make notifications aware of protocols users
      firmware: arm_scmi: Introduce new devres notification ops
      firmware: arm_scmi: Refactor events registration
      firmware: arm_scmi: Convert events registration to protocol handles
      firmware: arm_scmi: Add new protocol handle core transfer ops
      firmware: arm_scmi: Add helper to access protocol revision/version
      firmware: arm_scmi: Port base protocol to new interface
      firmware: arm_scmi: Port perf protocol to new protocols interface
      cpufreq: scmi: Port driver to the new scmi_perf_proto_ops interface
      firmware: arm_scmi: Remove legacy scmi_perf_ops protocol interface
      firmware: arm_scmi: Port power protocol to new protocols interface
      firmware: arm_scmi: Port genpd driver to the new
scmi_power_proto_ops interface
      firmware: arm_scmi: Remove legacy scmi_power_ops protocol interface
      firmware: arm_scmi: Port clock protocol to new protocols interface
      clk: scmi: Port driver to the new scmi_clk_proto_ops interface
      firmware: arm_scmi: Remove legacy scmi_clk_ops protocol interface
      firmware: arm_scmi: Port reset protocol to new protocols interface
      reset: reset-scmi: Port driver to the new scmi_reset_proto_ops interf=
ace
      firmware: arm_scmi: Remove legacy scmi_reset_ops protocol interface
      firmware: arm_scmi: Port sensor protocol to new protocols interface
      hwmon: (scmi) port driver to the new scmi_sensor_proto_ops interface
      iio/scmi: Port driver to the new scmi_sensor_proto_ops interface
      firmware: arm_scmi: Remove legacy scmi_sensor_ops protocol interface
      firmware: arm_scmi: Port systempower protocol to new protocols interf=
ace
      firmware: arm_scmi: Port voltage protocol to new protocols interface
      regulator: scmi: Port driver to the new scmi_voltage_proto_ops interf=
ace
      firmware: arm_scmi: Remove legacy scmi_voltage_ops protocol interface
      firmware: arm_scmi: Make references to handle const
      firmware: arm_scmi: Cleanup legacy protocol init code
      firmware: arm_scmi: Cleanup unused core transfer helper wrappers
      firmware: arm_scmi: Cleanup events registration transient code
      firmware: arm_scmi: Make notify_priv really private
      firmware: arm_scmi: Rename non devres notify_ops
      firmware: arm_scmi: Add protocol modularization support
      firmware: arm_scmi: Add dynamic scmi devices creation

Dan Carpenter (1):
      soc: aspeed: fix a ternary sign expansion bug

Dmitry Osipenko (13):
      soc/tegra: regulators: Fix locking up when voltage-spread is out of r=
ange
      soc/tegra: pmc: Fix imbalanced clock disabling in error code path
      soc/tegra: pmc: Fix completion of power-gate toggling
      soc/tegra: pmc: Ensure that clock rates aren't too high
      soc/tegra: pmc: Print out domain name when reset fails to acquire
      memory: tegra20: Add debug statistics
      memory: tegra20: Correct comment to MC_STAT registers writes
      memory: tegra20: Protect debug code with a lock
      memory: tegra: Print out info-level once per driver probe
      dt-bindings: memory: tegra20: emc: Replace core regulator with
power domain
      dt-bindings: memory: tegra30: emc: Replace core regulator with
power domain
      dt-bindings: memory: tegra124: emc: Replace core regulator with
power domain
      dt-bindings: memory: tegra20: mc: Convert to schema

Dong Aisheng (1):
      firmware: imx: scu-pd: do not power off console domain

Enric Balletbo i Serra (5):
      soc: mediatek: pm-domains: Fix missing error code in
scpsys_add_subdomain()
      soc: mediatek: pm-domains: Add a meaningful power domain name
      soc: mediatek: pm-domains: Add a power domain names for mt8183
      soc: mediatek: pm-domains: Add a power domain names for mt8192
      soc: mediatek: pm-domains: Add a power domain names for mt8167

Fabien Parent (2):
      dt-bindings: mediatek: mmsys: add mt8167 binding
      soc: mediatek: mmsys: Add support for MT8167 SoC

Frank Li (1):
      firmware: imx: scu-pd: add missed ADC1 pd

Geert Uytterhoeven (2):
      soc: renesas: rmobile-sysc: Remove unneeded platform includes
      soc: renesas: rmobile-sysc: Mark fwnode when PM domain is added

Hsin-Hsiung Wang (4):
      soc: mediatek: pwrap: use BIT() macro
      soc: mediatek: pwrap: add arbiter capability
      dt-bindings: mediatek: add compatible for MT6873/8192 pwrap
      soc: mediatek: pwrap: add pwrap driver for MT6873/8192 SoCs

Hsin-Yi Wang (1):
      soc: mediatek: mmsys: Add mt8183 mmsys routing table

JC Kuo (3):
      clk: tegra: Add PLLE HW power sequencer control
      clk: tegra: Don't enable PLLE HW sequencer at init
      soc/tegra: pmc: Provide USB sleepwalk register map

Jerome Forissier (1):
      tee: optee: do not check memref size on return from Secure World

Jisheng Zhang (2):
      tee: optee: add invoke_fn tracepoints
      tee: optee: fix build error caused by recent optee tracepoints featur=
e

Jyoti Bhayana (1):
      iio/scmi: Adding support for IIO SCMI Based Sensors

Krzysztof Kozlowski (19):
      clk: socfpga: allow building N5X clocks with ARCH_N5X
      ARM: socfpga: introduce common ARCH_INTEL_SOCFPGA
      mfd: altera: merge ARCH_SOCFPGA and ARCH_STRATIX10
      net: stmmac: merge ARCH_SOCFPGA and ARCH_STRATIX10
      clk: socfpga: build together Stratix 10, Agilex and N5X clock drivers
      clk: socfpga: merge ARCH_SOCFPGA and ARCH_STRATIX10
      EDAC: altera: merge ARCH_SOCFPGA and ARCH_STRATIX10
      arm64: socfpga: merge Agilex and N5X into ARCH_INTEL_SOCFPGA
      clk: socfpga: allow compile testing of Stratix 10 / Agilex clocks
      clk: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
(and compile test)
      dmaengine: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
      fpga: altera: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
      i2c: altera: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
      reset: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
      ARM: socfpga: drop ARCH_SOCFPGA
      firmware: stratix10-svc: build only on 64-bit ARM
      clk: socfpga: fix iomem pointer cast on 64-bit
      memory: renesas-rpc-if: fix possible NULL pointer dereference of reso=
urce
      memory: samsung: exynos5422-dmc: handle clk_set_parent() failure

Lukas Bulwahn (2):
      MAINTAINERS: add another entry for ARM/QUALCOMM SUPPORT
      soc: qcom: address kernel-doc warnings

Nicola Mazzucato (2):
      scmi-cpufreq: Remove deferred probe
      scmi-cpufreq: Get opp_shared_cpus from opp-v2 for EM

Nicolas Saenz Julienne (10):
      firmware: raspberrypi: Keep count of all consumers
      firmware: raspberrypi: Introduce devm_rpi_firmware_get()
      clk: bcm: rpi: Release firmware handle on unbind
      gpio: raspberrypi-exp: Release firmware handle on unbind
      reset: raspberrypi: Release firmware handle on unbind
      soc: bcm: raspberrypi-power: Release firmware handle on unbind
      staging: vchiq: Release firmware handle on unbind
      input: raspberrypi-ts: Release firmware handle when not needed
      dt-bindings: pwm: Add binding for RPi firmware PWM bus
      pwm: Add Raspberry Pi Firmware based PWM bus

Nobuhiro Iwamatsu (1):
      firmware: xilinx: Remove zynqmp_pm_get_eemi_ops() in
IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)

Pan Bian (1):
      bus: qcom: Put child node before return

Peng Ma (1):
      soc: fsl: enable acpi support in RCPM driver

Qiheng Lin (1):
      memory: fsl-corenet-cf: Remove redundant dev_err call in ccf_probe()

Qinglang Miao (1):
      soc: qcom: pdr: Fix error return code in pdr_register_listener

Rafa=C5=82 Mi=C5=82ecki (2):
      dt-bindings: power: bcm-pmb: add BCM63138 binding
      soc: bcm: bcm-pmb: add BCM63138 SATA support

Rajendra Nayak (3):
      dt-bindings: power: rpmpd: Add sc7280 to rpmpd binding
      soc: qcom: rpmhpd: Add sc7280 powerdomains
      dt-bindings: firmware: scm: Add sc7280 support

Roy Pledge (1):
      soc: fsl: qbman: Ensure device cleanup is run for kexec

Sai Prakash Ranjan (4):
      dt-bindings: arm: msm: Add LLCC for SC7280
      soc: qcom: llcc: Add configuration data for SC7280
      dt-bindings: soc: qcom: aoss: Add SC7280 compatible
      soc: qcom: aoss: Add AOSS QMP support for SC7280

Sebastian Reichel (1):
      soc: imx: add i.MX51/i.MX53 unique id support

Sibi Sankar (1):
      soc: qcom: smem: Update max processor count

Stephen Boyd (8):
      soc: qcom: rpmh-rsc: Remove tcs_is_free() API
      soc: qcom: rpmh-rsc: Loop over fewer bits in irq handler
      soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition
      firmware: qcom_scm: Make __qcom_scm_is_call_available() return bool
      firmware: qcom_scm: Reduce locking section for __get_convention()
      firmware: qcom_scm: Workaround lack of "is available" call on SC7180
      firmware: qcom_scm: Suppress sysfs bind attributes
      firmware: qcom_scm: Fix kernel-doc function names to match

Sudeep Holla (1):
      Merge branch 'ib-iio-scmi-5.12-rc2-take3' of
git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into
for-next/scmi

Tejas Patel (1):
      firmware: xilinx: Fix dereferencing freed memory

Tony Lindgren (8):
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

Ulf Hansson (1):
      firmware: imx: scu-pd: Update comments for single global power domain

Vinod Koul (2):
      dt-bindings: power: Add rpm power domain bindings for SM8350
      soc: qcom: rpmhpd: Add SM8350 power domains

Wei Yongjun (2):
      ARM: OMAP2+: Make symbol 'pdata_quirks_init_clocks' static
      soc: mediatek: Make symbol 'mtk_mutex_driver' static

Yang Li (3):
      bus: ti-sysc: remove unneeded semicolon
      memory: tegra: replace DEFINE_SIMPLE_ATTRIBUTE with
DEFINE_DEBUGFS_ATTRIBUTE
      soc: fsl: guts: remove unneeded semicolon

Yong Wu (1):
      memory: mtk-smi: Add device-link between smi-larb and smi-common

Yongqiang Niu (1):
      soc: mediatek: add mtk mutex support for MT8183

Zheng Yongjun (3):
      bus: ti-sysc: Use kzalloc for allocating only one thing
      soc: fsl: qbman: Delete useless kfree code
      soc: fsl: qe: Use DEFINE_SPINLOCK() for spinlock

gexueyuan (1):
      memory: pl353: fix mask of ECC page_size config register

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  20 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |   1 +
 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   1 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
 .../memory-controllers/nvidia,tegra124-emc.yaml    |   7 +-
 .../memory-controllers/nvidia,tegra20-emc.txt      |   4 +-
 .../memory-controllers/nvidia,tegra20-mc.txt       |  40 --
 .../memory-controllers/nvidia,tegra20-mc.yaml      |  79 ++
 .../memory-controllers/nvidia,tegra30-emc.yaml     |   7 +-
 .../devicetree/bindings/mfd/aspeed-lpc.txt         | 100 +--
 .../devicetree/bindings/power/brcm,bcm-pmb.yaml    |   1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   2 +
 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |   1 +
 .../devicetree/bindings/soc/qcom/qcom,wcnss.txt    |   7 +
 Documentation/driver-api/xilinx/eemi.rst           |  31 +-
 MAINTAINERS                                        |   7 +
 arch/arm/Kconfig                                   |   2 +-
 arch/arm/Kconfig.debug                             |   6 +-
 arch/arm/Makefile                                  |   2 +-
 arch/arm/boot/dts/Makefile                         |   2 +-
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  76 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   | 137 ++--
 arch/arm/boot/dts/aspeed-g6.dtsi                   | 137 ++--
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm/configs/socfpga_defconfig                 |   2 +-
 arch/arm/mach-omap2/pdata-quirks.c                 |  29 +-
 arch/arm/mach-socfpga/Kconfig                      |   4 +-
 arch/arm64/Kconfig.platforms                       |  17 +-
 arch/arm64/boot/dts/altera/Makefile                |   2 +-
 arch/arm64/boot/dts/intel/Makefile                 |   6 +-
 arch/arm64/configs/defconfig                       |   2 +-
 drivers/bus/qcom-ebi2.c                            |   4 +-
 drivers/bus/ti-sysc.c                              |  84 ++-
 drivers/char/ipmi/kcs_bmc_aspeed.c                 |  27 +-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   4 +-
 drivers/clk/bcm/clk-raspberrypi.c                  |   2 +-
 drivers/clk/clk-scmi.c                             |  28 +-
 drivers/clk/socfpga/Kconfig                        |  19 +
 drivers/clk/socfpga/Makefile                       |  11 +-
 drivers/clk/socfpga/clk-gate.c                     |   2 +-
 drivers/clk/tegra/clk-pll.c                        |  12 -
 drivers/clk/tegra/clk-tegra210.c                   |  53 +-
 drivers/clk/ti/clk-54xx.c                          |   2 +
 drivers/cpufreq/scmi-cpufreq.c                     | 107 ++-
 drivers/dma/Kconfig                                |   2 +-
 drivers/edac/Kconfig                               |   2 +-
 drivers/edac/altera_edac.c                         |  17 +-
 drivers/firmware/Kconfig                           |   2 +-
 drivers/firmware/arm_scmi/base.c                   | 142 ++--
 drivers/firmware/arm_scmi/bus.c                    | 100 ++-
 drivers/firmware/arm_scmi/clock.c                  | 129 ++--
 drivers/firmware/arm_scmi/common.h                 | 133 +++-
 drivers/firmware/arm_scmi/driver.c                 | 798 +++++++++++++++++=
++--
 drivers/firmware/arm_scmi/notify.c                 | 328 +++++++--
 drivers/firmware/arm_scmi/notify.h                 |  40 +-
 drivers/firmware/arm_scmi/perf.c                   | 262 +++----
 drivers/firmware/arm_scmi/power.c                  | 134 ++--
 drivers/firmware/arm_scmi/reset.c                  | 146 ++--
 drivers/firmware/arm_scmi/scmi_pm_domain.c         |  26 +-
 drivers/firmware/arm_scmi/sensors.c                | 232 +++---
 drivers/firmware/arm_scmi/system.c                 |  63 +-
 drivers/firmware/arm_scmi/voltage.c                | 126 ++--
 drivers/firmware/imx/scu-pd.c                      |  41 +-
 drivers/firmware/qcom_scm-legacy.c                 |   4 +-
 drivers/firmware/qcom_scm-smc.c                    |  12 +-
 drivers/firmware/qcom_scm.c                        |  89 ++-
 drivers/firmware/qcom_scm.h                        |   7 +-
 drivers/firmware/raspberrypi.c                     |  69 +-
 drivers/firmware/xilinx/zynqmp.c                   |   5 +-
 drivers/fpga/Kconfig                               |   8 +-
 drivers/gpio/gpio-raspberrypi-exp.c                |   2 +-
 drivers/hwmon/scmi-hwmon.c                         |  24 +-
 drivers/i2c/busses/Kconfig                         |   2 +-
 drivers/iio/common/Kconfig                         |   1 +
 drivers/iio/common/Makefile                        |   1 +
 drivers/iio/common/scmi_sensors/Kconfig            |  18 +
 drivers/iio/common/scmi_sensors/Makefile           |   5 +
 drivers/iio/common/scmi_sensors/scmi_iio.c         | 683 +++++++++++++++++=
+
 drivers/input/touchscreen/raspberrypi-ts.c         |   2 +-
 drivers/memory/fsl-corenet-cf.c                    |   4 +-
 drivers/memory/mtk-smi.c                           |  19 +-
 drivers/memory/omap-gpmc.c                         |   7 +-
 drivers/memory/pl353-smc.c                         |   2 +-
 drivers/memory/renesas-rpc-if.c                    |   2 +-
 drivers/memory/samsung/exynos5422-dmc.c            |   4 +-
 drivers/memory/tegra/mc.c                          |   9 +
 drivers/memory/tegra/mc.h                          |   4 +-
 drivers/memory/tegra/tegra124-emc.c                |  16 +-
 drivers/memory/tegra/tegra20-emc.c                 |  20 +-
 drivers/memory/tegra/tegra20.c                     | 332 +++++++++
 drivers/memory/tegra/tegra30-emc.c                 |  18 +-
 drivers/mfd/Kconfig                                |   4 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   4 +-
 drivers/pci/controller/dwc/pci-dra7xx.c            |  13 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  17 +-
 drivers/pwm/Kconfig                                |   9 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-raspberrypi-poe.c                  | 206 ++++++
 drivers/regulator/scmi-regulator.c                 |  42 +-
 drivers/reset/Kconfig                              |   6 +-
 drivers/reset/reset-raspberrypi.c                  |   2 +-
 drivers/reset/reset-scmi.c                         |  33 +-
 drivers/soc/aspeed/aspeed-lpc-ctrl.c               |  20 +-
 drivers/soc/aspeed/aspeed-lpc-snoop.c              |  27 +-
 drivers/soc/bcm/bcm63xx/bcm-pmb.c                  |  30 +
 drivers/soc/bcm/raspberrypi-power.c                |   2 +-
 drivers/soc/fsl/guts.c                             |   2 +-
 drivers/soc/fsl/qbman/bman.c                       |   1 -
 drivers/soc/fsl/qbman/bman_portal.c                |   3 +-
 drivers/soc/fsl/qbman/qman_portal.c                |   3 +-
 drivers/soc/fsl/qe/gpio.c                          |  20 +-
 drivers/soc/fsl/qe/qe.c                            |  24 +-
 drivers/soc/fsl/qe/qe_common.c                     |   3 +-
 drivers/soc/fsl/qe/qe_ic.c                         |   4 +-
 drivers/soc/fsl/qe/qe_io.c                         |  36 +-
 drivers/soc/fsl/qe/ucc_fast.c                      |  68 +-
 drivers/soc/fsl/qe/ucc_slow.c                      |  42 +-
 drivers/soc/fsl/rcpm.c                             |  24 +-
 drivers/soc/imx/soc-imx.c                          |  12 +
 drivers/soc/mediatek/mt8167-mmsys.h                |  35 +
 drivers/soc/mediatek/mt8167-pm-domains.h           |   7 +
 drivers/soc/mediatek/mt8173-pm-domains.h           |  10 +
 drivers/soc/mediatek/mt8183-mmsys.h                |  54 ++
 drivers/soc/mediatek/mt8183-pm-domains.h           |  15 +
 drivers/soc/mediatek/mt8192-pm-domains.h           |  21 +
 drivers/soc/mediatek/mtk-mmsys.c                   | 314 ++------
 drivers/soc/mediatek/mtk-mmsys.h                   | 215 ++++++
 drivers/soc/mediatek/mtk-mutex.c                   |  52 +-
 drivers/soc/mediatek/mtk-pm-domains.c              |  11 +-
 drivers/soc/mediatek/mtk-pm-domains.h              |   2 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               |  97 ++-
 drivers/soc/qcom/llcc-qcom.c                       |  19 +
 drivers/soc/qcom/mdt_loader.c                      |  17 +
 drivers/soc/qcom/pdr_interface.c                   |   2 +-
 drivers/soc/qcom/qcom_aoss.c                       |   1 +
 drivers/soc/qcom/qmi_encdec.c                      |   8 +-
 drivers/soc/qcom/rpmh-rsc.c                        |  65 +-
 drivers/soc/qcom/rpmhpd.c                          |  56 ++
 drivers/soc/qcom/smem.c                            |   2 +-
 drivers/soc/qcom/wcnss_ctrl.c                      |  15 +-
 drivers/soc/renesas/rmobile-sysc.c                 |   4 +-
 drivers/soc/tegra/pmc.c                            | 259 ++++++-
 drivers/soc/tegra/regulators-tegra30.c             |   2 +-
 drivers/soc/ti/omap_prm.c                          |  16 +-
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  |   2 +-
 drivers/tee/optee/Makefile                         |   3 +
 drivers/tee/optee/call.c                           |   4 +
 drivers/tee/optee/core.c                           |  10 -
 drivers/tee/optee/optee_trace.h                    |  67 ++
 drivers/tty/serial/ucc_uart.c                      | 124 ++--
 include/dt-bindings/clock/omap5.h                  |   2 +
 include/dt-bindings/power/qcom-rpmpd.h             |  26 +
 .../dt-bindings/pwm/raspberrypi,firmware-poe-pwm.h |  13 +
 include/dt-bindings/soc/bcm-pmb.h                  |   1 +
 include/linux/clk/tegra.h                          |   4 +-
 include/linux/firmware/xlnx-zynqmp.h               |   5 -
 include/linux/fsl/guts.h                           |   4 +-
 include/linux/scmi_protocol.h                      | 200 +++---
 include/linux/soc/qcom/apr.h                       |   2 +-
 include/linux/soc/qcom/irq.h                       |   2 +-
 include/linux/soc/qcom/llcc-qcom.h                 |   6 +-
 include/linux/soc/qcom/qmi.h                       |   4 +-
 include/soc/bcm2835/raspberrypi-firmware.h         |  10 +
 include/soc/fsl/qe/qe.h                            |  34 +-
 include/soc/tegra/mc.h                             |   7 +
 167 files changed, 5560 insertions(+), 2111 deletions(-)
 delete mode 100644
Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
 create mode 100644
Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
 create mode 100644 drivers/clk/socfpga/Kconfig
 create mode 100644 drivers/iio/common/scmi_sensors/Kconfig
 create mode 100644 drivers/iio/common/scmi_sensors/Makefile
 create mode 100644 drivers/iio/common/scmi_sensors/scmi_iio.c
 create mode 100644 drivers/pwm/pwm-raspberrypi-poe.c
 create mode 100644 drivers/soc/mediatek/mt8167-mmsys.h
 create mode 100644 drivers/soc/mediatek/mt8183-mmsys.h
 create mode 100644 drivers/soc/mediatek/mtk-mmsys.h
 create mode 100644 drivers/tee/optee/optee_trace.h
 create mode 100644 include/dt-bindings/pwm/raspberrypi,firmware-poe-pwm.h
