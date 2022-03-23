Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CB3C433F5
	for <soc@archiver.kernel.org>; Wed, 23 Mar 2022 23:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA0EFC340EE; Wed, 23 Mar 2022 23:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5406AC340F2
	for <soc@kernel.org>; Wed, 23 Mar 2022 23:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648077166;
	bh=hbmexfZU6kKPXz/kTZz71QaY8NeP9z3qYeAGPrmGn9E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iNReBIPZmqwvA8kYX5emz7/1A/JHsRLyCt2Utg1kaFWX/zLsK8ADCW57CD5yttAAI
	 1xX2AdIg6mWmK1t5KkyFaSHKjZN6iyE3uvPPhV7JCZ55P0K6ylSIdEQtERaWJgc/Sf
	 NaF5cwWuzfP4RnIaaq3TX7W7uc9/9SDXN6aA/ephVJufcKYutVXxczDWUJTZxeAPaB
	 uHmOaBx68lsXKLhhxU9tHeEjSON20zr0VgjWn/z+6ONisBN+iuWll0tT7L+PjMoR+N
	 /fxN7PpTEPrTebST+Vna/uPlEXvds95ub4wa3W02bJ26MsfFvg/UborrqCOycXxHeB
	 tRWptjpKKycCQ==
Received: by mail-wm1-f52.google.com with SMTP id n35so1793099wms.5
        for <soc@kernel.org>; Wed, 23 Mar 2022 16:12:46 -0700 (PDT)
X-Gm-Message-State: AOAM531OQ20LVNee8V/wXl929bBgyYACtGPvhefacQgW841Lmal7xh67
	Kx/hStQsnDfQeZuYA/F/bu+0dV9iD9MHRRmfRaU=
X-Google-Smtp-Source: ABdhPJys9N/sjzuAKWMNmSXQNpMa01tFgGToe1Pi2/MIX9fMWBHeY5Jj4d1Qaj0/7in0Lm9ujvqM2RchRjg1QBsiq0M=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr11549166wmc.94.1648077163447; Wed, 23
 Mar 2022 16:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
 <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com>
In-Reply-To: <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 24 Mar 2022 00:12:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1oGWkyPHZ-gV3pP94hOrJJFBsvvkuzzXBhaYpbzEGR5w@mail.gmail.com>
Message-ID: <CAK8P3a1oGWkyPHZ-gV3pP94hOrJJFBsvvkuzzXBhaYpbzEGR5w@mail.gmail.com>
Subject: [GIT PULL 4/4] ARM: DT updates for 5.18
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566=
:

  Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.1=
8

for you to fetch changes up to bcea9aaa4373f2ee8ea3c758b76c479dffe85822:

  arm64: dts: n5x: drop invalid property and fix edac node name
(2022-03-19 22:34:25 +0100)

----------------------------------------------------------------
ARM: DT updates for 5.18

After a somewhat quiet 5.17 release, the size of the DT changes
is a bit larger again. There are nine new SoC that get added,
all of them related to existing platforms:

 - Airoha (formerly Mediatek/EcoNet) EN7523 networking SoC and EVB

 - Mediatek mt6582 tablet platform with the Prestigio PMT5008 3G tablet

 - Microchip Lan966 networking SoC and it evaluation board

 - Qualcomm Snapdragon 625/632 midrange phone SoCs, with the
   LG Nexus 5X and Fairphone FP3 phones

 - Renesas RZ/G2LC and RZ/V2L general-purpose embedded SoCs,
   along with their evaluation boards

 - Samsung Exynos 850 phone SoC and reference board

 - Samsung Exynos7885 with the Samsung Galaxy A8 (2018) phone

 - Tesla FSD (Fully Self-Driving), an automotive SoC losely derived
   from the Samsung Exynos family.

 - TI K3/AM62 SoC and reference board

Support for additional functionality in existing dts files is added all
over the place: Samsung, Renesas, Mstar, wpcm450, OMAP, AT91, Allwinner,
i.MX, Tegra, Aspeed, Oxnas, Qualcomm, Mediatek, and Broadcom.

Samsung has a rework for its pinctrl schema that is a bit tricky and
requires driver changes to be included here.

A few more platforms only have smaller cleanups and DT Schema fixes,
this includes SoCFPGA, ux500, ixp4xx, STi, Xilinx Zynq, LG, and Juno.

The new machines are really too many to list, but I'll do it anyway:

 Allwinner:
   - A20-Marsboard development board

 Amlogic
  - Amediatek X96-AIR (Amlogic S905X3)
  - CYX A95XF3-AIR (Amlogic S905X3)
  - Haochuangy H96-Max (Amlogic S905X3)
  - Amlogic AQ222 (Amlogic S4)
  - OSMC Vero 4K+ (Amlogic S905D)

 Arm Juno
  - Separate DT depending on SCMI firmware version

 Aspeed:
  - Quanta S6Q BMC (AST2600)
  - ASRock ROMED8HM3 (AST2500)

 Broadcom:
  - Raspberry Pi Zero 2 W

 Marvell MVEBU/Armada:
  - Ctera C200 V1 NAS (kirkwood)
  - Ctera C200 V2 NAS (armada-370)

 Mstar
  - DongShanPiOne, a low-end embedded board
  - Miyoo Mini handheld game console

 NXP i.MX:
  - Numerous i.MX8M Mini based boards in even more variations, but
    none based on other SoCs this time:
    Protonic PRT8MM, emCON-MX8M Mini, Toradex Verdin, and
    Gateworks GW7903

 Qualcomm:
  - Google Herobrine R1 Chromebook platform (Snapdragon 7c Gen 3)
  - SHIFT6mq phone (Snapdragon 845)
  - Samsung Galaxy Book2 (Snapdragon 850)
  - Snapdragon 8 Gen 1 Hardware Development Kit

 TI OMAP:
  - SanCloud BeagleBone Enhanced WiFi

 Rockchip:
  - Pine64 PineNote ereader tablet (rk356x)
  - Bananapi-R2-Pro (rk356x)

 STM32:
  - emtrion emSBS-Argon embedded board (stm32mp157c)

----------------------------------------------------------------
Abel Vesa (3):
      arm64: dts: imx8qm: Add SCU RTC node
      arm64: dts: imx8qxp-ss-adma: Drop fsl,imx7ulp-lpuart comaptible
      ARM: dts: imx7: Use audio_mclk_post_div instead audio_mclk_root_clk

Adam Ford (9):
      arm64: dts: imx8mn: add GPC node
      arm64: dts: imx8mn: put USB controller into power-domains
      arm64: dts: imx8mn: add DISP blk-ctrl
      arm64: dts: imx8mn: Enable GPU
      arm64: dts: imx8mq-tqma8mq: Remove redundant vpu reference
      arm64: dts: imx8mq: Enable both G1 and G2 VPU's with vpu-blk-ctrl
      arm64: dts: imx8mm: Enable Hantro G1 and G2 video decoders
      arm64: dts: imx8mm-beacon: Enable PCIe
      ARM: dts: logicpd-torpedo: Add isp1763 support to baseboard

Akhil R (5):
      dt-bindings: Add headers for Tegra234 I2C
      dt-bindings: Add headers for Tegra234 PWM
      arm64: tegra: Add Tegra234 I2C devicetree nodes
      arm64: tegra: Add Tegra234 PWM devicetree nodes
      arm64: tegra: Add GPCDMA node for tegra186 and tegra194

Alain Volmat (7):
      ARM: dts: sti: ensure unique unit-address in stih407-clock
      ARM: dts: sti: ensure unique unit-address in stih410-clock
      ARM: dts: sti: ensure unique unit-address in stih418-clock
      ARM: dts: sti: move some nodes out of the soc section in
stih407-family.dtsi
      ARM: dts: sti: remove delta node from stih410.dtsi
      ARM: dts: sti: move usb picophy nodes out of soc in stih410.dtsi
      ARM: dts: sti: move usb picophy nodes out of soc in stih418.dtsi

Alex Bee (1):
      arm64: dts: rockchip: add cooling map and trip points for gpu to rk35=
6x

Alex Elder (1):
      arm64: dts: qcom: add IPA qcom,qmp property

Alexander Martinz (1):
      arm64: dts: qcom: sdm845: add device tree for SHIFT6mq

Alexander Stein (6):
      arm64: dts: tqma8mqml: add PCIe support
      ARM: dts: imx6qdl-mba6: Move rtc alias to common location
      ARM: dts: imx6qdl: tqma6: Add i2c bus recovery
      ARM: dts: imx6qdl: tqma6: Mark gpio-buttons as wakeup-source
      ARM: dts: imx6qdl: tqma6: Remove obsolete comment
      ARM: dts: imx6qdl-mba6: Move pinmux to regulator node

Alexandre Torgue (4):
      ARM: dts: stm32: use exti 19 as main interrupt to support RTC
wakeup on stm32mp157
      ARM: dts: stm32: Enable EXTI on stm32mp13
      ARM: dts: stm32: Correct masks for GIC PPI interrupts on stm32mp13
      ARM: dts: stm32: Correct masks for GIC PPI interrupts on stm32mp15

Alim Akhtar (9):
      dt-bindings: add vendor prefix for Tesla
      dt-bindings: arm: add Tesla FSD ARM SoC
      dt-bindings: clock: Add bindings definitions for FSD CMU blocks
      dt-bindings: clock: Document FSD CMU bindings
      arm64: dts: fsd: Add initial device tree support
      arm64: dts: fsd: Add initial pinctrl support
      arm64: defconfig: Enable Tesla FSD SoC
      ARM: dts: exynos: update dma node name with dtschema
      arm64: dts: fsd: Add the MCT support

Allen-KH Cheng (6):
      arm64: dts: mediatek: Correct uart clock of MT8192
      arm64: dts: mediatek: Correct SPI clock of MT8192
      arm64: dts: mediatek: Correct Nor Flash clock of MT8192
      arm64: dts: mediatek: Correct I2C clock of MT8192
      arm64: dts: mediatek: Correct system timer clock of MT8192
      arm64: dts: mt8192: Add watchdog node

Amelie Delaunay (2):
      ARM: dts: stm32: add DMA1, DMA2 and DMAMUX1 on STM32MP13x SoC family
      ARM: dts: stm32: add MDMA on STM32MP13x SoC family

Andrej Picej (1):
      ARM: dts: imx6qdl-phytec: add missing pmic MFD subdevices

Andrew Geissler (2):
      ARM: dts: aspeed: everest: Label reset-cause-pinhole GPIO
      ARM: dts: aspeed: rainier: Label reset-cause-pinhole GPIO

Andrew Jeffery (1):
      ARM: dts: aspeed: tacoma: Clean up KCS nodes

Arnd Bergmann (48):
      Merge tag 'tesla-dt64-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'socfpga_dts_update_for_v5.18_part1' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/dt
      Merge tag 'samsung-dt-pinctrl-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.18-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'renesas-dt-bindings-for-v5.18-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'ux500-dts-v5.18-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'ixp4xx-dts-v5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'sti-dt-for-v5.18-round1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti into arm/dt
      Merge branch 'mstar-dt-next' of
https://github.com/linux-chenxing/linux into arm/dt
      Merge tag 'nuvoton-5.18-devicetree' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/dt
      Merge tag 'amlogic-arm64-dt-for-v5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/dt
      Merge tag 'imx-bindings-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt64-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'juno-update-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/dt
      Merge tag 'omap-for-v5.18/dt-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'sunxi-dt-for-5.18-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/dt
      Merge tag 'v5.18-rockchip-dts64-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'v5.18-rockchip-dts32-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.18-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'renesas-arm-dt-for-v5.18-tag3' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'at91-dt-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
      Merge tag 'v5.18-rockchip-drivers-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'stm32-dt-for-v5.18-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into
arm/dt
      Merge tag 'tegra-for-5.18-dt-bindings' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'tegra-for-5.18-arm-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'tegra-for-5.18-arm64-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'samsung-dt-5.18-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.18-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'aspeed-5.18-devicetree-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/dt
      Merge tag 'oxnas-arm-soc-dt-for-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/narmstrong/linux-oxnas
into arm/dt
      Merge tag 'ti-k3-dt-for-v5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/dt
      Merge tag 'qcom-dts-for-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'qcom-arm64-for-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'v5.17-next-dts64' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'v5.17-next-dts32' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'mvebu-dt64-5.18-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'mvebu-dt-5.18-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'zynqmp-dt-for-v5.18' of
https://github.com/Xilinx/linux-xlnx into arm/dt
      Merge tag 'at91-dt-5.18-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
      Merge tag 'dt64-cleanup-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'arm-soc/for-5.18/devicetree' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'arm-soc/for-5.18/devicetree-arm64' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'v5.18-rockchip-dts64-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'v5.18-rockchip-dts32-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'socfpga_dts_update_for_v5.18_part2' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/dt

Artem Lapkin (1):
      arm64: dts: meson-sm1: add spdifin and pdifout nodes

Ar=C4=B1n=C3=A7 =C3=9CNAL (1):
      ARM: dts: BCM5301X: define RTL8365MB switch on Asus RT-AC88U

Aswani Reddy (1):
      arm64: dts: fsd: Add SPI device nodes

Balakrishna Godavarthi (1):
      arm64: dts: qcom: sc7280: Add bluetooth node on SC7280 IDP boards

Baltaz=C3=A1r Radics (1):
      ARM: dts: sun8i: Add ethernet0 alias in Nanopi NEO's device tree

Baruch Siach (2):
      arm64: dts: qcom: ipq6018: add pcie max-link-speed
      arm64: dts: qcom: ipq6018: fix usb reference period

Ben Wolsieffer (1):
      ARM: dts: qcom: apq8060-dragonboard: fix typo in eMMC

Biju Das (16):
      arm64: dts: renesas: rzg2l-smarc: Move pinctrl definitions
      arm64: dts: renesas: Add initial DTSI for RZ/G2LC SoC
      arm64: dts: renesas: Add initial device tree for RZ/G2LC SMARC EVK
      dt-bindings: arm: renesas: Document Renesas RZ/V2L SoC on SMARC EVK
      dt-bindings: power: renesas,rzg2l-sysc: Document RZ/V2L SoC
      dt-bindings: clock: Add R9A07G054 CPG Clock and Reset Definitions
      arm64: dts: renesas: Add initial DTSI for RZ/V2L SoC
      arm64: dts: renesas: Add initial device tree for RZ/V2L SMARC EVK
      arm64: dts: renesas: rzg2lc-smarc-som: Enable eMMC on SMARC platform
      arm64: dts: renesas: rzg2lc-smarc: Enable microSD on SMARC platform
      arm64: dts: renesas: rzg2l-smarc: Add common dtsi file
      arm64: dts: renesas: rzg2lc-smarc: Add macros for DIP-Switch settings
      arm64: dts: renesas: rzg2lc-smarc: Enable SCIF1 on carrier board
      arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1
      arm64: dts: renesas: rzg2lc-smarc: Use SW_SD0_DEV_SEL macro for
eMMC/SDHI device selection
      arm64: dts: renesas: rzg2lc-smarc-som: Enable watchdog

Bjorn Andersson (4):
      arm64: dts: qcom: sm8450: Add remoteproc enablers and instances
      arm64: dts: qcom: sm8450-qrd: Enable remoteproc instances
      arm64: dts: qcom: c630: Add backlight controller
      arm64: dts: qcom: c630: Move panel to aux-bus

Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus-*: add fuel gauge

Chris Morgan (4):
      arm64: dts: rockchip: Remove vcc13 and vcc14 for rk808
      arm64: dts: rockchip: Add #clock-cells value for rk805
      ARM: dts: rockchip: Add #clock-cells value for rk805
      ARM: dts: rockchip: Update regulator name for PX3

Christian Gmeiner (1):
      arm64: dts: ti: k3-am64-main: Add RTI watchdog nodes

Christian Hewitt (12):
      arm64: dts: meson: add common SM1 ac2xx dtsi
      dt-bindings: arm: amlogic: add X96-AIR bindings
      arm64: dts: meson: add initial device-trees for X96-AIR
      dt-bindings: vendor-prefixes: add cyx prefix
      dt-bindings: arm: amlogic: add A95XF3-AIR bindings
      arm64: dts: meson: add initial device-trees for A95XF3-AIR
      dt-bindings: vendor-prefixes: add haochuangyi prefix
      dt-bindings: arm: amlogic: add H96-Max bindings
      arm64: dts: meson: add initial device-tree for H96-Max
      dt-bindings: vendor-prefixes: add osmc prefix
      dt-bindings: arm: amlogic: add Vero 4K+ bindings
      arm64: dts: meson: add support for OSMC Vero 4K+

Chun-Jie Chen (1):
      arm64: dts: mediatek: Add mt8192 power domains controller

Claudiu Beznea (5):
      ARM: dts: at91: remove status =3D "okay" from soc specific dtsi
      ARM: dts: at91: fix low limit for CPU regulator
      ARM: dts: at91: sama7g5ek: set regulator voltages for standby state
      ARM: dts: at91: sama7g5: add opps
      ARM: dts: at91: sama7g5: add eic node

Conley Lee (2):
      ARM: dts: sun7i: Add A20-Marsboard
      dt-bindings: arm: sunxi: add haoyu,a20-marsboard

Daniel Palmer (13):
      ARM: dts: mstar: Set gpio compatible for ssd20xd
      dt-bindings: vendor-prefixes: Add prefix for Miyoo
      dt-bindings: arm: mstar: Add compatible for Miyoo Mini
      ARM: dts: mstar: Add a dts for Miyoo Mini
      dt-bindings: vendor-prefixes: Add prefix for 100ask
      dt-bindings: arm: mstar: Add compatible for 100ask DongShanPiOne
      ARM: dts: mstar: Add board for 100ask DongShanPiOne
      dt-bindings: clk: mstar msc313 cpupll binding description
      ARM: mstar: Add cpupll to base dtsi
      ARM: mstar: Link cpupll to cpu
      ARM: mstar: Link cpupll to second core
      ARM: mstar: Add OPP table for infinity
      ARM: mstar: Add OPP table for infinity3

Dario Binacchi (1):
      ARM: dts: imx28: reparent gpmi clock to ref_gpmi

David Heidelberg (21):
      arm64: xilinx: dts: drop legacy property #stream-id-cells
      arm64: dts: qcom: msm8996: use standartized naming for spmi node
      ARM: dts: qcom: sdx55: use standartized naming for spmi node
      ARM: dts: qcom: apq8064: correct ranges values
      ARM: dts: qcom: apq8064: make pci regs property dt-schema compliant
      ARM: dts: qcom: apq8064: adjust dsi node name to match dt-schema
      ARM: dts: qcom: nexus7: remove vcss supply which never existed
      ARM: dts: qcom: apq8060: correct mvs switch name
      ARM: dts: qcom: rename eth node to ethernet
      ARM: dts: qcom: fix gic_irq_domain_translate warnings for msm8960
      ARM: dts: qcom: add KPSS GCC compatible to clock nodes
      ARM: dts: qcom: msm8960: move vsdcc regulator out of simple-bus
      ARM: dts: qcom: fill missing power-domain-cells for gcc controllers
      arm64: dts: qcom: sdm845: fix microphone bias properties and values
      arm64: dts: qcom: update qcom,domain property
      arm64: dts: qcom: fix thermal zones naming
      arm64: dts: qcom: sdm845: rename memory@ nodes to more descriptive na=
mes
      arm64: dts: qcom: msm8996: qcom,controlled-remotely is boolean
      arm64: dts: qcom: sdm845: add missing power-controller compatible
      arm64: dts: qcom: pms405: assign device specific compatible
      arm64: dts: qcom: msm8916: improve usb hs node formating

David Jander (1):
      arm64: dts: imx: add Protonic PRT8MM board

David Virag (1):
      arm64: dts: exynos: Add initial device tree support for Exynos7885 So=
C

Dillon Min (2):
      ARM: dts: stm32: Add DMA2D support for STM32F429 series soc
      ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board

Dinh Nguyen (3):
      ARM: dts: socfpga: arria10: align regulator node with dtschema
      ARM: dts: socfpga: cyclone5: align regulator node with dtschema
      arm64: dts: n5x: add sdr edac support

Dmitry Baryshkov (4):
      arm64: dts: qcom: sm8250: fix PCIe bindings to follow schema
      arm64: dts: qcom: sdm845: add bi_tcxo to camcc
      arm64: dts: qcom: msm8996: add cxo and sleep-clk to gcc node
      arm64: dts: qcom: msm8996: convert xo_board to RPM_SMD_BB_CLK1

Dmitry Osipenko (3):
      ARM: tegra: asus-tf101: Enable S/PDIF and HDMI audio
      ARM: tegra: tf700t: Rename DSI node
      ARM: tegra: paz00: Add MMC aliases

Dominik Kobinski (1):
      ARM: dts: qcom: pm8226: Support SPMI regulators on PMIC sid 1

Douglas Anderson (15):
      arm64: dts: qcom: sc7280: Fix gmu unit address
      arm64: dts: qcom: sc7280: Move herobrine-r0 to its own dts
      arm64: dts: qcom: sc7280: Factor out Chrome common fragment
      arm64: dts: qcom: sc7280: Factor gpio.h include to sc7280.dtsi
      arm64: dts: qcom: sc7180-trogdor: Add "-regulator" suffix to pp3300_h=
ub
      arm64: dts: qcom: sc7280-herobrine: Consistently add "-regulator" suf=
fix
      arm64: dts: qcom: sc7280: Properly sort sdc pinctrl lines
      arm64: dts: qcom: sc7280: Clean up sdc1 / sdc2 pinctrl
      arm64: dts: qcom: sc7280-idp: No need for "input-enable" on sw_ctrl
      arm64: dts: qcom: sc7280: Fix sort order of dp_hot_plug_det /
pcie1_clkreq_n
      arm64: dts: qcom: sc7280: Add edp_out port and HPD lines
      arm64: dts: qcom: sc7280: Move pcie1_clkreq pull / drive str to board=
s
      arm64: dts: qcom: sc7280: Move dp_hot_plug_det pull from SoC dtsi fil=
e
      arm64: dts: qcom: sc7280: Add a blank line in the dp node
      arm64: dts: qcom: sc7280: Add herobrine-r1

Eddie James (3):
      ARM: dts: aspeed: rainier and everest: Enable UHCI
      ARM: dts: aspeed: tacoma: Remove CFAM reset GPIO
      ARM: dts: aspeed: p10bmc: Enable ftrace in ramoops buffer

Erwan Le Ray (16):
      ARM: dts: stm32: add DMA configuration to UART nodes on stm32mp151
      ARM: dts: stm32: keep uart4 behavior on stm32mp157c-ed1
      ARM: dts: stm32: keep uart4 and uart7 behavior on stm32mp15xx-dkx
      ARM: dts: stm32: keep uart4 behavior on icore-stm32mp1-ctouch2
      ARM: dts: stm32: keep uart4 behavior on icore-stm32mp1-edimm2.2
      ARM: dts: stm32: keep uart4 behavior on stm32mp157a-iot-box
      ARM: dts: stm32: keep uart nodes behavior on stm32mp1-microdev2.0-of7
      ARM: dts: stm32: keep uart nodes behavior on stm32mp1-microdev2.0
      ARM: dts: stm32: keep uart nodes behavior on stm32mp157a-stinger96
      ARM: dts: stm32: keep uart4 behavior on stm32mp157c-lxa-mc1
      ARM: dts: stm32: keep uart4 behavior on stm32mp157c-odyssey
      ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcom-drc02
      ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcom-pdk2
      ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcom-picoit=
x
      ARM: dts: stm32: keep uart4 behavior on stm32mp15xx-dhcom-som
      ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcor-avenge=
r96

Ezequiel Garcia (2):
      arm64: dts: rockchip: add gpu node to rk356x
      arm64: dts: rockchip: enable the gpu on quartz64-a

Fabio Estevam (2):
      arm64: dts: renesas: beacon: Remove the 'pm-ignore-notify' property
      ARM: dts: imx6sx-udoo-neo: Add HDMI support

Fabrice Gasnier (4):
      ARM: dts: stm32: remove some timer duplicate unit-address on
stm32f4 series
      ARM: dts: stm32: remove timer5 duplicate unit-address on stm32f4 seri=
es
      ARM: dts: stm32: remove some timer duplicate unit-address on
stm32f7 series
      ARM: dts: stm32: remove timer5 duplicate unit-address on stm32f7 seri=
es

Felipe Balbi (2):
      arm64: dts: qcom: sm8150: add i2c and spi dma channels
      arm64: dts: qcom: sm8150: simplify references to pwrkey and resin

Frank Wunderlich (3):
      dt-bindings: rockchip: Add BananaPi R2 Pro Board
      arm64: dts: rockchip: Add Bananapi R2 Pro
      arm64: dts: broadcom: Fix sata nodename

Gary Bisson (2):
      arm64: dts: meson-g12-common: add more pwm_f options
      arm64: dts: meson-g12-common: add uart_ao_b pins muxing

Geert Uytterhoeven (9):
      arm64: dts: renesas: r8a779a0: Add INTC-EX device node
      arm64: dts: renesas: Miscellaneous whitespace fixes
      Merge tag 'renesas-r9a07g054-dt-binding-defs-tag' into
renesas-arm-dt-for-v5.18
      arm64: dts: renesas: r8a779f0: Add RWDT node
      arm64: dts: renesas: spider-cpu: Enable watchdog timer
      arm64: dts: renesas: Align GPIO hog names with dtschema
      ARM: dts: renesas: Align GPIO hog names with dtschema
      arm64: dts: renesas: r8a779f0: Add pinctrl device node
      arm64: dts: renesas: spider: Complete SCIF3 description

George Hung (1):
      ARM: dts: aspeed: Add device tree for Quanta S6Q BMC

Gerald Baeza (1):
      ARM: dts: stm32: update sdmmc slew-rate in stm32mp13 pinctrl

Hari Nagalla (1):
      arm64: dts: ti: k3-am64: Add ESM0 to device memory map

Hari Prasath (2):
      ARM: dts: at91: sama7g5: Add can controllers of sama7g5
      ARM: dts: at91: sama7g5: Enable can0 and can1 support in sama7g5-ek

Heiko Stuebner (2):
      arm64: dts: rockchip: define vdd_log on rk3399-puma
      arm64: dts: rockchip: fix supplies for pwm regulators

Henrik Grimler (4):
      dt-bindings: arm: samsung: document Chagall WiFi board binding
      ARM: dts: exynos: Add support for Samsung Chagall WiFi
      dt-bindings: arm: samsung: document Klimt WiFi board binding
      ARM: dts: exynos: Add support for Samsung Klimt WiFi

Hugo Villeneuve (3):
      arm64: dts: imx8mp-evk: add PCA6416 interrupt controller mode
      arm64: dts: imx8mp-evk: add PCA6416 gpio line names
      arm64: dts: imx8mp-evk: add support for I2C5

Jack Matthews (1):
      ARM: dts: qcom: pm8226: Add vibration motor node

Jacopo Mondi (1):
      arm64: dts: renesas: condor: Enable MAX9286

Jean THOMAS (2):
      arm64: dts: qcom: msm8992-lg-bullhead: Place LG Bullhead generic
code into a DTSI file
      arm64: dts: qcom: msm8992-lg-bullhead: Add support for LG Bullhead re=
v 1.0

Jean-Jacques Hiblot (3):
      dt-bindings: clock: r9a06g032: Add the definition of the watchdog clo=
ck
      ARM: dts: r9a06g032: Add the watchdog nodes
      ARM: dts: r9a06g032-rzn1d400-db: Enable watchdog0 with a 60s timeout

Jernej Skrabec (1):
      MAINTAINERS: Update Allwinner SoCs maintainers

Jesse Taube (1):
      ARM: dts: imxrt1050-pinfunc: Add pinctrl binding header

Joel Stanley (3):
      ARM: dts: aspeed: rainier: Remove SPI NOR controllers
      ARM: dts: aspeed: rainer: Add RTC battery gpio name
      ARM: dts: aspeed: everest: Add RTC battery gpio name

Johan Jonker (1):
      ARM: dts: rockchip: remove status from rk3288 crypto node

John Crispin (4):
      dt-bindings: Add vendor prefix for Airoha
      dt-bindings: arm: airoha: Add binding for EN7523 SoC and EVB
      ARM: Add basic support for Airoha EN7523 SoC
      ARM: dts: add GPIO support for Airoha EN7523

Jon Hunter (1):
      arm64: tegra: Enable device-tree overlay support

Jonas Kuenstler (1):
      arm64: dts: imx8mp-phycore-som: Set usdhc root clock for eMMC

Jonathan Neusch=C3=A4fer (8):
      dt-bindings: arm/npcm: Add binding for global control registers (GCR)
      MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM architec=
ture
      ARM: dts: wpcm450: Add global control registers (GCR) node
      ARM: dts: wpcm450: Add pinctrl and GPIO nodes
      ARM: dts: wpcm450: Add pin functions
      ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and buttons
      ARM: dts: wpcm450: Add pinmux information to UART0
      MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki

Julius Werner (1):
      ARM: tegra: Update jedec,lpddr2 revision-id binding

Kathiravan T (5):
      arm64: dts: qcom: ipq8074: add the reserved-memory node
      arm64: dts: qcom: ipq8074: enable the GICv2m support
      arm64: dts: qcom: ipq6018: enable the GICv2m support
      arm64: dts: qcom: ipq8074: drop the clock-frequency property
      arm64: dts: qcom: ipq6018: drop the clock-frequency property

Kavyasree Kotagiri (1):
      ARM: dts: add DT for lan966 SoC and 2-port board pcb8291

Keerthy (1):
      arm64: dts: ti: k3-j721s2-mcu-wakeup: Fix the interrupt-parent
for wkup_gpioX instances

Kieran Bingham (2):
      arm64: dts: renesas: eagle: Enable MAX9286
      arm64: dts: renesas: Add GMSL cameras .dtsi

Krishna Manikandan (1):
      arm64: dts: qcom: sc7280: add display dt nodes

Krzysztof Kozlowski (88):
      pinctrl: samsung: drop pin banks references on error paths
      pinctrl: samsung: accept GPIO bank nodes with a suffix
      dt-bindings: pinctrl: samsung: convert to dtschema
      dt-bindings: pinctrl: samsung: describe Exynos850 and
ExynosAutov9 wake-ups
      pinctrl: samsung: add support for Exynos850 and ExynosAutov9 wake-ups
      ARM: dts: exynos: split dmas into array of phandles in Exynos5250
      Merge tag 'samsung-pinctrl-5.18' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
for-v5.18/dt-pinctrl
      ARM: dts: exynos: fix UART3 pins configuration in Exynos5250
      ARM: dts: exynos: drop unused pinctrl defines in Exynos3250
      ARM: dts: exynos: simplify PMIC DVS pin configuration in Odroid XU
      ARM: dts: exynos: override pins by label in Peach Pit
      ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pit
      ARM: dts: exynos: override pins by label in Peach Pi
      ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pi
      ARM: dts: s3c64xx: drop unneeded pinctrl wake-up interrupt mapping
      ARM: dts: exynos: align pinctrl with dtschema in Exynos3250
      ARM: dts: exynos: align pinctrl with dtschema in Exynos4210
      ARM: dts: exynos: align pinctrl with dtschema in Exynos4412
      ARM: dts: exynos: align pinctrl with dtschema in Exynos5250
      ARM: dts: exynos: align pinctrl with dtschema in Exynos5260
      ARM: dts: exynos: align pinctrl with dtschema in Exynos5410
      ARM: dts: exynos: align pinctrl with dtschema in Exynos542x/5800
      arm64: dts: exynos: align pinctrl with dtschema in Exynos5433
      arm64: dts: exynos: align pinctrl with dtschema in Exynos7
      arm64: dts: exynos: align pinctrl with dtschema in ExynosAutov9
      ARM: dts: s3c24xx: align pinctrl with dtschema
      ARM: dts: s3c64xx: align pinctrl with dtschema
      ARM: dts: s5pv210: align pinctrl with dtschema
      arm64: dts: exynos: use dedicated wake-up pinctrl compatible in
ExynosAutov9
      arm64: dts: exynos: Align MAX77843 nodes with dtschema on TM2
      ARM: dts: exynos: Align MAX77836 nodes with dtschema on Monk and Rina=
to
      ARM: dts: exynos: add necessary clock controller inputs in Exynos5260
      ARM: dts: exynos: drop unsupported MAX77802 regulators on Odroid XU
      arm64: dts: exynos: add necessary clock inputs in Exynos7
      ARM: dts: exynos: add USB DWC3 supplies to Arndale
      ARM: dts: exynos: add USB DWC3 supplies to SMDK5250
      ARM: dts: exynos: add USB DWC3 supplies to Chromebook Snow
      ARM: dts: exynos: add USB DWC3 supplies to Chromebook Spring
      ARM: dts: exynos: add USB DWC3 supplies to ArndaleOcta
      ARM: dts: exynos: add USB DWC3 supplies to Chromebook Peach Pit
      ARM: dts: exynos: add USB DWC3 supplies to Chromebook Peach Pi
      ARM: dts: exynos: add USB DWC3 supplies to SMDK5420
      ARM: dts: exynos: add fake USB DWC3 supplies to SMDK5410
      arm64: dts: exynos: add USB DWC3 supplies to Espresso board
      ARM: dts: exynos: drop old thermal properties from Exynos4210
      ARM: dts: exynos: use define for TMU clock on Exynos4412
      Merge tag 'samsung-dt-bindings-clk-fsd-5.18' into for-v5.18/tesla-fsd
      arm64: dts: exynos: align pl330 node name with dtschema
      arm64: dts: exynos: drop unneeded syscon phandle in Exynos5433 LPASS
      arm64: dts: broadcom: align pl330 node name with dtschema
      arm64: dts: exynos: adjust USB DRD clocks with dtschema in Exynos7
      ARM: dts: exynos: use generic node name for LPDDR3 timings in Odroid
      dt-bindings: altera: document existing Cyclone 5 board compatibles
      dt-bindings: altera: document Arria 5 based board compatibles
      dt-bindings: altera: document Arria 10 based board compatibles
      dt-bindings: altera: document VT compatibles
      dt-bindings: altera: document Stratix 10 based board compatibles
      dt-bindings: intel: document Agilex based board compatibles
      dt-bindings: clock: intel,stratix10: convert to dtschema
      ARM: dts: arria5: add board compatible for SoCFPGA DK
      ARM: dts: arria10: add board compatible for Mercury AA1
      ARM: dts: arria10: add board compatible for SoCFPGA DK
      arm64: dts: stratix10: add board compatible for SoCFPGA DK
      arm64: dts: stratix10: move ARM timer out of SoC node
      arm64: dts: stratix10: align mmc node names with dtschema
      arm64: dts: stratix10: align regulator node names with dtschema
      arm64: dts: agilex: add board compatible for SoCFPGA DK
      arm64: dts: agilex: add board compatible for N5X DK
      arm64: dts: agilex: align mmc node names with dtschema
      arm64: dts: intel: socfpga_agilex_socdk: align LED node names
with dtschema
      arm64: dts: stratix10: align pl330 node name with dtschema
      arm64: dts: agilex: align pl330 node name with dtschema
      arm64: dts: exynos: drop incorrectly placed wakeup interrupts in Exyn=
os850
      arm64: dts: exynos: align pinctrl with dtschema in Exynos850
      arm64: dts: exynos: use dedicated wake-up pinctrl compatible in Exyno=
s850
      ARM: dts: exynos: add missing HDMI supplies on SMDK5250
      ARM: dts: exynos: add missing HDMI supplies on SMDK5420
      ARM: dts: exynos: align PPMU event node names with dtschema
      arm64: dts: rockchip: align Google CROS EC PWM node name with dtschem=
a
      arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
      dt-bindings: usb: dwc2: fix compatible of Intel Agilex
      dt-bindings: usb: dwc2: add iommus
      dt-bindings: usb: dwc2: add disable-over-current
      arm64: dts: agilex/stratix10: add clock-names to USB DWC2 node
      arm64: dts: juno: align pl330 node name with dtschema
      arm64: dts: lg: add dma-cells to pl330 node
      arm64: dts: lg: align pl330 node name with dtschema
      arm64: dts: n5x: drop invalid property and fix edac node name

Kuldeep Singh (3):
      arm64: dts: ns2: Fix spi-cpol and spi-cpha property
      arm64: dts: ns2: Fix spi clock name
      arm64: dts: stingray: Fix spi clock name

Kuninori Morimoto (1):
      arm64: dts: renesas: ulcb/ulcb-kf: switch to use
audio-graph-card2 for sound

Kuogee Hsieh (1):
      arm64: dts: qcom: sc7280: Add Display Port node

Li Yang (1):
      arm64: dts: ls1028a-qds: define mdio slots for networking options

Linus Walleij (7):
      ARM: dts: ux500: Add battery thermal zones and NTCs
      ARM: dts: AB8505: Enable charging options
      ARM: dts: ux500: Update AB850[05] nodes
      ARM: dts: ux500: Correct Janice accel mount matrix
      ARM: dts: ixp4xx: Fix up the Netgear WG302 device tree
      ARM: dts: ixp42x: Expand syscon register range
      ARM: dts: Drop serial 1 alias on GW7001

Luca Weiss (15):
      ARM: dts: qcom: pm8226: add smbb charger node
      ARM: dts: qcom: apq8026-lg-lenok: configure SMBB charger
      dt-bindings: phy: qcom,usb-hs-phy: add MSM8226 compatible
      ARM: dts: qcom: msm8226: add USB node
      ARM: dts: qcom: apq8026-lg-lenok: enable USB
      ARM: dts: qcom: apq8026-lg-lenok: add fuel gauge
      arm64: dts: qcom: pm6150l: Add wled node
      arm64: dts: qcom: sm7225-fairphone-fp4: Configure WLED
      ARM: dts: qcom: msm8226: Add pinctrl for sdhci nodes
      ARM: dts: qcom: apq8026-lg-lenok: Add Wifi
      ARM: dts: qcom: apq8026-lg-lenok: Add Bluetooth
      dt-bindings: arm: cpus: Add Kryo 250 CPUs
      dt-bindings: arm: qcom: Document sdm632 and fairphone,fp3 board
      arm64: dts: qcom: sdm632: Add device tree for Fairphone 3
      ARM: dts: qcom: msm8226: add power domains

Lucas Stach (10):
      dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
      dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
      dt-bindings: arm: imx: add Protonic PRT8MM board compatible
      arm64: dts: imx8mq: disable DDRC node by default
      arm64: dts: mnt-reform2: add internal display support
      arm64: dts: mnt-reform2: correct i2c3 pad-ctrl
      arm64: dts: imx8mp: disable usb3_phy1
      dt-bindings: power: add defines for i.MX8MP power domain
      dt-bindings: power: imx8mp: add defines for HSIO blk-ctrl domains
      dt-bindings: soc: add binding for i.MX8MP HSIO blk-ctrl

Manivannan Sadhasivam (2):
      arm64: dts: qcom: sm8250: Fix MSI IRQ for PCIe1 and PCIe2
      ARM: dts: qcom: sdx55: Fix the address used for PCIe EP local addr sp=
ace

Mans Rullgard (1):
      ARM: dts: sunxi: h3/h5: add r_uart node

Maoguang Meng (1):
      arm64: dts: mt8183: add jpeg enc node for mt8183

Marcel Ziswiler (3):
      arm64: dts: imx8mm: fix strange hex notation
      dt-bindings: arm: fsl: add toradex,verdin-imx8mm et al.
      arm64: dts: freescale: add initial support for verdin imx8m mini

Marek Beh=C3=BAn (1):
      arm64: dts: marvell: armada-37xx: Add clock to PCIe node

Marek Vasut (6):
      ARM: dts: imx6qdl-dhcom-pdk2: Include missing headers
      ARM: dts: stm32: Drop duplicate status okay from DHCOM gpioc node
      arm64: dts: imx8mm: Add missing MX8MM_IOMUXC_NAND_READY_B_SD3_RESET_B
      ARM: dts: imx: Add missing LVDS decoder on M53Menlo
      ARM: dts: imx7: Move PCIe out of AIPS3
      ARM: dts: stm32: Add CM4 reserved memory, rproc and IPCC on DHCOR SoM

Marijn Suijten (1):
      Revert "arm64: dts: qcom: sm6125: Avoid using missing SM6125_VDDCX"

Martin J=C3=BCcker (1):
      ARM: dts: exynos: add charger and battery to p4note

Matthew Hagan (2):
      ARM: dts: NSP: MX6X: get mac-address from eeprom
      ARM: dts: NSP: MX6X: correct LED function types

Matthias Schiffer (1):
      arm64: dts: ti: k3-am65*: Remove #address-cells/#size-cells from
flash nodes

Mattijs Korpershoek (1):
      arm64: dts: mt6358: add mt6358-keys node

Maulik Shah (4):
      arm64: dts: qcom: sm8150: Correct TCS configuration for apps rsc
      arm64: dts: qcom: sm8250: Add cpuidle states
      arm64: dts: qcom: sm8350: Correct TCS configuration for apps rsc
      arm64: dts: qcom: sm8450: Update cpuidle states parameters

Maxim Kutnij (3):
      ARM: dts: Add initial support for Mediatek mt6582
      ARM: dts: Add initial support for Prestigio PMT5008 3G tablet
      dt-bindings: mediatek: Adds a DT binding documentation for the MT6582=
 SoC

Michael Riesch (11):
      arm64: dts: rockchip: fix vcc3v3_lcd{0,1}_n regulators in rk3568-evb1=
-10
      arm64: dts: rockchip: add the touchscreen controller to rk3568-evb1-v=
10
      arm64: dts: rockchip: add the i2s3_2ch node to rk356x
      arm64: dts: rockchip: rename and sort the rk356x usb2 phy handles
      arm64: dts: rockchip: add usb2 support to rk3568-evb1-v10
      arm64: dts: rockchip: enable the gpu on rk3568-evb1-v10
      arm64: dts: rockchip: enable the tsadc on rk3568-evb1-v10
      arm64: dts: rockchip: enable work led on rk3568-evb1-v10
      arm64: dts: rockchip: add the vdd_cpu regulator to rk3568-evb1-v10
      arm64: dts: rockchip: set vdd_gpu regulator on rk3568-evb1-v10
to always on
      arm64: dts: rockchip: enable rk809 audio codec on the rk3568 evb1-v10

Michael Saunders (1):
      arm64: dts: rockchip: enable the mali GPU on rk3399-firefly

Michael Tretter (2):
      arm64: zynqmp: Add missing #dma-cells property
      arm64: zynqmp: Rename dma to dma-controller

Michael Walle (2):
      arm64: dts: ls1028a: add efuse node
      dt-bindings: arm: at91: add Kontron's new KSwitches

Mihai Sain (1):
      ARM: dts: at91: sam9x60ek: modify vdd_1v5 regulator to vdd_1v15

Mikhail Rudenko (1):
      ARM: dts: nanopi-neo-air: Add eMMC and bluetooth

Miquel Raynal (1):
      ARM: dts: r9a06g032: Describe the NAND controller

Mohan Kumar (3):
      dt-bindings: Add HDA support for Tegra234
      dt-bindings: Document Tegra234 HDA support
      arm64: tegra: Add HDA device tree node for Tegra234

Neil Armstrong (1):
      ARM: dts: ox810se: Add Ethernet support

Nikita Travkin (1):
      arm64: dts: qcom: msm8916-longcheer-l8150: Add light and proximity se=
nsor

Nikita Yushchenko (5):
      arm64: dts: renesas: r8a77961: Add lvds0 device node
      arm64: dts: renesas: ulcb-kf: Add KF HDMI output
      arm64: dts: renesas: ulcb-kf: Add 9-asix sensor device
      arm64: dts: renesas: rcar-gen3: Add MOST devices
      arm64: dts: renesas: ulcb-kf: fix wrong comment

Niklas S=C3=B6derlund (1):
      arm64: dts: renesas: falcon-csi-dsi: Add and connect MAX96712

Nishanth Menon (7):
      arm64: dts: ti: k3-am65: Fix gic-v3 compatible regs
      arm64: dts: ti: k3-j721e: Fix gic-v3 compatible regs
      arm64: dts: ti: k3-j7200: Fix gic-v3 compatible regs
      arm64: dts: ti: k3-am64: Fix gic-v3 compatible regs
      arm64: dts: ti: k3-j721s2: Fix gic-v3 compatible regs
      dt-bindings: arm: ti: Add bindings for AM625 SoC
      arm64: dts: ti: Add support for AM62-SK

Odelu Kukatla (1):
      arm64: dts: qcom: sc7280: Add EPSS L3 interconnect provider

Oleksij Rempel (5):
      ARM: dts: imx6dl-prtvt7: Add display and panel nodes
      ARM: dts: imx6qdl-vicut1: add CAN termination support
      ARM: dts: imx6dl: plym2m, prtvt7, victgo: make use of new
resistive-adc-touch driver
      ARM: dts: imx6dl: plym2m, prtvt7, victgo: add thermal zones and hwmon
      ARM: tegra: Fix ethernet node names

Oliver Graute (2):
      arm64: dts: imx8qm: add compatible string for usdhc3
      arm64: dts: imx8qm: added more serial alias to dts

Olivier Moysan (1):
      ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15

Pali Roh=C3=A1r (2):
      ARM: dts: armada-385.dtsi: Add definitions for PCIe legacy INTx inter=
rupts
      ARM: dts: turris-omnia: Set PCIe slot-power-limit-milliwatt propertie=
s

Paul Barker (1):
      ARM: dts: am335x-sancloud-bbe-extended-wifi: New devicetree

Paul Kocialkowski (1):
      ARM: dts: sun8i: v3s: Move the csi1 block to follow address order

Pavel Kubelun (1):
      ARM: dts: qcom: ipq4019: fix sleep clock

Pawel Dembicki (3):
      dt-bindings: vendor-prefixes: Add Ctera Networks
      ARM: dts: kirkwood: Add Ctera C-200 V1 board
      ARM: dts: mvebu: Add Ctera C-200 V2 board

Peng Fan (1):
      arm64: dts: imx8: add mu5/6 node

Peter Geis (6):
      dt-bindings: soc: rockchip: add rk3568-usb2phy-grf
      arm64: dts: rockchip: add usb2 nodes to rk3568 device tree
      arm64: dts: rockchip: add Quartz64-A usb2 support
      arm64: dts: rockchip: add Quartz64-A pmu_io_domains
      arm64: dts: rockchip: add Quartz64-A sdmmc1 node
      arm64: dts: rockchip: add Quartz64-A con40 hardware

Petr Vorel (5):
      arm64: dts: qcom: msm8994: SoC specific compatible strings for qcom-s=
dhci
      arm64: dts: qcom: msm8996: SoC specific compatible strings for qcom-s=
dhci
      arm64: dts: qcom: msm8916-j5: Fix typo
      arm64: dts: qcom: msm8994: Provide missing "xo_board" and
"sleep_clk" to GCC
      arm64: dts: qcom: msm8994-huawei-angler: Add vendor name huawei

Potin Lai (10):
      ARM: dts: aspeed: bletchley: Switch sled numbering to 1-based
      ARM: dts: aspeed: bletchley: Separate leds into multiple groups
      ARM: dts: aspeed: bletchley: Update gpio-line-names
      ARM: dts: aspeed: bletchley: Update fmc configurations
      ARM: dts: aspeed: bletchley: Switch to spi-gpio for spi2
      ARM: dts: aspeed: bletchley: Add interrupt support for sled io expand=
er
      ARM: dts: aspeed: bletchley: Add shunt-resistor for ADM1278
      ARM: dts: aspeed: bletchley: Add INA230 sensor on each sled
      ARM: dts: aspeed: bletchley: Enable mdio3 bus
      ARM: dts: aspeed: bletchley: Cleanup redundant nodes

Pratyush Yadav (2):
      arm64: dts: ti: k3-*: Fix whitespace around flash@0 nodes
      arm64: dts: ti: k3-*: Drop address and size cells from flash nodes

Quan Nguyen (5):
      ARM: dts: aspeed: mtjade: Enable secondary flash
      ARM: dts: aspeed: mtjade: Update rtc-battery-voltage-read-enable pin
      ARM: dts: aspeed: mtjade: Update host0-ready pin
      ARM: dts: aspeed: mtjade: Rename GPIO hog nodes to match schema.
      ARM: dts: aspeed: mtjade: Move all adc sensors into iio-hwmon node

Rafa=C5=82 Mi=C5=82ecki (5):
      arm64: dts: broadcom: bcm4908: use proper TWD binding
      arm64: dts: broadcom: bcm4908: add pinctrl binding
      arm64: dts: broadcom: bcm4908: add watchdog block
      arm64: dts: broadcom: bcm4908: add I2C block
      ARM: dts: BCM5301X: Add Ethernet MAC address to Luxul XWR-3150

Rajeev Nandan (1):
      arm64: dts: qcom: sc7280: Add DSI display nodes

Rayyan Ansari (1):
      ARM: dts: qcom: pm8226: Add node for the MPP

Reinhold Mueller (4):
      dt-binding: arm/stm32: Add emtrion hardware emSBC-Argon
      ARM: dts: stm32: Add support for the emtrion emSBC-Argon
      dt-bindings: arm: Add emtrion hardware emCON-MX8M Mini
      arm64: dts: imx8mm: Add support for emtrion emCON-MX8M Mini

Richard Leitner (1):
      ARM: tegra: tamonten: Fix I2C3 pad setting

Richard Schleich (3):
      ARM: dts: bcm2837: Add the missing L1/L2 cache information
      ARM: dts: bcm2711: Add the missing L1/L2 cache information
      ARM: dts: bcm2835/6: Add the missing L1/L2 cache information

Richard Zhu (5):
      arm64: dts: imx8mm: Add the pcie phy support
      arm64: dts: imx8mm: Add the pcie support
      arm64: dts: imx8mm-evk: Add the pcie support on imx8mm evk board
      arm64: dts: imx8mq-evk: Add second PCIe port support
      ARM: dts: imx6qp-sabresd: Enable PCIe support

Rob Herring (4):
      arm64: dts: qcom: msm8998: Fix cache nodes
      ARM: dts: sun8i-h3: Drop args in 'thermal-sensors'
      arm64: dts: imx8qm: Drop CPU 'arm,armv8' compatible
      arm64: dts: rockchip: Fix SDIO regulator supply properties on
rk3399-firefly

Robert Foss (2):
      arm64: dts: qcom: apq8016-sbc: Remove clock-lanes property from
&camss node
      arm64: dts: qcom: sdm845-db845c: Remove clock-lanes property
from &camss node

Robert Marko (1):
      arm64: dts: qcom: ipq8074: add SMEM support

Robin Murphy (1):
      arm64: dts: juno: Add separate SCMI variants

Robin van der Gracht (1):
      ARM: dts: imx6dl-prtvt7: Add missing tvp5150 video decoder node

Romain Perier (3):
      dt-bindings: add vendor prefix for Wireless Tag
      ARM: dts: mstar: Add the Wireless Tag IDO-SBC2D06-V1B-22W
      ARM: mstar: Extend opp_table for infinity2m

Sai Prakash Ranjan (1):
      arm64: dts: qcom: sm8450: Add LLCC/system-cache-controller node

Sam Protsenko (3):
      pinctrl: samsung: Remove EINT handler for Exynos850 ALIVE and CMGP gp=
ios
      arm64: dts: exynos: Add initial Exynos850 SoC support
      arm64: dts: exynos: Add initial E850-96 board support

Sam Shih (3):
      arm64: dts: mediatek: add clock support for mt7986a
      arm64: dts: mediatek: update mt7986a memory node
      arm64: dts: mediatek: update mt7986b memory node

Sameer Pujar (3):
      dt-bindings: Add Tegra234 APE support
      arm64: tegra: Add audio devices on Tegra234
      arm64: tegra: APE sound card for Jetson AGX Orin

Samuel Holland (3):
      dt-bindings: arm: rockchip: Add Pine64 PineNote board
      arm64: dts: rockchip: Add pdm node to rk356x
      arm64: dts: rockchip: Add Pine64 PineNote board

Sandeep Maheswaram (1):
      arm64: dts: qcom: sc7280: Move USB2 controller nodes from common
dtsi to SKU1

Sankeerth Billakanti (1):
      arm64: dts: qcom: sc7280: add edp display dt nodes

Satya Priya (1):
      arm64: dts: qcom: sc7280: Add pmg1110 regulators for sc7280-crd

Sergey Shtylyov (2):
      MAINTAINERS: Specify IRC channel for Renesas ARM32 port
      MAINTAINERS: Specify IRC channel for Renesas ARM64 port

Shawn Guo (3):
      Merge commit '7a7b1414ea9a3641672be768afe16f583f0b76e7' into imx/dt64
      arm64: dts: fsl-ls1028a-qds: Drop overlay syntax hard coding
      arm64: dts: freescale: Use overlay target for simplicity

Sibi Sankar (1):
      arm64: dts: qcom: sc7280: Add cpu OPP tables

Stefan Wahren (3):
      dt-bindings: arm: bcm2835: Add Raspberry Pi Zero 2 W
      ARM: dts: Add Raspberry Pi Zero 2 W
      arm64: dts: broadcom: Add reference to RPi Zero 2 W

Stephan Gerhold (1):
      arm64: dts: qcom: apq8016-sbc: Fix dtbs_check warnings for &sound

Stephen Boyd (1):
      arm64: dts: qcom: sc7180: Add board regulators for MIPI camera
trogdor boards

Suman Anna (1):
      dt-bindings: pinctrl: k3: Introduce pinmux definitions for AM62

Svyatoslav Ryhel (1):
      ARM: tegra: transformer: Drop reg-shift for Tegra HS UART

Taniya Das (1):
      arm64: dts: qcom: sc7280: Add camcc clock node

Teresa Remmet (6):
      arm64: dts: imx8mp-phycore-som: Set minimum output impedance for eth =
phy
      arm64: dts: imx8mp-phycore-som: Adapt eMMC drive strength
      arm64: dts: imx8mp-phycore-som: Reduce drive strength for fec tx line=
s
      arm64: dts: imx8mp-phycore-som: Update WDOG muxing
      arm64: dts: imx8mp-phycore-som: Set VDD_ARM run and standby voltage
      arm64: dts: imx8mp-phycore-som: LDO5 needs to be enabled instead of L=
DO4

Thara Gopinath (1):
      arm64: dts: qcom: sm8150: Add support for LMh node

Thierry Reding (8):
      ARM: dts: imx28: Use correct compatible string for RTC
      ARM: dts: imx: Rename RTC device tree nodes
      ARM: dts: am334x: pdu001: Use correct node name for RTC
      Merge branch 'for-5.18/dt-bindings' into for-5.18/arm64/dt
      arm64: tegra: Enable gpio-keys on Jetson AGX Orin Developer Kit
      arm64: tegra: Add Tegra234 IOMMUs
      arm64: tegra: Move audio IOMMU properties to ADMAIF node
      arm64: tegra: Drop arm,armv8-pmuv3 compatible string

Tim Harvey (9):
      arm64: dts: imx8mm-venice*: add PCIe support
      arm64: dts: imx8mn-venice-gw7902: disable gpu
      arm64: dts: imx8m{m,n}_venice*: add gpio-line-names
      arm64: dts: imx: Add i.mx8mm Gateworks gw7903 dts support
      dt-bindings: arm: imx: add imx8mm gw7903 support
      arm64: dts: imx8mm-venice-gw73xx-0x: add dt overlays for serial modes
      arm64: dts: imx8mm-venice-gw72xx-0x: add dt overlays for serial modes
      arm64: dts: imx8mm-venice-gw73xx-0x: add dt overlay for imx219
rpi v2 camera
      arm64: dts: imx8mm-venice-gw72xx-0x: add dt overlay for imx219
rpi v2 camera

Tudor Ambarus (5):
      ARM: dts: at91: sama5d2: Fix PMERRLOC resource size
      ARM: dts: at91: Use the generic "crypto" node name for the crypto IPs
      ARM: dts: at91: sama7g5: Add crypto nodes
      ARM: dts: at91: sama7g5: Remove unused properties in i2c nodes
      ARM: dts: at91: sama7g5: Add NAND support

Vidya Sagar (3):
      dt-bindings: Add Tegra234 PCIe clocks and resets
      dt-bindings: power: Add Tegra234 PCIe power domains
      dt-bindings: memory: Add Tegra234 PCIe memory

Vignesh Raghavendra (1):
      arm64: dts: ti: Introduce base support for AM62x SoC

Vinod Koul (5):
      dt-bindings: arm: qcom: Document SM8450 HDK boards
      arm64: dts: qcom: Add SM8450 HDK DTS
      arm64: dts: qcom: sm8450: add interconnect nodes
      arm64: dts: qcom: sdm845: Add gsi dma node
      arm64: dts: qcom: sdm845: enable dma for spi

Vladimir Lypak (3):
      arm64: dts: qcom: Add MSM8953 device tree
      arm64: dts: qcom: Add PM8953 PMIC
      arm64: dts: qcom: Add SDM632 device tree

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8250: add description of dcvsh interrupts

Wayne Chang (1):
      arm64: tegra: Enable Jetson Xavier NX USB device mode

Xianwei Zhao (2):
      dt-bindings: arm: amlogic: add S4 based AQ222 bindings
      arm64: dts: add support for S4 based Amlogic AQ222

Xilin Wu (1):
      arm64: dts: qcom: Add support for Samsung Galaxy Book2

Yann Gautier (9):
      ARM: dts: stm32: add st,stm32-sdmmc2 compatible on stm32mp151
      ARM: dts: stm32: add st,stm32-sdmmc2 compatible on stm32mp131
      ARM: dts: stm32: increase SDMMC max-frequency for STM32MP13
      ARM: dts: stm32: update SDMMC clock slew-rate on STM32MP135F-DK board
      ARM: dts: stm32: add sdmmc sleep pins for STM32MP13
      ARM: dts: stm32: add sdmmc sleep config for STM32MP135F-DK
      ARM: dts: stm32: update SDMMC version for STM32MP13
      ARM: dts: stm32: add SDMMC2 in STM32MP13 DT
      ARM: dts: stm32: add sdmmc2 pins for STM32MP13

Yassine Oudjana (4):
      dt-bindings: arm: qcom: Add msm8996 and apq8096 compatibles
      arm64: dts: qcom: msm8996-mtp: Add msm8996 compatible
      arm64: dts: qcom: msm8996: Rename cluster OPP tables
      arm64: dts: qcom: qcs404: Rename CPU and CPR OPP tables

Yifeng Zhao (1):
      arm64: dts: rockchip: add naneng combo phy nodes for rk3568

Yoshihiro Shimoda (1):
      arm64: dts: renesas: r8a779f0: Add sys-dmac nodes

Yunus Bas (1):
      ARM: dts: imx6qdl-phytec: handle unneeded MFD-subdevices correctly

Zev Weiss (2):
      ARM: dts: Fix OpenBMC flash layout label addresses
      ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC

kartik (1):
      arm64: tegra: Enable UART instance on 40-pin header

 Documentation/devicetree/bindings/arm/airoha.yaml  |   28 +
 Documentation/devicetree/bindings/arm/altera.yaml  |   46 +-
 Documentation/devicetree/bindings/arm/amlogic.yaml |   12 +
 .../devicetree/bindings/arm/atmel-at91.yaml        |    9 +
 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |    1 +
 Documentation/devicetree/bindings/arm/cpus.yaml    |    1 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |   24 +
 .../devicetree/bindings/arm/intel,socfpga.yaml     |   26 +
 .../devicetree/bindings/arm/mediatek.yaml          |    4 +
 .../devicetree/bindings/arm/mstar/mstar.yaml       |    4 +
 .../devicetree/bindings/arm/npcm/nuvoton,gcr.yaml  |   48 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   23 +-
 Documentation/devicetree/bindings/arm/renesas.yaml |    9 +
 .../devicetree/bindings/arm/rockchip.yaml          |   13 +
 .../bindings/arm/samsung/samsung-boards.yaml       |    2 +
 .../devicetree/bindings/arm/stm32/stm32.yaml       |    6 +
 Documentation/devicetree/bindings/arm/sunxi.yaml   |    5 +
 Documentation/devicetree/bindings/arm/tesla.yaml   |   27 +
 Documentation/devicetree/bindings/arm/ti/k3.yaml   |    6 +
 .../devicetree/bindings/clock/intc_stratix10.txt   |   20 -
 .../devicetree/bindings/clock/intel,stratix10.yaml |   35 +
 .../bindings/clock/mstar,msc313-cpupll.yaml        |   45 +
 .../devicetree/bindings/clock/tesla,fsd-clock.yaml |  198 +++
 .../devicetree/bindings/phy/qcom,usb-hs-phy.txt    |    1 +
 .../pinctrl/samsung,pinctrl-gpio-bank.yaml         |   52 +
 .../bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml |   81 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |  106 ++
 .../bindings/pinctrl/samsung,pinctrl.yaml          |  392 +++++
 .../bindings/pinctrl/samsung-pinctrl.txt           |  383 ----
 .../devicetree/bindings/power/fsl,imx-gpcv2.yaml   |    2 +
 .../bindings/power/renesas,rzg2l-sysc.yaml         |    7 +-
 .../bindings/soc/imx/fsl,imx8mp-hsio-blk-ctrl.yaml |   78 +
 .../bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml  |   71 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    1 +
 .../bindings/sound/nvidia,tegra30-hda.yaml         |    3 +
 .../bindings/timer/mediatek,mtk-timer.txt          |    1 +
 Documentation/devicetree/bindings/usb/dwc2.yaml    |    8 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   18 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt       |    1 +
 MAINTAINERS                                        |   18 +-
 arch/arm/Kconfig                                   |   12 +
 arch/arm/Makefile                                  |    1 +
 arch/arm/boot/dts/Makefile                         |   19 +-
 arch/arm/boot/dts/am335x-pdu001.dts                |    2 +-
 .../boot/dts/am335x-sancloud-bbe-extended-wifi.dts |  113 ++
 arch/arm/boot/dts/armada-370-c200-v2.dts           |  388 +++++
 arch/arm/boot/dts/armada-385-turris-omnia.dts      |    3 +
 arch/arm/boot/dts/armada-385.dtsi                  |   52 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |   26 +-
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts  |  259 +++
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts |  320 ++--
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |   11 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |   33 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |   12 +-
 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts        |  610 +++++++
 arch/arm/boot/dts/at91-sam9x60ek.dts               |    8 +-
 arch/arm/boot/dts/at91-sama7g5ek.dts               |   32 +-
 arch/arm/boot/dts/bcm2711.dtsi                     |   50 +
 arch/arm/boot/dts/bcm2835.dtsi                     |   17 +
 arch/arm/boot/dts/bcm2836.dtsi                     |   50 +
 arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts         |  136 ++
 arch/arm/boot/dts/bcm2837.dtsi                     |   49 +
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts       |   76 +
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |    8 +
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi      |    3 +-
 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi    |    3 +-
 .../arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi |   10 +-
 arch/arm/boot/dts/en7523-evb.dts                   |   35 +
 arch/arm/boot/dts/en7523.dtsi                      |  138 ++
 arch/arm/boot/dts/exynos3250-artik5.dtsi           |   10 +-
 arch/arm/boot/dts/exynos3250-monk.dts              |    2 +-
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi          |  165 +-
 arch/arm/boot/dts/exynos3250-rinato.dts            |    2 +-
 arch/arm/boot/dts/exynos3250.dtsi                  |    4 +-
 arch/arm/boot/dts/exynos4.dtsi                     |    6 +-
 arch/arm/boot/dts/exynos4210-i9100.dts             |   30 +-
 arch/arm/boot/dts/exynos4210-origen.dts            |    2 +-
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi          |  226 +--
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |    4 +-
 arch/arm/boot/dts/exynos4210-trats.dts             |    6 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |   14 +-
 arch/arm/boot/dts/exynos4210.dtsi                  |    2 -
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        |    4 +-
 arch/arm/boot/dts/exynos4412-itop-elite.dts        |    2 +-
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi    |    2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi            |   30 +-
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |    8 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts           |    2 +-
 arch/arm/boot/dts/exynos4412-origen.dts            |    4 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi           |   78 +-
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi          |  252 +--
 arch/arm/boot/dts/exynos4412-smdk4412.dts          |    4 +-
 arch/arm/boot/dts/exynos4412.dtsi                  |    2 +-
 arch/arm/boot/dts/exynos5250-arndale.dts           |    7 +-
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi          |  222 +--
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      |   27 +-
 arch/arm/boot/dts/exynos5250-snow-rev5.dts         |    2 +-
 arch/arm/boot/dts/exynos5250-snow.dts              |    2 +-
 arch/arm/boot/dts/exynos5250-spring.dts            |   25 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |   19 +-
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi          |  148 +-
 arch/arm/boot/dts/exynos5260-xyref5260.dts         |   23 +-
 arch/arm/boot/dts/exynos5260.dtsi                  |  128 ++
 arch/arm/boot/dts/exynos5410-odroidxu.dts          |   34 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi          |  170 +-
 arch/arm/boot/dts/exynos5410-smdk5410.dts          |   27 +-
 arch/arm/boot/dts/exynos5410.dtsi                  |    4 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      |   12 +-
 arch/arm/boot/dts/exynos5420-chagall-wifi.dts      |   75 +
 .../arm/boot/dts/exynos5420-galaxy-tab-common.dtsi |  691 ++++++++
 arch/arm/boot/dts/exynos5420-klimt-wifi.dts        |   75 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts         |   99 +-
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi          |  194 +--
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |   19 +-
 arch/arm/boot/dts/exynos5420.dtsi                  |   26 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      |    4 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |    6 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts          |   99 +-
 arch/arm/boot/dts/imx28-tx28.dts                   |    2 +-
 arch/arm/boot/dts/imx28.dtsi                       |    2 +
 arch/arm/boot/dts/imx51-ts4800.dts                 |    2 +-
 arch/arm/boot/dts/imx53-m53menlo.dts               |   29 +-
 arch/arm/boot/dts/imx53-tx53.dtsi                  |    2 +-
 arch/arm/boot/dts/imx6dl-plym2m.dts                |  131 +-
 arch/arm/boot/dts/imx6dl-prtvt7.dts                |  203 ++-
 arch/arm/boot/dts/imx6dl-victgo.dts                |  121 +-
 arch/arm/boot/dts/imx6q-tbs2910.dts                |    2 +-
 arch/arm/boot/dts/imx6qdl-dhcom-pdk2.dtsi          |    3 +
 arch/arm/boot/dts/imx6qdl-mba6.dtsi                |   16 +-
 arch/arm/boot/dts/imx6qdl-mba6a.dtsi               |    6 -
 arch/arm/boot/dts/imx6qdl-mba6b.dtsi               |   11 +-
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi       |   13 +
 arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi  |   10 +
 arch/arm/boot/dts/imx6qdl-tqma6.dtsi               |   14 +
 arch/arm/boot/dts/imx6qdl-tqma6a.dtsi              |    7 +-
 arch/arm/boot/dts/imx6qdl-tqma6b.dtsi              |    7 +-
 arch/arm/boot/dts/imx6qdl-tx6-mb7.dtsi             |    2 +-
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi              |   12 +-
 arch/arm/boot/dts/imx6qp-sabresd.dts               |    6 +-
 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi             |   74 +
 arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts       |    2 +-
 arch/arm/boot/dts/imx7-colibri-aster.dtsi          |    2 +-
 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi        |    2 +-
 arch/arm/boot/dts/imx7-colibri.dtsi                |    4 +-
 arch/arm/boot/dts/imx7-mba7.dtsi                   |    2 +-
 arch/arm/boot/dts/imx7d-nitrogen7.dts              |    2 +-
 arch/arm/boot/dts/imx7d-pico-hobbit.dts            |    4 +-
 arch/arm/boot/dts/imx7d-pico-pi.dts                |    4 +-
 arch/arm/boot/dts/imx7d-sdb.dts                    |    4 +-
 arch/arm/boot/dts/imx7d.dtsi                       |   86 +-
 arch/arm/boot/dts/imx7s-warp.dts                   |    4 +-
 arch/arm/boot/dts/imxrt1050-pinfunc.h              |  993 +++++++++++
 arch/arm/boot/dts/intel-ixp42x-gateway-7001.dts    |    3 +-
 ...g302v2.dts =3D> intel-ixp42x-netgear-wg302v1.dts} |   29 +-
 arch/arm/boot/dts/intel-ixp42x.dtsi                |    2 +-
 arch/arm/boot/dts/iwg20d-q7-common.dtsi            |    2 +-
 arch/arm/boot/dts/kirkwood-c200-v1.dts             |  310 ++++
 arch/arm/boot/dts/lan966x-pcb8291.dts              |   64 +
 arch/arm/boot/dts/lan966x.dtsi                     |  237 +++
 arch/arm/boot/dts/logicpd-torpedo-35xx-devkit.dts  |    8 +
 arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts  |    9 +
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi   |   41 +-
 arch/arm/boot/dts/mstar-infinity.dtsi              |   34 +
 .../boot/dts/mstar-infinity2m-ssd201-som2d01.dtsi  |   20 +
 ...tar-infinity2m-ssd202d-100ask-dongshanpione.dts |   25 +
 .../dts/mstar-infinity2m-ssd202d-miyoo-mini.dts    |   25 +
 ...y2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts |   23 +
 ...infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi |   28 +
 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi    |    5 +
 arch/arm/boot/dts/mstar-infinity2m.dtsi            |   17 +
 arch/arm/boot/dts/mstar-infinity3.dtsi             |   58 +
 arch/arm/boot/dts/mstar-v7.dtsi                    |    9 +
 arch/arm/boot/dts/mt6582-prestigio-pmt5008-3g.dts  |   43 +
 arch/arm/boot/dts/mt6582.dtsi                      |  128 ++
 .../dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts  |   43 +
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi             |  384 +++++
 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi     |    2 +-
 arch/arm/boot/dts/openbmc-flash-layout.dtsi        |    2 +-
 arch/arm/boot/dts/ox810se-wd-mbwe.dts              |    4 +
 arch/arm/boot/dts/ox810se.dtsi                     |   18 +
 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts        |  132 +-
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |    6 +-
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts |    3 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                |   19 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |    4 +-
 arch/arm/boot/dts/qcom-mdm9615.dtsi                |    3 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi                |  125 ++
 arch/arm/boot/dts/qcom-msm8660.dtsi                |    3 +-
 arch/arm/boot/dts/qcom-msm8960-cdp.dts             |    2 +-
 arch/arm/boot/dts/qcom-msm8960.dtsi                |   30 +-
 arch/arm/boot/dts/qcom-pm8226.dtsi                 |   43 +
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |    4 +-
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts      |    2 +-
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |    4 +-
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts            |    4 +-
 arch/arm/boot/dts/r8a7742-iwg21m.dtsi              |    2 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          |    2 +-
 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts        |    5 +
 arch/arm/boot/dts/r9a06g032.dtsi                   |   27 +
 arch/arm/boot/dts/rk3188-px3-evb.dts               |    2 +-
 arch/arm/boot/dts/rk3288.dtsi                      |    1 -
 arch/arm/boot/dts/rv1108-elgin-r1.dts              |    1 +
 arch/arm/boot/dts/rv1108-evb.dts                   |    1 +
 arch/arm/boot/dts/s3c2416-pinctrl.dtsi             |   60 +-
 arch/arm/boot/dts/s3c6410-mini6410.dts             |    4 +-
 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi             |  210 +--
 arch/arm/boot/dts/s3c64xx.dtsi                     |   16 +-
 arch/arm/boot/dts/s5pv210-aquila.dts               |    2 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi               |   40 +-
 arch/arm/boot/dts/s5pv210-fascinate4g.dts          |   12 +-
 arch/arm/boot/dts/s5pv210-galaxys.dts              |   16 +-
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi             |  226 +--
 arch/arm/boot/dts/sam9x60.dtsi                     |   10 +-
 arch/arm/boot/dts/sama5d2.dtsi                     |   11 +-
 arch/arm/boot/dts/sama5d3.dtsi                     |    6 +-
 arch/arm/boot/dts/sama5d4.dtsi                     |    9 +-
 arch/arm/boot/dts/sama7g5.dtsi                     |  243 ++-
 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts  |    2 +-
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi       |    2 +-
 arch/arm/boot/dts/socfpga_arria5_socdk.dts         |    4 +-
 arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dts |    2 +-
 .../arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dts |    2 +-
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       |    2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts      |    2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sodia.dts       |    2 +-
 arch/arm/boot/dts/ste-ab8500.dtsi                  |   39 +-
 arch/arm/boot/dts/ste-ab8505.dtsi                  |   34 +-
 arch/arm/boot/dts/ste-href-ab8500.dtsi             |    2 +-
 arch/arm/boot/dts/ste-href.dtsi                    |   25 +-
 arch/arm/boot/dts/ste-snowball.dts                 |   27 +-
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts     |   22 +-
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     |   22 +-
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts     |   22 +-
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     |   24 +-
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts       |   22 +-
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     |   22 +-
 arch/arm/boot/dts/stih407-clock.dtsi               |  101 +-
 arch/arm/boot/dts/stih407-family.dtsi              |  262 ++-
 arch/arm/boot/dts/stih410-b2120.dts                |   16 +-
 arch/arm/boot/dts/stih410-b2260.dts                |   30 +-
 arch/arm/boot/dts/stih410-clock.dtsi               |  100 +-
 arch/arm/boot/dts/stih410.dtsi                     |   52 +-
 arch/arm/boot/dts/stih418-b2199.dts                |   22 +-
 arch/arm/boot/dts/stih418-clock.dtsi               |  101 +-
 arch/arm/boot/dts/stih418.dtsi                     |   38 +-
 arch/arm/boot/dts/stihxxx-b2120.dtsi               |   22 +-
 arch/arm/boot/dts/stm32429i-eval.dts               |   12 +
 arch/arm/boot/dts/stm32746g-eval.dts               |   12 +
 arch/arm/boot/dts/stm32f429-disco.dts              |   12 +
 arch/arm/boot/dts/stm32f429.dtsi                   |   57 +-
 arch/arm/boot/dts/stm32f469-disco.dts              |   16 +
 arch/arm/boot/dts/stm32f746-disco.dts              |   12 +
 arch/arm/boot/dts/stm32f746.dtsi                   |   47 -
 arch/arm/boot/dts/stm32f769-disco.dts              |   12 +
 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi           |   81 +-
 arch/arm/boot/dts/stm32mp131.dtsi                  |   89 +-
 arch/arm/boot/dts/stm32mp135f-dk.dts               |    7 +-
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |   94 +-
 arch/arm/boot/dts/stm32mp151.dtsi                  |   37 +-
 arch/arm/boot/dts/stm32mp153.dtsi                  |    7 +
 .../dts/stm32mp157a-icore-stm32mp1-ctouch2.dts     |    2 +
 .../dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts    |    2 +
 arch/arm/boot/dts/stm32mp157a-iot-box.dts          |    2 +
 ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts |    4 +
 .../stm32mp157a-microgea-stm32mp1-microdev2.0.dts  |    4 +
 arch/arm/boot/dts/stm32mp157a-stinger96.dtsi       |    6 +
 arch/arm/boot/dts/stm32mp157c-ed1.dts              |    2 +
 arch/arm/boot/dts/stm32mp157c-emsbc-argon.dts      |   53 +
 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi   |  552 ++++++
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts          |    2 +
 arch/arm/boot/dts/stm32mp157c-odyssey.dts          |    2 +
 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     |    4 +
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      |    4 +
 arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   |    4 +
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |    3 +-
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |    6 +
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi       |   56 +
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |    4 +
 arch/arm/boot/dts/sun7i-a20-haoyu-marsboard.dts    |  182 ++
 arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts      |   28 +
 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts          |    4 +
 arch/arm/boot/dts/sun8i-h3.dtsi                    |    2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi                   |   22 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 |   18 +
 arch/arm/boot/dts/tegra20-asus-tf101.dts           |   12 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi             |    2 +-
 arch/arm/boot/dts/tegra20-paz00.dts                |    6 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi            |    6 +-
 arch/arm/boot/dts/tegra30-asus-tf700t.dts          |    2 +-
 .../boot/dts/tegra30-asus-transformer-common.dtsi  |    2 +
 arch/arm/boot/dts/tegra30-colibri.dtsi             |    2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 |    2 +-
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts     |    2 +
 arch/arm/boot/dts/vf-colibri-eval-v3.dtsi          |    2 +-
 arch/arm/mach-airoha/Makefile                      |    2 +
 arch/arm/mach-airoha/airoha.c                      |   16 +
 arch/arm64/Kconfig.platforms                       |    6 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   24 +-
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |    3 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |    3 +-
 arch/arm64/boot/dts/amlogic/Makefile               |    7 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   43 +
 .../dts/amlogic/meson-gxl-s905d-vero4k-plus.dts    |  117 ++
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |   30 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   99 ++
 .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |  129 ++
 .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts      |  108 ++
 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |  300 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  |  145 ++
 .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    |  133 ++
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts  |  112 ++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |   27 +
 arch/arm64/boot/dts/arm/Makefile                   |    2 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi             |    5 +-
 arch/arm64/boot/dts/arm/juno-r1-scmi.dts           |   23 +
 arch/arm64/boot/dts/arm/juno-r2-scmi.dts           |   23 +
 arch/arm64/boot/dts/arm/juno-scmi.dts              |    9 +
 arch/arm64/boot/dts/arm/juno-scmi.dtsi             |  199 +++
 arch/arm64/boot/dts/broadcom/Makefile              |    3 +-
 .../boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts     |    2 +
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  |  161 +-
 .../arm64/boot/dts/broadcom/northstar2/ns2-svk.dts |    8 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |    8 +-
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |    6 +-
 arch/arm64/boot/dts/exynos/Makefile                |    8 +-
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |  211 +--
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  276 +--
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |    7 +-
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   11 +-
 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi    |  176 +-
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |   44 +-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |   92 +
 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi |  855 +++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         |  423 +++++
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |  195 +++
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |  663 +++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  701 ++++++++
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi      |   50 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |    2 +-
 arch/arm64/boot/dts/freescale/Makefile             |   55 +-
 .../boot/dts/freescale/fsl-ls1028a-qds-13bb.dts    |  146 +-
 .../boot/dts/freescale/fsl-ls1028a-qds-65bb.dts    |  138 +-
 .../boot/dts/freescale/fsl-ls1028a-qds-7777.dts    |   99 +-
 .../boot/dts/freescale/fsl-ls1028a-qds-85bb.dts    |  134 +-
 .../boot/dts/freescale/fsl-ls1028a-qds-899b.dts    |   86 +-
 .../boot/dts/freescale/fsl-ls1028a-qds-9999.dts    |   97 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |   24 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   11 +
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi    |   16 +
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |   57 +
 .../boot/dts/freescale/imx8mm-emcon-avari.dts      |   23 +
 .../boot/dts/freescale/imx8mm-emcon-avari.dtsi     |  139 ++
 arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi    |  627 +++++++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   55 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |    7 +-
 arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts    |  304 ++++
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |   19 +
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |    5 +
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |   49 +
 .../freescale/imx8mm-venice-gw72xx-0x-imx219.dts   |   93 +
 .../imx8mm-venice-gw72xx-0x-rs232-rts.dts          |   53 +
 .../freescale/imx8mm-venice-gw72xx-0x-rs422.dts    |   61 +
 .../freescale/imx8mm-venice-gw72xx-0x-rs485.dts    |   61 +
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |   78 +
 .../freescale/imx8mm-venice-gw73xx-0x-imx219.dts   |   93 +
 .../imx8mm-venice-gw73xx-0x-rs232-rts.dts          |   53 +
 .../freescale/imx8mm-venice-gw73xx-0x-rs422.dts    |   61 +
 .../freescale/imx8mm-venice-gw73xx-0x-rs485.dts    |   61 +
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   |   78 +
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   59 +
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   89 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |  836 +++++++++
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   |  150 ++
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi      |   67 +
 .../dts/freescale/imx8mm-verdin-nonwifi-dahlia.dts |   18 +
 .../dts/freescale/imx8mm-verdin-nonwifi-dev.dts    |   18 +
 .../boot/dts/freescale/imx8mm-verdin-nonwifi.dtsi  |   75 +
 .../dts/freescale/imx8mm-verdin-wifi-dahlia.dts    |   18 +
 .../boot/dts/freescale/imx8mm-verdin-wifi-dev.dts  |   18 +
 .../boot/dts/freescale/imx8mm-verdin-wifi.dtsi     |   94 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   | 1264 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   68 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |   51 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  104 ++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   50 +
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |   39 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |    1 +
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   39 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    1 +
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      |  144 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi  |    4 -
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   64 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  |    4 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi  |    8 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   18 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi |    8 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi |    8 +
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |    6 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |    5 +-
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |    7 +-
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts   |    1 +
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |   10 +
 arch/arm64/boot/dts/lg/lg1312.dtsi                 |    3 +-
 arch/arm64/boot/dts/lg/lg1313.dtsi                 |    3 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |    1 +
 arch/arm64/boot/dts/mediatek/mt6358.dtsi           |   12 +
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts       |    3 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |   68 +-
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts       |    3 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   12 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  299 +++-
 arch/arm64/boot/dts/nvidia/Makefile                |   11 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   46 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |   25 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   54 +-
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 1824 ++++++++++++++++=
++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 1010 +++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  |   12 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |   12 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   13 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   35 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   23 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |    2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              | 1326 ++++++++++++++
 .../boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts   |   14 +
 .../boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts  |   14 +
 ...llhead-rev-101.dts =3D> msm8992-lg-bullhead.dtsi} |    2 -
 ...v-101.dts =3D> msm8994-huawei-angler-rev-101.dts} |    0
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    7 +-
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts           |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   34 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   56 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |   10 +
 arch/arm64/boot/dts/qcom/pm8953.dtsi               |   90 +
 arch/arm64/boot/dts/qcom/pms405.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    4 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   16 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   16 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  126 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |    2 +
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   97 ++
 arch/arm64/boot/dts/qcom/sc7280-crd.dts            |   12 +
 .../dts/qcom/sc7280-herobrine-herobrine-r0.dts     | 1352 +++++++++++++++
 .../dts/qcom/sc7280-herobrine-herobrine-r1.dts     |  313 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dts      |   14 -
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     | 1105 +++---------
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi     |    2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   20 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  215 +--
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |    4 +
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |  547 ++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  815 ++++++++-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  183 ++
 arch/arm64/boot/dts/qcom/sdm632.dtsi               |   81 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    7 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   19 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   12 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   12 +
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |  736 ++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  115 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   33 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |  748 ++++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    9 +
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |   20 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  154 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  132 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   20 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  405 +++++
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |   20 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  417 ++++-
 arch/arm64/boot/dts/renesas/Makefile               |    3 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |    9 +-
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |    3 +-
 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi      |  332 ++++
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |    2 +-
 .../boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi      |    2 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   14 +-
 .../boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts |    2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |    4 +-
 .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts |    2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   10 +-
 .../boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts |    2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |    4 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   26 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   26 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   43 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   26 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |  102 ++
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |  191 ++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   24 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   24 +-
 .../boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi  |  229 +++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   35 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |   28 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |   86 +
 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi       |   32 +
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts  |   91 +
 arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi       |   20 +
 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts  |    2 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |  491 ++++++
 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi       |   25 +
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts  |   26 +
 arch/arm64/boot/dts/renesas/r9a07g054l2.dtsi       |   13 +
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi   |  207 +++
 .../boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi  |  137 ++
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |    2 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |  322 +---
 .../boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi |   94 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |  222 +++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |   77 +
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  141 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   20 +-
 arch/arm64/boot/dts/rockchip/Makefile              |    3 +
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         |    1 +
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |   11 +-
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |    2 +-
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi      |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts  |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |    2 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    4 +-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |   11 +
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |    2 -
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi  |    2 +-
 .../boot/dts/rockchip/rk3566-pinenote-v1.1.dts     |   18 +
 .../boot/dts/rockchip/rk3566-pinenote-v1.2.dts     |   18 +
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |  639 +++++++
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |  136 ++
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts |  457 +++++
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |  205 ++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |   21 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  257 +++
 arch/arm64/boot/dts/tesla/Makefile                 |    3 +
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   39 +
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi         |  335 ++++
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |  754 ++++++++
 arch/arm64/boot/dts/ti/Makefile                    |    2 +
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |  267 +++
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi            |   36 +
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi         |   41 +
 arch/arm64/boot/dts/ti/k3-am62.dtsi                |  105 ++
 arch/arm64/boot/dts/ti/k3-am625-sk.dts             |  206 +++
 arch/arm64/boot/dts/ti/k3-am625.dtsi               |  103 ++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |   23 +-
 arch/arm64/boot/dts/ti/k3-am64.dtsi                |    4 +
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            |    4 +-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             |    4 +-
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi |    2 -
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |    5 +-
 arch/arm64/boot/dts/ti/k3-am65.dtsi                |    1 +
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |    8 +-
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |    5 +-
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi        |    4 +-
 arch/arm64/boot/dts/ti/k3-j7200.dtsi               |    1 +
 .../boot/dts/ti/k3-j721e-common-proc-board.dts     |    4 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          |    5 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts             |    2 -
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi        |    4 +-
 arch/arm64/boot/dts/ti/k3-j721e.dtsi               |    1 +
 .../boot/dts/ti/k3-j721s2-common-proc-board.dts    |   14 +-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |    5 +-
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi   |    4 +-
 arch/arm64/boot/dts/ti/k3-j721s2.dtsi              |   23 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   76 +-
 arch/arm64/configs/defconfig                       |    1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |    2 -
 drivers/pinctrl/samsung/pinctrl-exynos.c           |    4 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   87 +-
 include/dt-bindings/clock/at91.h                   |    1 +
 include/dt-bindings/clock/fsd-clk.h                |  150 ++
 include/dt-bindings/clock/r9a06g032-sysctrl.h      |    1 +
 include/dt-bindings/clock/r9a07g054-cpg.h          |  229 +++
 include/dt-bindings/clock/tegra234-clock.h         |  135 +-
 include/dt-bindings/memory/tegra234-mc.h           |   75 +
 include/dt-bindings/pinctrl/k3.h                   |    3 +
 include/dt-bindings/power/imx8mp-power.h           |   35 +
 include/dt-bindings/power/imx8mq-power.h           |    3 +
 include/dt-bindings/power/tegra234-powergate.h     |   22 +
 include/dt-bindings/reset/tegra234-reset.h         |   45 +-
 586 files changed, 41187 insertions(+), 5539 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/airoha.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/intel,socfpga.yam=
l
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.=
yaml
 create mode 100644 Documentation/devicetree/bindings/arm/tesla.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/intc_stratix10.=
txt
 create mode 100644 Documentation/devicetree/bindings/clock/intel,stratix10=
.yaml
 create mode 100644
Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/tesla,fsd-clock=
.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-gpio-bank.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.=
yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/soc/imx/fsl,imx8mp-hsio-blk-ctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-extended-wifi.dts
 create mode 100644 arch/arm/boot/dts/armada-370-c200-v2.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
 create mode 100644 arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts
 create mode 100644 arch/arm/boot/dts/en7523-evb.dts
 create mode 100644 arch/arm/boot/dts/en7523.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5420-chagall-wifi.dts
 create mode 100644 arch/arm/boot/dts/exynos5420-galaxy-tab-common.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5420-klimt-wifi.dts
 create mode 100644 arch/arm/boot/dts/imxrt1050-pinfunc.h
 rename arch/arm/boot/dts/{intel-ixp42x-netgear-wg302v2.dts =3D>
intel-ixp42x-netgear-wg302v1.dts} (77%)
 create mode 100644 arch/arm/boot/dts/kirkwood-c200-v1.dts
 create mode 100644 arch/arm/boot/dts/lan966x-pcb8291.dts
 create mode 100644 arch/arm/boot/dts/lan966x.dtsi
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01.dtsi
 create mode 100644
arch/arm/boot/dts/mstar-infinity2m-ssd202d-100ask-dongshanpione.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-miyoo-mini.d=
ts
 create mode 100644
arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.=
dts
 create mode 100644
arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi
 create mode 100644 arch/arm/boot/dts/mt6582-prestigio-pmt5008-3g.dts
 create mode 100644 arch/arm/boot/dts/mt6582.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp157c-emsbc-argon.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
 create mode 100644 arch/arm/boot/dts/sun7i-a20-haoyu-marsboard.dts
 create mode 100644 arch/arm/mach-airoha/Makefile
 create mode 100644 arch/arm/mach-airoha/airoha.c
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus=
.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.d=
ts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
 create mode 100644 arch/arm64/boot/dts/arm/juno-r1-scmi.dts
 create mode 100644 arch/arm64/boot/dts/arm/juno-r2-scmi.dts
 create mode 100644 arch/arm64/boot/dts/arm/juno-scmi.dts
 create mode 100644 arch/arm64/boot/dts/arm/juno-scmi.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts
 create mode 100644
arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dts
 create mode 100644
arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dts
 create mode 100644
arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dts
 create mode 100644
arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dts
 create mode 100644
arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dts
 create mode 100644
arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dts
 create mode 100644
arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dts
 create mode 100644
arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
 create mode 100644
arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev=
.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi.dts=
i
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia=
.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dt=
s
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dt=
s
 rename arch/arm64/boot/dts/qcom/{msm8992-bullhead-rev-101.dts =3D>
msm8992-lg-bullhead.dtsi} (98%)
 rename arch/arm64/boot/dts/qcom/{msm8994-angler-rev-101.dts =3D>
msm8994-huawei-angler-rev-101.dts} (100%)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8953.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.=
dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.=
dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm632.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-hdk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dts=
i
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dt=
si
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
 create mode 100644 arch/arm64/boot/dts/tesla/Makefile
 create mode 100644 arch/arm64/boot/dts/tesla/fsd-evb.dts
 create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/tesla/fsd.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-main.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-sk.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625.dtsi
 create mode 100644 include/dt-bindings/clock/fsd-clk.h
 create mode 100644 include/dt-bindings/clock/r9a07g054-cpg.h
 create mode 100644 include/dt-bindings/power/imx8mp-power.h
 create mode 100644 include/dt-bindings/power/tegra234-powergate.h
