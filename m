Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCDDC19F2C
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68111C433D7; Tue,  2 Aug 2022 14:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453E5C433C1;
	Tue,  2 Aug 2022 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659448933;
	bh=vXYjuQDDkyUWPUHA4f5PfzGkYP9NY7bvoT0riPh4azU=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=E/+TdDvSyfDQamCcaj3O8gj3gXeSD4mNC66XiiNorIlypfGblSjEix4C9x7QUr3u/
	 /T/s1ATByoXPG0Ih2S9vzZitc8BYa5Kwm8SXV+rf+Nd/Oi+dHRCzDecUbMCyezVK5Z
	 vxQHQT+bQ+KEkCCLMxi2hrMFdGp4YeRrrwLMXhAvhLnzmjdViBsQY2CFVDhfMvhG/x
	 0ytPoxrIx/YYiea59WotIcTUSoQns+MiiSEWcwkEkHcrV/aF8l8y2q3/KmHvfQKpzR
	 E4WqaS01JPObyYmIhwuh6mYWhoTVPv2l0LRJdZdPbvNync0z0ghgOha+Q49LhY4kaS
	 ZEeF/uPnKU6ow==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: new SoC support for 6.0
Date: Tue,  2 Aug 2022 16:01:59 +0200
Message-Id: <20220802140200.3987874-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220802140200.3987874-1-arnd@kernel.org>
References: <20220802140200.3987874-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-newsoc-6.0

for you to fetch changes up to bccd70a73db2061fc849928ad20a424afbaf3a45:

  MAINTAINERS: rectify entry for ARM/NUVOTON NPCM ARCHITECTURE (2022-07-22 14:59:23 +0200)

----------------------------------------------------------------
ARM: new SoC support for 6.0

This adds initial support for two SoC families that have been under
review for a while. In both cases, the origonal idea was to have a
minimally functional version, but we ended up leaving out the clk drivers
that are still under review and will be merged through the corresponding
subsystem tree.

The Nuvoton NPCM8xx is a 64-bit Baseboard Management Controller and
based on the 32-bit NPCM7xx family but is now getting added to
arch/arm64 as well.

Sunplus SP7021, also known as Plus1, is a general-purpose
System-in-Package design based on the 32-bit Cortex-A7 SoC
on the main chip, plus an I/O chip and memory in the same

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge branch 'sunplus/newsoc' into arm/newsoc
      Merge branch 'nuvoton/newsoc' into arm/newsoc

Lukas Bulwahn (1):
      MAINTAINERS: rectify entry for ARM/NUVOTON NPCM ARCHITECTURE

Qin Jian (9):
      dt-bindings: arm: sunplus: Add bindings for Sunplus SP7021 SoC boards
      dt-bindings: reset: Add bindings for SP7021 reset driver
      reset: Add Sunplus SP7021 reset driver
      dt-bindings: clock: Add bindings for SP7021 clock driver
      dt-bindings: interrupt-controller: Add bindings for SP7021 interrupt controller
      irqchip: Add Sunplus SP7021 interrupt controller driver
      ARM: sunplus: Add initial support for Sunplus SP7021 SoC
      ARM: sp7021_defconfig: Add Sunplus SP7021 defconfig
      ARM: dts: Add Sunplus SP7021-Demo-V3 board device tree

Tomer Maimon (15):
      dt-bindings: timer: npcm: Add npcm845 compatible string
      dt-bindings: watchdog: npcm: Add npcm845 compatible string
      dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock
      dt-bindings: reset: npcm: add GCR syscon property
      ARM: dts: nuvoton: add reset syscon property
      reset: npcm: using syscon instead of device data
      dt-bindings: reset: npcm: Add support for NPCM8XX
      reset: npcm: Add NPCM8XX support
      dt-bindings: arm: npcm: Add maintainer
      dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string
      dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR compatible string
      arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC
      arm64: dts: nuvoton: Add initial NPCM8XX device tree
      arm64: dts: nuvoton: Add initial NPCM845 EVB device tree
      arm64: defconfig: Add Nuvoton NPCM family support

 .../devicetree/bindings/arm/npcm/npcm.yaml         |   7 +
 .../devicetree/bindings/arm/npcm/nuvoton,gcr.yaml  |   2 +
 .../devicetree/bindings/arm/sunplus,sp7021.yaml    |  29 ++
 .../bindings/clock/nuvoton,npcm845-clk.yaml        |  49 ++++
 .../bindings/clock/sunplus,sp7021-clkc.yaml        |  52 ++++
 .../interrupt-controller/sunplus,sp7021-intc.yaml  |  62 +++++
 .../bindings/reset/nuvoton,npcm750-reset.yaml      |  10 +-
 .../devicetree/bindings/reset/sunplus,reset.yaml   |  38 +++
 .../bindings/timer/nuvoton,npcm7xx-timer.yaml      |   2 +
 .../bindings/watchdog/nuvoton,npcm-wdt.txt         |   3 +-
 MAINTAINERS                                        |  19 ++
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi      |   1 +
 arch/arm/boot/dts/sunplus-sp7021-achip.dtsi        |  84 ++++++
 arch/arm/boot/dts/sunplus-sp7021-demo-v3.dts       |  30 ++
 arch/arm/boot/dts/sunplus-sp7021.dtsi              | 310 +++++++++++++++++++++
 arch/arm/configs/multi_v7_defconfig                |   1 +
 arch/arm/configs/sp7021_defconfig                  |  59 ++++
 arch/arm/mach-sunplus/Kconfig                      |  27 ++
 arch/arm/mach-sunplus/Makefile                     |   8 +
 arch/arm/mach-sunplus/sp7021.c                     |  16 ++
 arch/arm64/Kconfig.platforms                       |  11 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/nuvoton/Makefile               |   2 +
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 170 +++++++++++
 .../arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts |  30 ++
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi   |  76 +++++
 arch/arm64/configs/defconfig                       |   3 +
 drivers/irqchip/Kconfig                            |   9 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-sp7021-intc.c                  | 278 ++++++++++++++++++
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-npcm.c                         | 207 +++++++++++---
 drivers/reset/reset-sunplus.c                      | 212 ++++++++++++++
 include/dt-bindings/clock/nuvoton,npcm845-clk.h    |  49 ++++
 include/dt-bindings/clock/sunplus,sp7021-clkc.h    |  88 ++++++
 include/dt-bindings/reset/sunplus,sp7021-reset.h   |  87 ++++++
 40 files changed, 2012 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/sunplus,sp7021-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sunplus,sp7021-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/sunplus,reset.yaml
 create mode 100644 arch/arm/boot/dts/sunplus-sp7021-achip.dtsi
 create mode 100644 arch/arm/boot/dts/sunplus-sp7021-demo-v3.dts
 create mode 100644 arch/arm/boot/dts/sunplus-sp7021.dtsi
 create mode 100644 arch/arm/configs/sp7021_defconfig
 create mode 100644 arch/arm/mach-sunplus/Kconfig
 create mode 100644 arch/arm/mach-sunplus/Makefile
 create mode 100644 arch/arm/mach-sunplus/sp7021.c
 create mode 100644 arch/arm64/boot/dts/nuvoton/Makefile
 create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
 create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
 create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
 create mode 100644 drivers/irqchip/irq-sp7021-intc.c
 create mode 100644 drivers/reset/reset-sunplus.c
 create mode 100644 include/dt-bindings/clock/nuvoton,npcm845-clk.h
 create mode 100644 include/dt-bindings/clock/sunplus,sp7021-clkc.h
 create mode 100644 include/dt-bindings/reset/sunplus,sp7021-reset.h
