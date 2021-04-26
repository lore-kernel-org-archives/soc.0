Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86506C433ED
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 16:06:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0D4D361175; Mon, 26 Apr 2021 16:06:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAD4F6135B
	for <soc@kernel.org>; Mon, 26 Apr 2021 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619453173;
	bh=GkfpWcfAA7YiWXrMqYR1OVCVgeGtJ3zCtRlKOSbqqpU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lL5mqnhqa7ZQZyoCctBp6AxkZtHQ6dqP63BClUmsU0kNrFPaGgTEMEj4VFOo50HNg
	 CEgKbx3ZtoJQSGVio/HGqj3n7PX0Vyaa3YVuAcSsnuvmh22TwP9lPjo4NZSqTafTV5
	 vxRqjMTf7GUmUU6l2kjTFJuPMKykuNRTMnk7oxNjj/b9PGc1wJZWIaYDR7VZnqfGZp
	 o4H5u/JFfrincLCUxr9xuUSmVyABLD6ZhhMLTdhE2/+SYuFFkHLvTqIsl4uylyZmIm
	 qyZbQyF2SNDD9fczlSuTu2aLlIAQn+AXuJe2wilZuZBPD6zDzrgSfEV8rLsQ8Qo68F
	 Olo9xLZjLS8/Q==
Received: by mail-wr1-f52.google.com with SMTP id x5so6167169wrv.13
        for <soc@kernel.org>; Mon, 26 Apr 2021 09:06:12 -0700 (PDT)
X-Gm-Message-State: AOAM5305dd4LrEgmFGzBnPkwAVItw8AtvN0cbLMYFTRR9ZSkvkYCfixN
	TQtxeU28to4IioQmDNHZjOoq2zOwqTnbW10RjKQ=
X-Google-Smtp-Source: ABdhPJwWvjCeDBB7XGCE9lCWxIIs6XVKhx5ctgOTUVVLroVZln2LzP8JQLQEScid67yF5ukTVSBlsZEeJUYweo1WnAI=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr24478149wrg.165.1619453171328;
 Mon, 26 Apr 2021 09:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 26 Apr 2021 18:05:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a388f9iSncTW-sAdbeg3-=vc=6r0X9392puGE=FsWy=Yw@mail.gmail.com>
Message-ID: <CAK8P3a388f9iSncTW-sAdbeg3-=vc=6r0X9392puGE=FsWy=Yw@mail.gmail.com>
Subject: [GIT PULL 6/6, look out for dependencies ] ARM: platform support for
 Apple M1
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 1e28eed17697bcf343c6743f0028cc3b5dd88bf0:

  Linux 5.12-rc3 (2021-03-14 14:41:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-apple-m1-5.13

for you to fetch changes up to ea96292838397682530ac77a429974f8ff5f2df3:

  asm-generic/io.h: Unbork ioremap_np() declaration (2021-04-09 08:48:27 +0200)

----------------------------------------------------------------
ARM: platform support for Apple M1

The Apple M1 is the processor used it all current generation Apple
Macintosh computers. Support for this platform so far is rudimentary,
but it boots and can use framebuffer and serial console over a special
USB cable.

Support for several essential on-chip devices (USB, PCIe, IOMMU, NVMe)
is work in progress but was not ready in time.

A very detailed description of what works is in the merge commit
and on the AsahiLinux wiki.

Link: https://lore.kernel.org/linux-arm-kernel/bdb18e9f-fcd7-1e31-2224-19c0e5090706@marcan.st/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------

Note: this tree pulls in changes from the tty and arm64 trees as a dependency.
The diffstat below is based on on commit 847bea3d08a (Merge remote-tracking
branch 'arm64/for-next/fiq'), and is what  you should see when you
pull those two first.

There is also a small Makefile conflict against the irqchip branch of
the tip tree.

----------------------------------------------------------------
Arnd Bergmann (3):
      docs: driver-api: device-io: Document I/O access functions
      Merge branch 'apple/m1-dependency' into arm/apple-m1
      Merge tag 'm1-soc-bringup-v5' of
https://github.com/AsahiLinux/linux into arm/apple-m1

Hector Martin (18):
      dt-bindings: vendor-prefixes: Add apple prefix
      dt-bindings: arm: apple: Add bindings for Apple ARM platforms
      dt-bindings: arm: cpus: Add apple,firestorm & icestorm compatibles
      arm64: cputype: Add CPU implementor & types for the Apple M1 cores
      dt-bindings: timer: arm,arch_timer: Add interrupt-names support
      arm64: arch_timer: Implement support for interrupt-names
      asm-generic/io.h:  Add a non-posted variant of ioremap()
      docs: driver-api: device-io: Document ioremap() variants & access funcs
      arm64: Implement ioremap_np() to map MMIO as nGnRnE
      asm-generic/io.h: implement pci_remap_cfgspace using ioremap_np
      of/address: Add infrastructure to declare MMIO as non-posted
      arm64: Move ICH_ sysreg bits from arm-gic-v3.h to sysreg.h
      dt-bindings: interrupt-controller: Add DT bindings for apple-aic
      irqchip/apple-aic: Add support for the Apple Interrupt Controller
      arm64: Kconfig: Introduce CONFIG_ARCH_APPLE
      dt-bindings: display: Add apple,simple-framebuffer
      arm64: apple: Add initial Apple Mac mini (M1, 2020) devicetree
      asm-generic/io.h: Unbork ioremap_np() declaration

 Documentation/devicetree/bindings/arm/apple.yaml   |  64 ++
 Documentation/devicetree/bindings/arm/cpus.yaml    |   2 +
 .../bindings/display/simple-framebuffer.yaml       |   5 +
 .../bindings/interrupt-controller/apple,aic.yaml   |  88 +++
 .../devicetree/bindings/timer/arm,arch_timer.yaml  |  19 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/driver-api/device-io.rst             | 356 +++++++++
 Documentation/driver-api/driver-model/devres.rst   |   1 +
 MAINTAINERS                                        |  14 +
 arch/arm64/Kconfig.platforms                       |   7 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/apple/Makefile                 |   2 +
 arch/arm64/boot/dts/apple/t8103-j274.dts           |  45 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               | 135 ++++
 arch/arm64/configs/defconfig                       |   1 +
 arch/arm64/include/asm/cputype.h                   |   6 +
 arch/arm64/include/asm/io.h                        |  11 +-
 arch/arm64/include/asm/sysreg.h                    |  60 ++
 arch/sparc/include/asm/io_64.h                     |   4 +
 drivers/clocksource/arm_arch_timer.c               |  24 +-
 drivers/irqchip/Kconfig                            |   8 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-apple-aic.c                    | 852 +++++++++++++++++++++
 drivers/of/address.c                               |  43 +-
 include/asm-generic/io.h                           |  21 +-
 include/asm-generic/iomap.h                        |   9 +
 include/clocksource/arm_arch_timer.h               |   1 +
 .../dt-bindings/interrupt-controller/apple-aic.h   |  15 +
 include/linux/cpuhotplug.h                         |   1 +
 include/linux/io.h                                 |  18 +-
 include/linux/ioport.h                             |   1 +
 include/linux/irqchip/arm-gic-v3.h                 |  56 --
 lib/devres.c                                       |  22 +
 33 files changed, 1815 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/apple.yaml
 create mode 100644
Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
 create mode 100644 arch/arm64/boot/dts/apple/Makefile
 create mode 100644 arch/arm64/boot/dts/apple/t8103-j274.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8103.dtsi
 create mode 100644 drivers/irqchip/irq-apple-aic.c
 create mode 100644 include/dt-bindings/interrupt-controller/apple-aic.h
