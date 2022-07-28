Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC872C04A68
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 22:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B212BC43141; Thu, 28 Jul 2022 22:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BA1C43470
	for <soc@kernel.org>; Thu, 28 Jul 2022 22:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659047533;
	bh=zFgtTkoo/dPM5DNHIeYWj7V1C1mjwkTgZSlFyUfAD4g=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=IgMhvQT5zqIm27Mu77GuhUPBcIGwQwgfL2axxiU+73nYPLt50pIzVCfLuMQjmicRx
	 9+ElX/U9EzlqztAn6aPVR/Wn9dytjowyA0t+XMfHXOQrAKSRvKDZOEvWb9NnudCx8i
	 ob+oeHksbR3X229gTlZCDaNNjYA5gAjesZ03Zf/kqu5o/EfMZf8jxslu3dXAcp5Xq7
	 1ijd5souaj8Xc0KqS7+SN0Nsg6qxKYG1mMEE1dI0vgIBmQM7m2S/gMwE3tzPeqchDD
	 j7tH7UhywuBInmnFrQ9snRwTX1ThEq6dqXYONMAnxM7rbaxT9ryUsZ3lnzM7g5nUEi
	 UiXsjeZgyypeA==
Received: by mail-ed1-f50.google.com with SMTP id v17so3889210edc.1
        for <soc@kernel.org>; Thu, 28 Jul 2022 15:32:12 -0700 (PDT)
X-Gm-Message-State: AJIora+HjiFYgGTkebMVlgWiYVArM3qjCQF9Stb3eesui2gz08zlQCtU
	DujSXGVejuZ4MHtZFeGGiAELE/Guqx/7JDGbcp0=
X-Google-Smtp-Source: AGRyM1uCnNo8diK4olr14PbbQhZnVaiaySMDhyDE/cmrUq+GGMggvPbsQJmfcl4oIVQu+sRMyRaYFKOz2SiN0Wg9bCA=
X-Received: by 2002:a05:6402:1d4c:b0:43b:c85f:5c95 with SMTP id
 dz12-20020a0564021d4c00b0043bc85f5c95mr1025063edb.213.1659047530541; Thu, 28
 Jul 2022 15:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
In-Reply-To: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 29 Jul 2022 00:31:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2ao-qBBem8+X9WSjRNbqyun=PZ-TT4oCL9FzwMb=cxPg@mail.gmail.com>
Message-ID: <CAK8P3a2ao-qBBem8+X9WSjRNbqyun=PZ-TT4oCL9FzwMb=cxPg@mail.gmail.com>
Subject: [GIT PULL 3/6] ARM: DT changes for 5.20
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a=
:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.2=
0

for you to fetch changes up to 47d8f8b78b9b42e9817feeb75bbf758f2a3cbff8:

  dt-bindings: soc: bcm: use absolute path to other schema (2022-07-27
16:31:09 +0200)

----------------------------------------------------------------
ARM: DT changes for 5.20

As usual, the bulk of the changes for the SoC tree are devicetree file
updates, and most of these changes are for 64-bit embedded machines.
As before, there are a ton of style cleanups, and additional hardware
support for existing machines.

Looking only at the new SoC, the notable additions are:

 - A whole family of Broadcom broadband SoCs, both 32-bit and 64-bit:
   BCM63178, BCM63158, BCM4912, BCM6858, BCM6878, BCM6846, BCM63146,
   BCM6856, BCM6855, BCM6756, BCM63148, and BCM6813.
   Each SoC comes with a corresponding reference board.

 - The new NXP i.MX93 SoC, the follow-up to the popular i.MX6 and
   i.MX8 embedded SoCs, now using Cortex-A55 cores and the
   Ethos-U65 NPU.

 - Qualcomm Snapdragon 8cx Gen3 (SC8280XP), the current high end
   of Arm based Laptop SoCs, and its automotive cousin, the
   SA8540P. The SC8280XP is used in the Lenovo Thinkpad X13s
   laptop that also gets added here in addition to the reference
   boards.

 - Allwinner H616, a newer version of the H6 SoC, targeted at
   Set-top-box applications. It comes with dts files for the
   Orange Pi zero2 single-board computer and the X96 Mate
   set-top-box

 - Marvell Prestera 98DX2530 (AlleyCat5), a network switch chip
   in the Armada SoC family based on the Cortex-A55 core.

New machines based on previously supported SoCs include:

 - Several new machines on NXP i.MX platforms: multiple Toradex
   Colibri boards using the "Iris" and "Ixora" carriers,
   DH electronics i.MX8M Plus DHCOM and PDK2, TQ-Systems
   TQMa8MPQL, and phytech phyBOARD-Polis-i.MX8MM.

 - Google Chameleon v3 FPGA board based on Intel Arria10 and
   Stratix 10 Software Virtual platform, both in the SoCFPGA
   platform.

 - Two new wireless devices based on Broadcom SoCs:
   The Asus GT-AX6000 Router and the Cisco Meraki MR26 access point

 - Improved Chromebook support for both the Mediatek and Qualcomm
   SoC families brought added machines: Acer Chromebook 514 (MT8192),
   Acer Chromebook Spin 513 (MT8195) and a couple of SC7180 based
   machines including the Lenovo IdeaPad Chromebook Duet 3.

 - Xiaomi Mi Mix2s, LG G7 and LG V35 are mobile phones based on
   Qualcomm SDM845, while Mi 5s Plus is based on MSM8996.

 - Finally, there are a few development board on other chips:
   PCB8309 (Microchip lan966x), Radxa Rock Pi S (Rockchips RK3308)
   DH DRC Compact (ST STM32MP1) and Inforce IFC6560 (Qualcomm
   SDM660)

----------------------------------------------------------------
Abel Vesa (14):
      arm64: dts: freescale: imx8qxp: Fix thermal zone name for cpu0
      arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI
      dt-bindings: clk: imx: Add fsl,scu-clk yaml file
      dt-bindings: pinctrl: imx: Add fsl,scu-iomux yaml file
      dt-bindings: input: Add fsl,scu-key yaml file
      dt-bindings: nvmem: Add fsl,scu-ocotp yaml file
      dt-bindings: power: Add fsl,scu-pd yaml file
      dt-bindings: rtc: Add fsl,scu-rtc yaml file
      dt-bindings: thermal: Add fsl,scu-thermal yaml file
      dt-bindings: watchdog: Add fsl,scu-wdt yaml file
      dt-bindings: firmware: Add fsl,scu yaml file
      arm64: dts: freescale: imx8: Fix power controller name
      arm64: dts: freescale: imx8qxp: Add fallback compatible for
clock controller
      arm64: dts: freescale: imx8qxp: Fix the keys node name

Akash Gajjar (1):
      arm64: dts: rockchip: add ROCK Pi S DTS support

Akhil R (3):
      dt-bindings: Add headers for Tegra234 GPCDMA
      arm64: tegra: Add Tegra234 GPCDMA device tree node
      arm64: tegra: Update compatible for Tegra234 GPCDMA

Alec Su (2):
      dt-bindings: arm: qcom: Document xiaomi,natrium board
      arm64: dts: qcom: msm8996-xiaomi-natrium: Add support for Xiaomi
Mi 5s Plus

Alexander Stein (7):
      ARM: dts: imx6ul: add missing properties for sram
      ARM: dts: imx6ul: change operating-points to uint32-matrix
      ARM: dts: imx6ul: fix keypad compatible
      ARM: dts: imx6ul: fix csi node compatible
      ARM: dts: imx6ul: fix lcdif node compatible
      ARM: dts: imx6ul: fix qspi node compatible
      arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.M=
X8MP

Alexandre Torgue (1):
      dt-bindings: rcc: stm32: select the "secure" path for stm32mp13

Alim Akhtar (2):
      arm64: dts: fsd: Add cpu cache information
      arm64: dts: fsd: add ufs device node

Allen-KH Cheng (2):
      dt-bindings: arm: mediatek: Add mt8186 pericfg compatible
      dt-bindings: arm: Add compatible for MediaTek MT8186

Anand Gore (6):
      dt-bindings: arm: add BCM63178 SoC to binding document
      ARM: dts: add dts files for bcmbca soc 63178
      dt-bindings: arm64: Add BCM6858 SoC to binding document
      ARM64: dts: Add DTS files for bcmbca SoC BCM6858
      dt-bindings: arm: Add BCM6878 soc
      ARM: dts: Add DTS files for bcmbca SoC BCM6878

Andre Przywara (7):
      dt-bindings: arm: sunxi: Add H616 EMAC0 compatible
      dt-bindings: pinctrl: sunxi: Make interrupts optional
      arm64: dts: allwinner: Add Allwinner H616 .dtsi file
      dt-bindings: pinctrl: sunxi: allow vcc-pi-supply
      dt-bindings: arm: sunxi: Add two H616 board compatible strings
      arm64: dts: allwinner: h616: Add OrangePi Zero 2 board support
      arm64: dts: allwinner: h616: Add X96 Mate TV box support

Andreas Kemnade (2):
      ARM: dts: imx6sl-tolino-shine2hd: fix led node name.
      ARM: dts: imx6: fix node names for ebook reader keys

Andrey Konovalov (1):
      arm64: dts: qcom: qcs404: fix default pinctrl settings for blsp1_spi1

Andr=C3=A9 Almeida (1):
      ARM: dts: qcom: msm8974-hammerhead: Add notification LED

AngeloGioacchino Del Regno (24):
      arm64: dts: mediatek: mt8173: Add mediatek,infracfg phandle for IOMMU
      arm64: dts: mediatek: mt2712e: Add mediatek, infracfg phandle for IOM=
MU
      arm64: dts: mediatek: mt6795: Create soc bus node and move mmio devic=
es
      arm64: dts: mediatek: mt6795: Add cpu-map and L2 cache
      arm64: dts: mediatek: mt6795: Add Cortex A53 PMU nodes
      arm64: dts: mediatek: mt6795: Add watchdog node to avoid timeouts
      arm64: dts: mediatek: mt6795: Add fixed clocks for 32kHz and 26MHz XO=
s
      arm64: dts: mediatek: mt6795: Remove incorrect fixed-clocks
      arm64: dts: mediatek: mt6795: Add general purpose timer node
      arm64: dts: mediatek: mt6795: Add ARM CCI-400 node and assign to CPUs
      arm64: dts: mediatek: mt6795: Add pinctrl controller node
      arm64: dts: mediatek: mt6795: Specify interrupts for vGIC
      arm64: dts: mediatek: mt8183-kukui: Assign sram supply to mfg_async p=
d
      dt-bindings: arm: mediatek: Add MT8195 Cherry Tomato Chromebooks
      arm64: dts: mediatek: Introduce MT8195 Cherry platform's Tomato
      arm64: dts: mediatek: cherry: Add platform regulators layout and conf=
ig
      arm64: dts: mediatek: cherry: Assign interrupt line to MT6359 PMIC
      arm64: dts: mediatek: cherry: Add support for internal eMMC storage
      arm64: dts: mediatek: cherry: Document gpios and add default pin conf=
ig
      arm64: dts: mediatek: cherry: Enable I2C and SPI controllers
      arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers
      arm64: dts: mediatek: cherry: Enable MT6360 sub-pmic on I2C7
      arm64: dts: mediatek: cherry: Enable support for the SPI NOR flash
      arm64: dts: mediatek: cherry: Add I2C-HID touchscreen on I2C4

Anton Bambura (1):
      arm64: dts: qcom: add device tree for LG G7 and LG V35

Arnd Bergmann (50):
      Merge tag 'samsung-dt-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.20-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'renesas-dt-bindings-for-v5.20-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'socfpga_dts_updates_for_v5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/dt
      Merge tag 'dt64-cleanup-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'dt-cleanup-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'amlogic-arm-dt-for-v5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/dt
      Merge tag 'amlogic-arm64-dt-for-v5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/dt
      Merge tag 'omap-for-v5.20/dt-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'v5.20-rockchip-dts64-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'v5.20-rockchip-dts32-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'ux500-dts-v5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'at91-dt-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
      Merge tag 'stm32-dt-for-v5.20-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into
arm/dt
      Merge tag 'juno-updates-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/dt
      Merge tag 'dt64-cleanup-5.20-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'dt-cleanup-5.20-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt-5.20-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.20-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'zynq-dt-for-v5.20' of
https://github.com/Xilinx/linux-xlnx into arm/dt
      Merge tag 'zynqmp-dt-for-v5.20' of
https://github.com/Xilinx/linux-xlnx into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.20-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'renesas-dt-bindings-for-v5.20-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'v5.19-next-dts32' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'v5.19-next-dts64' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'sunxi-dt-for-5.20-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/dt
      Merge tag 'tegra-for-5.20-dt-bindings' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'tegra-for-5.20-arm-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'tegra-for-5.20-arm64-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'ti-k3-dt-for-v5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/dt
      Merge tag 'ti-keystone-dt-for-v5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/dt
      Merge tag 'imx-bindings-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt64-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'sunxi-dt-for-5.20-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/dt
      Merge tag 'at91-dt-5.20-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
      Merge tag 'qcom-dts-for-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'qcom-arm64-for-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'arm-soc/for-5.20/devicetree' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'arm-soc/for-5.20/devicetree-arm64' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'arm-soc/for-5.20/devicetree-part2' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'arm-soc/for-5.20/devicetree-arm64-part2' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'mvebu-dt-5.20-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'mvebu-dt64-5.20-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'dt-bindings-aspeed-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt into
arm/dt
      Merge tag 'qcom-dts-for-5.20-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'qcom-arm64-for-5.20-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'at91-dt-5.20-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
      Merge tag 'at91-dt-5.20-4' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt

Aswath Govindraju (1):
      arm64: dts: ti: k3-am642-sk: Add pinmux corresponding to main_uart0

Baruch Siach (1):
      ARM: imx6ul: drop the adc num-channels property

Bhupesh Sharma (8):
      arm64: dts: qcom: Fix sdhci node names - use 'mmc@'
      arm64: dts: qcom: sdm630: Fix 'interconnect-names' for sdhci nodes
      arm64: dts: qcom: Fix ordering of 'clocks' & 'clock-names' for sdhci =
nodes
      arm64: dts: qcom: Fix 'reg-names' for sdhci nodes
      arm64: dts: qcom: Remove unused 'vdda-max-microamp' &
'vdda-pll-max-microamp' properties
      ARM: dts: qcom: Fix sdhci node names - use 'mmc@'
      arm64: dts: qcom: qrb5165-rb5: Fix 'dtbs_check' error for lpg nodes
      arm64: dts: qcom: qrb5165-rb5: Fix 'dtbs_check' error for led nodes

Biju Das (3):
      arm64: dts: renesas: r9a07g043: Add ADC node
      arm64: dts: renesas: rzg2ul-smarc: Enable RSPI1 on carrier board
      arm64: dts: renesas: rzg2ul-smarc-som: Enable ADC on SMARC platform

Bjorn Andersson (19):
      dt-bindings: arm: qcom: Document additional sc8280xp devices
      dt-bindings: mailbox: qcom-ipcc: Add NSP1 client
      arm64: dts: qcom: add SC8280XP platform
      arm64: dts: qcom: sc8280xp: Add reference device
      arm64: dts: qcom: add SA8540P and ADP
      Merge branch '20220515210048.483898-8-robimarko@gmail.com' into
arm64-for-5.20
      Merge tag 'qcom-arm64-fixes-for-5.19' into arm64-for-5.20
      Merge branch
'20220701062622.2757831-2-vladimir.zapolskiy@linaro.org' into
arm64-for-5.20
      Merge branch '20220706154337.2026269-1-robert.foss@linaro.org'
into arm64-for-5.20
      arm64: dts: qcom: Add LPG to pm8916, pm8994, pmi8994 and pmi8998
      arm64: dts: qcom: sdm845: Enable user LEDs on DB845c
      arm64: dts: qcom: pmi8994: Define MPP block
      arm64: dts: qcom: db820c: Add user LEDs
      arm64: dts: qcom: sc8280xp: Add lost ranges for timer
      ARM: dts: qcom: Add LPG node to pm8941
      ARM: dts: qcom: msm8974-sony: Enable LPG
      arm64: dts: qcom: sdm845: Fill in GENI DMA references
      arm64: dts: qcom: sdm845-db845c: Enable gpi_dma1
      arm64: dts: qcom: sdm845-db845c: Specify a i2c bus clocks

Bryan O'Donoghue (2):
      arm64: dts: qcom: sdm845: Rename camss vdda-supply to vdda-phy-supply
      arm64: dts: qcom: sdm845: Add camss vdda-pll-supply

Chanho Park (11):
      dt-bindings: soc: add samsung,boot-mode definitions
      arm64: dts: exynos: add syscon reboot/reboot_mode support in ExynosAu=
tov9
      arm64: dts: exynos: add watchdog in ExynosAutov9
      arm64: dts: exynos: adjust DT style of ufs nodes in ExynosAutov9
      arm64: dts: exynos: add secondary ufs devices in ExynosAutov9
      arm64: dts: exynos: enable secondary ufs devices ExynosAutov9 SADK
      arm64: dts: exynosautov9: correct spi11 pin names
      dt-bindings: soc: samsung: usi: add exynosautov9-usi compatible
      arm64: dts: exynosautov9: add pdma0 device tree node
      arm64: dts: exynosautov9: prepare usi0 changes
      arm64: dts: exynosautov9: add usi device tree nodes

Chris Packham (3):
      dt-bindings: marvell: Document the AC5/AC5X compatibles
      arm64: dts: marvell: Add Armada 98DX2530 SoC and RD-AC5X board
      arm64: marvell: enable the 98DX2530 pinctrl driver

Chris Paterson (1):
      arm64: dts: renesas: r9a07g054l2-smarc: Correct SoC name in comment

Christian Lamparter (2):
      dt-bindings: ARM: add bindings for the Meraki MR26
      ARM: dts: BCM5301X: Add DT for Meraki MR26

Christian Marangi (12):
      ARM: dts: qcom: replace gcc PXO with pxo_board fixed clock
      ARM: dts: qcom: ipq8064: add multiple missing pin definition
      ARM: dts: qcom: ipq8064: add gsbi6 missing definition
      ARM: dts: qcom: ipq8064: add specific dtsi with smb208 rpm regulators
      ARM: dts: qcom: ipq8064: add missing snps,dwmac compatible for gmac
      ARM: dts: qcom: ipq8064: disable usb phy by default
      ARM: dts: qcom: ipq8064: reduce pci IO size to 64K
      ARM: dts: qcom: ipq8064: fix and add some missing gsbi node
      ARM: dts: qcom: ipq8064: add speedbin efuse nvmem node
      ARM: dts: qcom: ipq8064: add missing hwlock
      ARM: dts: qcom: ipq8064: add missing smem compatible
      ARM: dts: qcom: add rpmcc missing clocks for apq/ipq8064 and msm8660

Chunfeng Yun (4):
      arm64: dts: mediatek: mt8195: add efuse node and cells
      arm64: dts: mediatek: mt8195: enable usb remote wakeup
      arm64: dts: mediatek: mt8192: fix dtbs check warning of efuse
      arm64: dts: mediatek: mt8183: change efuse node name

Claudiu Beznea (5):
      ARM: dts: at91: sama5d2: fix compilation warning
      ARM: dts: at91: sama5d2: fix compilation warning
      ARM: dts: at91: use generic name for reset controller
      ARM: dts: at91: sama7g5: add reset-controller node
      ARM: dts: lan966x: keep lan966 entries alphabetically sorted

Cl=C3=A9ment L=C3=A9ger (6):
      ARM: dts: r9a06g032-rzn1d400-db: Enable rtc0
      ARM: dts: r9a06g032: Describe MII converter
      ARM: dts: r9a06g032: Describe GMAC2
      ARM: dts: r9a06g032: Describe switch
      dt-bindings: net: pcs: add bindings for Renesas RZ/N1 MII converter
      ARM: dts: r9a06g032-rzn1d400-db: Add switch description

Dang Huynh (1):
      arm64: dts: qcom: sdm660-xiaomi-lavender: Configure WLED

David Heidelberg (3):
      arm64: dts: qcom: timer should use only 32-bit size
      ARM: dts: qcom: extend scm compatible to match dt-schema
      arm64: dts: qcom: extend scm compatible strings

David Virag (3):
      dt-bindings: clock: Add bindings for Exynos7885 CMU_FSYS
      dt-bindings: clock: Add indices for Exynos7885 TREX clocks
      arm64: dts: exynos: Add internal eMMC support to jackpotlte

David Wang (1):
      dt-bindings: arm: aspeed: document board compatibles

Denys Drozdov (1):
      ARM: dts: imx6q-apalis: Clean-up sd card support

Dmitry Baryshkov (43):
      arm64: dts: qcom: sm8450 add ITS device tree node
      arm64: dts: qcom: sm8450: add uart20 node
      arm64: dts: qcom: msm8996: add clocks to the MMCC device node
      arm64: dts: qcom: sdm845: use dispcc AHB clock for mdss node
      arm64: dts: qcom: sdm630: disable dsi0/dsi0_phy by default
      arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
      arm64: dts: qcom: sdm630: disable GPU by default
      arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
      arm64: dts: qcom: sdm630: rename qusb2phy to qusb2phy0
      arm64: dts: qcom: sdm630: add second (HS) USB host support
      arm64: dts: qcom: sdm630: fix gpu's interconnect path
      arm64: dts: qcom: sdm636-sony-xperia-ganges-mermaid: correct sdc2 pin=
conf
      arm64: dts: qcom: sdm660: move SDHC2 card detect pinconf to board fil=
es
      dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board
      arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support
      ARM: dts: qcom: apq8064-ifc6410: drop hdmi-mux-supply
      ARM: dts: qcom: apq8064: drop phy-names from HDMI device node
      arm64: dts: qcom: pm8150b: add Light Pulse Generator device node
      arm64: dts: qcom: pm8150l: add Light Pulse Generator device node
      arm64: dts: qcom: qrb5165-rb5: declare tri-led user leds
      arm64: dts: qcom: msm8996: drop phy-names from HDMI device node
      arm64: dts: qcom: add mdp_clk clock to the MDSS device
      arm64: dts: qcom: msm8996: add second DSI interface
      arm64: dts: qcom: msm8916: add xo clocks to rpmcc and a53pll
      ARM: dts: qcom: apq8064: rename DSI PHY iface clock
      ARM: dts: qcom: apq8064: disable DSI and DSI PHY by default
      ARM: dts: qcom: msm8974: rename GPU's OPP table node
      arm64: dts: qcom: msm8996: correct #clock-cells for QMP PHY nodes
      arm64: dts: qcom: msm8996: add GCC's optional clock sources
      arm64: dts: qcom: msm8996: add xo clock source to rpmcc
      arm64: dts: qcom: msm8996: add missing DSI clock assignments
      arm64: dts: qcom: sc7280: use constants for gpucc clocks and power-do=
mains
      arm64: dts: qcom: sc7180-idp: add vdds supply to the DSI PHY
      ARM: dts: qcom: apq8064: create tsens device node
      arm64: dts: qcom: sdm845: rename DPU device node
      arm64: dts: qcom: sc7180: rename DPU device node
      arm64: dts: qcom: sm8250: rename DPU device node
      arm64: dts: qcom: sc7180: split register block for DP controller
      arm64: dts: qcom: sc7180: drop #clock-cells from displayport-controll=
er
      arm64: dts: qcom: sc7280: split register block for DP controller
      arm64: dts: qcom: sc7280: drop #clock-cells from displayport-controll=
er
      arm64: dts: qcom: sc7280: drop address/size-cells from eDP node
      arm64: dts: qcom: sc7280: drop unused clocks from eDP node

Douglas Anderson (9):
      arm64: dts: qcom: sc7280: Add touchscreen to villager
      dt-bindings: Document how Chromebooks with depthcharge boot
      dt-bindings: arm: qcom: Mention that Chromebooks use a different sche=
me
      dt-bindings: arm: qcom: Add sc7180 Chromebook board bindings
      dt-bindings: arm: qcom: Add / fix sc7280 board bindings
      dt-bindings: arm: qcom: Add more sc7180 Chromebook board bindings
      arm64: qcom: sc7280-herobrine: Enable DP
      arm64: dts: qcom: sc7280: Set SPI flash to 50 MHz for herobrine board=
s
      Revert "arm64: dts: qcom: Fix 'reg-names' for sdhci nodes"

Dylan Van Assche (1):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable pmi9889 LPG LED

Emma Anholt (1):
      arm64: dts: qcom: sm8250: Enable per-process page tables.

Etienne Carriere (1):
      ARM: dts: stm32: fix pwr regulators references to use scmi

Fabien Dessenne (1):
      ARM: dts: stm32: remove the IPCC "wakeup" IRQ on stm32mp151

Fabio Estevam (10):
      arm64: dts: mba8mx: Remove unneeded comments
      arm64: dts: imx8m: Disable job ring 0 nodes
      dt-bindings: arm: fsl: Decrease the line length
      ARM: dts: imx: Pass a label to the soc node
      ARM: dts: imx: Pass a label to the AIPS nodes
      arm64: dts: imx8m: Pass a label to the soc node
      arm64: dts: imx8mq: Pass a label to the AIPS nodes
      arm64: dts: mediatek: Replace 'enable-sdio-wakeup'
      ARM: dts: imx7d-smegw01: Replace 'enable-sdio-wakeup'
      ARM: dts: imx6q-bosch-acc: Replace 'enable-sdio-wakeup'

Fabrice Gasnier (1):
      ARM: dts: stm32: add missing usbh clock and fix clk order on stm32mp1=
5

Felix Fietkau (2):
      ARM: dts: add clock support for Airoha EN7523
      ARM: dts: Add PCIe support for Airoha EN7523

Frank Wunderlich (6):
      arm64: dts: rockchip: add RTC to BPI-R2 Pro
      arm64: dts: rockchip: set display regulators to always-on on BPI-R2-P=
ro
      arm64: dts: rockchip: enable vop2 and hdmi tx on BPI-R2-Pro
      arm64: dts: rockchip: Enable HDMI audio on BPI R2 Pro
      arm64: dts: rockchip: configure thermal shutdown for BPI-R2-Pro
      arm64: dts: rockchip: enable the gpu on BPI-R2-Pro

Furkan Kardame (1):
      arm64: dts: meson: add gpio-fan control to GS-King-X

Gabriel Fernandez (6):
      ARM: dts: stm32: use the correct clock source for CEC on stm32mp151
      ARM: dts: stm32: DSI should use LSE SCMI clock on DK1/ED1 STM32 board
      ARM: dts: stm32: delete fixed clock node on STM32MP15-SCMI
      ARM: dts: stm32: enable optee firmware and SCMI support on STM32MP13
      ARM: dts: stm32: add RCC on STM32MP13x SoC family
      ARM: dts: stm32: add optee reserved memory on stm32mp135f-dk

Geert Uytterhoeven (14):
      arm64: dts: renesas: beacon: Fix regulator node names
      arm64: dts: renesas: Rename numbered regulators
      dt-bindings: soc: renesas: Move renesas,prr from arm to soc
      arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
      arm64: dts: renesas: r8a779a0: Add CPU0 core clock
      arm64: dts: renesas: r8a779f0: Add L3 cache controller
      arm64: dts: renesas: r8a779f0: Add secondary CA55 CPU cores
      arm64: dts: renesas: r8a779f0: Add CPU core clocks
      arm64: dts: renesas: Fix thermal-sensors on single-zone sensors
      ARM: dts: rza2mevb: Fix LED node names
      MAINTAINERS: Add Renesas SoC DT bindings to Renesas Architecture sect=
ions
      arm64: dts: renesas: r8a779m8: Drop operating points above 1.5 GHz
      ARM: dts: renesas: Fix DA9063 watchdog subnode names
      arm64: dts: renesas: spider-cpu: Fix scif0/scif3 sort order

Guillaume La Roque (1):
      arm64: dts: ti: k3-am625-sk: Enable ramoops

Gwendal Grignou (1):
      arm64: dts: qcom: sc7280: Rename sar sensor labels

Herve Codina (2):
      dt-bindings: usb: atmel: Add Microchip LAN9662 compatible string
      ARM: dts: lan966x: Add UDPHS support

Horatiu Vultur (5):
      ARM: dts: lan966x: Add gpio-restart
      ARM: dts: lan966x: Disable can0 on pcb8291
      ARM: dts: lan966x: Enable network driver on pcb8291
      dt-bindings: arm: at91: add lan966 pcb8309 board
      ARM: dts: lan966x: add support for pcb8309

Hsin-Yi Wang (1):
      arm64: dts: mt8183: Add panel rotation

Jayesh Choudhary (1):
      arm64: dts: ti: k3-am62-main: Enable crypto accelerator

Johan Hovold (22):
      arm64: dts: qcom: sc8280xp: add Lenovo Thinkpad X13s devicetree
      arm64: dts: qcom: sc7280: drop PCIe PHY clock index
      arm64: dts: qcom: sm8250: add missing PCIe PHY clock-cells
      arm64: dts: qcom: ipq6018: drop USB PHY clock index
      arm64: dts: qcom: ipq8074: drop USB PHY clock index
      arm64: dts: qcom: msm8998: drop USB PHY clock index
      arm64: dts: qcom: sm8350: drop USB PHY clock index
      arm64: dts: qcom: sm8450: drop USB PHY clock index
      arm64: dts: qcom: sc8280xp: drop UFS PHY clock-cells
      arm64: dts: qcom: sm8250: drop UFS PHY clock-cells
      arm64: dts: qcom: sm8450: drop UFS PHY clock-cells
      arm64: dts: qcom: msm8996: use non-empty ranges for PCIe PHYs
      arm64: dts: qcom: msm8996: clean up PCIe PHY node
      arm64: dts: qcom: sc7280: fix PCIe clock reference
      arm64: dts: qcom: sc8280xp: fix usb_0 HS PHY ref clock
      arm64: dts: qcom: sc8280xp: fix DP PHY node unit addresses
      arm64: dts: qcom: sc8280xp: fix usb_1 ssphy irq
      arm64: dts: qcom: sc8280xp: fix USB clock order and naming
      arm64: dts: qcom: sc8280xp: fix USB interrupts
      arm64: dts: qcom: sc7280: reorder USB interrupts
      arm64: dts: qcom: reorder USB interrupts
      ARM: dts: qcom: sdx65: reorder USB interrupts

Johan Jonker (1):
      ARM: dts: rockchip: enable nfc node in rk3066a-mk808.dts

Jonathan Marek (1):
      dt-bindings: clock: Add Qcom SM8350 DISPCC bindings

Joseph S. Barrera III (5):
      arm64: dts: qcom: sc7180: Add wormdingler dts files
      arm64: dts: qcom: sc7180: Add quackingstick dts files
      arm64: dts: qcom: sc7180: Add mrbland dts files
      arm64: dts: qcom: sc7180: Add pazquel dts files
      arm64: dts: qcom: sc7180: Add kingoftown dts files

Kartik (3):
      dt-bindings: timer: Add Tegra186 & Tegra234 Timer
      arm64: tegra: Enable native timers on Tegra186
      arm64: tegra: Enable native timers on Tegra234

Kaushal Kumar (4):
      ARM: dts: qcom: sdx65: Add QPIC BAM support
      ARM: dts: qcom: sdx65: Add QPIC NAND support
      ARM: dts: qcom: sdx65-mtp: Enable QPIC BAM support
      ARM: dts: qcom: sdx65-mtp: Enable QPIC NAND support

Kavyasree Kotagiri (2):
      ARM: dts: lan966x: Add mcan1 node.
      ARM: dts: lan966x: Cleanup flexcom3 usart pinctrl settings.

Konrad Dybcio (19):
      arm64: dts: qcom: msm8994: Fix CPU6/7 reg values
      MAINTAINERS: Add myself as a reviewer for Qualcomm ARM/64 support
      arm64: dts: qcom: msm8998*: Fix TLMM and pin nodes
      arm64: dts: qcom: msm8998-clamshell: Clean up the DT
      arm64: dts: qcom: msm8998-laptops: Clean up DTs
      arm64: dts: qcom: msm8998-yoshino-lilac: Disable LVS1
      arm64: dts: qcom: msm8998-yoshino: Add USB extcon
      arm64: dts: qcom: msm8998-yoshino: Remove simple-bus compatible
from clocks{}
      arm64: dts: qcom: msm8998-yoshino/oneplus: Use pm8005_regulators labe=
l
      arm64: dts: qcom: msm8998-oneplus: Apply style fixes
      arm64: dts: qcom: msm8998-fxtec: Use "okay" instead of "ok"
      arm64: dts: qcom: msm8998*: Keep MMCC & MMSS_SMMU enabled by default
      arm64: dts: qcom: msm8998-oneplus: Add clocks & GDSC to simplefb
      arm64: dts: qcom: msm8998*: Clean up #includes
      arm64: dts: qcom: msm8998-fxtec: Decouple from 8998 MTP
      arm64: dts: qcom: msm8998-mtp: Merge and fix up the DT
      arm64: dts: qcom: msm8996-tone: Drop cont_splash_mem region
      arm64: dts: qcom: msm8996-tone: Rule out PM(I)8994 variants
      arm64: dts: qcom: msm8996: Add SDHCI resets

Krzysztof Kozlowski (199):
      ARM: dts: sun5i: adjust whitespace around '=3D'
      arm64: dts: exynos: adjust whitespace around '=3D'
      ARM: dts: exynos: adjust whitespace around '=3D'
      arm64: dts: exynos: align MMC node name with dtschema
      ARM: dts: exynos: align MMC node name with dtschema
      ARM: dts: s3c2410: use local header for pinctrl register values
      ARM: dts: s3c64xx: use local header for pinctrl register values
      ARM: dts: s5pv210: use local header for pinctrl register values
      ARM: dts: exynos: use local header for pinctrl register values
      arm64: dts: exynos: use local header for pinctrl register values
      arm64: dts: fsd: use local header for pinctrl register values
      arm64: dts: broadcom: adjust whitespace around '=3D'
      ARM: dts: broadcom: adjust whitespace around '=3D'
      ARM: tegra: Adjust whitespace around '=3D'
      ARM: dts: meson: adjust whitespace around '=3D'
      arm64: dts: amlogic: adjust whitespace around '=3D'
      arm64: dts: amlogic: correct gpio-keys properties
      arm64: dts: amlogic: align gpio-key node names with dtschema
      ARM: dts: rockchip: adjust whitespace around '=3D'
      arm64: dts: rockchip: adjust whitespace around '=3D'
      ARM: dts: fsl: adjust whitespace around '=3D'
      arm64: dts: fsl: ls1012a: fix Micron SPI NOR compatible
      arm64: dts: fsl: adjust whitespace around '=3D'
      arm64: dts: arm: adjust whitespace around '=3D'
      ARM: dts: broadcom: align gpio-key node names with dtschema
      ARM: dts: broadcom: correct gpio-keys properties
      arm64: dts: altera: adjust whitespace around '=3D'
      arm64: dts: allwinner: align gpio-key node names with dtschema
      ARM: dts: allwinner: align gpio-key node names with dtschema
      ARM: dts: exynos: align gpio-key node names with dtschema
      ARM: dts: s5pv210: align gpio-key node names with dtschema
      ARM: dts: pxa: adjust whitespace around '=3D'
      ARM: dts: aspeed: adjust whitespace around '=3D'
      ARM: dts: at91: adjust whitespace around '=3D'
      ARM: dts: axm: adjust whitespace around '=3D'
      ARM: dts: spear: adjust whitespace around '=3D'
      ARM: dts: alpine: adjust whitespace around '=3D'
      ARM: dts: ecx: adjust whitespace around '=3D'
      ARM: dts: lpc: adjust whitespace around '=3D'
      ARM: dts: nuvoton: adjust whitespace around '=3D'
      ARM: dts: ste: adjust whitespace around '=3D'
      ARM: dts: sti: adjust whitespace around '=3D'
      ARM: dts: sd: adjust whitespace around '=3D'
      arm64: dts: amd: adjust whitespace around '=3D'
      arm64: dts: apm: adjust whitespace around '=3D'
      arm64: dts: lg: adjust whitespace around '=3D'
      arm64: dts: marvell: adjust whitespace around '=3D'
      arm64: dts: hisilicon: adjust whitespace around '=3D'
      arm64: dts: sprd: adjust whitespace around '=3D'
      arm64: dts: microchip: adjust whitespace around '=3D'
      arm64: dts: renesas: Adjust whitespace around '=3D'
      arm64: dts: mediatek: adjust whitespace around '=3D'
      ARM: dts: mediatek: adjust whitespace around '=3D'
      arm64: dts: mediatek: align gpio-key node names with dtschema
      arm64: dts: mediatek: mt7622-bananapi-bpi-r64: align led node
names with dtschema
      ARM: dts: mediatek: align gpio-key node names with dtschema
      arm64: dts: ti: Adjust whitespace around '=3D'
      arm64: dts: ti: Align gpio-key node names with dtschema
      ARM: dts: keystone: Adjust whitespace around '=3D'
      arm64: dts: freescale: align gpio-key node names with dtschema
      arm64: dts: freescale: align led node names with dtschema
      arm64: dts: apm: correct gpio-keys properties
      arm64: dts: broadcom: align gpio-key node names with dtschema
      arm64: dts: hisilicon: align gpio-key node names with dtschema
      arm64: dts: hisilicon: correct gpio-keys properties
      ARM: dts: animeo: align gpio-key node names with dtschema
      ARM: dts: animeo: correct gpio-keys properties
      dt-bindings: arm: aspeed: document board compatibles
      ARM: dts: ast2500-evb: fix board compatible
      ARM: dts: ast2600-evb: fix board compatible
      ARM: dts: ast2600-evb-a1: fix board compatible
      ARM: dts: exynos: align aat1290 flash LED node with bindings in Galax=
y S3
      ARM: dts: exynos: add function and color to aat1290 flash LED
node in Galaxy S3
      ARM: dts: exynos: add function to LED node in Origen 4210
      ARM: dts: exynos: add function to LED nodes in Tiny4412
      ARM: dts: exynos: add function and color to LED nodes in Itop Elite
      ARM: dts: exynos: add function and color to LED node in Odroid U3
      ARM: dts: exynos: add function and color to LED nodes in Odroid X/X2
      ARM: dts: exynos: add function and color to LED node in Odroid HC1
      ARM: dts: exynos: add function and color to LED node in Odroid XU4
      ARM: dts: exynos: add function and color to LED nodes in Odroid XU/XU=
3
      arm64: dts: mediatek: mt7622-rfb1: remove wrong gpio-keys property
      arm64: dts: rockchip: align gpio-key node names with dtschema
      ARM: dts: rockchip: align gpio-key node names with dtschema
      ARM: dts: rockchip: correct gpio-keys properties on rk3288-tinker
      arm64: dts: xilinx: align gpio-key node names with dtschema
      ARM: dts: xilinx: align gpio-key node names with dtschema
      Merge branch 'for-v5.20/exynos7885-emmc-clk' into next/dt64
      ARM: tegra: Align gpio-keys node names with dtschema
      Merge branch 'for-v5.20/aspeed-dts-cleanup' into for-v5.20/dts-cleanu=
p
      ARM: dts: ti: adjust whitespace around '=3D'
      ARM: dts: omap: adjust whitespace around '=3D'
      ARM: dts: marvell: align gpio-key node names with dtschema
      ARM: dts: marvell: correct gpio-keys properties
      arm64: dts: marvell: align gpio-key node names with dtschema
      arm64: dts: marvell: armada-3720: align lednode names with dtschema
      ARM: dts: omap: align gpio-key node names with dtschema
      ARM: dts: omap: correct gpio-keys properties
      ARM: dts: at91: align gpio-key node names with dtschema
      ARM: dts: at91: correct gpio-keys properties
      ARM: dts: at91: drop unneeded status from gpio-keys
      ARM: dts: exynos: align SDHCI node name with dtschema
      ARM: dts: s3c24xx: align SDHCI node name with dtschema
      ARM: dts: s3c64xx: align SDHCI node name with dtschema
      ARM: dts: s5pv210: align SDHCI node name with dtschema
      arm64: dts: qcom: align OPP table names with DT schema
      arm64: dts: qcom: align PMIC GPIO pin configuration with DT schema
      arm64: dts: qcom: add fallback compatible to PMIC GPIOs
      arm64: dts: qcom: apq8096-db820c: add PM8994 pin function
      arm64: dts: qcom: msm8994-msft-lumia-octagon: add PM8994 pin properti=
es
      ARM: dts: qcom: align PMIC GPIO pin configuration with DT schema
      ARM: dts: qcom: mdm9615: add missing PMIC GPIO reg
      ARM: dts: qcom: pmx65: add fallback compatible to PMIC GPIO
      ARM: dts: qcom: add missing gpio-ranges in PMIC GPIOs
      arm64: dts: qcom: sdm630: order clocks according to bindings
      arm64: dts: qcom: sdm630: order regs according to bindings
      arm64: dts: qcom: sdm630: order interrupts according to bindings
      arm64: dts: qcom: add missing gpio-ranges in PMIC GPIOs
      arm64: dts: qcom: correct interrupt controller on PM8916 and PMS405
      ARM: dts: qcom: use dedicated QFPROM compatibles
      ARM: dts: qcom: cleanup QFPROM nodes
      ARM: dts: qcom: apq8064: add unit addresses to QFPROM regions
      ARM: dts: qcom: ipq4019: fix Micron SPI NOR compatible
      ARM: dts: qcom: adjust whitespace around '=3D'
      ARM: dts: qcom: align gpio-key node names with dtschema
      ARM: dts: qcom: apq8060-dragonboard: add function and color to LED no=
des
      ARM: dts: qcom: apq8060-ifc6410: add color to LED node
      ARM: dts: qcom: ipq4018-ap120c-ac: add function and color to LED node=
s
      ARM: dts: qcom: ipq8064-rb3011: add color to LED node
      ARM: dts: qcom: ipq8064: add function to LED nodes
      ARM: dts: qcom: use generic sram as name for imem and ocmem nodes
      ARM: dts: qcom: apq8064-asus-nexus7: add dedicated IMEM compatible
      ARM: dts: qcom: msm8974: add dedicated IMEM compatible
      ARM: dts: qcom: sdx55: add dedicated IMEM and syscon compatibles
      ARM: dts: qcom: msm8974: add required ranges to OCMEM
      ARM: dts: qcom: pm8841: add required thermal-sensor-cells
      arm64: dts: qcom: add missing AOSS QMP compatible fallback
      arm64: dts: qcom: correct SPMI WLED register range encoding
      arm64: dts: qcom: use dedicated QFPROM compatibles
      arm64: dts: qcom: sdm630: correct QFPROM byte offsets
      arm64: dts: qcom: ipq6018-cp01-c1: fix Micron SPI NOR compatible
      arm64: dts: qcom: msm8998-mtp: correct board compatible
      arm64: dts: qcom: adjust whitespace around '=3D'
      arm64: dts: qcom: align gpio-key node names with dtschema
      arm64: dts: qcom: correct gpio-keys properties
      arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status
from gpio-keys
      arm64: dts: qcom: align led node names with dtschema
      arm64: dts: qcom: ipq6018: add label to remoteproc node
      arm64: dts: qcom: sdm630: remove unneeded address/size cells in glink=
-edge
      arm64: dts: qcom: sm8350: remove duplicated glink-edge interrupt
      arm64: dts: qcom: sm8450: remove duplicated glink-edge interrupt
      arm64: dts: qcom: apq8016-sbc: add function and color to LED nodes
      arm64: dts: qcom: qrb5165-rb5: add function and color to LED nodes
      arm64: dts: qcom: sc7180-trogdor: add function to LED node
      arm64: dts: qcom: sc7280-herobrine: add function to LED node
      arm64: dts: qcom: sdm845-db845c: add function and color to LED nodes
      arm64: dts: qcom: use generic sram as name for imem and ocmem nodes
      arm64: dts: qcom: qcs404: add dedicated IMEM and syscon compatibles
      arm64: dts: qcom: sc7180: add dedicated IMEM and syscon compatibles
      arm64: dts: qcom: sc7280: add simple-mfd to IMEM
      arm64: dts: qcom: sdm630: add dedicated IMEM and syscon compatibles
      arm64: dts: qcom: sdm845: add dedicated IMEM and syscon compatibles
      arm64: dts: qcom: msm8994: add required ranges to OCMEM
      ARM: dts: stm32: adjust whitespace around '=3D' on MCU boards
      ARM: dts: aspeed: align gpio-key node names with dtschema
      ARM: dts: aspeed: correct gpio-keys properties
      Merge branch 'for-v5.20/aspeed-dts-cleanup' into for-v5.20/dts-cleanu=
p
      dt-bindings: samsung: document preferred compatible naming
      dt-bindings: soc: samsung: exynos-pmu: cleanup assigned clocks
      dt-bindings: soc: samsung: exynos-pmu: use abolute ref paths
      dt-bindings: soc: samsung: exynos-pmu: add reboot-mode
      arm64: dts: qcom: sdm845: Add CPU BWMON
      dt-bindings: hwinfo: renesas,prr: move from soc directory
      arm64: tegra: Adjust whitespace around '=3D'
      arm64: tegra: Align gpio-keys node names with dtschema
      ARM: dts: aspeed: centriq2400: drop the board
      dt-bindings: arm: qcom: fix Alcatel OneTouch Idol 3 compatibles
      dt-bindings: arm: qcom: fix Longcheer L8150 compatibles
      dt-bindings: arm: qcom: fix MSM8916 MTP compatibles
      dt-bindings: arm: qcom: fix MSM8994 boards compatibles
      dt-bindings: arm: qcom: add missing MSM8916 board compatibles
      dt-bindings: arm: qcom: add missing MSM8994 board compatibles
      dt-bindings: arm: qcom: add missing SM8150 board compatibles
      dt-bindings: arm: qcom: add missing SM8250 board compatibles
      dt-bindings: arm: qcom: add missing SM8350 board compatibles
      dt-bindings: vendor-prefixes: add Shift GmbH
      dt-bindings: arm: qcom: add missing MSM8998 board compatibles
      dt-bindings: arm: qcom: add missing MSM8992 board compatibles
      dt-bindings: arm: qcom: add missing QCS404 board compatibles
      dt-bindings: arm: qcom: add missing SDM630 board compatibles
      dt-bindings: arm: qcom: add missing SDM636 board compatibles
      dt-bindings: arm: qcom: add missing SDM845 board compatibles
      dt-bindings: arm: qcom: add missing SM6125 board compatibles
      dt-bindings: arm: qcom: add missing SM6350 board compatibles
      dt-bindings: arm: aspeed: add Aspeed Evaluation boards
      dt-bindings: soc: microchip: drop quotes when not needed
      dt-bindings: soc: microchip: use absolute path to other schema
      dt-bindings: soc: bcm: drop quotes when not needed
      dt-bindings: soc: bcm: use absolute path to other schema

Kuogee Hsieh (2):
      arm64: dta: qcom: sc7180: delete vdda-1p2 and vdda-0p9 from mdss_dp
      arm64: dts: qcom: sc7280: delete vdda-1p2 and vdda-0p9 from both
dp and edp

Laurent Pinchart (3):
      arm64: dts: renesas: Prepare AA1024XD12 panel .dtsi for overlay suppo=
rt
      arm64: dts: renesas: Add panel overlay for Salvator-X(S) boards
      arm64: dts: renesas: Add panel overlay for Draak and Ebisu boards

Leonard G=C3=B6hrs (2):
      ARM: dts: stm32: fix missing internally connected voltage
regulator for OSD32MP1
      ARM: dts: stm32: correct vcc-supply for eeprom on stm32mp15xx-osd32

Lin, Meng-Bo (1):
      arm64: dts: qcom: msm8916-samsung-a2015: Add touchscreen pinctrl

Linh Phung (3):
      arm64: dts: renesas: r8a779f0: Add thermal support
      arm64: dts: renesas: r8a779f0: Add HSCIF nodes
      arm64: dts: renesas: r8a779f0: Add SCIF nodes

Linus Walleij (4):
      ARM: dts: ux500: Fix Janice accelerometer mounting matrix
      ARM: dts: ux500: Fix Codina accelerometer mounting matrix
      ARM: dts: ux500: Fix Gavini accelerometer mounting matrix
      ARM: dts: ux500: Drop unused i2c power domain supply

Luca Weiss (5):
      ARM: dts: qcom: msm8974: Add BAM DMUX Ethernet/IP device
      ARM: dts: qcom-msm8974: fix irq type on blsp2_uart1
      arm64: dts: qcom: sdm845*: replace i2s reg with constant
      arm64: dts: qcom: sm8250: use constants for audio clocks
      ARM: dts: qcom: msm8974-FP2: Add notification LED

Lucas Stach (1):
      arm64: dts: imx8mp-evk: add regulator supply to CPU nodes

Manivannan Sadhasivam (3):
      ARM: dts: qcom: sdx55: Fix the IRQ trigger type for UART
      arm64: dts: qcom: sm8450: Fix the IRQ trigger type for remoteproc nod=
es
      arm64: dts: qcom: sc8280xp: Fix PMU interrupt

Marcel Ziswiler (19):
      ARM: dts: imx7-colibri: overhaul display/touch functionality
      ARM: dts: imx7-colibri: add mdio phy node
      ARM: dts: imx7-colibri: move aliases, chosen, extcon and gpio-keys
      ARM: dts: imx7-colibri: move regulators
      ARM: dts: imx7-colibri: clean-up usdhc1 and add sleep config
      ARM: dts: imx7-colibri: move rtc node
      ARM: dts: imx7d-colibri-emmc: add cpu1 supply
      ARM: dts: imx7-colibri-eval-v3: correct can controller comment
      ARM: dts: imx7-colibri: disable adc2
      ARM: dts: imx7-colibri-aster: add ssp aka spi cs aka ss pins
      ARM: dts: imx7-colibri: add clarifying comments
      ARM: dts: imx7-colibri: alphabetical re-order
      ARM: dts: imx7-colibri: clean-up device enabling/disabling
      ARM: dts: imx7-colibri: remove leading zero from reg address
      ARM: dts: imx7-colibri: set regulator-name properties
      ARM: dts: imx7-colibri: clean-up iomuxc pinctrl group naming
      ARM: dts: imx7-colibri: add support for Toradex Iris carrier boards
      dt-bindings: arm: fsl: correct 1g vs. 1gb in toradex,colibri-imx6ull-=
*
      dt-bindings: arm: fsl: add toradex,colibri-imx7s/d/d-emmc-iris/-v2

Marek Beh=C3=BAn (2):
      ARM: dts: turris-omnia: configure LED[0] pin function to link/activit=
y
      ARM: dts: turris-omnia: enable LED controller node

Marek Vasut (15):
      arm64: dts: imx8mm: Add SNVS LPGPR
      arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus
DHCOM and PDK2
      dt-bindings: arm: Add DH electronics i.MX8M Plus DHCOM and PDK2
      ARM: dts: stm32: Move DHCOR BUCK3 VDD 2V9 adjustment to 1V8 DTSI
      ARM: dts: stm32: Fix SPI2 pinmux pin comments on stm32mp15
      dt-bindings: arm: stm32: Add compatible string for DH
electronics DHCOR DRC Compact
      ARM: dts: stm32: Add alternate pinmux for CAN1 pins
      ARM: dts: stm32: Add alternate pinmux for SPI2 pins
      ARM: dts: stm32: Add alternate pinmux for UART3 pins
      ARM: dts: stm32: Add alternate pinmux for UART4 pins
      ARM: dts: stm32: Add alternate pinmux for UART5 pins
      ARM: dts: stm32: Add DHCOR based DRC Compact board
      ARM: dts: stm32: Add alternate pinmux for DCMI pins
      ARM: dts: stm32: Add alternate pinmux for RCC pin
      ARM: dts: stm32: Add ST MIPID02 bindings to AV96

Marijn Suijten (8):
      arm64: dts: qcom: sdm845-akatsuki: Round down l22a regulator voltage
      arm64: dts: qcom: pm660l: Add LPG node
      arm64: dts: qcom: sdm630-nile: Add RGB status LED on the PM660L LPG
      arm64: dts: qcom: sm6125: Move sdc2 pinctrl from seine-pdx201 to sm61=
25
      arm64: dts: qcom: sm6125: Append -state suffix to pinctrl nodes
      arm64: dts: qcom: sm6125: Add DLL/DDR configuration on SDHCI 1/2
      arm64: dts: qcom: sm6350: Replace literal rpmhpd indices with constan=
ts
      arm64: dts: qcom: msm8998: Make regulator voltages multiple of step-s=
ize

Mark Brown (1):
      ARM: dts: am33xx: Map baseboard EEPROM on BeagleBone Black

Markus Niebel (1):
      dt-bindings: arm: add TQMa8MPxL board

Markuss Broks (1):
      arm64: dts: qcom: msm8998-xperia: Introduce ToF sensor support

Martin J=C3=BCcker (1):
      ARM: dts: exynos: add panel and backlight to p4note

Matthias Kaehlcke (4):
      arm64: dts: qcom: sc7280: herobrine: Don't disable the keyboard
backlight node
      arm64: dts: qcom: sc7280: Enable keyboard backlight for villager
      arm64: dts: qcom: sc7280: Enable wifi for Chrome OS boards
      arm64: dts: qcom: sc7280: Set modem FW path for Chrome OS boards

Mauro Carvalho Chehab (1):
      docs: arm: index.rst: add google/chromebook-boot-flow

Max Krummenacher (15):
      ARM: dts: imx6qdl-colibri: Mux mclk for sgtl5000 with the codec node
      ARM: dts: imx6qdl-colibri: backlight pwm: Simplify inverted backlight
      ARM: dts: imx6qdl-colibri: backlight pwm: Adapt brightness steps
      ARM: dts: imx7-colibri: add ethernet aliases
      dt-bindings: arm: fsl: Add carrier for toradex,apalis-imx6q
      Revert "ARM: dts: imx6qdl-apalis: Avoid underscore in node name"
      ARM: dts: imx6q-apalis: Add gpio-line-names
      ARM: dts: imx6q-apalis: Command pmic to standby for poweroff
      ARM: dts: imx6q-apalis: Move Atmel MXT touch ctrl to SoM dtsi
      ARM: dts: imx6q-apalis: move gpio-keys to SoM dtsi
      ARM: dts: imx6q-apalis: Disable HDMI
      ARM: dts: imx6q-apalis: Add support for Toradex Ixora V1.2 carrier bo=
ards
      ARM: dts: imx6q-apalis: backlight pwm: Simplify inverted backlight
      ARM: dts: imx6q-apalis: backlight pwm: Adapt brightness steps
      ARM: dts: imx6q-apalis: Cleanup

Michael Riesch (4):
      arm64: dts: rockchip: enable vop2 and hdmi tx on quartz64a
      arm64: dts: rockchip: enable vop2 and hdmi tx on rock-3a
      arm64: dts: rockchip: enable hdmi tx audio on rk3568-evb1-v10
      arm64: dts: rockchip: enable hdmi tx audio on rock-3a

Michael Walle (2):
      ARM: dts: kswitch-d10: enable the USB device port
      ARM: dts: lan966x: add clock gating register

Michal Simek (4):
      dt-bindings: gpio: zynq: Add missing compatible strings
      dt-bindings: gpio: zynq: Add power-domains
      arm64: zynqmp: Fix comment about number of gpio line names
      dt-bindings: gpio: zynq: Describe gpio-line-names

Mikko Perttunen (4):
      dt-bindings: Add headers for Host1x and VIC on Tegra234
      arm64: tegra: Mark BPMP channels as no-memory-wc
      arm64: tegra: Add Host1x context stream IDs on Tegra186+
      arm64: tegra: Add Host1x and VIC on Tegra234

Molly Sophia (2):
      dt-bindings: arm: qcom: Add Xiaomi Mi Mix2s bindings
      arm64: dts: qcom: Add support for Xiaomi Mi Mix2s

Moudy Ho (1):
      arm64: dts: mt8183: add GCE client property for Mediatek MUTEX

Nick Hainke (1):
      arm64: dts: mt7622: fix BPI-R64 WPS button

Nicolas Frattaroli (2):
      arm64: dts: rockchip: Add HDMI audio nodes to rk356x
      arm64: dts: rockchip: Enable HDMI audio on Quartz64 A

Nicolas Saenz Julienne (4):
      dt-bindings: soc: bcm: bcm2835-pm: Convert bindings to DT schema
      dt-bindings: soc: bcm: bcm2835-pm: Introduce reg-names
      ARM: dts: bcm2835/bcm2711: Introduce reg-names in watchdog node
      ARM: dts: bcm2711: Use proper compatible in PM/Watchdog node

Niklas S=C3=B6derlund (2):
      arm64: dts: rockchip: Add missing space around regulator-name on
rk3368-orion-r68
      arm64: dts: renesas: Add missing space after remote-endpoint

Niravkumar L Rabara (2):
      arm64: dts: intel: socfpga_agilex: use defined GIC interrupt type for=
 ECC
      arm64: dts: altera: socfpga_stratix10: move clocks out of soc node

N=C3=ADcolas F. R. A. Prado (21):
      arm64: dts: mt8192: Fix idle-states nodes naming scheme
      arm64: dts: mt8192: Fix idle-states entry-method
      dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-spherion
      dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-hayato
      arm64: dts: mediatek: Introduce MT8192-based Asurada board family
      arm64: dts: mediatek: asurada: Document GPIO names
      arm64: dts: mediatek: asurada: Add system-wide power supplies
      arm64: dts: mediatek: asurada: Enable and configure I2C and SPI busse=
s
      arm64: dts: mediatek: asurada: Add ChromeOS EC
      arm64: dts: mediatek: asurada: Add keyboard mapping for the top row
      arm64: dts: mediatek: asurada: Add Cr50 TPM
      arm64: dts: mediatek: asurada: Add Elan eKTH3000 I2C trackpad
      arm64: dts: mediatek: asurada: Add I2C touchscreen
      arm64: dts: mediatek: spherion: Add keyboard backlight
      arm64: dts: mediatek: asurada: Enable XHCI
      arm64: dts: mediatek: asurada: Enable PCIe and add WiFi
      arm64: dts: mediatek: asurada: Add MT6359 PMIC
      arm64: dts: mediatek: asurada: Add SPMI regulators
      arm64: dts: mediatek: asurada: Enable MMC
      arm64: dts: mediatek: asurada: Enable SCP
      arm64: dts: mediatek: asurada: Add SPI NOR flash memory

Oleksandr Suvorov (9):
      ARM: dts: imx7-colibri: improve licensing and compatible strings
      ARM: dts: imx7-colibri: improve wake-up with gpio key
      ARM: dts: imx7-colibri: add delay for on-module phy supply
      ARM: dts: imx6q-apalis: Move parallel rgb interface to SoM dtsi
      ARM: dts: imx6q-apalis: Move pinmux groups to SoM dtsi
      ARM: dts: imx6q-apalis: Add LVDS panel support
      ARM: dts: imx6q-apalis: Disable stmpe touchscreen
      ARM: dts: imx6q-apalis: Add ov5640 mipi csi camera
      ARM: dts: imx6q-apalis: Add adv7280 video input

Parikshit Pareek (1):
      arm64: dts: qcom: sc8280xp: fix the smmu interrupt values

Pawe=C5=82 Anikiel (5):
      ARM: dts: socfpga: Change Mercury+ AA1 dts to dtsi
      ARM: dts: socfpga: Move sdmmc-ecc node to Arria 10 dts
      ARM: dts: socfpga: Add atsha204a node to Mercury+ AA1 dts
      ARM: dts: socfpga: Add Google Chameleon v3 devicetree
      dt-bindings: altera: Add Chameleon v3 board

Peng Fan (6):
      arm64: dts: freescale: Add i.MX93 dtsi support
      arm64: dts: freescale: add i.MX93 11x11 EVK basic support
      arm64: dts: imx8ulp: address build warning
      arm64: dts: fsl-ls10xx: use generic dma node name
      dt-bindings: arm: fsl: add imx93 11x11 evk board
      arm64: dts: imx8mp: add NoC node

Peter Geis (6):
      arm64: dts: rockchip: add Quartz64-A fan pinctrl
      arm64: dts: rockchip: enable sdr-104 for sdmmc on Quartz A
      arm64: dts: rockchip: enable sfc controller on Quartz64 Model A
      arm64: dts: rockchip: Add rk3568 PCIe2x1 controller
      arm64: dts: rockchip: Enable PCIe controller on quartz64-a
      arm64: dts: rockchip: add pine64 touch panel display to rockpro64

Peter Robinson (1):
      ARM: dts: bcm2711: Enable V3D

Phil Edworthy (2):
      arm64: dts: renesas: r9a09g011: Add ethernet nodes
      arm64: dts: renesas: rzv2mevk2: Enable ethernet

Philippe Schenker (2):
      ARM: dts: imx7-colibri: add usb dual-role switching using extcon
      arm64: dts: imx8m{m,p}-verdin: use IT temperatures

Rafa=C5=82 Mi=C5=82ecki (4):
      arm64: dts: Add base DTS file for bcmbca device Asus GT-AX6000
      arm64: make ARCH_BCM4908 select ARCH_BCMBCA
      arm64: bcmbca: Include full family name in Kconfig
      dt-bindings: arm: Add Asus GT-AX6000 based on BCM4912

Rex-BC Chen (5):
      arm64: dts: mediatek: Add opp table and clock property for MT8183 cpu=
freq
      arm64: dts: mediatek: Add MediaTek CCI node for MT8183
      arm64: dts: mediatek: Add mediatek,cci property for MT8183 cpufreq
      arm64: dts: mediatek: Add infra #reset-cells property for MT8192
      arm64: dts: mediatek: Add infra #reset-cells property for MT8195

Rob Herring (2):
      arm64: dts: arm/fvp-base-revc: Remove 'panel-dpi' compatible
      arm64: dts: arm/juno: Drop erroneous 'mbox-name' property

Robert Foss (3):
      dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
      arm64: dts: qcom: sm8350: Add DISPCC node
      arm64: dts: qcom: sm8350: Replace integers with rpmpd defines

Robert Hancock (1):
      arm64: dts: zynqmp: add AMS driver to device tree

Robert Marko (9):
      dt-bindings: clock: qcom: ipq8074: add USB GDSCs
      arm64: dts: qcom: ipq8074: add USB power domains
      arm64: dts: qcom: ipq6018: correct QUP peripheral labels
      arm64: dts: qcom: ipq8074: fix NAND node name
      arm64: dts: qcom: ipq8074: move ARMv8 timer out of SoC node
      arm64: dts: qcom: ipq8074: add reset to SDHCI
      arm64: dts: qcom: ipq8074: add APCS node
      arm64: dts: qcom: ipq8074: add #size/address-cells to DTSI
      arm64: dts: qcom: ipq8074: add interrupt-parent to DTSI

Robin van der Gracht (1):
      ARM: dts: imx6qdl-prti6q.dtsi: Add applicable properties to usdhc3

Roger Lu (1):
      arm64: dts: mt8183: add svs device information

Rohit Agarwal (12):
      ARM: dts: qcom: sdx65: Add Shared memory manager support
      ARM: dts: qcom: sdx65: Add interconnect nodes
      ARM: dts: qcom: sdx65: Add USB3 and PHY support
      ARM: dts: qcom: sdx65-mtp: Enable USB3 and PHY support
      ARM: dts: qcom: sdx65: Add CPUFreq support
      ARM: dts: qcom: sdx65: Add modem SMP2P node
      ARM: dts: qcom: sdx65: Add IMEM and PIL info region
      ARM: dts: qcom: sdx65: Add SCM node
      ARM: dts: qcom: sdx65: Add Modem remoteproc node
      ARM: dts: qcom: sdx65-mtp: Enable modem
      ARM: dts: qcom: sdx65: Add pshold support
      ARM: dts: qcom: sdx65: Add Watchdog support

Sameer Pujar (2):
      arm64: tegra: Add OPE device on Tegra210 and later
      arm64: tegra: Enable OPE on various platforms

Samuel Holland (12):
      ARM: dts: sunxi: Use constants for RTC clock indexes
      arm64: dts: allwinner: Use constants for RTC clock indexes
      dt-bindings: clock: Add compatible for D1 DE2 clocks
      arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
      dt-bindings: i2c: mv64xxx: Add variants with offload support
      arm64: dts: allwinner: a100: Update I2C controller fallback
      dt-bindings: usb: sunxi-musb: Add Allwinner D1 compatible
      dt-bindings: usb: generic-ehci: Add Allwinner D1 compatible
      dt-bindings: usb: generic-ohci: Add Allwinner D1 compatible
      dt-bindings: arm: sunxi: Default to the full MBUS binding
      dt-bindings: arm: sunxi: Add several MBUS compatibles
      arm64: dts: allwinner: pinephone: Enable internal HMIC bias

Sascha Hauer (3):
      arm64: dts: rockchip: rk356x: Add VOP2 nodes
      arm64: dts: rockchip: rk356x: Add HDMI nodes
      arm64: dts: rockchip: rk3568-evb: Enable VOP2 and hdmi

Sean Anderson (3):
      ARM: dts: layerscape: Add SFP node for TA 2.1 devices
      arm64: dts: layerscape: Add SFP node for TA 2.1 devices
      arm64: dts: Add SFP node for TA 3.0 devices

Serge Semin (3):
      ARM: dts: lpc18xx: Harmonize EHCI/OHCI DT nodes name
      arm64: dts: apm: Harmonize DWC USB3 DT nodes name
      ARM: dts: stih407-family: Harmonize DWC USB3 DT nodes name

Shengjiu Wang (3):
      arm64: dts: imx8mm-evk: add bt-sco sound card support
      arm64: dts: imx8mq-evk: add bt-sco sound card support
      arm64: dts: imx8mn-evk: add bt-sco sound card support

Sibi Sankar (2):
      arm64: dts: qcom: sm8450: Add interconnect requirements for SCM
      arm64: dts: qcom: sc7280: Add proxy interconnect requirements for mod=
em

Simon Holesch (1):
      ARM: dts: imx6ulz-bsh-smm-m2: Support proper board power off

Sireesh Kodali (1):
      arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node

Sjoerd Simons (2):
      dt-bindings: arm: rockchip: Add Radxa ROCK Pi S
      arm64: dts: rockchip: rock-pi-s add more peripherals

Srinivasa Rao Mandadapu (6):
      arm64: dts: qcom: sc7280: Add pinmux for I2S speaker and Headset
      arm64: dts: qcom: sc7280: Add secondary MI2S pinmux
specifications for CRD 3.0/3.1
      arm64: dts: qcom: sc7280: add lpass lpi pin controller node
      arm64: dts: qcom: sc7280-herobrine: Add lpi pinmux properties
for CRD 3.0/3.1
      arm64: dts: qcom: sc7280-qcard: Add ldo_l17b regulator node
      arm64: dts: qcom: sc7280: Move wcd specific pin conf to common file

Steev Klimaszewski (2):
      arm64: dts: qcom: sc8280xp: add missing 300MHz
      arm64: dts: sdm850: Remove unnecessary turbo-mode

Stefan Agner (1):
      ARM: dts: imx7-colibri: set lcdif clock source to video pll

Stefan Hansson (1):
      dt-bindings: arm: qcom: Document lg,judyln and lg,judyp devices

Stefan Wahren (2):
      ARM: dts: bcm283x: Drop unnecessary properties from dpi node
      dt-bindings: soc: bcm: bcm2835-pm: Add support for bcm2711

Stephan Gerhold (2):
      arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo
      ARM: dts: qcom: msm8974: Disable remoteprocs by default

Stephen Boyd (3):
      arm64: dts: qcom: Remove duplicate sc7180-trogdor include on
lazor/homestar
      arm64: dts: qcom: sc7180: Remove ipa_fw_mem node on trogdor
      arm64: dts: qcom: sc7180-trogdor: Split out keyboard node and
describe detachables

Sudeep Holla (1):
      arm64: dts: juno: Add cache-level property to L2 caches

Sumit Garg (1):
      arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs assignment

Sumit Gupta (5):
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 CBB 1.0 binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 AXI2APB binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra234 CBB 2.0 binding
      arm64: tegra: Add node for CBB 1.0 on Tegra194
      arm64: tegra: Add node for CBB 2.0 on Tegra234

Tam=C3=A1s Sz=C5=B1cs (1):
      arm64: tegra: Fix SDMMC1 CD on P2888

Teh Wen Ping (2):
      dt-bindings: altera: document Stratix 10 SWVP compatibles
      arm64: dts: Add support for Stratix 10 Software Virtual Platform

Teresa Remmet (2):
      bindings: arm: fsl: Add PHYTEC i.MX8MM devicetree bindings
      arm64: dts: freescale: Add phyBOARD-Polis-i.MX8MM support

Thierry Reding (6):
      dt-bindings: power: Add Tegra234 MGBE power domains
      dt-bindings: Add Tegra234 MGBE clocks and resets
      dt-bindings: memory: Add Tegra234 MGBE memory clients
      dt-bindings: tegra-ccplex-cluster: Remove status from required proper=
ties
      Merge branch 'for-5.20/dt-bindings' into for-5.20/arm64/dt
      arm64: tegra: Enable native timers on Tegra194

Tho Vu (1):
      arm64: dts: renesas: r8a779f0: Add CPUIdle support

Tim Harvey (1):
      arm64: dts: imx8mm-venice-gw7902: fix UART1 CTS

Ulrich =C3=96lmann (1):
      ARM: dts: imx6: skov: add pwm-regulator to control the panel's VCOM

Uwe Kleine-K=C3=B6nig (1):
      arm64: freescale/imx8mp-evk.dts: reorder nodes alphabetically

Vinod Koul (3):
      arm64: dts: qcom: sm8450: rename interconnect nodes
      arm64: dts: qcom: sm8350: Move qup-opp-tables out of soc node
      arm64: dts: qcom: sm8250: Move qup-opp-table out of soc node

Vinod Polimera (4):
      arm64: dts: qcom: sm7280: remove assigned-clock-rate property for mdp=
 clk
      arm64: dts: qcom: sm7180: remove assigned-clock-rate property for mdp=
 clk
      arm64: dts: qcom: sdm845: remove assigned-clock-rate property for mdp=
 clk
      arm64: dts: qcom: sm8250: remove assigned-clock-rate property for mdp=
 clk

Viorel Suman (3):
      arm64: dts: freescale: imx8qxp: Remove unnecessary clock related entr=
ies
      arm64: dts: freescale: imx8qxp: Fix the ocotp node name
      arm64: dts: freescale: imx8: Fix the system-controller node name

Vladimir Zapolskiy (4):
      arm64: dts: qcom: sm8450: fix interconnects property of UFS node
      arm64: dts: qcom: sm8250: Disable camcc by default
      dt-bindings: clock: add QCOM SM8450 camera clock bindings
      arm64: dts: qcom: sm8450: Add description of camera clock controller

William Zhang (24):
      arm64: bcmbca: add arch bcmbca machine entry
      dt-bindings: arm64: add BCM63158 SoC to binding document
      dt-bindings: arm64: Add BCM4912 SoC to binding document
      arm64: dts: Add DTS files for bcmbca SoC BCM63158
      arm64: dts: Add DTS files for bcmbca SoC BCM4912
      dt-bindings: arm: add BCM6846 SoC to device tree binding document
      ARM: dts: Add DTS files for bcmbca SoC BCM6846
      ARM: dts: Update BCM47622 DTS file
      dt-bindings: arm: add BCM6855 SoC to device tree binding document
      arm64: dts: Add DTS files for bcmbca SoC BCM63146
      arm64: dts: Add DTS files for bcmbca SoC BCM6856
      ARM: dts: Add DTS files for bcmbca SoC BCM6855
      dt-bindings: arm: Add BCM6756 SoC
      ARM: dts: Add DTS files for bcmbca SoC BCM6756
      dt-bindings: arm64: Add BCM63146 SoC
      dt-bindings: arm64: Add BCM6856 SoC
      dt-bindings: arm: Add BCM63148 SoC
      ARM: dts: Add DTS files for bcmbca SoC BCM63148
      dt-bindings: arm64: Add BCM6813 SoC
      arm64: dts: Add DTS files for bcmbca SoC BCM6813
      dt-bindings: arm: add BCM63138 SoC
      ARM: dts: Move BCM963138DVT board dts to ARCH_BCMBCA
      ARM: dts: update dts files for bcmbca SoC BCM63138
      ARM: dts: Add BCM63138 generic board dts

Wolfram Sang (3):
      arm64: dts: renesas: rzg2l-smarc: Use proper bool operator
      arm64: dts: renesas: r8a779f0: Add DMA properties to SCIF3
      arm64: dts: renesas: spider-cpu: Enable SCIF0 on second connector

Xiangsheng Hou (1):
      arm64: dts: mt8173: Fix nor_flash node

Yassine Oudjana (1):
      arm64: dts: qcom: msm8996: Add interconnect support

Yoshihiro Shimoda (3):
      arm64: dts: renesas: r8a779f0: Add IPMMU nodes
      arm64: dts: renesas: r8a779f0: Add iommus to DMAC nodes
      arm64: dts: renesas: r8a779f0: Add UFS node

Zelong Dong (1):
      arm64: dts: meson: add reset controller for Meson-S4 SoC

qianfan Zhao (3):
      ARM: dts: sun8i-r40: Add "cpu-supply" node for sun8i-r40 based board
      ARM: dts: sun8i-r40: add opp table for cpu
      ARM: dts: sun8i-r40: Add thermal trip points/cooling maps

 Documentation/arm/google/chromebook-boot-flow.rst  |   69 +
 Documentation/arm/index.rst                        |    2 +
 Documentation/devicetree/bindings/arm/altera.yaml  |   10 +-
 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   87 +
 .../devicetree/bindings/arm/atmel-at91.yaml        |    6 +-
 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml  |    7 +
 .../devicetree/bindings/arm/bcm/brcm,bcmbca.yaml   |   93 +
 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  271 ---
 Documentation/devicetree/bindings/arm/fsl.yaml     |   61 +-
 .../bindings/arm/marvell/marvell,ac5.yaml          |   32 +
 .../devicetree/bindings/arm/mediatek.yaml          |   30 +
 .../bindings/arm/mediatek/mediatek,pericfg.yaml    |    1 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |  441 +++-
 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 .../bindings/arm/samsung/samsung-soc.yaml          |   40 +
 .../devicetree/bindings/arm/stm32/stm32.yaml       |    8 +-
 Documentation/devicetree/bindings/arm/sunxi.yaml   |   10 +
 .../arm/sunxi/allwinner,sun4i-a10-mbus.yaml        |   24 +-
 .../arm/tegra/nvidia,tegra-ccplex-cluster.yaml     |    1 -
 .../arm/tegra/nvidia,tegra194-axi2apb.yaml         |   40 +
 .../bindings/arm/tegra/nvidia,tegra194-cbb.yaml    |   97 +
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |   74 +
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml        |    3 +
 .../devicetree/bindings/clock/fsl,scu-clk.yaml     |   43 +
 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |    6 +-
 .../bindings/clock/qcom,gpucc-sm8350.yaml          |   72 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   80 +
 .../bindings/clock/samsung,exynos7885-clock.yaml   |   27 +
 .../devicetree/bindings/clock/st,stm32mp1-rcc.yaml |    1 +
 .../bindings/cpufreq/qcom-cpufreq-nvmem.yaml       |    4 +-
 .../devicetree/bindings/firmware/fsl,scu.yaml      |  210 ++
 .../devicetree/bindings/gpio/gpio-zynq.yaml        |   59 +-
 .../bindings/{arm =3D> hwinfo}/renesas,prr.yaml      |    4 +-
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml          |   10 +-
 .../devicetree/bindings/input/fsl,scu-key.yaml     |   40 +
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    |    1 +
 .../bindings/net/pcs/renesas,rzn1-miic.yaml        |  171 ++
 .../devicetree/bindings/nvmem/fsl,scu-ocotp.yaml   |   56 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml       |   18 +-
 .../bindings/pinctrl/fsl,scu-pinctrl.yaml          |   74 +
 .../devicetree/bindings/power/fsl,scu-pd.yaml      |   41 +
 .../devicetree/bindings/rtc/fsl,scu-rtc.yaml       |   31 +
 .../bindings/soc/bcm/brcm,bcm2835-pm.txt           |   46 -
 .../bindings/soc/bcm/brcm,bcm2835-pm.yaml          |   86 +
 .../soc/microchip/atmel,at91rm9200-tcb.yaml        |    6 +-
 .../microchip/microchip,mpfs-sys-controller.yaml   |    4 +-
 .../bindings/soc/samsung/exynos-pmu.yaml           |   13 +-
 .../bindings/soc/samsung/exynos-usi.yaml           |    8 +-
 .../bindings/thermal/fsl,scu-thermal.yaml          |   38 +
 .../bindings/timer/nvidia,tegra186-timer.yaml      |  109 +
 .../bindings/usb/allwinner,sun4i-a10-musb.yaml     |    1 +
 .../devicetree/bindings/usb/atmel-usb.txt          |    3 +
 .../devicetree/bindings/usb/generic-ehci.yaml      |    1 +
 .../devicetree/bindings/usb/generic-ohci.yaml      |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 .../devicetree/bindings/watchdog/fsl,scu-wdt.yaml  |   34 +
 MAINTAINERS                                        |    5 +
 arch/arm/boot/dts/Makefile                         |   29 +-
 arch/arm/boot/dts/alpine.dtsi                      |    2 +-
 arch/arm/boot/dts/am335x-boneblack-wireless.dts    |    2 +-
 arch/arm/boot/dts/am335x-boneblack.dts             |    4 +
 arch/arm/boot/dts/am335x-boneblue.dts              |    2 +-
 arch/arm/boot/dts/am335x-bonegreen-wireless.dts    |    2 +-
 arch/arm/boot/dts/am335x-cm-t335.dts               |    4 +-
 arch/arm/boot/dts/am335x-evm.dts                   |    8 +-
 arch/arm/boot/dts/am335x-guardian.dts              |    2 -
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi  |    4 +-
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi  |    4 +-
 arch/arm/boot/dts/am335x-pcm-953.dtsi              |    4 +-
 arch/arm/boot/dts/am335x-pepper.dts                |    8 +-
 .../boot/dts/am335x-sancloud-bbe-extended-wifi.dts |    2 +-
 arch/arm/boot/dts/am335x-shc.dts                   |    6 +-
 arch/arm/boot/dts/am3517-evm-ui.dtsi               |   26 +-
 arch/arm/boot/dts/am3517-evm.dts                   |   18 +-
 arch/arm/boot/dts/am3874-iceboard.dts              |    4 +-
 arch/arm/boot/dts/am437x-idk-evm.dts               |    6 +-
 arch/arm/boot/dts/am437x-l4.dtsi                   |    2 +-
 arch/arm/boot/dts/animeo_ip.dts                    |   10 +-
 arch/arm/boot/dts/armada-370-c200-v2.dts           |    8 +-
 arch/arm/boot/dts/armada-370-rd.dts                |    2 -
 arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi |    8 +-
 .../dts/armada-370-seagate-personal-cloud.dtsi     |    8 +-
 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts  |    2 +-
 arch/arm/boot/dts/armada-385-clearfog-gtr.dtsi     |    4 +-
 arch/arm/boot/dts/armada-385-linksys.dtsi          |    4 +-
 arch/arm/boot/dts/armada-385-turris-omnia.dts      |   10 +-
 arch/arm/boot/dts/armada-388-clearfog-base.dts     |    2 +-
 arch/arm/boot/dts/armada-388-clearfog.dts          |    2 +-
 arch/arm/boot/dts/armada-xp-axpwifiap.dts          |    6 +-
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts      |    8 +-
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts   |    6 +-
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |    2 +-
 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts        |    1 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts           |    2 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |   30 +-
 .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    |  225 --
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts   |   48 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |   10 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |   14 +-
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |   22 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts        |   23 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts        |   20 +-
 arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         |   30 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |   14 +-
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts        |    4 +-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |   16 +-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |    4 +-
 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts  |    6 +-
 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts        |    6 +-
 arch/arm/boot/dts/at91-foxg20.dts                  |    4 +-
 arch/arm/boot/dts/at91-gatwick.dts                 |    2 +-
 arch/arm/boot/dts/at91-kizbox.dts                  |    8 +-
 arch/arm/boot/dts/at91-kizbox2-common.dtsi         |   10 +-
 arch/arm/boot/dts/at91-kizbox3-hs.dts              |   14 +-
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi      |    6 +-
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts        |    2 +-
 arch/arm/boot/dts/at91-qil_a9260.dts               |    4 +-
 arch/arm/boot/dts/at91-sam9x60ek.dts               |    7 +-
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi          |    4 +-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |    8 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi        |    2 +
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts      |    7 +-
 arch/arm/boot/dts/at91-sama5d2_icp.dts             |    9 +-
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts          |   12 +-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |   12 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts        |    4 +-
 arch/arm/boot/dts/at91-sama5d4_xplained.dts        |    4 +-
 arch/arm/boot/dts/at91-sama5d4ek.dts               |    4 +-
 arch/arm/boot/dts/at91-sama7g5ek.dts               |    4 +-
 arch/arm/boot/dts/at91-wb45n.dts                   |    7 +-
 arch/arm/boot/dts/at91-wb50n.dts                   |   10 +-
 arch/arm/boot/dts/at91sam9260.dtsi                 |    2 +-
 arch/arm/boot/dts/at91sam9260ek.dts                |    6 +-
 arch/arm/boot/dts/at91sam9261.dtsi                 |    2 +-
 arch/arm/boot/dts/at91sam9261ek.dts                |   10 +-
 arch/arm/boot/dts/at91sam9263.dtsi                 |    2 +-
 arch/arm/boot/dts/at91sam9263ek.dts                |    6 +-
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi        |    6 +-
 .../boot/dts/at91sam9g25-gardena-smart-gateway.dts |    2 +-
 arch/arm/boot/dts/at91sam9g45.dtsi                 |    2 +-
 arch/arm/boot/dts/at91sam9m10g45ek.dts             |   16 +-
 arch/arm/boot/dts/at91sam9n12.dtsi                 |    2 +-
 arch/arm/boot/dts/at91sam9n12ek.dts                |    4 +-
 arch/arm/boot/dts/at91sam9rl.dtsi                  |    2 +-
 arch/arm/boot/dts/at91sam9rlek.dts                 |    6 +-
 arch/arm/boot/dts/at91sam9x5.dtsi                  |    2 +-
 arch/arm/boot/dts/axm5516-cpus.dtsi                |   32 +-
 arch/arm/boot/dts/bcm2711-rpi.dtsi                 |    4 +
 arch/arm/boot/dts/bcm2711.dtsi                     |   14 +-
 arch/arm/boot/dts/bcm28155-ap.dts                  |    8 +-
 arch/arm/boot/dts/bcm2835-common.dtsi              |    1 +
 arch/arm/boot/dts/bcm283x.dtsi                     |    8 +-
 arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts        |    6 +-
 arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts        |    8 +-
 .../dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi    |   10 +-
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  |   10 +-
 arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts    |    4 +-
 arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts    |    4 +-
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts       |    2 +-
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       |    2 +-
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts        |    6 +-
 arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts     |    6 +-
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      |    6 +-
 arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts        |    4 +-
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |    8 +-
 arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts  |    2 +-
 arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts      |    2 +-
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts      |    2 +-
 arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts |    4 +-
 arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts        |    6 +-
 arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts  |   14 +-
 arch/arm/boot/dts/bcm4709-linksys-ea9200.dts       |    6 +-
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts        |    8 +-
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts        |   10 +-
 arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts  |    6 +-
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts       |    8 +-
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |    6 +-
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    |    6 +-
 arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts      |    2 +-
 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts      |    2 +-
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts      |    2 +-
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts      |    4 +-
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts      |    2 +-
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |    2 +-
 arch/arm/boot/dts/bcm47094-netgear-r8500.dts       |    8 +-
 arch/arm/boot/dts/bcm47094-phicomm-k3.dts          |    2 +-
 arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts      |    2 +-
 arch/arm/boot/dts/bcm47189-luxul-xap-810.dts       |    2 +-
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts           |    6 +-
 arch/arm/boot/dts/bcm47622.dtsi                    |   14 +-
 arch/arm/boot/dts/bcm53015-meraki-mr26.dts         |  166 ++
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts         |    4 +-
 arch/arm/boot/dts/bcm5301x.dtsi                    |    6 +-
 arch/arm/boot/dts/bcm63138.dtsi                    |    4 +-
 arch/arm/boot/dts/bcm63148.dtsi                    |  103 +
 arch/arm/boot/dts/bcm63178.dtsi                    |  118 ++
 arch/arm/boot/dts/bcm6756.dtsi                     |  130 ++
 arch/arm/boot/dts/bcm6846.dtsi                     |  103 +
 arch/arm/boot/dts/bcm6855.dtsi                     |  120 ++
 arch/arm/boot/dts/bcm6878.dtsi                     |  110 +
 arch/arm/boot/dts/bcm911360_entphn.dts             |    4 +-
 arch/arm/boot/dts/bcm947189acdbmr.dts              |    4 +-
 arch/arm/boot/dts/bcm953012er.dts                  |    4 +-
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi      |    2 +-
 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi    |    2 +-
 arch/arm/boot/dts/bcm963138.dts                    |   27 +
 arch/arm/boot/dts/bcm963138dvt.dts                 |    2 +-
 arch/arm/boot/dts/bcm963148.dts                    |   30 +
 arch/arm/boot/dts/bcm963178.dts                    |   30 +
 arch/arm/boot/dts/bcm96756.dts                     |   30 +
 arch/arm/boot/dts/bcm96846.dts                     |   30 +
 arch/arm/boot/dts/bcm96855.dts                     |   30 +
 arch/arm/boot/dts/bcm96878.dts                     |   30 +
 arch/arm/boot/dts/da850-evm.dts                    |   18 +-
 arch/arm/boot/dts/da850.dtsi                       |   12 +-
 arch/arm/boot/dts/dm8148-evm.dts                   |    2 +-
 arch/arm/boot/dts/dm8168-evm.dts                   |    2 +-
 arch/arm/boot/dts/dra62x-j5eco-evm.dts             |    2 +-
 arch/arm/boot/dts/dra76x.dtsi                      |    6 +-
 arch/arm/boot/dts/e60k02.dtsi                      |    4 +-
 arch/arm/boot/dts/e70k02.dtsi                      |    8 +-
 arch/arm/boot/dts/ecx-common.dtsi                  |   10 +-
 arch/arm/boot/dts/en7523-evb.dts                   |    8 +
 arch/arm/boot/dts/en7523.dtsi                      |   66 +
 arch/arm/boot/dts/exynos-pinctrl.h                 |   55 +
 arch/arm/boot/dts/exynos3250-artik5.dtsi           |    2 +-
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi          |    2 +-
 arch/arm/boot/dts/exynos3250.dtsi                  |    6 +-
 arch/arm/boot/dts/exynos4.dtsi                     |    8 +-
 arch/arm/boot/dts/exynos4210-i9100.dts             |    8 +-
 arch/arm/boot/dts/exynos4210-origen.dts            |   12 +-
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi          |    2 +-
 arch/arm/boot/dts/exynos4210-trats.dts             |    2 +-
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        |    8 +-
 arch/arm/boot/dts/exynos4412-itop-elite.dts        |   15 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi            |    3 +-
 arch/arm/boot/dts/exynos4412-odroidu3.dts          |    4 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts           |    5 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi           |   86 +-
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi          |    2 +-
 arch/arm/boot/dts/exynos4412-tiny4412.dts          |    3 +
 arch/arm/boot/dts/exynos5.dtsi                     |    2 +-
 arch/arm/boot/dts/exynos5250-arndale.dts           |   12 +-
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi          |    2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      |    2 +-
 arch/arm/boot/dts/exynos5250-spring.dts            |    2 +-
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi          |    2 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi          |    2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      |    2 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts         |    2 +-
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi          |    2 +-
 arch/arm/boot/dts/exynos5422-odroidhc1.dts         |    4 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts         |    4 +-
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi    |    8 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts          |    2 +-
 arch/arm/boot/dts/imx25.dtsi                       |    2 +-
 arch/arm/boot/dts/imx27.dtsi                       |    6 +-
 arch/arm/boot/dts/imx31.dtsi                       |    4 +-
 arch/arm/boot/dts/imx50.dtsi                       |    6 +-
 arch/arm/boot/dts/imx51-ts4800.dts                 |    2 +-
 arch/arm/boot/dts/imx51.dtsi                       |    6 +-
 arch/arm/boot/dts/imx53.dtsi                       |    6 +-
 arch/arm/boot/dts/imx6dl-plym2m.dts                |    2 +-
 arch/arm/boot/dts/imx6dl-prtvt7.dts                |    2 +-
 arch/arm/boot/dts/imx6dl-victgo.dts                |    2 +-
 arch/arm/boot/dts/imx6dl.dtsi                      |    2 +-
 arch/arm/boot/dts/imx6q-apalis-eval.dts            |  127 +-
 arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts      |  263 +--
 arch/arm/boot/dts/imx6q-apalis-ixora-v1.2.dts      |  276 +++
 arch/arm/boot/dts/imx6q-apalis-ixora.dts           |  113 +-
 arch/arm/boot/dts/imx6q-bosch-acc.dts              |    4 +-
 .../boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts    |    6 +
 arch/arm/boot/dts/imx6q.dtsi                       |    4 +-
 arch/arm/boot/dts/imx6qdl-apalis.dtsi              |  638 ++++--
 arch/arm/boot/dts/imx6qdl-colibri.dtsi             |   19 +-
 arch/arm/boot/dts/imx6qdl-prti6q.dtsi              |    3 +
 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi       |    4 +-
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi            |   10 +
 arch/arm/boot/dts/imx6qdl.dtsi                     |    6 +-
 arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts       |   10 +-
 arch/arm/boot/dts/imx6sx.dtsi                      |    2 +-
 arch/arm/boot/dts/imx6ul-kontron-n6x1x-s.dtsi      |    1 -
 arch/arm/boot/dts/imx6ul-phytec-segin.dtsi         |    5 -
 arch/arm/boot/dts/imx6ul-tqma6ul2l.dtsi            |    2 +-
 arch/arm/boot/dts/imx6ul.dtsi                      |   36 +-
 arch/arm/boot/dts/imx6ull-colibri.dtsi             |    1 -
 arch/arm/boot/dts/imx6ull-tqma6ull2.dtsi           |    2 +-
 arch/arm/boot/dts/imx6ull-tqma6ull2l.dtsi          |    2 +-
 arch/arm/boot/dts/imx6ull.dtsi                     |    2 +-
 arch/arm/boot/dts/imx6ulz-bsh-smm-m2.dts           |    4 +
 arch/arm/boot/dts/imx7-colibri-aster.dtsi          |  142 +-
 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi        |  156 +-
 arch/arm/boot/dts/imx7-colibri-iris-v2.dtsi        |  112 +
 arch/arm/boot/dts/imx7-colibri-iris.dtsi           |  108 +
 arch/arm/boot/dts/imx7-colibri.dtsi                |  830 +++++---
 arch/arm/boot/dts/imx7d-colibri-aster.dts          |   30 +-
 arch/arm/boot/dts/imx7d-colibri-emmc-aster.dts     |   10 +-
 arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dts   |   10 +-
 arch/arm/boot/dts/imx7d-colibri-emmc-iris-v2.dts   |   21 +
 arch/arm/boot/dts/imx7d-colibri-emmc-iris.dts      |   21 +
 arch/arm/boot/dts/imx7d-colibri-emmc.dtsi          |   17 +-
 arch/arm/boot/dts/imx7d-colibri-eval-v3.dts        |   45 +-
 arch/arm/boot/dts/imx7d-colibri-iris-v2.dts        |   83 +
 arch/arm/boot/dts/imx7d-colibri-iris.dts           |   56 +
 arch/arm/boot/dts/imx7d-colibri.dtsi               |   13 +-
 arch/arm/boot/dts/imx7d-sdb.dts                    |    2 +-
 arch/arm/boot/dts/imx7d-smegw01.dts                |    4 +-
 arch/arm/boot/dts/imx7d.dtsi                       |    2 +-
 arch/arm/boot/dts/imx7s-colibri-aster.dts          |   27 +-
 arch/arm/boot/dts/imx7s-colibri-eval-v3.dts        |   43 +-
 arch/arm/boot/dts/imx7s-colibri-iris-v2.dts        |   78 +
 arch/arm/boot/dts/imx7s-colibri-iris.dts           |   51 +
 arch/arm/boot/dts/imx7s-colibri.dtsi               |    5 +-
 arch/arm/boot/dts/imx7s.dtsi                       |    2 +-
 arch/arm/boot/dts/imxrt1050.dtsi                   |    4 +-
 arch/arm/boot/dts/keystone-k2e-netcp.dtsi          |   26 +-
 arch/arm/boot/dts/keystone-k2e.dtsi                |    6 +-
 arch/arm/boot/dts/keystone-k2g-netcp.dtsi          |    2 +-
 arch/arm/boot/dts/keystone-k2g.dtsi                |   18 +-
 arch/arm/boot/dts/keystone-k2hk-netcp.dtsi         |   12 +-
 arch/arm/boot/dts/keystone-k2hk.dtsi               |    4 +-
 arch/arm/boot/dts/keystone-k2l-netcp.dtsi          |   18 +-
 arch/arm/boot/dts/keystone-k2l.dtsi                |    8 +-
 arch/arm/boot/dts/keystone.dtsi                    |   18 +-
 .../boot/dts/lan966x-kontron-kswitch-d10-mmt.dtsi  |   13 +
 arch/arm/boot/dts/lan966x-pcb8291.dts              |   61 +-
 arch/arm/boot/dts/lan966x-pcb8309.dts              |  184 ++
 arch/arm/boot/dts/lan966x.dtsi                     |   28 +-
 arch/arm/boot/dts/lpc18xx.dtsi                     |    6 +-
 arch/arm/boot/dts/ls1021a-iot.dts                  |    2 +-
 arch/arm/boot/dts/ls1021a.dtsi                     |    7 +
 arch/arm/boot/dts/meson.dtsi                       |    4 +-
 arch/arm/boot/dts/meson8.dtsi                      |    2 +-
 arch/arm/boot/dts/meson8b.dtsi                     |    2 +-
 arch/arm/boot/dts/mt2701.dtsi                      |    8 +-
 arch/arm/boot/dts/mt7623.dtsi                      |    6 +-
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts             |    4 +-
 arch/arm/boot/dts/mt7623a-rfb-nand.dts             |    4 +-
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts      |    4 +-
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts             |    4 +-
 arch/arm/boot/dts/mt7629-rfb.dts                   |    4 +-
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi      |    2 +-
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             |    2 +-
 arch/arm/boot/dts/omap2420-h4.dts                  |    2 +-
 arch/arm/boot/dts/omap3-evm-37xx.dts               |    2 +-
 arch/arm/boot/dts/omap3-evm.dts                    |    2 +-
 arch/arm/boot/dts/omap3-gta04.dtsi                 |    2 +-
 arch/arm/boot/dts/omap3-igep.dtsi                  |    2 +-
 arch/arm/boot/dts/omap3-ldp.dts                    |    6 +-
 arch/arm/boot/dts/omap3-lilly-a83x.dtsi            |    2 +-
 arch/arm/boot/dts/omap3-n900.dts                   |    4 +-
 arch/arm/boot/dts/omap3-n950-n9.dtsi               |    4 +-
 arch/arm/boot/dts/omap3-overo-base.dtsi            |    2 +-
 arch/arm/boot/dts/omap3-pandora-common.dtsi        |    2 +-
 arch/arm/boot/dts/omap3430-sdp.dts                 |    6 +-
 arch/arm/boot/dts/omap5-l4.dtsi                    |    2 +-
 arch/arm/boot/dts/pxa300-raumfeld-common.dtsi      |   10 +-
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |   25 +-
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts |   24 +-
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts        |   14 +-
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |   25 +-
 .../dts/qcom-apq8064-sony-xperia-lagan-yuga.dts    |   10 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                |  189 +-
 arch/arm/boot/dts/qcom-apq8084.dtsi                |   10 +-
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dts   |    6 +
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dts       |    7 +
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi      |    2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi      |    2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts    |    2 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |    4 +-
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts           |    6 -
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts          |   15 +-
 arch/arm/boot/dts/qcom-ipq8064-smb208.dtsi         |   37 +
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi           |    9 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |  198 +-
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi         |    2 +-
 arch/arm/boot/dts/qcom-mdm9615.dtsi                |    7 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi                |    6 +-
 arch/arm/boot/dts/qcom-msm8660.dtsi                |  116 +-
 arch/arm/boot/dts/qcom-msm8960.dtsi                |   54 +-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |   42 +-
 .../boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi   |   40 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |   53 +-
 .../arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts |   46 +-
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts |   22 +-
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts |   48 +-
 arch/arm/boot/dts/qcom-pm8841.dtsi                 |    1 +
 arch/arm/boot/dts/qcom-pm8941.dtsi                 |   12 +-
 arch/arm/boot/dts/qcom-pmx55.dtsi                  |    1 +
 arch/arm/boot/dts/qcom-pmx65.dtsi                  |    3 +-
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |    8 +-
 arch/arm/boot/dts/qcom-sdx65-mtp.dts               |   61 +-
 arch/arm/boot/dts/qcom-sdx65.dtsi                  |  273 ++-
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             |    4 +-
 arch/arm/boot/dts/r8a7790-lager.dts                |    2 +-
 arch/arm/boot/dts/r8a7790-stout.dts                |    2 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |    2 +-
 arch/arm/boot/dts/r8a7791-porter.dts               |    2 +-
 arch/arm/boot/dts/r8a7792-blanche.dts              |    2 +-
 arch/arm/boot/dts/r8a7793-gose.dts                 |    2 +-
 arch/arm/boot/dts/r8a7794-alt.dts                  |    2 +-
 arch/arm/boot/dts/r8a7794-silk.dts                 |    2 +-
 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi     |   39 -
 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts        |  119 ++
 arch/arm/boot/dts/r9a06g032.dtsi                   |  108 +
 arch/arm/boot/dts/rk3066a-bqcurie2.dts             |    4 +-
 arch/arm/boot/dts/rk3066a-mk808.dts                |   18 +
 arch/arm/boot/dts/rk3066a-rayeager.dts             |    2 +-
 arch/arm/boot/dts/rk3188-bqedison2qc.dts           |    4 +-
 arch/arm/boot/dts/rk3188-px3-evb.dts               |    2 +-
 arch/arm/boot/dts/rk3188-radxarock.dts             |    2 +-
 arch/arm/boot/dts/rk3229-evb.dts                   |    2 +-
 arch/arm/boot/dts/rk3288-evb.dtsi                  |    2 +-
 arch/arm/boot/dts/rk3288-firefly-reload.dts        |    2 +-
 arch/arm/boot/dts/rk3288-firefly.dtsi              |    2 +-
 arch/arm/boot/dts/rk3288-phycore-rdk.dts           |    4 +-
 arch/arm/boot/dts/rk3288-popmetal.dts              |    2 +-
 arch/arm/boot/dts/rk3288-r89.dts                   |    2 +-
 arch/arm/boot/dts/rk3288-rock2-square.dts          |    2 +-
 arch/arm/boot/dts/rk3288-tinker.dtsi               |    4 +-
 .../boot/dts/rk3288-veyron-broadcom-bluetooth.dtsi |   10 +-
 arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi    |    2 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts         |    4 +-
 arch/arm/boot/dts/rk3288-veyron-pinky.dts          |    2 +-
 arch/arm/boot/dts/rk3288-veyron.dtsi               |    2 +-
 arch/arm/boot/dts/rv1108-elgin-r1.dts              |   14 +-
 arch/arm/boot/dts/rv1108-evb.dts                   |   14 +-
 arch/arm/boot/dts/rv1108.dtsi                      |    2 +-
 arch/arm/boot/dts/s3c2410-pinctrl.h                |   19 +
 arch/arm/boot/dts/s3c2416-pinctrl.dtsi             |   38 +-
 arch/arm/boot/dts/s3c2416.dtsi                     |    4 +-
 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi             |  178 +-
 arch/arm/boot/dts/s3c64xx-pinctrl.h                |   27 +
 arch/arm/boot/dts/s3c64xx.dtsi                     |    6 +-
 arch/arm/boot/dts/s5pv210-aquila.dts               |    4 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi               |  134 +-
 arch/arm/boot/dts/s5pv210-fascinate4g.dts          |   28 +-
 arch/arm/boot/dts/s5pv210-galaxys.dts              |   42 +-
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi             |  480 ++---
 arch/arm/boot/dts/s5pv210-pinctrl.h                |   39 +
 arch/arm/boot/dts/s5pv210.dtsi                     |    8 +-
 arch/arm/boot/dts/sam9x60.dtsi                     |    4 +-
 arch/arm/boot/dts/sama5d2.dtsi                     |   24 +-
 arch/arm/boot/dts/sama5d3.dtsi                     |    2 +-
 arch/arm/boot/dts/sama5d4.dtsi                     |    2 +-
 arch/arm/boot/dts/sama7g5.dtsi                     |    7 +
 arch/arm/boot/dts/sd5203.dts                       |    2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi             |   10 +
 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts  |   90 +
 ...ry_aa1.dts =3D> socfpga_arria10_mercury_aa1.dtsi} |   48 +-
 arch/arm/boot/dts/spear1310-evb.dts                |    2 +-
 arch/arm/boot/dts/spear1340-evb.dts                |    2 +-
 arch/arm/boot/dts/spear1340.dtsi                   |    2 +-
 arch/arm/boot/dts/spear300-evb.dts                 |    2 +-
 arch/arm/boot/dts/spear310-evb.dts                 |    2 +-
 arch/arm/boot/dts/spear320-evb.dts                 |    2 +-
 arch/arm/boot/dts/spear320-hmi.dts                 |    2 +-
 arch/arm/boot/dts/spear320.dtsi                    |    2 +-
 arch/arm/boot/dts/ste-ab8500.dtsi                  |    6 +-
 arch/arm/boot/dts/ste-dbx5x0.dtsi                  |    5 -
 arch/arm/boot/dts/ste-hrefv60plus.dtsi             |    4 +-
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts     |    4 +-
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     |    4 +-
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     |    4 +-
 arch/arm/boot/dts/stih407-family.dtsi              |  176 +-
 arch/arm/boot/dts/stih407.dtsi                     |    4 +-
 arch/arm/boot/dts/stih410.dtsi                     |    4 +-
 arch/arm/boot/dts/stihxxx-b2120.dtsi               |    8 +-
 arch/arm/boot/dts/stm32429i-eval.dts               |    8 +-
 arch/arm/boot/dts/stm32h743.dtsi                   |    4 +-
 arch/arm/boot/dts/stm32h743i-disco.dts             |    8 +-
 arch/arm/boot/dts/stm32h743i-eval.dts              |    8 +-
 arch/arm/boot/dts/stm32h750i-art-pi.dts            |    8 +-
 arch/arm/boot/dts/stm32mp131.dtsi                  |  140 +-
 arch/arm/boot/dts/stm32mp133.dtsi                  |    4 +-
 arch/arm/boot/dts/stm32mp135f-dk.dts               |   11 +
 arch/arm/boot/dts/stm32mp13xc.dtsi                 |    3 +-
 arch/arm/boot/dts/stm32mp13xf.dtsi                 |    3 +-
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |  177 +-
 arch/arm/boot/dts/stm32mp15-scmi.dtsi              |   58 +
 arch/arm/boot/dts/stm32mp151.dtsi                  |   13 +-
 .../arm/boot/dts/stm32mp153c-dhcor-drc-compact.dts |   30 +
 arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts         |    4 +
 arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts         |    1 +
 arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts         |    4 +
 arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts         |    1 +
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |   55 +
 .../boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi    |  322 +++
 arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi     |    5 +
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi       |    4 +-
 arch/arm/boot/dts/stm32mp15xx-osd32.dtsi           |    9 +-
 arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts       |   40 +-
 arch/arm/boot/dts/sun4i-a10-pcduino.dts            |    6 +-
 arch/arm/boot/dts/sun5i-a13-licheepi-one.dts       |    6 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                   |   12 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts           |    6 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |    8 +-
 .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    |    8 +-
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts          |    6 +-
 arch/arm/boot/dts/sun8i-h3-mapleboard-mp130.dts    |    6 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-duo2.dts         |    8 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts      |    2 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts           |    4 +-
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi             |    4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts          |    6 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts       |    4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts        |    4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts         |    4 +-
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts       |    4 +-
 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |    5 +
 arch/arm/boot/dts/sun8i-r40-cpu-opp.dtsi           |   52 +
 arch/arm/boot/dts/sun8i-r40-feta40i.dtsi           |    5 +
 arch/arm/boot/dts/sun8i-r40.dtsi                   |   44 +-
 arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dts           |    5 +
 arch/arm/boot/dts/sun8i-v3s.dtsi                   |    6 +-
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts  |    5 +
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi      |    8 +-
 arch/arm/boot/dts/sunxi-h3-h5-emlid-neutis.dtsi    |    4 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 |   13 +-
 arch/arm/boot/dts/sunxi-libretech-all-h3-cc.dtsi   |    4 +-
 arch/arm/boot/dts/tegra114-asus-tf701t.dts         |    8 +-
 arch/arm/boot/dts/tegra114-dalmore.dts             |    8 +-
 arch/arm/boot/dts/tegra114-roth.dts                |    6 +-
 arch/arm/boot/dts/tegra114-tn7.dts                 |    6 +-
 arch/arm/boot/dts/tegra124-apalis-eval.dts         |    2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts    |    2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |    2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |    4 +-
 arch/arm/boot/dts/tegra124-venice2.dts             |    2 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |   10 +-
 arch/arm/boot/dts/tegra20-asus-tf101.dts           |   10 +-
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts      |    2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts         |    2 +-
 arch/arm/boot/dts/tegra20-harmony.dts              |    2 +-
 arch/arm/boot/dts/tegra20-paz00.dts                |    2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts             |    4 +-
 arch/arm/boot/dts/tegra20-trimslice.dts            |    2 +-
 arch/arm/boot/dts/tegra20-ventana.dts              |    2 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts          |    2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts     |    2 +-
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |   14 +-
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi |    2 +-
 .../boot/dts/tegra30-asus-transformer-common.dtsi  |   10 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |    6 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts      |    2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi             |    6 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 |    2 +-
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts     |   10 +-
 arch/arm/boot/dts/zynq-zc702.dts                   |    4 +-
 arch/arm/boot/dts/zynq-zturn-common.dtsi           |    2 +-
 arch/arm64/Kconfig.platforms                       |   15 +-
 arch/arm64/boot/dts/allwinner/Makefile             |    2 +
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |    6 +
 .../dts/allwinner/sun50i-a64-amarula-relic.dts     |    2 +-
 .../boot/dts/allwinner/sun50i-a64-bananapi-m64.dts |    4 +-
 .../boot/dts/allwinner/sun50i-a64-nanopi-a64.dts   |    2 +-
 .../boot/dts/allwinner/sun50i-a64-orangepi-win.dts |    6 +-
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     |    4 +-
 .../dts/allwinner/sun50i-a64-pinephone-1.0.dts     |    4 +
 .../dts/allwinner/sun50i-a64-pinephone-1.1.dts     |    4 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |   10 +-
 .../boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts |    4 +-
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |    4 +-
 .../dts/allwinner/sun50i-h5-orangepi-prime.dts     |    4 +-
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    |    4 +-
 .../dts/allwinner/sun50i-h6-orangepi-lite2.dts     |    4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi |    2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |   12 +-
 .../dts/allwinner/sun50i-h616-orangepi-zero2.dts   |  213 ++
 .../boot/dts/allwinner/sun50i-h616-x96-mate.dts    |  177 ++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  591 ++++++
 arch/arm64/boot/dts/altera/Makefile                |    3 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   58 +-
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |   10 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |   10 +-
 .../boot/dts/altera/socfpga_stratix10_swvp.dts     |  117 ++
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts   |    4 +-
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts   |    4 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |    2 +-
 .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |   27 +-
 .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |    2 -
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |    2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |    2 -
 .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |    4 +-
 .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |    4 +-
 .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |    4 +-
 .../boot/dts/amlogic/meson-gxl-s905d-p230.dts      |    4 +-
 .../dts/amlogic/meson-gxl-s905d-vero4k-plus.dts    |    4 +-
 .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts |    2 +-
 .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |    4 +-
 .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |    4 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts     |    4 +-
 .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |    2 -
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |    6 +
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   10 +-
 arch/arm64/boot/dts/apm/apm-merlin.dts             |    2 +-
 arch/arm64/boot/dts/apm/apm-mustang.dts            |    2 +-
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |    6 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   10 +-
 arch/arm64/boot/dts/arm/fvp-base-revc.dts          |    2 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi             |   44 +-
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi          |   16 +-
 arch/arm64/boot/dts/arm/juno-r1.dts                |    2 +
 arch/arm64/boot/dts/arm/juno-r2.dts                |    2 +
 arch/arm64/boot/dts/arm/juno-scmi.dtsi             |    1 -
 arch/arm64/boot/dts/arm/juno.dts                   |    2 +
 arch/arm64/boot/dts/broadcom/Makefile              |    1 +
 .../bcm4908/bcm4906-tplink-archer-c2300-v1.dts     |    8 +-
 .../broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts    |    8 +-
 arch/arm64/boot/dts/broadcom/bcmbca/Makefile       |    9 +
 .../dts/broadcom/bcmbca/bcm4912-asus-gt-ax6000.dts |   19 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4912.dtsi   |  128 ++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63146.dtsi  |  110 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi  |  128 ++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6813.dtsi   |  128 ++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi   |  103 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi   |  121 ++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm94912.dts   |   30 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm963146.dts  |   30 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dts  |   30 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm96813.dts   |   30 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dts   |   30 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dts   |   30 +
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |    2 +-
 arch/arm64/boot/dts/exynos/exynos-pinctrl.h        |   79 +
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |    2 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |    6 +-
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |    6 +-
 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi    |   72 +-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |   20 +
 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi |    2 +-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         |   32 +
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |    2 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi      |    8 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   20 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       | 1170 ++++++++++-
 arch/arm64/boot/dts/freescale/Makefile             |    4 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts  |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |   18 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   16 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |   20 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |   20 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |   10 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   16 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |   18 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts  |    4 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   16 +-
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  |    4 +-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |   10 +-
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |    4 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   43 +
 .../boot/dts/freescale/imx8mm-icore-mx8mm.dtsi     |   12 +-
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts  |    4 +-
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |  450 ++++
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |  440 ++++
 .../boot/dts/freescale/imx8mm-var-som-symphony.dts |    6 +-
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   |   24 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |    8 +-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   10 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |    6 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |   10 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   16 +-
 .../dts/freescale/imx8mn-beacon-baseboard.dtsi     |    4 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |   45 +-
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts |    6 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |    8 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   13 +-
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts |  163 ++
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi | 1030 ++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   38 +-
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |  702 +++++++
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi |  284 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |   10 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   31 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   43 +
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    6 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    4 +-
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts  |    6 +-
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   15 +-
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |    4 +-
 .../dts/freescale/imx8qxp-colibri-eval-v3.dtsi     |    8 +-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   14 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   14 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |  114 ++
 arch/arm64/boot/dts/freescale/imx93-pinfunc.h      |  623 ++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi           |  334 +++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |    8 +-
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts  |   14 +-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |    8 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi          |    2 +-
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |   12 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts        |    6 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi           |    6 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi           |    6 +-
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |   14 +-
 arch/arm64/boot/dts/lg/lg1312.dtsi                 |   38 +-
 arch/arm64/boot/dts/lg/lg1313.dtsi                 |   38 +-
 arch/arm64/boot/dts/marvell/Makefile               |    1 +
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      |  291 +++
 arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts    |  101 +
 arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi      |   17 +
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |    4 +-
 .../boot/dts/marvell/armada-7040-mochabin.dts      |    4 +-
 .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |    4 +-
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |    2 +-
 .../boot/dts/marvell/armada-8040-puzzle-m801.dts   |    4 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi         |    2 +-
 arch/arm64/boot/dts/mediatek/Makefile              |    5 +
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts        |    2 +-
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |    2 +
 arch/arm64/boot/dts/mediatek/mt6795.dtsi           |  260 ++-
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |   21 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |   13 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           |   10 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |    4 +-
 .../boot/dts/mediatek/mt8173-elm-hana-rev7.dts     |    6 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |   24 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |   12 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   16 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |   38 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |    4 +-
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dtsi     |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   13 +-
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  315 ++-
 .../boot/dts/mediatek/mt8192-asurada-hayato-r1.dts |   47 +
 .../dts/mediatek/mt8192-asurada-spherion-r0.dts    |   62 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |  959 +++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |   29 +-
 .../boot/dts/mediatek/mt8195-cherry-tomato-r1.dts  |   15 +
 .../boot/dts/mediatek/mt8195-cherry-tomato-r2.dts  |   35 +
 .../boot/dts/mediatek/mt8195-cherry-tomato-r3.dts  |   36 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |  702 +++++++
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts        |    8 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   76 +-
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |    4 +-
 .../boot/dts/microchip/sparx5_pcb134_board.dtsi    |  200 +-
 .../boot/dts/microchip/sparx5_pcb135_board.dtsi    |   48 +-
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |    4 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |   49 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |    6 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   37 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |    2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   47 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |   47 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  113 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   84 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |    6 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |    2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   88 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   10 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   42 +-
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |   49 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  177 ++
 arch/arm64/boot/dts/qcom/Makefile                  |   29 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |   36 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |   91 +-
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |    6 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   41 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |    3 -
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         |    5 -
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   54 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |    2 +-
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |    4 +-
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |    2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |    2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |    2 +-
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |   16 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |    8 -
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |    8 -
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |    4 +-
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |    6 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |    2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   28 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi  |    2 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |    8 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |   29 +-
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |   12 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |   25 +-
 .../qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts |   11 -
 .../msm8996-pmi8996-sony-xperia-tone-kagura.dts    |   11 -
 .../msm8996-pmi8996-sony-xperia-tone-keyaki.dts    |   11 -
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |   77 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |   14 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    4 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dts |  414 ++++
 .../arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  297 ++-
 .../boot/dts/qcom/msm8998-asus-novago-tp370ql.dts  |   23 +-
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |  138 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |  460 ++++-
 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts    |    9 +-
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |    9 +-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts           |  443 +++-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |  421 ----
 .../boot/dts/qcom/msm8998-oneplus-cheeseburger.dts |    2 +-
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |   88 +-
 .../dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts |    4 +
 .../dts/qcom/msm8998-sony-xperia-yoshino-maple.dts |    2 +-
 .../qcom/msm8998-sony-xperia-yoshino-poplar.dts    |   10 +-
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  120 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   87 +-
 arch/arm64/boot/dts/qcom/pm6350.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi                |    2 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/pm8005.dtsi               |    4 +
 arch/arm64/boot/dts/qcom/pm8009.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |   13 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |   14 +-
 arch/arm64/boot/dts/qcom/pm8350.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/pm8350b.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |   17 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |   10 +
 arch/arm64/boot/dts/qcom/pmi8994.dtsi              |   22 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |   13 +-
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi          |    2 +-
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi          |    2 +-
 arch/arm64/boot/dts/qcom/pmr735b.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi               |   17 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |    4 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   39 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   54 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  389 ++++
 arch/arm64/boot/dts/qcom/sa8540p.dtsi              |  133 ++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |    5 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |    4 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    8 +-
 .../boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts |   44 +
 .../boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts |   17 +
 .../boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi   |  225 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    3 +-
 .../dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts   |   22 +
 .../dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts   |   22 +
 .../boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |   53 +
 .../dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts   |   22 +
 .../dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts   |   24 +
 .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi      |  350 ++++
 .../dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts |   22 +
 .../dts/qcom/sc7180-trogdor-pazquel-lte-ti.dts     |   22 +
 .../dts/qcom/sc7180-trogdor-pazquel-parade.dts     |   17 +
 .../boot/dts/qcom/sc7180-trogdor-pazquel-ti.dts    |   17 +
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi      |  222 ++
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    2 +
 .../qcom/sc7180-trogdor-quackingstick-r0-lte.dts   |   38 +
 .../dts/qcom/sc7180-trogdor-quackingstick-r0.dts   |   26 +
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |  324 +++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |    2 +
 .../qcom/sc7180-trogdor-wormdingler-rev0-boe.dts   |   22 +
 .../qcom/sc7180-trogdor-wormdingler-rev0-inx.dts   |   22 +
 .../dts/qcom/sc7180-trogdor-wormdingler-rev0.dtsi  |   53 +
 ...sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts |   29 +
 .../qcom/sc7180-trogdor-wormdingler-rev1-boe.dts   |   28 +
 ...sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts |   29 +
 .../qcom/sc7180-trogdor-wormdingler-rev1-inx.dts   |   22 +
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  412 ++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    8 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   84 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   16 +
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   |   84 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts  |   12 +
 .../dts/qcom/sc7280-herobrine-herobrine-r1.dts     |   11 +
 .../boot/dts/qcom/sc7280-herobrine-villager-r0.dts |   29 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |   20 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   91 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |   14 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  275 ++-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  427 ++++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  386 ++++
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |  109 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 2147 ++++++++++++++++=
++++
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |  461 +++++
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |   61 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  332 +--
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |    2 +-
 .../dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts |    2 +-
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |   28 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |    5 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |  136 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   68 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |  614 ++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts      |   68 +
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts       |   44 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    8 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   35 +-
 .../dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts  |    5 +-
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    2 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |    8 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |  762 +++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  335 ++-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   10 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |    4 +-
 arch/arm64/boot/dts/qcom/sdm850.dtsi               |    1 -
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |   40 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   40 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   34 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    4 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    4 +-
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    4 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   36 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |    4 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  132 +-
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |    2 -
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |    2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  168 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    2 -
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |    2 -
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   90 +-
 arch/arm64/boot/dts/renesas/Makefile               |    3 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |    6 +-
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |    4 +-
 .../dts/renesas/draak-ebisu-panel-aa104xd12.dts    |   36 +
 arch/arm64/boot/dts/renesas/draak.dtsi             |    2 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |    8 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |    4 +-
 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi   |   30 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |    6 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |    6 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   31 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |   13 +
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts    |    1 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  434 +++-
 arch/arm64/boot/dts/renesas/r8a779m8.dtsi          |    5 +
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |   21 +-
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts |    6 -
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts  |    2 +-
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  |   14 +
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |   51 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |    4 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |    4 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |    2 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |   23 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi      |    6 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |    8 +-
 .../boot/dts/renesas/salvator-panel-aa104xd12.dts  |   36 +
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |   14 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |    6 +-
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |    2 +-
 arch/arm64/boot/dts/rockchip/rk3308-evb.dts        |    2 +-
 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts  |  253 +++
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |   32 +-
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       |    2 +-
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts    |    2 +-
 .../boot/dts/rockchip/rk3368-orion-r68-meta.dts    |    4 +-
 arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts        |    2 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |    6 +-
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |    2 +-
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  |    2 +-
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |    2 +-
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi      |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dts |    4 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |    2 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    4 +-
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |   72 +-
 .../dts/rockchip/rk3399-sapphire-excavator.dts     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi  |    2 +-
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |  114 ++
 arch/arm64/boot/dts/rockchip/rk3566.dtsi           |    4 +
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts |   89 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |   55 +
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |   55 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |    4 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  166 ++
 arch/arm64/boot/dts/sprd/sc9836.dtsi               |   10 +-
 arch/arm64/boot/dts/sprd/sc9863a.dtsi              |    4 +-
 arch/arm64/boot/dts/sprd/whale2.dtsi               |    2 +-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |    4 +
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi         |  106 +-
 arch/arm64/boot/dts/tesla/fsd-pinctrl.h            |   33 +
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |  120 ++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |   17 +-
 arch/arm64/boot/dts/ti/k3-am625-sk.dts             |   11 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |    4 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            |    2 +-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             |   16 +-
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi |    4 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |   14 +-
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi         |    4 +-
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |    8 +-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |    4 +-
 .../boot/dts/ti/k3-j721e-common-proc-board.dts     |    4 +-
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    |    4 +-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |    4 +-
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi   |    4 +-
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi     |    4 +
 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts  |    4 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts  |    2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts  |    2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts  |    2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts  |    2 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   26 +
 include/dt-bindings/clock/exynos7885.h             |   54 +-
 include/dt-bindings/clock/qcom,dispcc-sm8350.h     |    1 +
 include/dt-bindings/clock/qcom,gcc-ipq8074.h       |    3 +
 include/dt-bindings/clock/qcom,gpucc-sm8350.h      |   52 +
 include/dt-bindings/clock/qcom,sm8450-camcc.h      |  159 ++
 include/dt-bindings/clock/tegra234-clock.h         |  105 +
 include/dt-bindings/mailbox/qcom-ipcc.h            |    1 +
 include/dt-bindings/memory/tegra234-mc.h           |   26 +
 include/dt-bindings/net/pcs-rzn1-miic.h            |   33 +
 include/dt-bindings/power/tegra234-powergate.h     |    2 +
 include/dt-bindings/reset/tegra234-reset.h         |   10 +
 include/dt-bindings/soc/samsung,boot-mode.h        |   18 +
 1020 files changed, 35927 insertions(+), 6596 deletions(-)
 create mode 100644 Documentation/arm/google/chromebook-boot-flow.rst
 create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed.yam=
l
 delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,scu=
.txt
 create mode 100644
Documentation/devicetree/bindings/arm/marvell/marvell,ac5.yaml
 create mode 100644
Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
 create mode 100644
Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml
 create mode 100644
Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml
 create mode 100644
Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,scu-clk.yam=
l
 create mode 100644
Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
 create mode 100644
Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/firmware/fsl,scu.yaml
 rename Documentation/devicetree/bindings/{arm =3D> hwinfo}/renesas,prr.yam=
l (85%)
 create mode 100644 Documentation/devicetree/bindings/input/fsl,scu-key.yam=
l
 create mode 100644
Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
 create mode 100644 Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.y=
aml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,scu-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/power/fsl,scu-pd.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/fsl,scu-rtc.yaml
 delete mode 100644
Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.txt
 create mode 100644
Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
 create mode 100644
Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
 create mode 100644
Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.=
yaml
 delete mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
 create mode 100644 arch/arm/boot/dts/bcm53015-meraki-mr26.dts
 create mode 100644 arch/arm/boot/dts/bcm63148.dtsi
 create mode 100644 arch/arm/boot/dts/bcm63178.dtsi
 create mode 100644 arch/arm/boot/dts/bcm6756.dtsi
 create mode 100644 arch/arm/boot/dts/bcm6846.dtsi
 create mode 100644 arch/arm/boot/dts/bcm6855.dtsi
 create mode 100644 arch/arm/boot/dts/bcm6878.dtsi
 create mode 100644 arch/arm/boot/dts/bcm963138.dts
 create mode 100644 arch/arm/boot/dts/bcm963148.dts
 create mode 100644 arch/arm/boot/dts/bcm963178.dts
 create mode 100644 arch/arm/boot/dts/bcm96756.dts
 create mode 100644 arch/arm/boot/dts/bcm96846.dts
 create mode 100644 arch/arm/boot/dts/bcm96855.dts
 create mode 100644 arch/arm/boot/dts/bcm96878.dts
 create mode 100644 arch/arm/boot/dts/exynos-pinctrl.h
 create mode 100644 arch/arm/boot/dts/imx6q-apalis-ixora-v1.2.dts
 create mode 100644 arch/arm/boot/dts/imx7-colibri-iris-v2.dtsi
 create mode 100644 arch/arm/boot/dts/imx7-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/imx7d-colibri-emmc-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/imx7d-colibri-emmc-iris.dts
 create mode 100644 arch/arm/boot/dts/imx7d-colibri-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/imx7d-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/imx7s-colibri-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/imx7s-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/lan966x-pcb8309.dts
 create mode 100644 arch/arm/boot/dts/qcom-ipq8064-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
 create mode 100644 arch/arm/boot/dts/s3c2410-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s3c64xx-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s5pv210-pinctrl.h
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
 rename arch/arm/boot/dts/{socfpga_arria10_mercury_aa1.dts =3D>
socfpga_arria10_mercury_aa1.dtsi} (70%)
 create mode 100644 arch/arm/boot/dts/stm32mp153c-dhcor-drc-compact.dts
 create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-r40-cpu-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero=
2.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/Makefile
 create mode 100644
arch/arm64/boot/dts/broadcom/bcmbca/bcm4912-asus-gt-ax6000.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm4912.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm63146.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm6813.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm94912.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm963146.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm96813.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk=
.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl=
.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
 create mode 100755 arch/arm64/boot/dts/freescale/imx93-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx93.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts
 create mode 100644 arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.d=
ts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dt=
s
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dt=
s
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dt=
s
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
 delete mode 100644
arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
 delete mode 100644
arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dts
 delete mode 100644
arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8295p-adp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8540p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.d=
ts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.d=
ts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-au=
o.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-bo=
e.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dt=
si
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-au=
o.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-bo=
e.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.=
dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.=
dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r=
0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.d=
tsi
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dts
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dts
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0.dtsi
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dts
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dts=
i
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385=
.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.=
dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
 create mode 100644 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12=
.dts
 create mode 100644 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dt=
s
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts
 create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.h
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8350.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h
 create mode 100644 include/dt-bindings/net/pcs-rzn1-miic.h
 create mode 100644 include/dt-bindings/soc/samsung,boot-mode.h
