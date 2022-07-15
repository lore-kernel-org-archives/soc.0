Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D2BC43334
	for <soc@archiver.kernel.org>; Fri, 15 Jul 2022 12:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B5D0C341CA; Fri, 15 Jul 2022 12:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98B7C3411E
	for <soc@kernel.org>; Fri, 15 Jul 2022 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657888148;
	bh=rQqgK5CPHSffhcNqLFwvkwfk9rH0xelDO4b32bO+s98=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=ImquOw9Bo+4TxubTi+3WINhOg3W+EZkpwar2NZzpVEYStIa9HJ1nJHrbxermFQ4QG
	 cM4V/fbQgtrQQxEQgqykU1OU3Cy7sBA9f4vsC7pVrenL+Q8RYW7tHdjE1TFfJTm/Ba
	 gbn60B+dk0NrJdk++0MpQ05Ud7Hy74RV+DWAp4aU6yxs3RrqaHWk4ykRV1/dHVsp8V
	 KK1m2Tlhvy4ZbdRNb43ZDeM/8nH9GWeHskyEq4M4G7BtwWkuGbV6ns0JthdzgYlY9A
	 WUMCvZ0GcCn92ssqczOdW4aJp5Nkuv7USsk/CTy5y+AS+nWz4P+u79ODp3ccuGqDL3
	 arxfE+oHA2+xw==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-31c8a1e9e33so45341257b3.5
        for <soc@kernel.org>; Fri, 15 Jul 2022 05:29:08 -0700 (PDT)
X-Gm-Message-State: AJIora819ocBlK+B85KRz8GTt4HQbkqgxTt8wjLEk1HcXmVNVyU9z8Bl
	f4YdnvFqQezw5KaGY1uH6/KLJDmCq0o5HJTIZcw=
X-Google-Smtp-Source: AGRyM1sYEgA7yLT7SmpD1AadquEiZ2+pB2PDFnHOgeDNc1aE1PH6S1lNfYNqG/XrRl9JY8/w29fQqmY1cUy+Nmn7g84=
X-Received: by 2002:a81:d93:0:b0:31c:d32d:4d76 with SMTP id
 141-20020a810d93000000b0031cd32d4d76mr16517070ywn.135.1657888147902; Fri, 15
 Jul 2022 05:29:07 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jul 2022 14:28:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3jSNJfJxkbqJ4Bfa0bkhNsF0CY+bGJMGKJOaFPm_Me5A@mail.gmail.com>
Message-ID: <CAK8P3a3jSNJfJxkbqJ4Bfa0bkhNsF0CY+bGJMGKJOaFPm_Me5A@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.19, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.19-3

for you to fetch changes up to d332a1f6b4c4b07bf984f04df897818c7c7fce8f:

  Merge tag 'qcom-dts-fixes-for-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes (2022-07-13 09:37:20 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 5.19, part 3

Most of the contents are bug fixes for the devicetree files:

 - A Qualcomm MSM8974 pin controller regression, caused by a cleanup
   patch that gets partially reverted here.

 - Missing properties for Broadcom BCM49xx to fix timer detection and
   SMP boot.

 - Fix touchscreen pinctrl for imx6ull-colibri board

 - Multiple fixes for Rockchip rk3399 based machines including the
   vdu clock-rate fix, otg port fix on Quartz64-A and ethernet
   on Quartz64-B

 - Fixes for misspelled DT contents causing minor problems on
   imx6qdl-ts7970m, orangepi-zero, sama5d2, kontron-kswitch-d10,
   and ls1028a

And a couple of changes elsewhere:

 - Fix binding for Allwinner D1 display pipeline

 - Trivial code fixes to the TEE and reset controller driver subsystems
   and the rockchip platform code.

 - Multiple updates to the MAINTAINERS files, marking the Palm Treo
   support as orphaned, and fixing some entries for added or changed
   file names.

----------------------------------------------------------------
Arnd Bergmann (16):
      Merge tag 'at91-fixes-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/fixes
      Merge tag 'imx-fixes-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge tag 'scmi-fixes-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'amlogic-arm-for-v5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/fixes
      Merge tag 'qcom-arm64-fixes-for-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes
      Merge tag 'stm32-dt-for-v5.19-fixes-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into
arm/fixes
      Merge tag 'v5.19-rockchip-dtsfixes1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/fixes
      Merge tag 'v5.19-rockchip-socfixes1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/fixes
      Merge tag 'reset-fixes-for-v5.19' of
git://git.pengutronix.de/pza/linux into arm/fixes
      Merge tag 'tee-fixes-for-v5.19' of
https://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'at91-fixes-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/fixes
      Merge tag 'sunxi-fixes-for-5.19-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/fixes
      Merge tag 'sunxi-fixes-for-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/fixes
      Merge tag 'imx-fixes-5.19-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge tag 'arm-soc/for-5.19/devicetree-arm64-fixes' of
https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'qcom-dts-fixes-for-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes

Bill Wendling (1):
      soc: qcom: smem: use correct format characters

Bo Liu (1):
      firmware: arm_scmi: Remove usage of the deprecated ida_simple_xxx API

Brian Norris (1):
      arm64: dts: rockchip: Assign RK3399 VDU clock rate

Claudiu Beznea (3):
      ARM: at91: pm: use proper compatible for sama5d2's rtc
      ARM: at91: pm: use proper compatibles for sam9x60's rtc and rtt
      ARM: at91: pm: use proper compatibles for sama7g5's rtc and rtt

Conor Dooley (1):
      MAINTAINERS: add polarfire rng, pci and clock drivers

Cristian Marussi (1):
      firmware: arm_scmi: Relax CLOCK_DESCRIBE_RATES out-of-spec checks

Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8450 add ITS device tree node
      arm64: dts: qcom: sdm845: use dispcc AHB clock for mdss node

Etienne Carriere (1):
      ARM: dts: stm32: fix pwr regulators references to use scmi

Eugen Hristev (2):
      ARM: dts: at91: sam9x60ek: fix eeprom compatible and size
      ARM: dts: at91: sama5d2_icp: fix eeprom compatibles

Fabio Estevam (3):
      ARM: dts: imx7d-smegw01: Fix the SDIO description
      ARM: mxs_defconfig: Enable the framebuffer
      ARM: at91: pm: Mark at91_pm_secure_init as __init

Fabrice Gasnier (1):
      ARM: dts: stm32: add missing usbh clock and fix clk order on stm32mp15

Gabriel Fernandez (3):
      ARM: dts: stm32: use the correct clock source for CEC on stm32mp151
      ARM: dts: stm32: DSI should use LSE SCMI clock on DK1/ED1 STM32 board
      ARM: dts: stm32: delete fixed clock node on STM32MP15-SCMI

Jiang Jian (1):
      optee: Remove duplicate 'of' in two places.

Konrad Dybcio (2):
      arm64: dts: qcom: msm8994: Fix CPU6/7 reg values
      MAINTAINERS: Add myself as a reviewer for Qualcomm ARM/64 support

Kris Bahnsen (1):
      ARM: dts: imx6qdl-ts7970: Fix ngpio typo and count

Liang He (1):
      ARM: rockchip: Add missing of_node_put() in rockchip_suspend_init()

Linus Walleij (1):
      soc: ixp4xx/npe: Fix unused match warning

Luca Weiss (1):
      ARM: dts: qcom: msm8974: re-add missing pinctrl

Lukas Bulwahn (2):
      MAINTAINERS: rectify entry for SYNOPSYS AXS10x RESET CONTROLLER DRIVER
      MAINTAINERS: mark ARM/PALM TREO SUPPORT orphan

Marc Kleine-Budde (1):
      tee: tee_get_drvdata(): fix description of return value

Max Krummenacher (1):
      ARM: dts: colibri-imx6ull: fix snvs pinmux group

Miaoqian Lin (1):
      ARM: meson: Fix refcount leak in meson_smp_prepare_cpus

Michael Walle (1):
      ARM: dts: kswitch-d10: use open drain mode for coma-mode pins

Michal Suchanek (1):
      ARM: dts: sunxi: Fix SPI NOR campatible on Orange Pi Zero

Mihai Sain (1):
      ARM: at91: fix soc detection for SAM9X60 SiPs

Peng Fan (14):
      arm64: dts: imx8mp: correct clock of pgc_ispdwp
      arm64: dts: imx8mp-evk: correct mmc pad settings
      arm64: dts: imx8mp-evk: correct gpio-led pad settings
      arm64: dts: imx8mp-evk: correct vbus pad settings
      arm64: dts: imx8mp-evk: correct eqos pad settings
      arm64: dts: imx8mp-evk: correct vbus pad settings
      arm64: dts: imx8mp-evk: correct I2C5 pad settings
      arm64: dts: imx8mp-evk: correct I2C1 pad settings
      arm64: dts: imx8mp-evk: correct I2C3 pad settings
      arm64: dts: imx8mp-venice-gw74xx: correct pad settings
      arm64: dts: imx8mp-phyboard-pollux-rdk: correct uart pad settings
      arm64: dts: imx8mp-phyboard-pollux-rdk: correct eqos pad settings
      arm64: dts: imx8mp-phyboard-pollux-rdk: correct i2c2 & mmc settings
      arm64: dts: imx8mp-icore-mx8mp-edim2.2: correct pad settings

Peter Geis (2):
      arm64: dts: rockchip: Fix ethernet on production Quartz64-B
      arm64: dts: rockchip: Fix Quartz64-A dwc3 otg port behavior

Ryan Wanner (1):
      ARM: dts: at91: sama5d2: Fix typo in i2s1 node

Samuel Holland (1):
      dt-bindings: display: sun4i: Fix D1 pipeline count

Sean Anderson (1):
      arm64: dts: ls1028a: Update SFP node to include clock

Serge Semin (1):
      reset: Fix devm bulk optional exclusive control getter

Sherry Sun (1):
      arm64: dts: imx8mp-evk: correct the uart2 pinctl value

Stephan Gerhold (1):
      arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo

Stephen Boyd (1):
      arm64: dts: qcom: Remove duplicate sc7180-trogdor include on
lazor/homestar

Vincent Guittot (1):
      firmware: arm_scmi: Fix response size warning for OPTEE transport

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8450: fix interconnects property of UFS node

William Zhang (2):
      arm64: dts: broadcom: bcm4908: Fix timer node for BCM4906 SoC
      arm64: dts: broadcom: bcm4908: Fix cpu node for smp boot

Yang Yingliang (1):
      optee: smc_abi.c: fix wrong pointer passed to IS_ERR/PTR_ERR()

 CREDITS                                            |   4 +
 .../allwinner,sun4i-a10-display-engine.yaml        |   1 +
 MAINTAINERS                                        |  10 +-
 arch/arm/boot/dts/at91-sam9x60ek.dts               |   3 +-
 arch/arm/boot/dts/at91-sama5d2_icp.dts             |   6 +-
 arch/arm/boot/dts/imx6qdl-ts7970.dtsi              |   2 +-
 arch/arm/boot/dts/imx6ull-colibri.dtsi             |   9 +-
 arch/arm/boot/dts/imx7d-smegw01.dts                |   4 +-
 .../boot/dts/lan966x-kontron-kswitch-d10-mmt.dtsi  |   8 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  30 +++++-
 arch/arm/boot/dts/sama5d2.dtsi                     |   2 +-
 arch/arm/boot/dts/stm32mp15-scmi.dtsi              |  58 +++++++++++
 arch/arm/boot/dts/stm32mp151.dtsi                  |   6 +-
 arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts         |   4 +
 arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts         |   1 +
 arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts         |   4 +
 arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts         |   1 +
 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts  |   2 +-
 arch/arm/configs/mxs_defconfig                     |   1 +
 arch/arm/mach-at91/pm.c                            |  12 +--
 arch/arm/mach-meson/platsmp.c                      |   2 +
 arch/arm/mach-rockchip/pm.c                        |   7 +-
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4906.dtsi  |   8 ++
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   5 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  88 ++++++++--------
 .../dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts  |  40 +++----
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |  48 ++++-----
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    | 116 ++++++++++-----------
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi  |   2 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |   2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |   4 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  14 ++-
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |   4 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |   6 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |   1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts |   2 +-
 drivers/firmware/arm_scmi/bus.c                    |   6 +-
 drivers/firmware/arm_scmi/clock.c                  |  26 ++++-
 drivers/firmware/arm_scmi/driver.c                 |   1 +
 drivers/firmware/arm_scmi/optee.c                  |   7 +-
 drivers/firmware/arm_scmi/protocols.h              |   3 +
 drivers/soc/atmel/soc.c                            |  12 +--
 drivers/soc/ixp4xx/ixp4xx-npe.c                    |   2 +-
 drivers/soc/qcom/smem.c                            |   6 +-
 drivers/tee/optee/optee_smc.h                      |   2 +-
 drivers/tee/optee/smc_abi.c                        |   4 +-
 drivers/tee/tee_core.c                             |   2 +-
 include/linux/reset.h                              |   2 +-
 53 files changed, 383 insertions(+), 217 deletions(-)
