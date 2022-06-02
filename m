Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D59C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 21:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E30D5C341C4; Thu,  2 Jun 2022 21:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B7FC3411D
	for <soc@kernel.org>; Thu,  2 Jun 2022 21:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654205674;
	bh=NCn1x8w4k2ibPWt/a5YaVkKdkOBx7+Ixl44VmUpNuPk=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=J+NhX1+xleJ25nwGGVinC8kCkhJKPadE0+XrmmDLj1ecDllM6eQkXCRVwTej5bz8Q
	 vUVpYbthDDbL7n6WZ9mluWFXu1RyG1mV7l3AzVwybZ4jnqA8jlpecyNKtge+RepzaJ
	 mANnRo/sVo1TufX4MijWWvvzM3RpWQSN0gsxCLqqKtFF6s61jRLUE8l7XML18KsEbb
	 y50FEfE/EwgrKBC3YPluwXojvmHu+gVqU3FyqqZAzhBYwtXWv/NdqiVnhuF9gqLP2v
	 Cj2HrRP7XPF8wlbfWGVSOwlBOT49ujKwNzyltODVjD25Ub4k37szYROSDSy/0uYx9L
	 n1DHFuYKPTt3g==
Received: by mail-yb1-f179.google.com with SMTP id t31so10606235ybi.2
        for <soc@kernel.org>; Thu, 02 Jun 2022 14:34:34 -0700 (PDT)
X-Gm-Message-State: AOAM532ISpDBMcv6QqXEXPeQZC35rVTn7xfmPAQ3cxPyCxcwc00scpBt
	tp35wZuCJJkfrzvR6VXVviSHH2wE8VH1vF1voFc=
X-Google-Smtp-Source: ABdhPJwYoQxVbTPKKQDYkEdJxBz7Bh2h0ZI3jxX9tgy92ZXDXJN/wZwkJXB0bcA7phBkcHb31rRId5oWPInYseeEvro=
X-Received: by 2002:a25:69c4:0:b0:65c:ed2b:9106 with SMTP id
 e187-20020a2569c4000000b0065ced2b9106mr7565789ybc.394.1654205673723; Thu, 02
 Jun 2022 14:34:33 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 2 Jun 2022 23:34:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
Message-ID: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
Subject: [GIT PULL 1/2] ARM: multiplatform changes, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-multiplatform-5.19-2

for you to fetch changes up to 3d76c9f5e0ee842ad42e482669d7fd63d4b67867:

  ARM: pxa/mmp: remove traces of plat-pxa (2022-05-31 16:07:52 +0200)

----------------------------------------------------------------
ARM: multiplatform changes, part 2

The second part of the multiplatform changes now converts the
Intel/Marvell PXA platform along with the rest. The patches went through
several rebases before the merge window as bugs were found, so they
remained separate.

This has to touch a lot of drivers, in particular the touchscreen,
pcmcia, sound and clk bits, to detach the driver files from the
platform and board specific header files.

----------------------------------------------------------------
Arnd Bergmann (45):
      ARM: pxa: split mach/generic.h
      ARM: pxa: make mainstone.h private
      ARM: pxa: make mach/regs-uart.h private
      ARM: pxa: remove mach/dma.h
      ARM: pxa: split up mach/hardware.h
      ARM: pxa: stop using mach/bitfield.h
      ARM: pxa: move mach/sound.h to linux/platform_data/
      ARM: pxa: move regs-lcd.h into driver
      watchdog: sa1100: use platform device registration
      ARM: pxa: pxa2xx-ac97-lib: use IRQ resource
      ARM: pxa: move pcmcia board data into mach-pxa
      ARM: pxa: make addr-map.h header local
      ARM: pxa: use pdev resource for palmld mmio
      ARM: pxa: maybe fix gpio lookup tables
      ARM: pxa: poodle: use platform data for poodle asoc driver
      ARM: pxa: corgi: use gpio descriptors for audio
      ARM: pxa: hx4700: use gpio descriptors for audio
      ARM: pxa: lubbock: pass udc irqs as resource
      ARM: pxa: spitz: use gpio descriptors for audio
      ARM: pxa: eseries: use gpio lookup for audio
      ARM: pxa: z2: use gpio lookup for audio device
      ARM: pxa: magician: use platform driver for audio
      ARM: pxa: mainstone-wm97xx: use gpio lookup table
      ARM: pxa: zylonite: use gpio lookup instead mfp header
      input: touchscreen: mainstone: fix pxa2xx+pxa3xx configuration
      input: touchscreen: mainstone: sync with zylonite driver
      Input: touchscreen: use wrapper for pxa2xx ac97 registers
      ASoC: pxa: use pdev resource for FIFO regs
      ASoC: pxa: ac97: use normal MMIO accessors
      ASoC: pxa: i2s: use normal MMIO accessors
      ARM: pxa: pcmcia: move smemc configuration back to arch
      ARM: pxa: remove get_clk_frequency_khz()
      cpufreq: pxa3: move clk register access to clk driver
      ARM: pxa: move smemc register access from clk to platform
      ARM: pxa: move clk register definitions to driver
      ARM: pxa: remove unused mach/bitfield.h
      ARM: mmp: remove tavorevb board support
      ARM: mmp: rename pxa_register_device
      ARM: pxa: move plat-pxa to drivers/soc/
      ARM: PXA: fix multi-cpu build of xsc3
      ARM: pxa: move mach/*.h to mach-pxa/
      ARM: pxa: remove support for MTD_XIP
      ARM: pxa/sa1100: move I/O space to PCI_IOBASE
      ARM: pxa: convert to multiplatform
      ARM: pxa/mmp: remove traces of plat-pxa

Dmitry Torokhov (2):
      Input: wm97xx - switch to using threaded IRQ
      Input: wm97xx - get rid of irq_enable method in wm97xx_mach_ops

Linus Walleij (1):
      ARM/pxa/mfd/power/sound: Switch Tosa to GPIO descriptors

 Documentation/arm/marvell.rst                      |   7 -
 arch/arm/Kconfig                                   |  22 ---
 arch/arm/Makefile                                  |   1 -
 arch/arm/common/locomo.c                           |   1 -
 arch/arm/common/sa1111.c                           |   5 +-
 arch/arm/configs/am200epdkit_defconfig             |   1 +
 arch/arm/configs/cm_x300_defconfig                 |   1 +
 arch/arm/configs/colibri_pxa270_defconfig          |   1 +
 arch/arm/configs/colibri_pxa300_defconfig          |   1 +
 arch/arm/configs/corgi_defconfig                   |   1 +
 arch/arm/configs/eseries_pxa_defconfig             |   1 +
 arch/arm/configs/ezx_defconfig                     |   1 +
 arch/arm/configs/h5000_defconfig                   |   1 +
 arch/arm/configs/imote2_defconfig                  |   1 +
 arch/arm/configs/lpd270_defconfig                  |   1 +
 arch/arm/configs/lubbock_defconfig                 |   1 +
 arch/arm/configs/magician_defconfig                |   1 +
 arch/arm/configs/mainstone_defconfig               |   1 +
 arch/arm/configs/palmz72_defconfig                 |   1 +
 arch/arm/configs/pcm027_defconfig                  |   1 +
 arch/arm/configs/pxa255-idp_defconfig              |   1 +
 arch/arm/configs/pxa3xx_defconfig                  |   1 +
 arch/arm/configs/pxa_defconfig                     |   1 +
 arch/arm/configs/spitz_defconfig                   |   1 +
 arch/arm/configs/trizeps4_defconfig                |   1 +
 arch/arm/configs/viper_defconfig                   |   1 +
 arch/arm/configs/xcep_defconfig                    |   1 +
 arch/arm/configs/zeus_defconfig                    |   1 +
 arch/arm/include/asm/hardware/sa1111.h             |   2 -
 arch/arm/include/asm/io.h                          |  27 +---
 arch/arm/mach-mmp/Kconfig                          |  10 +-
 arch/arm/mach-mmp/Makefile                         |   3 -
 arch/arm/mach-mmp/devices.c                        |   2 +-
 arch/arm/mach-mmp/devices.h                        |  10 +-
 arch/arm/mach-mmp/mfp.h                            |   2 +-
 arch/arm/mach-mmp/mmp2.h                           |  48 +++---
 arch/arm/mach-mmp/pxa168.h                         |  60 +++----
 arch/arm/mach-mmp/pxa910.h                         |  38 ++---
 arch/arm/mach-mmp/tavorevb.c                       | 113 --------------
 arch/arm/mach-mmp/ttc_dkb.c                        |   6 +-
 arch/arm/mach-pxa/Kconfig                          |  14 ++
 arch/arm/mach-pxa/Makefile                         |  18 ++-
 arch/arm/mach-pxa/Makefile.boot                    |   3 -
 arch/arm/mach-pxa/{include/mach => }/addr-map.h    |   0
 arch/arm/mach-pxa/am300epd.c                       |   2 +-
 .../arm/mach-pxa/balloon3-pcmcia.c                 |   4 +-
 arch/arm/mach-pxa/balloon3.c                       |   4 +-
 arch/arm/mach-pxa/{include/mach => }/balloon3.h    |   0
 arch/arm/mach-pxa/cm-x300.c                        |  12 +-
 arch/arm/mach-pxa/colibri-evalboard.c              |   1 -
 .../arm/mach-pxa/colibri-pcmcia.c                  |   2 +-
 arch/arm/mach-pxa/colibri-pxa270-income.c          |   1 -
 arch/arm/mach-pxa/colibri-pxa270.c                 |   2 +-
 arch/arm/mach-pxa/colibri-pxa300.c                 |   3 +-
 arch/arm/mach-pxa/colibri-pxa320.c                 |   2 +-
 arch/arm/mach-pxa/colibri-pxa3xx.c                 |   3 +-
 arch/arm/mach-pxa/colibri.h                        |   2 +-
 arch/arm/mach-pxa/corgi.c                          |  23 ++-
 arch/arm/mach-pxa/{include/mach => }/corgi.h       |   0
 arch/arm/mach-pxa/corgi_pm.c                       |   5 +-
 arch/arm/mach-pxa/csb726.c                         |   5 +-
 arch/arm/mach-pxa/csb726.h                         |   2 +-
 arch/arm/mach-pxa/devices.c                        |  17 +-
 .../arm/mach-pxa/e740-pcmcia.c                     |   4 +-
 .../arm/mach-pxa/{include/mach => }/eseries-gpio.h |   0
 arch/arm/mach-pxa/eseries.c                        |  38 ++++-
 arch/arm/mach-pxa/ezx.c                            |   1 -
 arch/arm/mach-pxa/generic.c                        |  62 +++++---
 arch/arm/mach-pxa/generic.h                        |   9 --
 arch/arm/mach-pxa/gumstix.c                        |   1 -
 arch/arm/mach-pxa/gumstix.h                        |   2 +-
 arch/arm/mach-pxa/h5000.c                          |   2 +-
 .../arm/mach-pxa/hx4700-pcmcia.c                   |   4 +-
 arch/arm/mach-pxa/hx4700.c                         |  18 ++-
 arch/arm/mach-pxa/{include/mach => }/hx4700.h      |   0
 arch/arm/mach-pxa/idp.c                            |   2 -
 arch/arm/mach-pxa/idp.h                            |   2 +-
 arch/arm/mach-pxa/include/mach/bitfield.h          | 114 --------------
 arch/arm/mach-pxa/include/mach/dma.h               |  17 --
 arch/arm/mach-pxa/include/mach/generic.h           |   1 -
 arch/arm/mach-pxa/include/mach/mtd-xip.h           |  36 -----
 arch/arm/mach-pxa/include/mach/uncompress.h        |  70 ---------
 arch/arm/mach-pxa/irq.c                            |   5 +-
 arch/arm/mach-pxa/{include/mach => }/irqs.h        |   0
 arch/arm/mach-pxa/littleton.c                      |   1 -
 arch/arm/mach-pxa/lpd270.c                         |   6 +-
 arch/arm/mach-pxa/lubbock.c                        |  17 +-
 arch/arm/mach-pxa/{include/mach => }/lubbock.h     |   4 +-
 arch/arm/mach-pxa/magician.c                       |  56 ++++++-
 arch/arm/mach-pxa/{include/mach => }/magician.h    |   2 +-
 arch/arm/mach-pxa/mainstone.c                      |  17 +-
 arch/arm/mach-pxa/{include/mach => }/mainstone.h   |   4 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c                     |   3 +-
 arch/arm/mach-pxa/mfp-pxa2xx.h                     |   2 +-
 arch/arm/mach-pxa/mfp-pxa3xx.c                     |   3 +-
 arch/arm/mach-pxa/mfp-pxa3xx.h                     |   2 +-
 arch/arm/mach-pxa/{include/mach => }/mfp.h         |   2 +-
 arch/arm/mach-pxa/mioa701.c                        |   4 +-
 arch/arm/mach-pxa/mxm8x10.c                        |   8 +-
 arch/arm/mach-pxa/palm27x.c                        |   2 +-
 .../arm/mach-pxa/palmld-pcmcia.c                   |   5 +-
 arch/arm/mach-pxa/palmld.c                         |  23 ++-
 arch/arm/mach-pxa/{include/mach => }/palmld.h      |   0
 arch/arm/mach-pxa/palmt5.c                         |  11 +-
 arch/arm/mach-pxa/palmt5.h                         |   2 +-
 .../arm/mach-pxa/palmtc-pcmcia.c                   |   4 +-
 arch/arm/mach-pxa/palmtc.c                         |   4 +-
 arch/arm/mach-pxa/{include/mach => }/palmtc.h      |   0
 arch/arm/mach-pxa/palmte2.c                        |   2 +-
 arch/arm/mach-pxa/palmtreo.c                       |   4 +-
 .../arm/mach-pxa/palmtx-pcmcia.c                   |   4 +-
 arch/arm/mach-pxa/palmtx.c                         |  13 +-
 arch/arm/mach-pxa/{include/mach => }/palmtx.h      |   0
 arch/arm/mach-pxa/palmz72.c                        |   2 +-
 arch/arm/mach-pxa/pcm027.h                         |   2 +-
 arch/arm/mach-pxa/pcm990-baseboard.c               |   2 +-
 arch/arm/mach-pxa/pcm990_baseboard.h               |   2 +-
 arch/arm/mach-pxa/poodle.c                         |  31 ++--
 arch/arm/mach-pxa/{include/mach => }/poodle.h      |   2 -
 arch/arm/mach-pxa/pxa-dt.c                         |   2 +-
 arch/arm/mach-pxa/pxa-regs.h                       |  52 +++++++
 arch/arm/mach-pxa/pxa25x.c                         |  12 +-
 arch/arm/mach-pxa/pxa25x.h                         |   6 +-
 arch/arm/mach-pxa/pxa27x-udc.h                     |   2 +
 arch/arm/mach-pxa/pxa27x.c                         |  12 +-
 arch/arm/mach-pxa/pxa27x.h                         |   6 +-
 arch/arm/mach-pxa/{include/mach => }/pxa2xx-regs.h |  47 +-----
 arch/arm/mach-pxa/pxa2xx.c                         |  32 +++-
 arch/arm/mach-pxa/pxa300.c                         |   1 +
 arch/arm/mach-pxa/pxa320.c                         |   1 +
 arch/arm/mach-pxa/{include/mach => }/pxa3xx-regs.h |  71 +--------
 arch/arm/mach-pxa/pxa3xx-ulpi.c                    |   2 +-
 arch/arm/mach-pxa/pxa3xx.c                         |  19 ++-
 arch/arm/mach-pxa/pxa3xx.h                         |   6 +-
 arch/arm/mach-pxa/pxa930.c                         |   1 +
 arch/arm/mach-pxa/{include/mach => }/regs-ost.h    |   4 +-
 arch/arm/mach-pxa/regs-rtc.h                       |   2 +-
 arch/arm/mach-pxa/regs-u2d.h                       |   2 -
 arch/arm/mach-pxa/{include/mach => }/regs-uart.h   |   2 +
 arch/arm/mach-pxa/reset.c                          |   9 +-
 arch/arm/mach-pxa/{include/mach => }/reset.h       |   2 +-
 arch/arm/mach-pxa/sharpsl_pm.c                     |   2 +-
 arch/arm/mach-pxa/sleep.S                          |   9 +-
 arch/arm/mach-pxa/smemc.c                          |  13 +-
 arch/arm/mach-pxa/{include/mach => }/smemc.h       |   0
 arch/arm/mach-pxa/spitz.c                          |  37 ++++-
 arch/arm/mach-pxa/{include/mach => }/spitz.h       |   0
 arch/arm/mach-pxa/spitz_pm.c                       |   3 +-
 arch/arm/mach-pxa/standby.S                        |   3 +-
 arch/arm/mach-pxa/tosa.c                           |  80 +++-------
 arch/arm/mach-pxa/{include/mach => }/tosa.h        |  18 ---
 .../arm/mach-pxa/trizeps4-pcmcia.c                 |   6 +-
 arch/arm/mach-pxa/trizeps4.c                       |   6 +-
 arch/arm/mach-pxa/{include/mach => }/trizeps4.h    |   1 +
 .../arm/mach-pxa/viper-pcmcia.c                    |   6 +-
 .../arm/mach-pxa/viper-pcmcia.h                    |   0
 arch/arm/mach-pxa/viper.c                          |  20 ++-
 .../arm/mach-pxa/vpac270-pcmcia.c                  |   4 +-
 arch/arm/mach-pxa/vpac270.c                        |   4 +-
 arch/arm/mach-pxa/{include/mach => }/vpac270.h     |   0
 arch/arm/mach-pxa/xcep.c                           |   4 +-
 arch/arm/mach-pxa/z2.c                             |  13 +-
 arch/arm/mach-pxa/{include/mach => }/z2.h          |   0
 arch/arm/mach-pxa/zeus.c                           |  20 ++-
 arch/arm/mach-pxa/zylonite.c                       |  34 +++-
 arch/arm/mach-pxa/zylonite.h                       |   2 +
 arch/arm/mach-pxa/zylonite_pxa300.c                |   1 +
 arch/arm/mach-pxa/zylonite_pxa320.c                |   1 +
 arch/arm/mach-sa1100/generic.c                     |   6 +-
 arch/arm/mach-sa1100/include/mach/reset.h          |   1 -
 arch/arm/mm/copypage-xsc3.c                        |   2 +
 arch/arm/mm/ioremap.c                              |   2 +-
 arch/mips/alchemy/devboards/db1300.c               |   9 --
 drivers/ata/pata_palmld.c                          |   3 +-
 drivers/clk/pxa/clk-pxa.c                          |   8 +-
 drivers/clk/pxa/clk-pxa.h                          |   9 +-
 drivers/clk/pxa/clk-pxa25x.c                       |  46 ++----
 drivers/clk/pxa/clk-pxa27x.c                       |  68 +++-----
 drivers/clk/pxa/clk-pxa2xx.h                       |  58 +++++++
 drivers/clk/pxa/clk-pxa3xx.c                       | 139 ++++++++++++++---
 drivers/cpufreq/pxa2xx-cpufreq.c                   |   6 +-
 drivers/cpufreq/pxa3xx-cpufreq.c                   |  65 ++++----
 drivers/input/mouse/pxa930_trkball.c               |   1 -
 drivers/input/touchscreen/Kconfig                  |   2 +
 drivers/input/touchscreen/mainstone-wm97xx.c       | 130 +++++++---------
 drivers/input/touchscreen/wm97xx-core.c            |  42 +----
 drivers/input/touchscreen/zylonite-wm97xx.c        |  43 +++---
 drivers/leds/leds-locomo.c                         |   1 -
 drivers/mfd/tc6393xb.c                             | 130 +++++++++++-----
 drivers/mmc/host/pxamci.c                          |   2 +-
 drivers/mtd/maps/pxa2xx-flash.c                    |   2 -
 drivers/pcmcia/Makefile                            |  13 --
 drivers/pcmcia/pxa2xx_base.c                       |  48 ++----
 drivers/pcmcia/pxa2xx_sharpsl.c                    |   3 +-
 drivers/pcmcia/sa1111_generic.c                    |   1 -
 drivers/pcmcia/sa1111_lubbock.c                    |   1 -
 drivers/pcmcia/soc_common.c                        |  19 ++-
 drivers/pcmcia/soc_common.h                        | 120 +-------------
 drivers/power/supply/tosa_battery.c                | 172 +++++++++++++--------
 drivers/rtc/rtc-pxa.c                              |   2 -
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 {arch/arm/plat-pxa => drivers/soc/pxa}/Kconfig     |   5 +-
 {arch/arm/plat-pxa => drivers/soc/pxa}/Makefile    |   4 -
 {arch/arm/plat-pxa => drivers/soc/pxa}/mfp.c       |   2 +-
 {arch/arm/plat-pxa => drivers/soc/pxa}/ssp.c       |   0
 drivers/usb/gadget/udc/pxa25x_udc.c                |  37 ++---
 drivers/usb/gadget/udc/pxa25x_udc.h                |   7 +-
 drivers/usb/host/ohci-pxa27x.c                     |   3 +-
 .../video/fbdev/pxa3xx-regs.h                      |  24 +--
 drivers/video/fbdev/pxafb.c                        |   4 +-
 drivers/watchdog/sa1100_wdt.c                      |  88 ++++++++---
 include/linux/clk/pxa.h                            |  16 ++
 include/linux/gpio/machine.h                       |  12 ++
 include/linux/mfd/tc6393xb.h                       |   3 -
 include/linux/platform_data/asoc-poodle.h          |  16 ++
 .../linux/platform_data/asoc-pxa.h                 |   4 +-
 include/linux/platform_data/video-pxafb.h          |  22 ++-
 .../mach/hardware.h => include/linux/soc/pxa/cpu.h |  61 +-------
 .../include/plat => include/linux/soc/pxa}/mfp.h   |   6 +-
 include/linux/soc/pxa/smemc.h                      |  13 ++
 include/linux/wm97xx.h                             |   4 -
 include/pcmcia/soc_common.h                        | 125 +++++++++++++++
 include/sound/pxa2xx-lib.h                         |   4 +
 sound/arm/pxa2xx-ac97-lib.c                        | 145 ++++++++++-------
 .../regs-ac97.h => sound/arm/pxa2xx-ac97-regs.h    |  42 +++--
 sound/arm/pxa2xx-ac97.c                            |   3 +-
 sound/soc/pxa/corgi.c                              |  43 ++++--
 sound/soc/pxa/e740_wm9705.c                        |  37 ++---
 sound/soc/pxa/e750_wm9705.c                        |  33 ++--
 sound/soc/pxa/e800_wm9712.c                        |  33 ++--
 sound/soc/pxa/em-x270.c                            |   2 +-
 sound/soc/pxa/hx4700.c                             |  37 ++---
 sound/soc/pxa/magician.c                           | 141 +++++------------
 sound/soc/pxa/mioa701_wm9713.c                     |   2 +-
 sound/soc/pxa/palm27x.c                            |   2 +-
 sound/soc/pxa/poodle.c                             |  51 +++---
 sound/soc/pxa/pxa2xx-ac97.c                        |  24 ++-
 sound/soc/pxa/pxa2xx-i2s.c                         | 112 ++++++++------
 sound/soc/pxa/spitz.c                              |  58 +++----
 sound/soc/pxa/tosa.c                               |  25 ++-
 sound/soc/pxa/z2.c                                 |   8 +-
 242 files changed, 2059 insertions(+), 2074 deletions(-)
 delete mode 100644 arch/arm/mach-mmp/tavorevb.c
 delete mode 100644 arch/arm/mach-pxa/Makefile.boot
 rename arch/arm/mach-pxa/{include/mach => }/addr-map.h (100%)
 rename drivers/pcmcia/pxa2xx_balloon3.c =>
arch/arm/mach-pxa/balloon3-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/balloon3.h (100%)
 rename drivers/pcmcia/pxa2xx_colibri.c =>
arch/arm/mach-pxa/colibri-pcmcia.c (99%)
 rename arch/arm/mach-pxa/{include/mach => }/corgi.h (100%)
 rename drivers/pcmcia/pxa2xx_e740.c => arch/arm/mach-pxa/e740-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/eseries-gpio.h (100%)
 rename drivers/pcmcia/pxa2xx_hx4700.c =>
arch/arm/mach-pxa/hx4700-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/hx4700.h (100%)
 delete mode 100644 arch/arm/mach-pxa/include/mach/bitfield.h
 delete mode 100644 arch/arm/mach-pxa/include/mach/dma.h
 delete mode 100644 arch/arm/mach-pxa/include/mach/generic.h
 delete mode 100644 arch/arm/mach-pxa/include/mach/mtd-xip.h
 delete mode 100644 arch/arm/mach-pxa/include/mach/uncompress.h
 rename arch/arm/mach-pxa/{include/mach => }/irqs.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/lubbock.h (95%)
 rename arch/arm/mach-pxa/{include/mach => }/magician.h (99%)
 rename arch/arm/mach-pxa/{include/mach => }/mainstone.h (98%)
 rename arch/arm/mach-pxa/{include/mach => }/mfp.h (91%)
 rename drivers/pcmcia/pxa2xx_palmld.c =>
arch/arm/mach-pxa/palmld-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/palmld.h (100%)
 rename drivers/pcmcia/pxa2xx_palmtc.c =>
arch/arm/mach-pxa/palmtc-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/palmtc.h (100%)
 rename drivers/pcmcia/pxa2xx_palmtx.c =>
arch/arm/mach-pxa/palmtx-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/palmtx.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/poodle.h (98%)
 create mode 100644 arch/arm/mach-pxa/pxa-regs.h
 rename arch/arm/mach-pxa/{include/mach => }/pxa2xx-regs.h (76%)
 rename arch/arm/mach-pxa/{include/mach => }/pxa3xx-regs.h (61%)
 rename arch/arm/mach-pxa/{include/mach => }/regs-ost.h (94%)
 rename arch/arm/mach-pxa/{include/mach => }/regs-uart.h (99%)
 rename arch/arm/mach-pxa/{include/mach => }/reset.h (92%)
 rename arch/arm/mach-pxa/{include/mach => }/smemc.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/spitz.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/tosa.h (88%)
 rename drivers/pcmcia/pxa2xx_trizeps4.c =>
arch/arm/mach-pxa/trizeps4-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/trizeps4.h (99%)
 rename drivers/pcmcia/pxa2xx_viper.c => arch/arm/mach-pxa/viper-pcmcia.c (97%)
 rename include/linux/platform_data/pcmcia-pxa2xx_viper.h =>
arch/arm/mach-pxa/viper-pcmcia.h (100%)
 rename drivers/pcmcia/pxa2xx_vpac270.c =>
arch/arm/mach-pxa/vpac270-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/vpac270.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/z2.h (100%)
 create mode 100644 drivers/clk/pxa/clk-pxa2xx.h
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/Kconfig (83%)
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/Makefile (51%)
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/mfp.c (99%)
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/ssp.c (100%)
 rename arch/arm/mach-pxa/include/mach/regs-lcd.h =>
drivers/video/fbdev/pxa3xx-regs.h (90%)
 create mode 100644 include/linux/clk/pxa.h
 create mode 100644 include/linux/platform_data/asoc-poodle.h
 rename arch/arm/mach-pxa/include/mach/audio.h =>
include/linux/platform_data/asoc-pxa.h (93%)
 rename arch/arm/mach-pxa/include/mach/hardware.h =>
include/linux/soc/pxa/cpu.h (75%)
 rename {arch/arm/plat-pxa/include/plat => include/linux/soc/pxa}/mfp.h (98%)
 create mode 100644 include/linux/soc/pxa/smemc.h
 create mode 100644 include/pcmcia/soc_common.h
 rename arch/arm/mach-pxa/include/mach/regs-ac97.h =>
sound/arm/pxa2xx-ac97-regs.h (71%)
