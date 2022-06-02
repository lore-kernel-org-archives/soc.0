Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F32C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 21:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07346C341C4; Thu,  2 Jun 2022 21:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6310C34115
	for <soc@kernel.org>; Thu,  2 Jun 2022 21:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654205741;
	bh=DTF8v0sBUG9+OxywcOnbFy3s555Skqd9Abw5AiRcVUE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=syr3bxyTPCx/L/mwo2e9OD8kBKnDKrgknuIotC2qa8osUkuE3zar7VXbjg+WJ0wRN
	 Nrfx1rJG8TE9+j8ygTZqXgFzy9FVm8opx5ior4ctRCpNPTx82w6IkIJzdvcmDG8Vt/
	 4tHN4+l3ED1GqRRs2i4e6FJKw+qPURZQbP5Q6KpcbhfX5PP/+TUc3DqKPCrCgozA1M
	 7hGLhKABQjcZfHIS6BvcnfHc4x5FzS/UqHjlWISUi3BBfrzT9Yfp1nMm0tHp7pqgPn
	 AD7FATU52WKoINpmVhqNJkZcfGZcKeO0BsuPHTv3/I4MJT3HR+J3qYbX5m5xT/HgLj
	 e0FB42Ul5sGdg==
Received: by mail-yb1-f169.google.com with SMTP id r82so10542030ybc.13
        for <soc@kernel.org>; Thu, 02 Jun 2022 14:35:41 -0700 (PDT)
X-Gm-Message-State: AOAM533Vn3CFPe/17+zauTjcncdnR5LW3Q/Ijqfq/qPOBIWZ2z8Dwy5E
	wixOPPJ+D/aLcGsCs5hqrIfQR/XGnTdiAe1yafE=
X-Google-Smtp-Source: ABdhPJxxMsubt13N0LIzKkQAhjBWVKWJQ/Ns2rqU3mkwBaqoWtn7ARPcNP8PDT0rsuoYn4tWxiwgstJ81TfyfXQ8xdM=
X-Received: by 2002:a25:db8a:0:b0:65c:b04a:f612 with SMTP id
 g132-20020a25db8a000000b0065cb04af612mr7472420ybf.106.1654205740910; Thu, 02
 Jun 2022 14:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
In-Reply-To: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 2 Jun 2022 23:35:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0sR64MTxVBGBsUputmjbeUJmia6oieCTXoJ4Hb3-rt4w@mail.gmail.com>
Message-ID: <CAK8P3a0sR64MTxVBGBsUputmjbeUJmia6oieCTXoJ4Hb3-rt4w@mail.gmail.com>
Subject: [GIT PULL 2/2] ARM: SoC changes, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 16477cdfefdb494235a675cc80563d736991d833=
:

  Merge tag 'asm-generic-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic
(2022-05-26 10:50:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-late-5=
.19

for you to fetch changes up to 9c76d723edd4f4d7d10b33e7e56f72ecbe6cee34:

  Merge tag 'optee-warning-for-v5.19' of
https://git.linaro.org/people/jens.wiklander/linux-tee into arm/late
(2022-05-30 14:44:27 +0200)

----------------------------------------------------------------
ARM: SoC changes, part 2

This is the second part of the general SoC updates, containing
everything that did not make it in the initial pull request,
or that came in as a bugfix later.

 - Devicetree updates for SoCFPGA, ASPEED, AT91 and Rockchip, including
   a new machine using an ASPEED BMC.

 - More DT fixes from Krzysztof Kozlowski across platforms

 - A new SoC platform for the GXP baseboard management controller,
   used in current server products from HPE.

----------------------------------------------------------------
Alexander Sverdlin (1):
      ARM: ep93xx: Make ts72xx_register_flash() static

Arnd Bergmann (9):
      Merge branch 'hpe/gxp-soc' into arm/late
      Merge tag 'at91-soc-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/late
      Merge tag 'at91-dt-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/late
      Merge tag 'v5.19-rockchip-drivers2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/late
      Merge tag 'v5.19-rockchip-dts32-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/late
      Merge tag 'v5.19-rockchip-dts64-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/late
      Merge tag 'aspeed-5.19-devicetree' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/late
      Merge tag 'socfpga_dts_updates_for_v5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/late
      Merge tag 'optee-warning-for-v5.19' of
https://git.linaro.org/people/jens.wiklander/linux-tee into arm/late

Brandon Wyman (1):
      ARM: dts: aspeed: everest, rainier: Add power-ffs-sync-history GPIO

Codrin Ciubotariu (2):
      ARM: dts: at91: sama7g5: add nodes for PDMC
      ARM: dts: at91: sama7g5ek: add node for PDMC0

C=C3=A9dric Le Goater (2):
      ARM: dts: aspeed: Adjust "reg" property of FMC/SPI controllers
      ARM: dts: aspeed: Enable Dual SPI RX transfers

Dinh Nguyen (1):
      dt-bindings: gpio: altera: correct interrupt-cells

Genjian Zhang (1):
      ep93xx: clock: Do not return the address of the freed memory

Graeme Gregory (1):
      ARM: dts: aspeed: Add Nuvia DC-SCM BMC

Howard Chiu (3):
      ARM: dts: aspeed: ast2600-evb: Enable RX delay for MAC0/MAC1
      ARM: dts: aspeed: ast2600-evb: Enable video engine
      ARM: dts: aspeed: ast2600-evb: Enable virtual hub

Joel Stanley (2):
      ARM: dts: aspeed: Add GFX node to AST2600
      ARM: dts: aspeed: ast2600-evb: Enable GFX device

Johan Jonker (8):
      ARM: dts: rockchip: add clocks property to cru node rv1108
      ARM: dts: rockchip: Remove "amba" bus nodes from rv1108
      ARM: dts: rockchip: add clocks property to cru node rk3288
      ARM: dts: rockchip: add clocks property to cru node rk3066a/rk3188
      ARM: dts: rockchip: add clocks property to cru node rk3036
      ARM: dts: rockchip: add clocks property to cru node rk3228
      arm64: dts: rockchip: add clocks property to cru node rk3308
      arm64: dts: rockchip: add clocks property to cru node rk3368

Krzysztof Kozlowski (4):
      ARM: dts: socfpga: align SPI NOR node name with dtschema
      ARM: dts: pxa: use new 'dma-channels/requests' properties
      ARM: dts: da850: use new 'dma-channels' property
      arm64: dts: sprd: use new 'dma-channels' property

Linus Walleij (2):
      soc: ixp4xx/qmgr: Fix unused match warning
      tee: optee: Pass a pointer to virt_addr_valid()

Mark Brown (1):
      ARM: configs: Enable more audio support for i.MX

Matthew Gerlach (3):
      dt-bindings: soc: add bindings for Intel HPS Copy Engine
      dt-bindings: intel: add binding for Intel n6000
      arm64: dts: intel: add device tree for n6000

Miaoqian Lin (1):
      soc: rockchip: Fix refcount leak in rockchip_grf_init

Michael Walle (1):
      ARM: configs: enable support for Kontron KSwitch D10

Neal Liu (1):
      ARM: dts: aspeed: Add USB2.0 device controller node

Nick Hawkins (8):
      ARM: hpe: Introduce the HPE GXP architecture
      ARM: configs: multi_v7_defconfig: Add HPE GXP ARCH
      watchdog: hpe-wdt: Introduce HPE GXP Watchdog
      clocksource/drivers/timer-gxp: Add HPE GXP Timer
      dt-bindings: timer: hpe,gxp-timer: Add HPE GXP Timer and Watchdog
      dt-bindings: arm: hpe: add GXP Support
      ARM: dts: Introduce HPE GXP Device tree
      MAINTAINERS: Introduce HPE GXP Architecture

Peter Geis (2):
      arm64: dts: rockchip: add clocks to rk356x cru
      arm64: dts: rockchip: rename Quartz64-A bluetooth gpios

Potin Lai (7):
      ARM: dts: aspeed: bletchley: enable ehci0 device node
      ARM: dts: aspeed: bletchley: switch spi2 driver to aspeed-smc
      ARM: dts: aspeed: bletchley: Enable mdio0 bus
      ARM: dts: aspeed: bletchley: update gpio0 line names
      ARM: dts: aspeed: bletchley: add pca9536 node on each sled
      ARM: dts: aspeed: bletchley: add eeprom node on each sled
      ARM: dts: aspeed: bletchley: add sample averaging for ADM1278

Sergiu Moga (2):
      ARM: dts: at91: Add the required 'atmel, rtt-rtc-time-reg' property
      ARM: dts: at91: Use the generic "rtc" node name for the rtt IPs

Tao Ren (1):
      ARM: dts: aspeed-g4: Set spi-max-frequency for all flashes

YueHaibing (1):
      ARM: at91: pm: Fix rand build error

 Documentation/devicetree/bindings/arm/hpe,gxp.yaml |  27 +++
 .../devicetree/bindings/arm/intel,socfpga.yaml     |   1 +
 .../devicetree/bindings/gpio/gpio-altera.txt       |   5 +-
 .../bindings/soc/intel/intel,hps-copy-engine.yaml  |  51 +++++
 .../devicetree/bindings/timer/hpe,gxp-timer.yaml   |  47 +++++
 MAINTAINERS                                        |  12 ++
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   3 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts           |  39 +++-
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 182 ++++++++++++++---=
-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |   2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |   2 +-
 arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts      | 190 +++++++++++++++++=
++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  16 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  16 +-
 arch/arm/boot/dts/aspeed-g6.dtsi                   |  38 +++-
 arch/arm/boot/dts/at91-sama7g5ek.dts               |  21 ++-
 arch/arm/boot/dts/at91sam9261ek.dts                |   4 +
 arch/arm/boot/dts/at91sam9263ek.dts                |   4 +
 arch/arm/boot/dts/at91sam9rlek.dts                 |   4 +
 arch/arm/boot/dts/da850.dtsi                       |   2 +
 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts           |  26 +++
 arch/arm/boot/dts/hpe-gxp.dtsi                     | 127 +++++++++++++
 arch/arm/boot/dts/mmp2.dtsi                        |   2 +
 arch/arm/boot/dts/pxa25x.dtsi                      |   5 +-
 arch/arm/boot/dts/pxa27x.dtsi                      |   5 +-
 arch/arm/boot/dts/pxa3xx.dtsi                      |   5 +-
 arch/arm/boot/dts/rk3036.dtsi                      |   2 +
 arch/arm/boot/dts/rk3066a.dtsi                     |   3 +-
 arch/arm/boot/dts/rk3188.dtsi                      |   3 +-
 arch/arm/boot/dts/rk322x.dtsi                      |   2 +
 arch/arm/boot/dts/rk3288.dtsi                      |   2 +
 arch/arm/boot/dts/rv1108.dtsi                      |  31 ++-
 arch/arm/boot/dts/sam9x60.dtsi                     |   2 +-
 arch/arm/boot/dts/sama7g5.dtsi                     |  26 ++-
 arch/arm/boot/dts/socfpga_arria10_socdk_qspi.dts   |   2 +-
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       |   2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sodia.dts       |   2 +-
 arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts |   4 +-
 arch/arm/configs/multi_v7_defconfig                |  16 ++
 arch/arm/mach-at91/Kconfig                         |   2 +-
 arch/arm/mach-ep93xx/clock.c                       |  10 +-
 arch/arm/mach-ep93xx/ts72xx.c                      |   2 +-
 arch/arm/mach-hpe/Kconfig                          |  23 +++
 arch/arm/mach-hpe/Makefile                         |   1 +
 arch/arm/mach-hpe/gxp.c                            |  16 ++
 arch/arm64/boot/dts/intel/Makefile                 |   3 +-
 arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts |  66 +++++++
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |   5 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   2 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |   4 +-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |   2 +
 arch/arm64/boot/dts/sprd/whale2.dtsi               |   4 +
 drivers/clocksource/Kconfig                        |   8 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-gxp.c                    | 209 +++++++++++++++++=
++++
 drivers/soc/ixp4xx/ixp4xx-qmgr.c                   |   2 +-
 drivers/soc/rockchip/grf.c                         |   2 +
 drivers/tee/optee/call.c                           |   2 +-
 drivers/watchdog/Kconfig                           |  11 ++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/gxp-wdt.c                         | 174 +++++++++++++++++
 63 files changed, 1385 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/hpe,gxp.yaml
 create mode 100644
Documentation/devicetree/bindings/soc/intel/intel,hps-copy-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/hpe,gxp-timer.y=
aml
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
 create mode 100644 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
 create mode 100644 arch/arm/boot/dts/hpe-gxp.dtsi
 create mode 100644 arch/arm/mach-hpe/Kconfig
 create mode 100644 arch/arm/mach-hpe/Makefile
 create mode 100644 arch/arm/mach-hpe/gxp.c
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts
 create mode 100644 drivers/clocksource/timer-gxp.c
 create mode 100644 drivers/watchdog/gxp-wdt.c
