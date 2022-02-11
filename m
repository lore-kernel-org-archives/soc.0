Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12EAC433EF
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 21:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9534AC340F1; Fri, 11 Feb 2022 21:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1B1C340EE
	for <soc@kernel.org>; Fri, 11 Feb 2022 21:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644615517;
	bh=NyP/CeK6z8p2TCKZaSdvw9UDX0zRfwd04mB46bj/sL4=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=mhN+tk1YiksnYvtG8zJIrT96vB1OpOZyOFze1ptieVUMlfH/acujb8PxzsXdlpzQk
	 KBO/inYckOgezKLYOXdShMiFz/kXNR+tLPYQO+KTNYviqq/UvCx9Df4QcwkzVZWP63
	 zaZmOtUFYg4oBUZx0nzR8oYOLGss438yRsbTTHbSK46LxHK32EPvqW9v+xtA1fNEjc
	 bIEl0lBk2aJV1PqBalhe6usr1XrR9GAhUy/pZri7v9PjQ4NIunLCsWp1wcgu4I0EPb
	 Ol4ganUMn+1qaKERBJBFdygkhAQ+Kuoy2q5xPoWXkxWTbQdLbxWs/eEtqiw8zVrV/r
	 HJdZJl4LeKuwA==
Received: by mail-wm1-f49.google.com with SMTP id l67-20020a1c2546000000b00353951c3f62so7103213wml.5
        for <soc@kernel.org>; Fri, 11 Feb 2022 13:38:37 -0800 (PST)
X-Gm-Message-State: AOAM530xf/HNnVufumd+MXpdQYRAJUgews1BKru3mWQo3tq/j9c3nF6P
	VNPM3fGXBCrdiD0NGXyHXuQp3vZWe9MyGEK3Bbc=
X-Google-Smtp-Source: ABdhPJzX+5cN9D6Gc95iuyoOVlWTIAm1++zmESvKTdN3BlmPWISAAB/z/MxoqZM3o09XG4L1ZeYYsZ9iLNuQ7wxI2Go=
X-Received: by 2002:a1c:f309:: with SMTP id q9mr1831939wmq.173.1644615515771;
 Fri, 11 Feb 2022 13:38:35 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 11 Feb 2022 22:38:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2kFbS_oDP1GLeuSF9zR-DX6wk3YSJGD=2LZyLr3eO65A@mail.gmail.com>
Message-ID: <CAK8P3a2kFbS_oDP1GLeuSF9zR-DX6wk3YSJGD=2LZyLr3eO65A@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.17
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566:

  Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.17-1

for you to fetch changes up to 5e5eddd94c8906472e3904cb11b4e3ccbb99d0d4:

  Revert "arm64: dts: imx8mn-venice-gw7902: disable gpu" (2022-02-10
09:58:47 +0100)

----------------------------------------------------------------
ARM: SoC fixes for 5.17

This is a fairly large set of bugfixes, most of which had
been sent a while ago but only now made it into the soc tree:

Maintainer file updates:

 - Claudiu Beznea now co-maintains the at91 soc family,
   replacing Ludovic Desroches.

 - Michael Walle maintains the sl28cpld drivers

 - Alain Volmat and Raphael Gallais-Pou take over some
   drivers for ST platforms

 - Alim Akhtar is an additional reviewer for Samsung platforms

Code fixes:

 - Op-tee had a problem with object lifetime that needs
   a slightly complex fix, as well as another bug with
   error handling.

 - Several minor issues for the OMAP platform, including
   a regression with the timer

 - A Kconfig change to fix a build-time issue on Intel
   SoCFPGA

Device tree fixes:

 - The Amlogic Meson platform fixes a boot regression on
   am1-odroid, a spurious interrupt, and a problem with
   reserved memory regions

 - In the i.MX platform, several bug fixes are needed to
   make devices work correctly: SD card detection,
   alarmtimer, and sound card on some board. One patch
   for the GPU got in there by accident and gets reverted
   again.

 - TI K3 needs a fix for J721S2 serial port numbers

 - ux500 needs a fix to mount the SD card as root on
   the Skomer phone.

----------------------------------------------------------------
Alexander Stein (2):
      arm64: dts: freescale: Fix sound card model for MBa8Mx
      arm64: dts: imx8mq: fix lcdif port node

Alim Akhtar (1):
      MAINTAINERS: add reviewer entry for Samsung/Exynos platform

Arnd Bergmann (11):
      Merge tag 'optee-fix-for-v5.17' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'omap-for-v5.17/fixes-for-merge-window-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes
      Merge branch 'v5.17/fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/fixes
      Merge tag 'asahi-soc-maintainers-5.17' of
https://github.com/AsahiLinux/linux into arm/fixes
      Merge tag 'optee-fixes-for-v5.17' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'imx-fixes-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge tag 'samsung-fixes-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into
arm/fixes
      Merge tag 'ti-k3-dt-fixes-for-v5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/fixes
      Merge tag 'socfpga_fix_for_v5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/fixes
      Merge tag 'amlogic-fixes-v5.17-rc-v2' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/fixes
      Revert "arm64: dts: imx8mn-venice-gw7902: disable gpu"

Aswath Govindraju (2):
      arm64: dts: ti: k3-j721s2: Move aliases to board dts
      arm64: dts: ti: k3-j721s2-common-proc-board: Alias console uart to serial2

Benjamin Gaignard (1):
      MAINTAINERS: Update Benjamin Gaignard maintainer status

Chia-Wei Wang (1):
      docs/ABI: testing: aspeed-uart-routing: Escape asterisk

Christian Hewitt (3):
      arm64: dts: meson-gx: add ATF BL32 reserved-memory region
      arm64: dts: meson-g12: add ATF BL32 reserved-memory region
      arm64: dts: meson-g12: drop BL32 region from SEI510/SEI610

Christophe JAILLET (1):
      optee: Use bitmap_free() to free bitmap

Dongjin Kim (2):
      arm64: dts: meson-g12b-odroid-n2: fix typo 'dio2133'
      arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO domain for GPIOE_2

Fabio Estevam (2):
      ARM: dts: imx6qdl-udoo: Properly describe the SD card detect
      ARM: dts: imx23-evk: Remove MX23_PAD_SSP1_DETECT from hog group

Geert Uytterhoeven (1):
      arm64: Remove ARCH_VULCAN

Jae Hyun Yoo (1):
      soc: aspeed: lpc-ctrl: Block error printing on probe defer cases

Jayesh Choudhary (1):
      ARM: dts: am335x-wega: Fix typo in mcasp property rx-num-evt

Jens Wiklander (2):
      optee: add error checks in optee_ffa_do_call_with_arg()
      optee: use driver internal tee_context for some rpc

Jerome Forissier (1):
      tee: optee: do not check memref size on return from Secure World

Krzysztof Kozlowski (3):
      ARM: socfpga: fix missing RESET_CONTROLLER
      MAINTAINERS: arm: samsung: add Git tree and IRC
      MAINTAINERS: add IRC to ARM sub-architectures and Devicetree

Linus Walleij (1):
      ARM: dts: Fix boot regression on Skomer

Lutz Koschorreck (2):
      arm64: dts: meson-sm1-odroid: use correct enable-gpio pin for
tf-io regulator
      arm64: dts: meson-sm1-odroid: fix boot loop after reboot

Martin Blumenstingl (3):
      ARM: dts: meson: Fix the UART compatible strings
      ARM: dts: meson8: Fix the UART device-tree schema validation
      ARM: dts: meson8b: Fix the UART device-tree schema validation

Martin Kepplinger (2):
      arm64: dts: imx8mq: fix mipi_csi bidirectional port numbers
      arm64: dts: imx8mq-librem5: fix mipi_csi1 port number to sensor

Michael Walle (2):
      arm64: dts: ls1028a: sl28: re-enable ftm_alarm0
      MAINTAINERS: add myself as a maintainer for the sl28cpld

Philippe Cornu (1):
      MAINTAINERS: update drm/stm drm/sti and cec/sti maintainers

Rob Herring (2):
      ARM: dts: imx7ulp: Fix 'assigned-clocks-parents' typo
      ARM: dts: spear320: Drop unused and undocumented 'irq-over-gpio' property

Sam Protsenko (1):
      soc: samsung: Fix typo in CONFIG_EXYNOS_USI description

Sven Peter (1):
      MAINTAINERS: Add Apple watchdog to ARM/APPLE MACHINE SUPPORT

Tim Harvey (1):
      arm64: dts: imx8mn-venice-gw7902: disable gpu

Tony Lindgren (3):
      ARM: dts: Fix timer regression for beagleboard revision c
      clk: ti: Move dra7 clock devices out of the legacy section
      ARM: dts: Don't use legacy clock defines for dra7 clkctrl

Wan Jiabing (1):
      ARM: OMAP2+: hwmod: Add of_node_put() before break

Ye Guojin (1):
      ARM: OMAP2+: adjust the location of put_device() call in omapdss_init_of

 .../ABI/testing/sysfs-driver-aspeed-uart-routing   |  6 +-
 .../devicetree/bindings/arm/omap/omap.txt          |  3 +
 MAINTAINERS                                        | 34 +++++++-
 arch/arm/boot/dts/Makefile                         |  1 +
 arch/arm/boot/dts/am335x-wega.dtsi                 |  2 +-
 arch/arm/boot/dts/dra7.dtsi                        | 20 ++---
 arch/arm/boot/dts/imx23-evk.dts                    |  1 -
 arch/arm/boot/dts/imx6qdl-udoo.dtsi                |  5 +-
 arch/arm/boot/dts/imx7ulp.dtsi                     |  2 +-
 arch/arm/boot/dts/meson.dtsi                       |  8 +-
 arch/arm/boot/dts/meson8.dtsi                      | 24 +++---
 arch/arm/boot/dts/meson8b.dtsi                     | 24 +++---
 arch/arm/boot/dts/omap3-beagle-ab4.dts             | 47 +++++++++++
 arch/arm/boot/dts/omap3-beagle.dts                 | 33 --------
 arch/arm/boot/dts/spear320-hmi.dts                 |  1 -
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     |  4 -
 arch/arm/mach-omap2/display.c                      |  2 +-
 arch/arm/mach-omap2/omap_hwmod.c                   |  4 +-
 arch/arm/mach-socfpga/Kconfig                      |  2 +
 arch/arm64/Kconfig.platforms                       |  3 -
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  6 ++
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |  8 --
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  4 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  6 ++
 .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |  2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |  8 --
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts     |  4 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |  4 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          | 10 +--
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |  2 +-
 .../boot/dts/ti/k3-j721s2-common-proc-board.dts    | 14 +++-
 arch/arm64/boot/dts/ti/k3-j721s2.dtsi              | 22 ------
 drivers/clocksource/timer-ti-dm-systimer.c         |  2 +-
 drivers/soc/aspeed/aspeed-lpc-ctrl.c               |  7 +-
 drivers/soc/samsung/Kconfig                        |  2 +-
 drivers/tee/optee/core.c                           |  1 +
 drivers/tee/optee/ffa_abi.c                        | 92 +++++++++++++---------
 drivers/tee/optee/notif.c                          |  2 +-
 drivers/tee/optee/optee_private.h                  |  5 +-
 drivers/tee/optee/smc_abi.c                        | 58 ++++----------
 include/dt-bindings/clock/dra7.h                   | 14 ++--
 42 files changed, 263 insertions(+), 238 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap3-beagle-ab4.dts
