Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AAEC433E0
	for <soc@archiver.kernel.org>; Sun, 14 Feb 2021 22:45:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3ADD264E27; Sun, 14 Feb 2021 22:45:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6B2064DF4
	for <soc@kernel.org>; Sun, 14 Feb 2021 22:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613342736;
	bh=yLfFVYhauTM6ABvyZKMcf6lWpYop+jj8Pj8U8prTui4=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=Th8BaX5ZzxQrEeveX+cglYC8bMcW4AHHCQ+OgDIDdEmGyQ/mtYdtc3EYnNUP7PkFb
	 s4yKYoL7b1zbw9LdKBlJ4lHS/hRIkLfuYfE0ekp3XGyBNI+deMRoZaT3QsODPEvz7L
	 BsVSyvsYLgOrUVrSaJkzzf04uNv7yhBRB62DymzZ98FhIR8DqVtA5U2EKP8ULxKdf0
	 9JHr1yEwOY34BnIaTWvi4faUWUOCu4bM9bVOP/PwnMvzQp3LrAYyyx7n4SRbX3WFql
	 n+Axwnz6rOXldjveaJq2I8LZ/c6CaySsdPafaudfVLNuvJOOtxNwQ6sSG7zA7U4P9/
	 xn4Xuuqr2aFtw==
Received: by mail-oi1-f181.google.com with SMTP id q186so2054229oig.12
        for <soc@kernel.org>; Sun, 14 Feb 2021 14:45:35 -0800 (PST)
X-Gm-Message-State: AOAM531T2+eKmT4dOYO3QQcmhleN3K/KvqUZTDpdpVbsU8sk7Ubhhuu6
	S8Watg2lwm3n0xpUHrf+jzSEs4vEuRxtFcjiAw8=
X-Google-Smtp-Source: ABdhPJw7VTPjUSj5jTzj6Wsi49UQ2X8nCYHDq/o3/eUOQose2T/uvb1fUNU6Qg5Hm7ghuyb0QJC+FKi+Fn3XJe5YV78=
X-Received: by 2002:aca:d908:: with SMTP id q8mr6408973oig.67.1613342734694;
 Sun, 14 Feb 2021 14:45:34 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
In-Reply-To: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 14 Feb 2021 23:45:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
Message-ID: <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
Subject: [GIT PULL 5/6] ARM SoC devicetree updates for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit daf12bee07b9e2f38216f58aca7ac4e4e66a7146=
:

  arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain on
Odroid-C4 (2021-01-27 10:08:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-v5.=
12

for you to fetch changes up to 14bd96946377148cb6e7dd7ce55ecc5128a92d7b:

  ARM: dts: aspeed: align GPIO hog names with dtschema (2021-02-14
23:30:15 +0100)

----------------------------------------------------------------
ARM: SoC devicetree updates for v5.12

After the last release contained a surprising amount of new 32-bit
machines, this time two thirds of the code changes are for 64-bit.

The usual updates to existing files include:

 - Device tree compiler warning fixes for Berlin, Renesas, SoCFPGA,
   nomadik, stm32, Allwinner, TI Keystone

 - Support for additional devices on existing machines on Renesas, SoCFPGA,
   at91, hisilicon, OMAP, Tegra, TI K3, Allwinner, Broadcom, ux500,
   Mediatek, Marvell Armada, Marvell MMP, ZynqMP, AMLogic, Qualcomm,
   i.MX, Layerscape, Actions, ASpeed, Toshiba

 - Cleanups and minor fixes for Renesas, at91, mstar, ux500, Samsung,
   stm32, Tegra, Broadcom, Mediatek, Marvell MMP, AMLogic, Qualcomm,
   i.MX, Rockchip, ASpeed, Zynq

Only three new SoCs this time, but a number of boards across:

Renesas:
 - Two Beacon EmbeddedWorks boards (RZ/G2H and RZ/G2N based)

Intel SoCFPGA:
 - eASIC N5X board (N5X)

ST-Ericsson Ux500:
 - Samsung GT-I9070 (Janice) phone (u8500)

TI OMAP:
 - MYIR Tech Limited development board (AM335X)

Allwinner/sunxi:
 - SL631 Action Camera (V3)
 - PineTab Early Adopter tablet (A64)

Broadcom:
 - BCM4906/BCM4908 networking chip
 - Netgear R8000P router (BCM5906)

AMLogic:
 - Hardkernel ODROID-HC4 development board (SM1)
 - Beelink GS-King-X TV Box (S922X)

Qualcomm:
 - Snapdragon 888 / SM8350 high-end phone SoC
 - Qualcomm SDX55 5G modem as standalone SoC
 - Snapdragon MTP reference board (SM8350)
 - Snapdragon MTP reference board (SDX55)
 - Sony Kitakami phones: Xperia Z3+/Z4/Z5 (APQ8094)
 - Alcatel Idol 3 phone (MSM8916)
 - ASUS Zenfone 2 Laser phone (MSM8916)
 - BQ Aquaris X5 aka Longcheer L8910 phone (MSM8916)
 - OnePlus6 phone (SDM845)
 - OnePlus6T phone (SDM845)
 - Alfa Network AP120C-AC access point (IPQ4018)

NXP i.MX6 (32-bit):
 - Plymovent BAS base system controller for filter systems (imx6dl)
 - Protonic MVT industrial touchscreen terminals (imx6dl)
 - Protonic PRTI6G reference board (imx6ul)
 - Kverneland UT1, UT1Q, UT1P, TGO agricultural terminals (imx6q/dl/qp)

NXP i.MX8 (64-bit)
 - Beacon i.MX8M Nano development kit (imx8mn)
 - Boundary Devices i.MX8MM Nitrogen SBC (imx8mm)
 - Gateworks Venice i.MX 8M Mini Development Kits (imx8mm)
 - phyBOARD-Pollux-i.MX8MP (imx8mp)
 - Purism Librem5 Evergreen phone (imx8mp)
 - Kontron SMARC-sAL28 system-on-module(imx8mp)

Rockchip:
 - NanoPi M4B Single-board computer (RK3399)
 - Radxa Rock Pi E router SBC (RK3328)

ASpeed:
 - Ampere Mt. Jade, a BMC for an x86 server (AST2500)
 - IBM Everest, a BMC for a Power10 server (AST2600)
 - Supermicro x11spi, a BMC for an ARM server (AST2500)

Zynq:
 - Ebang EBAZ4205, FPGA board (Zynq-7000)
 - ZynqMP zcu104 revC reference platform (ZynqMP)

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Adam Ford (27):
      dt-bindings: arm: renesas: Add Beacon RZ/G2N and RZ/G2H boards
      arm64: dts: renesas: beacon kit: Fix choppy Bluetooth Audio
      arm64: dts: renesas: beacon kit: Remove unnecessary nodes
      arm64: dts: renesas: beacon: Fix audio-1.8V pin enable
      arm64: dts: renesas: beacon: Fix LVDS PWM Backlight
      arm64: dts: renesas: beacon: Fix RGB Display PWM Backlight
      arm64: dts: renesas: beacon: Don't make vccq_sdhi0 always on
      arm64: dts: renesas: beacon: Enable SPI
      arm64: dts: renesas: beacon: Correct I2C bus speeds
      dt-bindings: arm: fsl: Add beacon,imx8mn-beacon-kit
      arm64: dts: imx: Add Beacon i.MX8M Nano development kit
      arm64: dts: imx8mm-beacon: Drop unused clock-names reference
      ARM: dts: imx6q-logicpd: Drop unused clock-names reference
      arm64: dts: renesas: beacon: Configure programmable clocks
      arm64: dts: renesas: beacon kit: Fix Audio Clock sources
      arm64: dts: renesas: beacon: Configure Audio CODEC clocks
      arm64: dts: renesas: beacon: Better describe keys
      arm64: dts: renesas: beacon-rzg2m-kit: Rearrange SoC unique functions
      arm64: dts: renesas: r8a774b1: Introduce beacon-rzg2n-kit
      arm64: dts: renesas: r8a774e1: Introduce beacon-rzg2h-kit
      arm64: dts: renesas: rzg2: Add usb2_clksel to RZ/G2 M/N/H
      arm64: dts: renesas: rzg2: Add RPC-IF Support
      arm64: dts: imx8mm-beacon: add more pinctrl states for usdhc1
      arm64: dts: imx8mn-beacon-som: Configure RTC aliases
      ARM: dts: omap36xx: Remove turbo mode for 1GHz variants
      arm64: dts: imx8mn: Add fspi node
      arm64: dts: imx8mn-beacon-som: Enable QSPI on SOM

Adrian Schmutzler (3):
      ARM: dts: qcom: remove commented mmc-ddr-1_8v for sdcc3
      ARM: dts: qcom: add additional DT labels in qcom-ipq8064.dtsi
      ARM: dts: qcom: replace status value "ok" by "okay"

Adrien Grassein (2):
      dt-bindings: arm: imx: add imx8mm nitrogen support
      arm64: dts: imx: Add i.mx8mm nitrogen basic dts support

Akhil P Oommen (1):
      arm64: dts: qcom: sc7180: Add support for gpu fuse

Alexander Dahl (3):
      ARM: dts: berlin: Fix schema warnings for pwm-leds
      ARM: dts: stm32: Fix schema warnings for pwm-leds on lxa-mc1
      arm64: dts: meson: Fix schema warnings for pwm-leds

Alexander Shiyan (1):
      ARM: dts: am335x-myirtech-*: Add DT for AM335X MYIR Tech Limited boar=
d

Alexey Minnekhanov (1):
      ARM: dts: qcom: msm8974-klte: Fix shdc numbering

Alice Guo (3):
      dt-bindings: soc: imx8m: add DT Binding doc for soc unique ID
      arm64: dts: imx8m: add SoC ID compatible
      arm64: dts: imx8m: add NVMEM provider and consumer to read soc unique=
 ID

Amelie Delaunay (3):
      ARM: dts: stm32: add usbphyc vdda1v1 and vdda1v8 supplies on stm32mp1=
51
      ARM: dts: stm32: remove usbphyc ports vdda1v1 & vdda1v8 on
stm32mp15 boards
      ARM: dts: stm32: add #clock-cells property to usbphyc node on stm32mp=
151

Andre Przywara (8):
      arm64: dts: allwinner: A64: properly connect USB PHY to port 0
      arm64: dts: allwinner: H6: properly connect USB PHY to port 0
      arm64: dts: allwinner: Pine64-LTS: Add status LED
      arm64: dts: allwinner: Drop non-removable from SoPine/LTS SD card
      arm64: dts: allwinner: H6: Allow up to 150 MHz MMC bus frequency
      arm64: dts: allwinner: A64: Limit MMC2 bus frequency to 150 MHz
      arm64: dts: allwinner: Pine64-LTS/SoPine: Enable HS200 eMMC mode
      arm64: dts: allwinner: Pine H64: Enable HS200 eMMC mode

Andreas Kemnade (5):
      ARM: dts: omap3-gta04: fix twl4030-power settings
      ARM: dts: imx6sl-tolino-shine2hd: correct console uart pinmux
      ARM: dts: imx6sl-tolino-shine2hd: add second uart
      ARM: dts: imx6sl-tolino-shine3: correct console uart pinmux
      ARM: dts: imx: e60k02: add second uart

Andrew Jeffery (1):
      ARM: dts: aspeed: rainier: Add eMMC clock phase compensation

Andr=C3=A9 Hentschel (1):
      ARM: dts: omap3-echo: Add speaker sound card support

AngeloGioacchino Del Regno (2):
      arm64: dts: pmi8998: Add the right interrupts for LAB/IBB SCP and OCP
      arm64: dts: qcom: msm8998: Use rpmpd definitions for opp table levels

Argus Lin (1):
      arm64: dts: mt6779: Support pwrap on Mediatek MT6779 platform

Arnd Bergmann (39):
      Merge tag 'v5.11-berlin-dts64' of
git://git.kernel.org/.../jszhang/linux-berlin into arm/dt
      Merge tag 'v5.11-berlin-dts' of
git://git.kernel.org/.../jszhang/linux-berlin into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.12-tag1' of
git://git.kernel.org/.../geert/renesas-devel into arm/dt
      Merge tag 'renesas-dt-bindings-for-v5.12-tag1' of
git://git.kernel.org/.../geert/renesas-devel into arm/dt
      Merge tag 'socfpga_dts_update_for_v5.12' of
git://git.kernel.org/.../dinguyen/linux into arm/dt
      Merge tag 'at91-dt-5.12' of git://git.kernel.org/.../at91/linux
into arm/dt
      Merge tag 'ux500-dts-v5.12' of
git://git.kernel.org/.../linusw/linux-nomadik into arm/dt
      Merge tag 'visconti-arm-dt-for-v5.11-tag2' of
git://git.kernel.org/.../iwamatsu/linux-visconti into arm/dt
      Merge tag 'samsung-dt64-5.12' of
git://git.kernel.org/.../krzk/linux into arm/dt
      Merge tag 'hisi-arm64-dt-for-5.12v2' of
git://github.com/hisilicon/linux-hisi into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.12-tag2' of
git://git.kernel.org/.../geert/renesas-devel into arm/dt
      Merge tag 'stm32-dt-for-v5.12-1' of
git://git.kernel.org/.../atorgue/stm32 into arm/dt
      Merge tag 'omap-for-v5.12/dt-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/dt
      Merge tag 'tegra-for-5.12-arm-dt' of
git://git.kernel.org/.../tegra/linux into arm/dt
      Merge tag 'tegra-for-5.12-arm64-dt' of
git://git.kernel.org/.../tegra/linux into arm/dt
      Merge tag 'tegra-for-5.12-dt-bindings' of
git://git.kernel.org/.../tegra/linux into arm/dt
      Merge tag 'ti-k3-dt-for-v5.12' of
git://git.kernel.org/.../nmenon/linux into arm/dt
      Merge tag 'sunxi-dt-for-5.12' of
git://git.kernel.org/.../sunxi/linux into arm/dt
      Merge tag 'arm-soc/for-5.12/devicetree' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'arm-soc/for-5.12/devicetree-arm64' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'keystone_dts_for_5.12' of
git://git.kernel.org/.../ssantosh/linux-keystone into arm/dt
      Merge tag 'v5.11-next-dts64' of
git://git.kernel.org/.../matthias.bgg/linux into arm/dt
      Merge tag 'mvebu-dt-5.12-1' of
git://git.kernel.org/.../gclement/mvebu into arm/dt
      Merge tag 'mvebu-dt64-5.12-1' of
git://git.kernel.org/.../gclement/mvebu into arm/dt
      Merge tag 'samsung-dt-5.12' of
git://git.kernel.org/.../krzk/linux into arm/dt
      Merge tag 'zynqmp-dt-for-v5.12' of
https://github.com/Xilinx/linux-xlnx into arm/dt
      Merge tag 'amlogic-dt' of
git://git.kernel.org/.../khilman/linux-amlogic into arm/dt
      Merge tag 'amlogic-dt64-1' of
git://git.kernel.org/.../khilman/linux-amlogic into arm/dt
      Merge tag 'qcom-arm64-for-5.12' of
git://git.kernel.org/.../qcom/linux into arm/dt
      Merge tag 'qcom-dts-for-5.12' of
git://git.kernel.org/.../qcom/linux into arm/dt
      Merge tag 'imx-bindings-5.12' of
git://git.kernel.org/.../shawnguo/linux into arm/dt
      Merge tag 'imx-dt-5.12' of
git://git.kernel.org/.../shawnguo/linux into arm/dt
      Merge tag 'imx-dt64-5.12' of
git://git.kernel.org/.../shawnguo/linux into arm/dt
      Merge tag 'actions-arm-dt-for-v5.12' of
git://git.kernel.org/.../mani/linux-actions into arm/dt
      Merge tag 'v5.12-rockchip-dts32-1' of
git://git.kernel.org/.../mmind/linux-rockchip into arm/dt
      Merge tag 'v5.12-rockchip-dts64-1' of
git://git.kernel.org/.../mmind/linux-rockchip into arm/dt
      Merge tag 'aspeed-5.12-devicetree' of
git://git.kernel.org/.../joel/aspeed into arm/dt
      Merge branch 'dt-for-v5.12' of
git://git.kernel.org/.../iwamatsu/linux-visconti into arm/dt
      Merge tag 'zynq-dt-for-v5.12-v2' of
https://github.com/Xilinx/linux-xlnx into arm/dt

Artem Lapkin (1):
      arm64: dts: meson: fix broken wifi node for Khadas VIM3L

Baruch Siach (1):
      arm64: dts: armada: add pwm offsets for ap/cp gpios

Ben Pai (1):
      ARM: dts: aspeed: mowgli: Add i2c rtc device

Biwen Li (8):
      arm64: dts: ls1043a: add DT node for external interrupt lines
      arm64: dts: ls1046a: add DT node for external interrupt lines
      arm64: dts: ls1088a: add DT node for external interrupt lines
      arm64: dts: ls1088ardb: fix interrupt line for RTC node
      arm64: dts: ls208xa: add DT node for external interrupt lines
      arm64: dts: ls208xa-rdb: add interrupt line for RTC node
      arm64: dts: lx2160a: add DT node for external interrupt lines
      arm64: dts: lx2160ardb: fix interrupt line for RTC node

Bjorn Andersson (1):
      ARM: dts: qcom: sdx55: Enable ARM SMMU

Brian Masney (1):
      ARM: dts: qcom: msm8974: add gpu support

Caleb Connolly (1):
      arm64: dts: sdm845: add oneplus6/6t devices

Carl Philipp Klemm (2):
      ARM: dts: motorola-mapphone: Add 1.2GHz OPP
      ARM: dts: omap443x: Correct sgx clock to 307.2MHz as used on
motorola vendor kernel

Chen-Yu Tsai (5):
      arm64: dts: rockchip: rk3328: Add clock_in_out property to gmac2phy n=
ode
      dt-bindings: arm: rockchip: Add Radxa ROCK Pi E
      arm64: dts: rockchip: rk3328: Add Radxa ROCK Pi E
      arm64: dts: rockchip: Move ep-gpios property to nanopc-t4 from nanopi=
4
      arm64: dts: rockchip: Add NanoPi M4B board

Christian Hewitt (9):
      dt-bindings: arm: amlogic: add support for the Beelink GS-King-X
      arm64: dts: meson: add initial Beelink GS-King-X device-tree
      arm64: dts: meson: shorten audio card names for alsa compatibility
      arm64: dts: meson: add i2c3/rtc nodes and rtc aliases to ODROID-N2 dt=
si
      dt-bindings: arm: amlogic: sort SM1 bindings
      arm64: dts: meson: sort Amlogic dtb Makefile
      arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi
      dt-bindings: arm: amlogic: add ODROID-HC4 bindings
      arm64: dts: meson: add initial device-tree for ODROID-HC4

Claudiu Beznea (1):
      ARM: dts: at91: sama5d2: remove atmel,wakeup-type references

Cory Tusar (1):
      ARM: dts: imx6: RDU2: adjust audio devices nomenclature

Cristian Ciocaltea (10):
      arm: dts: owl-s500: Add Clock Management Unit
      arm: dts: owl-s500: Set CMU clocks for UARTs
      arm: dts: owl-s500: Add Reset controller
      arm: dts: owl-s500: Add DMA controller
      arm: dts: owl-s500: Add pinctrl & GPIO support
      arm: dts: owl-s500: Add MMC support
      arm: dts: owl-s500: Add I2C support
      arm: dts: owl-s500: Add SIRQ controller
      arm: dts: owl-s500-roseapplepi: Add uSD support
      arm: dts: owl-s500-roseapplepi: Add I2C pinctrl configuration

Daniel Palmer (2):
      dt-bindings: vendor-prefixes: Fix misordering introduced by
honestar prefix
      ARM: mstar: Unify common parts of BreadBee boards into a dtsi

Danny Lin (6):
      arm64: dts: qcom: sm8150: Define CPU topology
      arm64: dts: qcom: sm8150: Add PSCI idle states
      arm64: dts: qcom: sm8150: Add CPU capacities and energy model
      arm64: dts: qcom: sm8150: Add support for deep CPU cluster idle
      arm64: dts: qcom: sm8250: Define CPU topology
      arm64: dts: qcom: sm8250: Add CPU capacities and energy model

Dave Stevenson (1):
      ARM: dts: bcm2711: Use compatible string for BCM2711 DSI1

Demetris Ierokipides (1):
      ARM: dts: rockchip: add gpu node to rk3288-miqi

Dinh Nguyen (2):
      arm64: dts: n5x: Add support for Intel's eASIC N5X platform
      ARM: dts: arria10: add PMU node

Dmitry Baryshkov (17):
      arm64: dts: sm8250-mtp: enable USB host nodes
      arm64: dts: qcom: sm8250.dtsi: add display system nodes
      arm64: dts: qrb5165-rb5: add mdss/mdp/dsi nodes
      arm64: dts: qcom: qrb5165-rb5: add gpu/zap-shader node
      arm64: dts: qcom: sm8250-mtp: add gpu/zap-shader node
      arm64: dts: qcom: qrb5165-rb5: correct vdc_3v3 regulator
      arm64: dts: qcom: qrb5165-rb5: add lt9611 HDMI bridge
      arm64: dts: qcom: sm8250: power up dispcc on sm8250 by MMCX regulator
      arm64: dts: qcom: sm8250: rename smem device node to follow schema
      arm64: dts: qcom: qrb5165-rb5: enable cdsp device
      arm64: dts: qcom: qrb5165-rb5: add HDMI audio playback
      arm64: dts: qcom: sm8250: correct sdhc_2 xo clk
      arm64: dts: qcom: qrb5165-rb5: fix uSD pins drive strength
      arm64: dts: qcom: qrb5165-rb5: sort nodes alphabetically
      arm64: dts: qcom: pm8150x: add definitions for adc-tm5 part
      arm64: dts: sm8250-mtp: add thermal zones using pmic's adc-tm5
      arm64: dts: qrb5165-rb5: port thermal zone definitions

Douglas Anderson (3):
      arm64: dts: qcom: Fix SD card vqmmc max voltage on sc7180-trogdor
      arm64: dts: qcom: sc7180: Add "dp_hot_plug_det" pinconf for trogdor
      arm64: dts: qcom: Clean up sc7180-trogdor voltage rails

Dylan Van Assche (1):
      arm64: allwinner: dts: pinephone: add 'pine64, pinephone' to the
compatible list

Eddie James (1):
      ARM: dts: aspeed: Add Everest BMC machine

Enric Balletbo i Serra (1):
      arm64: dts: mt8183: Add missing power-domain for pwm0 node

Eric Biggers (1):
      arm64: dts: qcom: sdm630: add ICE registers and clocks

Fabien Parent (3):
      arm64: dts: mediatek: mt8183: add pwm node
      arm64: dts: mediatek: mt8183-evb: add PWM support
      arm64: dts: mediatek: mt8516: add support for APDMA

Fabio Estevam (5):
      ARM: dts: imx6ul-14x14-evk: Fix SPI chipselect polarity
      ARM: dts: imx6ul-14x14-evk: Enable the GPIO expander
      ARM: dts: imx6ul-14x14-evk: Describe the KSZ8081 reset
      ARM: dts: imx6ul-14x14-evk: Add camera support
      arm64: dts: imx8mq: Add eCSPI DMA support

Florian Fainelli (2):
      Merge tag 'tags/bcm2835-dt-next-2021-01-25' into devicetree/next
      Merge tag 'tags/bcm2835-dt-next-2021-01-28' into devicetree/next

Frank Wunderlich (1):
      dts64: mt7622: fix slow sd card access

Geert Uytterhoeven (3):
      arm64: dts: renesas: r8a779a0: Add GPIO nodes
      arm64: dts: renesas: r8a779a0: Add SYS-DMAC nodes
      arm64: dts: renesas: beacon: Fix EEPROM compatible value

George Liu (2):
      ARM: dts: aspeed: inspur-fp5280g2: Add GPIO line names
      ARM: dts: aspeed: inspur-fp5280g2: Add ipsps1 driver

Grygorii Strashko (3):
      ARM: dts: am33xx-l4: add dt node for new cpsw switchdev driver
      ARM: dts: am335x-evm/evmsk/icev2: switch to new cpsw switch drv
      arm64: dts: ti: k3: mmc: fix dtbs_check warnings

Guido G=C3=BCnther (8):
      arm64: dts: imx8mq-librem5-devkit: Tweak pmic regulators
      arm64: dts: imx8mq-librem5-devkit: Disable snvs_rtc
      arm64: dts: imx8mq-librem5-devkit: Drop custom clock settings
      arm64: dts: imx8mq: Add clock parents for mipi dphy
      arm64: dts: imx8mq-librem5: Mark charger IRQ as High-Z
      arm64: dts: imx8mq-librem5: Don't mark buck3 as always on
      arm64: dts: imx8mq-librem5: Add usb-c chip as supplier for the charge=
r
      arm64: dts: imx8mq-librem5: Add LCD_1V8 regulator

Gustave Monce (14):
      arm64: dts: qcom: msm8994: Fix remaining BLSP errors/mistakes
      arm64: dts: qcom: msm8992/4-lumia*: Create a common DTS
      arm64: dts: qcom: msm8994-octagon: Fix up the memory map
      arm64: dts: qcom: msm8994-octagon: Add gpio-keys and Hall sensor
      arm64: dts: qcom: msm8994-octagon: Configure regulators
      arm64: dts: qcom: msm8994-octagon: Add QCA6174 bluetooth
      arm64: dts: qcom: msm8994-octagon: Configure HD3SS460 Type-C mux pins
      arm64: dts: qcom: msm8994-octagon: Add uSD card and disable HS400 on =
eMMC
      arm64: dts: qcom: msm8994-octagon: Configure Lattice iCE40 FPGA
      arm64: dts: qcom: msm8994-octagon: Configure PON keys
      arm64: dts: qcom: msm8994-octagon: Add NXP NFC node
      arm64: dts: qcom: msm8994-octagon: Add sensors on blsp1_i2c5
      arm64: dts: qcom: msm8994-octagon: Add TAS2553 codec
      arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors

Hoang Vo (2):
      arm64: dts: renesas: r8a779a0: Add RWDT node
      arm64: dts: renesas: falcon: Enable watchdog timer

Hou Zhiqiang (1):
      arm64: dts: ls1046ardb: Add interrupt line for RTC node

Hsin-Yi Wang (4):
      arm64: dts: mediatek: mt8183: Add domain supply for mfg
      arm64: dts: mt8183: config dsi node
      arm64: dts: mt8183: Add krane-sku0 board.
      dt-bindings: arm64: dts: mediatek: Add krane sku0

Icenowy Zheng (3):
      dt-bindings: arm: sunxi: add PineTab Early Adopter edition
      arm64: allwinner: dts: a64: add DT for Early Adopter's PineTab
      dt-bindings: arm: sunxi: document orig PineTab DT as sample

Iskren Chernev (1):
      ARM: dts: qcom: msm8974-klte: Mark essential regulators

J.R. Divya Antony (1):
      arm64: dts: qcom: Add device tree for ASUS Zenfone 2 Laser

JC Kuo (2):
      arm64: tegra: Add XUSB pad controller's "nvidia,pmc" property on Tegr=
a210
      arm64: tegra: Enable Jetson-Xavier J512 USB host

Jagan Teki (1):
      ARM: dts: stm32: Add STM32MP1 I2C6 SDA/SCL pinmux

James Liao (1):
      arm64: dts: mt8192: Add cpu-idle-states

Javier Martinez Canillas (1):
      ARM: dts: omap3-igep: Change email address in copyright notice

Jernej Skrabec (6):
      dt-bindings: media: Add Allwinner R40 deinterlace compatible
      ARM: dts: sun8i: r40: Add deinterlace node
      arm64: dts: allwinner: h5: Add deinterlace node
      arm64: dts: allwinner: h6: PineH64 model B: Add bluetooth
      ARM: dts: sunxi: bananapi-m2-plus: Increase BT UART speed
      ARM: dts: sun8i: h2-plus: bananapi-m2-zero: Increase BT UART speed

Jerome Brunet (1):
      arm64: dts: meson: vim3: whitespace fixups

Jisheng Zhang (3):
      ARM: dts: berlin: Use generic "ngpios" rather than "snps,nr-gpios"
      arm64: dts: synaptics: Use generic "ngpios" rather than "snps,nr-gpio=
s"
      arm64: dts: socfpga: Use generic "ngpios" rather than "snps,nr-gpios"

Joakim Zhang (5):
      ARM: dts: imx6: add wakeup support via magic packet
      arm64: dts: imx8m: correct assigned clocks for FEC
      arm64: dts: imx8mq: assign clock parents for FEC
      arm64: dts: imx8m: add mac address for FEC
      arm64: dts: imx8m: add fsl,stop-mode property for FEC

Johan Jonker (16):
      arm64: dts: rockchip: assign a fixed index to mmc devices on rk3328 b=
oards
      ARM: dts: rockchip: add QoS register compatibles for rk3066/rk3188
      ARM: dts: rockchip: add QoS register compatibles for rk3288
      arm64: dts: rockchip: add QoS register compatibles for rk3399
      arm64: dts: rockchip: add QoS register compatibles for px30
      ARM: dts: rockchip: rename thermal subnodes for rk3288
      arm64: dts: rockchip: rename thermal subnodes for rk3368
      arm64: dts: rockchip: rename thermal subnodes for rk3399
      ARM: dts: rockchip: assign a fixed index to mmc devices on rk322x boa=
rds
      ARM: dts: rockchip: assign a fixed index to mmc devices on rv1108 boa=
rds
      arm64: dts: rockchip: fix ranges property format for rk3399 pcie node
      arm64: dts: rockchip: cleanup cpu_thermal node of rk3399-rock960.dts
      arm64: dts: rockchip: assign a fixed index to mmc devices on px30 boa=
rds
      arm64: dts: rockchip: assign a fixed index to mmc devices on rk3308 b=
oards
      arm64: dts: rockchip: assign a fixed index to mmc devices on rk3368 b=
oards
      arm64: dts: rockchip: rename pinctrl nodename to gmac2io for
nanopi-r2s board

John Crispin (1):
      ARM: dts: qcom: ipq4019: add USB devicetree nodes

John Wang (2):
      ARM: dts: aspeed: Add LCLK to lpc-snoop
      ARM: dts: aspeed: g220a: Fix some gpio

Jon Hunter (2):
      arm64: tegra: Prepare for supporting the Jetson Xavier NX with eMMC
      arm64: tegra: Add support for Jetson Xavier NX with eMMC

Jonathan Albrieux (3):
      arm64: dts: qcom: Add device tree for BQ Aquaris X5 (Longcheer L8910)
      arm64: dts: qcom: msm8916: Add blsp_i2c3
      arm64: dts: qcom: msm8916-longcheer-l8910: Add imu/magnetometer

Jonathan McDowell (1):
      ARM: dts: qcom: add prng definition to ipq806x

Katsuhiro Suzuki (3):
      arm64: dts: rockchip: enable HDMI sound nodes for rk3328-rock64
      arm64: dts: rockchip: add SPDIF node for rk3399-rockpro64
      arm64: dts: rockchip: more user friendly name of sound nodes

Kishon Vijay Abraham I (6):
      arm64: dts: ti: k3-j721e-main: Fix supported max outbound regions
      arm64: dts: ti: k3-j721e-main: Remove "syscon" nodes added for pcieX_=
ctrl
      arm64: dts: ti: k3-j7200-main: Add SERDES and WIZ device tree node
      arm64: dts: ti: k3-j7200-main: Add PCIe device tree node
      arm64: dts: ti: k3-j7200-common-proc-board: Enable SERDES0
      arm64: dts: ti: k3-j7200-common-proc-board: Enable PCIe

Koji Matsuoka (2):
      arm64: dts: renesas: r8a779a0: Add MSIOF device nodes
      arm64: dts: renesas: r8a779a0: Add I2C nodes

Konrad Dybcio (22):
      arm64: dts: qcom: msm8992/4: Add RPM Power Domains
      arm64: dts: qcom: Add support for remaining Sony Kitakami boards
      arm64: dts: qcom: msm8992-bullhead: Update regulator config
      arm64: dts: qcom: msm8992-libra: Update regulator config
      arm64: dts: qcom: msm8992/4: Rename vreg_vph_pwr to vph_pwr
      arm64: dts: qcom: msm/apq8994-kitakami: Add regulator config
      arm64: dts: qcom: msm8994-kitakami: Add Synaptics RMI touchscreen
      arm64: dts: qcom: msm8994-kitakami: Add uSD card support
      arm64: dts: qcom: msm8994-kitakami: Add VDD_GFX regulator
      arm64: dts: qcom: msm8994: Fix BLSP2_UART2 node
      arm64: dts: qcom: msm8994/8994-kitakami: Fix up the memory map
      arm64: dts: qcom: msm8994-kitakami: Add missing email in the copyrigh=
t
      arm64: dts: qcom: msm8994: Add SMP2P nodes
      arm64: dts: qcom: msm8994: Sort hwlock properly
      arm64: dts: qcom: msm8992: Make the DT an overlay on top of 8994
      arm64: dts: qcom: msm8994-octagon: Add FM Radio and DDR regulator nod=
es
      arm64: dts: qcom: msm8998: Merge in msm8998-pins.dtsi to msm8998.dtsi
      arm64: dts: qcom: msm8998: Add DMA to I2C hosts
      arm64: dts: qcom: msm8998: Add I2C pinctrl and fix BLSP2_I2C naming
      arm64: dts: qcom: msm8998: Add capacity-dmips-mhz to CPU cores
      arm64: dts: qcom: msm8998: Disable some components by default
      arm64: dts: qcom: msm8996: Add missing device_type under pcie[01]

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Enable secondary LPC snooping address

Konstantin Porotchkin (1):
      arm64: dts: change AP807 SDHCI compatibility string

Krzysztof Kozlowski (11):
      ARM: dts: exynos: correct PMIC interrupt trigger level on Artik 5
      ARM: dts: exynos: correct PMIC interrupt trigger level on Monk
      ARM: dts: exynos: correct PMIC interrupt trigger level on Rinato
      ARM: dts: exynos: correct PMIC interrupt trigger level on Spring
      ARM: dts: exynos: correct PMIC interrupt trigger level on Arndale Oct=
a
      ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid
XU3 family
      arm64: dts: exynos: correct PMIC interrupt trigger level on TM2
      arm64: dts: exynos: correct PMIC interrupt trigger level on Espresso
      arm64: dts: exynos: correct S3FWRN5 NFC interrupt trigger level on TM=
2
      ARM: dts: aspeed: fix PCA95xx GPIO expander properties on Portwell
      ARM: dts: aspeed: align GPIO hog names with dtschema

Kuldeep Singh (3):
      arm64: dts: lx2160a: Add flexcan support
      arm64: dts: ls1028a: Update flexcan properties
      arm64: dts: ls1028a: Enable flexcan support for LS1028A-RDB/QDS

Laurent Pinchart (3):
      ARM: dts: imx6q(dl): Move 'port' nodes under 'ports' for HDMI encoder
      arm64: dts: zynqmp: Add DPDMA node
      arm64: dts: zynqmp: Wire up the DisplayPort subsystem

Leonard Crestez (1):
      arm64: dts: imx8mq: Add NOC node

Linh Phung (1):
      arm64: dts: renesas: r8a779a0: Add HSCIF support

Linus Walleij (10):
      ARM: dts: ux500: Add a device tree for Janice
      ARM: dts: ux500: Fix channel names attributes
      ARM: dts: ux500: Add interrupts to charger
      ARM: dts: ux500: Add thermistors to the HREF
      ARM: dts: ux500: Remove the GPADC HW IRQ
      ARM: dts: ux500: Push VMMCI down to each tree
      ARM: dts: ux500: Add die temperature to AB8505
      ARM: dts: Fix up MMC host node names
      ARM: dts: nomadik: Fix up MMC node names
      ARM: dts: ux500: Add Flash LEDs to Samsung phones

Lotus Xu (1):
      ARM: dts: aspeed: g220a: Enable ipmb

Lubomir Rintel (12):
      dt-bindings: gpio: mrvl-gpio: Fix the gpio-ranges property
      media: dt-bindings: marvell,mmp2-ccic: Allow power-domains property
      ARM: dts: mmp2-olpc-xo-1-75: Fix memory node name
      ARM: dts: mmp2-olpc-xo-1-75: Drop linux,usable-memory from /memory
      ARM: dts: mmp3-dell-ariel: Drop linux,usable-memory from /memory
      ARM: dts: mmp3: Extend the MPMU reg range
      ARM: dts: mmp2: Use symbolic names for audio clocks
      ARM: dts: mmp2-olpc-xo-1-75: Use symbolic names for audio clocks
      ARM: dts: mmp3-dell-ariel: Add the embedded controller
      ARM: dts: mmp3-dell-ariel: Add the power button node
      ARM: dts: mmp3-dell-ariel: Replace SSP2 with spi-gpio
      ARM: dts: mmp3: Fix the CCIC interrupts

Lucas Stach (8):
      ARM: dts: imx6: RDU2: reduce i2c drive-strength
      ARM: dts: imx6: RDU2: enable RMI4 reduced reporting
      ARM: dts: imx6: RDU2: only trigger IRQ on falling edge ucs1002 ALERT =
pin
      arm64: dts: zii-ultra: add sound support
      arm64: dts: zii-ultra: fix i2c pin configuration
      arm64: dts: zii-ultra: limit USB ports to USB2 speed
      arm64: dts: zii-ultra: only trigger IRQ on falling edge ucs1002 ALERT=
 pin
      arm64: dts: zii-rmb3: enable RMI4 reduced reporting

Manivannan Sadhasivam (18):
      arm64: dts: qcom: sm8250: Add support for LLCC block
      ARM: dts: qcom: Add SDX55 platform and MTP board support
      ARM: dts: qcom: sdx55: Add support for SDHCI controller
      ARM: dts: qcom: sdx55: Add support for TCSR Mutex
      ARM: dts: qcom: sdx55: Add Shared memory manager support
      ARM: dts: qcom: sdx55: Add QPIC BAM support
      ARM: dts: qcom: sdx55: Add QPIC NAND support
      ARM: dts: qcom: sdx55-mtp: Enable BAM DMA
      ARM: dts: qcom: sdx55-mtp: Enable QPIC NAND
      dt-bindings: usb: qcom,dwc3: Add binding for SDX55
      ARM: dts: qcom: sdx55: Add USB3 and PHY support
      ARM: dts: qcom: sdx55-mtp: Enable USB3 and PHY support
      dt-bindings: watchdog: Add binding for Qcom SDX55
      ARM: dts: qcom: sdx55: Add Watchdog support
      ARM: dts: qcom: sdx55: Add pshold support
      arm64: dts: qcom: Add missing "-thermal" suffix for thermal zones
      arm64: dts: qcom: sm8250: Add PCIe support
      arm64: dts: qcom: rb5: Enable PCIe ports and PHY

Mans Rullgard (1):
      ARM: dts: imx28: add pinmux for USB1 overcurrent on pwm2

Marcin Wojtas (1):
      arm64: dts: cn913x-db: enable MMC HS400

Marek Beh=C3=BAn (1):
      arm64: dts: armada-3720-turris-mox: rename u-boot mtd partition
to a53-firmware

Marek Szyprowski (1):
      ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY compatible

Marek Vasut (7):
      ARM: dts: stm32: Enable internal pull-ups for SDMMC1 on DHCOM SoM
      ARM: dts: stm32: Disable SDMMC1 CKIN feedback clock on DHCOM
      ARM: dts: stm32: Disable KS8851 and FMC on PicoITX board
      ARM: dts: imx7: Mark timer with arm,cpu-registers-not-fw-configured
      ARM: dts: stm32: Add additional init state for SDMMC1 pins
      ARM: dts: stm32: Enable voltage translator auto-detection on DHCOM
      ARM: dts: stm32: Rename mmc controller nodes to mmc@

Martin Blumenstingl (7):
      ARM: dts: meson: move iio-hwmon for the SoC temperature to meson.dtsi
      ARM: dts: meson: add the ADC thermal sensor to meson.dtsi
      ARM: dts: meson8: add the thermal-zones with cooling configuration
      ARM: dts: meson8b: add the thermal-zones with cooling configuration
      dt-bindings: sram: Add compatible strings for the Meson AO ARC SRAM
      dt-bindings: Amlogic: add the documentation for the SECBUS2 registers
      ARM: dts: meson: add the AO ARC remote processor

Martin Kepplinger (10):
      arm64: dts: imx8mq-librem5: add vin-supply to VDD_1V8
      arm64: dts: imx8mq-librem5: add pinctrl for the touchscreen descripti=
on
      arm64: dts: imx8mq-librem5: Move usdhc clocks assignment to board DT
      arm64: dts: imx8mq-librem5-r3: workaround i2c1 issue with 1GHz cpu vo=
ltage
      arm64: dts: imx8mq: Add interconnect provider property
      arm64: dts: imx8mq: Add interconnect for lcdif
      dt-bindings: arm: fsl: Add the librem 5 Evergreen revision
      arm64: dts: imx8mq-librem5: enable the LCD panel
      arm64: dts: imx8mq-librem5: set regulators boot-on
      arm64: dts: Add Librem5 Evergreen

Matthias Brugger (1):
      arm64: dts: mt8183: Fix GCE include path

Matthias Kaehlcke (1):
      arm64: dts: qcom: sc7180: Add labels for cpuN-thermal nodes

Mauro Carvalho Chehab (3):
      arm64: dts: hisilicon: hi3670.dtsi: add iomcu_rst
      arm64: dts: hisilicon: hikey970-pinctrl.dtsi: add missing pinctrl set=
tings
      arm64: dts: hisilicon: hi3670.dtsi: add I2C settings

Maxime Ripard (18):
      dt-bindings: sunxi: Fix the pinecube compatible
      dt-bindings: iio: adc: Add AXP803 compatible
      dt-bindings: rtc: sun6i-a31-rtc: Loosen the requirements on the clock=
s
      ARM: dts: sunxi: Fix the LED node names
      ARM: dts: sunxi: Add missing backlight supply
      ARM: dts: sunxi: Fix CPU thermal zone node name
      ARM: dts: bcm2711: Add the BSC interrupt controller
      ARM: dts: bcm2711: Add the CEC interrupt controller
      ARM: dts: sun6i: primo81: Remove useless io-channel-cells
      ARM: dts: sun8i: nanopi-r1: Fix GPIO regulator state array
      ARM: dts: sun8i-s3: impetus: Fix the USB PHY ID detect GPIO propertie=
s
      ARM: dts: sun8i-s3: pinecube: Fix CSI DTC warnings
      ARM: dts: sun8i-a83t: Remove empty CSI port
      ARM: dts: sun8i-a33: sina33: Add missing panel power supply
      arm64: dts: allwinner: h6: Use - instead of @ for DT OPP entries
      arm64: dts: allwinner: pinephone: Remove useless light sensor supplie=
s
      arm64: dts: allwinner: pinetab: Fix the panel compatible
      arm64: dts: allwinner: pine-h64: Fix typos in BT GPIOs

Michael Klein (3):
      ARM: dts: sun8i-h2-plus-bananapi-m2-zero: add regulator nodes
vcc-dram and vcc1v2
      ARM: dts: sun6i-a31s-sinovoip-bpi-m2: add gpio-line-names
      ARM: dts: sun8i-h2-plus-bananapi-m2-zero: add poweroff node

Michael Walle (15):
      arm64: dts: ls1012a: use constants in the clockgen phandle
      arm64: dts: ls1028a: use constants in the clockgen phandle
      arm64: dts: ls1043a: use constants in the clockgen phandle
      arm64: dts: ls1046a: use constants in the clockgen phandle
      arm64: dts: ls1088a: use constants in the clockgen phandle
      arm64: dts: ls208xa: use constants in the clockgen phandle
      arm64: dts: lx2160a: use constants in the clockgen phandle
      dt-bindings: arm: fsl: add Kontron sl28 variant 1
      arm64: dts: freescale: sl28: add variant 1
      arm64: dts: freescale: sl28: enable SATA support
      arm64: dts: ls1028a: fix FlexSPI clock
      dt-bindings: add ebang vendor prefix
      dt-bindings: arm: add Ebang EBAZ4205 board
      ARM: dts: add Ebang EBAZ4205 device tree
      ARM: dts: ebaz4205: add pinctrl entries for switches

Michal Simek (17):
      arm64: dts: zynqmp: Add address-cells property to interrupt controlle=
rs
      arm64: dts: zynqmp: Fix u48 si5382 chip on zcu111
      arm64: dts: zynqmp: Add DT description for si5328 for zcu102/zcu106
      arm64: dts: zynqmp: Enable si5341 driver for zcu102/106/111
      arm64: dts: zynqmp: Enable reset controller driver
      arm64: dts: zynqmp: Enable phy driver for Sata on zcu102/zcu104/zcu10=
6
      arm64: dts: zynqmp: Add label for zynqmp_ipi
      arm64: dts: zynqmp: Add missing mio-bank properties to sdhcis
      arm64: dts: zynqmp: Wire arasan nand controller
      arm64: dts: zynqmp: Wire zynqmp qspi controller
      arm64: dts: zynqmp: Add missing lpd watchdog node
      arm64: dts: zynqmp: Add missing iommu IDs
      arm64: dts: zynqmp: Add description for zcu104 revC
      dt-bindings: arm: Fix typo in zcu111 board
      arm64: dts: zynqmp: Add DisplayPort subsystem
      dt-bindings: arm: xilinx: Add missing Zturn boards
      dt-bindings: spi: zynq: Convert Zynq QSPI binding to yaml

Neal Liu (1):
      arm64: dts: mt6779: Support devapc

Nicolas Ferre (1):
      ARM: dts: at91-sama5d27_wlsom1: add i2c recovery

Nicolas Saenz Julienne (1):
      ARM: dts: bcm2711: Add reserved memory template to hold firmware
configuration

Niklas S=C3=B6derlund (2):
      arm64: dts: renesas: rcar-gen3: Add missing CMT nodes
      arm64: dts: renesas: rcar-gen3: Add missing TMU nodes

Nishanth Menon (1):
      arm64: dts: ti: k3*: Fixup PMU compatibility to be CPU specific

Nobuhiro Iwamatsu (3):
      MAINTAINERS: Add entries for Toshiba Visconti5 watchdog driver
      arm64: dts: visconti: Add watchdog support for TMPV7708 SoC
      arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver

Oleksij Rempel (17):
      dt-bindings: display: simple: fix alphabetical order for EDT compatib=
les
      dt-bindings: display: simple: add EDT compatibles already
supported by the driver
      dt-bindings: display: simple: Add Kyocera tcg070wvlq panel
      dt-bindings: vendor-prefixes: Add an entry for Plymovent
      dt-bindings: arm: fsl: add Plymovent M2M board
      dt-bindings: arm: fsl: add Plymovent BAS board
      ARM: dts: add Plymovent M2M board
      ARM: dts: add Plymovent BAS board
      dt-bindings: arm: fsl: add Protonic MVT board
      ARM: dts: add Protonic MVT board
      dt-bindings: arm: fsl: add Protonic PRTI6G board
      ARM: dts: add Protonic PRTI6G board
      dt-bindings: vendor-prefixes: Add an entry for Kverneland Group
      dt-bindings: arm: fsl: add Kverneland UT1, UT1Q and UI1P boards
      dt-bindings: arm: fsl: add Kverneland TGO board
      ARM: dts: add Kverneland UT1, UT1Q and UT1P
      ARM: dts: add Kverneland TGO board

Pali Roh=C3=A1r (1):
      arm64: dts: marvell: armada-37xx: Add SATA comphy into main
armada-37xx.dtsi file

Paul Kocialkowski (6):
      dt-bindings: irq: sun7i-nmi: Add binding documentation for the V3s NM=
I
      ARM: dts: sun8i-v3s: Add the V3s NMI IRQ controller
      ARM: dts: sun8i: Cleanup the Pinecube AXP209 node
      dt-bindings: arm: sunxi: Add SL631 with IMX179 bindings
      ARM: dts: sun8i-v3: Add support for the SL631 Action Camera with IMX1=
79
      ARM: dts: sun8i-v3s: Add CSI0 MCLK pin definition

Pawel Dembicki (2):
      arm64: dts: fsl-ls1012a-rdb: add i2c devices
      arm64: dts: fsl-ls1012a-frdm: add spi-uart device

Peng Fan (1):
      arm64: dts: imx8mq: use_dt_domains for pci node

Peter Geis (1):
      ARM: tegra: ouya: Fix eMMC on specific bootloaders

Philipp Zabel (1):
      ARM: dts: imx6: rdu2: enable WDOG1

Quan Nguyen (1):
      ARM: dts: aspeed: Add device tree for Ampere's Mt. Jade BMC

Rafa=C5=82 Mi=C5=82ecki (6):
      dt-bindings: arm: bcm: document Netgear R8000P binding
      arm64: dts: broadcom: bcm4908: add BCM4906 Netgear R8000P DTS files
      arm64: dts: broadcom: bcm4908: use proper NAND binding
      arm64: dts: broadcom: bcm4908: describe PCIe reset controller
      arm64: dts: broadcom: bcm4908: describe internal switch
      arm64: dts: broadcom: bcm4908: describe PMB block

Robert Foss (1):
      arm64: dts: qcom: sdm845-db845c: Fix reset-pin of ov8856 node

Robert Marko (4):
      ARM: dts: qcom: ipq4019: add more labels
      ARM: dts: qcom: add 8devices Jalapeno
      ARM: dts: qcom: add Alfa Network AP120C-AC
      ARM: dts: qcom: ipq4019: add SDHCI VQMMC LDO node

Robin Murphy (3):
      ARM: dts: rockchip: Remove bogus "amba" bus nodes
      arm64: dts: rockchip: Light "sys" LED on NanoPi R2S
      arm64: dts: rockchip: Remove bogus "amba" bus nodes

Rosen Penev (3):
      ARM: dts: armada-385-linksys: fix usage with newer devices
      ARM: dts: armada388-helios4: assign pinctrl to LEDs
      ARM: dts: armada388-helios4: assign pinctrl to each fan

Russell King (4):
      arm64: dts: lx2160a-clearfog-itx: add power button support
      arm64: dts: lx2160a-cex7: delete RTC interrupt
      arm64: dts: lx2160a-cex7: increase at8035 PHY gigabit Tw parameter
      ARM: dts: imx6-sr-som: increase at8035 PHY gigabit Tw parameter

Ryan Chen (1):
      ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci

Ryan Sie (1):
      ARM: dts: aspeed: Add Supermicro x11spi BMC machine

Sai Prakash Ranjan (4):
      arm64: dts: qcom: sc7180: Add watchdog bark interrupt
      arm64: dts: qcom: sdm845: Add watchdog bark interrupt
      arm64: dts: qcom: sm8150: Add watchdog bark interrupt
      arm64: dts: qcom: sm8250: Add watchdog bark interrupt

Sameer Pujar (7):
      arm64: tegra: Add power-domain for Tegra210 HDA
      arm64: tegra: Audio graph header for Tegra210
      arm64: tegra: Audio graph sound card for Jetson Nano and TX1
      arm64: tegra: Add RT5658 device entry
      Revert "arm64: tegra: Disable the ACONNECT for Jetson TX2"
      arm64: tegra: Audio graph sound card for Jetson TX2
      arm64: tegra: Audio graph sound card for Jetson AGX Xavier

Samuel Holland (3):
      arm64: dts: allwinner: pinephone: Support volume key wakeup
      arm64: dts: allwinner: h6: Add RSB controller node
      ARM: dts: sunxi: Rename nmi_intc to r_intc

Samuel Pascua (2):
      ARM: dts: qcom: msm8974-klte: add support for GPU
      ARM: dts: qcom: msm8974-klte: add support for display

Scott Branden (1):
      arm64: dts: broadcom: Remove SATA from Stingray

Serge Semin (2):
      arm: dts: keystone: Correct DWC USB3 compatible string
      arm: dts: keystone: Harmonize DWC USB3 DT nodes name

Sergio Sota (1):
      ARM: dts: sun5i: add A10s/A13 mali gpu support fallback

Shawn Guo (1):
      Merge tag 'imx-fixes-5.11-2' into imx/dt

Shengjiu Wang (3):
      arm64: dts: imx8mn: Configure clock rate for audio plls
      arm64: dts: imx8mn-evk: Add sound-wm8524 card nodes
      arm64: dts: imx8mn-evk: Add sound-spdif card nodes

Sowjanya Komatineni (4):
      dt-bindings: clock: tegra: Add clock ID TEGRA210_CLK_QSPI_PM
      arm64: tegra: Enable QSPI on Jetson Nano
      arm64: tegra: Add QSPI nodes on Tegra194
      arm64: tegra: Enable QSPI on Jetson Xavier NX

Srinivas Kandagatla (6):
      arm64: dts: qcom: sm8250: add apr and its services
      arm64: dts: qcom: sm8250: add audio clock controllers
      arm64: dts: qcom: sm8250: add lpass lpi pin controller node
      arm64: dts: qcom: sm8250: add wsa and va codec macros
      arm64: dts: qcom: sm8250: add mi2s pinconfs
      arm64: dts: qcom: qrb5165-rb5: Add Audio support

Stanislav Jakubek (1):
      ARM: dts: bcm21664: Replace spaces with a tab

Steev Klimaszewski (1):
      arm64: dts: sdm850: Add OPP tables for 2.84 and 2.96GHz

Stephan Gerhold (2):
      arm64: dts: qcom: msm8916-samsung-a5u: Fix iris compatible
      arm64: dts: qcom: msm8916-samsung-a2015: Fix sensors

Stephen Boyd (1):
      arm64: dts: qcom: sc7180: Drop pinconf on dp_hot_plug_det

Suman Anna (3):
      arm64: dts: ti: k3-j7200: Add R5F cluster nodes
      arm64: dts: ti: k3-j7200-som-p0: Add mailboxes to R5Fs
      arm64: dts: ti: k3-j7200-som-p0: Add DDR carveout memory nodes for R5=
Fs

Takeshi Saito (2):
      arm64: dts: renesas: r8a779a0: Add MMC node
      arm64: dts: renesas: falcon: Enable MMC

Teresa Remmet (2):
      bindings: arm: fsl: Add PHYTEC i.MX8MP devicetree bindings
      arm64: dts: freescale: Add support for phyBOARD-Pollux-i.MX8MP

Tero Kristo (3):
      ARM: dts: am574x-idk: add support for EMIF1 ECC
      ARM: dts: dra76x: add support for OPP_PLUS
      ARM: dts: dra71-evm: mark ldo0 regulator as always on

Thierry Reding (3):
      Merge branch 'for-5.12/dt-bindings' into for-5.12/arm64/dt
      arm64: tegra: Order nodes alphabetically on Tegra210
      dt-bindings: arm: tegra: Document Jetson Xavier NX eMMC SKU

Tho Vu (1):
      arm64: dts: renesas: r8a779a0: Add Ethernet-AVB support

Tim Harvey (2):
      dt-bindings: arm: fsl: Add binding for Gateworks boards with IMX8MM
      arm64: dts: imx8mm: Add Gateworks i.MX 8M Mini Development Kits

Timon Baetz (2):
      ARM: dts: exynos: Fix charging regulator voltage and current for I910=
0
      ARM: dts: exynos: Add top-off charging regulator node for I9100

Tony Lindgren (3):
      Merge tag 'omap-for-v5.11/dt-late-signed' into omap-for-v5.12-dt
      ARM: dts: Configure missing thermal interrupt for 4430
      ARM: dts: motorola-mapphone: Configure lower temperature passive cool=
ing

Ulrich Hecht (1):
      arm64: dts: renesas: r8a779a0: Add pinctrl device node

Uwe Kleine-K=C3=B6nig (1):
      arm64: dts: rockchip: Rely on SoC external pull up on pmic-int-l
on Helios64

Vincent Knecht (4):
      dt-bindings: vendor-prefixes: add Alcatel
      arm64: dts: qcom: Add device tree for Alcatel Idol 3 (4.7")
      arm64: dts: qcom: Disable MDSS by default for 8916/8016 devices
      arm64: dts: msm8916: Fix reserved and rfsa nodes unit address

Vinod Koul (14):
      dt-bindings: arm: qcom: Document SDX55 platform and boards
      ARM: dts: qcom: sdx55: Add pincontrol node
      ARM: dts: qcom: sdx55: Add reserved memory nodes
      ARM: dts: qcom: sdx55: Add spmi node
      ARM: dts: qcom: sdx55-mtp: Add pm8150b pmic
      ARM: dts: qcom: sdx55: Add rpmpd node
      ARM: dts: qcom: Add PMIC pmx55 dts
      ARM: dts: qcom: sdx55-mtp: Add pmx55 pmic
      ARM: dts: qcom: sdx55-mtp: Add regulator nodes
      dt-bindings: arm: qcom: Document SM8350 SoC and boards
      dt-bindings: arm: cpus: Add kryo685 compatible
      dt-bindings: firmware: scm: Add SM8250 and SM8350 compatible
      arm64: dts: qcom: Add basic devicetree support for SM8350 SoC
      arm64: dts: qcom: Add basic devicetree support for SM8350-MTP board

Wolfram Sang (5):
      arm64: dts: renesas: Disable SD functions for plain eMMC
      arm64: dts: renesas: falcon: Add I2C0,1,6 support
      arm64: dts: renesas: falcon: Add Ethernet-AVB0 support
      arm64: dts: renesas: r8a779a0: Add & update SCIF nodes
      arm64: dts: renesas: falcon: Complete SCIF0 nodes

Yangbo Lu (1):
      arm64: dts: freescale: use fixed index mmcN for NXP layerscape
reference boards

Yifeng Zhao (5):
      arm64: dts: rockchip: Add NFC node for RK3308 SoC
      arm64: dts: rockchip: Add NFC node for PX30 SoC
      ARM: dts: rockchip: Add NFC node for RV1108 SoC
      ARM: dts: rockchip: Add NFC node for RK2928 and other SoCs
      ARM: dts: rockchip: Add NFC node for RK3036 SoC

Yongqiang Niu (2):
      arm64: dts: mt8183: rename rdma fifo size
      arm64: dts: mt8183: refine gamma compatible name

Zhen Lei (6):
      arm64: dts: hisilicon: separate each group of data in the
property "ranges"
      arm64: dts: hisilicon: place clock-names "bus" before "core"
      arm64: dts: hisilicon: normalize the node name of the module thermal
      arm64: dts: hisilicon: normalize the node name of the localbus
      arm64: dts: hisilicon: avoid irrelevant nodes being mistakenly
identified as PHY nodes
      arm64: dts: hisilicon: delete unused property smmu-cb-memtype

bayi cheng (1):
      arm64: dts: mt8192: add nor_flash device node

 Documentation/devicetree/bindings/arm/amlogic.yaml |   6 +-
 .../arm/amlogic/amlogic,meson-mx-secbus2.yaml      |  42 +
 .../devicetree/bindings/arm/bcm/brcm,bcm4908.yaml  |   2 +
 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |  23 +
 .../devicetree/bindings/arm/mediatek.yaml          |   4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |  12 +
 Documentation/devicetree/bindings/arm/renesas.yaml |   2 +
 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 Documentation/devicetree/bindings/arm/sunxi.yaml   |  19 +-
 Documentation/devicetree/bindings/arm/tegra.yaml   |   8 +
 Documentation/devicetree/bindings/arm/xilinx.yaml  |   6 +-
 .../bindings/display/panel/panel-simple.yaml       |  19 +-
 .../devicetree/bindings/firmware/qcom,scm.txt      |   2 +
 .../devicetree/bindings/gpio/mrvl-gpio.yaml        |   3 +-
 .../bindings/iio/adc/x-powers,axp209-adc.yaml      |  12 +-
 .../allwinner,sun7i-a20-sc-nmi.yaml                |   3 +
 .../media/allwinner,sun8i-h3-deinterlace.yaml      |   3 +
 .../bindings/media/marvell,mmp2-ccic.yaml          |   5 +
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |   1 -
 .../devicetree/bindings/soc/imx/imx8m-soc.yaml     |  86 ++
 .../devicetree/bindings/spi/spi-zynq-qspi.txt      |  25 -
 .../devicetree/bindings/spi/xlnx,zynq-qspi.yaml    |  59 ++
 Documentation/devicetree/bindings/sram/sram.yaml   |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  12 +-
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |   1 +
 MAINTAINERS                                        |   5 +-
 Makefile                                           |   2 +-
 arch/alpha/include/asm/local64.h                   |   1 -
 arch/arc/include/asm/Kbuild                        |   1 -
 arch/arm/boot/dts/Makefile                         |  23 +-
 arch/arm/boot/dts/am335x-evm.dts                   |  13 +-
 arch/arm/boot/dts/am335x-evmsk.dts                 |  14 +-
 arch/arm/boot/dts/am335x-icev2.dts                 |  14 +-
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi         | 267 ++++++
 arch/arm/boot/dts/am335x-myirtech-myd.dts          | 536 ++++++++++++
 arch/arm/boot/dts/am33xx-l4.dtsi                   |  49 ++
 arch/arm/boot/dts/am574x-idk.dts                   |   4 +
 arch/arm/boot/dts/armada-385-linksys.dtsi          |   2 +
 arch/arm/boot/dts/armada-388-helios4.dts           |  28 +-
 arch/arm/boot/dts/aspeed-ast2600-evb.dts           |   8 +
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |   2 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     | 558 ++++++++++++
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts   |  10 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       | 775 +++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |   3 +-
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |  37 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts        |  16 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts        |   5 +
 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts  |   2 +
 arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts | 137 +++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   1 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   1 +
 arch/arm/boot/dts/aspeed-g6.dtsi                   |   1 +
 arch/arm/boot/dts/at91-kizbox3_common.dtsi         |   1 -
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |   1 -
 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi        |  22 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts      |   1 -
 arch/arm/boot/dts/at91-sama5d2_icp.dts             |   1 -
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts          |   1 -
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |   1 -
 arch/arm/boot/dts/bcm21664.dtsi                    |   2 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              |  17 +
 arch/arm/boot/dts/bcm2711.dtsi                     |  31 +
 arch/arm/boot/dts/berlin2.dtsi                     |  12 +-
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts  |   6 +-
 arch/arm/boot/dts/berlin2cd.dtsi                   |  12 +-
 arch/arm/boot/dts/berlin2q.dtsi                    |  12 +-
 arch/arm/boot/dts/dra71-evm.dts                    |   2 +
 arch/arm/boot/dts/dra76x.dtsi                      |  36 +
 arch/arm/boot/dts/e60k02.dtsi                      |   6 +
 arch/arm/boot/dts/exynos3250-artik5.dtsi           |   2 +-
 arch/arm/boot/dts/exynos3250-monk.dts              |   2 +-
 arch/arm/boot/dts/exynos3250-rinato.dts            |   2 +-
 arch/arm/boot/dts/exynos4210-i9100.dts             |  30 +-
 arch/arm/boot/dts/exynos5250-spring.dts            |   2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      |   2 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      |   2 +-
 arch/arm/boot/dts/exynos54xx.dtsi                  |   6 +-
 arch/arm/boot/dts/imx28.dtsi                       |  10 +
 arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi      |   1 -
 arch/arm/boot/dts/imx6dl-plybas.dts                | 394 +++++++++
 arch/arm/boot/dts/imx6dl-plym2m.dts                | 446 ++++++++++
 arch/arm/boot/dts/imx6dl-prtmvt.dts                | 852 +++++++++++++++++=
++
 arch/arm/boot/dts/imx6dl-victgo.dts                | 852 +++++++++++++++++=
++
 arch/arm/boot/dts/imx6dl-vicut1.dts                |  13 +
 arch/arm/boot/dts/imx6q-tbs2910.dts                |   7 +
 arch/arm/boot/dts/imx6q-vicut1.dts                 |  17 +
 arch/arm/boot/dts/imx6q.dtsi                       |  20 +-
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi              |   2 +-
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi      |   6 +-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi           |   1 +
 arch/arm/boot/dts/imx6qdl-sr-som.dtsi              |  14 +-
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi              | 803 +++++++++++++++++=
+
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi            |  42 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     |  25 +-
 arch/arm/boot/dts/imx6qp-vicutp.dts                |  13 +
 arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts       |  18 +-
 arch/arm/boot/dts/imx6sl-tolino-shine3.dts         |  15 +-
 arch/arm/boot/dts/imx6sll-kobo-clarahd.dts         |  13 +-
 arch/arm/boot/dts/imx6sx-sdb.dtsi                  |   2 +
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi            |  54 +-
 arch/arm/boot/dts/imx6ul-prti6g.dts                | 356 ++++++++
 arch/arm/boot/dts/imx6ul.dtsi                      |   2 +
 arch/arm/boot/dts/imx7d-flex-concentrator.dts      |   1 +
 arch/arm/boot/dts/imx7s.dtsi                       |   1 +
 arch/arm/boot/dts/keystone-k2e.dtsi                |   6 +-
 arch/arm/boot/dts/keystone.dtsi                    |   4 +-
 arch/arm/boot/dts/meson.dtsi                       |  19 +
 arch/arm/boot/dts/meson8.dtsi                      |  75 ++
 arch/arm/boot/dts/meson8b-ec100.dts                |   5 -
 arch/arm/boot/dts/meson8b-mxq.dts                  |   5 -
 arch/arm/boot/dts/meson8b-odroidc1.dts             |   5 -
 arch/arm/boot/dts/meson8b.dtsi                     |  75 ++
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts          |   5 -
 arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts            |   8 +-
 arch/arm/boot/dts/mmp2.dtsi                        |   5 +-
 arch/arm/boot/dts/mmp3-dell-ariel.dts              |  33 +-
 arch/arm/boot/dts/mmp3.dtsi                        |   8 +-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi    |  23 +
 .../boot/dts/mstar-infinity-breadbee-common.dtsi   |  49 ++
 .../dts/mstar-infinity-msc313-breadbee_crust.dts   |   1 +
 .../boot/dts/mstar-infinity3-msc313e-breadbee.dts  |   1 +
 arch/arm/boot/dts/omap3-echo.dts                   |  67 ++
 arch/arm/boot/dts/omap3-gta04.dtsi                 |   4 +-
 arch/arm/boot/dts/omap3-igep.dtsi                  |   2 +-
 arch/arm/boot/dts/omap3-igep0020-common.dtsi       |   2 +-
 arch/arm/boot/dts/omap3-igep0020-rev-f.dts         |   2 +-
 arch/arm/boot/dts/omap3-igep0020.dts               |   2 +-
 arch/arm/boot/dts/omap3-igep0030-common.dtsi       |   2 +-
 arch/arm/boot/dts/omap3-igep0030-rev-g.dts         |   2 +-
 arch/arm/boot/dts/omap3-igep0030.dts               |   2 +-
 arch/arm/boot/dts/omap36xx.dtsi                    |   1 -
 arch/arm/boot/dts/omap443x.dtsi                    |   6 +-
 arch/arm/boot/dts/owl-s500-cubieboard6.dts         |   7 -
 arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts     |   7 -
 arch/arm/boot/dts/owl-s500-labrador-base-m.dts     |   7 -
 arch/arm/boot/dts/owl-s500-roseapplepi.dts         |  97 ++-
 arch/arm/boot/dts/owl-s500-sparky.dts              |   7 -
 arch/arm/boot/dts/owl-s500.dtsi                    | 140 +++
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |  12 +-
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts |   8 +-
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts        |   8 +-
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |  10 +-
 .../arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts |   4 +-
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts     |  10 +-
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dts   |  28 +
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dts       |  27 +
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi      | 254 ++++++
 arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts        | 214 +++++
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi      |  18 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts    |   4 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi      |  10 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts    |   8 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts    |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi      |  10 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |  90 +-
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts           |   2 +-
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi           |  12 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |  31 +-
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi         |  16 +-
 arch/arm/boot/dts/qcom-msm8660-surf.dts            |   4 +-
 arch/arm/boot/dts/qcom-msm8960-cdp.dts             |   8 +-
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts   |  14 +-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  32 +-
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    | 115 ++-
 .../boot/dts/qcom-msm8974-sony-xperia-amami.dts    |  14 +-
 .../boot/dts/qcom-msm8974-sony-xperia-castor.dts   |  18 +-
 .../boot/dts/qcom-msm8974-sony-xperia-honami.dts   |  16 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  43 +
 arch/arm/boot/dts/qcom-msm8974pro.dtsi             |   5 +
 arch/arm/boot/dts/qcom-pmx55.dtsi                  |  84 ++
 arch/arm/boot/dts/qcom-sdx55-mtp.dts               | 251 ++++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  | 505 +++++++++++
 arch/arm/boot/dts/rk3036.dtsi                      |  83 +-
 arch/arm/boot/dts/rk322x.dtsi                      |  32 +-
 arch/arm/boot/dts/rk3288-miqi.dts                  |   5 +
 arch/arm/boot/dts/rk3288.dtsi                      | 115 ++-
 arch/arm/boot/dts/rk3xxx.dtsi                      | 106 +--
 arch/arm/boot/dts/rv1108.dtsi                      |  14 +
 arch/arm/boot/dts/socfpga_arria10.dtsi             |  13 +-
 arch/arm/boot/dts/ste-ab8500.dtsi                  |  64 +-
 arch/arm/boot/dts/ste-ab8505.dtsi                  |  67 +-
 arch/arm/boot/dts/ste-dbx5x0.dtsi                  |  12 +-
 arch/arm/boot/dts/ste-href.dtsi                    |  23 +-
 arch/arm/boot/dts/ste-href520-tvk.dts              |  42 +-
 arch/arm/boot/dts/ste-hrefprev60-stuib.dts         |  19 +
 arch/arm/boot/dts/ste-hrefprev60-tvk.dts           |  19 +
 arch/arm/boot/dts/ste-hrefprev60.dtsi              |   8 +-
 arch/arm/boot/dts/ste-hrefv60plus-stuib.dts        |  39 +
 arch/arm/boot/dts/ste-hrefv60plus-tvk.dts          |  39 +
 arch/arm/boot/dts/ste-hrefv60plus.dtsi             |  76 +-
 arch/arm/boot/dts/ste-nomadik-nhk15.dts            |   2 +-
 arch/arm/boot/dts/ste-nomadik-s8815.dts            |   2 +-
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi         |   2 +-
 arch/arm/boot/dts/ste-snowball.dts                 |   8 +-
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts     |  42 +-
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     | 930 +++++++++++++++++=
+++
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     |  41 +-
 arch/arm/boot/dts/stm32f429.dtsi                   |   2 +-
 arch/arm/boot/dts/stm32f746.dtsi                   |   4 +-
 arch/arm/boot/dts/stm32h743.dtsi                   |   2 +-
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |  40 +
 arch/arm/boot/dts/stm32mp151.dtsi                  |   9 +-
 arch/arm/boot/dts/stm32mp157a-stinger96.dtsi       |   4 -
 arch/arm/boot/dts/stm32mp157c-ed1.dts              |   4 -
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts          |  13 +-
 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     |  18 +-
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      |   4 -
 arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   |  16 +-
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |  23 +-
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |   4 -
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |   4 -
 arch/arm/boot/dts/sun4i-a10-a1000.dts              |   4 +-
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts         |   4 +-
 arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts   |   1 +
 arch/arm/boot/dts/sun4i-a10-inet1.dts              |   1 +
 arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts         |   2 +-
 arch/arm/boot/dts/sun4i-a10-marsboard.dts          |   8 +-
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts     |   2 +-
 arch/arm/boot/dts/sun4i-a10-pcduino.dts            |   4 +-
 arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts   |   1 +
 arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts       |   2 +-
 arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts       |   2 +-
 arch/arm/boot/dts/sun5i-a10s-mk802.dts             |   2 +-
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts   |   2 +-
 arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts      |   2 +-
 arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts           |   2 +-
 .../boot/dts/sun5i-a13-empire-electronix-d709.dts  |   1 +
 arch/arm/boot/dts/sun5i-a13-licheepi-one.dts       |   6 +-
 arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts    |   2 +-
 arch/arm/boot/dts/sun5i-a13-olinuxino.dts          |   2 +-
 .../boot/dts/sun5i-a13-pocketbook-touch-lux-3.dts  |   3 +-
 arch/arm/boot/dts/sun5i-a13.dtsi                   |   2 +-
 arch/arm/boot/dts/sun5i-gr8-evb.dts                |   2 +-
 .../boot/dts/sun5i-reference-design-tablet.dtsi    |   1 +
 arch/arm/boot/dts/sun5i.dtsi                       |  12 +
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts        |   2 +-
 arch/arm/boot/dts/sun6i-a31-i7.dts                 |   2 +-
 arch/arm/boot/dts/sun6i-a31-m9.dts                 |   4 +-
 arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts   |   4 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                   |   4 +-
 arch/arm/boot/dts/sun6i-a31s-primo81.dts           |   3 +-
 arch/arm/boot/dts/sun6i-a31s-sina31s-core.dtsi     |   2 +-
 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts   |  79 +-
 .../dts/sun6i-a31s-yones-toptech-bs1078-v2.dts     |   2 +-
 .../boot/dts/sun6i-reference-design-tablet.dtsi    |   2 +-
 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts   |   4 +-
 arch/arm/boot/dts/sun7i-a20-bananapi.dts           |   2 +-
 arch/arm/boot/dts/sun7i-a20-bananapro.dts          |   4 +-
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts        |   4 +-
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts         |   8 +-
 arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts          |   4 +-
 arch/arm/boot/dts/sun7i-a20-itead-ibox.dts         |   4 +-
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts          |   2 +-
 arch/arm/boot/dts/sun7i-a20-m3.dts                 |   2 +-
 arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts     |   2 +-
 arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts  |   6 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts     |   2 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts    |   2 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts    |   2 +-
 arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts      |   4 +-
 arch/arm/boot/dts/sun7i-a20-orangepi.dts           |   2 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts      |   6 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts           |   4 +-
 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts     |   1 +
 arch/arm/boot/dts/sun7i-a20.dtsi                   |   2 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |   2 +-
 arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts     |   2 +-
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts          |   4 +-
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts     |   3 +-
 arch/arm/boot/dts/sun8i-a33.dtsi                   |   2 +-
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts       |   4 +-
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts   |   8 +-
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts          |   2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  |   3 -
 .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    |  30 +
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts          |   4 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-duo2.dts         |   4 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts      |   4 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts           |   4 +-
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi             |   4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus2.dts |   4 +-
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts       |   8 +-
 arch/arm/boot/dts/sun8i-r16-parrot.dts             |  10 +-
 arch/arm/boot/dts/sun8i-r40.dtsi                   |  19 +
 .../boot/dts/sun8i-reference-design-tablet.dtsi    |   3 +-
 arch/arm/boot/dts/sun8i-s3-elimo-impetus.dtsi      |   2 +-
 arch/arm/boot/dts/sun8i-s3-pinecube.dts            |  11 +-
 arch/arm/boot/dts/sun8i-v3-sl631-imx179.dts        |  12 +
 arch/arm/boot/dts/sun8i-v3-sl631.dtsi              | 138 +++
 arch/arm/boot/dts/sun8i-v3s.dtsi                   |  17 +-
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts        |   4 +-
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi      |   1 +
 arch/arm/boot/dts/tegra30-ouya.dts                 |   4 +-
 arch/arm/boot/dts/zynq-ebaz4205.dts                | 132 +++
 arch/arm/include/asm/Kbuild                        |   1 -
 arch/arm/mach-imx/suspend-imx6.S                   |   1 +
 arch/arm64/Kconfig.platforms                       |   5 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-a64-bananapi-m64.dts |   6 +-
 .../boot/dts/allwinner/sun50i-a64-nanopi-a64.dts   |   2 +-
 .../boot/dts/allwinner/sun50i-a64-pine64-lts.dts   |  11 +
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     |   5 +-
 .../dts/allwinner/sun50i-a64-pinephone-1.0.dts     |   2 +-
 .../dts/allwinner/sun50i-a64-pinephone-1.1.dts     |   2 +-
 .../dts/allwinner/sun50i-a64-pinephone-1.2.dts     |   2 +-
 .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi   |  18 +-
 .../allwinner/sun50i-a64-pinetab-early-adopter.dts |  26 +
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts      |   2 +-
 .../dts/allwinner/sun50i-a64-sopine-baseboard.dts  |   1 +
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi      |   1 -
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts      |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |   6 +-
 .../dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts   |   4 +-
 .../boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts   |   4 +-
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |   4 +-
 .../dts/allwinner/sun50i-h5-orangepi-prime.dts     |   4 +-
 .../dts/allwinner/sun50i-h5-orangepi-zero-plus.dts |   4 +-
 .../allwinner/sun50i-h5-orangepi-zero-plus2.dts    |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |  13 +
 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   |   2 +-
 .../boot/dts/allwinner/sun50i-h6-cpu-opp.dtsi      |  20 +-
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    |   4 +-
 .../boot/dts/allwinner/sun50i-h6-orangepi.dtsi     |   4 +-
 .../dts/allwinner/sun50i-h6-pine-h64-model-b.dts   |  15 +
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts      |   7 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |  26 +
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   4 +-
 arch/arm64/boot/dts/amlogic/Makefile               |   4 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   2 +-
 .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts | 133 +++
 .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |   2 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  16 +-
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      |   2 +-
 .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |   2 +-
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |   2 +-
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |   2 +-
 .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |   2 +-
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |   2 +-
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      |   2 +-
 .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |   2 +-
 .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |   2 +-
 .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |   6 +-
 .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |   2 +-
 .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |   2 +-
 .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   6 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  21 +-
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   7 +-
 .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts | 429 +---------
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |  96 +++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  | 442 ++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |  10 +-
 arch/arm64/boot/dts/broadcom/bcm4908/Makefile      |   1 +
 .../broadcom/bcm4908/bcm4906-netgear-r8000p.dts    |  52 ++
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4906.dtsi  |  18 +
 .../broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts    |  51 ++
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  | 117 ++-
 .../boot/dts/broadcom/stingray/bcm958742-base.dtsi |  64 --
 .../boot/dts/broadcom/stingray/stingray-sata.dtsi  | 278 ------
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |   7 -
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |   4 +-
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   2 +-
 arch/arm64/boot/dts/freescale/Makefile             |   8 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts |  21 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts  |   5 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts  |  50 ++
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |  60 +-
 .../fsl-ls1028a-kontron-kbox-a-230-ls.dts          |   4 +
 .../freescale/fsl-ls1028a-kontron-sl28-var1.dts    |  62 ++
 .../fsl-ls1028a-kontron-sl28-var3-ads2.dts         |   5 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |   8 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |  16 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     | 184 ++--
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  98 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  |   3 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  98 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts  |   6 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     | 122 ++-
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |  17 +-
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi     |  17 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi |   4 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     | 118 ++-
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |   3 +-
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |  12 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts  |  10 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |  24 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     | 147 +++-
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  |   2 +
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |   1 -
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |   4 +-
 .../boot/dts/freescale/imx8mm-nitrogen-r2.dts      | 393 +++++++++
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   | 495 +++++++++++
 .../boot/dts/freescale/imx8mm-venice-gw71xx-0x.dts |  19 +
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   | 186 ++++
 .../boot/dts/freescale/imx8mm-venice-gw72xx-0x.dts |  20 +
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   | 311 +++++++
 .../boot/dts/freescale/imx8mm-venice-gw73xx-0x.dts |  19 +
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   | 362 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  23 +-
 .../dts/freescale/imx8mn-beacon-baseboard.dtsi     | 307 +++++++
 .../arm64/boot/dts/freescale/imx8mn-beacon-kit.dts |  19 +
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      | 466 ++++++++++
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |  75 ++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  46 +-
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   | 161 ++++
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     | 293 +++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  25 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |  20 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |   6 +
 .../arm64/boot/dts/freescale/imx8mq-librem5-r4.dts |  35 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  | 113 ++-
 .../boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts   |  93 ++
 .../boot/dts/freescale/imx8mq-zii-ultra-zest.dts   |  30 +
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi | 118 ++-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  72 +-
 arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi   |   6 +-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |   6 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi          |  77 ++
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi     |   8 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |   8 +-
 .../arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi | 632 +++++++++++++-
 arch/arm64/boot/dts/hisilicon/hip05.dtsi           |   2 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi           |   6 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi           |   9 +-
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |  53 ++
 .../boot/dts/marvell/armada-3720-espressobin.dtsi  |   2 -
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |   2 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |   2 +
 arch/arm64/boot/dts/marvell/armada-ap807.dtsi      |   5 +
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi      |   3 +
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |  10 +
 arch/arm64/boot/dts/marvell/cn9130-db.dts          |   2 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 arch/arm64/boot/dts/mediatek/mt6779.dtsi           |  17 +
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           |   2 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |  12 +
 .../boot/dts/mediatek/mt8183-kukui-krane-sku0.dts  |  23 +
 .../dts/mediatek/mt8183-kukui-krane-sku176.dts     |   5 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  46 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  26 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  57 ++
 arch/arm64/boot/dts/mediatek/mt8516.dtsi           |  30 +
 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 742 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  22 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   8 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 595 ++++++++++++-
 .../dts/nvidia/tegra194-p3509-0000+p3668-0000.dts  | 339 +-------
 .../dts/nvidia/tegra194-p3509-0000+p3668-0001.dts  |  10 +
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 351 ++++++++
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 282 +------
 .../arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi |  19 +
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     | 284 +++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  48 ++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 299 +++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 175 ++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 261 +++++-
 arch/arm64/boot/dts/qcom/Makefile                  |  15 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |   4 +
 .../apq8094-sony-xperia-kitakami-karin_windy.dts   |  23 +
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      | 291 +++++++
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     | 195 +++++
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      | 267 ++++++
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi         |  16 +
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |  10 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  20 +-
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     |  41 +-
 .../qcom/msm8992-msft-lumia-octagon-talkman.dts    |  15 +
 .../boot/dts/qcom/msm8992-msft-lumia-talkman.dts   |  67 --
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |  92 +-
 arch/arm64/boot/dts/qcom/msm8992.dtsi              | 743 +---------------
 .../boot/dts/qcom/msm8994-msft-lumia-cityman.dts   |  73 --
 .../qcom/msm8994-msft-lumia-octagon-cityman.dts    |  15 +
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 909 +++++++++++++++++=
+++
 .../dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts  |  26 +
 .../qcom/msm8994-sony-xperia-kitakami-karin.dts    |  45 +
 .../qcom/msm8994-sony-xperia-kitakami-satsuki.dts  |  18 +
 .../qcom/msm8994-sony-xperia-kitakami-sumire.dts   |   4 +-
 .../qcom/msm8994-sony-xperia-kitakami-suzuran.dts  |  20 +
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     | 457 +++++++---
 arch/arm64/boot/dts/qcom/msm8994.dtsi              | 321 +++++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   4 +
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |  16 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |  10 +
 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi         | 108 ---
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 393 ++++++++-
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |  12 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |  12 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |  12 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |   8 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           | 563 +++++++++++-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  91 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  49 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  12 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   4 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 623 ++++++++++++++
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |  19 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |  23 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   1 +
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   2 +-
 arch/arm64/boot/dts/qcom/sdm850.dtsi               |  21 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 158 ++++
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            | 269 ++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 940 +++++++++++++++++=
+++-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            | 250 ++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 499 +++++++++++
 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi | 137 ++-
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |  47 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   2 +
 .../boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts |  41 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  32 +
 .../boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts |  66 ++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  32 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  17 +
 .../boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts |  71 ++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |  32 +
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  65 ++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  65 ++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          | 135 +++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  65 ++
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |   2 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |   2 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  65 ++
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |   2 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          | 135 +++
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      | 138 +++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   6 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 837 +++++++++++++++++=
+
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   2 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   2 +
 arch/arm64/boot/dts/rockchip/Makefile              |   2 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  83 +-
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |  63 +-
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts |   3 +-
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  | 382 +++++++++
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |  56 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  33 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |  62 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dts  |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dts |  52 ++
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |   1 -
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dts    |  53 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |  29 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 109 ++-
 arch/arm64/boot/dts/synaptics/as370.dtsi           |   4 +-
 arch/arm64/boot/dts/synaptics/berlin4ct.dtsi       |  12 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |   4 +-
 arch/arm64/boot/dts/ti/k3-am65.dtsi                |   2 +-
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |  38 +
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          | 161 +++-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |  42 +-
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi        |  80 +-
 arch/arm64/boot/dts/ti/k3-j7200.dtsi               |   2 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          |  70 +-
 arch/arm64/boot/dts/ti/k3-j721e.dtsi               |   2 +-
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts   |   9 +
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi          |  23 +
 arch/arm64/boot/dts/xilinx/Makefile                |   1 +
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi     |  22 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts  |  33 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts  |  94 ++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts  |  40 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts  | 293 +++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts  |  89 ++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts  |  70 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             | 128 ++-
 arch/arm64/include/asm/Kbuild                      |   1 -
 arch/csky/include/asm/Kbuild                       |   1 -
 arch/h8300/include/asm/Kbuild                      |   1 -
 arch/hexagon/include/asm/Kbuild                    |   1 -
 arch/ia64/include/asm/local64.h                    |   1 -
 arch/ia64/mm/init.c                                |   4 +-
 arch/m68k/include/asm/Kbuild                       |   1 -
 arch/microblaze/include/asm/Kbuild                 |   1 -
 arch/mips/include/asm/Kbuild                       |   1 -
 arch/nds32/include/asm/Kbuild                      |   1 -
 arch/openrisc/include/asm/Kbuild                   |   1 -
 arch/parisc/include/asm/Kbuild                     |   1 -
 arch/powerpc/include/asm/Kbuild                    |   1 -
 arch/riscv/include/asm/Kbuild                      |   1 -
 arch/s390/Kconfig                                  |  31 +-
 arch/s390/configs/debug_defconfig                  |  12 +-
 arch/s390/configs/defconfig                        |  11 +-
 arch/s390/configs/zfcpdump_defconfig               |   2 +
 arch/s390/include/asm/Kbuild                       |   1 -
 arch/sh/include/asm/Kbuild                         |   1 -
 arch/sparc/include/asm/Kbuild                      |   1 -
 arch/x86/include/asm/local64.h                     |   1 -
 arch/xtensa/include/asm/Kbuild                     |   1 -
 block/blk-core.c                                   |  13 +-
 block/blk-mq-debugfs.c                             |   2 +-
 block/blk-mq.c                                     |   4 +-
 block/blk-pm.c                                     |  15 +-
 block/blk-pm.h                                     |  14 +-
 drivers/cpufreq/intel_pstate.c                     |   1 -
 drivers/firmware/imx/Kconfig                       |   1 +
 drivers/ide/ide-atapi.c                            |   1 -
 drivers/ide/ide-io.c                               |   7 +-
 drivers/ide/ide-pm.c                               |   2 +-
 drivers/idle/intel_idle.c                          |  41 +-
 drivers/md/dm-crypt.c                              |   7 +-
 drivers/opp/core.c                                 |   9 +-
 drivers/scsi/cxgbi/cxgb4i/Kconfig                  |   1 +
 drivers/scsi/mpt3sas/mpt3sas_base.c                |   2 +-
 drivers/scsi/scsi_lib.c                            |  27 +-
 drivers/scsi/scsi_transport_spi.c                  |  27 +-
 drivers/scsi/ufs/ufs-mediatek-trace.h              |   2 +-
 drivers/scsi/ufs/ufs-mediatek.c                    |  21 +
 drivers/scsi/ufs/ufs-mediatek.h                    |   1 +
 drivers/scsi/ufs/ufs.h                             |   2 +-
 drivers/scsi/ufs/ufshcd-pci.c                      |  73 +-
 drivers/scsi/ufs/ufshcd.c                          |  45 +-
 drivers/scsi/ufs/ufshcd.h                          |  14 +-
 drivers/soc/imx/Kconfig                            |   2 +-
 fs/block_dev.c                                     |   2 +-
 fs/ceph/mds_client.c                               |  53 +-
 fs/file.c                                          |   2 -
 fs/io_uring.c                                      |  60 +-
 include/asm-generic/Kbuild                         |   1 +
 include/dt-bindings/clock/tegra210-car.h           |   2 +-
 include/linux/blk-mq.h                             |   4 +-
 include/linux/blkdev.h                             |  18 +-
 include/linux/build_bug.h                          |   5 -
 include/linux/ceph/msgr.h                          |   4 +-
 include/linux/kdev_t.h                             |  22 +-
 include/linux/mm.h                                 |  12 +-
 include/linux/sizes.h                              |   3 +
 kernel/cgroup/cgroup-v1.c                          |   2 +
 kernel/cgroup/cgroup.c                             |  30 +-
 kernel/exit.c                                      |   2 +
 kernel/workqueue.c                                 |  13 +-
 lib/genalloc.c                                     |  25 +-
 lib/zlib_dfltcc/Makefile                           |   2 +-
 lib/zlib_dfltcc/dfltcc.c                           |   6 +-
 lib/zlib_dfltcc/dfltcc_deflate.c                   |   3 +
 lib/zlib_dfltcc/dfltcc_inflate.c                   |   4 +-
 lib/zlib_dfltcc/dfltcc_syms.c                      |  17 -
 mm/hugetlb.c                                       |  22 +-
 mm/kasan/generic.c                                 |   2 +
 mm/memory.c                                        |   8 +-
 mm/memory_hotplug.c                                |   2 +-
 mm/mremap.c                                        |   4 +-
 mm/page_alloc.c                                    |   8 +-
 mm/slub.c                                          |   5 +-
 net/ceph/messenger_v2.c                            |  15 +-
 scripts/checkpatch.pl                              |   6 +
 scripts/depmod.sh                                  |   2 +
 tools/testing/selftests/vm/Makefile                |  10 +-
 659 files changed, 31614 insertions(+), 4712 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/imx/imx8m-soc.yam=
l
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt
 create mode 100644 Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.ya=
ml
 delete mode 100644 arch/alpha/include/asm/local64.h
 create mode 100644 arch/arm/boot/dts/am335x-myirtech-myc.dtsi
 create mode 100644 arch/arm/boot/dts/am335x-myirtech-myd.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-plybas.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-plym2m.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-prtmvt.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-victgo.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-vicut1.dts
 create mode 100644 arch/arm/boot/dts/imx6q-vicut1.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-vicut1.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qp-vicutp.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-prti6g.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity-breadbee-common.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dts
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dts
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts
 create mode 100644 arch/arm/boot/dts/qcom-pmx55.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx55.dtsi
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-janice.dts
 create mode 100644 arch/arm/boot/dts/sun8i-v3-sl631-imx179.dts
 create mode 100644 arch/arm/boot/dts/sun8i-v3-sl631.dtsi
 create mode 100644 arch/arm/boot/dts/zynq-ebaz4205.dts
 create mode 100644
arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
 create mode 100644
arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/bcm4906.dtsi
 delete mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-sata.dts=
i
 create mode 100644
arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.d=
ts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.d=
ts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.d=
ts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.d=
tsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rd=
k.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dt=
s
 create mode 100644
arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
 create mode 100644
arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dts=
i
 create mode 100644
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.d=
ts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.d=
ts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
 delete mode 100644 arch/ia64/include/asm/local64.h
 delete mode 100644 arch/x86/include/asm/local64.h
 delete mode 100644 lib/zlib_dfltcc/dfltcc_syms.c
