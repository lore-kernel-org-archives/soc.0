Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1353C433EF
	for <soc@archiver.kernel.org>; Wed, 23 Mar 2022 23:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70B34C36AE7; Wed, 23 Mar 2022 23:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B871C36AE2
	for <soc@kernel.org>; Wed, 23 Mar 2022 23:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648076963;
	bh=r/A5U8oPryUJLqqlWG3YWZFHPOMc7MEUxZQ0xPbZeRk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZY7fWoft5nQXSVD4rRAfjbL37BzGdg9d4If72i1rfDabWrIl6yAQYkKDd9AHgMKNV
	 sMSgeqD1DApH7Rske18p7n7g90piO06YbrSl29g6nlKD9XYK/NNKnFR0BTzJ+xAvGp
	 rFlGrDtw7Lm39u+nGasbrCmenqAD9baa8UWuVYVb/yya8KqAXVsHIQsLPSHaeL/NIz
	 PNoXIqamBooV5kBanbaYjsWCbYTcp7C9HBhM4lE84tKa+FMcA7tGes2rCUfV91Ep0I
	 Gpo+y11UQLEuqX4kJgP795yczkeoYINTnZNVwWHldjPw6pkum1pwX4KulbCQyPjEk6
	 3c+Cw1zcFvQyw==
Received: by mail-wm1-f41.google.com with SMTP id r64so1791256wmr.4
        for <soc@kernel.org>; Wed, 23 Mar 2022 16:09:23 -0700 (PDT)
X-Gm-Message-State: AOAM532KoKrfMUHSSvkAfTe415gLkCmNLyfOaqLoZtkGa3ulRg0n3AuK
	qBTQDSva4460aVM1LW4d2TVlCiJg7/TRnIzx3pQ=
X-Google-Smtp-Source: ABdhPJx1yHt60EEAiM3xKZH+imjVrJx5IhU4I32tIfEwmTyWAlZnWKdgwJDyQMPRUdJv5LkH8EvanD8UeVRWVMFEZbE=
X-Received: by 2002:a7b:cd13:0:b0:38b:f39c:1181 with SMTP id
 f19-20020a7bcd13000000b0038bf39c1181mr2261800wmj.20.1648076961593; Wed, 23
 Mar 2022 16:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
 <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com>
In-Reply-To: <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 24 Mar 2022 00:09:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3_ykZD8sRQc=y_bfViDxmakXFpgWNL3bAz0Y6bHsV1wQ@mail.gmail.com>
Message-ID: <CAK8P3a3_ykZD8sRQc=y_bfViDxmakXFpgWNL3bAz0Y6bHsV1wQ@mail.gmail.com>
Subject: [GIT PULL 2/4] ARM: SoC updates for 5.18
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566=
:

  Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.=
18

for you to fetch changes up to 2f618d5ef5dd05e2380ee627814de90d5a33c3f2:

  ARM: remove support for NOMMU ARMv4/v5 (2022-03-17 09:13:13 +0100)

----------------------------------------------------------------
ARM: SoC updates for 5.18

SoC specific code is generally used for older platforms that don't (yet)
use device tree to do the same things.

 - Support is added for i.MXRT10xx, a Cortex-M7 based microcontroller
   from NXP. At the moment this is still incomplete as other portions
   are merged through different trees.

 - Long abandoned support for running NOMMU ARMv4 or ARMv5 platforms
   gets removed, now the Arm NOMMU platforms are limited to the
   Cortex-M family of microcontrollers

 - Two old PXA boards get removed, along with corresponding driver
   bits.

 - Continued cleanup of the Intel IXP4xx platforms, removing some
   remnants of the old board files.

 - Minor Cleanups and fixes for Orion, PXA, MMP, Mstar, Samsung

 - CPU idle support for AT91

 - A system controller driver for Polarfire

----------------------------------------------------------------
Andy Shevchenko (1):
      ARM: orion/gpio: Get rid of unused first parameter in orion_gpio_init=
()

Arnd Bergmann (7):
      Merge tag 'ixp4xx-cleanup-for-v5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/soc
      Merge tag 'imx-soc-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/soc
      Merge tag 'at91-soc-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/soc
      Merge tag 'samsung-soc-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/soc
      ARM: PXA: fix up decompressor code
      Merge tag 'mvebu-arm-5.18-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/soc
      ARM: remove support for NOMMU ARMv4/v5

Claudiu Beznea (5):
      ARM: at91: ddr: remove CONFIG_SOC_SAMA7 dependency
      ARM: at91: ddr: align macro definitions
      ARM: at91: ddr: fix typo to align with datasheet naming
      ARM: at91: PM: add cpu idle support for sama7g5
      ARM: at91: Kconfig: select PM_OPP

Conor Dooley (2):
      soc: add microchip polarfire soc system controller
      soc: microchip: make mpfs_sys_controller_put static

Daniel Palmer (1):
      ARM: mstar: Select ARM_ERRATA_814220

Giulio Benetti (1):
      ARM: imx: Add initial support for i.MXRT10xx family

Henrik Grimler (1):
      ARM: exynos: only do SMC_CMD_CPU1BOOT call on Exynos4

Jonathan Cameron (1):
      ARM: pxa: remove Intel Imote2 and Stargate 2 boards

Krzysztof Kozlowski (1):
      dt-bindings: soc: samsung: usi: refer to dtschema for children

Linus Walleij (12):
      ARM: ixp4xx: Delete the Goramo MLR boardfile
      ARM: ixp4xx: Delete old PCI driver
      ARM: ixp4xx: Drop stale Kconfig entry
      ARM: ixp4xx: Drop UDC info setting function
      soc: ixp4xx: Add features from regmap helper
      soc: ixp4xx-npe: Access syscon regs using regmap
      net: ixp4xx_eth: Drop platform data support
      net: ixp4xx_hss: Check features using syscon
      ARM: ixp4xx: Remove feature bit accessors
      ARM: ixp4xx: Drop custom DMA coherency and bouncing
      ARM: ixp4xx: Drop all common code
      ARM: ixp4xx: Convert to SPARSE_IRQ and P2V

Uwe Kleine-K=C3=B6nig (1):
      ARM: mmp: Fix failure to remove sram device

Zoltan HERPAI (1):
      ARM: ixp4xx: Delete Gateway 7001 boardfiles

 .../bindings/soc/samsung/exynos-usi.yaml           |   20 +-
 MAINTAINERS                                        |    7 -
 arch/arm/Kconfig                                   |   45 +-
 arch/arm/configs/pxa_defconfig                     |    3 -
 arch/arm/mach-at91/Kconfig                         |    1 +
 arch/arm/mach-at91/pm.c                            |   27 +-
 arch/arm/mach-at91/pm_suspend.S                    |    4 +-
 arch/arm/mach-bcm/Kconfig                          |    1 -
 arch/arm/mach-dove/irq.c                           |    6 +-
 arch/arm/mach-exynos/firmware.c                    |    4 +-
 arch/arm/mach-footbridge/include/mach/hardware.h   |   20 +-
 arch/arm/mach-footbridge/include/mach/io.h         |   20 -
 arch/arm/mach-imx/Kconfig                          |    7 +
 arch/arm/mach-imx/Makefile                         |    2 +
 arch/arm/mach-imx/mach-imxrt.c                     |   19 +
 arch/arm/mach-integrator/Kconfig                   |   37 +-
 arch/arm/mach-integrator/hardware.h                |    5 -
 arch/arm/mach-ixp4xx/Kconfig                       |   57 --
 arch/arm/mach-ixp4xx/Makefile                      |   19 +-
 arch/arm/mach-ixp4xx/common-pci.c                  |  451 ---------
 arch/arm/mach-ixp4xx/common.c                      |  448 ---------
 arch/arm/mach-ixp4xx/gateway7001-pci.c             |   61 --
 arch/arm/mach-ixp4xx/gateway7001-setup.c           |  113 ---
 arch/arm/mach-ixp4xx/goramo_mlr.c                  |  532 ----------
 arch/arm/mach-ixp4xx/include/mach/hardware.h       |   32 -
 arch/arm/mach-ixp4xx/include/mach/io.h             |  545 -----------
 arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h    |  303 ------
 arch/arm/mach-ixp4xx/include/mach/platform.h       |  102 --
 arch/arm/mach-ixp4xx/include/mach/udc.h            |    8 -
 arch/arm/mach-ixp4xx/include/mach/uncompress.h     |    4 +-
 arch/arm/mach-ixp4xx/irqs.h                        |   64 --
 arch/arm/mach-mmp/sram.c                           |   22 +-
 arch/arm/mach-mstar/Kconfig                        |    1 +
 arch/arm/mach-mv78xx0/irq.c                        |    3 +-
 arch/arm/mach-nspire/Kconfig                       |    1 -
 arch/arm/mach-orion5x/Kconfig                      |    2 +-
 arch/arm/mach-orion5x/irq.c                        |    2 +-
 arch/arm/mach-pxa/Kconfig                          |   10 -
 arch/arm/mach-pxa/Makefile                         |    2 -
 arch/arm/mach-pxa/include/mach/uncompress.h        |    5 +-
 arch/arm/mach-pxa/stargate2.c                      | 1030 ----------------=
----
 arch/arm/mach-shmobile/Kconfig                     |    2 +-
 arch/arm/mach-ux500/Kconfig                        |    2 +-
 arch/arm/plat-orion/gpio.c                         |    8 +-
 arch/arm/plat-orion/include/plat/orion-gpio.h      |    3 +-
 drivers/crypto/ixp4xx_crypto.c                     |    1 -
 drivers/net/ethernet/xscale/Kconfig                |    4 +-
 drivers/net/ethernet/xscale/ixp4xx_eth.c           |   85 +-
 drivers/net/ethernet/xscale/ptp_ixp46x.c           |    1 -
 drivers/net/wan/Kconfig                            |    3 +-
 drivers/net/wan/ixp4xx_hss.c                       |   39 +-
 drivers/pcmcia/Kconfig                             |    2 +-
 drivers/pcmcia/Makefile                            |    1 -
 drivers/pcmcia/pxa2xx_stargate2.c                  |  137 ---
 drivers/soc/Kconfig                                |    1 +
 drivers/soc/Makefile                               |    1 +
 drivers/soc/ixp4xx/Kconfig                         |    1 +
 drivers/soc/ixp4xx/ixp4xx-npe.c                    |   33 +-
 drivers/soc/microchip/Kconfig                      |   10 +
 drivers/soc/microchip/Makefile                     |    1 +
 drivers/soc/microchip/mpfs-sys-controller.c        |  193 ++++
 include/linux/clk/at91_pmc.h                       |    4 +
 include/linux/platform_data/eth_ixp4xx.h           |   21 -
 include/linux/platform_data/wan_ixp4xx_hss.h       |   17 -
 include/linux/soc/ixp4xx/cpu.h                     |   26 +-
 include/linux/soc/ixp4xx/npe.h                     |    2 +
 include/soc/at91/sama7-ddr.h                       |   15 +-
 include/soc/microchip/mpfs.h                       |    4 +-
 kernel/dma/mapping.c                               |    2 -
 sound/soc/pxa/Kconfig                              |    9 -
 sound/soc/pxa/Makefile                             |    2 -
 sound/soc/pxa/imote2.c                             |   99 --
 72 files changed, 435 insertions(+), 4339 deletions(-)
 delete mode 100644 arch/arm/mach-footbridge/include/mach/io.h
 create mode 100644 arch/arm/mach-imx/mach-imxrt.c
 delete mode 100644 arch/arm/mach-ixp4xx/common-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/common.c
 delete mode 100644 arch/arm/mach-ixp4xx/gateway7001-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/gateway7001-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/goramo_mlr.c
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/hardware.h
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/io.h
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/platform.h
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/udc.h
 delete mode 100644 arch/arm/mach-ixp4xx/irqs.h
 delete mode 100644 arch/arm/mach-pxa/stargate2.c
 delete mode 100644 drivers/pcmcia/pxa2xx_stargate2.c
 create mode 100644 drivers/soc/microchip/Kconfig
 create mode 100644 drivers/soc/microchip/Makefile
 create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c
 delete mode 100644 include/linux/platform_data/eth_ixp4xx.h
 delete mode 100644 include/linux/platform_data/wan_ixp4xx_hss.h
 delete mode 100644 sound/soc/pxa/imote2.c
