Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D81C433EF
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40416C34118; Thu, 26 May 2022 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7C4C34116
	for <soc@kernel.org>; Thu, 26 May 2022 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653576707;
	bh=lrMPgsY27MbmBf4Le35hR11wLuufqci4SLHnkpkoQW8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NtcxE3ZkZgY5qXUBL4BT9ARqqoXugJ8xVtWXCySNrHIwuFEYvEm2TWgOFkQKGvrgc
	 cLkwW9bg01kdPCZA8e7N2Vi9d2sLsxJXZ2soTm0gXj9cfaTh9srFEZH5U4zLSlXfN+
	 safBeHARwgxErt5pE/NIbDifcQmHHCwOyMQewxapZEDd9i4uXvU6FgbN7ehPn14Vg9
	 WGlOhDPBdPKfoNJOjQeV0rCDlwBFHN6OhkrmNI46Nrh4V1dgXRTHlPFEwKvCsCTObv
	 z0NG/jR6VEb8qKwLAjkKeoJOdNXBC/WmyLE+2ywDxix/qwDhnEI9e6ERf46XhWpG+B
	 6I9FlqQYmnbtA==
Received: by mail-yb1-f182.google.com with SMTP id i11so3253047ybq.9
        for <soc@kernel.org>; Thu, 26 May 2022 07:51:47 -0700 (PDT)
X-Gm-Message-State: AOAM531los9lz6zKJ+8j0O4BtR04FToy5/a8ExvOFvEsQw8tTjKbCEw7
	93eB+lp6+/lyoBd+5EfTOVCTe4BBsOQmHR11ipw=
X-Google-Smtp-Source: ABdhPJxV14PlmNq1jDHpu4MXrN8XidsfOuvfa6KRiCreNvmselv3rg9kDqTXR+rKOH36ysZIcinhALaqjXcBiSp02wQ=
X-Received: by 2002:a25:4f0a:0:b0:64f:6a76:3d8f with SMTP id
 d10-20020a254f0a000000b0064f6a763d8fmr26713797ybb.134.1653576706007; Thu, 26
 May 2022 07:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
In-Reply-To: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 26 May 2022 16:51:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3gqQbZG5gdh_cRmGx8B6XR8CGYcXN7wMu-YmCBwD1wGQ@mail.gmail.com>
Message-ID: <CAK8P3a3gqQbZG5gdh_cRmGx8B6XR8CGYcXN7wMu-YmCBwD1wGQ@mail.gmail.com>
Subject: [GIT PULL 5/5] ARM: ARMv4T/v5 multiplatform support for v5.19, part 1
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-multiplatform-5.19-1

for you to fetch changes up to 1a23accae82d780b5d5de6254d32c270aeb7f664:

  ARM: ixp4xx: Consolidate Kconfig fixing issue (2022-05-25 15:54:11 +0200)

----------------------------------------------------------------
ARM: ARMv4T/v5 multiplatform support for v5.19, part 1

This series has been 12 years in the making, it mostly finishes the
work that was started with the founding of Linaro to clean up platform
support in the kernel.

The largest change here is a cleanup of the omap1 platform, which
is the final ARM machine type to get converted to the common-clk
subsystem. All the omap1 specific drivers are now made independent of the
mach/*.h headers to allow the platform to be part of a generic ARMv4/v5
multiplatform kernel. The last bit that enables this support is still
missing here while we wait for some last dependencies to make it into
the mainline kernel through other subsystems.

The s3c24xx, ixp4xx, iop32x, ep93xx and dove platforms were all almost
at the point of allowing multiplatform kernels, this work gets completed
here along with a few additional cleanup.  At the same time, the s3c24xx
and s3c64xx are now deprecated and expected to get removed in the future.

The PXA and OMAP1 bits are in a separate branch because of dependencies.
Once both branches are merged, only the three Intel StrongARM platforms
(RiscPC, Footbridge/NetWinder and StrongARM1100) need separate kernels,
and there are no plans to include these.

----------------------------------------------------------------
Arnd Bergmann (50):
      ARM: versatile: move integrator/realview/vexpress to versatile
      ARM: ep93xx: renumber interrupts
      ARM: ep93xx: enable SPARSE_IRQ
      ARM: ep93xx: make mach/ep93xx-regs.h local
      ARM: ep93xx: multiplatform support
      ARM: dove: multiplatform support
      ARM: s3c24xx: remove support for ISA drivers on BAST PC/104
      ARM: s3c24xx: convert to sparse-irq
      ARM: s3c: enable s3c24xx multiplatform support
      ARM: iop32x: enable multiplatform support
      ARM: rework endianess selection
      ARM: ixp4xx: enable multiplatform support
      video: fbdev: omapfb: lcd_ams_delta: fix unused variable warning
      ARM: omap1: innovator: pass lcd control address as pdata
      ARM: omap1: move lcd_dma code into omapfb driver
      ARM: omap1: declare a dummy omap_set_dma_priority
      fbdev: omap: pass irqs as resource
      ARM: omap1: ams-delta: remove camera leftovers
      ARM: omap1: move mach/usb.h to include/linux/soc
      ARM: omap1: move some headers to include/linux/soc
      ARM: omap1: move perseus spi pinconf to board file
      ARM: omap1: move CF chipselect setup to board file
      fbdev: omap: avoid using mach/*.h files
      usb: omap: avoid mach/*.h headers
      clocksource: ti-dmtimer: avoid using mach/hardware.h
      serial: 8250/omap1: include linux/soc/ti/omap1-soc.h
      input: omap: void using mach/*.h headers
      ARM: omap1: innovator: move ohci phy power handling to board file
      ARM: omap1: move 32k counter from plat-omap to mach-omap1
      ARM: omap: remove debug-leds driver
      ARM: omap: dma: make usb support optional
      dma: omap: hide legacy interface
      ARM: omap1: dma: remove omap2 specific bits
      ARM: omap1: move plat/dma.c to mach/omap-dma.c
      ARM: omap: split up arch/arm/plat-omap/Kconfig
      ARM: omap: un-merge plat/sram.c
      ARM: omap: remove empty plat-omap directory
      ARM: omap1: relocate static I/O mapping
      ARM: omap1: use pci_remap_iospace() for omap_cf
      ARM: omap1: move mach/*.h into mach directory
      ARM: omap1: fix build with no SoC selected
      ARM: s3c: fix include path
      Merge branch 'omap1/multiplatform-prep' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc into
arm/multiplatform
      integrator: remove empty ap_init_early()
      ARM: omap2: remove include/mach/ subdirectory
      ARM: davinci: remove include/mach/ subdirectory
      ARM: spear: remove include/mach/ subdirectory
      ARM: omap: fix address space warnings from sparse
      ARM: omap: fix missing declaration warnings
      ARM: omap1: add back omap_set_dma_priority() stub

Janusz Krzysztofik (5):
      ARM: OMAP1: Prepare for conversion of OMAP1 clocks to CCF
      ARM: OMAP1: clock: Fix early UART rate issues
      ARM: OMAP1: clock: Fix UART rate reporting algorithm
      ARM: OMAP1: clock: Remove unused code
      ARM: OMAP1: clock: Remove noop code

Julia Lawall (2):
      ARM: OMAP1: fix typos in comments
      ARM: omap1: htc_herald: fix typos in comments

Krzysztof Kozlowski (1):
      ARM: s3c: mark as deprecated and schedule removal

Linus Walleij (2):
      ARM: config: Refresh IXP4xx config after multiplatform
      ARM: ixp4xx: Consolidate Kconfig fixing issue

Peng Wu (1):
      ARM: versatile: Add missing of_node_put in dcscb_init

Tony Lindgren (1):
      MAINTAINERS: omap1: Add Janusz as an additional maintainer

 MAINTAINERS                                        |   4 +-
 arch/arm/Kconfig                                   |  93 +-
 arch/arm/Kconfig.debug                             |   6 +-
 arch/arm/Makefile                                  |   8 +-
 .../uncompress.h => boot/compressed/misc-ep93xx.h} |  70 +-
 arch/arm/boot/compressed/misc.c                    |   4 +
 arch/arm/configs/dove_defconfig                    |   2 +
 arch/arm/configs/ep93xx_defconfig                  |   2 +
 arch/arm/configs/iop32x_defconfig                  |   1 +
 arch/arm/configs/ixp4xx_defconfig                  |  88 +-
 arch/arm/configs/mini2440_defconfig                |   2 +
 arch/arm/configs/s3c2410_defconfig                 |   3 +
 arch/arm/configs/tct_hammer_defconfig              |   2 +
 arch/arm/mach-asm9260/Kconfig                      |   1 +
 arch/arm/mach-aspeed/Kconfig                       |   2 +-
 arch/arm/mach-at91/Kconfig                         |   3 +-
 arch/arm/mach-clps711x/Kconfig                     |   1 +
 arch/arm/mach-davinci/Kconfig                      |   1 +
 arch/arm/mach-davinci/Makefile                     |   4 +-
 arch/arm/mach-davinci/board-da830-evm.c            |   7 +-
 arch/arm/mach-davinci/board-da850-evm.c            |   7 +-
 arch/arm/mach-davinci/board-dm355-evm.c            |   5 +-
 arch/arm/mach-davinci/board-dm355-leopard.c        |   5 +-
 arch/arm/mach-davinci/board-dm365-evm.c            |   6 +-
 arch/arm/mach-davinci/board-dm644x-evm.c           |   7 +-
 arch/arm/mach-davinci/board-dm646x-evm.c           |   5 +-
 arch/arm/mach-davinci/board-mityomapl138.c         |   8 +-
 arch/arm/mach-davinci/board-neuros-osd2.c          |   7 +-
 arch/arm/mach-davinci/board-omapl138-hawk.c        |   6 +-
 arch/arm/mach-davinci/board-sffsdr.c               |   6 +-
 arch/arm/mach-davinci/common.c                     |   4 +-
 arch/arm/mach-davinci/{include/mach => }/common.h  |   0
 arch/arm/mach-davinci/{include/mach => }/cputype.h |   2 +-
 arch/arm/mach-davinci/da830.c                      |  11 +-
 arch/arm/mach-davinci/da850.c                      |  12 +-
 arch/arm/mach-davinci/da8xx-dt.c                   |   4 +-
 arch/arm/mach-davinci/{include/mach => }/da8xx.h   |   5 +-
 arch/arm/mach-davinci/davinci.h                    |   3 +-
 arch/arm/mach-davinci/devices-da8xx.c              |   7 +-
 arch/arm/mach-davinci/devices.c                    |   7 +-
 arch/arm/mach-davinci/dm355.c                      |  12 +-
 arch/arm/mach-davinci/dm365.c                      |  12 +-
 arch/arm/mach-davinci/dm644x.c                     |  12 +-
 arch/arm/mach-davinci/dm646x.c                     |  12 +-
 .../arm/mach-davinci/{include/mach => }/hardware.h |   0
 arch/arm/mach-davinci/include/mach/mux.h           | 990 ---------------------
 arch/arm/mach-davinci/include/mach/uncompress.h    |  97 --
 arch/arm/mach-davinci/mux.c                        |   4 +-
 arch/arm/mach-davinci/mux.h                        | 969 +++++++++++++++++++-
 arch/arm/mach-davinci/pdata-quirks.c               |   4 +-
 arch/arm/mach-davinci/pm.c                         |   9 +-
 arch/arm/mach-davinci/{include/mach => }/pm.h      |   0
 arch/arm/mach-davinci/serial.c                     |   4 +-
 arch/arm/mach-davinci/{include/mach => }/serial.h  |   2 +-
 arch/arm/mach-davinci/sram.c                       |   2 +-
 arch/arm/mach-davinci/usb-da8xx.c                  |   7 +-
 arch/arm/mach-davinci/usb.c                        |   5 +-
 arch/arm/mach-dove/Kconfig                         |  16 +-
 arch/arm/mach-dove/Makefile                        |   2 +
 arch/arm/mach-dove/include/mach/uncompress.h       |  34 -
 arch/arm/mach-ep93xx/Kconfig                       |  13 +
 arch/arm/mach-ep93xx/adssphere.c                   |   1 +
 arch/arm/mach-ep93xx/core.c                        |   5 +-
 arch/arm/mach-ep93xx/edb93xx.c                     |   8 +
 .../mach-ep93xx/{include/mach => }/ep93xx-regs.h   |   4 -
 arch/arm/mach-ep93xx/gesbc9312.c                   |   1 +
 arch/arm/mach-ep93xx/gpio-ep93xx.h                 |   2 +-
 arch/arm/mach-ep93xx/include/mach/irqs.h           |  79 --
 arch/arm/mach-ep93xx/irqs.h                        |  76 ++
 arch/arm/mach-ep93xx/micro9.c                      |   4 +
 arch/arm/mach-ep93xx/simone.c                      |   1 +
 arch/arm/mach-ep93xx/snappercl15.c                 |   1 +
 arch/arm/mach-ep93xx/soc.h                         |   3 +-
 arch/arm/mach-ep93xx/ts72xx.c                      |   3 +-
 arch/arm/mach-ep93xx/vision_ep9307.c               |   1 +
 arch/arm/mach-exynos/Kconfig                       |   1 -
 arch/arm/mach-gemini/Kconfig                       |   1 +
 arch/arm/mach-highbank/Kconfig                     |   1 -
 arch/arm/mach-hisi/Kconfig                         |   2 +-
 arch/arm/mach-imx/Kconfig                          |   4 +-
 arch/arm/mach-integrator/Kconfig                   | 125 ---
 arch/arm/mach-integrator/Makefile                  |  10 -
 arch/arm/mach-iop32x/Kconfig                       |  18 +-
 arch/arm/mach-iop32x/em7210.c                      |   1 +
 arch/arm/mach-iop32x/glantank.c                    |   1 +
 arch/arm/mach-iop32x/include/mach/irqs.h           |  14 -
 arch/arm/mach-iop32x/include/mach/uncompress.h     |  25 -
 arch/arm/mach-iop32x/iq31244.c                     |   1 +
 arch/arm/mach-iop32x/iq80321.c                     |   1 +
 arch/arm/mach-iop32x/irqs.h                        |   2 +
 arch/arm/mach-iop32x/n2100.c                       |   1 +
 arch/arm/mach-ixp4xx/Kconfig                       |  29 +-
 arch/arm/mach-ixp4xx/Makefile.boot                 |   4 -
 arch/arm/mach-ixp4xx/include/mach/uncompress.h     |  54 --
 arch/arm/mach-keystone/Kconfig                     |   1 -
 arch/arm/mach-lpc32xx/Kconfig                      |   1 +
 arch/arm/mach-mmp/Kconfig                          |   2 +-
 arch/arm/mach-moxart/Kconfig                       |   1 +
 arch/arm/mach-mv78xx0/Kconfig                      |   1 +
 arch/arm/mach-mvebu/Kconfig                        |   3 +-
 arch/arm/mach-mxs/Kconfig                          |   1 +
 arch/arm/mach-nomadik/Kconfig                      |   1 +
 arch/arm/mach-npcm/Kconfig                         |   2 +-
 arch/arm/mach-nspire/Kconfig                       |   1 +
 arch/arm/mach-omap1/Kconfig                        |  57 ++
 arch/arm/mach-omap1/Makefile                       |   6 +-
 arch/arm/mach-omap1/ams-delta-fiq-handler.S        |   3 +-
 arch/arm/mach-omap1/ams-delta-fiq.c                |   2 +
 arch/arm/mach-omap1/ams-delta-fiq.h                |   2 +-
 arch/arm/mach-omap1/board-ams-delta.c              |  20 +-
 arch/arm/mach-omap1/board-fsample.c                |  10 +-
 arch/arm/mach-omap1/board-generic.c                |   8 +-
 arch/arm/mach-omap1/board-h2.c                     |  14 +-
 arch/arm/mach-omap1/board-h3.c                     |  16 +-
 arch/arm/mach-omap1/board-htcherald.c              |  12 +-
 arch/arm/mach-omap1/board-innovator.c              |  34 +-
 arch/arm/mach-omap1/board-nokia770.c               |   8 +-
 arch/arm/mach-omap1/board-osk.c                    |  49 +-
 arch/arm/mach-omap1/board-palmte.c                 |  14 +-
 arch/arm/mach-omap1/board-palmtt.c                 |  14 +-
 arch/arm/mach-omap1/board-palmz71.c                |  14 +-
 arch/arm/mach-omap1/board-perseus2.c               |  15 +-
 arch/arm/mach-omap1/board-sx1-mmc.c                |   3 +-
 arch/arm/mach-omap1/board-sx1.c                    |  12 +-
 arch/arm/mach-omap1/clock.c                        | 104 +--
 arch/arm/mach-omap1/clock.h                        |  56 +-
 arch/arm/mach-omap1/clock_data.c                   |  27 +-
 arch/arm/mach-omap1/common.h                       |   3 +-
 arch/arm/mach-omap1/devices.c                      |  12 +-
 arch/arm/mach-omap1/dma.c                          |   2 +-
 arch/arm/mach-omap1/fb.c                           |  19 +-
 arch/arm/mach-omap1/flash.c                        |   5 +-
 arch/arm/mach-omap1/fpga.c                         |   3 +-
 arch/arm/mach-omap1/gpio15xx.c                     |   3 +-
 arch/arm/mach-omap1/gpio16xx.c                     |   5 +-
 arch/arm/mach-omap1/gpio7xx.c                      |   3 +-
 arch/arm/mach-omap1/{include/mach => }/hardware.h  | 134 +--
 arch/arm/mach-omap1/i2c.c                          |   4 +-
 arch/arm/mach-omap1/id.c                           |   5 +-
 arch/arm/mach-omap1/include/mach/io.h              |  45 -
 arch/arm/mach-omap1/include/mach/lcdc.h            |  44 -
 arch/arm/mach-omap1/include/mach/memory.h          |  12 -
 arch/arm/mach-omap1/io.c                           |   7 +-
 arch/arm/mach-omap1/irq.c                          |   4 +-
 arch/arm/mach-omap1/{include/mach => }/irqs.h      |   2 -
 arch/arm/mach-omap1/mcbsp.c                        |  17 +-
 arch/arm/mach-omap1/{include/mach => }/mtd-xip.h   |   3 +-
 arch/arm/mach-omap1/mux.c                          |   6 +-
 arch/arm/mach-omap1/mux.h                          | 144 +++
 arch/arm/mach-omap1/ocpi.c                         |   8 +-
 .../arm/{plat-omap/dma.c => mach-omap1/omap-dma.c} | 269 ++----
 arch/arm/mach-omap1/{include/mach => }/omap1510.h  |   0
 arch/arm/mach-omap1/{include/mach => }/omap16xx.h  |   0
 arch/arm/mach-omap1/{include/mach => }/omap7xx.h   |   0
 arch/arm/mach-omap1/pm.c                           |   9 +-
 arch/arm/mach-omap1/pm.h                           |   2 +
 arch/arm/mach-omap1/reset.c                        |   3 +-
 arch/arm/mach-omap1/serial.c                       |   9 +-
 arch/arm/mach-omap1/sleep.S                        |   2 +-
 arch/arm/mach-omap1/soc.h                          |   6 +-
 arch/arm/mach-omap1/sram-init.c                    |  91 +-
 arch/arm/mach-omap1/sram.S                         |   4 +-
 arch/arm/mach-omap1/sram.h                         |   4 +-
 arch/arm/mach-omap1/{include/mach => }/tc.h        |   2 -
 arch/arm/mach-omap1/time.c                         |   2 +-
 arch/arm/mach-omap1/timer.c                        |   1 +
 arch/arm/mach-omap1/timer32k.c                     | 100 ++-
 arch/arm/mach-omap1/usb.c                          |   8 +-
 arch/arm/mach-omap1/usb.h                          |  25 +
 arch/arm/mach-omap2/Kconfig                        |  49 +
 arch/arm/mach-omap2/Makefile                       |   3 -
 arch/arm/mach-omap2/common.h                       |  13 +-
 arch/arm/mach-omap2/dma.c                          |   1 +
 arch/arm/mach-omap2/include/mach/hardware.h        |   3 -
 arch/arm/mach-omap2/include/mach/irqs.h            |   3 -
 arch/arm/mach-omap2/include/mach/serial.h          |  66 --
 arch/arm/mach-omap2/omap-iommu.c                   |   1 +
 arch/arm/mach-omap2/omap-secure.c                  |   2 +-
 arch/arm/mach-omap2/omap-secure.h                  |   2 +-
 arch/arm/mach-omap2/omap4-common.c                 |   2 +-
 arch/arm/mach-omap2/pdata-quirks.c                 |  11 -
 arch/arm/mach-omap2/serial.h                       |  67 +-
 arch/arm/mach-omap2/sram.c                         |  91 +-
 arch/arm/mach-omap2/sram.h                         |   5 +-
 arch/arm/mach-orion5x/Kconfig                      |   1 +
 arch/arm/mach-oxnas/Kconfig                        |   2 +-
 arch/arm/mach-qcom/Kconfig                         |   1 -
 arch/arm/mach-realview/Kconfig                     | 103 ---
 arch/arm/mach-realview/Makefile                    |   8 -
 arch/arm/mach-s3c/Kconfig.s3c24xx                  |  29 +-
 arch/arm/mach-s3c/Kconfig.s3c64xx                  |   7 +-
 arch/arm/mach-s3c/Makefile                         |   2 -
 arch/arm/mach-s3c/Makefile.s3c64xx                 |   3 -
 arch/arm/mach-s3c/bast-ide.c                       |   2 +-
 arch/arm/mach-s3c/bast-irq.c                       |   2 +-
 arch/arm/mach-s3c/cpu.c                            |   3 +-
 arch/arm/mach-s3c/dev-audio-s3c64xx.c              |   2 +-
 arch/arm/mach-s3c/dev-uart-s3c64xx.c               |   2 +-
 arch/arm/mach-s3c/devs.c                           |   2 +-
 arch/arm/mach-s3c/gpio-samsung.c                   |   2 +-
 arch/arm/mach-s3c/include/mach/io-s3c24xx.h        |  50 --
 arch/arm/mach-s3c/include/mach/io.h                |   8 -
 arch/arm/mach-s3c/init.c                           |   2 +
 arch/arm/mach-s3c/irq-pm-s3c24xx.c                 |   2 +-
 arch/arm/mach-s3c/irq-s3c24xx.c                    |   2 +-
 .../arm/mach-s3c/{include/mach => }/irqs-s3c24xx.h |  18 +-
 .../arm/mach-s3c/{include/mach => }/irqs-s3c64xx.h |   0
 arch/arm/mach-s3c/{include/mach => }/irqs.h        |   0
 arch/arm/mach-s3c/mach-amlm5900.c                  |   2 +
 arch/arm/mach-s3c/mach-anubis.c                    |   6 +-
 arch/arm/mach-s3c/mach-anw6410.c                   |   2 +-
 arch/arm/mach-s3c/mach-at2440evb.c                 |   1 +
 arch/arm/mach-s3c/mach-bast.c                      |   6 +-
 arch/arm/mach-s3c/mach-crag6410-module.c           |   2 +-
 arch/arm/mach-s3c/mach-crag6410.c                  |   2 +-
 arch/arm/mach-s3c/mach-gta02.c                     |   1 +
 arch/arm/mach-s3c/mach-h1940.c                     |   1 +
 arch/arm/mach-s3c/mach-hmt.c                       |   2 +-
 arch/arm/mach-s3c/mach-jive.c                      |   2 +-
 arch/arm/mach-s3c/mach-mini2440.c                  |   3 +-
 arch/arm/mach-s3c/mach-mini6410.c                  |   2 +-
 arch/arm/mach-s3c/mach-n30.c                       |   2 +
 arch/arm/mach-s3c/mach-ncp.c                       |   2 +-
 arch/arm/mach-s3c/mach-nexcoder.c                  |   1 +
 arch/arm/mach-s3c/mach-osiris.c                    |   6 +-
 arch/arm/mach-s3c/mach-otom.c                      |   1 +
 arch/arm/mach-s3c/mach-qt2410.c                    |   1 +
 arch/arm/mach-s3c/mach-real6410.c                  |   2 +-
 arch/arm/mach-s3c/mach-rx1950.c                    |   1 +
 arch/arm/mach-s3c/mach-rx3715.c                    |   7 +-
 arch/arm/mach-s3c/mach-smartq5.c                   |   2 +-
 arch/arm/mach-s3c/mach-smartq7.c                   |   2 +-
 arch/arm/mach-s3c/mach-smdk2410.c                  |   1 +
 arch/arm/mach-s3c/mach-smdk2413.c                  |   3 +
 arch/arm/mach-s3c/mach-smdk2416.c                  |  11 +-
 arch/arm/mach-s3c/mach-smdk2440.c                  |  11 +-
 arch/arm/mach-s3c/mach-smdk2443.c                  |  12 +-
 arch/arm/mach-s3c/mach-smdk6400.c                  |   2 +-
 arch/arm/mach-s3c/mach-smdk6410.c                  |   2 +-
 arch/arm/mach-s3c/mach-tct_hammer.c                |   1 +
 arch/arm/mach-s3c/mach-vr1000.c                    |   6 +-
 arch/arm/mach-s3c/mach-vstms.c                     |   1 +
 arch/arm/mach-s3c/{include/mach => }/map-base.h    |   6 +
 arch/arm/mach-s3c/map-s3c24xx.h                    |   2 +-
 arch/arm/mach-s3c/map-s3c64xx.h                    |   2 +-
 arch/arm/mach-s3c/pl080.c                          |   2 +-
 arch/arm/mach-s3c/pm-core-s3c24xx.h                |   2 +-
 arch/arm/mach-s3c/pm-s3c2412.c                     |   2 +-
 arch/arm/mach-s3c/pm-s3c64xx.c                     |   2 +-
 arch/arm/mach-s3c/pm.c                             |   2 +-
 arch/arm/mach-s3c/s3c2443.c                        |   2 +-
 arch/arm/mach-s3c/s3c24xx.c                        |   7 +
 arch/arm/mach-s3c/s3c24xx.h                        |   2 +-
 arch/arm/mach-s3c/s3c64xx.c                        |   9 +-
 arch/arm/mach-s3c/simtec-usb.c                     |   2 +-
 arch/arm/mach-socfpga/Kconfig                      |   1 -
 arch/arm/mach-spear/Kconfig                        |   2 +-
 arch/arm/mach-spear/Makefile                       |   2 -
 arch/arm/mach-spear/include/mach/irqs.h            |  35 -
 arch/arm/mach-spear/include/mach/uncompress.h      |  42 -
 arch/arm/mach-spear/{include/mach => }/misc_regs.h |   4 +-
 arch/arm/mach-spear/pl080.c                        |   4 +-
 arch/arm/mach-spear/platsmp.c                      |   2 +-
 arch/arm/mach-spear/restart.c                      |   2 +-
 arch/arm/mach-spear/{include/mach => }/spear.h     |   0
 arch/arm/mach-spear/spear1310.c                    |   2 +-
 arch/arm/mach-spear/spear13xx.c                    |   2 +-
 arch/arm/mach-spear/spear300.c                     |   2 +-
 arch/arm/mach-spear/spear310.c                     |   2 +-
 arch/arm/mach-spear/spear320.c                     |   2 +-
 arch/arm/mach-spear/spear3xx.c                     |   4 +-
 arch/arm/mach-spear/spear6xx.c                     |   4 +-
 arch/arm/mach-sunxi/Kconfig                        |   3 +-
 arch/arm/mach-versatile/Kconfig                    | 309 +++++++
 arch/arm/mach-versatile/Makefile                   |  32 +-
 .../Makefile.boot                                  |   0
 arch/arm/{mach-vexpress => mach-versatile}/dcscb.c |   5 +-
 .../dcscb_setup.S                                  |   2 -
 .../{plat-versatile => mach-versatile}/headsmp.S   |   2 -
 .../{plat-versatile => mach-versatile}/hotplug.c   |   2 +-
 .../cm.h => mach-versatile/integrator-cm.h}        |   0
 .../integrator-hardware.h}                         |   0
 .../core.c => mach-versatile/integrator.c}         |   8 +-
 .../common.h => mach-versatile/integrator.h}       |   0
 .../integrator_ap.c                                |  13 +-
 .../integrator_cp.c                                |   8 +-
 .../platsmp-realview.c}                            |   2 +-
 .../platsmp-vexpress.c}                            |   7 +-
 .../{plat-versatile => mach-versatile}/platsmp.c   |   4 +-
 .../include/plat => mach-versatile}/platsmp.h      |   2 -
 .../realview-dt.c => mach-versatile/realview.c}    |   0
 arch/arm/{mach-vexpress => mach-versatile}/spc.c   |   0
 arch/arm/{mach-vexpress => mach-versatile}/spc.h   |   0
 .../arm/{mach-vexpress => mach-versatile}/tc2_pm.c |   2 -
 .../{mach-vexpress => mach-versatile}/v2m-mps2.c   |   0
 arch/arm/{mach-vexpress => mach-versatile}/v2m.c   |   2 +-
 .../mach-versatile/{versatile_dt.c => versatile.c} |   0
 .../core.h => mach-versatile/vexpress.h}           |   0
 arch/arm/mach-vexpress/Kconfig                     |  81 --
 arch/arm/mach-vexpress/Makefile                    |  19 -
 arch/arm/mach-vt8500/Kconfig                       |   1 +
 arch/arm/mach-zynq/Kconfig                         |   1 -
 arch/arm/mm/Kconfig                                |  28 +-
 arch/arm/plat-omap/Kconfig                         | 119 ---
 arch/arm/plat-omap/Makefile                        |  13 -
 arch/arm/plat-omap/counter_32k.c                   | 114 ---
 arch/arm/plat-omap/debug-leds.c                    | 171 ----
 arch/arm/plat-omap/include/plat/counter-32k.h      |   1 -
 arch/arm/plat-omap/include/plat/cpu.h              |  21 -
 arch/arm/plat-omap/include/plat/sram.h             |   8 -
 arch/arm/plat-omap/sram.c                          | 129 ---
 arch/arm/plat-versatile/Makefile                   |   5 -
 drivers/clocksource/timer-ti-dm.c                  |   2 +-
 drivers/dma/ti/omap-dma.c                          |  19 +-
 drivers/input/keyboard/omap-keypad.c               |   1 +
 drivers/pcmcia/Kconfig                             |   3 +-
 drivers/pcmcia/omap_cf.c                           |  48 +-
 drivers/spi/Kconfig                                |   2 +-
 drivers/spi/spi-omap-uwire.c                       |  15 +-
 drivers/tty/serial/8250/8250.h                     |   1 +
 drivers/usb/gadget/udc/omap_udc.c                  |   5 +-
 drivers/usb/host/Kconfig                           |   2 +-
 drivers/usb/host/ohci-omap.c                       |  42 +-
 drivers/usb/phy/Kconfig                            |   3 +-
 drivers/usb/phy/phy-isp1301-omap.c                 |   6 +-
 drivers/video/backlight/Kconfig                    |   4 +-
 drivers/video/backlight/omap1_bl.c                 |   4 +-
 drivers/video/fbdev/Makefile                       |   2 +-
 drivers/video/fbdev/omap/Kconfig                   |   4 +-
 drivers/video/fbdev/omap/Makefile                  |   5 +
 drivers/video/fbdev/omap/lcd_ams_delta.c           |   6 +-
 .../video/fbdev/omap}/lcd_dma.c                    |   7 +-
 .../mach => drivers/video/fbdev/omap}/lcd_dma.h    |   2 -
 drivers/video/fbdev/omap/lcd_inn1510.c             |   9 +-
 drivers/video/fbdev/omap/lcd_osk.c                 |   4 +-
 drivers/video/fbdev/omap/lcdc.c                    |  10 +-
 drivers/video/fbdev/omap/lcdc.h                    |  35 +
 drivers/video/fbdev/omap/omapfb.h                  |   2 +
 drivers/video/fbdev/omap/omapfb_main.c             |  19 +-
 drivers/video/fbdev/omap/sossi.c                   |   4 +-
 include/linux/omap-dma.h                           |  35 +-
 include/linux/platform_data/usb-omap1.h            |   2 +
 include/linux/soc/ti/omap1-io.h                    | 143 +++
 .../mach/mux.h => include/linux/soc/ti/omap1-mux.h | 142 +--
 .../mach/soc.h => include/linux/soc/ti/omap1-soc.h |  22 -
 .../mach/usb.h => include/linux/soc/ti/omap1-usb.h |  28 +-
 346 files changed, 3131 insertions(+), 4108 deletions(-)
 rename arch/arm/{mach-ep93xx/include/mach/uncompress.h =>
boot/compressed/misc-ep93xx.h} (51%)
 rename arch/arm/mach-davinci/{include/mach => }/common.h (100%)
 rename arch/arm/mach-davinci/{include/mach => }/cputype.h (98%)
 rename arch/arm/mach-davinci/{include/mach => }/da8xx.h (99%)
 rename arch/arm/mach-davinci/{include/mach => }/hardware.h (100%)
 delete mode 100644 arch/arm/mach-davinci/include/mach/mux.h
 delete mode 100644 arch/arm/mach-davinci/include/mach/uncompress.h
 rename arch/arm/mach-davinci/{include/mach => }/pm.h (100%)
 rename arch/arm/mach-davinci/{include/mach => }/serial.h (97%)
 delete mode 100644 arch/arm/mach-dove/include/mach/uncompress.h
 rename arch/arm/mach-ep93xx/{include/mach => }/ep93xx-regs.h (94%)
 delete mode 100644 arch/arm/mach-ep93xx/include/mach/irqs.h
 create mode 100644 arch/arm/mach-ep93xx/irqs.h
 delete mode 100644 arch/arm/mach-integrator/Kconfig
 delete mode 100644 arch/arm/mach-integrator/Makefile
 delete mode 100644 arch/arm/mach-iop32x/include/mach/irqs.h
 delete mode 100644 arch/arm/mach-iop32x/include/mach/uncompress.h
 delete mode 100644 arch/arm/mach-ixp4xx/Makefile.boot
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/uncompress.h
 rename arch/arm/mach-omap1/{include/mach => }/hardware.h (59%)
 delete mode 100644 arch/arm/mach-omap1/include/mach/io.h
 delete mode 100644 arch/arm/mach-omap1/include/mach/lcdc.h
 delete mode 100644 arch/arm/mach-omap1/include/mach/memory.h
 rename arch/arm/mach-omap1/{include/mach => }/irqs.h (99%)
 rename arch/arm/mach-omap1/{include/mach => }/mtd-xip.h (97%)
 create mode 100644 arch/arm/mach-omap1/mux.h
 rename arch/arm/{plat-omap/dma.c => mach-omap1/omap-dma.c} (83%)
 rename arch/arm/mach-omap1/{include/mach => }/omap1510.h (100%)
 rename arch/arm/mach-omap1/{include/mach => }/omap16xx.h (100%)
 rename arch/arm/mach-omap1/{include/mach => }/omap7xx.h (100%)
 rename arch/arm/mach-omap1/{include/mach => }/tc.h (98%)
 create mode 100644 arch/arm/mach-omap1/usb.h
 delete mode 100644 arch/arm/mach-omap2/include/mach/hardware.h
 delete mode 100644 arch/arm/mach-omap2/include/mach/irqs.h
 delete mode 100644 arch/arm/mach-omap2/include/mach/serial.h
 delete mode 100644 arch/arm/mach-realview/Kconfig
 delete mode 100644 arch/arm/mach-realview/Makefile
 delete mode 100644 arch/arm/mach-s3c/include/mach/io-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/include/mach/io.h
 rename arch/arm/mach-s3c/{include/mach => }/irqs-s3c24xx.h (95%)
 rename arch/arm/mach-s3c/{include/mach => }/irqs-s3c64xx.h (100%)
 rename arch/arm/mach-s3c/{include/mach => }/irqs.h (100%)
 rename arch/arm/mach-s3c/{include/mach => }/map-base.h (87%)
 delete mode 100644 arch/arm/mach-spear/include/mach/irqs.h
 delete mode 100644 arch/arm/mach-spear/include/mach/uncompress.h
 rename arch/arm/mach-spear/{include/mach => }/misc_regs.h (87%)
 rename arch/arm/mach-spear/{include/mach => }/spear.h (100%)
 rename arch/arm/{mach-vexpress => mach-versatile}/Makefile.boot (100%)
 rename arch/arm/{mach-vexpress => mach-versatile}/dcscb.c (97%)
 rename arch/arm/{mach-vexpress => mach-versatile}/dcscb_setup.S (95%)
 rename arch/arm/{plat-versatile => mach-versatile}/headsmp.S (94%)
 rename arch/arm/{plat-versatile => mach-versatile}/hotplug.c (98%)
 rename arch/arm/{mach-integrator/cm.h => mach-versatile/integrator-cm.h} (100%)
 rename arch/arm/{mach-integrator/hardware.h =>
mach-versatile/integrator-hardware.h} (100%)
 rename arch/arm/{mach-integrator/core.c => mach-versatile/integrator.c} (95%)
 rename arch/arm/{mach-integrator/common.h =>
mach-versatile/integrator.h} (100%)
 rename arch/arm/{mach-integrator => mach-versatile}/integrator_ap.c (95%)
 rename arch/arm/{mach-integrator => mach-versatile}/integrator_cp.c (96%)
 rename arch/arm/{mach-realview/platsmp-dt.c =>
mach-versatile/platsmp-realview.c} (98%)
 rename arch/arm/{mach-vexpress/platsmp.c =>
mach-versatile/platsmp-vexpress.c} (96%)
 rename arch/arm/{plat-versatile => mach-versatile}/platsmp.c (97%)
 rename arch/arm/{plat-versatile/include/plat => mach-versatile}/platsmp.h (87%)
 rename arch/arm/{mach-realview/realview-dt.c =>
mach-versatile/realview.c} (100%)
 rename arch/arm/{mach-vexpress => mach-versatile}/spc.c (100%)
 rename arch/arm/{mach-vexpress => mach-versatile}/spc.h (100%)
 rename arch/arm/{mach-vexpress => mach-versatile}/tc2_pm.c (99%)
 rename arch/arm/{mach-vexpress => mach-versatile}/v2m-mps2.c (100%)
 rename arch/arm/{mach-vexpress => mach-versatile}/v2m.c (97%)
 rename arch/arm/mach-versatile/{versatile_dt.c => versatile.c} (100%)
 rename arch/arm/{mach-vexpress/core.h => mach-versatile/vexpress.h} (100%)
 delete mode 100644 arch/arm/mach-vexpress/Kconfig
 delete mode 100644 arch/arm/mach-vexpress/Makefile
 delete mode 100644 arch/arm/plat-omap/Kconfig
 delete mode 100644 arch/arm/plat-omap/Makefile
 delete mode 100644 arch/arm/plat-omap/counter_32k.c
 delete mode 100644 arch/arm/plat-omap/debug-leds.c
 delete mode 100644 arch/arm/plat-omap/include/plat/counter-32k.h
 delete mode 100644 arch/arm/plat-omap/include/plat/cpu.h
 delete mode 100644 arch/arm/plat-omap/include/plat/sram.h
 delete mode 100644 arch/arm/plat-omap/sram.c
 delete mode 100644 arch/arm/plat-versatile/Makefile
 rename {arch/arm/mach-omap1 => drivers/video/fbdev/omap}/lcd_dma.c (98%)
 rename {arch/arm/mach-omap1/include/mach =>
drivers/video/fbdev/omap}/lcd_dma.h (98%)
 create mode 100644 include/linux/soc/ti/omap1-io.h
 rename arch/arm/mach-omap1/include/mach/mux.h =>
include/linux/soc/ti/omap1-mux.h (53%)
 rename arch/arm/mach-omap1/include/mach/soc.h =>
include/linux/soc/ti/omap1-soc.h (90%)
 rename arch/arm/mach-omap1/include/mach/usb.h =>
include/linux/soc/ti/omap1-usb.h (86%)
