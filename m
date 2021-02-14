Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2538C433E0
	for <soc@archiver.kernel.org>; Sun, 14 Feb 2021 22:49:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 581E564E56; Sun, 14 Feb 2021 22:49:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 228F564E27
	for <soc@kernel.org>; Sun, 14 Feb 2021 22:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613342964;
	bh=opq+nR17xrhQCKDGm8L31VtUkxRFzxfZocx+27EaLRo=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=vOiBs06r/h314oyLaCO704e1/IZPNIx7m8jdqNV7rC83bfZfLY6UO3cgTjsaztQCc
	 1dnJpGTBhuO2Jpk3DIfrpwFaM8BtE/5j3A3+2xmYVo4utEww4vwE2tPomtTG2QS9oR
	 T/8Jg6hWMOxgxkjYJ5U5NbCyydcos6UtqrixVnM5fER93wr39Q7ZTjnbKzKwDgMyB2
	 a2vTCAS9wsGH5DpjfTDOqCHzwKrWT3Y8M1cq9TSIYcqYxyy4MqFk5HKs/K8WJhYLwi
	 E25bwNmitqs12oRzv27pDsWLr10tPyCIIDUomu6X/2gsv3WmPh+aJruwlaS9qguNfB
	 4EWtWAIj+niug==
Received: by mail-ot1-f51.google.com with SMTP id 100so4550824otg.3
        for <soc@kernel.org>; Sun, 14 Feb 2021 14:49:24 -0800 (PST)
X-Gm-Message-State: AOAM532tLFZxD+uHidyiH/HndTB7HxRLCv1AuJPQr1FLjGCI8jS/jlsA
	QwIy74AO9Jfw0uUIKK6jcYepckrKi48boxUzC8U=
X-Google-Smtp-Source: ABdhPJxixFN90IiL+nLEZPjT5D0bJeWx4ERhg4TDrGWqUyOAfhXGYILP686cAAWRvcPGa/o5/pWOFf+J+0CdADDVlW4=
X-Received: by 2002:a9d:6c11:: with SMTP id f17mr9513061otq.210.1613342963462;
 Sun, 14 Feb 2021 14:49:23 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
In-Reply-To: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 14 Feb 2021 23:49:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
Message-ID: <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
Subject: [GIT PULL 6/6] ARM SoC changes for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit dcb3b06d9c34f33a249f65c08805461fb0c4325b=
:

  tee: optee: replace might_sleep with cond_resched (2021-01-21 10:36:48 +0=
100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-drivers-v5.12

for you to fetch changes up to 4f79a8b06fccec3dd68935db5a4662435c472abf:

  Merge tag 'aspeed-5.12-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed into
arm/drivers (2021-02-11 15:57:56 +0100)

----------------------------------------------------------------
ARM: SoC drivers for v5.12

Updates for SoC specific drivers include a few subsystems that
have their own maintainers but send them through the soc tree:

SCMI firmware:
 - add support for a completion interrupt

Reset controllers:
 - new driver for BCM4908
 - new devm_reset_control_get_optional_exclusive_released()
   function

Memory controllers:
 - Renesas RZ/G2 support
 - Tegra124 interconnect support
 - Allow more drivers to be loadable modules

TEE/optee firmware:
 - minor code cleanup

The other half of this is SoC specific drivers that do not
belong into any other subsystem, most of them living in
drivers/soc:

 - Allwinner/sunxi power management work
 - Allwinner H616 support

 - ASpeed AST2600 system identification support

 - AT91 SAMA7G5 SoC ID driver
 - AT91 SoC driver cleanups

 - Broadcom BCM4908 power management bus support

 - Marvell mbus cleanups

 - Mediatek MT8167 power domain support

 - Qualcomm socinfo driver support for PMIC
 - Qualcomm SoC identification for many more products

 - TI Keystone driver cleanups for PRUSS and elsewhere

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
There is a small merge conflict against a bugfix that is already in
mainline, the extra line needs to be kept here.

----------------------------------------------------------------
Adam Ford (2):
      dt-bindings: memory: renesas,rpc-if: Add support for RZ/G2 Series
      memory: renesas-rpc-if: Add RZ/G2 to Kconfig description

Alice Guo (1):
      soc: imx8m: change to use platform driver

Andre Przywara (3):
      dt-bindings: sram: sunxi-sram: Add H616 compatible string
      soc: sunxi: sram: Add support for more than one EMAC clock
      dt-bindings: bus: rsb: Add H616 compatible string

Andy Shevchenko (1):
      soc: qcom: smem: use %*ph to print small buffer

Arnd Bergmann (19):
      Merge tag 'scmi-updates-5.12' of
git://git.kernel.org/.../sudeep.holla/linux into arm/drivers
      Merge tag 'reset-for-v5.12' of
git://git.pengutronix.de/pza/linux into arm/drivers
      Merge tag 'at91-soc-5.12-2' of
git://git.kernel.org/.../at91/linux into arm/drivers
      Merge tag 'sunxi-drivers-for-5.12' of
git://git.kernel.org/.../sunxi/linux into arm/drivers
      Merge tag 'memory-controller-drv-5.12' of
git://git.kernel.org/.../krzk/linux-mem-ctrl into arm/drivers
      Merge tag 'memory-controller-drv-tegra-5.12' of
git://git.kernel.org/.../krzk/linux-mem-ctrl into arm/drivers
      Merge tag 'arm-soc/for-5.12/drivers' of
https://github.com/Broadcom/stblinux into arm/drivers
      Merge tag 'drivers_soc_for_5.12' of
git://git.kernel.org/.../ssantosh/linux-keystone into arm/drivers
      Merge tag 'mvebu-arm-5.12-1' of
git://git.kernel.org/.../gclement/mvebu into arm/drivers
      Merge tag 'v5.11-next-soc' of
git://git.kernel.org/.../matthias.bgg/linux into arm/drivers
      Merge tag 'tee-housekeeping-for-v5.12' of
git://git.linaro.org:/people/jens.wiklander/linux-tee into arm/drivers
      Merge tag 'optee-fix-cond-resched-call-for-v5.12' of
git://git.linaro.org:/people/jens.wiklander/linux-tee into arm/drivers
      drivers: soc: atmel: fix type for same7
      optee: simplify i2c access
      Merge tag 'optee-simplify-i2c-access_for-v5.12' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/drivers
      Merge tag 'qcom-drivers-for-5.12' of
git://git.kernel.org/.../qcom/linux into arm/drivers
      Merge tag 'imx-drivers-5.12' of
git://git.kernel.org/.../shawnguo/linux into arm/drivers
      Merge tag 'memory-controller-drv-5.12-2' of
git://git.kernel.org/.../krzk/linux-mem-ctrl into arm/drivers
      Merge tag 'aspeed-5.12-soc' of
git://git.kernel.org/.../joel/aspeed into arm/drivers

Bjorn Helgaas (1):
      tee: optee: fix 'physical' typos

Chen-Yu Tsai (1):
      Merge remote-tracking branch 'mfd/ib-mfd-bus-5.12' into
sunxi/drivers-for-5.12

Chris Packham (1):
      bus: mvebu-mbus: make iounmap() symmetric with ioremap()

Christophe JAILLET (1):
      soc: ti: pm33xx: Fix some resource leak in the error handling
paths of the probe function

Chun-Kuang Hu (1):
      soc: mediatek: cmdq: Remove cmdq_pkt_flush()

Claudiu Beznea (7):
      drivers: soc: atmel: add null entry at the end of at91_soc_allowed_li=
st[]
      drivers: soc: atmel: use GENMASK
      drivers: soc: atmel: fix "__initconst should be placed after
socs[]" warning
      drivers: soc: atmel: add per soc id and version match masks
      dt-bindings: atmel-sysreg: add "microchip, sama7g5-chipid"
      drivers: soc: atmel: add support for sama7g5
      drivers: soc: atmel: add spdx license identifier

Colin Ian King (1):
      soc: qcom: socinfo: Fix off-by-one array index bounds check

Cristian Marussi (1):
      firmware: arm_scmi: Fix call site of scmi_notification_exit

Dan Carpenter (1):
      soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()

Dmitry Baryshkov (5):
      dt-bindings: soc: qcom: convert qcom,smem bindings to yaml
      soc: qcom: socinfo: add qrb5165 SoC ID
      soc: qcom: socinfo: add several PMIC IDs
      soc: qcom: socinfo: add info from PMIC models array
      soc: qcom: socinfo: Remove unwanted le32_to_cpu()

Dmitry Osipenko (5):
      memory: tegra124-emc: Make driver modular
      memory: tegra124-emc: Continue probing if timings are missing in
device-tree
      memory: tegra124: Support interconnect framework
      memory: tegra: Check whether reset is already asserted
      reset: Add devm_reset_control_get_optional_exclusive_released()

Elvira Khabirova (1):
      tee: fix some comment typos in header files

Enric Balletbo i Serra (1):
      soc: mediatek: pm-domains: Don't print an error if child domain
is deferred

Fabien Parent (2):
      dt-bindings: power: Add MT8167 power domains
      soc: mediatek: pm-domains: Add support for mt8167

Florian Fainelli (1):
      soc: bcm: brcmstb: Remove soc_is_brcmstb()

Grzegorz Jaszczyk (1):
      dt-bindings: soc: ti: Update TI PRUSS bindings about schemas to inclu=
de

Hsin-Yi Wang (2):
      dt-bindings: power: Add domain regulator supply
      soc: mediatek: pm-domains: Add domain regulator supply

Jae Hyun Yoo (1):
      soc: aspeed: snoop: Add clock control logic

Jens Wiklander (2):
      optee: sync OP-TEE headers
      tee: optee: remove need_resched() before cond_resched()

Jiapeng Chong (1):
      memory: tegra186-emc: Replace DEFINE_SIMPLE_ATTRIBUTE with
DEFINE_DEBUGFS_ATTRIBUTE

Jim Quinlan (2):
      dt-bindings: arm: Add optional interrupt to smc/hvc SCMI transport
      firmware: arm_scmi: Augment SMC/HVC to allow optional interrupt

Joel Stanley (1):
      soc: aspeed: socinfo: Add new systems

Konrad Dybcio (4):
      soc: qcom: socinfo: Add SoC IDs for 630 family
      soc: qcom: socinfo: Add SoC IDs for APQ/MSM8998
      soc: qcom: socinfo: Add MDM9607 IDs
      drivers: soc: qcom: rpmpd: Add msm8994 RPM Power Domains

Krzysztof Kozlowski (2):
      memory: ti-emif-pm: Drop of_match_ptr from of_device_id table
      memory: samsung: exynos5422-dmc: Correct function names in kerneldoc

Lina Iyer (2):
      drivers: qcom: rpmh-rsc: Do not read back the register write on trigg=
er
      soc: qcom: rpmh: Remove serialization of TCS commands

Luca Weiss (1):
      soc: qcom: ocmem: don't return NULL in of_get_ocmem

Manivannan Sadhasivam (2):
      dt-bindings: msm: Add LLCC for SM8250
      soc: qcom: llcc-qcom: Add support for SM8250 SoC

Mauro Carvalho Chehab (1):
      reset: core: fix a kernel-doc markup

Pan Bian (1):
      memory: ti-aemif: Drop child node when jumping out loop

Rafa=C5=82 Mi=C5=82ecki (5):
      dt-bindings: reset: document Broadcom's BCM4908 PCIe reset binding
      reset: simple: add BCM4908 MISC PCIe reset controller support
      dt-bindings: power: document Broadcom's PMB binding
      soc: bcm: add PM driver for Broadcom's PMB
      soc: bcm: brcmstb: add stubs for getting platform IDs

Sai Prakash Ranjan (1):
      soc: qcom: llcc-qcom: Extract major hardware version

Samuel Holland (4):
      bus: sunxi-rsb: Move OF match table
      bus: sunxi-rsb: Split out controller init/exit functions
      bus: sunxi-rsb: Implement suspend/resume/shutdown callbacks
      bus: sunxi-rsb: Implement runtime power management

Stephen Boyd (1):
      soc: qcom: socinfo: Open read access to all for debugfs

Sudeep Holla (2):
      drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs
      MAINTAINERS: Update ARM SCMI entry

Suman Anna (3):
      soc: ti: pruss: Correct the pruss_clk_init error trace text
      soc: ti: pruss: Refactor the CFG sub-module init
      soc: ti: k3-ringacc: Use of_device_get_match_data()

Tian Tao (1):
      drivers: optee: use flexible-array member instead of zero-length arra=
y

Uwe Kleine-K=C3=B6nig (1):
      mfd/bus: sunxi-rsb: Make .remove() callback return void

Vasyl Gomonovych (1):
      soc: ti: knav_qmss: Put refcount for dev node in failure case

Vinod Koul (1):
      soc: qcom: aoss: Add SM8350 compatible

Viresh Kumar (1):
      memory: tegra: Remove calls to dev_pm_opp_set_clkname()

Yong Wu (2):
      memory: mtk-smi: Use platform_register_drivers
      memory: mtk-smi: Allow building as module

Zhang Qilong (1):
      memory: mtk-smi: Fix PM usage counter unbalance in mtk_smi ops

Zhen Lei (3):
      reset: hisilicon: correct vendor prefix
      dt-bindings: reset: correct vendor prefix hisi to hisilicon
      dt-bindings: reset: convert Hisilicon reset controller bindings
to json-schema

Zheng Yongjun (1):
      memory: emif: Use DEFINE_SPINLOCK() for spinlock

 Documentation/devicetree/bindings/arm/arm,scmi.txt
         |   8 +
 Documentation/devicetree/bindings/arm/atmel-sysregs.txt
         |   2 +-
 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
         |   1 +
 Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
         |   4 +-
 Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
      |   6 +-
 Documentation/devicetree/bindings/power/brcm,bcm-pmb.yaml
         |  50 +++++++
 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
        |  11 ++
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
         |   1 +
 Documentation/devicetree/bindings/reset/brcm,bcm4908-misc-pcie-reset.yaml
     |  39 +++++
 Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
         |  44 ------
 Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.yaml
         |  77 ++++++++++
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
         |   1 +
 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
         |  57 -------
 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
         |  72 +++++++++
 Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
         |  76 ++++++++++
 Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.=
yaml
|   1 +
 MAINTAINERS
         |  12 ++
 drivers/bus/mvebu-mbus.c
         |   2 +-
 drivers/bus/sunxi-rsb.c
         | 215 +++++++++++++++++++--------
 drivers/clk/tegra/Kconfig
         |   3 +
 drivers/clk/tegra/Makefile
         |   2 +-
 drivers/clk/tegra/clk-tegra124-emc.c
         |  41 +++++-
 drivers/clk/tegra/clk-tegra124.c
         |  26 +++-
 drivers/clk/tegra/clk.h
         |  18 ++-
 drivers/firmware/arm_scmi/driver.c
         |   4 +-
 drivers/firmware/arm_scmi/smc.c
         |  42 +++++-
 drivers/memory/Kconfig
         |   8 +-
 drivers/memory/emif.c
         |   3 +-
 drivers/memory/mtk-smi.c
         |  36 ++---
 drivers/memory/samsung/exynos5422-dmc.c
         |   4 +-
 drivers/memory/tegra/Kconfig
         |   4 +-
 drivers/memory/tegra/mc.c
         |   7 +
 drivers/memory/tegra/tegra124-emc.c
         | 368 +++++++++++++++++++++++++++++++++++++++++-----
 drivers/memory/tegra/tegra124.c
         |  82 ++++++++++-
 drivers/memory/tegra/tegra186-emc.c
         |  12 +-
 drivers/memory/tegra/tegra20-emc.c
         |  13 +-
 drivers/memory/tegra/tegra30-emc.c
         |  13 +-
 drivers/memory/ti-aemif.c
         |   8 +-
 drivers/memory/ti-emif-pm.c
         |   2 +-
 drivers/mfd/axp20x-i2c.c
         |   4 +-
 drivers/mfd/axp20x-rsb.c
         |   4 +-
 drivers/mfd/axp20x.c
         |   4 +-
 drivers/reset/Kconfig
         |   2 +-
 drivers/reset/core.c
         |   4 +-
 drivers/reset/hisilicon/reset-hi3660.c
         |   9 +-
 drivers/reset/reset-simple.c
         |   2 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c
         |  30 +++-
 drivers/soc/aspeed/aspeed-socinfo.c
         |  33 ++++-
 drivers/soc/atmel/soc.c
         | 227 +++++++++++++++++++---------
 drivers/soc/atmel/soc.h
         |  19 ++-
 drivers/soc/bcm/Makefile
         |   2 +-
 drivers/soc/bcm/bcm63xx/Kconfig
         |   9 ++
 drivers/soc/bcm/bcm63xx/Makefile
         |   1 +
 drivers/soc/bcm/bcm63xx/bcm-pmb.c
         | 333 +++++++++++++++++++++++++++++++++++++++++
 drivers/soc/bcm/brcmstb/common.c
         |  17 ---
 drivers/soc/imx/soc-imx8m.c
         |  84 +++++++++--
 drivers/soc/mediatek/mt8167-pm-domains.h
         |  86 +++++++++++
 drivers/soc/mediatek/mt8183-pm-domains.h
         |   1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c
         |  32 ----
 drivers/soc/mediatek/mtk-pm-domains.c
         |  51 ++++++-
 drivers/soc/mediatek/mtk-pm-domains.h
         |   2 +
 drivers/soc/qcom/llcc-qcom.c
         |  50 +++++++
 drivers/soc/qcom/ocmem.c
         |   8 +-
 drivers/soc/qcom/qcom_aoss.c
         |   1 +
 drivers/soc/qcom/rpmh-rsc.c
         |  24 ++-
 drivers/soc/qcom/rpmpd.c
         |  28 ++++
 drivers/soc/qcom/smem.c
         |   4 +-
 drivers/soc/qcom/socinfo.c
         | 105 ++++++++++---
 drivers/soc/sunxi/sunxi_sram.c
         |  31 +++-
 drivers/soc/ti/k3-ringacc.c
         |   7 +-
 drivers/soc/ti/knav_dma.c
         |   1 +
 drivers/soc/ti/knav_qmss_queue.c
         |   3 +
 drivers/soc/ti/pm33xx.c
         |   5 +-
 drivers/soc/ti/pruss.c
         |  91 ++++++------
 drivers/tee/optee/call.c
         |   3 +-
 drivers/tee/optee/optee_msg.h
         | 158 ++------------------
 drivers/tee/optee/optee_rpc_cmd.h
         | 103 +++++++++++++
 drivers/tee/optee/optee_smc.h
         |  72 ++++++---
 drivers/tee/optee/rpc.c
         |  70 ++++-----
 include/dt-bindings/power/mt8167-power.h
         |  17 +++
 include/dt-bindings/power/qcom-rpmpd.h
         |   9 ++
 include/dt-bindings/soc/bcm-pmb.h
         |  11 ++
 include/linux/clk/tegra.h
         |   8 +
 include/linux/mfd/axp20x.h
         |   2 +-
 include/linux/reset.h
         |  19 +++
 include/linux/soc/brcmstb/brcmstb.h
         |  16 ++
 include/linux/soc/mediatek/infracfg.h
         |   8 +
 include/linux/soc/mediatek/mtk-cmdq.h
         |  12 --
 include/linux/soc/qcom/llcc-qcom.h
         |   3 +
 include/linux/sunxi-rsb.h
         |   2 +-
 include/linux/tee_drv.h
         |   2 +-
 include/soc/brcmstb/common.h
         |  12 --
 include/soc/mediatek/smi.h
         |   2 +-
 include/soc/qcom/tcs.h
         |   9 +-
 include/soc/tegra/emc.h
         |  16 --
 include/uapi/linux/tee.h
         |   2 +-
 96 files changed, 2446 insertions(+), 799 deletions(-)
