Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664C2C25B06
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FF45C433B5; Tue,  2 Aug 2022 14:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2556AC433D7;
	Tue,  2 Aug 2022 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659448927;
	bh=QzSpZ7xZ+TIQyC3EjGL4JqTjh8x1E9hMG0dAdyWnobI=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=WhBCkB3NDCj2i8UGkxo6VX6mvTvVGT4aFnLWMxpnV/BKTdeuer0rOQCGpFG/USi1Y
	 wLsYkWa8fGcWbid7U7v56SMI/5bVFRzgwqTEFnVS+eIsVaX+k/X58x9ZhITPwI2JwJ
	 atoZc7ckAE1e4N/Qb8GQ6eTpnO8I1QrApoiQqhQmtHzCMnpXmelncxY17aykVUWbia
	 JvRCXGeGC7KN2BsYUrplmkJAzds5KAkmZdRIiQ/jIEvonMzHK4bRGxBMmAZ84OdAxy
	 BTfW9m3mNWi7+lDeLma5Hcd/CQ+F/wY0gooMxdZxu0dTza6TZgPlYz/oIt9udglICH
	 3lD31j8LZuQfw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] ARM: SoC drivers for 6.0
Date: Tue,  2 Aug 2022 16:01:56 +0200
Message-Id: <20220802140200.3987874-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220802140200.3987874-1-arnd@kernel.org>
References: <20220802140200.3987874-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-6.0

for you to fetch changes up to 99978d2fd90b9a43d187dae7b0f3266ccd980c5c:

  Merge tag 'qcom-drivers-for-5.20-2' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/drivers (2022-07-21 15:00:19 +0200)

----------------------------------------------------------------
ARM: SoC drivers for 6.0

The SoC driver updates contain changes to improve support for
additional SoC variants, as well as cleanups an minor bugfixes
in a number of existing drivers.

Notable updates this time include:

 - Support for Qualcomm MSM8909 (Snapdragon 210) in various drivers

 - Updates for interconnect drivers on Qualcomm Snapdragon

 - A new driver support for NMI interrupts on Fujitsu A64fx

 - A rework of Broadcom BCMBCA Kconfig dependencies

 - Improved support for BCM2711 (Raspberry Pi 4) power management
   to allow the use of the V3D GPU

 - Cleanups to the NXP guts driver

 - Arm SCMI firmware driver updates to add tracing support, and
   use the firmware interfaces for system power control and for
   power capping.

----------------------------------------------------------------
Akhil R (1):
      dt-bindings: Add headers for Tegra234 GPCDMA

AngeloGioacchino Del Regno (12):
      dt-bindings: memory: mtk-smi: Add MT6795 Helio X10 bindings
      memory: mtk-smi: Add support for MT6795 Helio X10
      soc: mediatek: pwrap: Use readx_poll_timeout() instead of custom function
      soc: mediatek: pwrap: Switch to devm_platform_ioremap_resource_byname()
      soc: mediatek: pwrap: Check return value of platform_get_irq()
      soc: mediatek: pwrap: Move IO pointers to new structure
      soc: mediatek: pwrap: Compress of_device_id entries to one line
      soc: mediatek: mutex: Use DDP_COMPONENT_DITHER0 mod index for MT8365
      soc: mediatek: mtk-pm-domains: Allow probing vreg supply on two MFGs
      dt-bindings: power: Add MediaTek Helio X10 MT6795 power domains
      soc: mediatek: pm-domains: Add support for Helio X10 MT6795
      soc: mediatek: mutex: Simplify with devm_platform_get_and_ioremap_resource()

Arnd Bergmann (14):
      Merge tag 'renesas-drivers-for-v5.20-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/drivers
      Merge tag 'amlogic-drivers-for-v5.20' of git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into arm/drivers
      Merge tag 'memory-controller-drv-5.20' of git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into arm/drivers
      Merge tag 'scmi-updates-5.20' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/drivers
      Merge tag 'sunxi-drivers-for-5.20-1' of git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/drivers
      Merge tag 'v5.19-next-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into arm/drivers
      Merge tag 'tegra-for-5.20-firmware' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/drivers
      Merge tag 'tegra-for-5.20-memory' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/drivers
      Merge tag 'ti-driver-soc-for-v5.20' of git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/drivers
      Merge tag 'imx-drivers-5.20' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/drivers
      Merge tag 'arm-soc/for-5.20/drivers' of https://github.com/Broadcom/stblinux into arm/drivers
      Merge tag 'qcom-drivers-for-5.20' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/drivers
      soc: a64fx-diag: disable modular build
      Merge tag 'qcom-drivers-for-5.20-2' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/drivers

Bo Liu (1):
      firmware: arm_scmi: Remove usage of the deprecated ida_simple_xxx API

Chunfeng Yun (1):
      soc: mediatek: pm-domains: Add support always on flag

Cristian Marussi (13):
      firmware: arm_scmi: Relax CLOCK_DESCRIBE_RATES out-of-spec checks
      include: trace: Add SCMI full message tracing
      firmware: arm_scmi: Use new SCMI full message tracing
      firmware: arm_scmi: Support only one single system power device
      firmware: arm_scmi: Add SCMI v3.1 System Power extensions
      firmware: arm_scmi: Add devm_protocol_acquire helper
      firmware: arm_scmi: Add SCMI System Power Control driver
      dt-bindings: firmware: arm,scmi: Add support for powercap protocol
      firmware: arm_scmi: Add SCMI v3.1 powercap protocol basic support
      firmware: arm_scmi: Generalize the fast channel support
      firmware: arm_scmi: Add SCMI v3.1 powercap fast channels support
      include: trace: Add SCMI fast channel tracing
      firmware: arm_scmi: Use fast channel tracing

Douglas Anderson (2):
      soc: qcom: socinfo: Add an ID for sc7180P
      soc: qcom: cmd-db: replace strscpy_pad() with strncpy()

Fabien Parent (2):
      soc: mediatek: mutex: add MT8365 support
      soc: mediatek: mt8365-mmsys: add DPI/HDMI display path

Florian Fainelli (1):
      Merge tag 'tags/ib-mfd-soc-bcm-v5.20' into drivers/next

Geert Uytterhoeven (2):
      soc: renesas: r8a779a0-sysc: Fix A2DP1 and A2CV[2357] PDR values
      soc: renesas: rcar-sysc: Optimize rcar_sysc_area struct sizes

Hitomi Hasegawa (1):
      soc: fujitsu: Add A64FX diagnostic interrupt driver

Jiang Jian (1):
      firmware: qcom_scm: drop unexpected word "the"

Julia Lawall (2):
      soc: bcm: brcmstb: pm: pm-arm: fix typo in comment
      soc: qcom: rpmhpd: fix typos in comment

Kishon Vijay Abraham I (3):
      dt-bindings: soc: ti: pruss: Re-arrange "compatible" in alphabetic order
      dt-bindings: soc: ti: pruss: Update bindings for K3 AM62x SoCs
      soc: ti: pruss: Enable support for PRUSS-M subsystem on K3 AM62x SoCs

Konrad Dybcio (2):
      soc/qcom: Make QCOM_RPMPD select PM_GENERIC_DOMAINS/_OF
      soc: qcom: Make QCOM_RPMPD depend on PM

Krzysztof Kozlowski (11):
      dt-bindings: firmware: document Qualcomm QCS404 and SM6125 SCM
      firmware: qcom_scm-legacy: correct kerneldoc
      soc: qcom: cmd-db: replace strncpy() with strscpy_pad()
      soc: qcom: correct kerneldoc
      dt-bindings: arm: qcom: switch maintainer to Bjorn
      dt-bindings: soc: qcom,wcnss: remove unneeded ref for names
      dt-bindings: interconnect: qcom,msm8998-cpu-bwmon: add BWMON device
      soc: qcom: icc-bwmon: Add bandwidth monitoring driver
      dt-bindings: soc: qcom,rpmh-rsc: simplify qcom,tcs-config
      dt-bindings: soc: qcom: aoss: document qcom,sm8450-aoss-qmp
      dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller

Liang He (2):
      soc: amlogic: Fix refcount leak in meson-secure-pwrc.c
      soc: bcm: brcmstb: biuctrl: Add missing of_node_put()

Lv Ruyi (1):
      firmware: tegra: Fix error check return value of debugfs_create_file()

Marek Vasut (1):
      soc: imx: imx8m-blk-ctrl: Make error prints useful

Martin Kepplinger (1):
      soc: imx: gpcv2: print errno for regulator errors

Miaoqian Lin (3):
      meson-mx-socinfo: Fix refcount leak in meson_mx_socinfo_init
      soc: qcom: ocmem: Fix refcount leak in of_get_ocmem
      soc: qcom: aoss: Fix refcount leak in qmp_cooling_devices_register

Michael Walle (7):
      soc: fsl: guts: machine variable might be unset
      soc: fsl: guts: remove module_exit() and fsl_guts_remove()
      soc: fsl: guts: embed fsl_guts_get_svr() in probe()
      soc: fsl: guts: allocate soc_dev_attr on the heap
      soc: fsl: guts: use of_root instead of own reference
      soc: fsl: guts: drop platform driver
      soc: fsl: guts: add serial_number support

Moudy Ho (5):
      soc: mediatek: mutex: add common interface for modules setting
      soc: mediatek: mutex: add 8183 MUTEX MOD settings for MDP
      dt-bindings: soc: mediatek: move out common module from display folder
      dt-bindings: soc: mediatek: add gce-client-reg for MUTEX
      soc: mediatek: mutex: add functions that operate registers by CMDQ

Nathan Chancellor (1):
      soc: mediatek: SVS: Use DEFINE_SIMPLE_DEV_PM_OPS for svs_pm_ops

Nicolas Saenz Julienne (2):
      mfd: bcm2835-pm: Use 'reg-names' to get resources
      soc: bcm: bcm2835-power: Bypass power_on/off() calls

Parikshit Pareek (1):
      soc: qcom: socinfo: Fix the id of SA8540P SoC

Peng Wu (1):
      soc: mediatek: fix missing clk_disable_unprepare() on err in svs_resume()

Rex-BC Chen (3):
      dt-bindings: soc: mediatek: devapc: Add bindings for MT8186
      soc: mediatek: devapc: Separate register offsets from mtk_devapc_data
      soc: mediatek: devapc: Add support for MT8186

Roger Lu (6):
      dt-bindings: soc: mediatek: add mtk svs dt-bindings
      soc: mediatek: SVS: introduce MTK SVS engine
      soc: mediatek: SVS: add monitor mode
      soc: mediatek: SVS: add debug commands
      dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
      soc: mediatek: SVS: add mt8192 SVS GPU driver

Rohit Agarwal (1):
      dt-bindings: firmware: scm: Add compatible for SDX65

Samuel Holland (1):
      soc: sunxi: mbus: Only build the driver on ARM/ARM64

Sibi Sankar (2):
      dt-bindings: firmware: qcom-scm: Add interconnects property
      firmware: qcom_scm: Add bw voting support to the SCM interface

Stefan Wahren (4):
      mfd: bcm2835-pm: Add support for BCM2711
      soc: bcm: bcm2835-power: Refactor ASB control
      soc: bcm: bcm2835-power: Resolve ASB register macros
      soc: bcm: bcm2835-power: Add support for BCM2711's RPiVid ASB

Stephan Gerhold (8):
      dt-bindings: soc: qcom: smd-rpm: Add MSM8909
      soc: qcom: smd-rpm: Add compatible for MSM8909
      dt-bindings: power: qcom-rpmpd: Add MSM8909 power domains
      soc: qcom: rpmpd: Add compatible for MSM8909
      dt-bindings: soc: qcom: spm: Add MSM8909 CPU compatible
      soc: qcom: spm: Add CPU data for MSM8909
      dt-bindings: arm: cpus: Document "qcom,msm8909-smp" enable-method
      ARM: mach-qcom: Add support for MSM8909

Sudeep Holla (1):
      firmware: arm_scpi: Ensure scpi_info is not assigned if the probe fails

Sumit Gupta (3):
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 CBB 1.0 binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 AXI2APB binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra234 CBB 2.0 binding

Thierry Reding (5):
      dt-bindings: power: Add Tegra234 MGBE power domains
      dt-bindings: Add Tegra234 MGBE clocks and resets
      dt-bindings: memory: Add Tegra234 MGBE memory clients
      Merge branch 'for-5.20/dt-bindings' into for-5.20/memory
      memory: tegra: Add MGBE memory clients for Tegra234

Timo Alho (1):
      firmware: tegra: bpmp: Do only aligned access to IPC memory area

Uwe Kleine-König (1):
      soc: qcom: apr: Drop redundant check in .remove()

Vincent Guittot (1):
      firmware: arm_scmi: Fix response size warning for OPTEE transport

William Zhang (7):
      ata: ahci_brcm: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      i2c: brcmstb: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      phy: brcm-sata: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      hwrng: bcm2835: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      clk: bcm: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      spi: bcm63xx-hsspi: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      tty: serial: bcm63xx: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA

Xiang wangx (1):
      soc: qcom: llcc: Fix syntax errors in comments

Yang Li (2):
      soc: ti: wkup_m3_ipc: Remove unneeded semicolon
      soc: qcom: icc-bwmon: Remove unnecessary print function dev_err()

Yang Yingliang (2):
      soc: fsl: guts: fix return value check in fsl_guts_init()
      soc: fsl: guts: check return value after calling of_iomap() in fsl_guts_get_soc_uid()

 Documentation/devicetree/bindings/arm/cpus.yaml    |    1 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |    2 +-
 .../arm/tegra/nvidia,tegra194-axi2apb.yaml         |   40 +
 .../bindings/arm/tegra/nvidia,tegra194-cbb.yaml    |   97 +
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |   74 +
 .../devicetree/bindings/firmware/arm,scmi.yaml     |   10 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |    4 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   86 +
 .../memory-controllers/mediatek,smi-common.yaml    |    1 +
 .../memory-controllers/mediatek,smi-larb.yaml      |    1 +
 .../bindings/power/mediatek,power-controller.yaml  |    2 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
 .../devicetree/bindings/soc/mediatek/devapc.yaml   |    1 +
 .../{display => soc}/mediatek/mediatek,mutex.yaml  |   14 +-
 .../devicetree/bindings/soc/mediatek/mtk-svs.yaml  |   91 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |    1 +
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           |   33 +-
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |    4 +
 .../devicetree/bindings/soc/qcom/qcom,spm.yaml     |    1 +
 .../devicetree/bindings/soc/qcom/qcom,wcnss.yaml   |    1 -
 .../devicetree/bindings/soc/ti/ti,pruss.yaml       |    5 +-
 MAINTAINERS                                        |   12 +
 arch/arm/mach-qcom/Kconfig                         |    4 +
 arch/arm/mach-qcom/platsmp.c                       |    1 +
 drivers/ata/Kconfig                                |    2 +-
 drivers/char/hw_random/Kconfig                     |    2 +-
 drivers/clk/bcm/Kconfig                            |    4 +-
 drivers/firmware/arm_scmi/Kconfig                  |   12 +
 drivers/firmware/arm_scmi/Makefile                 |    3 +-
 drivers/firmware/arm_scmi/bus.c                    |    6 +-
 drivers/firmware/arm_scmi/clock.c                  |   26 +-
 drivers/firmware/arm_scmi/driver.c                 |  282 ++-
 drivers/firmware/arm_scmi/optee.c                  |    7 +-
 drivers/firmware/arm_scmi/perf.c                   |  225 +-
 drivers/firmware/arm_scmi/powercap.c               |  866 +++++++
 drivers/firmware/arm_scmi/protocols.h              |   26 +
 drivers/firmware/arm_scmi/scmi_power_control.c     |  362 +++
 drivers/firmware/arm_scmi/system.c                 |   17 +-
 drivers/firmware/arm_scpi.c                        |   61 +-
 drivers/firmware/qcom_scm-legacy.c                 |    4 +
 drivers/firmware/qcom_scm.c                        |   71 +-
 drivers/firmware/tegra/bpmp-debugfs.c              |   10 +-
 drivers/firmware/tegra/bpmp.c                      |    6 +-
 drivers/i2c/busses/Kconfig                         |    2 +-
 drivers/memory/mtk-smi.c                           |   17 +
 drivers/memory/tegra/tegra234.c                    |   80 +
 drivers/mfd/bcm2835-pm.c                           |   74 +-
 drivers/phy/broadcom/Kconfig                       |    2 +-
 drivers/soc/Kconfig                                |    1 +
 drivers/soc/Makefile                               |    1 +
 drivers/soc/amlogic/meson-mx-socinfo.c             |    1 +
 drivers/soc/amlogic/meson-secure-pwrc.c            |    4 +-
 drivers/soc/bcm/bcm2835-power.c                    |   72 +-
 drivers/soc/bcm/brcmstb/biuctrl.c                  |    9 +-
 drivers/soc/bcm/brcmstb/pm/pm-arm.c                |    2 +-
 drivers/soc/fsl/guts.c                             |  221 +-
 drivers/soc/fujitsu/Kconfig                        |   16 +
 drivers/soc/fujitsu/Makefile                       |    3 +
 drivers/soc/fujitsu/a64fx-diag.c                   |  154 ++
 drivers/soc/imx/gpcv2.c                            |    8 +-
 drivers/soc/imx/imx8m-blk-ctrl.c                   |    9 +-
 drivers/soc/mediatek/Kconfig                       |   10 +
 drivers/soc/mediatek/Makefile                      |    1 +
 drivers/soc/mediatek/mt6795-pm-domains.h           |  112 +
 drivers/soc/mediatek/mt8183-pm-domains.h           |    1 +
 drivers/soc/mediatek/mt8186-pm-domains.h           |    2 +-
 drivers/soc/mediatek/mt8192-pm-domains.h           |    2 +
 drivers/soc/mediatek/mt8195-pm-domains.h           |    4 +-
 drivers/soc/mediatek/mt8365-mmsys.h                |   22 +
 drivers/soc/mediatek/mtk-devapc.c                  |   45 +-
 drivers/soc/mediatek/mtk-mutex.c                   |  155 +-
 drivers/soc/mediatek/mtk-pm-domains.c              |    8 +
 drivers/soc/mediatek/mtk-pm-domains.h              |    2 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               |  225 +-
 drivers/soc/mediatek/mtk-svs.c                     | 2403 ++++++++++++++++++++
 drivers/soc/qcom/Kconfig                           |   18 +
 drivers/soc/qcom/Makefile                          |    1 +
 drivers/soc/qcom/apr.c                             |   15 +-
 drivers/soc/qcom/cmd-db.c                          |    8 +-
 drivers/soc/qcom/icc-bwmon.c                       |  419 ++++
 drivers/soc/qcom/llcc-qcom.c                       |    2 +-
 drivers/soc/qcom/mdt_loader.c                      |    4 +-
 drivers/soc/qcom/ocmem.c                           |    3 +
 drivers/soc/qcom/qcom_aoss.c                       |    4 +-
 drivers/soc/qcom/rpmhpd.c                          |    4 +-
 drivers/soc/qcom/rpmpd.c                           |    1 +
 drivers/soc/qcom/smd-rpm.c                         |    1 +
 drivers/soc/qcom/smp2p.c                           |    3 +
 drivers/soc/qcom/socinfo.c                         |    4 +-
 drivers/soc/qcom/spm.c                             |   14 +
 drivers/soc/renesas/r8a779a0-sysc.c                |   10 +-
 drivers/soc/renesas/rcar-gen4-sysc.h               |    4 +-
 drivers/soc/renesas/rcar-sysc.h                    |    4 +-
 drivers/soc/sunxi/Kconfig                          |    1 +
 drivers/soc/ti/pruss.c                             |    1 +
 drivers/soc/ti/wkup_m3_ipc.c                       |    2 +-
 drivers/spi/Kconfig                                |    2 +-
 drivers/tty/serial/Kconfig                         |    4 +-
 include/dt-bindings/clock/tegra234-clock.h         |  101 +
 include/dt-bindings/memory/tegra234-mc.h           |   21 +
 include/dt-bindings/power/mt6795-power.h           |   16 +
 include/dt-bindings/power/qcom-rpmpd.h             |    7 +
 include/dt-bindings/power/tegra234-powergate.h     |    1 +
 include/dt-bindings/reset/tegra234-reset.h         |    9 +
 include/linux/mfd/bcm2835-pm.h                     |    1 +
 include/linux/scmi_protocol.h                      |  134 ++
 include/linux/soc/mediatek/mtk-mutex.h             |   27 +
 include/trace/events/scmi.h                        |   56 +
 108 files changed, 6456 insertions(+), 593 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,mutex.yaml (81%)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
 create mode 100644 drivers/firmware/arm_scmi/powercap.c
 create mode 100644 drivers/firmware/arm_scmi/scmi_power_control.c
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/a64fx-diag.c
 create mode 100644 drivers/soc/mediatek/mt6795-pm-domains.h
 create mode 100644 drivers/soc/mediatek/mtk-svs.c
 create mode 100644 drivers/soc/qcom/icc-bwmon.c
 create mode 100644 include/dt-bindings/power/mt6795-power.h
