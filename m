Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C59C433E0
	for <soc@archiver.kernel.org>; Sun, 14 Feb 2021 22:43:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2CC3D64E29; Sun, 14 Feb 2021 22:43:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBB0F64E08
	for <soc@kernel.org>; Sun, 14 Feb 2021 22:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613342585;
	bh=DgrXOkSdzioXQadsP3IL0qdKgdhP3VlaMgZ71IKslRM=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=BXpp1IrZoBGE1YC7CuRzzwqIR3GnctvMuL8EXkrJoUqCWdo3OUUuKBYZjINlZ7mXl
	 3GTQ+y0BAUYJoj/v122hV2eV77wPZ2/9qgM6F5obsiDFdL7TgI2DOKDTtjKLFeZft+
	 eXrP7AZLfv1vkBZqPsjZdtRBuWNUYnxQxy+2HaLXxm/c/1IuTz/yuoow+qkYA/61N8
	 7POyd67Uucf7oxeW8Az80RirUalmedLKIWje2enhCOrEIZveWtNsMtwIUD6SHiJdou
	 F5z7RBKUaKFKkbCLsvBEInco1qz/Uvb9Wiyi5WAImqkEpNN8YGTALGe5f+e5QwBYmT
	 w+/TIUfmyrD8g==
Received: by mail-oo1-f52.google.com with SMTP id z36so1150531ooi.6
        for <soc@kernel.org>; Sun, 14 Feb 2021 14:43:04 -0800 (PST)
X-Gm-Message-State: AOAM533rBlzm+ZnWkf2qBsxMzhXKOtTobguAZHTCJYPsx16bj5SK1FNm
	3Etaos11r4L6JoGTqI/G3CicnDm0ym76upMfpSA=
X-Google-Smtp-Source: ABdhPJz0OH4Sccko0WX7iBbbtY4RaP8x6caCl+DKxek3qQqI6nFs9IHvqoWNdfCVobQW7Q0oINuPrIQwgFZglfJj3GY=
X-Received: by 2002:a4a:870c:: with SMTP id z12mr8903293ooh.15.1613342584179;
 Sun, 14 Feb 2021 14:43:04 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
In-Reply-To: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 14 Feb 2021 23:42:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a28_WrRo_gdgotYmexseB6ivUfGJyaF6VMF_04EEmGpxw@mail.gmail.com>
Message-ID: <CAK8P3a28_WrRo_gdgotYmexseB6ivUfGJyaF6VMF_04EEmGpxw@mail.gmail.com>
Subject: [GIT PULL 2/6] ARM SoC platform removal for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62=
:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-platform-removal-v5.12

for you to fetch changes up to ce1380c9f4bc48f6e6133ef9fc24dc9f3df500ac:

  ARM: remove u300 platform (2021-01-20 11:42:23 +0100)

----------------------------------------------------------------
SoC platform removal

There are a lot of platforms that have not seen any interesting code
changes in the past five years or more.

I made a list and asked around which ones are no longer in use [1], and
received confirmation about six ARM platforms and the TI C6x architecture
that have all reached the end of their life upstream, with no known
users remaining:

 - efm32 -- added in 2011, first Cortex-M, no notable changes after 2013
 - picoxcell -- added in 2011, abandoned after 2012 acquisition
 - prima2 -- added in 20111, no notable changes since 2015
 - tango -- added in 2015, sporadic changes until 2017, but abandoned
 - u300 -- added in 2009, no notable changes since 2013
 - zx --added in 2015 for both 32, 2017 for 64 bit, no notable changes
 - arch/c6x -- added in 2011, but work stalled soon after that

A number of other platforms on the original list turned out to still
have users. In some cases there are out-of-tree patches and users
that plan to contribute them in the future, in other cases the code
is complete and works reliably.

[1] https://lore.kernel.org/lkml/CAK8P3a2DZ8xQp7R=3DH=3DwewHnT2=3Da_=3DM53Q=
sZOueMVEf7tOZLKNg@mail.gmail.com/

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (5):
      c6x: remove architecture
      ARM: remove sirf prima2/atlas platforms
      ARM: remove zte zx platform
      ARM: remove tango platform
      ARM: remove u300 platform

Rob Herring (2):
      ARM: dts: Remove PicoXcell platforms
      ARM: Remove PicoXcell platform support

Uwe Kleine-K=C3=B6nig (2):
      ARM: drop efm32 platform
      MAINTAINERS: Remove deleted platform efm32

 Documentation/devicetree/bindings/arm/sirf.yaml    |   30 -
 Documentation/devicetree/bindings/arm/ste-u300.txt |   46 -
 .../devicetree/bindings/arm/zte,sysctrl.txt        |   30 -
 Documentation/devicetree/bindings/arm/zte.yaml     |   28 -
 Documentation/devicetree/bindings/c6x/clocks.txt   |   40 -
 Documentation/devicetree/bindings/c6x/dscr.txt     |  127 --
 Documentation/devicetree/bindings/c6x/emifa.txt    |   62 -
 Documentation/devicetree/bindings/c6x/soc.txt      |   28 -
 .../interrupt-controller/ti,c64x+megamod-pic.txt   |  103 --
 .../devicetree/bindings/reset/sirf,rstc.txt        |   42 -
 .../devicetree/bindings/reset/zte,zx2967-reset.txt |   20 -
 .../devicetree/bindings/serial/pl011.yaml          |    2 -
 .../devicetree/bindings/soc/zte/pd-2967xx.txt      |   19 -
 .../devicetree/bindings/timer/ti,c64x+timer64.txt  |   25 -
 MAINTAINERS                                        |  100 +-
 arch/arm/Kconfig                                   |   20 +-
 arch/arm/Kconfig.debug                             |   95 +-
 arch/arm/Makefile                                  |    6 -
 arch/arm/boot/dts/Makefile                         |   16 -
 arch/arm/boot/dts/atlas6-evb.dts                   |   78 -
 arch/arm/boot/dts/atlas6.dtsi                      |  800 --------
 arch/arm/boot/dts/atlas7-evb.dts                   |  127 --
 arch/arm/boot/dts/atlas7.dtsi                      | 1955 ----------------=
----
 arch/arm/boot/dts/efm32gg-dk3750.dts               |   88 -
 arch/arm/boot/dts/efm32gg.dtsi                     |  177 --
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi             |  239 ---
 arch/arm/boot/dts/picoxcell-pc3x3.dtsi             |  355 ----
 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts       |   78 -
 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts       |   84 -
 arch/arm/boot/dts/prima2-evb.dts                   |   37 -
 arch/arm/boot/dts/prima2.dtsi                      |  838 ---------
 arch/arm/boot/dts/ste-u300.dts                     |  464 -----
 arch/arm/boot/dts/tango4-common.dtsi               |  184 --
 arch/arm/boot/dts/tango4-smp8758.dtsi              |   57 -
 arch/arm/boot/dts/tango4-vantage-1172.dts          |   42 -
 arch/arm/boot/dts/zx296702-ad1.dts                 |   48 -
 arch/arm/boot/dts/zx296702.dtsi                    |  142 --
 arch/arm/configs/efm32_defconfig                   |   98 -
 arch/arm/configs/prima2_defconfig                  |   72 -
 arch/arm/configs/tango4_defconfig                  |   93 -
 arch/arm/configs/u300_defconfig                    |   65 -
 arch/arm/configs/zx_defconfig                      |  122 --
 arch/arm/include/debug/efm32.S                     |   45 -
 arch/arm/include/debug/sirf.S                      |   40 -
 arch/arm/mach-efm32/Makefile                       |    2 -
 arch/arm/mach-efm32/Makefile.boot                  |    4 -
 arch/arm/mach-efm32/dtmachine.c                    |   16 -
 arch/arm/mach-picoxcell/Kconfig                    |    9 -
 arch/arm/mach-picoxcell/Makefile                   |    2 -
 arch/arm/mach-picoxcell/common.c                   |   81 -
 arch/arm/mach-prima2/Kconfig                       |   48 -
 arch/arm/mach-prima2/Makefile                      |    9 -
 arch/arm/mach-prima2/common.c                      |   64 -
 arch/arm/mach-prima2/common.h                      |   32 -
 arch/arm/mach-prima2/headsmp.S                     |   36 -
 arch/arm/mach-prima2/hotplug.c                     |   38 -
 arch/arm/mach-prima2/platsmp.c                     |  123 --
 arch/arm/mach-prima2/pm.c                          |  153 --
 arch/arm/mach-prima2/pm.h                          |   28 -
 arch/arm/mach-prima2/rstc.c                        |  107 --
 arch/arm/mach-prima2/rtciobrg.c                    |  179 --
 arch/arm/mach-prima2/sleep.S                       |   63 -
 arch/arm/mach-tango/Kconfig                        |   13 -
 arch/arm/mach-tango/Makefile                       |    4 -
 arch/arm/mach-tango/platsmp.c                      |   52 -
 arch/arm/mach-tango/pm.c                           |   31 -
 arch/arm/mach-tango/pm.h                           |    7 -
 arch/arm/mach-tango/setup.c                        |   20 -
 arch/arm/mach-tango/smc.S                          |   12 -
 arch/arm/mach-tango/smc.h                          |    9 -
 arch/arm/mach-u300/Kconfig                         |   32 -
 arch/arm/mach-u300/Makefile                        |    8 -
 arch/arm/mach-u300/core.c                          |  413 -----
 arch/arm/mach-u300/regulator.c                     |  134 --
 arch/arm/mach-zx/Kconfig                           |   21 -
 arch/arm/mach-zx/Makefile                          |    3 -
 arch/arm/mach-zx/core.h                            |   16 -
 arch/arm/mach-zx/headsmp.S                         |   30 -
 arch/arm/mach-zx/platsmp.c                         |  186 --
 arch/arm/mach-zx/zx296702-pm-domain.c              |  202 --
 arch/arm/mach-zx/zx296702.c                        |   22 -
 arch/arm/mm/Kconfig                                |    1 -
 arch/arm64/Kconfig.platforms                       |    6 -
 arch/arm64/boot/dts/Makefile                       |    1 -
 arch/arm64/boot/dts/zte/Makefile                   |    3 -
 arch/arm64/boot/dts/zte/zx296718-evb.dts           |  144 --
 arch/arm64/boot/dts/zte/zx296718-pcbox.dts         |  143 --
 arch/arm64/boot/dts/zte/zx296718.dtsi              |  627 -------
 arch/c6x/Kconfig                                   |  113 --
 arch/c6x/Kconfig.debug                             |   10 -
 arch/c6x/Makefile                                  |   60 -
 arch/c6x/boot/Makefile                             |   11 -
 arch/c6x/boot/dts/Makefile                         |   16 -
 arch/c6x/boot/dts/dsk6455.dts                      |   57 -
 arch/c6x/boot/dts/evmc6457.dts                     |   43 -
 arch/c6x/boot/dts/evmc6472.dts                     |   68 -
 arch/c6x/boot/dts/evmc6474.dts                     |   53 -
 arch/c6x/boot/dts/evmc6678.dts                     |   78 -
 arch/c6x/boot/dts/tms320c6455.dtsi                 |   97 -
 arch/c6x/boot/dts/tms320c6457.dtsi                 |   69 -
 arch/c6x/boot/dts/tms320c6472.dtsi                 |  135 --
 arch/c6x/boot/dts/tms320c6474.dtsi                 |   90 -
 arch/c6x/boot/dts/tms320c6678.dtsi                 |  147 --
 arch/c6x/configs/dsk6455_defconfig                 |   42 -
 arch/c6x/configs/evmc6457_defconfig                |   39 -
 arch/c6x/configs/evmc6472_defconfig                |   40 -
 arch/c6x/configs/evmc6474_defconfig                |   40 -
 arch/c6x/configs/evmc6678_defconfig                |   40 -
 arch/c6x/include/asm/Kbuild                        |    5 -
 arch/c6x/include/asm/asm-offsets.h                 |    1 -
 arch/c6x/include/asm/bitops.h                      |   95 -
 arch/c6x/include/asm/bug.h                         |   20 -
 arch/c6x/include/asm/cache.h                       |   94 -
 arch/c6x/include/asm/cacheflush.h                  |   45 -
 arch/c6x/include/asm/checksum.h                    |   34 -
 arch/c6x/include/asm/clock.h                       |  145 --
 arch/c6x/include/asm/cmpxchg.h                     |   63 -
 arch/c6x/include/asm/delay.h                       |   64 -
 arch/c6x/include/asm/dscr.h                        |   30 -
 arch/c6x/include/asm/elf.h                         |  117 --
 arch/c6x/include/asm/flat.h                        |   19 -
 arch/c6x/include/asm/ftrace.h                      |    6 -
 arch/c6x/include/asm/hardirq.h                     |   17 -
 arch/c6x/include/asm/irq.h                         |   50 -
 arch/c6x/include/asm/irqflags.h                    |   68 -
 arch/c6x/include/asm/linkage.h                     |   31 -
 arch/c6x/include/asm/megamod-pic.h                 |   10 -
 arch/c6x/include/asm/mmu_context.h                 |    6 -
 arch/c6x/include/asm/module.h                      |   20 -
 arch/c6x/include/asm/page.h                        |    9 -
 arch/c6x/include/asm/pgtable.h                     |   66 -
 arch/c6x/include/asm/processor.h                   |  114 --
 arch/c6x/include/asm/procinfo.h                    |   24 -
 arch/c6x/include/asm/ptrace.h                      |   32 -
 arch/c6x/include/asm/sections.h                    |   12 -
 arch/c6x/include/asm/setup.h                       |   31 -
 arch/c6x/include/asm/soc.h                         |   35 -
 arch/c6x/include/asm/special_insns.h               |   60 -
 arch/c6x/include/asm/string.h                      |   18 -
 arch/c6x/include/asm/switch_to.h                   |   30 -
 arch/c6x/include/asm/syscall.h                     |   75 -
 arch/c6x/include/asm/syscalls.h                    |   46 -
 arch/c6x/include/asm/thread_info.h                 |   94 -
 arch/c6x/include/asm/timer64.h                     |    7 -
 arch/c6x/include/asm/timex.h                       |   30 -
 arch/c6x/include/asm/tlb.h                         |    7 -
 arch/c6x/include/asm/traps.h                       |   33 -
 arch/c6x/include/asm/uaccess.h                     |   97 -
 arch/c6x/include/asm/unaligned.h                   |  104 --
 arch/c6x/include/asm/vmalloc.h                     |    4 -
 arch/c6x/include/uapi/asm/Kbuild                   |    2 -
 arch/c6x/include/uapi/asm/byteorder.h              |   13 -
 arch/c6x/include/uapi/asm/ptrace.h                 |  164 --
 arch/c6x/include/uapi/asm/setup.h                  |    7 -
 arch/c6x/include/uapi/asm/sigcontext.h             |   81 -
 arch/c6x/include/uapi/asm/swab.h                   |   55 -
 arch/c6x/include/uapi/asm/unistd.h                 |   29 -
 arch/c6x/kernel/Makefile                           |   13 -
 arch/c6x/kernel/asm-offsets.c                      |  123 --
 arch/c6x/kernel/c6x_ksyms.c                        |   62 -
 arch/c6x/kernel/devicetree.c                       |   14 -
 arch/c6x/kernel/entry.S                            |  736 --------
 arch/c6x/kernel/head.S                             |   81 -
 arch/c6x/kernel/irq.c                              |  127 --
 arch/c6x/kernel/module.c                           |  119 --
 arch/c6x/kernel/process.c                          |  151 --
 arch/c6x/kernel/ptrace.c                           |  139 --
 arch/c6x/kernel/setup.c                            |  476 -----
 arch/c6x/kernel/signal.c                           |  322 ----
 arch/c6x/kernel/soc.c                              |   87 -
 arch/c6x/kernel/switch_to.S                        |   71 -
 arch/c6x/kernel/sys_c6x.c                          |   71 -
 arch/c6x/kernel/time.c                             |   63 -
 arch/c6x/kernel/traps.c                            |  409 ----
 arch/c6x/kernel/vectors.S                          |   78 -
 arch/c6x/kernel/vmlinux.lds.S                      |  151 --
 arch/c6x/lib/Makefile                              |    8 -
 arch/c6x/lib/checksum.c                            |   11 -
 arch/c6x/lib/csum_64plus.S                         |  414 -----
 arch/c6x/lib/divi.S                                |   41 -
 arch/c6x/lib/divremi.S                             |   34 -
 arch/c6x/lib/divremu.S                             |   75 -
 arch/c6x/lib/divu.S                                |   86 -
 arch/c6x/lib/llshl.S                               |   25 -
 arch/c6x/lib/llshr.S                               |   26 -
 arch/c6x/lib/llshru.S                              |   26 -
 arch/c6x/lib/memcpy_64plus.S                       |   43 -
 arch/c6x/lib/mpyll.S                               |   37 -
 arch/c6x/lib/negll.S                               |   19 -
 arch/c6x/lib/pop_rts.S                             |   20 -
 arch/c6x/lib/push_rts.S                            |   19 -
 arch/c6x/lib/remi.S                                |   52 -
 arch/c6x/lib/remu.S                                |   70 -
 arch/c6x/lib/strasgi.S                             |   77 -
 arch/c6x/lib/strasgi_64plus.S                      |   27 -
 arch/c6x/mm/Makefile                               |    6 -
 arch/c6x/mm/dma-coherent.c                         |  173 --
 arch/c6x/mm/init.c                                 |   65 -
 arch/c6x/platforms/Kconfig                         |   21 -
 arch/c6x/platforms/Makefile                        |   13 -
 arch/c6x/platforms/cache.c                         |  444 -----
 arch/c6x/platforms/dscr.c                          |  595 ------
 arch/c6x/platforms/emif.c                          |   84 -
 arch/c6x/platforms/megamod-pic.c                   |  344 ----
 arch/c6x/platforms/pll.c                           |  440 -----
 arch/c6x/platforms/plldata.c                       |  467 -----
 arch/c6x/platforms/timer64.c                       |  241 ---
 drivers/bus/Kconfig                                |    2 +-
 drivers/i2c/busses/Kconfig                         |    4 +-
 drivers/mtd/nand/raw/Kconfig                       |    3 +-
 drivers/reset/Kconfig                              |    2 +-
 drivers/soc/Kconfig                                |    1 -
 drivers/soc/Makefile                               |    1 -
 drivers/soc/zte/Kconfig                            |   15 -
 drivers/soc/zte/Makefile                           |    6 -
 drivers/soc/zte/zx296718_pm_domains.c              |  181 --
 drivers/soc/zte/zx2967_pm_domains.c                |  141 --
 drivers/soc/zte/zx2967_pm_domains.h                |   44 -
 drivers/spi/Kconfig                                |    1 -
 fs/Kconfig.binfmt                                  |    2 +-
 include/asm-generic/page.h                         |    4 -
 221 files changed, 11 insertions(+), 21460 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/sirf.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/ste-u300.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/zte,sysctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/zte.yaml
 delete mode 100644 Documentation/devicetree/bindings/c6x/clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/c6x/dscr.txt
 delete mode 100644 Documentation/devicetree/bindings/c6x/emifa.txt
 delete mode 100644 Documentation/devicetree/bindings/c6x/soc.txt
 delete mode 100644
Documentation/devicetree/bindings/interrupt-controller/ti,c64x+megamod-pic.=
txt
 delete mode 100644 Documentation/devicetree/bindings/reset/sirf,rstc.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/zte,zx2967-rese=
t.txt
 delete mode 100644 Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,c64x+timer64=
.txt
 delete mode 100644 arch/arm/boot/dts/atlas6-evb.dts
 delete mode 100644 arch/arm/boot/dts/atlas6.dtsi
 delete mode 100644 arch/arm/boot/dts/atlas7-evb.dts
 delete mode 100644 arch/arm/boot/dts/atlas7.dtsi
 delete mode 100644 arch/arm/boot/dts/efm32gg-dk3750.dts
 delete mode 100644 arch/arm/boot/dts/efm32gg.dtsi
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x2.dtsi
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x3.dtsi
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
 delete mode 100644 arch/arm/boot/dts/prima2-evb.dts
 delete mode 100644 arch/arm/boot/dts/prima2.dtsi
 delete mode 100644 arch/arm/boot/dts/ste-u300.dts
 delete mode 100644 arch/arm/boot/dts/tango4-common.dtsi
 delete mode 100644 arch/arm/boot/dts/tango4-smp8758.dtsi
 delete mode 100644 arch/arm/boot/dts/tango4-vantage-1172.dts
 delete mode 100644 arch/arm/boot/dts/zx296702-ad1.dts
 delete mode 100644 arch/arm/boot/dts/zx296702.dtsi
 delete mode 100644 arch/arm/configs/efm32_defconfig
 delete mode 100644 arch/arm/configs/prima2_defconfig
 delete mode 100644 arch/arm/configs/tango4_defconfig
 delete mode 100644 arch/arm/configs/u300_defconfig
 delete mode 100644 arch/arm/configs/zx_defconfig
 delete mode 100644 arch/arm/include/debug/efm32.S
 delete mode 100644 arch/arm/include/debug/sirf.S
 delete mode 100644 arch/arm/mach-efm32/Makefile
 delete mode 100644 arch/arm/mach-efm32/Makefile.boot
 delete mode 100644 arch/arm/mach-efm32/dtmachine.c
 delete mode 100644 arch/arm/mach-picoxcell/Kconfig
 delete mode 100644 arch/arm/mach-picoxcell/Makefile
 delete mode 100644 arch/arm/mach-picoxcell/common.c
 delete mode 100644 arch/arm/mach-prima2/Kconfig
 delete mode 100644 arch/arm/mach-prima2/Makefile
 delete mode 100644 arch/arm/mach-prima2/common.c
 delete mode 100644 arch/arm/mach-prima2/common.h
 delete mode 100644 arch/arm/mach-prima2/headsmp.S
 delete mode 100644 arch/arm/mach-prima2/hotplug.c
 delete mode 100644 arch/arm/mach-prima2/platsmp.c
 delete mode 100644 arch/arm/mach-prima2/pm.c
 delete mode 100644 arch/arm/mach-prima2/pm.h
 delete mode 100644 arch/arm/mach-prima2/rstc.c
 delete mode 100644 arch/arm/mach-prima2/rtciobrg.c
 delete mode 100644 arch/arm/mach-prima2/sleep.S
 delete mode 100644 arch/arm/mach-tango/Kconfig
 delete mode 100644 arch/arm/mach-tango/Makefile
 delete mode 100644 arch/arm/mach-tango/platsmp.c
 delete mode 100644 arch/arm/mach-tango/pm.c
 delete mode 100644 arch/arm/mach-tango/pm.h
 delete mode 100644 arch/arm/mach-tango/setup.c
 delete mode 100644 arch/arm/mach-tango/smc.S
 delete mode 100644 arch/arm/mach-tango/smc.h
 delete mode 100644 arch/arm/mach-u300/Kconfig
 delete mode 100644 arch/arm/mach-u300/Makefile
 delete mode 100644 arch/arm/mach-u300/core.c
 delete mode 100644 arch/arm/mach-u300/regulator.c
 delete mode 100644 arch/arm/mach-zx/Kconfig
 delete mode 100644 arch/arm/mach-zx/Makefile
 delete mode 100644 arch/arm/mach-zx/core.h
 delete mode 100644 arch/arm/mach-zx/headsmp.S
 delete mode 100644 arch/arm/mach-zx/platsmp.c
 delete mode 100644 arch/arm/mach-zx/zx296702-pm-domain.c
 delete mode 100644 arch/arm/mach-zx/zx296702.c
 delete mode 100644 arch/arm64/boot/dts/zte/Makefile
 delete mode 100644 arch/arm64/boot/dts/zte/zx296718-evb.dts
 delete mode 100644 arch/arm64/boot/dts/zte/zx296718-pcbox.dts
 delete mode 100644 arch/arm64/boot/dts/zte/zx296718.dtsi
 delete mode 100644 arch/c6x/Kconfig
 delete mode 100644 arch/c6x/Kconfig.debug
 delete mode 100644 arch/c6x/Makefile
 delete mode 100644 arch/c6x/boot/Makefile
 delete mode 100644 arch/c6x/boot/dts/Makefile
 delete mode 100644 arch/c6x/boot/dts/dsk6455.dts
 delete mode 100644 arch/c6x/boot/dts/evmc6457.dts
 delete mode 100644 arch/c6x/boot/dts/evmc6472.dts
 delete mode 100644 arch/c6x/boot/dts/evmc6474.dts
 delete mode 100644 arch/c6x/boot/dts/evmc6678.dts
 delete mode 100644 arch/c6x/boot/dts/tms320c6455.dtsi
 delete mode 100644 arch/c6x/boot/dts/tms320c6457.dtsi
 delete mode 100644 arch/c6x/boot/dts/tms320c6472.dtsi
 delete mode 100644 arch/c6x/boot/dts/tms320c6474.dtsi
 delete mode 100644 arch/c6x/boot/dts/tms320c6678.dtsi
 delete mode 100644 arch/c6x/configs/dsk6455_defconfig
 delete mode 100644 arch/c6x/configs/evmc6457_defconfig
 delete mode 100644 arch/c6x/configs/evmc6472_defconfig
 delete mode 100644 arch/c6x/configs/evmc6474_defconfig
 delete mode 100644 arch/c6x/configs/evmc6678_defconfig
 delete mode 100644 arch/c6x/include/asm/Kbuild
 delete mode 100644 arch/c6x/include/asm/asm-offsets.h
 delete mode 100644 arch/c6x/include/asm/bitops.h
 delete mode 100644 arch/c6x/include/asm/bug.h
 delete mode 100644 arch/c6x/include/asm/cache.h
 delete mode 100644 arch/c6x/include/asm/cacheflush.h
 delete mode 100644 arch/c6x/include/asm/checksum.h
 delete mode 100644 arch/c6x/include/asm/clock.h
 delete mode 100644 arch/c6x/include/asm/cmpxchg.h
 delete mode 100644 arch/c6x/include/asm/delay.h
 delete mode 100644 arch/c6x/include/asm/dscr.h
 delete mode 100644 arch/c6x/include/asm/elf.h
 delete mode 100644 arch/c6x/include/asm/flat.h
 delete mode 100644 arch/c6x/include/asm/ftrace.h
 delete mode 100644 arch/c6x/include/asm/hardirq.h
 delete mode 100644 arch/c6x/include/asm/irq.h
 delete mode 100644 arch/c6x/include/asm/irqflags.h
 delete mode 100644 arch/c6x/include/asm/linkage.h
 delete mode 100644 arch/c6x/include/asm/megamod-pic.h
 delete mode 100644 arch/c6x/include/asm/mmu_context.h
 delete mode 100644 arch/c6x/include/asm/module.h
 delete mode 100644 arch/c6x/include/asm/page.h
 delete mode 100644 arch/c6x/include/asm/pgtable.h
 delete mode 100644 arch/c6x/include/asm/processor.h
 delete mode 100644 arch/c6x/include/asm/procinfo.h
 delete mode 100644 arch/c6x/include/asm/ptrace.h
 delete mode 100644 arch/c6x/include/asm/sections.h
 delete mode 100644 arch/c6x/include/asm/setup.h
 delete mode 100644 arch/c6x/include/asm/soc.h
 delete mode 100644 arch/c6x/include/asm/special_insns.h
 delete mode 100644 arch/c6x/include/asm/string.h
 delete mode 100644 arch/c6x/include/asm/switch_to.h
 delete mode 100644 arch/c6x/include/asm/syscall.h
 delete mode 100644 arch/c6x/include/asm/syscalls.h
 delete mode 100644 arch/c6x/include/asm/thread_info.h
 delete mode 100644 arch/c6x/include/asm/timer64.h
 delete mode 100644 arch/c6x/include/asm/timex.h
 delete mode 100644 arch/c6x/include/asm/tlb.h
 delete mode 100644 arch/c6x/include/asm/traps.h
 delete mode 100644 arch/c6x/include/asm/uaccess.h
 delete mode 100644 arch/c6x/include/asm/unaligned.h
 delete mode 100644 arch/c6x/include/asm/vmalloc.h
 delete mode 100644 arch/c6x/include/uapi/asm/Kbuild
 delete mode 100644 arch/c6x/include/uapi/asm/byteorder.h
 delete mode 100644 arch/c6x/include/uapi/asm/ptrace.h
 delete mode 100644 arch/c6x/include/uapi/asm/setup.h
 delete mode 100644 arch/c6x/include/uapi/asm/sigcontext.h
 delete mode 100644 arch/c6x/include/uapi/asm/swab.h
 delete mode 100644 arch/c6x/include/uapi/asm/unistd.h
 delete mode 100644 arch/c6x/kernel/Makefile
 delete mode 100644 arch/c6x/kernel/asm-offsets.c
 delete mode 100644 arch/c6x/kernel/c6x_ksyms.c
 delete mode 100644 arch/c6x/kernel/devicetree.c
 delete mode 100644 arch/c6x/kernel/entry.S
 delete mode 100644 arch/c6x/kernel/head.S
 delete mode 100644 arch/c6x/kernel/irq.c
 delete mode 100644 arch/c6x/kernel/module.c
 delete mode 100644 arch/c6x/kernel/process.c
 delete mode 100644 arch/c6x/kernel/ptrace.c
 delete mode 100644 arch/c6x/kernel/setup.c
 delete mode 100644 arch/c6x/kernel/signal.c
 delete mode 100644 arch/c6x/kernel/soc.c
 delete mode 100644 arch/c6x/kernel/switch_to.S
 delete mode 100644 arch/c6x/kernel/sys_c6x.c
 delete mode 100644 arch/c6x/kernel/time.c
 delete mode 100644 arch/c6x/kernel/traps.c
 delete mode 100644 arch/c6x/kernel/vectors.S
 delete mode 100644 arch/c6x/kernel/vmlinux.lds.S
 delete mode 100644 arch/c6x/lib/Makefile
 delete mode 100644 arch/c6x/lib/checksum.c
 delete mode 100644 arch/c6x/lib/csum_64plus.S
 delete mode 100644 arch/c6x/lib/divi.S
 delete mode 100644 arch/c6x/lib/divremi.S
 delete mode 100644 arch/c6x/lib/divremu.S
 delete mode 100644 arch/c6x/lib/divu.S
 delete mode 100644 arch/c6x/lib/llshl.S
 delete mode 100644 arch/c6x/lib/llshr.S
 delete mode 100644 arch/c6x/lib/llshru.S
 delete mode 100644 arch/c6x/lib/memcpy_64plus.S
 delete mode 100644 arch/c6x/lib/mpyll.S
 delete mode 100644 arch/c6x/lib/negll.S
 delete mode 100644 arch/c6x/lib/pop_rts.S
 delete mode 100644 arch/c6x/lib/push_rts.S
 delete mode 100644 arch/c6x/lib/remi.S
 delete mode 100644 arch/c6x/lib/remu.S
 delete mode 100644 arch/c6x/lib/strasgi.S
 delete mode 100644 arch/c6x/lib/strasgi_64plus.S
 delete mode 100644 arch/c6x/mm/Makefile
 delete mode 100644 arch/c6x/mm/dma-coherent.c
 delete mode 100644 arch/c6x/mm/init.c
 delete mode 100644 arch/c6x/platforms/Kconfig
 delete mode 100644 arch/c6x/platforms/Makefile
 delete mode 100644 arch/c6x/platforms/cache.c
 delete mode 100644 arch/c6x/platforms/dscr.c
 delete mode 100644 arch/c6x/platforms/emif.c
 delete mode 100644 arch/c6x/platforms/megamod-pic.c
 delete mode 100644 arch/c6x/platforms/pll.c
 delete mode 100644 arch/c6x/platforms/plldata.c
 delete mode 100644 arch/c6x/platforms/timer64.c
 delete mode 100644 drivers/soc/zte/Kconfig
 delete mode 100644 drivers/soc/zte/Makefile
 delete mode 100644 drivers/soc/zte/zx296718_pm_domains.c
 delete mode 100644 drivers/soc/zte/zx2967_pm_domains.c
 delete mode 100644 drivers/soc/zte/zx2967_pm_domains.h
