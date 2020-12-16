Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AAFC4361B
	for <soc@archiver.kernel.org>; Wed, 16 Dec 2020 23:26:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DEF87238D7; Wed, 16 Dec 2020 23:26:34 +0000 (UTC)
X-Gm-Message-State: AOAM531u9nWyBa45cFvW4yAyj/bzSetoXCAF9UHlt9ktsWguh3eLQvMU
	BXhspd/1i0WpV2DDgw2p86IqjFRWtoa1Ddz43DI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608161194;
	bh=iEswpa0Wwl4+zAiFDPhxR7UGSIIJ3DWyFuYtoj8KVeA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=rjQDI1ITp6MKvWa8imsqtC1CluSRY+PlvS8aiVsyy6XgwwjzTpWvn8o+Lgy+IzqNE
	 zp38r+mAOfWntcFpRORsuIFiO3EjvTaWvRkQ9OHcy2m+M3eE0JiDv+4Z0QItTpY2nb
	 Nrt7YCRAfcTFnY4kOqmSN/z6l0s86e1i5x5JG5SDWlfo3a4dh1SJa9HHpa21w2OiIM
	 MAs3AWKVMoM/D/FQF6T8Peff2xU2JN5Uy1ILD6i9lyewAIbQA7QX2vwHKbDcwEyu4U
	 +F2CAWY4mBD85Humwpc9JP25Sly8VRLCdJm/4cufe64Y69EUeJjO/6dU2ZswMfQoQZ
	 MZlH97Wxy3jaw==
X-Google-Smtp-Source: ABdhPJzzjDN0lAfUkiVKsCDTPAdBHXk56HBcd8C7u8yZYzvn9hYpjSRuIylOgI0qZYdZXnR5Btj59D3STIXlI2yZ9vM=
X-Received: by 2002:a9d:be1:: with SMTP id 88mr27732006oth.210.1608161193334;
 Wed, 16 Dec 2020 15:26:33 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
In-Reply-To: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 17 Dec 2020 00:26:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0hXcgTioiGi+CGrF6ePbkSSUkNpt7xE4ks=zeMjeyBSw@mail.gmail.com>
Message-ID: <CAK8P3a0hXcgTioiGi+CGrF6ePbkSSUkNpt7xE4ks=zeMjeyBSw@mail.gmail.com>
Subject: [GIT PULL 3/5] ARM: device tree updates for 5.11
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit f8394f232b1eab649ce2df5c5f15b0e528c92091=
:

  Linux 5.10-rc3 (2020-11-08 16:10:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-dt=
-5.11

for you to fetch changes up to 13719d8d0d67998435c5748998ef686a10eefb4a:

  Merge branch 'sparx5-next' of
https://github.com/microchip-ung/linux-upstream into arm/dt
(2020-12-10 15:40:09 +0100)

----------------------------------------------------------------
ARM: device tree updates for 5.11

Across all platforms, there is a continued move towards DT schema for
validating the dts files. As a result there are bug fixes for mistakes
that are found using these schema, in addition to warnings from the
dtc compiler.

As usual, many changes are for adding support for additional on-chip
and on-board components in the machines we already support.

The newly supported SoCs for this release are:

 - MStar Infinity2M, a low-end IP camera chip based on a dual-core
   Cortex-A7, otherwise similar to the Infinity chip we already support.
   This is also known as the SigmaStar SSD202D, and we add support for
   the Honestar ssd201htv2 development kit.

 - Nuvoton NPCM730, a Cortex-A9 based Baseboard Management Controller
   (BMC), in the same family as the NPCM750. This gets used in the Ampere
   Altra based "Fii Kudo" server and the Quanta GSJ, both of which are
   added as well.

 - Broadcom BCM4908, a 64-bit home router chip based on Broadcom's own
   Brahma-B53 CPU. Support is also added for the Asus ROG Rapture
   GT-AC5300 high-end WiFi router based on this chip.

 - Mediatek MT8192 is a new SoC based on eight Cortex-A76/A55 cores,
   meant for faster Chromebooks and tablets. It gets added along with
   its reference design.

 - Mediatek MT6779 (Helio P90) is a high-end phone chip from last year's
   generation, also added along with its reference board.  This one is
   still based on Cortex-A75/A55.

 - Mediatek MT8167 is a version of the already supported MT8516 chip,
   both based on Cortex-A35. It gets added along with the "Pumpkin"
   single board computer, but is likely to also make its way into low-end
   tablets in the future.

For the already supported chips, there are a number of new boards.
Interestingly there are more 32-bit machines added this time than
64-bit. Here is a brief list of the new boards:

 - Three new Mikrotik router variants based on Marvell Prestera
   98DX3236, a close relative of the more common Armada XP

 - A reference board for the Marvell Armada 382

 - Three new servers using ASpeed baseboard management controllers,
   the actual machines being from Bytedance, Facebook and IBM,
   and one machine using the Nuvoton NPCM750 BMC.

 - The Galaxy Note 10.1 (P4) tablet, using an Exynos 4412.

 - The usual set of 32-bit i.MX industrial/embedded hardware:
   * Protonic WD3 (tractor e-cockpit)
   * Kamstrup OMNIA Flex Concentrator (smart grid platform)
   * Van der Laan LANMCU (food storage)
   * Altesco I6P (vehicle inspection stations)
   * PHYTEC phyBOARD-Segin/phyCORE-i.MX6UL baseboard

 - DH electronics STM32MP157C DHCOM, a PicoITX carrier board
   for the aleady supported DHCOM module

 - Three new Allwinner SoC based single-board computers:
   * NanoPi R1 (H3 based)
   * FriendlyArm ZeroPi (H3 based)
   * Elimo Initium SBC (S3 based)

 - Ouya Game Console based on Nvidia Tegra 3

 - Version 5 of the already supported Zynq Z-Turn MYIR Board

 - LX2162AQDS, a reference platform for NXP Layerscape
   LX2162A, which is a repackaged 16-core LX2160A

 - A series of Kontron i.MX8M Mini baseboard/SoM versions

 - Espressobin Ultra, a new variant of the popular Armada 3700 based board,

 - IEI Puzzle-M801, a rackmount network appliance based on
   Marvell Armada 8040

 - Microsoft Lumia 950 XL, a phone

 - HDK855 and HDK865 Hardware development kits for Qualcomm
   sm8250 and sm8150, respectively

 - Three new board variants of the "Trogdor" Chromebook
   (sc7180)

 - New board variants of the Renesas based "Kingfisher" and
   "HiHope" reference boards

 - Kobol Helios64, an open source NAS appliance based on Rockchips
   RK3399

 - Engicam PX30.Core, a SoM based on Rockchip PX30, along with
   a few carrier boards.

There is one conflict in mt6577_auxadc.txt, which got replaced in
another tree and modified here, the modification is already part of
the new file.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Adam Ford (11):
      arm64: dts: imx8mm-beacon-som: Configure supplies on secondary cpus
      arm64: dts: imx8mm-beacon-som: Add QSPI NOR flash support
      arm64: dts: imx8mm: Add support for micfil
      arm64: dts: imx8mm: Add node for SPDIF
      arm64: dts: imx8mm-beacon-som: Fix whitespace issue
      arm64: dts: imx8mn: Enable Asynchronous Sample Rate Converter
      arm64: dts: imx8mn: Add SAI nodes
      arm64: dts: imx8mn: Add support for micfil
      arm64: dts: imx8mn: Add node for SPDIF
      arm64: dts: imx8mm-beacon-som: Configure RTC aliases
      arm64: dts: imx8mm-beacon-som: Assign PMIC clock

Adrian Schmutzler (1):
      ARM: dts: kirkwood: replace status value "ok" by "okay"

Ahmad Fatoum (5):
      dt-bindings: arm: stm32: add simple-mfd compatible for tamp node
      ARM: dts: stm32: support child mfd cells for the stm32mp1 TAMP syscon
      dt-bindings: vendor-prefixes: document Octavo Systems oct prefix
      dt-bindings: arm: stm32: add extra SiP compatible for lxa,stm32mp157c=
-mc1
      ARM: dts: stm32: lxa-mc1: add OSD32MP15x to list of compatibles

Ajit Pandey (1):
      arm64: dts: qcom: sc7180: Add lpass cpu node for I2S driver

Akhil P Oommen (1):
      arm64: dts: qcom: sc7180: Add gpu cooling support

Alex Elder (3):
      arm64: dts: qcom: sc7180: limit IPA iommu streams
      arm64: dts: qcom: sc7180: use GIC_SPI for IPA interrupts
      arm64: dts: qcom: sdm845: use GIC_SPI for IPA interrupts

Alexander Dahl (5):
      ARM: dts: exynos: Fix schema warnings for pwm-leds
      ARM: dts: at91: smartkiz: Reference led node directly
      ARM: dts: at91: Fix schema warnings for pwm-leds
      ARM: dts: imx: Fix schema warnings for pwm-leds
      ARM: dts: omap: Fix schema warnings for pwm-leds

Alexander Shiyan (1):
      ARM: dts: am335x: Fix comments for AM335X_PIN_GPMC_WPN pin in GPIO mo=
de

Alexandre Belloni (4):
      ARM: dts: at91: kizbox: switch to new pwm-atmel-tcb binding
      ARM: dts: at91: sama5d3: use proper ADC compatible
      ARM: dts: at91: at91sam9rl: fix ADC triggers
      ARM: dts: at91: remove deprecated ADC properties

Alexandre GRIVEAUX (1):
      ARM: zynq: Add Z-turn board V5

Alexandru Stan (2):
      ARM: dts: rockchip: Remove 0 point from brightness-levels on rk3288-v=
eyron
      arm64: dts: qcom: trogdor: Add brightness-levels

Alexis Ballier (1):
      arm64: dts: rockchip: Properly define the type C connector on
rk3399-orangepi

Amelie Delaunay (7):
      dt-bindings: connector: add typec-power-opmode property to usb-connec=
tor
      dt-bindings: usb: Add DT bindings for STUSB160x Type-C controller
      ARM: dts: stm32: add STUSB1600 Type-C using I2C4 on stm32mp15xx-dkx
      ARM: dts: stm32: fix mdma1 clients channel priority level on stm32mp1=
51
      ARM: dts: stm32: fix dmamux reg property on stm32mp151
      ARM: dts: stm32: fix dmamux reg property on stm32h743
      ARM: dts: stm32: adjust USB OTG gadget fifo sizes in stm32mp151

Andre Heider (2):
      arm64: dts: marvell: espressobin: Simplify v7 ethernet port labeling
      arm64: dts: marvell: espressobin: Get rid of duplicate serial aliases

Andrew Jeffery (4):
      ARM: dts: tacoma: Fix node vs reg mismatch for flash memory
      ARM: dts: rainier: Add reserved memory for ramoops
      ARM: dts: tacoma: Add reserved memory for ramoops
      ARM: dts: aspeed: rainier: Don't shout addresses

Anson Huang (4):
      arm64: dts: imx8mn-evk: Add cpu-supply to enable cpufreq
      arm64: dts: imx8mm: Correct WDOG_B pin configuration
      arm64: dts: imx8mn: Correct WDOG_B pin configuration
      arm64: dts: imx8mp-evk: Correct WDOG_B pin configuration

Antony Wang (1):
      arm64: qcom: sc7180: trogdor: Add ADC nodes and thermal zone for
charger thermistor

Arnaud Pouliquen (1):
      ARM: dts: stm32: update stm32mp151 for remote proc synchronization su=
pport

Arnd Bergmann (39):
      Merge tag 'renesas-arm-dt-for-v5.11-tag1' of
git://git.kernel.org/.../geert/renesas-devel into arm/dt
      Merge tag 'renesas-dt-bindings-for-v5.11-tag1' of
git://git.kernel.org/.../geert/renesas-devel into arm/dt
      Merge tag 'samsung-dt-5.11' of
git://git.kernel.org/.../krzk/linux into arm/dt
      Merge tag 'ux500-dts-for-v5.11-1' of
git://git.kernel.org/.../linusw/linux-stericsson into arm/dt
      Merge tag 'hisi-arm32-dt-for-5.11' of
git://github.com/hisilicon/linux-hisi into arm/dt
      Merge tag 'hisi-arm64-dt-for-5.11' of
git://github.com/hisilicon/linux-hisi into arm/dt
      Merge tag 'omap-for-v5.11/dt-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/dt
      Merge tag 'stm32-dt-for-v5.11-1' of
git://git.kernel.org/.../atorgue/stm32 into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.11-tag2' of
git://git.kernel.org/.../geert/renesas-devel into arm/dt
      Merge tag 'tegra-for-5.11-dt-bindings' of
git://git.kernel.org/.../tegra/linux into arm/dt
      Merge tag 'tegra-for-5.11-arm-dt' of
git://git.kernel.org/.../tegra/linux into arm/dt
      Merge tag 'tegra-for-5.11-arm64-dt' of
git://git.kernel.org/.../tegra/linux into arm/dt
      Merge tag 'at91-dt-5.11' of git://git.kernel.org/.../at91/linux
into arm/dt
      Merge tag 'sunxi-dt-for-5.11' of
git://git.kernel.org/.../sunxi/linux into arm/dt
      Merge tag 'arm-soc/for-5.11/devicetree' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'arm-soc/for-5.11/devicetree-arm64' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'v5.10-next-dts64' of
git://git.kernel.org/.../matthias.bgg/linux into arm/dt
      Merge tag 'nuvoton-5.11-devicetree' of
git://git.kernel.org/.../joel/bmc into arm/dt
      Merge tag 'mvebu-dt-5.11-1' of
git://git.kernel.org/.../gclement/mvebu into arm/dt
      Merge tag 'mvebu-dt64-5.11-1' of
git://git.kernel.org/.../gclement/mvebu into arm/dt
      Merge tag 'ti-k3-dt-for-v5.11' of
git://git.kernel.org/.../nmenon/linux into arm/dt
      Merge tag 'qcom-arm64-for-5.11' of
git://git.kernel.org/.../qcom/linux into arm/dt
      Merge tag 'qcom-dts-for-5.11' of
git://git.kernel.org/.../qcom/linux into arm/dt
      Merge tag 'keystone_dts_for_5.11' of
git://git.kernel.org/.../ssantosh/linux-keystone into arm/dt
      Merge tag 'samsung-dt-5.11-2' of
git://git.kernel.org/.../krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.11' of
git://git.kernel.org/.../krzk/linux into arm/dt
      Merge tag 'amlogic-dt64' of
git://git.kernel.org/.../khilman/linux-amlogic into arm/dt
      Merge tag 'imx-bindings-5.11' of
git://git.kernel.org/.../shawnguo/linux into arm/dt
      Merge tag 'imx-dt-5.11' of
git://git.kernel.org/.../shawnguo/linux into arm/dt
      Merge tag 'imx-dt64-5.11' of
git://git.kernel.org/.../shawnguo/linux into arm/dt
      Merge tag 'at91-dt-5.11-2' of
git://git.kernel.org/.../at91/linux into arm/dt
      Merge tag 'v5.11-rockchip-dts64-1' of
git://git.kernel.org/.../mmind/linux-rockchip into arm/dt
      Merge tag 'v5.11-rockchip-dts32-1' of
git://git.kernel.org/.../mmind/linux-rockchip into arm/dt
      Merge tag 'samsung-dt-5.11-3' of
git://git.kernel.org/.../krzk/linux into arm/dt
      Merge tag 'amlogic-dt64-2' of
git://git.kernel.org/.../khilman/linux-amlogic into arm/dt
      Merge tag 'aspeed-5.11-devicetree' of
git://git.kernel.org/.../joel/aspeed into arm/dt
      Merge tag 'zynqmp-dt-for-v5.11' of
https://github.com/Xilinx/linux-xlnx into arm/dt
      Merge tag 'zynq-dt-for-v5.10' of
https://github.com/Xilinx/linux-xlnx into arm/dt
      Merge branch 'sparx5-next' of
https://github.com/microchip-ung/linux-upstream into arm/dt

Artem Lapkin (1):
      arm64: dts: meson: fix spi-max-frequency on Khadas VIM2

Artur =C5=9Awigo=C5=84 (1):
      ARM: dts: exynos: Add interconnects to Exynos4412 mixer

Aryan Srivastava (1):
      ARM: dts: mvebu: Add device tree for RD-AC3X-48G4X2XL board

Bartosz Golaszewski (1):
      ARM: dts: at91: at91-sama5d27_som1: fix EEPROM compatible

Biju Das (4):
      arm64: dts: renesas: hihope-rzg2-ex: Drop rxc-skew-ps from
ethernet-phy node
      arm64: dts: renesas: cat875: Remove rxc-skew-ps from ethernet-phy nod=
e
      arm64: dts: renesas: cat874: Move connector node out of hd3ss3220 dev=
ice
      arm64: dts: renesas: beacon-renesom-baseboard: Move connector
node out of hd3ss3220 device

Billy Tsai (1):
      ARM: dts: aspeed-g6: Fix the GPIO memory size

Bjorn Andersson (7):
      arm64: dts: qcom: sm8150-mtp: Specify remoteproc firmware
      arm64: dts: qcom: sdm845: Limit ipa iommu streams
      arm64: dts: qcom: c630: Re-enable apps_smmu
      arm64: dts: qcom: c630: Expose LID events
      arm64: dts: qcom: c630: Polish i2c-hid devices
      arm64: dts: qcom: c630: Fix pinctrl pins properties
      arm64: dts: qcom: c630: Define eDP bridge and panel

Bruno Thomsen (2):
      dt-bindings: fsl: add kamstrup flex concentrator to schema
      ARM: dts: imx7: add support for kamstrup flex concentrator

Carl Philipp Klemm (2):
      ARM: dts: mapphone: separate out xt894 specific things
      ARM: dts: xt875: add section for kionix kxtf9

Chen-Yu Tsai (4):
      arm64: dts: rockchip: Set dr_mode to "host" for OTG on rk3328-roc-cc
      arm64: dts: rockchip: Enable HDMI audio on rk3328-roc-cc
      arm64: dts: rockchip: Enable analog audio on rk3328-roc-cc
      arm64: dts: rockchip: Fix UART pull-ups on rk3328

Chris Packham (2):
      ARM: dts: Remove non-existent i2c1 from 98dx3236
      ARM: dts: Add i2c0 pinctrl information for 98dx3236

Christian Hewitt (16):
      arm64: dts: meson: remove empty lines from aml-s905x-cc v2 dts
      arm64: dts: meson: add watchdog to g12-common dtsi
      arm64: dts: meson: enable rtc node on Khadas VIM1/VIM2 boards
      arm64: dts: meson: Add capacity-dmips-mhz attributes to GXM
      arm64: dts: meson: add rtc aliases to meson-khadas-vim3.dtsi
      arm64: dts: meson: update the Khadas VIM3/3L LED bindings
      arm64: dts: meson: add KHAMSIN IR remote node to SML5442TW
      arm64: dts: meson: add audio playback to a95x
      arm64: dts: meson: add audio playback to khadas-vim
      arm64: dts: meson: add audio playback to khadas-vim2
      arm64: dts: meson: add audio playback to nanopi-k2
      arm64: dts: meson: add audio playback to odroid-c2
      arm64: dts: meson: add audio playback to wetek-hub
      arm64: dts: meson: add audio playback to wetek-play2
      arm64: dts: meson: minor fixups for Khadas VIM/VIM2 dts
      arm64: dts: meson: add i2c3/rtc nodes and vrtc alias to
GT-King/GT-King-Pro

Claudiu Beznea (2):
      ARM: dts: at91: sam9x60ek: remove bypass property
      ARM: dts: at91: sama5d2: map securam as device

Cristian Birsan (3):
      ARM: dts: at91: sam9x60: add pincontrol for USB Host
      ARM: dts: at91: sama5d4_xplained: add pincontrol for USB Host
      ARM: dts: at91: sama5d3_xplained: add pincontrol for USB Host

Daniel Palmer (13):
      ARM: mstar: Add gpio controller to MStar base dtsi
      ARM: mstar: Fill in GPIO controller properties for infinity
      dt-bindings: mstar: Add binding details for mstar,smpctrl
      dt-bindings: vendor-prefixes: Add honestar vendor prefix
      dt-bindings: mstar: Add Honestar SSD201_HT_V2 to mstar boards
      ARM: mstar: Add infinity2m support
      ARM: mstar: Add common dtsi for SSD201/SSD202D
      ARM: mstar: Add chip level dtsi for SSD202D
      ARM: mstar: Add dts for Honestar ssd201htv2
      ARM: mstar: Add smp ctrl registers to infinity2m dtsi
      ARM: mstar: Wire up smpctrl for SSD201/SSD202D
      ARM: mstar: SMP support
      dt-bindings: gpio: Add a binding header for the MSC313 GPIO driver

David Lechner (2):
      ARM: dts: am33xx: Add nodes for eQEP
      ARM: dts: am335x-boneblue: Enable eQEP

Dipen Patel (1):
      arm64: tegra: Wrong AON HSP reg property size

Dmitry Baryshkov (4):
      arm64: dts: qcom: enable rtc on qrb5165-rb5 board
      arm64: dts: qcom: enable rtc on sm8250-mtp board
      arm64: dts: qcom: sm8250: add iommus entry to QUP nodes
      arm64: dts: qcom: sm8250: correct compatible for sm8250-mtp

Dmitry Osipenko (19):
      dt-bindings: memory: tegra20: Add memory client IDs
      dt-bindings: memory: tegra30: Add memory client IDs
      dt-bindings: memory: tegra124: Add memory client IDs
      ARM: tegra: acer-a500: Correct thermal zone names
      ARM: tegra: acer-a500: Add power-supply to lvds-encoder node
      ARM: tegra: nexus7: Correct thermal zone names
      ARM: tegra: nexus7: Improve CPU passive-cooling threshold
      ARM: tegra: nexus7: Add power-supply to lvds-encoder node
      ARM: tegra: nexus7: Rename gpio-hog nodes
      ARM: tegra: nexus7: Use panel-lvds as the only panel compatible
      ARM: tegra: Correct EMC registers size in Tegra20 device-tree
      ARM: tegra: acer-a500: Add Embedded Controller
      ARM: tegra: Add interconnect properties to Tegra20 device-tree
      ARM: tegra: Add interconnect properties to Tegra30 device-tree
      ARM: tegra: Add interconnect properties to Tegra124 device-tree
      ARM: tegra: Add nvidia,memory-controller phandle to Tegra20 EMC
device-tree
      ARM: tegra: Add EMC OPP properties to Tegra20 device-trees
      ARM: tegra: Add EMC OPP and ICC properties to Tegra30 EMC and
ACTMON device-tree nodes
      ARM: tegra: Add EMC OPP and ICC properties to Tegra124 EMC and
ACTMON device-tree nodes

Dong Aisheng (2):
      dt-bindings: firmware: imx-scu: new binding to parse clocks from
device tree
      dt-bindings: clock: imx-lpcg: add support to parse clocks from device=
 tree

Dongjin Kim (1):
      arm64: dts: meson-sm1: fix typo in opp table

Douglas Anderson (4):
      arm64: dts: qcom: sc7180: Fix one forgotten interconnect reference
      arm64: dts: qcom: sc7180: Provide pinconf for SPI to use GPIO for CS
      arm64: dts: qcom: Switch sc7180-trogdor to control SPI CS via GPIO
      arm64: dts: qcom: sc7180: Assign numbers to eMMC and SD

Eddie Cai (1):
      arm64: dts: rockchip: add isp and sensors for Scarlet

Eddie James (2):
      ARM: dts: aspeed: rainier: Add 4U device-tree
      ARM: dts: aspeed: rainier: Mark FSI SPI controllers as restricted

Enric Balletbo i Serra (7):
      arm64: dts: mt8173-elm: Remove ddc property from panel
      dt-bindings: power: Add bindings for the Mediatek SCPSYS power
domains controller
      dt-bindings: power: Add MT8183 power domains
      arm64: dts: mediatek: Add mt8173 power domain controller
      arm64: dts: mediatek: Add smi_common node for MT8183
      arm64: dts: mt8183: Add iommu and larb nodes
      arm64: dts: mt8183: Add display nodes for MT8183

Eugeniu Rosca (3):
      dt-bindings: arm: renesas: Add R-Car M3-W+ ULCB with Kingfisher
      arm64: dts: renesas: r8a77961: Add CAN{0,1} placeholder nodes
      arm64: dts: renesas: r8a77961: ulcb-kf: Initial device tree

Evan Green (1):
      arm64: dts: qcom: sc7180: Add soc-specific qfprom compat string

Fabien Parent (9):
      arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells value
      dt-bindings: iio: adc: auxadc: add doc for MT8516 SoC
      arm64: dts: mediatek: mt8516: add auxadc node
      arm64: dts: mediatek: mt8516: rename usb phy
      arm64: dts: mediatek: mt8516: add usb1 node
      arm64: dts: mediatek: mt8516: add efuse node
      dt-bindings: arm64: dts: mediatek: Add mt8167-pumpkin board
      arm64: dts: mediatek: add dtsi for MT8167
      arm64: dts: mediatek: add MT8167 pumpkin board dts

Fabrice Gasnier (2):
      ARM: dts: stm32: Add LP timer irqs on stm32mp151
      ARM: dts: stm32: Add LP timer wakeup-source on stm32mp151

Fabrizio Castro (1):
      arm64: dts: renesas: r8a77965: Add DRIF support

Faiz Abbas (2):
      arm64: dts: ti: k3-j721e-main: Add output tap delay values
      arm64: dts: ti: k3-j721e-common-proc-board: Add support for SD
card UHS modes

Florian Fainelli (10):
      dt-bindings: net: dsa: Extend switch nodes pattern
      dt-bindings: net: dsa: Document sfp and managed properties
      ARM: dts: BCM5301X: Update Ethernet switch node name
      ARM: dts: BCM5301X: Add a default compatible for switch node
      ARM: dts: BCM5301X: Provide defaults ports container node
      ARM: dts: NSP: Update ethernet switch node name
      ARM: dts: NSP: Fix Ethernet switch SGMII register name
      ARM: dts: NSP: Add a SRAB compatible string for each board
      ARM: dts: NSP: Provide defaults ports container node
      Merge tag 'tags/bcm2835-dt-next-2020-11-20' into devicetree/next

Fran Hsu (2):
      ARM: dts: nuvoton: Add Quanta GSJ BMC pinctrl
      ARM: dts: nuvoton: Add Quanta GSJ BMC

Frank Wunderlich (2):
      dts64: mt7622: enable all pwm for bananapi r64
      dts64: mt7622: disable spi1 and uart2 because pins are used by pwm

Frieder Schrempf (2):
      dt-bindings: arm: fsl: Add Kontron i.MX8M Mini SoMs and boards
      arm64: dts: Add the Kontron i.MX8M Mini SoMs and baseboards

Geert Uytterhoeven (3):
      arm64: dts: renesas: r8a77961: Add MSIOF nodes
      arm64: dts: renesas: rcar-gen3: Convert EtherAVB to explicit
delay handling
      arm64: dts: renesas: rzg2: Convert EtherAVB to explicit delay handlin=
g

George Liu (1):
      ARM: dts: Fix label address for 64MiB OpenBMC flash layout

Georgi Djakov (3):
      dt-bindings: interconnect: sdm845: Add IDs for the QUP ports
      interconnect: qcom: sdm845: Add the missing nodes for QUP
      arm64: dts: sdm845: Add interconnect properties for QUP

Grygorii Strashko (1):
      arm64: dts: ti: k3-am65: ringacc: drop ti, dma-ring-reset-quirk

H. Nikolaus Schaller (2):
      ARM: dts: pandaboard: fix pinmux for gpio user button of Pandaboard E=
S
      ARM: dts: pandaboard es: add bluetooth uart for HCI

Hanks Chen (1):
      arm64: dts: add dts nodes for MT6779

Heiko Stuebner (1):
      arm64: dts: rockchip: add adc joystick to Odroid Go Advance

Hsin-Yi Wang (1):
      arm64: dts: mt8183: Add pwm and backlight node

Hugues Fruchet (3):
      ARM: dts: stm32: fix DCMI DMA features on stm32mp15 family
      ARM: dts: stm32: set bus-type in DCMI endpoint for stm32mp157c-ev1 bo=
ard
      ARM: dts: stm32: set bus-type in DCMI endpoint for stm32429i-eval boa=
rd

Ioana Ciornei (11):
      dt-bindings: net: add the DPAA2 MAC DTS definition
      dt-bindings: net: add the 10gbase-r connection type
      arm64: dts: ls1088a: add external MDIO device nodes
      arm64: dts: ls1088ardb: add QSGMII PHY nodes
      arm64: dts: ls1088ardb: add necessary DTS nodes for DPMAC2
      arm64: dts: ls208xa: add the external MDIO nodes
      arm64: dts: ls2088ardb: add PHY nodes for the CS4340 PHYs
      arm64: dts: ls2088ardb: add PHY nodes for the AQR405 PHYs
      arm64: dts: ls208xa: add PCS MDIO and PCS PHY nodes
      arm64: dts: lx2160a: add PCS MDIO and PCS PHY nodes
      arm64: dts: lx2160ardb: add nodes for the AQR107 PHYs

Iskren Chernev (9):
      ARM: dts: qcom: msm8974-klte: Merge pinctrl nodes
      ARM: dts: qcom: msm8974-klte: Add support for touchkey
      ARM: dts: qcom: msm8974-klte: Add support for touchscreen
      ARM: dts: qcom: msm8974-klte: Add support for led
      ARM: dts: qcom: msm8974-klte: Add gpio expander chip
      ARM: dts: qcom: msm8974-klte: Add support for wifi
      ARM: dts: qcom: msm8974-klte: Add support for SD card
      ARM: dts: qcom: msm8974-klte: Add fuel gauge
      ARM: dts: qcom: msm8974-lge-nexus5: Add fuel gauge

JC Kuo (2):
      arm64: tegra: Fix USB_VBUS_EN0 regulator on Jetson TX1
      arm64: tegra: Add XUSB pad controller interrupt

Jacky Bai (2):
      arm64: dts: freescale: Add pmu support on imx8mp
      arm64: dts: freescale: Add pmu support on imx8mn

Jaehoon Chung (1):
      arm64: dts: exynos: add the WiFi/PCIe support to TM2(e) boards

Jagan Teki (13):
      ARM: dts: imx6q-icore-ofcap10: Use 10.1" Ampire panel compatible
      dt-bindings: arm: rockchip: Add Engicam PX30.Core EDIMM2.2 Starter Ki=
t
      arm64: dts: rockchip: Add Engicam EDIMM2.2 Starter Kit
      arm64: dts: rockchip: Add Engicam PX30.Core EDIMM2.2 Starter Kit
      dt-bindings: arm: rockchip: Add Engicam PX30.Core C.TOUCH 2.0
      arm64: dts: rockchip: Add Engicam C.TOUCH 2.0
      arm64: dts: rockchip: Add Engicam PX30.Core C.TOUCH 2.0
      arm64: dts: rockchip: Enable USB Host, OTG on px30-enagicam
      arm64: dts: rockchip: Enable LVDS panel on px30-engicam-edimm2.2
      dt-bindings: arm: rockchip: Add Engicam PX30.Core C.TOUCH 2.0 10.1" O=
F
      arm64: dts: rockchip: Add Engicam PX30.Core C.TOUCH 2.0 10.1" OF
      ARM: dts: rockchip: Add rtc node for VMARC SOM
      ARM: dts: rockchip: Add SDIO0 node for VMARC SOM

Jernej Skrabec (2):
      arm64: dts: allwinner: h6: PineH64 model B: Add wifi
      arm64: dts: allwinner: h6: Add I2S1 node

Jisheng Zhang (1):
      arm64: dts: hisilicon: Use generic "ngpios" rather than "snps,nr-gpio=
s"

Jishnu Prakash (1):
      arm64: dts: qcom: pm6150x: add ADC_TM definitions

Jitao Shi (1):
      arm64: dts: mt8183: Add dsi node

Joakim Zhang (4):
      arm64: dts: imx8mp-evk: add CAN support
      arm64: dts: imx8mq-evk: add linux,autosuspend-period property for IR
      arm64: dts: imx8mm-evk: add IR support
      arm64: dts: imx8mn-evk: add IR support

Joel Stanley (3):
      ARM: dts: aspeed: s2600wf: Fix VGA memory region location
      ARM: dts: aspeed: ast2600evb: Add MAC0
      dt-bindings: vendor-prefixes: Add FII

Johan Jonker (2):
      arm64: dts: rockchip: rename sdhci nodename to mmc on rk3399
      ARM: dts: rockchip: rename wdt nodename to watchdog on rv1108

John Wang (2):
      ARM: dts: Add 64MiB OpenBMC flash layout
      ARM: dts: aspeed: g220a: Add some gpios

Jon Hunter (4):
      arm64: tegra: Disable the ACONNECT for Jetson TX2
      arm64: tegra: Correct the UART for Jetson Xavier NX
      arm64: tegra: Fix Tegra234 VDK node names
      ARM: tegra: Populate OPP table for Tegra20 Ventana

Jonathan Cameron (6):
      ARM: dts: Cygnus: Drop incorrect io-channel-ranges property.
      ARM: dts: exynos: Drop incorrect use of io-channel-ranges
      ARM: dts: s5pv210: Drop incorrect use of io-channel-ranges property
      ARM: dts: s5pv210: Drop unneeded io-channel-ranges property in Aries
      arm64: dts: exynos: Drop incorrect use of io-channel-ranges property
      ARM: dts: qcom-pma8084: Drop incorrect use of io-channel-ranges

Jonathan Marek (12):
      arm64: dts: qcom: sm8150: add apps_smmu node
      arm64: dts: qcom: sm8250: add apps_smmu node
      arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
      arm64: dts: qcom: sm8250: Add USB and PHY device nodes
      arm64: dts: qcom: add sm8150 hdk dts
      arm64: dts: qcom: add sm8250 hdk dts
      arm64: dts: qcom: add sm8250 fastrpc nodes
      arm64: dts: qcom: fix serial output for sm8250-hdk
      arm64: dts: qcom: sort sm8150 usb_2 node
      arm64: dts: qcom: sm8150: Add wifi node
      arm64: dts: qcom: sm8150-mtp: Enable WiFi node
      arm64: dts: qcom: fix indentation error in sm8250 cpu nodes

Jonathan Neusch=C3=A4fer (2):
      ARM: dts: imx50-kobo-aura: Add 'grp' suffix to pinctrl node names
      ARM: dts: imx50-kobo-aura: Enable eKTF2132 touchscreen

Jordan Crouse (1):
      arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU

Kathiravan T (2):
      arm64: dts: ipq6018: update the reserved-memory node
      arm64: dts: ipq6018: Add the QPIC peripheral nodes

Kevin Hilman (2):
      Merge tag 'amlogic-fixes' into v5.11/dt64
      Merge tag 'clk-meson-v5.11-headers-1' of
git://github.com/BayLibre/clk-meson into v5.11/dt64-deps

Konrad Dybcio (11):
      arm64: dts: qcom: pm8994: Add VADC node
      arm64: dts: qcom: pm8994: Add temperature alarm node
      arm64: dts: qcom: pm8994: Add thermal-zones for temp alarm
      arm64: dts: qcom: pm8994: Fix up spmi-gpio node
      arm64: dts: qcom: msm8992: Add support for SDHCI2
      arm64: dts: qcom: msm8994: Add SDHCI2 node
      arm64: dts: qcom: msm8992: Add BLSP_I2C1 support
      arm64: dts: qcom: talkman: Add Synaptics RMI4 touchscreen
      arm64: dts: qcom: msm8994: Add USB support
      arm64: dts: qcom: msm8992: Add USB support
      arm64: dts: qcom: Add support for Microsoft Lumia 950 XL (Cityman)

Konstantin Aladyshev (4):
      ARM: dts: aspeed: amd-ethanolx: Update KCS nodes to use v2 binding
      ARM: dts: aspeed: amd-ethanolx: Enable KCS channel 3
      ARM: dts: aspeed: amd-ethanolx: Enable devices for the iKVM functiona=
lity
      ARM: dts: aspeed: amd-ethanolx: Add GPIO line names

Krzysztof Kozlowski (64):
      arm64: dts: imx8mq-librem5: align GPIO hog names with dtschema
      ARM: dts: imx: align GPIO hog names with dtschema
      arm64: dts: renesas: Align GPIO hog names with dtschema
      ARM: dts: exynos: fix roles of USB 3.0 ports on Odroid XU
      ARM: dts: exynos: fix USB 3.0 VBUS control and over-current pins
on Exynos5410
      ARM: dts: exynos: fix USB 3.0 pins supply being turned off on Odroid =
XU
      ARM: dts: exynos: disable pull up of USB 3.0 over-current on Odroid X=
U
      ARM: dts: exynos: adjust node names to DT spec in Exynos3250 boards
      ARM: dts: exynos: adjust node names to DT spec in Exynos4210 boards
      ARM: dts: exynos: override GPIO keys node by label in Exynos4412
Odroid family
      ARM: dts: exynos: adjust node names to DT spec in Exynos4412 boards
      ARM: dts: exynos: remove redundant status=3Dokay in Exynos4412 boards
      ARM: dts: exynos: adjust node names to DT spec in Exynos5250 boards
      ARM: dts: exynos: adjust node names to DT spec in Odroid XU
      ARM: dts: exynos: adjust node names to DT spec in Exynos542x boards
      ARM: dts: s5pv210: adjust node names to DT spec
      arm64: dts: exynos: adjust node names to DT spec in Exynos5433 TM2
      arm64: dts: exynos: adjust node names to DT spec in Exynos7 Espresso
      arm64: dts: exynos: remove redundant status=3Dokay in Exynos5433 TM2
      ARM: dts: imx: align watchdog node name with dtschema
      ARM: dts: vf: align watchdog node name with dtschema
      dt-bindings: arm: fsl: document i.MX25 and i.MX27 boards
      dt-bindings: watchdog: fsl-imx: document NXP compatibles
      arm64: dts: freescale: align watchdog node name with dtschema
      arm64: dts: imx8mm: adjust GIC CPU mask to match number of CPUs
      arm64: dts: imx8mn: adjust GIC CPU mask to match number of CPUs
      arm64: dts: imx8mp: adjust GIC CPU mask to match number of CPUs
      dt-bindings: vendor-prefixes: add MicroSys
      dt-bindings: vendor-prefixes: add Revotics
      dt-bindings: arm: fsl: document i.MX51 boards
      dt-bindings: arm: fsl: document i.MX53 boards
      dt-bindings: arm: fsl: document VF boards
      dt-bindings: arm: fsl: document i.MX6DL boards
      dt-bindings: vendor-prefixes: add ABB
      dt-bindings: arm: fsl: document i.MX6DL Aristainetos boards
      ARM: dts: imx6dl-pico: fix board compatibles
      ARM: dts: imx6dl: add compatibles for Aristainetos boards
      dt-bindings: vendor-prefixes: add Element14
      dt-bindings: arm: fsl: document i.MX6Q boards
      dt-bindings: arm: fsl: document i.MX6QP boards
      dt-bindings: arm: fsl: document i.MX6SL boards
      dt-bindings: arm: fsl: document i.MX6SX boards
      dt-bindings: arm: fsl: document i.MX6UL boards
      dt-bindings: arm: fsl: document i.MX6ULL boards
      dt-bindings: arm: fsl: document i.MX7D boards
      ARM: dts: imx6sl-warp: correct vendor in compatible to Revotics
      ARM: dts: imx7s-warp: correct vendor in compatible to Element14
      arm64: dts: mediatek: align GPIO hog names with dtschema
      dt-bindings: arm: fsl: document LS1012A FRWY board
      dt-bindings: arm: fsl: document SolidRun LX2160A boards
      ARM: dts: exynos: use hyphens in Exynos3250 node names
      ARM: dts: exynos: use hyphens in Exynos4 node names
      ARM: dts: exynos: use generic name for max77693 motor in Midas
      ARM: dts: exynos: use hyphens in Exynos5 node names
      ARM: dts: exynos: use hyphens in MFC reserved memory node names
      arm64: dts: exynos: use hyphens in Exynos5433 node names
      dt-bindings: arm: fsl: document i.MX7S boards
      ARM: dts: imx6q-pico: fix board compatibles
      ARM: dts: dove: fix PCA95xx GPIO expander properties on A510
      ARM: dts: armada: align GPIO hog names with dtschema
      dt-bindings: arm: samsung: document SMDK2416 board binding
      dt-bindings: arm: samsung: document S3C6410-based boards binding
      ARM: dts: s3c24xx: add SMDK2416 board compatible
      ARM: dts: s3c6410: correct SMDK6410 board compatible

Kurt Kanzenbach (1):
      dt-bindings: net: dsa: b53: Add YAML bindings

Lad Prabhakar (7):
      ARM: dts: r8a7742-iwg21d-q7: Add LCD support
      ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Enable VIN instances
      arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Add parent
macro for each sensor
      arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected
to HiHope RZ/G2H
      arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected
to HiHope RZ/G2M
      arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected
to HiHope RZ/G2N
      arm64: dts: renesas: hihope-rev4: Add a comment explaining switch SW2=
404

Lancelot Kao (1):
      ARM: dts: nuvoton: Add Fii Kudo system

Lars Povlsen (2):
      arm64: dts: sparx5: Add reset support
      arm64: dts: sparx5: Add SGPIO devices

Linus Walleij (3):
      ARM: dts: ux500: Rename DSI controller nodes
      ARM: dts: ux500: skomer: Pull down SDI2 FBCLK
      ARM: dts: ux500-golden: Add proper supplies to touchscreen

Lionel Debieve (2):
      ARM: dts: stm32: enable HASH by default on stm32mp15
      ARM: dts: stm32: enable CRYP by default on stm32mp15

Lotus Xu (1):
      ARM: dts: aspeed: Add Bytedance g220a BMC machine

Luca Weiss (1):
      arm64: dts: allwinner: pinephone: Add LED flash

Luka Kovacic (4):
      ARM: dts: mvebu: Add CRS326-24G-2S board
      ARM: dts: mvebu: Add CRS305-1G-4S board
      ARM: dts: mvebu: Add CRS328-4C-20S-4S board
      arm64: dts: marvell: Add a device tree for the IEI Puzzle-M801 board

Lukasz Luba (1):
      ARM: dts: exynos: Remove interrupts from DMC controller in Exynos5422

Lukasz Majewski (1):
      ARM: dts: imx28: Fix label name for L2 switch

Manivannan Sadhasivam (5):
      arm64: dts: qcom: sm8250: Add support for SDC2
      arm64: dts: qcom: rb5: Add support for uSD card
      arm64: dts: qcom: sm8250: Add support for PRNG EE
      arm64: dts: qcom: qrb5165-rb5: Add USB support
      arm64: dts: qcom: qrb5165-rb5: Add support for MCP2518FD

Marc Kleine-Budde (1):
      ARM: dts: imx: Change flexcan node name to "can"

Marc Zyngier (2):
      arm64: tegra: Add missing CPU PMUs on Tegra186
      arm64: tegra: Fix GIC400 missing GICH/GICV register regions

Marco Felsch (1):
      ARM: dts: imx6qdl-kontron-samx6i: increase i2c-frequency

Marcus Cooper (2):
      arm64: dts: allwinner: a64: Add I2S2 node
      arm: dts: sunxi: h3/h5: Add I2S2 node

Marek Beh=C3=BAn (9):
      arm64: dts: armada-3720-turris-mox: update ethernet-phy handle name
      ARM: dts: turris-omnia: enable HW buffer management
      ARM: dts: turris-omnia: add comphy handle to eth2
      ARM: dts: turris-omnia: describe switch interrupt
      ARM: dts: turris-omnia: add SFP node
      ARM: dts: turris-omnia: add LED controller node
      ARM: dts: turris-omnia: update ethernet-phy node and handle name
      ARM: dts: turris-omnia: remove unneeded status =3D "okay" properties
      arm64: dts: armada-3720-turris-mox: add 3W power capability to SFP ca=
ge

Marek Szyprowski (7):
      ARM: dts: exynos: Remove 'opp-shared' from Exynos3 bus OPP-tables
      ARM: dts: exynos: Remove 'opp-shared' from Exynos4412 bus OPP-tables
      ARM: dts: exynos: Enable Bluetooth support for Trats board
      ARM: dts: exynos: Enable Bluetooth support for Universal C210 board
      ARM: dts: exynos: Enable Bluetooth support for Midas board family
      ARM: dts: exynos: Enable DWC2 dual-role support on OdroidU3+ boards
      ARM: dts: exynos: Reduce assigned-clocks entries for SPI0 on Artik5 b=
oard

Marek Vasut (10):
      ARM: dts: stm32: Fix TA3-GPIO-C key on STM32MP1 DHCOM PDK2
      ARM: dts: stm32: Fix LED5 on STM32MP1 DHCOM PDK2
      ARM: dts: stm32: Define VIO regulator supply on DHCOM
      ARM: dts: stm32: Enable thermal sensor support on stm32mp15xx-dhcor
      ARM: dts: stm32: Keep VDDA LDO1 always on on DHCOM
      ARM: dts: stm32: Connect PHY IRQ line on DH STM32MP1 SoM
      ARM: dts: stm32: Add alternate pinmux for FMC EBI bus
      ARM: dts: stm32: Add KS8851 on FMC2 to STM32MP1 DHCOM
      dt-bindings: arm: stm32: Add compatible strings for DH SoMs and board=
s
      ARM: dts: stm32: Add DHCOM based PicoITX board

Martin J=C3=BCcker (3):
      dt-bindings: arm: samsung: document bindings for P4 Note family board
      ARM: dts: exynos: add Samsung's Exynos4412-based P4 Note boards
      ARM: dts: exynos: switch Atmel mxt reset GPIO to active low on P4 Not=
e

Matteo Scordino (5):
      dt-bindings: vendors: add Elimo Engineering vendor prefix
      ARM: dts: sun8i: V3/S3: Add UART1 pin definitions to the V3/S3 dtsi
      ARM: dts: sun8i: s3: Add dtsi for the Elimo Impetus SoM
      dt-bindings: arm: sunxi: add Elimo bindings
      ARM: dts: sun8i: s3: Add dts for the Elimo Initium SBC

Matthias Brugger (2):
      Merge tag 'v5.10-next-pm-domains-stable' into HEAD
      arm64: dts: mediatek: Add mt8183 power domains controller

Matthias Kaehlcke (3):
      arm64: dts: qcom: sc7180: Add sc7180-lazor-r2/r3
      arm64: dts: qcom: sc7180: Set 'polling-delay-passive' for
thermal zones back to 250 ms
      arm64: dts: qcom: sc7180-trogdor: Make pp3300_a the default
supply for pp3300_hub

Matthias Schiffer (11):
      dt-bindings: arm: fsl: update TQ-Systems SoMs and boards based on i.M=
X7
      ARM: dts: imx7-mba7: update compatible strings
      ARM: dts: imx7-mba7: drop incorrect num-chipselects property
      ARM: dts: imx7-mba7: remove unsupported PHY LED setup
      ARM: dts: imx7-mba7: disable ethernet PHY clock outputs
      ARM: dts: imx7-mba7: configure watchdog
      ARM: dts: imx7-mba7: update MMC aliases
      ARM: dts: imx7-mba7: add audio support
      ARM: dts: imx7-mba7: enable RS485 on UART7
      ARM: dts: imx7-mba7: specify USB over-current polarity
      ARM: dts: imx7-mba7: set dr_mode to otg on usbotg1

Maxime Ripard (1):
      ARM: dts: rpi-4: disable wifi frequencies

Meenakshi Aggarwal (2):
      dt-bindings: fsl: add compatible for LX2162A QDS Board
      arm64: dts: lx2160a: add device tree for lx2162aqds board

Michael Klein (1):
      ARM: dts: sun8i-h2-plus-bananapi-m2-zero: add gpio-line-names

Michael Srba (1):
      arm64: dts: qcom: msm8916-samsung-a3u: add nodes for touchscreen

Michael Trimarchi (1):
      arm64: dts: rockchip: Add Engicam PX30.Core SOM

Michael Walle (6):
      arm64: dts: ls1028a: add missing CAN nodes
      arm64: dts: freescale: sl28: add CAN node
      arm64: dts: ls1028a: fix ENETC PTP clock input
      arm64: dts: ls1028a: fix FlexSPI clock input
      arm64: dts: ls1028a: add optee node
      arm64: dts: freescale: sl28: combine SPI MTD partitions

Michal Simek (9):
      arm64: zynqmp: Move gic node to axi bus
      arm64: dts: zynqmp: Fix pcie ranges description
      arm64: dts: zynqmp: Wire mailbox with zynqmp-power driver
      ARM: zynq: Fix compatible string for adi,adxl345 chip
      ARM: zynq: Rename bus to be align with simple-bus yaml
      ARM: zynq: Fix leds subnode name for zc702/zybo-z7
      ARM: zynq: Fix OCM mapping to be aligned with binding on zc702
      ARM: zynq: Convert at25 binding to new description on zc770-xm013
      ARM: zynq: Fix incorrect reference to XM013 instead of XM011

Nathan Chancellor (1):
      arm64: dts: imx: Fix imx8mm-kontron-n801x-s.dtb target

Neil Armstrong (7):
      dt-bindings: clk: axg-clkc: add Video Clocks
      dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
      arm64: dts: meson-axg: add PWRC node
      arm64: dts: meson-axg: add MIPI DSI PHY nodes
      arm64: dts: meson-axg: add PCIe nodes
      arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots
      arm64: dts: meson-axg: add GE2D node

Nicolas Chauvet (5):
      arm64: tegra: Add missing hot temperatures to Tegra132 thermal-zones
      arm64: tegra: Add missing gpu-throt-level to Tegra210 soctherm
      arm64: tegra: Add missing hot temperatures to Tegra210 thermal-zones
      ARM: tegra: Add missing gpu-throt-level to Tegra124 soctherm
      ARM: tegra: Add missing hot temperatures to Tegra124 thermal-zones

Nicolas Ferre (1):
      ARM: dts: at91: sama5d2: fix CAN message ram offset and size

Nicolas Toromanoff (1):
      ARM: dts: stm32: enable CRC1 by default on stm32mp15

Nikita Travkin (6):
      arm64: dts: qcom: msm8916-longcheer-l8150: Enable PM8916 vibrator
      arm64: dts: msm8916-longcheer-l8150: Add touchscreen
      arm64: dts: msm8916-longcheer-l8150: Add position sensors
      arm64: dts: qcom: msm8916-longcheer-l8150: Add flash LED
      arm64: dts: qcom: msm8916-longcheer-l8150: Add notification LED
      arm64: dts: qcom: msm8916-samsung-a2015: Disable muic i2c pin bias

Nishanth Menon (6):
      arm64: dts: ti: k3-am65*/j721e*: Fix unit address format error
for dss node
      arm64: dts: ti: k3-am65*: Cleanup disabled nodes at SoC dtsi level
      arm64: dts: ti: k3-j721e*: Cleanup disabled nodes at SoC dtsi level
      arm64: dts: ti: am65/j721e: Fix up un-necessary status set to
"okay" for crypto
      arm64: dts: ti: k3-am654-base-board: Fix up un-necessary status
set to "okay" for USB
      arm64: dts: ti: am65/j721e/j7200: Mark firmware used uart as "reserve=
d"

Oleksij Rempel (10):
      ARM: dts: imx6/7: sync fsl,stop-mode with current flexcan driver
      dt-bindings: vendor-prefixes: Add an entry for Van der Laan b.v.
      dt-bindings: vendor-prefixes: Add an entry for Altus-Escon-Company
      dt-bindings: arm: fsl: add Altesco I6P board
      ARM: dts: add Altesco I6P board
      dt-bindings: arm: fsl: add Van der Laan LANMCU board
      ARM: dts: add Van der Laan LANMCU board
      dt-bindings: vendor-prefixes: add "virtual" prefix
      dt-bindings: arm: fsl: add Protonic WD3 board
      ARM: dts: add Protonic WD3 board

Ondrej Jirman (3):
      arm64: dts: allwinner: pinephone: Add light/proximity sensor
      arm64: dts: allwinner: pinephone: Add WiFi support
      arm64: dts: allwinner: pinephone: Add Bluetooth support

Pali Roh=C3=A1r (3):
      arm64: dts: marvell: espressobin: De-duplicate eMMC definitions
      arm64: dts: marvell: espressobin: Add support for LED2
      arm64: dts: marvell: espressobin: Update link to V7 schematic

Patrick Delaunay (1):
      ARM: dts: stm32: reorder spi4 within stm32mp15-pinctrl

Paul Fertser (1):
      arm: dts: aspeed: tiogapass: Enable second MAC

Paul Kocialkowski (1):
      ARM: dts: sun8i-v3s: Add I2C1 PB pins description

Pavel Hofman (1):
      ARM: dts: bcm283x: increase dwc2's RX FIFO size

Pawe=C5=82 Chmiel (2):
      arm64: dts: exynos: Include common syscon restart/poweroff for Exynos=
7
      arm64: dts: exynos: Correct psci compatible used on Exynos7

Peng Fan (1):
      ARM: dts: imx: add usb alias

Peter Geis (3):
      dt-bindings: Add vendor prefix for Ouya Inc.
      dt-bindings: ARM: tegra: Add Ouya game console
      ARM: tegra: Add device-tree for Ouya

Peter Ujfalusi (3):
      ARM: dts: keystone-k2g-evm: add HDMI and analog audio data
      arm64: dts: ti: k3-j7200-som-p0: main_i2c0 have an ioexpander on the =
SOM
      arm64: dts: ti: k3-j7200-common-proc-board: Correct the name of
io expander on main_i2c1

Rafa=C5=82 Mi=C5=82ecki (6):
      ARM: dts: BCM5301X: Move CRU devices to the CRU node
      ARM: dts: BCM5301X: Disable USB 3 PHY on devices without USB 3
      ARM: dts: BCM5301X: Enable USB 3 PHY on Luxul XWR-3150
      dt-bindings: arm: bcm: document BCM4908 bindings
      arm64: dts: broadcom: add BCM4908 and Asus GT-AC5300 early DTS files
      arm64: add config for Broadcom BCM4908 SoCs

Ran Wang (2):
      ARM: dts: ls1021a: fix flextimer failed to wake system
      ARM: dts: ls1021a: fix rcpm failed to claim resource

Rob Clark (1):
      arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU

Sai Prakash Ranjan (1):
      arm64: dts: qcom: sm8150: Add Coresight support

Sameer Pujar (5):
      arm64: tegra: Rename ADMA device nodes for Tegra210
      arm64: tegra: Fix Tegra194 HDA {clock,reset}-names ordering
      dt-bindings: dma: Convert ADMA doc to json-schema
      dt-bindings: interrupt-controller: arm,gic: Update Tegra compatibles
      dt-bindings: bus: Convert ACONNECT doc to json-schema

Samuel Holland (3):
      arm64: dts: allwinner: pinephone: Remove AC power supply
      arm64: dts: allwinner: pinephone: Set ALDO3 to exactly 3v0
      arm64: dts: allwinner: pinephone: Use generic sensor node names

Seiya Wang (1):
      arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Make=
file

Sekhar Nori (1):
      arm64: dts: ti: k3: squelch warning about lack of #interrupt-cells

Serge Semin (13):
      arm64: dts: allwinner: h6: Harmonize DWC USB3 DT nodes name
      ARM: dts: exynos: Correct DWC USB3 compatible string
      ARM: dts: exynos: Harmonize DWC USB3 DT nodes name
      arm64: dts: exynos: Harmonize DWC USB3 DT nodes name
      arm64: dts: layerscape: Harmonize DWC USB3 DT nodes name
      ARM: dts: am437x: Correct DWC USB3 compatible string
      ARM: dts: omap5: Harmonize DWC USB3 DT nodes name
      ARM: dts: BCM5301X: Harmonize EHCI/OHCI DT nodes name
      ARM: dts: BCM5310X: Harmonize xHCI DT nodes name
      arm64: dts: hi3660: Harmonize DWC USB3 DT nodes name
      ARM: dts: stm32: Harmonize EHCI/OHCI DT nodes name on stm32mp15
      arm: dts: marvell: armada-375: Harmonize DWC USB3 DT nodes name
      arm64: dts: marvell: cp11x: Harmonize xHCI DT nodes name

Shengjiu Wang (2):
      arm64: dts: imx8mq: Configure clock rate for audio plls
      arm64: dts: imx8mq-evk: Add spdif sound card support

Shunqian Zheng (1):
      arm64: dts: rockchip: add isp0 node for rk3399

Sibi Sankar (3):
      arm64: dts: qcom: sc7180-trogdor: Fixup modem memory region
      arm64: dts: qcom: sc7180-lite: Tweak DDR/L3 scaling on SC7180-lite
      arm64: dts: qcom: sc7180: Add DDR/L3 votes for the pro variant

Souradeep Chowdhury (1):
      arm64: dts: qcom: sm8150: Add LLC support for sm8150

Sowjanya Komatineni (3):
      arm64: tegra: Change order of SATA resets for Tegra132 and Tegra210
      arm64: tegra: Enable AHCI on Jetson TX2
      ARM: tegra: Change order of SATA resets for Tegra124

Stanimir Varbanov (1):
      arm64: dts: sdm845: Add interconnect properties for Venus

Stefan Agner (5):
      arm64: dts: meson: g12b: odroid-n2: fix PHY deassert timing requireme=
nts
      arm64: dts: meson: fix PHY deassert timing requirements
      ARM: dts: meson: fix PHY deassert timing requirements
      arm64: dts: meson: g12a: x96-max: fix PHY deassert timing requirement=
s
      arm64: dts: meson: g12b: w400: fix PHY deassert timing requirements

Stefan Riedmueller (5):
      ARM: dts: imx6ul: segin: Fix stmpe touchscreen subnode name
      ARM: dts: imx6: phytec: Set correct eeprom compatible
      ARM: dts: imx6: phytec: Add eeprom pagesize
      ARM: dts: imx6ul: phytec: Add support for optional PEB-AV-02 LCD adap=
ter
      ARM: dts: imx6ul: segin: peb-av-02: Mark stmpe touch as wakeup-source

Stephan Gerhold (3):
      arm64: dts: qcom: msm8916: Add RPM power domains
      arm64: dts: qcom: msm8916: Use power domains for MSS/WCNSS remoteproc=
s
      arm64: dts: qcom: msm8916-pm8916: Stop using s1/l3 as regulators

Stephen Boyd (3):
      arm64: dts: qcom: sc7180: Remove double pull-up on p-sensor-int-l
      arm64: dts: qcom: sc7180: Add prox sensor to LTE sku Lazor boards
      arm64: dts: sdm845: Add iommus property to qup

Suman Anna (11):
      arm64: dts: ti: k3-am65-mcu: Add MCU domain R5F cluster node
      arm64: dts: ti: k3-am654-base-board: Add mailboxes to R5Fs
      arm64: dts: ti: k3-am654-base-board: Add DDR carveout memory
nodes for R5Fs
      arm64: dts: ti: k3-am654-base-board: Reserve memory for IPC
between R5F cores
      arm64: dts: ti: k3-j721e-mcu: Add MCU domain R5F cluster node
      arm64: dts: ti: k3-j721e-main: Add MAIN domain R5F cluster nodes
      arm64: dts: ti: k3-j721e-som-p0: Add mailboxes to R5Fs
      arm64: dts: ti: k3-j721e-som-p0: Add DDR carveout memory nodes for R5=
Fs
      arm64: dts: ti: k3-j7200-main: Add hwspinlock node
      arm64: dts: ti: k3-j7200-main: Add mailbox cluster nodes
      arm64: dts: ti: k3-j7200-som-p0: Add IPC sub-mailbox nodes

Suniel Mahesh (2):
      arm64: dts: rockchip: Add WiFi support on px30-engicam
      arm64: dts: rockchip: Add BT support on px30-engicam

Sven Auhagen (1):
      arm64: dts: marvell: armada-cp110: Switch to per-port SATA interrupts

Sylwester Nawrocki (1):
      ARM: dts: exynos: Add interconnect properties to Exynos4412 bus nodes

Taniya Das (1):
      arm64: dts: sc7180: Add camera clock controller node

Tao Ren (6):
      ARM: dts: aspeed: Common dtsi for Facebook AST2400 Network BMCs
      ARM: dts: aspeed: wedge40: Use common dtsi
      ARM: dts: aspeed: wedge100: Use common dtsi
      ARM: dts: aspeed: Add Facebook Galaxy100 (AST2400) BMC
      ARM: dts: aspeed: wedge400: Fix FMC flash0 layout
      ARM: dts: aspeed: minipack: Fixup I2C tree

Tero Kristo (1):
      ARM: dts: dra7: add second SHA instance

Terry Hsiao (1):
      arm64: dts: qcom: sc7180-trogdor: add "pen-insert" label for trogdor

Thara Gopinath (1):
      dts: qcom: sdm845: Add dt entries to support crypto engine.

Thierry Reding (4):
      arm64: tegra: Hook up edp interrupt on Tegra132 SOCTHERM
      Merge branch 'for-5.11/dt-bindings' into for-5.11/arm/dt
      ARM: tegra: Hook up edp interrupt on Tegra124 SOCTHERM
      ARM: tegra: Properly align clocks for SOCTHERM

Tomasz Maciej Nowak (1):
      arm64: dts: mcbin-singleshot: add heartbeat LED

Tomasz Nowicki (1):
      arm64: dts: marvell: keep SMMU disabled by default for Armada
7040 and 8040

Tomer Maimon (8):
      ARM: dts: nuvoton: Modify clock parameters
      ARM: dts: nuvoton: Modify timer register size
      ARM: dts: nuvoton: Add pinctrl and GPIO node
      ARM: dts: nuvoton: Add new device nodes
      ARM: dts: nuvoton: Add new device nodes to NPCM750 EVB
      ARM: dts: nuvoton: Add Nuvoton NPCM730 device tree
      ARM: dts: nuvoton: Add NPCM7xx RunBMC Olympus Quanta machine
      ARM: dts: add Nuvoton NPCM730 device tree

Tomi Valkeinen (1):
      arm64: dts: ti: k3-am65: mark dss as dma-coherent

Tony Lindgren (1):
      Merge branch 'omap-for-v5.11/dt-mot-take2' into omap-for-v5.11/dt

Uwe Kleine-K=C3=B6nig (3):
      dt-bindings: vendor-prefixes: Add kobol prefix
      arm64: dts: rockchip: Add basic support for Kobol's Helios64
      dt-bindings: arm: rockchip: Add Kobol Helios64

Vicente Bergas (3):
      arm64: dts: rockchip: fix supplies on rk3399-rock-pi-4
      arm64: dts: rockchip: fix I2S conflict on rk3399-rock-pi-4
      arm64: dts: rockchip: use USB host by default on rk3399-rock-pi-4

Vidya Sagar (2):
      arm64: tegra: Fix DT binding for IO High Voltage entry
      dt-bindings: Fix entry name for I/O High Voltage property

Vignesh Raghavendra (1):
      arm64: dts: ti: k3-j7200-mcu-wakeup: Enable ADC support

Vijay Khemka (1):
      ARM: dts: aspeed: tiogapass: Remove vuart

Vinod Koul (9):
      arm64: dts: sdm845: Fix dma node name
      arm64: dts: sdm630: Fix dma node name
      arm64: dts: qcs404: Fix dma node name
      arm64: dts: msm8916: Fix dma node name
      arm64: dts: msm8994: Fix dma node name
      arm64: dts: msm8996: Fix dma node name
      arm64: dts: msm8998: Fix dma node name
      arm64: dts: ipq6018: Fix dma node name
      arm64: dts: ipq8074: Fix dma node name

Vivek Unune (4):
      ARM: dts: BCM5301X: Linksys EA9500 add port 5 and port 7
      ARM: dts: BCM5301X: Linksys EA9500 add fixed partitions
      ARM: dts: BCM5301X: Use corretc pinctrl compatible for 4709x
      ARM: dts: BCM5301X: Linksys EA9500 make use of pinctrl

Vladimir Oltean (1):
      arm64: dts: ls1028a: make the eMMC and SD card controllers use
fixed indices

Vladimir Vid (1):
      arm64: dts: marvell: add DT for ESPRESSObin-Ultra

Weiyi Lu (1):
      dt-bindings: power: Add MT8192 power domains

Xiaowei Bao (1):
      arm64: dts: layerscape: Add PCIe EP node for ls1088a

Yann Gautier (1):
      ARM: dts: stm32: update sdmmc IP version for STM32MP15

Yu-Tung Chang (2):
      ARM: dts: sun8i: add FriendlyArm ZeroPi support
      ARM: dts: sun8i: h3: Add initial NanoPi R1 support

Yuantian Tang (2):
      ARM: dts: ls1021a: update calibration table for TMU module
      arm64: dts: freescale: update calibration table for TMU module

Yunus Bas (1):
      ARM: dts: imx6ul: segin: Add phyBOARD-Segin with eMMC phyCORE-i.MX6UL

Yuya Hamamachi (1):
      arm64: dts: renesas: r8a77951: Add PCIe EP nodes

Zhen Lei (20):
      arm64: dts: qcom: clear the warnings caused by empty dma-ranges
      ARM: dts: hisilicon: fix errors detected by snps-dw-apb-uart.yaml
      ARM: dts: hisilicon: fix errors detected by pl011.yaml
      ARM: dts: hisilicon: fix errors detected by usb yaml
      ARM: dts: hisilicon: fix errors detected by simple-bus.yaml
      ARM: dts: hisilicon: fix errors detected by root-node.yaml
      ARM: dts: hisilicon: fix errors detected by synopsys-dw-mshc.yaml
      ARM: dts: hisilicon: fix errors detected by spi-pl022.yaml
      ARM: dts: hisilicon: fix errors detected by syscon.yaml
      arm64: dts: hisilicon: normalize the node name of the ITS devices
      arm64: dts: hisilicon: separate each group of data in the property "r=
eg"
      arm64: dts: hisilicon: write the values of property-units into a
uint32 array
      arm64: dts: hisilicon: remove unused property pinctrl-names
      arm64: dts: hisilicon: place clock-names "biu" before "ciu"
      arm64: dts: hisilicon: normalize the node name of the SMMU devices
      arm64: dts: hisilicon: normalize the node name of the usb devices
      arm64: dts: hisilicon: normalize the node name of the UART devices
      arm64: dts: hisilicon: list all clocks required by spi-pl022.yaml
      arm64: dts: hisilicon: list all clocks required by pl011.yaml
      arm64: dts: hisilicon: list all clocks required by snps-dw-apb-uart.y=
aml

=C5=81ukasz Stelmach (8):
      ARM: dts: exynos: Add Ethernet interface description for Odroid XU3 L=
ite
      ARM: dts: exynos: Add Ethernet interface description for Odroid XU
      ARM: dts: exynos: Add Ethernet interface description for Odroid U3
      ARM: dts: exynos: Add Ethernet interface description for Odroid X/X2
      ARM: dts: exynos: Add a placeholder for a MAC address
      ARM: dts: exynos: Add Ethernet to Artik 5 board
      ARM: dts: exynos: Fix Ethernet interface description on Odroid XU3
      ARM: dts: exynos: Add an alias for the Ethernet interface on Odroid X=
U3

 .../devicetree/bindings/arm/bcm/brcm,bcm4908.yaml  |   38 +
 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |   12 +-
 Documentation/devicetree/bindings/arm/fsl.yaml     |  360 +-
 .../devicetree/bindings/arm/mediatek.yaml          |    4 +
 .../bindings/arm/mstar/mstar,smpctrl.yaml          |   40 +
 .../devicetree/bindings/arm/mstar/mstar.yaml       |    6 +
 Documentation/devicetree/bindings/arm/renesas.yaml |    1 +
 .../devicetree/bindings/arm/rockchip.yaml          |   23 +
 .../bindings/arm/samsung/samsung-boards.yaml       |   21 +
 .../bindings/arm/stm32/st,stm32-syscon.yaml        |    4 +
 .../devicetree/bindings/arm/stm32/stm32.yaml       |   23 +-
 Documentation/devicetree/bindings/arm/sunxi.yaml   |   23 +
 Documentation/devicetree/bindings/arm/tegra.yaml   |    3 +
 .../bindings/bus/nvidia,tegra210-aconnect.txt      |   44 -
 .../bindings/bus/nvidia,tegra210-aconnect.yaml     |   82 +
 .../devicetree/bindings/clock/imx8qxp-lpcg.yaml    |   79 +-
 .../bindings/connector/usb-connector.yaml          |   24 +
 .../bindings/dma/nvidia,tegra210-adma.txt          |   56 -
 .../bindings/dma/nvidia,tegra210-adma.yaml         |   99 +
 .../devicetree/bindings/iio/adc/mt6577_auxadc.txt  |    1 +
 .../bindings/interrupt-controller/arm,gic.yaml     |    9 +-
 Documentation/devicetree/bindings/net/dsa/b53.txt  |  149 -
 .../devicetree/bindings/net/dsa/brcm,b53.yaml      |  249 ++
 Documentation/devicetree/bindings/net/dsa/dsa.yaml |    6 +-
 .../bindings/net/ethernet-controller.yaml          |    1 +
 .../bindings/net/fsl,qoriq-mc-dpmac.yaml           |   60 +
 .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    |    2 +-
 .../bindings/power/mediatek,power-controller.yaml  |  293 ++
 .../devicetree/bindings/usb/st,stusb160x.yaml      |   87 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   26 +
 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  |   16 +
 MAINTAINERS                                        |    3 +-
 arch/arm/boot/dts/Makefile                         |   31 +-
 arch/arm/boot/dts/am335x-baltos.dtsi               |    2 +-
 arch/arm/boot/dts/am335x-boneblue.dts              |   54 +
 arch/arm/boot/dts/am335x-cm-t335.dts               |    2 +-
 arch/arm/boot/dts/am335x-evm.dts                   |    2 +-
 arch/arm/boot/dts/am335x-igep0033.dtsi             |    2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi                   |   27 +
 arch/arm/boot/dts/am437x-l4.dtsi                   |    4 +-
 arch/arm/boot/dts/armada-375.dtsi                  |    2 +-
 arch/arm/boot/dts/armada-382-rd-ac3x-48g4x2xl.dts  |  112 +
 arch/arm/boot/dts/armada-385-turris-omnia.dts      |  179 +-
 arch/arm/boot/dts/armada-388-clearfog.dts          |    4 +-
 arch/arm/boot/dts/armada-388-clearfog.dtsi         |   10 +-
 arch/arm/boot/dts/armada-388-helios4.dts           |    6 +-
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi          |   12 +-
 arch/arm/boot/dts/armada-xp-crs305-1g-4s-bit.dts   |   43 +
 arch/arm/boot/dts/armada-xp-crs305-1g-4s.dts       |   17 +
 arch/arm/boot/dts/armada-xp-crs305-1g-4s.dtsi      |  104 +
 arch/arm/boot/dts/armada-xp-crs326-24g-2s-bit.dts  |   43 +
 arch/arm/boot/dts/armada-xp-crs326-24g-2s.dts      |   17 +
 arch/arm/boot/dts/armada-xp-crs326-24g-2s.dtsi     |  104 +
 .../boot/dts/armada-xp-crs328-4c-20s-4s-bit.dts    |   43 +
 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s.dts   |   17 +
 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s.dtsi  |  104 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts           |   20 +
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |   77 +-
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts   |  924 ++++
 .../arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts |   57 +
 arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts |  888 ++++
 .../arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts |   13 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts |  120 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts  |  112 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts |    4 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts    |   37 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |   39 +-
 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts     |    4 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |   11 +-
 arch/arm/boot/dts/aspeed-g6.dtsi                   |    2 +-
 .../boot/dts/ast2400-facebook-netbmc-common.dtsi   |  117 +
 arch/arm/boot/dts/at91-kizbox.dts                  |   55 +-
 arch/arm/boot/dts/at91-kizbox2-common.dtsi         |    8 +-
 arch/arm/boot/dts/at91-kizbox3-hs.dts              |   16 +-
 arch/arm/boot/dts/at91-kizbox3_common.dtsi         |   10 +-
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi      |    8 +-
 arch/arm/boot/dts/at91-sam9x60ek.dts               |   13 +-
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi          |    2 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts        |    7 +
 arch/arm/boot/dts/at91-sama5d4_xplained.dts        |    7 +
 arch/arm/boot/dts/at91-smartkiz.dts                |    6 +-
 arch/arm/boot/dts/at91sam9260.dtsi                 |   25 -
 arch/arm/boot/dts/at91sam9g45.dtsi                 |   27 -
 arch/arm/boot/dts/at91sam9m10g45ek.dts             |   10 +-
 arch/arm/boot/dts/at91sam9rl.dtsi                  |   25 -
 arch/arm/boot/dts/at91sam9rlek.dts                 |   10 +-
 arch/arm/boot/dts/at91sam9x5.dtsi                  |   28 -
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |    1 -
 arch/arm/boot/dts/bcm-nsp.dtsi                     |    8 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              |    2 +
 arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi         |    2 +-
 arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi  |    2 +-
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts       |    7 -
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       |    7 -
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      |    3 -
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |    4 -
 arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts      |    7 -
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts      |    7 -
 arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts |    4 -
 arch/arm/boot/dts/bcm4709.dtsi                     |    4 +
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    |   94 +-
 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts      |    3 -
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts      |    3 -
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts      |    3 -
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |    7 +-
 arch/arm/boot/dts/bcm47094.dtsi                    |   13 +
 arch/arm/boot/dts/bcm5301x.dtsi                    |   67 +-
 arch/arm/boot/dts/bcm53573.dtsi                    |    4 +-
 arch/arm/boot/dts/bcm953012er.dts                  |    3 -
 arch/arm/boot/dts/bcm958522er.dts                  |    4 +
 arch/arm/boot/dts/bcm958525er.dts                  |    4 +
 arch/arm/boot/dts/bcm958525xmc.dts                 |    4 +
 arch/arm/boot/dts/bcm958622hr.dts                  |    3 -
 arch/arm/boot/dts/bcm958623hr.dts                  |    3 -
 arch/arm/boot/dts/bcm958625hr.dts                  |    3 -
 arch/arm/boot/dts/bcm958625k.dts                   |    3 -
 arch/arm/boot/dts/bcm988312hr.dts                  |    3 -
 arch/arm/boot/dts/dove-sbc-a510.dts                |    1 +
 arch/arm/boot/dts/dra7.dtsi                        |   34 +-
 arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi  |    4 +-
 arch/arm/boot/dts/exynos3250-artik5-eval.dts       |   26 +
 arch/arm/boot/dts/exynos3250-artik5.dtsi           |    2 +-
 arch/arm/boot/dts/exynos3250-monk.dts              |    8 +-
 arch/arm/boot/dts/exynos3250-rinato.dts            |    8 +-
 arch/arm/boot/dts/exynos3250.dtsi                  |   54 +-
 arch/arm/boot/dts/exynos4.dtsi                     |   26 +-
 arch/arm/boot/dts/exynos4210-i9100.dts             |    6 +-
 arch/arm/boot/dts/exynos4210-origen.dts            |    4 +-
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |   22 +-
 arch/arm/boot/dts/exynos4210-trats.dts             |   35 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |   29 +
 arch/arm/boot/dts/exynos4210.dtsi                  |   36 +-
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        |    9 +-
 arch/arm/boot/dts/exynos4412-itop-elite.dts        |    2 +-
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi    |    2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi            |   47 +-
 arch/arm/boot/dts/exynos4412-n710x.dts             |    2 +-
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |   11 +-
 arch/arm/boot/dts/exynos4412-odroidu3.dts          |   26 +
 arch/arm/boot/dts/exynos4412-odroidx.dts           |   58 +-
 arch/arm/boot/dts/exynos4412-origen.dts            |   14 +-
 arch/arm/boot/dts/exynos4412-p4note-n8010.dts      |   17 +
 arch/arm/boot/dts/exynos4412-p4note.dtsi           | 1132 +++++
 arch/arm/boot/dts/exynos4412-smdk4412.dts          |   20 +-
 arch/arm/boot/dts/exynos4412.dtsi                  |   32 +-
 arch/arm/boot/dts/exynos5250-arndale.dts           |    6 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      |    4 +-
 arch/arm/boot/dts/exynos5250-snow-rev5.dts         |    2 +-
 arch/arm/boot/dts/exynos5250-snow.dts              |    2 +-
 arch/arm/boot/dts/exynos5250-spring.dts            |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |    7 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts          |   33 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi          |   28 +
 arch/arm/boot/dts/exynos5410.dtsi                  |    4 +
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      |    4 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts         |    6 +-
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |    2 +-
 arch/arm/boot/dts/exynos5420.dtsi                  |   39 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      |   34 +-
 arch/arm/boot/dts/exynos5422-odroidhc1.dts         |    4 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi  |    2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |    4 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts    |   22 +
 arch/arm/boot/dts/exynos5422-odroidxu3.dts         |   30 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts         |    4 +-
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi    |   11 +-
 arch/arm/boot/dts/exynos54xx.dtsi                  |    5 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts          |    4 +-
 arch/arm/boot/dts/hi3519-demb.dts                  |    2 +-
 arch/arm/boot/dts/hi3519.dtsi                      |   32 +-
 arch/arm/boot/dts/hi3620-hi4511.dts                |   24 +-
 arch/arm/boot/dts/hi3620.dtsi                      |   32 +-
 arch/arm/boot/dts/hip01-ca9x2.dts                  |    2 +-
 arch/arm/boot/dts/hip01.dtsi                       |   26 +-
 arch/arm/boot/dts/hip04-d01.dts                    |    2 +-
 arch/arm/boot/dts/hip04.dtsi                       |    6 +-
 arch/arm/boot/dts/hisi-x5hd2-dkb.dts               |    2 +-
 arch/arm/boot/dts/hisi-x5hd2.dtsi                  |   42 +-
 arch/arm/boot/dts/imx25.dtsi                       |    2 +-
 arch/arm/boot/dts/imx27.dtsi                       |    2 +-
 arch/arm/boot/dts/imx28.dtsi                       |    2 +-
 arch/arm/boot/dts/imx31.dtsi                       |    3 +-
 arch/arm/boot/dts/imx35.dtsi                       |    2 +-
 arch/arm/boot/dts/imx50-kobo-aura.dts              |   41 +-
 arch/arm/boot/dts/imx50.dtsi                       |    2 +-
 arch/arm/boot/dts/imx51-zii-rdu1.dts               |    2 +-
 arch/arm/boot/dts/imx51.dtsi                       |    4 +-
 arch/arm/boot/dts/imx53-ppd.dts                    |   15 +-
 arch/arm/boot/dts/imx53.dtsi                       |    4 +-
 arch/arm/boot/dts/imx6dl-alti6p.dts                |  564 +++
 arch/arm/boot/dts/imx6dl-aristainetos2_4.dts       |    2 +-
 arch/arm/boot/dts/imx6dl-aristainetos2_7.dts       |    2 +-
 arch/arm/boot/dts/imx6dl-aristainetos_4.dts        |    2 +-
 arch/arm/boot/dts/imx6dl-aristainetos_7.dts        |    2 +-
 arch/arm/boot/dts/imx6dl-lanmcu.dts                |  470 ++
 arch/arm/boot/dts/imx6dl-pico-dwarf.dts            |    2 +-
 arch/arm/boot/dts/imx6dl-pico-hobbit.dts           |    2 +-
 arch/arm/boot/dts/imx6dl-pico-nymph.dts            |    2 +-
 arch/arm/boot/dts/imx6dl-pico-pi.dts               |    2 +-
 arch/arm/boot/dts/imx6q-icore-ofcap10.dts          |   28 +-
 arch/arm/boot/dts/imx6q-pico-dwarf.dts             |    2 +-
 arch/arm/boot/dts/imx6q-pico-hobbit.dts            |    2 +-
 arch/arm/boot/dts/imx6q-pico-nymph.dts             |    2 +-
 arch/arm/boot/dts/imx6q-pico-pi.dts                |    2 +-
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi             |    4 +-
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi      |    6 +-
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi       |    3 +-
 arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi  |    3 +-
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi            |    8 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     |   12 +-
 arch/arm/boot/dts/imx6qp-prtwd3.dts                |  553 +++
 arch/arm/boot/dts/imx6sl-warp.dts                  |    4 +-
 arch/arm/boot/dts/imx6sl.dtsi                      |    3 +
 arch/arm/boot/dts/imx6sll.dtsi                     |    2 +
 arch/arm/boot/dts/imx6sx-softing-vining-2000.dts   |    8 +-
 arch/arm/boot/dts/imx6sx.dtsi                      |    7 +-
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts        |    2 +-
 arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi   |    1 +
 .../boot/dts/imx6ul-phytec-segin-ff-rdk-emmc.dts   |   94 +
 .../boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts   |    1 +
 .../boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi    |  151 +
 arch/arm/boot/dts/imx6ul-phytec-segin.dtsi         |   43 -
 arch/arm/boot/dts/imx6ul.dtsi                      |   10 +-
 .../boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dts  |    1 +
 .../boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dts  |    1 +
 .../boot/dts/imx6ull-phytec-segin-peb-av-02.dtsi   |   26 +
 arch/arm/boot/dts/imx6ull-phytec-segin.dtsi        |    7 -
 arch/arm/boot/dts/imx7-mba7.dtsi                   |   69 +-
 arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dts  |   25 +
 arch/arm/boot/dts/imx7d-flex-concentrator.dts      |  314 ++
 arch/arm/boot/dts/imx7d-mba7.dts                   |    7 +-
 arch/arm/boot/dts/imx7d.dtsi                       |    6 +
 arch/arm/boot/dts/imx7s-mba7.dts                   |    2 +-
 arch/arm/boot/dts/imx7s-warp.dts                   |    4 +-
 arch/arm/boot/dts/imx7s.dtsi                       |    6 +-
 arch/arm/boot/dts/keystone-k2g-evm.dts             |  112 +
 arch/arm/boot/dts/kirkwood-dockstar.dts            |    2 +-
 arch/arm/boot/dts/kirkwood-dreamplug.dts           |    2 +-
 arch/arm/boot/dts/kirkwood-goflexnet.dts           |    2 +-
 .../arm/boot/dts/kirkwood-guruplug-server-plus.dts |    2 +-
 arch/arm/boot/dts/kirkwood-iconnect.dts            |    2 +-
 arch/arm/boot/dts/kirkwood-iomega_ix2_200.dts      |    2 +-
 arch/arm/boot/dts/kirkwood-nsa3x0-common.dtsi      |    2 +-
 arch/arm/boot/dts/kirkwood.dtsi                    |    4 +-
 arch/arm/boot/dts/ls1021a.dtsi                     |   81 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts             |    2 +-
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts          |    2 +-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi    |  141 +-
 arch/arm/boot/dts/mstar-infinity.dtsi              |    7 +
 .../dts/mstar-infinity2m-ssd202d-ssd201htv2.dts    |   25 +
 arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi    |   14 +
 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi    |   12 +
 arch/arm/boot/dts/mstar-infinity2m.dtsi            |   22 +
 arch/arm/boot/dts/mstar-v7.dtsi                    |   12 +-
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi      |  967 ++++-
 arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi    |  477 +++
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts          |  490 +++
 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts         |  826 ++++
 arch/arm/boot/dts/nuvoton-npcm730.dtsi             |   44 +
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  367 +-
 arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi  |  157 +
 .../dts/nuvoton-npcm750-runbmc-olympus-pincfg.dtsi |  517 +++
 .../boot/dts/nuvoton-npcm750-runbmc-olympus.dts    | 1052 +++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             |   24 +-
 arch/arm/boot/dts/omap3-beagle-xm.dts              |   10 +-
 arch/arm/boot/dts/omap3-overo-base.dtsi            |    4 +-
 arch/arm/boot/dts/omap4-droid-bionic-xt875.dts     |   46 +
 arch/arm/boot/dts/omap4-droid4-xt894.dts           |  143 +
 arch/arm/boot/dts/omap4-kc1.dts                    |    6 +-
 arch/arm/boot/dts/omap4-panda-es.dts               |   34 +-
 arch/arm/boot/dts/omap4-sdp.dts                    |   26 +-
 arch/arm/boot/dts/omap5-l4.dtsi                    |    2 +-
 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi     |   35 +
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |   25 +
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    |  340 +-
 arch/arm/boot/dts/qcom-pma8084.dtsi                |    1 -
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |  222 +
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts            |   99 +
 arch/arm/boot/dts/rk3288-veyron-jaq.dts            |    2 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts         |    2 +-
 arch/arm/boot/dts/rk3288-veyron-tiger.dts          |    2 +-
 arch/arm/boot/dts/rk3288-vmarc-som.dtsi            |   40 +
 .../boot/dts/rockchip-radxa-dalang-carrier.dtsi    |   21 +
 arch/arm/boot/dts/rv1108.dtsi                      |    2 +-
 arch/arm/boot/dts/s3c2416-smdk2416.dts             |    2 +-
 arch/arm/boot/dts/s3c6410-smdk6410.dts             |    2 +-
 arch/arm/boot/dts/s5pv210-aquila.dts               |   12 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi               |    5 +-
 arch/arm/boot/dts/s5pv210-goni.dts                 |   14 +-
 arch/arm/boot/dts/s5pv210-smdkv210.dts             |   20 +-
 arch/arm/boot/dts/s5pv210.dtsi                     |    1 -
 arch/arm/boot/dts/sama5d2.dtsi                     |    7 +-
 arch/arm/boot/dts/sama5d3.dtsi                     |   26 +-
 arch/arm/boot/dts/sama5d4.dtsi                     |   22 -
 arch/arm/boot/dts/ste-ab8500.dtsi                  |    6 +-
 arch/arm/boot/dts/ste-ab8505.dtsi                  |    6 +-
 arch/arm/boot/dts/ste-dbx5x0.dtsi                  |    6 +-
 arch/arm/boot/dts/ste-href-stuib.dtsi              |    2 +-
 arch/arm/boot/dts/ste-href-tvk1281618-r2.dtsi      |    2 +-
 arch/arm/boot/dts/ste-href-tvk1281618-r3.dtsi      |    2 +-
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts     |    9 +-
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     |   12 +-
 arch/arm/boot/dts/stm32429i-eval.dts               |    1 +
 arch/arm/boot/dts/stm32h743.dtsi                   |    2 +-
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |   90 +-
 arch/arm/boot/dts/stm32mp151.dtsi                  |   41 +-
 arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts    |   35 +
 arch/arm/boot/dts/stm32mp157c-dk2.dts              |    4 +
 arch/arm/boot/dts/stm32mp157c-ed1.dts              |   12 +
 arch/arm/boot/dts/stm32mp157c-ev1.dts              |    1 +
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts          |    2 +-
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      |   19 +-
 arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   |  143 +
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |   39 +
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi       |    4 +
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |   38 +
 .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    |   64 +
 arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts           |  169 +
 arch/arm/boot/dts/sun8i-h3-zeropi.dts              |   85 +
 arch/arm/boot/dts/sun8i-s3-elimo-impetus.dtsi      |   44 +
 arch/arm/boot/dts/sun8i-s3-elimo-initium.dts       |   29 +
 arch/arm/boot/dts/sun8i-v3.dtsi                    |    5 +
 arch/arm/boot/dts/sun8i-v3s.dtsi                   |    6 +
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 |   13 +
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi         |    8 +
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi     |    8 +
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi       |   10 +
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi     |   10 +
 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi    |  419 ++
 arch/arm/boot/dts/tegra124.dtsi                    |   54 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |   27 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi             |    4 +
 arch/arm/boot/dts/tegra20-paz00.dts                |    4 +
 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi     |  109 +
 arch/arm/boot/dts/tegra20-ventana.dts              |   11 +
 arch/arm/boot/dts/tegra20.dtsi                     |   33 +-
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |   27 +-
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |    2 +-
 ...tegra30-asus-nexus7-grouper-memory-timings.dtsi |   12 +
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi |    2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 | 4519 ++++++++++++++++=
++++
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi     |  383 ++
 arch/arm/boot/dts/tegra30.dtsi                     |   33 +-
 arch/arm/boot/dts/vfxxx.dtsi                       |    6 +-
 arch/arm/boot/dts/zynq-7000.dtsi                   |    2 +-
 arch/arm/boot/dts/zynq-zc702.dts                   |    8 +-
 arch/arm/boot/dts/zynq-zc770-xm011.dts             |    2 +-
 arch/arm/boot/dts/zynq-zc770-xm013.dts             |    7 +-
 arch/arm/boot/dts/zynq-zturn-common.dtsi           |  112 +
 arch/arm/boot/dts/zynq-zturn-v5.dts                |   15 +
 arch/arm/boot/dts/zynq-zturn.dts                   |  101 +-
 arch/arm/boot/dts/zynq-zybo-z7.dts                 |    2 +-
 arch/arm/mach-mstar/mstarv7.c                      |   49 +
 arch/arm64/Kconfig.platforms                       |    8 +
 .../dts/allwinner/sun50i-a64-pinephone-1.0.dts     |    5 +
 .../dts/allwinner/sun50i-a64-pinephone-1.1.dts     |    5 +
 .../dts/allwinner/sun50i-a64-pinephone-1.2.dts     |   14 +
 .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi   |   68 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |   14 +
 .../dts/allwinner/sun50i-h6-pine-h64-model-b.dts   |   15 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |   15 +-
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |   10 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  131 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |    6 +
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |    2 +-
 .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |   17 +
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |   18 +
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |    2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |    2 +-
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |   42 +-
 .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |   40 +
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |   42 +-
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |    2 +-
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      |   40 +
 .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |   61 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi  |    2 +-
 .../boot/dts/amlogic/meson-gxl-s905d-p230.dts      |    2 +-
 .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |    4 +
 .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |   46 +-
 .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |    4 -
 .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   51 +-
 .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |    2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts     |    2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |    2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi         |   20 +
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |   15 +-
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |    2 +-
 arch/arm64/boot/dts/broadcom/Makefile              |    1 +
 arch/arm64/boot/dts/broadcom/bcm4908/Makefile      |    2 +
 .../broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts    |   66 +
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  |  187 +
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |   10 +-
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |    2 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |   39 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |   49 +-
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |    2 +-
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |   15 +-
 arch/arm64/boot/dts/freescale/Makefile             |    2 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |   69 +-
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts     |   18 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |    2 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |    2 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   30 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |   86 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |   72 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts  |  119 +
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |  136 +-
 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts  |  120 +
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |  278 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |   32 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  288 +-
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  |  334 ++
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |  326 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   16 +-
 .../boot/dts/freescale/imx8mm-kontron-n801x-s.dts  |  322 ++
 .../dts/freescale/imx8mm-kontron-n801x-som.dtsi    |  294 ++
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   53 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dts       |   32 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |   16 +-
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  158 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   64 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   45 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   39 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   68 +-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |   13 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi          |    5 +-
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi     |   27 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |    4 +-
 arch/arm64/boot/dts/hisilicon/hip05.dtsi           |   24 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi           |   14 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi           |  178 +-
 arch/arm64/boot/dts/marvell/Makefile               |    2 +
 .../dts/marvell/armada-3720-espressobin-emmc.dts   |   18 -
 .../dts/marvell/armada-3720-espressobin-ultra.dts  |  165 +
 .../marvell/armada-3720-espressobin-v7-emmc.dts    |   40 +-
 .../dts/marvell/armada-3720-espressobin-v7.dts     |   24 +-
 .../boot/dts/marvell/armada-3720-espressobin.dtsi  |   39 +-
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |    3 +-
 arch/arm64/boot/dts/marvell/armada-7040.dtsi       |    4 -
 .../dts/marvell/armada-8040-mcbin-singleshot.dts   |   22 +
 .../boot/dts/marvell/armada-8040-puzzle-m801.dts   |  523 +++
 arch/arm64/boot/dts/marvell/armada-8040.dtsi       |    4 -
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |   10 +-
 arch/arm64/boot/dts/mediatek/Makefile              |    3 +
 arch/arm64/boot/dts/mediatek/mt6779-evb.dts        |   31 +
 arch/arm64/boot/dts/mediatek/mt6779.dtsi           |  271 ++
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |   13 +-
 arch/arm64/boot/dts/mediatek/mt8167-pinfunc.h      |  744 ++++
 arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dts    |   20 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi           |   61 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |    1 -
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  164 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   28 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  408 +-
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts        |   29 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  512 +++
 arch/arm64/boot/dts/mediatek/mt8516.dtsi           |   40 +-
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |   28 +-
 arch/arm64/boot/dts/microchip/sparx5.dtsi          |   96 +
 arch/arm64/boot/dts/microchip/sparx5_pcb125.dts    |    5 +
 .../boot/dts/microchip/sparx5_pcb134_board.dtsi    |  258 ++
 .../boot/dts/microchip/sparx5_pcb135_board.dtsi    |   55 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   20 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |   16 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   61 +-
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi |    2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   19 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |    2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   20 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |    2 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |    2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   22 +-
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |    6 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    6 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |   10 -
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |   16 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  123 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |    4 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |  181 +-
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi       |    7 +-
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |   21 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |   29 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   40 +-
 .../boot/dts/qcom/msm8992-msft-lumia-talkman.dts   |   28 +
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |  120 +
 .../boot/dts/qcom/msm8994-msft-lumia-cityman.dts   |   73 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |   94 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |   10 +
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |   24 +
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |   96 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  108 +
 arch/arm64/boot/dts/qcom/sc7180-lite.dtsi          |   18 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts      |   11 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts   |    4 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts  |   12 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |   15 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |   17 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |   26 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts      |   15 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    7 +-
 .../boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi      |    4 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |   16 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  106 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  281 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |   11 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  206 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  183 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |  463 ++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |   17 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  801 ++++
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |  454 ++
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  491 ++-
 arch/arm64/boot/dts/renesas/Makefile               |    4 +
 .../dts/renesas/aistarvision-mipi-adapter-2.1.dtsi |    4 +-
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |   67 +-
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |    3 +-
 arch/arm64/boot/dts/renesas/cat875.dtsi            |    1 -
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |    6 +-
 ...hope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi |  109 +
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |    3 +-
 .../renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts  |   29 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |    2 +
 .../renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dts  |   16 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |    2 +
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |   67 +-
 .../boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts   |    3 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |    1 +
 .../renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts  |   16 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |    2 +
 .../boot/dts/renesas/r8a77951-salvator-xs.dts      |    2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   40 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |    2 +
 arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts   |   15 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   74 +
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |    2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  122 +
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |    3 +-
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |    3 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |    2 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |    2 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |    1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |    1 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |    2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |   14 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |    2 +-
 arch/arm64/boot/dts/rockchip/Makefile              |    4 +
 .../boot/dts/rockchip/px30-engicam-common.dtsi     |  124 +
 .../boot/dts/rockchip/px30-engicam-ctouch2.dtsi    |   30 +
 .../boot/dts/rockchip/px30-engicam-edimm2.2.dtsi   |   66 +
 .../px30-engicam-px30-core-ctouch2-of10.dts        |   77 +
 .../rockchip/px30-engicam-px30-core-ctouch2.dts    |   22 +
 .../rockchip/px30-engicam-px30-core-edimm2.2.dts   |   43 +
 .../boot/dts/rockchip/px30-engicam-px30-core.dtsi  |  237 +
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |   24 +
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts     |   21 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   16 +-
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |   74 +
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |  372 ++
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |   62 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |   15 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |   28 +-
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |   16 +
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |   13 +-
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi            |   43 +-
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |   71 +-
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |   33 +-
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |  114 +
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |   19 +
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi        |   94 +
 .../boot/dts/ti/k3-j721e-common-proc-board.dts     |   83 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          |  135 +-
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    |   42 +-
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi        |  110 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   60 +-
 arch/arm64/configs/defconfig                       |    1 +
 drivers/interconnect/qcom/sdm845.c                 |    3 +
 include/dt-bindings/clock/axg-clkc.h               |   25 +
 include/dt-bindings/clock/imx8-lpcg.h              |   14 +
 include/dt-bindings/gpio/msc313-gpio.h             |   53 +
 include/dt-bindings/interconnect/qcom,sdm845.h     |    2 +
 include/dt-bindings/memory/tegra124-mc.h           |   68 +
 include/dt-bindings/memory/tegra20-mc.h            |   53 +
 include/dt-bindings/memory/tegra30-mc.h            |   67 +
 include/dt-bindings/power/mt8183-power.h           |   26 +
 include/dt-bindings/power/mt8192-power.h           |   32 +
 595 files changed, 36134 insertions(+), 3026 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcm4908.=
yaml
 create mode 100644
Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
 create mode 100644
Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml
 delete mode 100644
Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt
 create mode 100644
Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/dsa/b53.txt
 create mode 100644 Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
 create mode 100644
Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml
 create mode 100644
Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/st,stusb160x.yaml
 create mode 100644 arch/arm/boot/dts/armada-382-rd-ac3x-48g4x2xl.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs305-1g-4s-bit.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs305-1g-4s.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs305-1g-4s.dtsi
 create mode 100644 arch/arm/boot/dts/armada-xp-crs326-24g-2s-bit.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs326-24g-2s.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs326-24g-2s.dtsi
 create mode 100644 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s-bit.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s.dtsi
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
 create mode 100644 arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi
 create mode 100644 arch/arm/boot/dts/exynos4412-p4note-n8010.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-p4note.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-alti6p.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-lanmcu.dts
 create mode 100644 arch/arm/boot/dts/imx6qp-prtwd3.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-emmc.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-peb-av-02.dtsi
 create mode 100644 arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dts
 create mode 100644 arch/arm/boot/dts/imx7d-flex-concentrator.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.d=
ts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus-pincfg=
.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
 create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts
 create mode 100644 arch/arm/boot/dts/sun8i-h3-zeropi.dts
 create mode 100644 arch/arm/boot/dts/sun8i-s3-elimo-impetus.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-s3-elimo-initium.dts
 create mode 100644 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts
 create mode 100644 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/zynq-zturn-common.dtsi
 create mode 100644 arch/arm/boot/dts/zynq-zturn-v5.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/Makefile
 create mode 100644
arch/arm64/boot/dts/broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dt=
s
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-som.=
dtsi
 create mode 100644
arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
 create mode 100644 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8167-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8167.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-lite.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dt=
s
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-hdk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-hdk.dts
 create mode 100644
arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dt=
si
 create mode 100644
arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts
 create mode 100644
arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dts
 create mode 100644
arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-edimm2.2.dtsi
 create mode 100644
arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts
 create mode 100644
arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dts
 create mode 100644
arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-px30-core.dts=
i
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
 create mode 100644 include/dt-bindings/clock/imx8-lpcg.h
 create mode 100644 include/dt-bindings/gpio/msc313-gpio.h
 create mode 100644 include/dt-bindings/power/mt8183-power.h
 create mode 100644 include/dt-bindings/power/mt8192-power.h
