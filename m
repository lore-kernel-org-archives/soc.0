Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808F4C433B4
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 15:57:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3576A61154; Mon, 26 Apr 2021 15:57:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9890161107
	for <soc@kernel.org>; Mon, 26 Apr 2021 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619452660;
	bh=M5tN5MhjMXAbhM7TG7TUOz5jyPLCIewY0C7ittryU6w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AWd11/XeNUAq/2IoD2Pe1twMeywKd7nWkJag8G0Ex6YiUxrt64xYUOLddQBM18pag
	 vUPtIDtLuZDlequS8m7wcYQ2vVf5U8CeEDa2Ht78U5DIi2BDJidsiKkcelYH9MoMf7
	 yL9lIaYsSqQ2ZDbfuJoXFabGzmaMUe3hzMBju4glXFTMXXuZ2xcVK/IM2zj8JKmflt
	 e2Wlb0f+WhuL5APD87iAXnkI5ZVRimb63VTqSgnbKFzXL6Isz7Zg8qiFwXuurqAgBX
	 eVSTkBo+a5MmTqWWcLnMHN77nEqecNTzn1aNy1FVxpe4PffMUrrIg43E5IHCindnYQ
	 ivFV438MsNSog==
Received: by mail-wr1-f42.google.com with SMTP id e5so27780683wrg.7
        for <soc@kernel.org>; Mon, 26 Apr 2021 08:57:39 -0700 (PDT)
X-Gm-Message-State: AOAM5309i/Cm0PszBC1n5bEZZP75WX6dt48/En3CDEVjpz1UpdZ2wkPh
	lclhUHSHrghLrJXcT5/ALfJHBK88r8yaSgY4faQ=
X-Google-Smtp-Source: ABdhPJyohCzqEVUxKICztmAOrTYUwG+7jLhfd4kEfOkbBtKaXeWc7lv7Oyq5qrcNmow8BX/JTn+xgjL7N4NQIQhpx5g=
X-Received: by 2002:adf:db4f:: with SMTP id f15mr23863269wrj.99.1619452657666;
 Mon, 26 Apr 2021 08:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 26 Apr 2021 17:57:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0=urEEHzcQt0u2fbb7SLDO6NGs8aeYvNpj=jP+YWd2Hw@mail.gmail.com>
Message-ID: <CAK8P3a0=urEEHzcQt0u2fbb7SLDO6NGs8aeYvNpj=jP+YWd2Hw@mail.gmail.com>
Subject: [GIT PULL 4/6] ARM: devicetree changes for 5.13
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 405fa9e9d8664e830982c5fbcb70f9ba8656bafc=
:

  arm64: tegra: Move clocks from RT5658 endpoint to device node
(2021-03-25 14:04:49 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.1=
3

for you to fetch changes up to 3f9a3345a3a116af806064826d42cf5211dd611d:

  dt-bindings: mali-bifrost: add dma-coherent (2021-04-22 23:19:47 +0200)

----------------------------------------------------------------
ARM: devicetree changes for 5.13

There are six new SoCs added this time. Apple M1 and Nuvoton WPCM450
have separate branches because they are new SoC families that require
changes outside of device tree files. The other four are variations of
already supported chips and get merged through this branch:

 - STMicroelectronics STM32H750 is one of many variants of STM32
   microcontrollers based on the Cortex-M7 core. This is particularly
   notable since we rarely add support for new MMU-less chips
   these days. In this case, the board that gets added along with
   the platform is not a SoC reference platform but the "Art Pi"
   (https://art-pi.gitee.io/website/) machine that was originally design
   for the RT-Thread RTOS.

 - NXP i.MX8QuadMax is a variant of the growing i.MX8 embedded/industrial
   SoC family, using two Cortex-A72 and four Cortex-A53 cores. It
   gets added along with its reference board, the "NXP i.MX8QuadMax
   Multisensory Enablement Kit".

 - Qualcomm SC7280 is a Laptop SoC following the SC7180 (Snapdragon 7c)
   that is used in some Chromebooks and Windows laptops. Only a reference
   board is added for the moment.

 - TI AM64x Sita4ra is a new version of the K3 SoC family for industrial
   control, motor control, remote IO, IoT gateway etc., similar to the
   older AM65x family. Two reference machines are added alongside.

Among the newly added machines, there is a very clear skew towards 64-bit
machines now, with 12 32-bit machines compared to 23 64-bit machines. The
full list sorted by SoC is:

 - ASpeed AST2500 BMC: ASRock E3C246D4I Xeon server board
 - Allwinner A10: Topwise A721 Tablet
 - Amlogic GXL: MeCool KII TV box
 - Amlogic GXM: Mecool KIII, Minix Neo U9-H TV boxes
 - Broadcom BCM4908: TP-Link Archer C2300 V1 router
 - MStar SSD202D: M5Stack UnitV2 camera
 - Marvell Armada 38x: ATL-x530 ethernet switch
 - Mediatek MT8183 Chromebooks: Lenovo 10e, Acer Spin 311,
   Asus Flip CM3, Asus Detachable CM3
 - Mediatek MT8516/MT8183: OLogic Pumpkin Board
 - NXP i.MX7: reMarkable Tablet
 - NXP i.MX8M: Kontron pitx-imx8m, Engicam i.Core MX8M Mini
 - Nuvoton NPCM730: Quanta GBS BMC
 - Qualcomm X55: Telit FN980 TLB SoM, Thundercomm TurboX T55 SoM
 - Qualcomm MSM8998: OnePlus 5/5T phones
 - Qualcomm SM8350: Snapdragon 888 Mobile Hardware Development Kit
 - Rockchip RK3399: NanoPi R4S board
 - STM32MP1: Engicam MicroGEA STM32MP1 MicroDev 2.0 and SOM,
   EDIMM2.2 Starter Kit, Carrier, SOM
 - TI AM65: Siemens SIMATIC IOT2050 gateway

There is notable work going into extending already supported machines
and SoCs:

 - ASpeed AST2500
 - Allwinner A23, A83t, A31, A64, H6
 - Amlogic G12B
 - Broadcom BCM4908
 - Marvell Armada 7K/8K/CN91xx
 - Mediatek MT6589, MT7622, MT8173, MT8183, MT8195
 - NXP i.MX8Q, i.MX8MM, i.MX8MP
 - Qualcomm MSM8916, SC7180, SDM845, SDX55, SM8350
 - Renesas R-Car M3, V3U
 - Rockchip RK3328, RK3399
 - STEricsson U8500
 - STMicroelectronics STM32MP141
 - Samsung Exynos 4412
 - TI K3-AM65, K3-J7200
 - TI OMAP3

Among the treewide cleanups and bug fixes, two parts stand out:

 - There are a number of cleanups for issues pointed out by 'make
   dtbs_check' this time, and I expect more to come in the future as we
   increasingly check for regressions.

 - After a change to the MMC subsystem that can lead to unpredictable
   device numbers, several platforms add 'aliases' properties for these
   to give each MMC controller a fixed number.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Abhishek Kumar (1):
      arm64: dts: qcom: sc7180: add GO_LAZOR variant property for lazor

Adam Ford (1):
      arm64: dts: imx8mn-beacon: Enable SDR104 on WiFi SDIO interface

Adrien Grassein (9):
      arm64: dts: imx8mm-nitrogen-r2: add wifi/bt chip
      arm64: dts: imx8mm-nitrogen-r2: rework USDHC1
      arm64: dts: imx8mm-nitrogen-r2: add USB support
      arm64: dts: imx8mm-nitrogen-r2: add UARTs
      arm64: dts: imx8mm-nitrogen-r2: rework UART 2
      arm64: dts: imx8mm-nitrogen-r2: add PWMs
      arm64: dts: imx8mm-nitrogen-r2: add FlexSPI
      arm64: dts: imx8mm-nitrogen-r2: add audio
      arm64: dts: imx8mm-nitrogen-r2: add ecspi2 support

Ajit Pandey (1):
      arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for I2S driver

Alain Volmat (1):
      ARM: dts: stm32: enable the analog filter for all I2C nodes in stm32m=
p151

Alex Elder (1):
      ARM: dts: qcom: sdx55: add IPA information

Alexander Shiyan (8):
      ARM: dts: imx6qdl-ts7970: Drop redundant "fsl,mode" option
      ARM: dts: imx6qdl-phytec-pbab01: Select synchronous mode for AUDMUX
      ARM: dts: imx6ql-pfla02: Move "hog" pins into corresponded pin groups
      ARM: dts: clps711x: Add SYSCON nodes where it is used
      ARM: dts: clps711x: Add keypad node
      ARM: dts: clps711x: Fix serial port names
      ARM: dts: clps711x: edb7211: Add unit-address to memory node
      ARM: dts: clps711x: Add an empty chosen node to top level DTSI

Alexander Stein (1):
      arm64: dts: amlogic: Assign a fixed index to mmc devices

Alexandre Torgue (2):
      ARM: dts: stm32: add new instances for stm32h743 MCU
      ARM: dts: stm32: fix i2c node typo in stm32h743

Alexandru M Stan (1):
      arm64: dts: qcom: sc7180-trogdor: Remove fp control pins in prep
for coachz

Alexey Minnekhanov (2):
      ARM: dts: qcom: msm8974: add blsp2_uart8
      ARM: dts: qcom: msm8974-klte: Add bluetooth support

Alistair Francis (3):
      dt-bindings: Add vendor prefix for reMarkable
      dt-bindings: arm: fsl: Add the reMarkable 2 e-Ink tablet
      ARM: imx7d-remarkable2: Initial device tree for reMarkable2

Alpana Kumari (2):
      ARM: dts: aspeed: rainier: Add presence GPIOs
      ARM: dts: aspeed: everest: GPIOs support

Andreas Kemnade (1):
      ARM: dts: imx6sl-tolino-shine2hd: Add Netronix embedded controller

Andr=C3=A9 Hentschel (2):
      ARM: dts: omap3-echo: Update LED configuration
      ARM: dts: omap3-echo: Add ath6kl node

Angus Ainslie (1):
      arm64: dts: librem5: protect some partitions of the nor-flash

Arnd Bergmann (39):
      Merge tag 'renesas-arm-dt-for-v5.13-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'omap-for-v5.13/dts-genpd-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'socfpga_dts_update_for_v5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/dt
      Merge tag 'arm-soc/for-5.13/devicetree' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'arm-soc/for-5.13/devicetre-arm64' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'imx-bindgins-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt64-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'juno-updates-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/dt
      Merge tag 'ux500-dts-v5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'stm32-dt-for-v5.13-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into
arm/dt
      Merge tag 'tegra-for-5.13-dt-bindings' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'tegra-for-5.13-arm-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'tegra-for-5.13-arm64-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'v5.12-next-dts32' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'v5.12-next-dts64' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'renesas-arm-dt-for-v5.13-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'sunxi-dt-for-5.13-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/dt
      Merge tag 'mvebu-dt64-5.13-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'qcom-arm64-for-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'ti-k3-dt-for-v5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux into arm/dt
      Merge tag 'amlogic-dt64' of
git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic
into arm/dt
      Merge tag 'omap-for-v5.13/dt-v2-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'samsung-dt-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'at91-dt-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
      Merge tag 'mvebu-dt-5.13-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'bmc-5.13-devicetree' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/dt
      ARM: dts: mvebu: fix SPI device node
      ARM: dts: clps711x: fix missing interrupt parent
      Merge tag 'qcom-dts-for-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'qcom-arm64-for-5.13-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'amlogic-dt64-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic
into arm/dt
      Merge tag 'v5.13-rockchip-dts32' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'v5.13-rockchip-dts64' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'zynqmp-dt-for-v5.13' of
https://github.com/Xilinx/linux-xlnx into arm/dt
      Merge tag 'qcom-dts-for-5.13-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'qcom-arm64-for-5.13-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'bmc-5.13-devicetree-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/dt

Aryan Srivastava (1):
      ARM: dts: mvebu: Add device tree for ATL-x530 Board

Aswath Govindraju (7):
      arm64: dts: ti: k3-j721e-main: Update the speed modes supported
and their itap delay values for MMCSD subsystems
      arm64: dts: ti: k3-am642-evm: Add support for SPI EEPROM
      arm64: dts: ti: k3-am64-main: Add DT node for USB subsystem
      arm64: dts: ti: k3-am642-evm: Add USB support
      arm64: dts: ti: k3-am64: Add GPIO DT nodes
      arm64: dts: ti: k3-am642: reserve gpio in mcu domain for firmware usa=
ge
      arm64: dts: ti: k3-j7200: Add support for higher speed modes and
update delay select values for MMCSD subsystems

Bhaskar Chowdhury (1):
      ARM: dts: at91: Fix a typo

Bjorn Andersson (3):
      arm64: dts: qcom: Introduce SM8350 HDK
      dt-bindings: arm: qcom: Add SM8350 HDK
      arm64: dts: qcom: pm8150: Enable RTC

Boris Lysov (1):
      arm: mediatek: dts: activate SMP for mt6589

Brandon Wyman (2):
      ARM: dts: aspeed: rainier: Add gpio-keys-polled for fans
      ARM: dts: aspeed: everest: Add power supply i2c devices

Bryan O'Donoghue (1):
      arm64: dts: qcom: sm8250: Add venus DT node

Caleb Connolly (2):
      arm64: dts: qcom: sm8150: add other QUP nodes and iommus
      arm64: dts: qcom: sm8150: add i2c nodes

Cameron Nemo (1):
      arm64: dts: rockchip: add rk3328 dwc3 usb controller node

Christian Hewitt (6):
      dt-bindings: arm: amlogic: add support for the Minix NEO U9-H
      arm64: dts: meson: add initial device-tree for Minix NEO U9-H
      dt-bindings: arm: amlogic: add MeCool KII/KIII Pro bindings
      arm64: dts: meson: add initial device-tree for MeCool KII Pro
      arm64: dts: meson: add initial device-tree for MeCool KIII Pro
      arm64: dts: meson: remove extra tab from ODROID N2/N2+ ext_mdio node

Chunfeng Yun (11):
      arm64: dts: mt8183: update wakeup register offset
      arm64: dts: mt8173: fix property typo of 'phys' in dsi node
      arm64: dts: mediatek: mt8173: fix dtbs_check warning
      arm64: dts: mediatek: mt2712: harmonize node names
      arm64: dts: mediatek: mt8516: harmonize node names and compatibles
      arm64: dts: mediatek: mt7622: harmonize node names and compatibles
      arm64: dts: mediatek: mt8183: fix dtbs_check warning
      arm: dts: mt7629: harmonize node names and compatibles
      arm: dts: mt7623: harmonize node names and compatibles
      arm: dts: mt2701: harmonize node names and compatibles
      arm64: dts: mt8173: fix wrong power-domain phandle of pmic

Cristian Ciocaltea (1):
      ARM: dts: owl-s500-roseapplepi: Add ATC2603C PMIC

Daniel Palmer (6):
      ARM: mstar: Select MSTAR_MSC313_MPLL
      ARM: mstar: Add the external clocks to the base dsti
      ARM: mstar: Add mpll to base dtsi
      dt-bindings: vendor-prefixes: Add vendor prefix for M5Stack
      dt-bindings: arm: mstar: Add compatible for M5Stack UnitV2
      ARM: dts: mstar: Add a dts for M5Stack UnitV2

Dario Binacchi (1):
      ARM: dts: am33xx-l4: fix tscadc@0 node indentation

Dave Gerlach (4):
      dt-bindings: arm: ti: Add bindings for AM642 SoC
      dt-bindings: pinctrl: k3: Introduce pinmux definitions for AM64
      arm64: dts: ti: Add support for AM642 SoC
      arm64: dts: ti: Add support for AM642 EVM

Dien Pham (1):
      arm64: dts: renesas: salvator-common: Add cpu-supply property to
a57_0 node

Dima Azarkin (1):
      ARM: dts: imx6qdl-wandboard: add scl/sda gpios definitions for
i2c bus recovery

Dinh Nguyen (1):
      arm64: dts: intel: adjust qpsi read-delay property

Dmitry Baryshkov (8):
      arm64: dts: qcom: sm8250: split spi pinctrl config
      arm64: dts: qcom: sm8250: further split of spi pinctrl config
      arm64: dts: qcom: sm8250: add pinctrl for SPI using GPIO as a CS
      arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS
      arm64: dts: qcom: sdm845: add required clocks on the gcc
      arm64: dts: qcom: sm8250: switch usb1 qmp phy to USB3+DP mode
      arm64: dts: qcom: use dp_phy to provide clocks to dispcc
      arm64: dts: sdm845-db845c: make firmware filenames follow linux-firmw=
are

Dmitry Osipenko (15):
      ARM: tegra: ventana: Support CPU and Core voltage scaling
      ARM: tegra: ventana: Support CPU thermal throttling
      ARM: tegra: cardhu: Support CPU frequency and voltage scaling on
all board variants
      ARM: tegra: cardhu: Support CPU thermal throttling
      ARM: tegra: paz00: Enable full voltage scaling ranges for CPU
and Core domains
      ARM: tegra: acer-a500: Enable core voltage scaling
      ARM: tegra: acer-a500: Reduce thermal throttling hysteresis to 0.2C
      ARM: tegra: acer-a500: Specify all CPU cores as cooling devices
      ARM: tegra: acer-a500: Rename avdd to vdda of touchscreen node
      ARM: tegra: nexus7: Specify all CPU cores as cooling devices
      ARM: tegra: ouya: Specify all CPU cores as cooling devices
      ARM: tegra: Specify CPU suspend OPP in device-tree
      ARM: tegra: Specify memory suspend OPP in device-tree
      ARM: tegra: Specify tps65911 as wakeup source
      ARM: tegra: acer-a500: Add atmel,wakeup-method property

Dong Aisheng (16):
      dt-bindings: arm: fsl: add imx8qm boards compatible string
      dt-bindings: mailbox: mu: add imx8qm support
      arm64: dts: imx8qxp: add fallback compatible string for scu pd
      arm64: dts: imx8qxp: move scu pd node before scu clock node
      arm64: dts: imx8qxp: orginize dts in subsystems
      arm64: dts: imx8: add lsio lpcg clocks
      arm64: dts: imx8: add conn lpcg clocks
      arm64: dts: imx8: add adma lpcg clocks
      arm64: dts: imx8: switch to two cell scu clock binding
      arm64: dts: imx8: switch to new lpcg clock binding
      arm64: dts: imx8qm: add lsio ss support
      arm64: dts: imx8qm: add conn ss support
      arm64: dts: imx8: split adma ss into dma and audio ss
      arm64: dts: imx8qm: add dma ss support
      arm64: dts: imx: add imx8qm common dts file
      arm64: dts: imx: add imx8qm mek support

Douglas Anderson (9):
      arm64: dts: qcom: Move sc7180 MI2S config to board files and make pul=
ldown
      arm64: dts: qcom: Prep sc7180-trogdor trackpad IRQ for new boards
      arm64: dts: qcom: Unify the sc7180-trogdor panel nodes
      arm64: dts: qcom: Add sc7180-lazor-limozeen skus
      arm64: dts: qcom: Add sc7180-trogdor-pompom skus
      arm64: dts: qcom: Add sc7180-trogdor-coachz skus
      arm64: dts: qcom: sc7180: Avoid glitching SPI CS at bootup on trogdor
      arm64: dts: qcom: sc7180: coachz: Add "dmic_clk_en"
      arm64: dts: qcom: sc7180: pompom: Add "dmic_clk_en" + sound model

Drew Fustini (2):
      ARM: dts: am335x-pocketbeagle: unique gpio-line-names
      ARM: dts: am335x-boneblack.dts: unique gpio-line-names

Eddie James (11):
      ARM: dts: aspeed: rainier: Add additional processor CFAMs
      ARM: dts: aspeed: rainier: Enable fan watchdog
      ARM: dts: aspeed: rainier 4U: Fix fan configuration
      ARM: dts: aspeed: everest: Add FSI CFAMs and re-number engines
      ARM: dts: aspeed: everest: Add RTC
      ARM: dts: aspeed: everest: Enable fan watchdog
      ARM: dts: aspeed: Add Rainier 1S4U machine
      ARM: dts: aspeed: Rainier: Fix PCA9552 on bus 8
      ARM: dts: aspeed: Rainier: Fix humidity sensor bus address
      ARM: dts: aspeed: Rainier 1S4U: Fix fan nodes
      ARM: dts: aspeed: Rainier: Update to pass 2 hardware

Fabien Parent (4):
      dt-bindings: arm64: dts: mediatek: Add mt8516-pumpkin board
      dt-bindings: arm64: dts: mediatek: Add mt8183-pumpkin board
      arm64: dts: mt8183: add mt8183 pumpkin board
      arm64: dts: mediatek: fix reset GPIO level on pumpkin

Fabio Estevam (5):
      arm64: dts: imx8mm-nitrogen-r2: Pass the i2c3 unit name
      ARM: dts: imx53-qsb: Describe the esdhc1 card detect pin
      ARM: dts: imx6dl-plybas: Fix gpio-keys W=3D1 warnings
      ARM: dts: imx7d-mba7: Remove unsupported PCI properties
      arm64: dts: imx8mp-evk: Improve the Ethernet PHY description

Faiz Abbas (2):
      arm64: dts: ti: k3-j7200: Add gpio nodes
      arm64: dts: ti: k3-j7200-common-proc-board: Disable unused gpio modul=
es

Geert Uytterhoeven (15):
      ARM: dts: renesas: Group tuples in APMU cpus properties
      ARM: dts: renesas: Group tuples in playback and capture properties
      ARM: dts: renesas: Group tuples in pin control properties
      arm64: dts: renesas: Group tuples in playback and capture properties
      arm64: dts: renesas: Group tuples in pin control properties
      arm64: dts: renesas: Consolidate Salvator-X(S) HDMI0 handling
      ARM: dts: rza2mevb: Upstream Linux requires SDRAM
      arm64: dts: renesas: falcon: Add I2C EEPROM nodes
      arm64: dts: renesas: falcon: Add CSI/DSI sub-board
      arm64: dts: renesas: falcon: Add Ethernet sub-board
      arm64: dts: renesas: falcon: Move console config to CPU board DTS
      arm64: dts: renesas: falcon: Move watchdog config to CPU board DTS
      arm64: dts: renesas: falcon: Move AVB0 to main DTS
      ARM: dts: koelsch: Configure pull-up for SOFT_SW GPIO keys
      arm64: dts: renesas: r8a77950: Drop operating points above 1.5 GHz

George Hung (1):
      ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree

Grygorii Strashko (1):
      arm64: dts: ti: k3-am64-main: add main CPTS entry

Guido G=C3=BCnther (8):
      arm64: dts: imx8mq-librem5-devkit: Drop buck3 startup-ramp-delay
      arm64: dts: librem5: Drop assigned-clocks from SAI2
      arm64: dts: librem5-devkit: Use a less generic codec name
      arm64: dts: librem5-devkit: Add speaker amplifier
      arm64: dts: librem5-devkit: "Drop Line In Jack"
      arm64: dts: librem5-devkit: Add mux for built-in vs headset mic
      arm64: dts: librem5-devkit: Move headphone detection to sound card
      arm64: dts: imx8mq-librem5: Hog the correct gpio

Heiko Stuebner (11):
      arm64: dts: rockchip: synchronize rk3399 opps with vendor kernel
      arm64: dts: rockchip: used range'd gpu opps on rk3399
      arm64: dts: rockchip: drop separate opp table on rk3399-puma
      arm64: dts: rockchip: add phandle to timer0 on rk3368
      ARM: dts: rockchip: move rk322x mmcx aliases to board dts files
      ARM: dts: rockchip: move rv1108 mmcx aliases to board dts files
      arm64: dts: rockchip: move mmc aliases to board dts on px30
      arm64: dts: rockchip: move mmc aliases to board dts on rk3308
      arm64: dts: rockchip: move mmc aliases to board dts on rk3328
      arm64: dts: rockchip: move mmc aliases to board dts on rk3368
      arm64: dts: rockchip: move mmc aliases to board dts on rk3399

Heiko Thiery (2):
      dt-bindings: arm: fsl: add Kontron pITX-imx8m board
      arm64: dts: fsl: add support for Kontron pitx-imx8m board

Horia Geant=C4=83 (1):
      ARM: dts: ls1021a: mark crypto engine dma coherent

Hsin-Yi Wang (9):
      arm64: dts: mediatek: mt8183: evb: Add domain supply for mfg
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-damu
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-juniper
      arm64: dts: mt8183: Add kukui-jacuzzi-damu board
      arm64: dts: mt8183: Add kukui-jacuzzi-juniper board
      arm64: dts: mt8183: Add gce client reg for display subcomponents
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-kakadu
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-kodama
      arm64: dts: mt8183: Add kukui kodama board

Hyeonki Hong (2):
      arm64: dts: meson: add saradc node to ODROID N2/N2+
      arm64: dts: meson: add GPIO line names to ODROID N2/N2+

Ian Ray (1):
      ARM: dts: imx: bx50v3: Define GPIO line names

JC Kuo (1):
      dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop

Jack Pham (2):
      arm64: dts: qcom: sm8350: add USB and PHY device nodes
      arm64: dts: qcom: sm8350-mtp: enable USB nodes

Jagan Teki (15):
      dt-bindings: arm: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0
      ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 SoM
      ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 board
      dt-bindings: arm: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 7=
" OF
      ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 7" OF
      dt-bindings: arm: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0
      ARM: dts: stm32: Add Engicam i.Core STM32MP1 SoM
      ARM: dts: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0
      dt-bindings: arm: stm32: Add Engicam i.Core STM32MP1 EDIMM2.2 Starter=
 Kit
      ARM: dts: stm32: Add Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit
      dt-bindings: arm: fsl: Add Engicam i.Core MX8M Mini C.TOUCH 2.0
      dt-bindings: arm: fsl: Add Engicam i.Core MX8M Mini EDIMM2.2 Starter =
Kit
      arm64: dts: imx8mm: Add Engicam i.Core MX8M Mini SoM
      arm64: dts: imx8mm: Add Engicam i.Core MX8M Mini C.TOUCH 2.0
      arm64: dts: imx8mm: Add Engicam i.Core MX8M Mini EDIMM2.2 Starter Kit

Jami Kettunen (2):
      arm64: dts: qcom: msm8998: Disable MSS remoteproc by default
      arm64: dts: qcom: Add support for OnePlus 5/5T

Jan Kiszka (5):
      arm64: dts: ti: k3-am65-main: Add device_type to pcie*_rc nodes
      arm64: dts: ti: k3-am65-mcu: Add RTI watchdog entry
      dt-bindings: Add Siemens vendor prefix
      dt-bindings: arm: ti: Add bindings for Siemens IOT2050 boards
      arm64: dts: ti: Add support for Siemens IOT2050 boards

Jernej Skrabec (1):
      ARM: dts: sun8i: h3: beelink-x2: Add power button

Jim Wright (1):
      ARM: dts: aspeed: everest: Add UCD90320 power sequencer

Joel Stanley (2):
      ARM: dts: aspeed: rainier: Add missing fan nodes
      ARM: dts: aspeed: everest: Add size/address cells

Johan Jonker (8):
      arm64: dts: rockchip: enable dwc3 usb for A95X Z2
      arm64: dts: rockchip: add new watchdog compatible to px30.dtsi
      arm64: dts: rockchip: add new watchdog compatible to rk3308.dtsi
      arm64: dts: rockchip: add new watchdog compatible to rk3328.dtsi
      arm64: dts: rockchip: add new watchdog compatible to rk3399.dtsi
      ARM: dts: rockchip: add new watchdog compatible to rv1108.dtsi
      ARM: dts: rockchip: add new watchdog compatible to rk322x.dtsi
      ARM: dts: rockchip: remove clock-names property from watchdog
node in rv1108.dtsi

Jonathan Marek (2):
      arm64: dts: qcom: sm8250: fix display nodes
      arm64: dts: qcom: update usb qmp phy clock-cells property

Jonathan Neusch=C3=A4fer (1):
      ARM: dts: imx50-kobo-aura: Add Netronix embedded controller

Kevin Hilman (2):
      arm64: dts: amlogic: misc DT schema fixups
      dt-bindings: mali-bifrost: add dma-coherent

Kieran Bingham (3):
      arm64: dts: renesas: falcon-cpu: Add GP LEDs
      arm64: dts: renesas: r8a779a0: Add FCPVD support
      arm64: dts: renesas: r8a779a0: Add VSPD support

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Enable all used I2C busses

Konstantin Porotchkin (2):
      arm64: dts: marvell: add support for Marvell CP110 UTMI PHY
      arm64: dts: marvell: enable CP110 UTMI PHY usage

Krzysztof Kozlowski (25):
      ARM: dts: exynos: correct fuel gauge interrupt trigger level on GT-I9=
100
      ARM: dts: exynos: correct fuel gauge interrupt trigger level on
P4 Note family
      ARM: dts: exynos: correct fuel gauge interrupt trigger level on
Midas family
      ARM: dts: exynos: correct MUIC interrupt trigger level on Midas famil=
y
      ARM: dts: exynos: correct PMIC interrupt trigger level on Midas famil=
y
      ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid
X/U3 family
      ARM: dts: exynos: correct PMIC interrupt trigger level on P4 Note fam=
ily
      ARM: dts: exynos: correct PMIC interrupt trigger level on SMDK5250
      ARM: dts: exynos: correct PMIC interrupt trigger level on Snow
      ARM: dts: s5pv210: correct fuel gauge interrupt trigger level on
Fascinate family
      arm64: dts: exynos: re-order Slim SSS clocks to match dtschema
      ARM: dts: exynos: add input clock to CMU in Exynos4412 Odroid
      ARM: dts: exynos: replace deprecated NTC/Murata compatibles
      ARM: dts: exynos: white-space cleanups
      arm64: dts: exynos: white-space cleanups
      arm64: dts: intel: socfpga: override clocks by label
      arm64: dts: intel: socfpga_agilex: move clocks out of soc node
      arm64: dts: intel: socfpga_agilex: move timer out of soc node
      arm64: dts: intel: socfpga_agilex: remove default status=3Dokay
      arm64: dts: intel: socfpga_agilex: move usbphy out of soc node
      arm64: dts: intel: socfpga_agilex: use defined for GIC interrupts
      arm64: dts: intel: socfpga_agilex: align node names with dtschema
      arm64: dts: intel: socfpga_agilex_socdk_nand: align LED node
names with dtschema
      ARM: dts: qcom: msm8974-lge-nexus5: correct fuel gauge interrupt
trigger level
      ARM: dts: qcom: msm8974-samsung-klte: correct fuel gauge
interrupt trigger level

Kuldeep Singh (2):
      arm64: dts: imx8mm: Reorder flexspi clock-names entry
      arm64: dts: imx8mn: Reorder flexspi clock-names entry

Kurt Kanzenbach (1):
      ARM: dts: stm32: Add PTP clock to Ethernet controller

Lad Prabhakar (2):
      ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out ov5640 nodes
      ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support for 8-bit ov7725 sen=
sors

Laurent Pinchart (1):
      arm64: dts: zynqmp: Add power domain for the DisplayPort DMA controll=
er

Linus Walleij (10):
      ARM: dts: ux500: Fix BT+WLAN on Janice
      ARM: dts: ux500: Fix touchscreen on TVK R2
      ARM: dts: ux500: Move Synaptics to right include
      ARM: dts: ux500: Push sensors to TVK R2 board
      ARM: dts: ux500: Fix up TVK R3 sensors
      ARM: dts: ux500: Push TC35893 defines to each UIB
      ARM: dts: ux500: Totally separate TVK R2 and R3
      ARM: dts: ux500: Clarify UIB version per board
      ARM: dts: ux500: Bump AUX1 voltage
      ARM: dts: ux500: Add Cypress CTTYSP touch to TVK UIB

Lokesh Vutla (2):
      dt-bindings: arm: ti: Add bindings for AM642 SK
      arm64: dts: ti: Add support for AM642 SK

Luca Weiss (1):
      ARM: dts: qcom: msm8974-hammerhead: add mount matrix for IMU

Ludovic Desroches (1):
      ARM: dts: at91: change the key code of the gpio key

Maciej Matuszczyk (1):
      arm64: dts: rockchip: Add gpu opp nodes to px30 dtsi

Manivannan Sadhasivam (14):
      ARM: dts: qcom: sdx55: Add support for A7 PLL clock
      ARM: dts: qcom: sdx55: Add support for APCS block
      ARM: dts: qcom: sdx55: Add CPUFreq support
      ARM: dts: qcom: sdx55: Add modem SMP2P node
      ARM: dts: qcom: sdx55: Add IMEM and PIL info region
      dt-bindings: firmware: scm: Add compatible for SDX55
      ARM: dts: qcom: sdx55: Add SCM node
      ARM: dts: qcom: sdx55: Add interconnect nodes
      ARM: dts: qcom: Fix node name for NAND controller node
      ARM: dts: qcom: sdx55: Add Modem remoteproc node
      dt-bindings: arm: qcom: Add binding for Telit FN980 TLB board
      ARM: dts: qcom: sdx55: Add basic devicetree support for Telit FN980 T=
LB
      dt-bindings: arm: qcom: Add binding for Thundercomm T55 kit
      ARM: dts: qcom: sdx55: Add basic devicetree support for Thundercomm T=
55

Marek Beh=C3=BAn (1):
      arm64: dts: marvell: armada-37xx: add syscon compatible to NB clk nod=
e

Marek Vasut (7):
      arm64: dts: imx8mp: add eqos node and alias
      arm64: dts: freescale: Add support EQOS MAC on phyBOARD-Pollux-i.MX8M=
P
      ARM: dts: stm32: Fill GPIO line names on DHCOM SoM
      ARM: dts: stm32: Fill GPIO line names on AV96
      ARM: dts: stm32: Update GPIO line names on DRC02
      ARM: dts: stm32: Update GPIO line names on PicoITX
      ARM: dts: stm32: Enable crc1 and cryp1 where applicable on DHSOM

Martin Kepplinger (1):
      arm64: dts: imx8mq-librem5-r2: set nearlevel to 120

Matthew Barth (2):
      ARM: dts: aspeed: everest: Add max31785 fan controller device
      ARM: dts: aspeed: everest: Add pca9552 fan presence

Matthias Brugger (2):
      arm64: dts: mt8183-pumpkin: fix dtbs_check warning
      arm64: dts: mt8183: fix dtbs_check warning

Matthias Kaehlcke (6):
      arm64: dts: qcom: sc7180: trogdor: Add label to charger thermal zone
      arm64: dts: qcom: sc7180: Disable charger thermal zone for lazor
      arm64: dts: qcom: sc7180: trogdor: Fix trip point config of
charger thermal zone
      arm64: dts: qcom: sc7180: trogdor: Use ADC TM channel 0 instead
of 1 for charger temperature
      arm64: dts: qcom: sc7180: Set up lazor r3+ as sc7180-lite SKUs
      arm64: dts: mt8183: Configure CPU cooling

Maulik Shah (3):
      arm64: dts: qcom: sc7280: Add RSC and PDC devices
      arm64: dts: qcom: sc7280: Add reserved memory for fw
      arm64: dts: qcom: sc7280: Add cpuidle states

Michael Walle (5):
      arm64: dts: ls1028a: add interrupt to Root Complex Event Collector
      arm64: dts: fsl-ls1028a-kontron-sl28: move MTD partitions
      arm64: dts: fsl-ls1028a-kontron-sl28: combine unused partitions
      arm64: dts: ls1028a: move rtc alias to individual boards
      arm64: dts: fsl-ls1028a-kontron-sl28: add rtc0 alias

Nichole Wang (1):
      ARM: dts: aspeed: mihawk: Add GPIO line names

Nicolas Boichat (1):
      arm64: dts: mt8183: Add kukui kakadu board

Nicolas Ferre (2):
      ARM: dts: at91: sama5d2: add ETB and ETM unit name
      ARM: dts: at91: sama5d2/trivial: fix letter case for etm hex address

Niklas S=C3=B6derlund (2):
      arm64: dts: renesas: r8a779a0: Add thermal support
      arm64: dts: renesas: r8a77961: Add VIN and CSI-2 device nodes

Pascal Roeleven (2):
      dt-bindings: arm: Add Topwise A721
      ARM: dts: sun4i: Add support for Topwise A721 tablet

Paul Fertser (1):
      ARM: dts: aspeed: tiogapass: add hotplug controller

Peng Fan (3):
      dt-bindings: clock: imx8qxp-lpcg: correct the example clock-names
      arm64: dts: imx8qxp: correct usdhc clock-names sequence
      arm64: dts: imx8mp: add wdog2/3 nodes

Peter Ujfalusi (1):
      arm64: dts: ti: k3-am64-main: Enable DMA support

Philippe Schenker (1):
      ARM: dts: colibri-imx6ull: Change drive strength for usdhc2

Phong Hoang (2):
      arm64: dts: renesas: r8a779a0: Add TMU support
      arm64: dts: renesas: r8a779a0: Add CMT support

Pieter Beers (1):
      ARM: dts: sunxi: h2-plus-bananapi-m2-zero: Add HDMI out

Pratyush Yadav (6):
      arm64: dts: ti: k3-j721e-som-p0: Enable 8D-8D-8D mode on OSPI
      arm64: dts: ti: am654-base-board: Enable 8D-8D-8D mode on OSPI
      arm64: dts: ti: k3-j7200-som-p0: Add nodes for OSPI0
      arm64: dts: ti: k3-j721e-mcu: Fix ospi compatible
      arm64: dts: ti: k3-j7200-mcu: Fix ospi compatible
      arm64: dts: ti: k3-am64-main: Fix ospi compatible

Priyanga Ramasamy (1):
      ARM: dts: aspeed: everest: Add I2C components

Quanyang Wang (1):
      arm64: dts: zynqmp: Remove si5328 device nodes

Rafa=C5=82 Mi=C5=82ecki (15):
      arm64: dts: broadcom: bcm4908: describe USB PHY
      arm64: dts: broadcom: bcm4908: describe Ethernet controller
      arm64: dts: broadcom: bcm4908: describe Netgear R8000P switch
      arm64: dts: broadcom: bcm4908: add remaining Netgear R8000P LEDs
      arm64: dts: broadcom: bcm4908: describe firmware partitions
      arm64: dts: broadcom: bcm4908: fix switch parent node name
      dt-bindings: arm: bcm: document TP-Link Archer C2300 binding
      arm64: dts: broadcom: bcm4908: add TP-Link Archer C2300 V1
      arm64: dts: broadcom: bcm4908: set Asus GT-AC5300 port 7 PHY mode
      arm64: dts: broadcom: bcm4908: add Ethernet TX irq
      ARM: dts: BCM5301X: fix "reg" formatting in /memory node
      ARM: dts: BCM5301X: Describe NVMEM NVRAM on Linksys & Luxul routers
      ARM: dts: BCM5301X: Fix Linksys EA9500 partitions
      ARM: dts: BCM5301X: Set Linksys EA9500 power LED
      arm64: dts: broadcom: bcm4908: add Ethernet MAC addr

Rajendra Nayak (4):
      dt-bindings: arm: qcom: Document sc7280 SoC and board
      arm64: dts: qcom: sc7280: Add basic dts/dtsi files for sc7280 soc
      arm64: dts: qcom: SC7280: Add rpmhcc clock controller node
      arm64: dts: qcom: sc7280: Add rpmh power-domain node

Robert Foss (5):
      arm64: dts: qcom: sdm845: Add CAMSS ISP node
      arm64: dts: qcom: sdm845-db845c: Configure regulators for camss node
      arm64: dts: qcom: sdm845-db845c: Enable ov8856 sensor and connect to =
ISP
      arm64: dts: qcom: sm8350: Add thermal zones and throttling support
      arm64: dts: qcom: sm8350: Add support for PRNG EE

Robin Murphy (2):
      arm64: dts: juno: Describe PCI dma-ranges
      arm64: dts: juno: Enable more SMMUs

Russell King (3):
      arm64: dts: lx2160a-clearfog-itx: add SFP support
      arm64: dts: marvell: clearfog-gt-8k: add pwm-fan
      arm64: dts: marvell: clearfog-gt-8k: add cooling maps

Ryan Wu (1):
      dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC

Ryder Lee (1):
      arm64: dts: mt7622: add ePA/eLNA pinmux for built-in WiFi

Sai Prakash Ranjan (13):
      arm64: dts: qcom: sc7180: Rename the qmp node to power-controller
      arm64: dts: qcom: sdm845: Rename the qmp node to power-controller
      arm64: dts: qcom: sm8250: Rename the qmp node to power-controller
      arm64: dts: qcom: sm8350: Rename the qmp node to power-controller
      arm64: dts: qcom: sm8250: Fix level triggered PMU interrupt polarity
      arm64: dts: qcom: sm8350: Fix level triggered PMU interrupt polarity
      arm64: dts: qcom: sm8250: Fix timer interrupt to specify EL2
physical timer
      arm64: dts: qcom: sc7280: Add device node for APPS SMMU
      arm64: dts: qcom: sc7280: Add APSS watchdog node
      arm64: dts: qcom: sc7280: Add device tree node for LLCC
      arm64: dts: qcom: sc7280: Add IPCC for SC7280 SoC
      arm64: dts: qcom: sc7280: Add AOSS QMP node
      arm64: dts: qcom: sc7280: Add Coresight support

Samuel Holland (6):
      ARM: dts: sunxi: Use the new r_intc binding
      ARM: dts: sunxi: h3/h5: Add r_intc node
      ARM: dts: sunxi: Move wakeup-capable IRQs to r_intc
      arm64: dts: allwinner: Use the new r_intc binding
      arm64: dts: allwinner: Move wakeup-capable IRQs to r_intc
      arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection

Sandeep Maheswaram (1):
      arm64: dts: qcom: sc7180: Use pdc interrupts for USB instead of
GIC interrupts

Sebastian Krzyszkowiak (1):
      arm64: dts: imx8mq-librem5-r3: Mark buck3 as always on

Sebastian Reichel (5):
      ARM: dts: imx: Mark IIM as syscon on i.MX51/i.MX53
      ARM: dts: imx6q-ba16: add USB OTG VBUS enable GPIO
      ARM: dts: imx6q-ba16: improve PHY information
      ARM: dts: imx: bx50v3: i2c GPIOs are open drain
      ARM: dts: motorola-cpcap-mapphone: Prepare for dtbs_check parsing

Seiya Wang (3):
      dt-bindings: timer: Add compatible for Mediatek MT8195
      dt-bindings: serial: Add compatible for Mediatek MT8195
      dt-bindings: arm: Add compatible for Mediatek MT8195

Serge Semin (1):
      ARM: dts: ls1021a: Harmonize DWC USB3 DT nodes name

Shawn Guo (4):
      arm64: dts: qcom: sdm845: fix number of pins in 'gpio-ranges'
      arm64: dts: qcom: sm8150: fix number of pins in 'gpio-ranges'
      arm64: dts: qcom: sm8250: fix number of pins in 'gpio-ranges'
      arm64: dts: qcom: sm8350: fix number of pins in 'gpio-ranges'

Srinivas Kandagatla (1):
      arm64: dts: qcom: db845c: fix correct powerdown pin for WSA881x

Srinivasa Rao Mandadapu (1):
      arm64: dts: qcom: Add sound node for sc7180-trogdor-coachz

Stefan Riedmueller (2):
      ARM: dts: imx6: pfla02: Fix USB vbus enable pinmuxing
      ARM: dts: imx6: pbab01: Set USB OTG port to peripheral

Stephan Gerhold (1):
      arm64: dts: qcom: msm8916: Add GICv2 hypervisor registers/interrupt

Stephen Boyd (4):
      arm64: dts: qcom: sc7180: Update dts for DP phy inside QMP phy
      arm64: dts: qcom: trogdor: Only wakeup from pen eject
      arm64: dts: qcom: Disable camera clk on sc7180-trogdor devices by def=
ault
      arm64: dts: qcom: sc7180: Drop duplicate dp_hot_plug_det node in trog=
dor

Sujit Kautkar (1):
      arm64: dts: qcom: Move rmtfs memory region

Suman Anna (5):
      arm64: dts: ti: k3-am65-main: Add ICSSG nodes
      arm64: dts: ti: k3-j721e-main: Add ICSSG nodes
      arm64: dts: ti: k3-am64-main: Add hwspinlock node
      arm64: dts: ti: k3-am64-main: Add mailbox cluster nodes
      arm64: dts: ti: k3-am642-evm/sk: Add IPC sub-mailbox nodes

Sumit Semwal (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and panel bits

Teresa Remmet (1):
      arm64: dts: imx8mp-phyboard-pollux-rdk: Change debug UART

Thomas Schneider (1):
      arm64: dts: rockchip: add infrared receiver node to rockpro64

Tianling Shen (2):
      dt-bindings: Add doc for FriendlyARM NanoPi R4S
      rockchip: rk3399: Add support for FriendlyARM NanoPi R4S

Tim Harvey (1):
      ARM: dts: imx6qdl-gw*: Remove unnecessary #address-cells/#size-cells

Timon Baetz (2):
      ARM: dts: exynos: add charger supply for I9100
      ARM: dts: exynos: Add front camera support to I9100

Tony Lindgren (46):
      bus: ti-sysc: Fix initializing module_pa for modules without sysc reg=
ister
      bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first
      bus: ti-sysc: Detect more modules for debugging
      bus: ti-sysc: Check for old incomplete dtb
      ARM: OMAP2+: Init both prm and prcm nodes early for clocks
      soc: ti: omap-prm: Allow hardware supported retention when idle
      clk: ti: omap5: Add missing gpmc and ocmc clkctrl
      PCI: pci-dra7xx: Prepare for deferred probe with module_platform_driv=
er
      ARM: dts: Update pcie ranges for dra7
      ARM: dts: Configure interconnect target module for dra7 pcie
      ARM: dts: Properly configure dra7 edma sysconfig registers
      ARM: dts: Move dra7 l3 noc to a separate node
      ARM: dts: Configure interconnect target module for dra7 qspi
      ARM: dts: Configure interconnect target module for dra7 sata
      ARM: dts: Configure interconnect target module for dra7 mpu
      ARM: dts: Configure interconnect target module for dra7 dmm
      ARM: dts: Configure simple-pm-bus for dra7 l4_wkup
      ARM: dts: Configure simple-pm-bus for dra7 l4_per1
      ARM: dts: Configure simple-pm-bus for dra7 l4_per2
      ARM: dts: Configure simple-pm-bus for dra7 l4_per3
      ARM: dts: Configure simple-pm-bus for dra7 l4_cfg
      ARM: dts: Configure simple-pm-bus for dra7 l3
      ARM: dts: Configure power-domain for omap4 gfx
      ARM: dts: Configure power-domain for omap4 dts iss
      ARM: dts: Configure interconnect target module for omap4 dmm
      ARM: dts: Configure interconnect target module for omap4 emif
      ARM: dts: Configure interconnect target module for omap4 debugss
      ARM: dts: Configure interconnect target module for omap4 mpu
      ARM: dts: Move omap4 mmio-sram out of l3 interconnect
      ARM: dts: Move omap4 l3-noc to a separate node
      ARM: dts: Configure simple-pm-bus for omap4 l4_wkup
      ARM: dts: Configure simple-pm-bus for omap4 l4_per
      ARM: dts: Configure simple-pm-bus for omap4 l4_cfg
      ARM: dts: Prepare for simple-pm-bus for omap4 l3
      ARM: dts: Configure interconnect target module for omap5 dmm
      ARM: dts: Configure interconnect target module for omap5 emif
      ARM: dts: Configure interconnect target module for omap5 mpu
      ARM: dts: Configure interconnect target module for omap5 gpmc
      ARM: dts: Configure interconnect target module for omap5 sata
      ARM: dts: Move omap5 mmio-sram out of l3 interconnect
      ARM: dts: Move omap5 l3-noc to a separate node
      ARM: dts: Configure simple-pm-bus for omap5 l4_wkup
      ARM: dts: Configure simple-pm-bus for omap5 l4_per
      ARM: dts: Configure simple-pm-bus for omap5 l4_cfg
      ARM: dts: Configure simple-pm-bus for omap5 l3
      Merge tags 'genpd-dts-dra7', 'genpd-dts-omap4' and
'genpd-dts-omap5' into omap-for-v5.13/dts-genpd

V Sujith Kumar Reddy (1):
      arm64: dts: qcom: sc7180: Update iommu property for simultaneous play=
back

Valentin CARON - foss (1):
      ARM: dts: stm32: fix usart 2 & 3 pinconf to wake up with flow control

Venkata Lakshmi Narayana Gubba (1):
      arm64: dts: qcom: sc7180: Remove clock for bluetooth on Trogdor

Vignesh Raghavendra (6):
      arm64: dts: ti: k3-am64-main: Add CPSW DT node
      arm64: dts: ti: k3-am642-evm: add CPSW3g DT nodes
      arm64: dts: ti: k3-am642-sk: Add CPSW DT nodes
      arm64: dts: ti: k3-am64-main: Add ADC nodes
      arm64: dts: ti: k3-am64-main: Add OSPI node
      arm64: dts: ti: k3-am64-evm/sk: Add OSPI flash DT node

Vinod Koul (26):
      arm64: dts: qcom: sm8350: Add apss_smmu node
      arm64: dts: qcom: sm8350: Add UFS nodes
      arm64: dts: qcom: sm8350-mtp: enable UFS nodes
      arm64: dts: qcom: sm8350-mtp: add regulator names
      arm64: dts: qcom: sm8350: fix typo
      arm64: dts: qcom: sm8350: Add rpmhpd node
      arm64: dts: qcom: sm8350: Add rmtfs node
      arm64: dts: qcom: sm8350: Add SMP2P nodes
      arm64: dts: qcom: sm8350: Add remoteprocs
      arm64: dts: qcom: sm8350-mtp: Enable remoteprocs
      arm64: dts: qcom: sm8350: Use enums for GCC
      arm64: dts: qcom: sm8350: Add cpufreq node
      arm64: dts: qcom: apq8016-sbc: drop qcom,sbc
      arm64: dts: qcom: msm8916: don't use empty memory node
      dt-bindings: arm: qcom: Document ipq6018-cp01 board
      arm64: dts: qcom: msm8994: don't use empty memory node
      dt-bindings: arm: qcom: Document sony boards for apq8094
      arm64: dts: qcom: sm8350: Add spmi node
      arm64: dts: qcom: pmk8350: Add base dts file
      arm64: dts: qcom: pm8350: Add base dts file
      arm64: dts: qcom: pm8350b: Add base dts file
      arm64: dts: qcom: pm8350c: Add base dts file
      arm64: dts: qcom: pmr735a: Add base dts file
      arm64: dts: qcom: pmr735B: Add base dts file
      arm64: dts: qcom: sm8350-mtp: Add PMICs
      arm64: dts: qcom: sm8350: Add interconnects

Vishwanatha Subbanna (1):
      ARM: dts: aspeed: rainier: Add directly controlled LEDs

Vladimir Barinov (1):
      arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding

Vladimir Oltean (1):
      arm64: dts: ls1028a: set up the real link speed for ENETC port 2

Yoshihiro Shimoda (4):
      ARM: dts: renesas: Add mmc aliases into R-Car Gen2 board dts files
      arm64: dts: renesas: Add mmc aliases into board dts files
      arm64: dts: renesas: r8a77961: Add CAN nodes
      arm64: dts: renesas: r8a779a0: Fix PMU interrupt

Yusuke Goda (1):
      arm64: dts: renesas: ulcb: Add cpu-supply property to a57_0 node

Yuya Hamamachi (1):
      arm64: dts: renesas: r8a77961-ulcb: add HDMI Display support

Zev Weiss (1):
      ARM: dts: aspeed: Add ASRock E3C246D4I BMC

dillon min (6):
      Documentation: arm: stm32: Add stm32h750 value line doc
      dt-bindings: arm: stm32: Add compatible strings for ART-PI board
      ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h750
      ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
      ARM: stm32: Add a new SoC - STM32H750
      dt-bindings: serial: stm32: Use 'type: object' instead of false
for 'additionalProperties'

jonathan@marek.ca (1):
      arm64: dts: qcom: sm8250: Add videocc DT node

michael.kao (1):
      arm64: dts: mt8183: add thermal zone node

satya priya (2):
      arm64: dts: qcom: sc7280: Add SPMI PMIC arbiter device for SC7280
      arm64: dts: qcom: sc7280: Add RPMh regulators for sc7280-idp

 Documentation/arm/index.rst                        |    1 +
 Documentation/arm/stm32/stm32h750-overview.rst     |   34 +
 Documentation/devicetree/bindings/arm/amlogic.yaml |    3 +
 .../devicetree/bindings/arm/bcm/brcm,bcm4908.yaml  |    1 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |   16 +
 .../devicetree/bindings/arm/mediatek.yaml          |   36 +
 .../devicetree/bindings/arm/mstar/mstar.yaml       |    1 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   20 +
 .../devicetree/bindings/arm/rockchip.yaml          |    1 +
 .../devicetree/bindings/arm/stm32/stm32.yaml       |   21 +
 Documentation/devicetree/bindings/arm/sunxi.yaml   |    5 +
 Documentation/devicetree/bindings/arm/ti/k3.yaml   |    9 +
 .../devicetree/bindings/clock/imx8qxp-lpcg.yaml    |    6 +-
 .../devicetree/bindings/firmware/qcom,scm.txt      |    1 +
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |    2 +
 .../devicetree/bindings/mailbox/fsl,mu.yaml        |    5 +-
 Documentation/devicetree/bindings/media/rc.yaml    |    4 +
 .../devicetree/bindings/nvmem/mtk-efuse.txt        |    1 +
 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |    1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
 .../devicetree/bindings/serial/st,stm32-uart.yaml  |    3 +-
 .../bindings/timer/mediatek,mtk-timer.txt          |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    6 +
 arch/arm/boot/dts/Makefile                         |   18 +-
 arch/arm/boot/dts/am335x-boneblack.dts             |  132 +-
 arch/arm/boot/dts/am335x-pocketbeagle.dts          |  140 +-
 arch/arm/boot/dts/am33xx-l4.dtsi                   |   28 +-
 arch/arm/boot/dts/am33xx.dtsi                      |    3 +
 arch/arm/boot/dts/armada-385-atl-x530.dts          |  235 +++
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |   30 +
 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  |  202 +++
 .../arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts |    5 +
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       | 1747 ++++++++++++++++=
++--
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts  |   14 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts    |   14 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |  748 ++++++++-
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts        |   33 +
 arch/arm/boot/dts/at91-sam9x60ek.dts               |    3 +-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |    3 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts      |    3 +-
 arch/arm/boot/dts/at91-sama5d2_icp.dts             |    3 +-
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts          |    3 +-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |    3 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts        |    3 +-
 arch/arm/boot/dts/at91sam9260ek.dts                |    3 +-
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi        |    3 +-
 arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts        |    4 +-
 arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts        |    4 +-
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  |    4 +-
 arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts    |    5 +
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts        |    4 +-
 arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts     |    4 +-
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      |    4 +-
 arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts        |    4 +-
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |    4 +-
 arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts  |    4 +-
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts      |    5 +
 arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts        |    4 +-
 arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts  |    4 +-
 arch/arm/boot/dts/bcm4709-linksys-ea9200.dts       |    9 +-
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts        |    4 +-
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts        |    4 +-
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |    4 +-
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    |   26 +-
 arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts      |    9 +-
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts      |    9 +-
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts      |    4 +-
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts      |    9 +-
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |    9 +-
 arch/arm/boot/dts/bcm47094-netgear-r8500.dts       |    4 +-
 arch/arm/boot/dts/bcm47094-phicomm-k3.dts          |    4 +-
 arch/arm/boot/dts/dra7-l4.dtsi                     |   76 +-
 arch/arm/boot/dts/dra7.dtsi                        |  215 ++-
 arch/arm/boot/dts/ep7209.dtsi                      |   18 +-
 arch/arm/boot/dts/ep7211-edb7211.dts               |    2 +-
 arch/arm/boot/dts/exynos3250-monk.dts              |    4 +-
 arch/arm/boot/dts/exynos3250-rinato.dts            |    4 +-
 arch/arm/boot/dts/exynos4210-i9100.dts             |   56 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi            |    6 +-
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |    5 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts           |    3 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi           |    4 +-
 arch/arm/boot/dts/exynos4412-ppmu-common.dtsi      |   48 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      |    2 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi          |   28 +-
 arch/arm/boot/dts/imx50-kobo-aura.dts              |   16 +-
 arch/arm/boot/dts/imx51.dtsi                       |    2 +-
 arch/arm/boot/dts/imx53-qsb-common.dtsi            |    2 +
 arch/arm/boot/dts/imx53.dtsi                       |    2 +-
 arch/arm/boot/dts/imx6dl-plybas.dts                |    6 +-
 arch/arm/boot/dts/imx6q-b450v3.dts                 |    5 +
 arch/arm/boot/dts/imx6q-b650v3.dts                 |    5 +
 arch/arm/boot/dts/imx6q-b850v3.dts                 |    5 +
 arch/arm/boot/dts/imx6q-ba16.dtsi                  |   21 +
 arch/arm/boot/dts/imx6q-bx50v3.dtsi                |   12 +-
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-gw53xx.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-gw551x.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-gw552x.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-gw560x.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-gw5903.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-gw5904.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-gw5907.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-gw5910.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-gw5912.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-gw5913.dtsi              |    2 -
 arch/arm/boot/dts/imx6qdl-phytec-pbab01.dtsi       |    6 +-
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi       |   38 +-
 arch/arm/boot/dts/imx6qdl-ts7970.dtsi              |    1 -
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi           |   24 +-
 arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts       |    7 +-
 arch/arm/boot/dts/imx6ull-colibri.dtsi             |   12 +-
 arch/arm/boot/dts/imx7d-mba7.dts                   |    2 -
 arch/arm/boot/dts/imx7d-remarkable2.dts            |  146 ++
 arch/arm/boot/dts/iwg20d-q7-common.dtsi            |    4 +-
 arch/arm/boot/dts/ls1021a.dtsi                     |    3 +-
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi     |   59 +-
 .../boot/dts/mstar-infinity2m-ssd202d-unitv2.dts   |   25 +
 arch/arm/boot/dts/mstar-v7.dtsi                    |   23 +
 arch/arm/boot/dts/mt2701.dtsi                      |   19 +-
 arch/arm/boot/dts/mt6589.dtsi                      |    1 +
 arch/arm/boot/dts/mt7623.dtsi                      |   26 +-
 arch/arm/boot/dts/mt7623n.dtsi                     |    4 +-
 arch/arm/boot/dts/mt7629.dtsi                      |   12 +-
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts          | 1135 +++++++++++++
 arch/arm/boot/dts/omap3-echo.dts                   |  476 ++++--
 arch/arm/boot/dts/omap4-l4.dtsi                    |   39 +-
 arch/arm/boot/dts/omap4.dtsi                       |  170 +-
 arch/arm/boot/dts/omap4460.dtsi                    |   13 +-
 arch/arm/boot/dts/omap44xx-clocks.dtsi             |    8 -
 arch/arm/boot/dts/omap5-l4.dtsi                    |   67 +-
 arch/arm/boot/dts/omap5.dtsi                       |  209 ++-
 arch/arm/boot/dts/owl-s500-roseapplepi.dts         |  132 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |    2 +-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |    6 +-
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    |   52 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |    9 +
 arch/arm/boot/dts/qcom-sdx55-t55.dts               |  281 ++++
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts   |  282 ++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |  207 ++-
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             |   55 +-
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |  159 +-
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi  |   32 +
 .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi  |   29 +
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts            |    4 +-
 arch/arm/boot/dts/r8a7742.dtsi                     |    4 +-
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts             |    2 +-
 arch/arm/boot/dts/r8a7743.dtsi                     |    2 +-
 arch/arm/boot/dts/r8a7744.dtsi                     |    2 +-
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts        |    4 +-
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts             |    2 +-
 arch/arm/boot/dts/r8a7745.dtsi                     |    2 +-
 arch/arm/boot/dts/r8a77470.dtsi                    |    2 +-
 arch/arm/boot/dts/r8a7790-lager.dts                |   11 +-
 arch/arm/boot/dts/r8a7790-stout.dts                |    4 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |    4 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |   19 +-
 arch/arm/boot/dts/r8a7791-porter.dts               |    6 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |    2 +-
 arch/arm/boot/dts/r8a7792-blanche.dts              |    2 +-
 arch/arm/boot/dts/r8a7792-wheat.dts                |    2 +-
 arch/arm/boot/dts/r8a7792.dtsi                     |    2 +-
 arch/arm/boot/dts/r8a7793-gose.dts                 |   11 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |    2 +-
 arch/arm/boot/dts/r8a7794-alt.dts                  |    5 +-
 arch/arm/boot/dts/r8a7794-silk.dts                 |    8 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |    2 +-
 arch/arm/boot/dts/rk3228-evb.dts                   |    4 +
 arch/arm/boot/dts/rk3229-evb.dts                   |    4 +
 arch/arm/boot/dts/rk3229-xms6.dts                  |    6 +
 arch/arm/boot/dts/rk322x.dtsi                      |    5 +-
 arch/arm/boot/dts/rv1108-elgin-r1.dts              |    4 +
 arch/arm/boot/dts/rv1108-evb.dts                   |    4 +
 arch/arm/boot/dts/rv1108.dtsi                      |    6 +-
 arch/arm/boot/dts/s5pv210-fascinate4g.dts          |    2 +-
 arch/arm/boot/dts/sama5d2.dtsi                     |    6 +-
 arch/arm/boot/dts/sama5d3.dtsi                     |    2 +-
 arch/arm/boot/dts/ste-ab8500.dtsi                  |    4 +-
 arch/arm/boot/dts/ste-href-tvk1281618-r2.dtsi      |  214 ++-
 arch/arm/boot/dts/ste-href-tvk1281618-r3.dtsi      |  210 ++-
 arch/arm/boot/dts/ste-href-tvk1281618.dtsi         |  218 ---
 arch/arm/boot/dts/ste-href520-tvk.dts              |    4 +-
 arch/arm/boot/dts/ste-hrefprev60-tvk.dts           |    2 +-
 arch/arm/boot/dts/ste-hrefv60plus-tvk.dts          |    4 +-
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     |   48 +-
 arch/arm/boot/dts/stm32h7-pinctrl.dtsi             |  275 +++
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi           |  306 ----
 arch/arm/boot/dts/stm32h743.dtsi                   |  177 +-
 arch/arm/boot/dts/stm32h743i-disco.dts             |    2 +-
 arch/arm/boot/dts/stm32h743i-eval.dts              |    2 +-
 arch/arm/boot/dts/stm32h750.dtsi                   |    6 +
 arch/arm/boot/dts/stm32h750i-art-pi.dts            |  229 +++
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |   21 +-
 arch/arm/boot/dts/stm32mp151.dtsi                  |    8 +
 arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts      |    4 +
 .../dts/stm32mp157a-icore-stm32mp1-ctouch2.dts     |   47 +
 .../dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts    |   47 +
 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi  |  196 +++
 ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts |  154 ++
 .../stm32mp157a-microgea-stm32mp1-microdev2.0.dts  |   55 +
 .../boot/dts/stm32mp157a-microgea-stm32mp1.dtsi    |  148 ++
 arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts       |    4 +
 arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts    |    4 +
 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     |   12 +-
 arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   |   12 +-
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |   64 +
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |   35 +
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi       |    4 +
 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts       |  242 +++
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts        |    2 +-
 arch/arm/boot/dts/sun6i-a31-m9.dts                 |    2 +-
 arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts   |    2 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                   |    6 +-
 arch/arm/boot/dts/sun6i-a31s-primo81.dts           |    2 +-
 arch/arm/boot/dts/sun6i-a31s-sina31s-core.dtsi     |    2 +-
 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts   |    2 +-
 .../dts/sun6i-a31s-yones-toptech-bs1078-v2.dts     |    2 +-
 .../boot/dts/sun6i-reference-design-tablet.dtsi    |    2 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |    6 +-
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts          |    2 +-
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts     |    2 +-
 .../boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts  |    4 +-
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts       |    4 +-
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts   |    4 +-
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts          |    4 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  |    5 +-
 .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    |   25 +
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts          |   11 +
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts       |    2 +-
 arch/arm/boot/dts/sun8i-r16-parrot.dts             |    2 +-
 .../boot/dts/sun8i-reference-design-tablet.dtsi    |    2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 |   12 +
 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi    |    5 +
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |   16 +-
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi             |    2 +
 arch/arm/boot/dts/tegra20-paz00.dts                |   14 +-
 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi     |    1 +
 arch/arm/boot/dts/tegra20-ventana.dts              |   78 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi              |    1 +
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |   14 +-
 .../dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi   |    1 +
 arch/arm/boot/dts/tegra30-beaver.dts               |    1 +
 arch/arm/boot/dts/tegra30-cardhu-a04.dts           |   48 -
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |   84 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi             |    1 +
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi             |    3 +
 arch/arm/boot/dts/tegra30-ouya.dts                 |   16 +-
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi     |    3 +
 arch/arm/mach-mstar/Kconfig                        |    1 +
 arch/arm/mach-omap2/pdata-quirks.c                 |   29 +-
 arch/arm/mach-omap2/sr_device.c                    |   75 +-
 arch/arm/mach-stm32/board-dt.c                     |    1 +
 .../dts/allwinner/sun50i-a64-amarula-relic.dts     |    2 +-
 .../boot/dts/allwinner/sun50i-a64-bananapi-m64.dts |    2 +-
 .../boot/dts/allwinner/sun50i-a64-nanopi-a64.dts   |    2 +-
 .../boot/dts/allwinner/sun50i-a64-olinuxino.dts    |    2 +-
 .../boot/dts/allwinner/sun50i-a64-orangepi-win.dts |    2 +-
 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts |    2 +-
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     |    2 +-
 .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi   |    2 +-
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts      |    2 +-
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi      |    2 +-
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts      |    2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |    6 +-
 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   |   40 +-
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    |   16 +-
 .../boot/dts/allwinner/sun50i-h6-orangepi.dtsi     |   24 +-
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts      |    4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |    8 +-
 arch/arm64/boot/dts/amlogic/Makefile               |    3 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |    4 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |    1 -
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   20 +-
 .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |    2 +-
 .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |    4 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |    2 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |   56 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |    6 +
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |    2 +-
 .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |   86 +
 .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |    8 +-
 .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  113 ++
 .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  120 ++
 .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |    2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |    4 +-
 .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |    2 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi             |    5 +-
 arch/arm64/boot/dts/arm/juno-r1.dts                |    4 +
 arch/arm64/boot/dts/arm/juno-r2.dts                |    4 +
 arch/arm64/boot/dts/broadcom/bcm4908/Makefile      |    1 +
 .../broadcom/bcm4908/bcm4906-netgear-r8000p.dts    |  107 +-
 .../bcm4908/bcm4906-tplink-archer-c2300-v1.dts     |  182 ++
 .../broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts    |   44 +-
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  |   47 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |    2 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |    6 +-
 arch/arm64/boot/dts/freescale/Makefile             |    4 +
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts     |   80 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |    1 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |    1 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   12 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |   24 +
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |   64 +
 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi    |    8 +
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |   68 +
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |  184 +++
 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi     |   18 +
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     |  202 +++
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi    |  311 ++++
 .../dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts   |   97 ++
 .../dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts  |   97 ++
 .../boot/dts/freescale/imx8mm-icore-mx8mm.dtsi     |  232 +++
 .../boot/dts/freescale/imx8mm-nitrogen-r2.dts      |  314 +++-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |    2 +-
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |    6 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |    2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |    2 +
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |   56 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   39 +
 .../dts/freescale/imx8mq-kontron-pitx-imx8m.dts    |  613 +++++++
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |   70 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r2.dts |    2 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |    4 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   24 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  144 ++
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  |   21 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |   51 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi  |   61 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  176 ++
 arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts    |   20 +-
 .../dts/freescale/imx8qxp-colibri-eval-v3.dtsi     |    8 +-
 arch/arm64/boot/dts/freescale/imx8qxp-colibri.dtsi |   12 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   50 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi |   37 +
 arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi |   25 +
 arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi |   61 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |  423 +----
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |  222 +--
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |   14 +-
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts   |   18 +-
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |   12 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |    3 +-
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     |   14 +-
 .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |  127 ++
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     |   21 +-
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |   19 +-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |   19 +
 arch/arm64/boot/dts/marvell/cn9130-db.dts          |   12 +-
 arch/arm64/boot/dts/marvell/cn9131-db.dts          |    9 +-
 arch/arm64/boot/dts/marvell/cn9132-db.dts          |   11 +-
 arch/arm64/boot/dts/mediatek/Makefile              |    8 +
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |    8 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |   12 +
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           |    9 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |    6 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   15 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |    4 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-damu.dts     |   31 +
 .../mt8183-kukui-jacuzzi-juniper-sku16.dts         |   13 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi |   27 +
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  474 ++++++
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dts      |   13 +
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dtsi     |  378 +++++
 .../dts/mediatek/mt8183-kukui-kodama-sku16.dts     |   21 +
 .../dts/mediatek/mt8183-kukui-kodama-sku272.dts    |   21 +
 .../dts/mediatek/mt8183-kukui-kodama-sku288.dts    |   21 +
 .../dts/mediatek/mt8183-kukui-kodama-sku32.dts     |   21 +
 .../boot/dts/mediatek/mt8183-kukui-kodama.dtsi     |  343 ++++
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  378 +++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  160 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi           |    9 +-
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |    3 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   15 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |    2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |    4 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |    4 +
 .../boot/dts/qcom/msm8998-oneplus-cheeseburger.dts |   42 +
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |  514 ++++++
 .../boot/dts/qcom/msm8998-oneplus-dumpling.dts     |   25 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    2 +
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/pm8350.dtsi               |   25 +
 arch/arm64/boot/dts/qcom/pm8350b.dtsi              |   25 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   25 +
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |   25 +
 arch/arm64/boot/dts/qcom/pmr735a.dtsi              |   25 +
 arch/arm64/boot/dts/qcom/pmr735b.dtsi              |   25 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   18 +-
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts |   18 +
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts     |  141 ++
 .../boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts |   18 +
 .../boot/dts/qcom/sc7180-trogdor-coachz-r2.dts     |   15 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |  266 +++
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts |   34 +
 .../qcom/sc7180-trogdor-lazor-limozeen-nots.dts    |   26 +
 .../dts/qcom/sc7180-trogdor-lazor-limozeen.dts     |   42 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts      |    9 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |    9 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |    5 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |    4 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts      |   10 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |   39 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dts |   14 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts     |   26 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |   14 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r2.dts     |   44 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |  295 ++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |   35 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  222 ++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   58 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  259 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 1128 +++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   31 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |   71 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  155 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  555 ++++++-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |    4 -
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  676 ++++----
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |  319 ++++
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |  116 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 1637 ++++++++++++++++=
+-
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |    4 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |    3 +
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |    2 +-
 .../boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts |    3 +
 .../boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts |    3 +
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |    6 +-
 .../boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts |    3 +
 .../arm64/boot/dts/renesas/r8a77950-salvator-x.dts |   37 +-
 arch/arm64/boot/dts/renesas/r8a77950.dtsi          |    5 +
 .../arm64/boot/dts/renesas/r8a77951-salvator-x.dts |   37 +-
 .../boot/dts/renesas/r8a77951-salvator-xs.dts      |   37 +-
 .../arm64/boot/dts/renesas/r8a77960-salvator-x.dts |   46 -
 .../boot/dts/renesas/r8a77960-salvator-xs.dts      |   46 -
 .../boot/dts/renesas/r8a77961-salvator-xs.dts      |   46 -
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts      |   11 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  340 +++-
 .../arm64/boot/dts/renesas/r8a77965-salvator-x.dts |   45 -
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |   45 -
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   16 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |    9 +-
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |   79 +-
 .../boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi  |   15 +
 .../boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi |   15 +
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   50 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  263 ++-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   52 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |    1 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   12 +-
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/px30-engicam-common.dtsi     |    5 +
 .../boot/dts/rockchip/px30-engicam-px30-core.dtsi  |    4 +
 arch/arm64/boot/dts/rockchip/px30-evb.dts          |    6 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |   27 +-
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts     |    6 +
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |    5 +-
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts    |   11 +
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |    4 +
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         |    5 +
 arch/arm64/boot/dts/rockchip/rk3328-evb.dts        |    6 +
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts |    4 +
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts     |    5 +
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |    5 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |    5 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   24 +-
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       |    4 +
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts    |    4 +
 .../arm64/boot/dts/rockchip/rk3368-lion-haikou.dts |    4 +
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |    4 +
 .../boot/dts/rockchip/rk3368-orion-r68-meta.dts    |    5 +
 arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts    |    5 +
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts        |    5 +
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |    5 +-
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |    4 +
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |    6 +
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |    5 +
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts |    6 +
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi      |    6 +
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |    5 +
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts  |    6 +
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dts |  133 ++
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |    6 +
 arch/arm64/boot/dts/rockchip/rk3399-opp.dtsi       |   40 +-
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |    6 +
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    6 +
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |    4 +
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |   55 +-
 .../boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts  |    4 +
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |    5 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |    5 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts |    4 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts |    4 +
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi   |    6 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |   19 +
 .../dts/rockchip/rk3399-sapphire-excavator.dts     |    4 +
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi  |    5 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |    5 +-
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |    5 +
 arch/arm64/boot/dts/ti/Makefile                    |    8 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |  675 ++++++++
 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi            |  103 ++
 arch/arm64/boot/dts/ti/k3-am64.dtsi                |  105 ++
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            |  468 ++++++
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             |  334 ++++
 arch/arm64/boot/dts/ti/k3-am642.dtsi               |   65 +
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi |  655 ++++++++
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |  395 +++++
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi            |    9 +
 arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dts |   61 +
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |    4 +-
 .../boot/dts/ti/k3-am6548-iot2050-advanced.dts     |   60 +
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |   94 ++
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |   86 +-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |   51 +
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi        |   36 +
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          |  279 +++-
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    |    4 +-
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi        |    4 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts  |   20 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts  |   20 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |    1 +
 drivers/bus/omap_l3_noc.c                          |    4 +-
 drivers/bus/ti-sysc.c                              |   82 +-
 drivers/clk/ti/clk-54xx.c                          |    2 +
 drivers/pci/controller/dwc/pci-dra7xx.c            |   13 +-
 drivers/soc/ti/omap_prm.c                          |   24 +-
 include/dt-bindings/clock/omap5.h                  |    2 +
 include/dt-bindings/pinctrl/k3.h                   |    5 +-
 532 files changed, 27292 insertions(+), 3725 deletions(-)
 create mode 100644 Documentation/arm/stm32/stm32h750-overview.rst
 create mode 100644 arch/arm/boot/dts/armada-385-atl-x530.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts
 create mode 100644 arch/arm/boot/dts/imx7d-remarkable2.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-t55.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.=
dtsi
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.=
dtsi
 delete mode 100644 arch/arm/boot/dts/ste-href-tvk1281618.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/stm32h743-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dt=
s
 create mode 100644 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.d=
ts
 create mode 100644 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi
 create mode 100644
arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
 create mode 100644
arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
 create mode 100644 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts
 create mode 100644
arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.d=
ts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
 create mode 100644
arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-tplink-archer-c2300-v1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch=
2.dts
 create mode 100644
arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m=
.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-mek.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.=
dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.=
dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.=
dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.d=
ts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.d=
ts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.d=
ts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.=
dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.d=
ts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.d=
ts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-hdk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dts=
i
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon-ethernet.dt=
si
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am64-main.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am64.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642-sk.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dts
