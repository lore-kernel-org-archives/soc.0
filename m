Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D48C433EF
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 15:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB322C341CB; Mon,  4 Jul 2022 15:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F7EC341CD
	for <soc@kernel.org>; Mon,  4 Jul 2022 15:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656949041;
	bh=XUfwFR6bvkhnH/7CvINtCEfGyv/zegn/xAiNBGWfbms=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=ZmIKZIeomHncTaZEF/qkRvASHecIoQUEXI/qD7DWfpbgdUe//Fo77EeYP22CvK2lP
	 emLh+DAzRt9p6WVg9I5KYdDOZKPL2CMJLFMM5yWg964GU3KSOMrcvSxAqJXamx873n
	 EkG8xsnbWM7s6FObZbeihu0/MWeYh5xaL2DdSPpzTPm3Bi0z9DjVq4S9rr08Eol4um
	 ZNMdKW3pXwnpBwcPCUEKqKPqmMZ0vHaYMKzisziBbt4TzaFSddQtYfvteci18XLj0C
	 BJYBRXPwIcJo9H0PUngbxWqO5EZekpXQ1DSKKjaky2z38VZOgtP73v2Vs81riiMV1T
	 dV8SKR5MQCb4g==
Received: by mail-yb1-f171.google.com with SMTP id b85so4243804yba.8
        for <soc@kernel.org>; Mon, 04 Jul 2022 08:37:21 -0700 (PDT)
X-Gm-Message-State: AJIora9mB23kTa+N9JwsmqFv5pqC2WP6YBoYhWowAaqbbjU7nbCoH0ji
	a7ZIM48VEXAx4UxYjEK5p/k1qhOYYVgp0jA0qA0=
X-Google-Smtp-Source: AGRyM1uH9aOZc1PkkbSIhwF7Dg+YINwVEvWm0D2nCbwgwsOkMKwYE2uWdn6z53fe+CFF3l7jJUqMNN1OdrTEtYDlO5M=
X-Received: by 2002:a25:9f87:0:b0:669:4345:a8c0 with SMTP id
 u7-20020a259f87000000b006694345a8c0mr32565873ybq.472.1656949040682; Mon, 04
 Jul 2022 08:37:20 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 4 Jul 2022 17:37:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3qpH=oHDiz_G=_okapU2tDtd+EoemHMuOz4LF+8VpmPA@mail.gmail.com>
Message-ID: <CAK8P3a3qpH=oHDiz_G=_okapU2tDtd+EoemHMuOz4LF+8VpmPA@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.19, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.19-2

for you to fetch changes up to c0d1a7bd6574c8805184468c736e26dc416bebf0:

  Merge tag 'stm32-dt-for-v5.19-fixes-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into
arm/fixes (2022-07-04 14:29:19 +0200)

----------------------------------------------------------------
ARM: SoC fixes for v5.19, part 2

Another set of minor patches for Arm DTS files and soc specific drivers:

 - More reference counting bug fixes for DT nodes, and other
   trivial code fixes

 - Multiple code fixes for the Arm SCMI firmware driver to improve
   compatibility with firmware implementations.

 - A patch series for at91 to address power management issues from
   using the wrong DT compatible properties.

 - A series of patches to fix pad settings for NXP imx8mp to leave the
   configuration untouched from the boot loader

 - Additional DT fixes for qualcomm and NXP platforms

 - A boot time fix for stm32mp15 DT

 - Konrad Dybcio becomes an additional reviewer for the Qualcomm
   platforms

----------------------------------------------------------------
Arnd Bergmann (6):
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

Bill Wendling (1):
      soc: qcom: smem: use correct format characters

Bo Liu (1):
      firmware: arm_scmi: Remove usage of the deprecated ida_simple_xxx API

Claudiu Beznea (3):
      ARM: at91: pm: use proper compatible for sama5d2's rtc
      ARM: at91: pm: use proper compatibles for sam9x60's rtc and rtt
      ARM: at91: pm: use proper compatibles for sama7g5's rtc and rtt

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

Konrad Dybcio (2):
      arm64: dts: qcom: msm8994: Fix CPU6/7 reg values
      MAINTAINERS: Add myself as a reviewer for Qualcomm ARM/64 support

Linus Walleij (1):
      soc: ixp4xx/npe: Fix unused match warning

Miaoqian Lin (1):
      ARM: meson: Fix refcount leak in meson_smp_prepare_cpus

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

 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/at91-sam9x60ek.dts               |   3 +-
 arch/arm/boot/dts/at91-sama5d2_icp.dts             |   6 +-
 arch/arm/boot/dts/imx7d-smegw01.dts                |   4 +-
 arch/arm/boot/dts/stm32mp15-scmi.dtsi              |  58 +++++++++++
 arch/arm/boot/dts/stm32mp151.dtsi                  |   6 +-
 arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts         |   4 +
 arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts         |   1 +
 arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts         |   4 +
 arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts         |   1 +
 arch/arm/configs/mxs_defconfig                     |   1 +
 arch/arm/mach-at91/pm.c                            |  12 +--
 arch/arm/mach-meson/platsmp.c                      |   2 +
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
 drivers/firmware/arm_scmi/bus.c                    |   6 +-
 drivers/firmware/arm_scmi/clock.c                  |  26 ++++-
 drivers/firmware/arm_scmi/driver.c                 |   1 +
 drivers/firmware/arm_scmi/optee.c                  |   7 +-
 drivers/firmware/arm_scmi/protocols.h              |   3 +
 drivers/soc/atmel/soc.c                            |  12 +--
 drivers/soc/ixp4xx/ixp4xx-npe.c                    |   2 +-
 drivers/soc/qcom/smem.c                            |   6 +-
 33 files changed, 300 insertions(+), 188 deletions(-)
