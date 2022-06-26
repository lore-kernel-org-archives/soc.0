Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D896CC43334
	for <soc@archiver.kernel.org>; Sun, 26 Jun 2022 20:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B10EC341CD; Sun, 26 Jun 2022 20:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863AAC341CC
	for <soc@kernel.org>; Sun, 26 Jun 2022 20:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656277181;
	bh=CZjrKVfPY/7nkbpxPbFAPK16kKhcMcQeR0evrITbRAI=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=q/7nIjayRISmFXThikQ65hMuj4BczSNkosrFFK5gIWqCnBPp9bcL7plQ4mAjT6al4
	 3wVSvReEmLQH0V6+BXoNmvBPYt/IV+SfnkFdeWQw8dtmQqWC8YZfEZ/nbGeFdSSB7M
	 Mih0re/OpVoGDRVEyKlbCyXXHE3e4zwteSKjtcXHLoCk9G96uBuJKohS3QfKUiSw7n
	 E4bc4ZrV/H3pDCGDnekbVxEYFhDnnaw6MhEJcdLbZNzBFar05jSTXKLVuAGx6gxwKy
	 Pgzo9gA7Uxwh/5u0Hc85fECUJHdV1KfadohXbpsNp/uxYoQKo5UHxd3C+XDzxex5Er
	 rU0+1jt2ikhxQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-317741c86fdso68562697b3.2
        for <soc@kernel.org>; Sun, 26 Jun 2022 13:59:41 -0700 (PDT)
X-Gm-Message-State: AJIora9/b7aI1qRRFuem+08vfhxcfqbXvXNhydm9yMiQdiIyqxHmMCt8
	yj2TqXII6ooJJGKTneOcYqk5T9PMugtfqWJG3Rg=
X-Google-Smtp-Source: AGRyM1sPcmPQ057/Pn98Vj5uvRCc6cNfZWnjJOwWJiw8cMZn8m6/TtMxXZUbeJHOwijUSIAQcgS46fy/vslzmwc3Lgo=
X-Received: by 2002:a81:c08:0:b0:317:8131:2b21 with SMTP id
 8-20020a810c08000000b0031781312b21mr11584939ywm.249.1656277180531; Sun, 26
 Jun 2022 13:59:40 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 26 Jun 2022 22:59:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0htht-S_P-CpvvO+2Nbjp_ofUbchV8MWXrO09rnzRdjA@mail.gmail.com>
Message-ID: <CAK8P3a0htht-S_P-CpvvO+2Nbjp_ofUbchV8MWXrO09rnzRdjA@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.19
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3=
:

  Linux 5.19-rc2 (2022-06-12 16:11:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-=
5.19

for you to fetch changes up to 7f058112873e86ca760f2d2b0e1ccc2ab111f418:

  ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom (2022-06-24
17:57:13 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 5.19

A number of fixes have accumulated, but they are largely for
harmless issues:

 - Several OF node leak fixes

 - A fix to the Exynos7885 UART clock description

 - DTS fixes to prevent boot failures on TI AM64 and J721s2

 - Bus probe error handling fixes for Baikal-T1

 - A fixup to the way STM32 SoCs use separate dts files for
   different firmware stacks

 - Multiple code fixes for Arm SCMI firmware, all dealing with
   robustness of the implementation

 - Multiple NXP i.MX devicetree fixes, addressing incorrect
   data in DT nodes

 - Three updates to the MAINTAINERS file, including Florian
   Fainelli taking over BCM283x/BCM2711 (Raspberry Pi)
   from Nicolas Saenz Julienne

----------------------------------------------------------------
Alexander Stein (2):
      ARM: dts: imx7: Move hsic_phy power domain to HSIC PHY node
      soc: imx: imx8m-blk-ctrl: fix display clock for LCDIF2 power domain

Alexandre Torgue (1):
      ARM: dts: stm32: move SCMI related nodes in a dedicated file for stm3=
2mp15

Arnd Bergmann (9):
      Merge tag 'imx-fixes-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge tag 'scmi-fixes-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 's32g2-fixes-5.19' of
https://github.com/chesterlintw/linux-s32g into arm/fixes
      Merge tag 'arm-soc/for-5.19/drivers-fixes' of
https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'arm-soc/for-5.19/maintainers-fixes' of
https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'ti-k3-dt-fixes-for-v5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/fixes
      Merge tag 'arm-soc/for-5.19/devicetree-fixes' of
https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'samsung-fixes-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into
arm/fixes
      Merge tag 'memory-controller-drv-fixes-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/fixes

Aswath Govindraju (1):
      arm64: dts: ti: k3-am64-main: Remove support for HS400 speed mode

Chester Lin (1):
      MAINTAINERS: add a new reviewer for S32G

Cristian Marussi (4):
      firmware: arm_scmi: Relax base protocol sanity checks on the protocol=
 list
      firmware: arm_scmi: Remove all the unused local variables
      firmware: arm_scmi: Fix SENSOR_AXIS_NAME_GET behaviour when unsupport=
ed
      firmware: arm_scmi: Avoid using extended string-buffers sizes if
not necessary

David Virag (1):
      arm64: dts: exynos: Correct UART clocks on Exynos7885

Fabio Estevam (1):
      arm64: s32g2: Pass unit name to soc node

Geert Uytterhoeven (1):
      memory: omap-gpmc: OMAP_GPMC should depend on ARCH_OMAP2PLUS ||
ARCH_KEYSTONE || ARCH_K3

Jae Hyun Yoo (1):
      ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom

Liang He (1):
      arm: mach-spear: Add missing of_node_put() in time.c

Lucas Stach (1):
      ARM: dts: imx6qdl: correct PU regulator ramp delay

Ludvig P=C3=A4rsson (1):
      firmware: arm_scmi: Fix incorrect error propagation in
scmi_voltage_descriptors_get

Matt Ranostay (1):
      arm64: dts: ti: k3-j721s2: Fix overlapping GICD memory region

Max Krummenacher (1):
      ARM: dts: imx6qdl-colibri: Fix capacitive touch reset polarity

Miaoqian Lin (6):
      ARM: exynos: Fix refcount leak in exynos_map_pmu
      memory: mtk-smi: add missing put_device() call in
mtk_smi_device_link_common
      memory: samsung: exynos5422-dmc: Fix refcount leak in of_get_dram_tim=
ings
      soc: bcm: brcmstb: pm: pm-arm: Fix refcount leak in brcmstb_pm_probe
      ARM: Fix refcount leak in axxia_boot_secondary
      ARM: cns3xxx: Fix refcount leak in cns3xxx_init

Nicolas Saenz Julienne (1):
      MAINTAINERS: Update BCM2711/BCM2835 maintainer

Serge Semin (2):
      bus: bt1-apb: Don't print error on -EPROBE_DEFER
      bus: bt1-axi: Don't print error on -EPROBE_DEFER

Stefan Wahren (1):
      ARM: dts: bcm2711-rpi-400: Fix GPIO line names

Thara Gopinath (1):
      MAINTAINERS: Update email address

 MAINTAINERS                                        |  9 +--
 arch/arm/boot/dts/Makefile                         |  2 +-
 ...ia-dc-scm.dts =3D> aspeed-bmc-qcom-dc-scm-v1.dts} |  4 +-
 arch/arm/boot/dts/bcm2711-rpi-400.dts              |  6 +-
 arch/arm/boot/dts/imx6qdl-colibri.dtsi             |  2 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     |  2 +-
 arch/arm/boot/dts/imx7s.dtsi                       |  2 +-
 arch/arm/boot/dts/stm32mp15-scmi.dtsi              | 47 +++++++++++++++
 arch/arm/boot/dts/stm32mp151.dtsi                  | 41 -------------
 arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts         | 13 +----
 arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts         | 13 +----
 arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts         | 13 +----
 arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts         | 13 +----
 arch/arm/mach-axxia/platsmp.c                      |  1 +
 arch/arm/mach-cns3xxx/core.c                       |  2 +
 arch/arm/mach-exynos/exynos.c                      |  1 +
 arch/arm/mach-spear/time.c                         |  8 ++-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         | 12 ++--
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |  2 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |  2 -
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |  2 +-
 drivers/bus/bt1-apb.c                              | 14 ++---
 drivers/bus/bt1-axi.c                              | 14 ++---
 drivers/firmware/arm_scmi/base.c                   | 24 +++++---
 drivers/firmware/arm_scmi/clock.c                  |  7 +--
 drivers/firmware/arm_scmi/perf.c                   |  6 +-
 drivers/firmware/arm_scmi/power.c                  |  2 +-
 drivers/firmware/arm_scmi/protocols.h              |  2 -
 drivers/firmware/arm_scmi/reset.c                  |  2 +-
 drivers/firmware/arm_scmi/sensors.c                | 68 +++++++++++++++++-=
----
 drivers/firmware/arm_scmi/voltage.c                | 15 ++---
 drivers/memory/Kconfig                             |  1 +
 drivers/memory/mtk-smi.c                           |  5 +-
 drivers/memory/samsung/exynos5422-dmc.c            | 29 +++++----
 drivers/soc/bcm/brcmstb/pm/pm-arm.c                |  1 +
 drivers/soc/imx/imx8m-blk-ctrl.c                   |  2 +-
 include/linux/scmi_protocol.h                      |  9 +--
 37 files changed, 205 insertions(+), 193 deletions(-)
 rename arch/arm/boot/dts/{aspeed-bmc-nuvia-dc-scm.dts =3D>
aspeed-bmc-qcom-dc-scm-v1.dts} (97%)
 create mode 100644 arch/arm/boot/dts/stm32mp15-scmi.dtsi
