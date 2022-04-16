Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B336C433F5
	for <soc@archiver.kernel.org>; Sat, 16 Apr 2022 21:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4D76C385AD; Sat, 16 Apr 2022 21:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7BAC385AA
	for <soc@kernel.org>; Sat, 16 Apr 2022 21:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650145010;
	bh=SDmz50UuaK9t5VWdOPEr3cRGRN5kFaGpdytZMIEci9U=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=gb3ZaiU0dZkqwQ1/LlQlhj7lHDBGZJSDYBCaMjjgjwOcJGi4Fw+02Vsx53jach0H2
	 koLc9yxuZ3DVIVwPF2iTNzff8Cx+cfIGKHL1/O7vKOxRz5RHTUwV6FPvqrZrRhdVLz
	 XGXHvUUUoheT+KuK/jJTaob1ggJbV1InqtbhtTuYe5l5/4gox7+ay9Ibv6SbilLh2b
	 /vGkr6frT3DePjUPVi7n5Sy3hIW8Kgn2HQEOC2OgxFdtjD3ng1SkECn9hXXfXq5bhY
	 vo7kn7h+K9f443/iYnXnwJmqFdGWf+u0JTr3E+dNuv0ulkvOFv4HITddg2EKe0lJjl
	 LXbH8iZBTIONA==
Received: by mail-wr1-f48.google.com with SMTP id q3so13804453wrj.7
        for <soc@kernel.org>; Sat, 16 Apr 2022 14:36:50 -0700 (PDT)
X-Gm-Message-State: AOAM5309igQc77fbKRltnODMCjULV2C5Q12MI7BzxlBKWlB4E99B9H29
	vmEXuj0po29LeQNpTvNB3zbgP0dz+UR3GTy9/zw=
X-Google-Smtp-Source: ABdhPJwYFUP8HsmE1+/ftpGWPx9Iq1WXxWe7mFgqh/j7JGPh0eR9vJDgowH6EXJSXPagLL3hKOvjEE29hV7+Uaxu2rU=
X-Received: by 2002:a05:6000:178c:b0:204:648:b4c4 with SMTP id
 e12-20020a056000178c00b002040648b4c4mr3374661wrg.219.1650145008946; Sat, 16
 Apr 2022 14:36:48 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 16 Apr 2022 23:36:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ZGJJCrEzg_68XJmPA_Ajk0TmfayBn2Li2J8Zau0hPNg@mail.gmail.com>
Message-ID: <CAK8P3a1ZGJJCrEzg_68XJmPA_Ajk0TmfayBn2Li2J8Zau0hPNg@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.18, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.18-2

for you to fetch changes up to 24a4351e1c04de8e580bf06cae7f3a79094fe7f0:

  ARM: config: Update Gemini defconfig (2022-04-14 22:59:24 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 5.18, part 2

There are a number of SoC bugfixes that came in since the merge window,
and more of them are already pending. This batch includes

 - A boot time regression fix for davinci that triggered on
   multi_v5_defconfig when booting any platform

 - Defconfig updates to address removed features, changed symbol
   names or dependencies, for gemini, ux500, and pxa

 - Email address changes for Krzysztof Kozlowski

 - Build warning fixes for ep93xx and iop32x

 - Devicetree warning fixes across many platforms

 - Minor bugfixes for the reset controller, memory controller
   and SCMI firmware subsystems plus the versatile-express board

----------------------------------------------------------------
Alexander Sverdlin (2):
      ep93xx: clock: Fix UAF in ep93xx_clk_register_gate()
      ep93xx: clock: Don't use plain integer as NULL pointer

Arnd Bergmann (7):
      ARM: iop32x: include iop3xx.h header where needed
      Merge tag 'scmi-fixes-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'vexpress-fixes-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'samsung-fixes-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into
arm/fixes
      Merge tag 'memory-controller-drv-fixes-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/fixes
      Merge tag 'reset-fixes-for-v5.18' of
git://git.pengutronix.de/pza/linux into arm/fixes
      Merge tag 'ux500-defconfig-soc-v5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/fixes

Cristian Marussi (2):
      firmware: arm_scmi: Remove clear channel call on the TX channel
      firmware: arm_scmi: Fix sorting of retrieved clock rates

David Heidelberg (1):
      dt-bindings: reset: document deprecated HiSilicon property

Heiner Kallweit (1):
      reset: renesas: Check return value of reset_control_deassert()

Johan Hovold (1):
      memory: renesas-rpc-if: fix platform-device leak in error path

Jonathan Cameron (1):
      arm: configs: imote2: Drop defconfig as board support dropped.

Kees Cook (1):
      ARM: vexpress/spc: Avoid negative array index when !SMP

Krzysztof Kozlowski (3):
      dt-bindings: update Krzysztof Kozlowski's email
      MAINTAINERS: update Krzysztof Kozlowski's email to Linaro
      ARM: dts: align SPI NOR node name with dtschema

Kunihiko Hayashi (1):
      dt-bindings: reset: Add parent "resets" property as optional

Li Yang (1):
      memory: fsl_ifc: populate child nodes of buses and mfd devices

Linus Walleij (4):
      ARM: config: Refresh U8500 defconfig
      ARM: config: u8500: Add some common hardware
      ARM: config: u8500: Re-enable AB8500 battery charging
      ARM: config: Update Gemini defconfig

Lv Ruyi (1):
      firmware: arm_scmi: Replace zero-length array with flexible-array member

Miaoqian Lin (1):
      memory: atmel-ebi: Fix missing of_node_put in atmel_ebi_probe

Nathan Chancellor (1):
      ARM: davinci: da850-evm: Avoid NULL pointer dereference

Rob Herring (7):
      arm: dts: at91: Fix boolean properties with values
      arm64: dts: tegra: Fix boolean properties with values
      arm: dts: imx: Fix boolean properties with values
      arm64: dts: imx: Fix imx8*-var-som touchscreen property sizes
      arm/arm64: dts: qcom: Fix boolean properties with values
      ARM: dts: Fix more boolean properties with values
      arm64: dts: qcom/sdm845-shift-axolotl: Fix boolean properties with values

Sameer Pujar (1):
      reset: tegra-bpmp: Restore Handle errors in BPMP response

Sherry Sun (1):
      dt-bindings: memory: snps,ddrc-3.80a compatible also need interrupts

Sudeep Holla (3):
      firmware: arm_scmi: Fix sparse warnings in OPTEE transport driver
      ARM: vexpress/spc: Fix kernel-doc build warning for ve_spc_cpu_in_wfi
      ARM: vexpress/spc: Fix all the kernel-doc build warnings

 .../bindings/clock/samsung,exynos-audss-clock.yaml |   2 +-
 .../bindings/clock/samsung,exynos-clock.yaml       |   2 +-
 .../bindings/clock/samsung,exynos-ext-clock.yaml   |   2 +-
 .../clock/samsung,exynos4412-isp-clock.yaml        |   2 +-
 .../bindings/clock/samsung,exynos5260-clock.yaml   |   2 +-
 .../bindings/clock/samsung,exynos5410-clock.yaml   |   2 +-
 .../bindings/clock/samsung,exynos5433-clock.yaml   |   2 +-
 .../bindings/clock/samsung,exynos7-clock.yaml      |   2 +-
 .../bindings/clock/samsung,exynos7885-clock.yaml   |   2 +-
 .../bindings/clock/samsung,exynos850-clock.yaml    |   2 +-
 .../devicetree/bindings/clock/samsung,s2mps11.yaml |   2 +-
 .../clock/samsung,s5pv210-audss-clock.yaml         |   2 +-
 .../bindings/clock/samsung,s5pv210-clock.yaml      |   2 +-
 .../devfreq/event/samsung,exynos-nocp.yaml         |   2 +-
 .../devfreq/event/samsung,exynos-ppmu.yaml         |   2 +-
 .../display/samsung/samsung,exynos-hdmi-ddc.yaml   |   2 +-
 .../display/samsung/samsung,exynos-hdmi.yaml       |   2 +-
 .../display/samsung/samsung,exynos-mixer.yaml      |   2 +-
 .../display/samsung/samsung,exynos5433-decon.yaml  |   2 +-
 .../display/samsung/samsung,exynos5433-mic.yaml    |   2 +-
 .../display/samsung/samsung,exynos7-decon.yaml     |   2 +-
 .../bindings/display/samsung/samsung,fimd.yaml     |   2 +-
 .../devicetree/bindings/extcon/maxim,max77843.yaml |   2 +-
 .../devicetree/bindings/hwmon/lltc,ltc4151.yaml    |   2 +-
 .../bindings/hwmon/microchip,mcp3021.yaml          |   2 +-
 .../devicetree/bindings/hwmon/sensirion,sht15.yaml |   2 +-
 .../devicetree/bindings/hwmon/ti,tmp102.yaml       |   2 +-
 .../devicetree/bindings/hwmon/ti,tmp108.yaml       |   2 +-
 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |   2 +-
 .../bindings/i2c/samsung,s3c2410-i2c.yaml          |   2 +-
 .../samsung,exynos4210-combiner.yaml               |   2 +-
 .../devicetree/bindings/leds/maxim,max77693.yaml   |   2 +-
 .../bindings/memory-controllers/brcm,dpfe-cpu.yaml |   2 +-
 .../ddr/jedec,lpddr2-timings.yaml                  |   2 +-
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |   2 +-
 .../ddr/jedec,lpddr3-timings.yaml                  |   2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml       |   2 +-
 .../marvell,mvebu-sdram-controller.yaml            |   2 +-
 .../qca,ath79-ddr-controller.yaml                  |   2 +-
 .../memory-controllers/renesas,h8300-bsc.yaml      |   2 +-
 .../memory-controllers/samsung,exynos5422-dmc.yaml |   2 +-
 .../memory-controllers/synopsys,ddrc-ecc.yaml      |   8 +-
 .../memory-controllers/ti,da8xx-ddrctl.yaml        |   2 +-
 .../devicetree/bindings/mfd/maxim,max14577.yaml    |   2 +-
 .../devicetree/bindings/mfd/maxim,max77686.yaml    |   2 +-
 .../devicetree/bindings/mfd/maxim,max77693.yaml    |   2 +-
 .../devicetree/bindings/mfd/maxim,max77802.yaml    |   2 +-
 .../devicetree/bindings/mfd/maxim,max77843.yaml    |   2 +-
 .../bindings/mfd/samsung,exynos5433-lpass.yaml     |   2 +-
 .../devicetree/bindings/mfd/samsung,s2mpa01.yaml   |   2 +-
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |   2 +-
 .../devicetree/bindings/mfd/samsung,s5m8767.yaml   |   2 +-
 .../devicetree/bindings/net/nfc/marvell,nci.yaml   |   2 +-
 .../devicetree/bindings/net/nfc/nxp,nci.yaml       |   2 +-
 .../devicetree/bindings/net/nfc/nxp,pn532.yaml     |   2 +-
 .../devicetree/bindings/net/nfc/nxp,pn544.yaml     |   2 +-
 .../devicetree/bindings/net/nfc/st,st-nci.yaml     |   2 +-
 .../devicetree/bindings/net/nfc/st,st21nfca.yaml   |   2 +-
 .../devicetree/bindings/net/nfc/st,st95hf.yaml     |   2 +-
 .../devicetree/bindings/net/nfc/ti,trf7970a.yaml   |   2 +-
 .../bindings/phy/samsung,dp-video-phy.yaml         |   2 +-
 .../bindings/phy/samsung,exynos-hdmi-phy.yaml      |   2 +-
 .../bindings/phy/samsung,exynos5250-sata-phy.yaml  |   2 +-
 .../bindings/phy/samsung,mipi-video-phy.yaml       |   2 +-
 .../devicetree/bindings/phy/samsung,usb2-phy.yaml  |   2 +-
 .../bindings/phy/samsung,usb3-drd-phy.yaml         |   2 +-
 .../pinctrl/samsung,pinctrl-gpio-bank.yaml         |   2 +-
 .../bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml |   2 +-
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +-
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   2 +-
 .../bindings/power/supply/maxim,max14577.yaml      |   2 +-
 .../bindings/power/supply/maxim,max77693.yaml      |   2 +-
 .../bindings/regulator/maxim,max14577.yaml         |   2 +-
 .../bindings/regulator/maxim,max77686.yaml         |   2 +-
 .../bindings/regulator/maxim,max77693.yaml         |   2 +-
 .../bindings/regulator/maxim,max77802.yaml         |   2 +-
 .../bindings/regulator/maxim,max77843.yaml         |   2 +-
 .../bindings/regulator/maxim,max8952.yaml          |   2 +-
 .../bindings/regulator/maxim,max8973.yaml          |   2 +-
 .../bindings/regulator/maxim,max8997.yaml          |   2 +-
 .../bindings/regulator/samsung,s2mpa01.yaml        |   2 +-
 .../bindings/regulator/samsung,s2mps11.yaml        |   2 +-
 .../bindings/regulator/samsung,s2mps13.yaml        |   2 +-
 .../bindings/regulator/samsung,s2mps14.yaml        |   2 +-
 .../bindings/regulator/samsung,s2mps15.yaml        |   2 +-
 .../bindings/regulator/samsung,s2mpu02.yaml        |   2 +-
 .../bindings/regulator/samsung,s5m8767.yaml        |   2 +-
 .../bindings/reset/hisilicon,hi3660-reset.yaml     |   5 +
 .../bindings/reset/socionext,uniphier-reset.yaml   |   3 +
 .../bindings/rng/samsung,exynos5250-trng.yaml      |   2 +-
 .../devicetree/bindings/rng/timeriomem_rng.yaml    |   2 +-
 .../bindings/soc/samsung/exynos-usi.yaml           |   2 +-
 .../devicetree/bindings/sound/samsung,arndale.yaml |   2 +-
 .../bindings/sound/samsung,smdk5250.yaml           |   2 +-
 .../devicetree/bindings/sound/samsung,snow.yaml    |   2 +-
 .../devicetree/bindings/sound/samsung,tm2.yaml     |   2 +-
 .../bindings/spi/samsung,spi-peripheral-props.yaml |   2 +-
 .../devicetree/bindings/spi/samsung,spi.yaml       |   2 +-
 .../bindings/thermal/samsung,exynos-thermal.yaml   |   2 +-
 .../bindings/usb/samsung,exynos-dwc3.yaml          |   2 +-
 .../bindings/usb/samsung,exynos-usb2.yaml          |   2 +-
 MAINTAINERS                                        |  36 +-
 arch/arm/boot/dts/at91-kizbox3-hs.dts              |   2 +-
 arch/arm/boot/dts/at91-kizbox3_common.dtsi         |   2 +-
 arch/arm/boot/dts/at91-sam9_l9260.dts              |   2 +-
 arch/arm/boot/dts/da850-evm.dts                    |   2 +-
 arch/arm/boot/dts/dm8168-evm.dts                   |   2 +-
 arch/arm/boot/dts/imx28-ts4600.dts                 |   2 +-
 arch/arm/boot/dts/imx6qdl-aristainetos2.dtsi       |  32 +-
 .../boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi    |   4 +-
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi   |   4 +-
 arch/arm/boot/dts/qcom-apq8064-pins.dtsi           |  12 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |   8 +-
 arch/arm/boot/dts/spear1310-evb.dts                |   2 +-
 arch/arm/boot/dts/spear1340-evb.dts                |   2 +-
 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi   |   2 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts              |   4 +-
 arch/arm/configs/gemini_defconfig                  |   5 +-
 arch/arm/configs/imote2_defconfig                  | 365 ---------------------
 arch/arm/configs/u8500_defconfig                   |  19 +-
 arch/arm/mach-davinci/board-da850-evm.c            |   4 +-
 arch/arm/mach-ep93xx/clock.c                       |   6 +-
 arch/arm/mach-iop32x/cp6.c                         |   2 +
 arch/arm/mach-vexpress/spc.c                       |  28 +-
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |   8 +-
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |   8 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |   8 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |   8 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   6 +-
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |   6 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   6 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |   8 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   8 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   4 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |   2 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   2 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   2 +-
 drivers/firmware/arm_scmi/clock.c                  |   5 +-
 drivers/firmware/arm_scmi/driver.c                 |   3 +-
 drivers/firmware/arm_scmi/optee.c                  |   8 +-
 drivers/memory/atmel-ebi.c                         |  23 +-
 drivers/memory/fsl_ifc.c                           |   3 +-
 drivers/memory/renesas-rpc-if.c                    |  10 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            |   4 +-
 drivers/reset/tegra/reset-bpmp.c                   |   9 +-
 146 files changed, 299 insertions(+), 605 deletions(-)
 delete mode 100644 arch/arm/configs/imote2_defconfig
