Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61E8C432BE
	for <soc@archiver.kernel.org>; Wed,  1 Sep 2021 19:57:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9D812610E5; Wed,  1 Sep 2021 19:57:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F9B3610CD
	for <soc@kernel.org>; Wed,  1 Sep 2021 19:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630526267;
	bh=PjUIq30dJf3Ldi9g+pISOQwtraILrxnxxQiuFvnhf2o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qseuOKlXiVCl7z9ayyOVPRjq+9mGs1zh1dv8zY00EpY+DKbAKkRBvenLu0vWmdjM0
	 JK4FCH7DmZQXks2y97KR9GvWa/U0YRD9assanArWWqbmKtvfEC8d9nN9rJnMxDZ4Q7
	 GxIN2Uogn0SrNkgJevRj4REeeAwdD4uSD4pEJ6wlCrLRoJQWuoz446IUX1SkZumm44
	 p4jl0rRMVewhC2/Ql/fYADM3Tbn4PwxIt0DRGqn1uBQjqJFbWYa/8fkkFadZD2zyHD
	 epi3Pvx68mqCMJq05tIFaqLjkOb8jDUFecEbcE415ikwUP70HVa4Ba5BmJwMxZjVRm
	 pFTTOVR3ShsaQ==
Received: by mail-wm1-f45.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so508531wme.1
        for <soc@kernel.org>; Wed, 01 Sep 2021 12:57:47 -0700 (PDT)
X-Gm-Message-State: AOAM530SNWkVTPHcTswfopYQ8fITP9Tz3EgIvL9qDkuKZt6J0FW7V/bz
	HmpQcJE8H6cR47bGkVe/fWBb+xY6d0R2WWU0YsQ=
X-Google-Smtp-Source: ABdhPJwyHD+T5rDe01ss30ZEGoNnEhiFxR1PptJ8zhSD4flEdqztm3Za1aocKDzljZMZUbZu+pLxxHrOTcjoa5Y7NNs=
X-Received: by 2002:a7b:c769:: with SMTP id x9mr1109933wmk.75.1630526266018;
 Wed, 01 Sep 2021 12:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
In-Reply-To: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 1 Sep 2021 19:57:29 +0000
X-Gmail-Original-Message-ID: <CAK8P3a0xs=kVKDMD4fyCh0tt+884=coomhjca72=2pWkG_daWQ@mail.gmail.com>
Message-ID: <CAK8P3a0xs=kVKDMD4fyCh0tt+884=coomhjca72=2pWkG_daWQ@mail.gmail.com>
Subject: [GIT PULL 2/4] ARM: SoC drivers for 5.15
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit c500bee1c5b2f1d59b1081ac879d73268ab0ff17=
:

  Linux 5.14-rc4 (2021-08-01 17:04:17 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.=
15

for you to fetch changes up to 06779631d18ff2901af604eadea0d7b2193db7a1:

  Merge tag 'reset-for-v5.15' of git://git.pengutronix.de/pza/linux
into arm/drivers (2021-08-26 11:29:06 +0200)

----------------------------------------------------------------
ARM: SoC drivers for 5.15

These are updates for drivers that are tied to a particular SoC,
including the correspondig device tree bindings:

 - A couple of reset controller changes for unisoc, uniphier, renesas
   and zte platforms

 - memory controller driver fixes for omap and tegra

 - Rockchip io domain driver updates

 - Lots of updates for qualcomm platforms, mostly touching their
   firmware and power management drivers

 - Tegra FUSE and firmware driver update=D1=95

 - Support for virtio transports in the SCMI firmware framework

 - cleanup of ixp4xx drivers, towards enabling multiplatform
   support and bringing it up to date with modern platforms

 - Minor updates for keystone, mediatek, omap, renesas.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Alex Elder (1):
      soc: qcom: mdt_loader: be more informative on errors

Arnd Bergmann (15):
      memory: tegra: fix unused-function warning
      Merge tag 'renesas-drivers-for-v5.15-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/drivers
      Merge tag 'ixp4xx-drivers-arm-soc-v5.15-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/drivers
      Merge tag 'omap-for-v5.15/ti-sysc-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/drivers
      Merge tag 'imx-ecspi-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/drivers
      Merge tag 'v5.14-next-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/drivers
      Merge tag 'memory-controller-drv-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'drivers_soc_for_5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone
into arm/drivers
      Merge tag 'scmi-updates-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/drivers
      Merge tag 'tegra-for-5.15-firmware' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/drivers
      Merge tag 'tegra-for-5.15-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/drivers
      Merge tag 'renesas-drivers-for-v5.15-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/drivers
      Merge tag 'qcom-drivers-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/drivers
      Merge tag 'v5.15-rockchip-driver1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/drivers
      Merge tag 'reset-for-v5.15' of
git://git.pengutronix.de/pza/linux into arm/drivers

Biju Das (2):
      dt-bindings: reset: Document RZ/G2L USBPHY Control bindings
      reset: renesas: Add RZ/G2L usbphy control driver

Bilal Wasim (2):
      soc: mediatek: pm-domains: Use correct mask for bus_prot_clr
      soc: mediatek: pm-domains: Add domain_supply cap for mfg_async PD

Bjorn Andersson (4):
      dt-bindings: soc: qcom: aoss: Add SC8180X and generic compatible
      dt-bindings: soc: qcom: aoss: Convert to YAML
      soc: qcom: aoss: Add generic compatible
      soc: qcom: rpmhpd: Use corner in power_off

CK Hu (1):
      soc: mmsys: mediatek: add mask to mmsys routes

Cai Huoqing (1):
      soc/tegra: bpmp: Remove unused including <linux/version.h>

Caleb Connolly (1):
      dt-bindings: qcom: geni-se: document iommus

Christoph Hellwig (1):
      firmware: tegra: Stop using seq_get_buf()

Cristian Marussi (10):
      firmware: arm_scmi: Add support for type handling in common functions
      firmware: arm_scmi: Remove scmi_dump_header_dbg() helper
      firmware: arm_scmi: Add optional transport_init/exit support
      firmware: arm_scmi: Introduce monotonically increasing tokens
      firmware: arm_scmi: Handle concurrent and out-of-order messages
      firmware: arm_scmi: Make .clear_channel optional
      firmware: arm_scmi: Make polling mode optional
      firmware: arm_scmi: Make SCMI transports configurable
      firmware: arm_scmi: Add priv parameter to scmi_rx_callback
      firmware: arm_scmi: Use WARN_ON() to check configured transports

Dan Carpenter (1):
      bus: ixp4xx: return on error in ixp4xx_exp_probe()

Dmitry Osipenko (4):
      soc/tegra: pmc: Prevent racing with cpuilde driver
      soc/tegra: fuse: Clear fuse->clk on driver probe failure
      soc/tegra: fuse: Add runtime PM support
      soc/tegra: fuse: Enable fuse clock on suspend for Tegra124

Douglas Anderson (1):
      PM: AVS: qcom-cpr: Use nvmem_cell_read_variable_le_u32()

Enric Balletbo i Serra (1):
      soc: mediatek: mmsys: Fix missing UFOE component in mt8173 table rout=
ing

Fabien Parent (1):
      soc: mediatek: mmsys: add MT8365 support

Geert Uytterhoeven (2):
      soc: rockchip: ROCKCHIP_GRF should not default to y, unconditionally
      soc: renesas: Identify R-Car H3e-2G and M3e-2G

Igor Skalkin (4):
      firmware: arm_scmi: Make shmem support optional for transports
      firmware: arm_scmi: Add method to override max message number
      dt-bindings: arm: Add virtio transport for SCMI
      firmware: arm_scmi: Add virtio transport

Iskren Chernev (4):
      dt-bindings: soc: qcom: smd-rpm: Add SM6115 compatible
      dt-bindings: power: rpmpd: Add SM6115 to rpmpd binding
      drivers: soc: qcom: rpmpd: Add SM6115 RPM Power Domains
      soc: qcom: smd-rpm: Add SM6115 compatible

Jianqun Xu (1):
      soc: rockchip: io-domain: add rk3568 support

Jiapeng Chong (1):
      soc: rockchip: io-domain: Remove unneeded semicolon

Johan Jonker (2):
      dt-bindings: power: convert rockchip-io-domain.txt to YAML
      dt-bindings: soc: rockchip: add rockchip-io-domain.yaml object to grf=
.yaml

John Stultz (1):
      firmware: qcom_scm: Allow qcom_scm driver to be loadable as a
permenent module

Junlin Yang (1):
      firmware: qcom_scm: remove a duplicative condition

Krzysztof Kozlowski (2):
      Merge branch 'for-v5.15/tegra-mc' into for-next
      Merge branch 'for-v5.15/omap-gpmc' into for-next

Kunihiko Hayashi (1):
      dt-bindings: reset: Convert UniPhier glue reset to json-schema

Lee Jones (1):
      bus: ti-sysc: Correct misdocumentation of 'sysc_ioremap()'

Len Baker (1):
      soc: renesas: Prefer memcpy() over strcpy()

Linus Walleij (8):
      bus: ixp4xx: Add DT bindings for the IXP4xx expansion bus
      bus: ixp4xx: Add a driver for IXP4xx expansion bus
      watchdog: ixp4xx: Rewrite driver to use core
      pata: ixp4xx: Use local dev variable
      pata: ixp4xx: Use IS_ENABLED() to determine endianness
      pata: ixp4xx: Refer to cmd and ctl rather than csN
      pata: ixp4xx: Add DT bindings
      pata: ixp4xx: Rewrite to use device tree

Manivannan Sadhasivam (1):
      soc: qcom: aoss: Fix the out of bound usage of cooling_devs

Mauro Carvalho Chehab (1):
      MAINTAINERS: update arm,pl353-smc.yaml reference

Michael Riesch (1):
      dt-bindings: power: add rk3568-pmu-io-domain support

Peter Hilber (2):
      firmware: arm_scmi: Add message passing abstractions for transports
      firmware: arm_scmi: Add optional link_supplier() transport op

Peter Robinson (1):
      reset: simple: remove ZTE details in Kconfig help

Peter Ujfalusi (1):
      bus: ti-sysc: Add quirk for OMAP4 McASP to disable SIDLE mode

Rishabh Bhatnagar (1):
      firmware: arm_scmi: Free mailbox channels if probe fails

Robin Gong (12):
      Revert "ARM: dts: imx6q: Use correct SDMA script for SPI5 core"
      Revert "ARM: dts: imx6: Use correct SDMA script for SPI cores"
      Revert "dmaengine: imx-sdma: refine to load context only once"
      dmaengine: imx-sdma: remove duplicated sdma_load_context
      dmaengine: dma: imx-sdma: add fw_loaded and is_ram_script
      dmaengine: imx-sdma: add mcu_2_ecspi script
      spi: imx: fix ERR009165
      spi: imx: remove ERR009165 workaround on i.mx6ul
      dmaengine: imx-sdma: remove ERR009165 on i.mx6ul
      dma: imx-sdma: add i.mx6ul compatible name
      dmaengine: imx-sdma: add uart rom script
      dmaengine: imx-sdma: add terminated list for freed descriptor in work=
er

Sibi Sankar (3):
      dt-bindings: reset: aoss: Add AOSS reset controller binding
      dt-bindings: reset: pdc: Add PDC Global bindings
      reset: qcom: Add PDC Global reset signals for WPSS

Stephan Gerhold (2):
      soc: qcom: smsm: Implement support for get_irqchip_state
      soc: qcom: smsm: Fix missed interrupts if state changes while masked

Stephen Boyd (2):
      firmware: qcom_scm: Mark string array const
      soc: qcom: socinfo: Don't print anything if nothing found

Suman Anna (3):
      dt-bindings: soc: ti: pruss: Update bindings for K3 AM64x SoCs
      soc: ti: pruss: Enable support for ICSSG subsystems on K3 AM64x SoCs
      dt-bindings: soc: ti: pruss: Add dma-coherent property

Tony Lindgren (4):
      Merge branch 'omap-for-v5.14/ti-sysc' into omap-for-v5.15/ti-sysc
      memory: omap-gpmc: Clear GPMC_CS_CONFIG7 register on restore if unuse=
d
      memory: omap-gpmc: Drop custom PM calls with cpu_pm notifier
      soc: ti: Remove pm_runtime_irq_safe() usage for smartreflex

Vinod Koul (2):
      soc: qcom: geni: move GENI_IF_DISABLE_RO to common header
      soc: qcom: geni: Add support for gpi dma

Zhang Qilong (1):
      bus: ti-sysc: using pm_runtime_resume_and_get instead of
pm_runtime_get_sync

kernel test robot (1):
      firmware: arm_scmi: Fix boolconv.cocci warnings

 .../bindings/ata/intel,ixp4xx-compact-flash.yaml   |  61 ++
 .../bus/intel,ixp4xx-expansion-bus-controller.yaml | 168 +++++
 .../devicetree/bindings/dma/fsl-imx-sdma.txt       |   1 +
 .../devicetree/bindings/firmware/arm,scmi.yaml     |   8 +-
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 .../bindings/power/rockchip-io-domain.txt          | 135 ----
 .../bindings/power/rockchip-io-domain.yaml         | 360 +++++++++++
 .../devicetree/bindings/reset/qcom,aoss-reset.yaml |   5 +
 .../devicetree/bindings/reset/qcom,pdc-global.yaml |   4 +
 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml  |  65 ++
 .../reset/socionext,uniphier-glue-reset.yaml       |  88 +++
 .../devicetree/bindings/reset/uniphier-reset.txt   |  61 --
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |  87 ---
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           | 114 ++++
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |   3 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |   1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  19 +-
 .../devicetree/bindings/soc/ti/ti,pruss.yaml       |  41 +-
 MAINTAINERS                                        |   5 +-
 arch/arm/boot/dts/imx6q.dtsi                       |   2 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     |   8 +-
 arch/arm/mach-omap2/pm34xx.c                       |   5 -
 arch/arm/mach-tegra/pm.c                           |   2 +-
 arch/arm/mach-tegra/pm.h                           |   6 -
 arch/arm/mach-tegra/tegra.c                        |   2 -
 drivers/ata/pata_ixp4xx_cf.c                       | 264 +++++---
 drivers/bus/Kconfig                                |  11 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/intel-ixp4xx-eb.c                      | 429 +++++++++++++
 drivers/bus/ti-sysc.c                              |  37 +-
 drivers/clocksource/timer-ixp4xx.c                 |  48 +-
 drivers/dma/imx-sdma.c                             |  93 ++-
 drivers/firmware/Kconfig                           |  36 +-
 drivers/firmware/Makefile                          |   3 +-
 drivers/firmware/arm_scmi/Kconfig                  |  95 +++
 drivers/firmware/arm_scmi/Makefile                 |   8 +-
 drivers/firmware/arm_scmi/common.h                 | 113 +++-
 drivers/firmware/arm_scmi/driver.c                 | 686 +++++++++++++++++=
----
 drivers/firmware/arm_scmi/mailbox.c                |   2 +-
 drivers/firmware/arm_scmi/msg.c                    | 111 ++++
 drivers/firmware/arm_scmi/smc.c                    |   3 +-
 drivers/firmware/arm_scmi/virtio.c                 | 491 +++++++++++++++
 drivers/firmware/qcom_scm.c                        |   8 +-
 drivers/firmware/tegra/bpmp-debugfs.c              |  58 +-
 drivers/iommu/Kconfig                              |   2 +
 drivers/memory/omap-gpmc.c                         | 191 +++---
 drivers/memory/tegra/tegra186.c                    |   2 +
 drivers/net/wireless/ath/ath10k/Kconfig            |   1 +
 drivers/reset/Kconfig                              |   8 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-qcom-pdc.c                     |  62 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            | 175 ++++++
 drivers/soc/mediatek/mt8173-pm-domains.h           |   1 +
 drivers/soc/mediatek/mt8183-mmsys.h                |  21 +-
 drivers/soc/mediatek/mt8365-mmsys.h                |  60 ++
 drivers/soc/mediatek/mtk-mmsys.c                   |  18 +-
 drivers/soc/mediatek/mtk-mmsys.h                   | 137 ++--
 drivers/soc/mediatek/mtk-pm-domains.h              |   2 +-
 drivers/soc/qcom/cpr.c                             |  43 +-
 drivers/soc/qcom/mdt_loader.c                      |  18 +-
 drivers/soc/qcom/qcom-geni-se.c                    |  30 +-
 drivers/soc/qcom/qcom_aoss.c                       |   9 +-
 drivers/soc/qcom/rpmhpd.c                          |   5 +-
 drivers/soc/qcom/rpmpd.c                           |  28 +
 drivers/soc/qcom/smd-rpm.c                         |   1 +
 drivers/soc/qcom/smsm.c                            |  28 +-
 drivers/soc/qcom/socinfo.c                         |   4 +-
 drivers/soc/renesas/Kconfig                        |   2 +
 drivers/soc/renesas/r8a779a0-sysc.c                |   6 +-
 drivers/soc/renesas/rcar-sysc.c                    |   6 +-
 drivers/soc/renesas/renesas-soc.c                  |   4 +
 drivers/soc/rockchip/Kconfig                       |   4 +-
 drivers/soc/rockchip/io-domain.c                   |  88 ++-
 drivers/soc/tegra/fuse/fuse-tegra.c                |  60 ++
 drivers/soc/tegra/fuse/fuse-tegra20.c              |  11 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c              |  16 +-
 drivers/soc/tegra/fuse/fuse.h                      |   2 +
 drivers/soc/tegra/pmc.c                            |  14 +-
 drivers/soc/tegra/powergate-bpmp.c                 |   1 -
 drivers/soc/ti/pruss.c                             |   1 +
 drivers/soc/ti/smartreflex.c                       |  52 +-
 drivers/spi/spi-imx.c                              |  41 +-
 drivers/watchdog/Kconfig                           |   1 +
 drivers/watchdog/ixp4xx_wdt.c                      | 283 ++++-----
 include/dt-bindings/power/qcom-rpmpd.h             |  10 +
 include/dt-bindings/reset/qcom,sdm845-pdc.h        |   2 +
 include/linux/omap-gpmc.h                          |   3 -
 include/linux/platform_data/pata_ixp4xx_cf.h       |   4 +-
 include/linux/power/smartreflex.h                  |   2 +
 include/linux/qcom-geni-se.h                       |  19 +-
 include/soc/tegra/pm.h                             |   6 +
 include/uapi/linux/virtio_ids.h                    |   1 +
 include/uapi/linux/virtio_scmi.h                   |  24 +
 93 files changed, 4220 insertions(+), 1039 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml
 create mode 100644
Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller=
.yaml
 delete mode 100644
Documentation/devicetree/bindings/power/rockchip-io-domain.txt
 create mode 100644
Documentation/devicetree/bindings/power/rockchip-io-domain.yaml
 create mode 100644
Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/reset/socionext,uniphier-glue-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/uniphier-reset.=
txt
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qm=
p.txt
 create mode 100644
Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
 create mode 100644 drivers/bus/intel-ixp4xx-eb.c
 create mode 100644 drivers/firmware/arm_scmi/Kconfig
 create mode 100644 drivers/firmware/arm_scmi/msg.c
 create mode 100644 drivers/firmware/arm_scmi/virtio.c
 create mode 100644 drivers/reset/reset-rzg2l-usbphy-ctrl.c
 create mode 100644 drivers/soc/mediatek/mt8365-mmsys.h
 create mode 100644 include/uapi/linux/virtio_scmi.h
