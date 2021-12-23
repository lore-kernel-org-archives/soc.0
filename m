Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2682AC433EF
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 21:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11709C36AEC; Thu, 23 Dec 2021 21:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEE8C36AEA
	for <soc@kernel.org>; Thu, 23 Dec 2021 21:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640295331;
	bh=GOLgq25EU2m+mxDMQskGGZsNlu2cwskhF1M9PDBumzg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=QdRGbV9aItqs7KPKloIMCyVXGGHjghOepJIt+wMGm9yAdnq09l6hKSDYE921n/PJ3
	 GElTJNZqHpmnmh227EQslFiwbM8NNs5EtPCeDrVZf+1scLczW59ApWzVJqcqHBhLWy
	 /U0AMMLkTO+83vK3zABLPkzSpQtSYIjXqLo5yasQMCAXJzMlGJNbAPJscgHMhudfEj
	 bKwZUKkz03eGK8sefpxWl4LGOfDni8CbCJ8ElEShX6VVgUITpMrQIjvf/oyo7ajZ/Z
	 MpgiojN6hcxJML0msgVqVhpSUmViTrEAQlt96UNBu3ngBTqiWQM15blpE6LGSY/G+u
	 hUGYDTlyFBqfg==
Received: by mail-wr1-f47.google.com with SMTP id v11so13841999wrw.10
        for <soc@kernel.org>; Thu, 23 Dec 2021 13:35:30 -0800 (PST)
X-Gm-Message-State: AOAM531+4P8SwXGHvL9fJNdMJ+ALM/ykJC/BDxoCcTGVendWaZcF1iPa
	EnWQXXclVH2AHHSl5AmBQw9Wno2xPn3CB0z2fVY=
X-Google-Smtp-Source: ABdhPJzfMiAm7Y74bHwKsWViXB9i1bKVNK6pUZ0H9aNRnONyh3zCvr7+NBeOfBlF739edqz7cIH2N8rUmU8z6Ujhy/g=
X-Received: by 2002:a5d:484f:: with SMTP id n15mr2846266wrs.219.1640295328195;
 Thu, 23 Dec 2021 13:35:28 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 23 Dec 2021 22:35:11 +0100
X-Gmail-Original-Message-ID: <CAK8P3a23RO3B4be2x_gZV5sYy2JiAgPMFMO5QE8wQ9gLEa8ZVw@mail.gmail.com>
Message-ID: <CAK8P3a23RO3B4be2x_gZV5sYy2JiAgPMFMO5QE8wQ9gLEa8ZVw@mail.gmail.com>
Subject: [GIT PULL 4/5] ARM: SoC devicetree changes for v5.17
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6=
:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.17

for you to fetch changes up to 8b0c59c622dc4dab970ec63264fb5b152944ac80:

  Revert "ARM: dts: BCM5301X: define RTL8365MB switch on Asus
RT-AC88U" (2021-12-23 00:18:45 +0100)

----------------------------------------------------------------
ARM: SoC devicetree changes for v5.17

As usual, this is the bulk of the updates for the SoC tree, adding
more devices to existing files, addressing issues from ever improving
automated checking, and fixing minor issues.

The most interesting bits as usual are the new platforms.
All the newly supported SoCs belong into existing families
this time:

 - Qualcomm gets support for two newly announced platforms, both
   of which can now work in production environments: the SDX65
   5G modem that can run a minimal Linux on its Cortex-A7 core,
   and the Snapdragon 8 Gen 1, their latest high-end phone SoC.

 - Renesas adds support for R-Car S4-8, the most recent automotive
   Server/Communication SoC.

 - TI adds support for J721s2, a new automotive SoC in the K3
   family.

 - Mediatek MT7986a/b is a SoC used in Wifi routers, the latest
   generation following their popular MT76xx series. Only basic
   support is added for now.

 - NXP i.MX8 ULP8 is a new low-power variant of the widespread
   i.MX8 series.

 - TI SPEAr320s is a minor variant of the old SPEAr320 SoC that
   we have supported for a long time.

New boards with the existing SoCs include

 - Aspeed AST2500/AST2600 BMCs in TYAN, Facebook and Yadro servers

 - AT91/SAMA5 based evaluation board

 - NXP gains twenty new development and industrial boards for their
   i.MX and Layerscape SoCs

 - Intel IXP4xx now supports the final two machines in device tree
   that were previously only supported in old style board files.

 - Mediatek MT6589 is used in the Fairphone FP1 phone from 2013,
   while MT8183 is used in the Acer Chromebook 314.

 - Qualcomm gains support for the reference machines using the two
   new SoCs, plus a number of Chromebook variants and phones based
   on the Snapdragon 7c, 845 and 888 SoCs, including various
   Sony Xperia devices and the Microsoft Surface Duo 2.

 - ST STM32 now supports the Engicam i.Core STM32MP1 carrier board.

 - Tegra now boots various older Android devices based on 32-bit
   chips out of the box, including a number of ASUS Transformer
   tablets.
   There is also a new Jetson AGX Orin developer kit.

 - Apple support adds the missing device trees for all the remaining
   M1 Macbook and iMac variants, though not yet the M1 Pro/Max
   versions.

 - Allwinner now supports another version of the Tanix TX6 set-top
   box based on the H6 SoC.

 - Broadcom gains support for the Netgear RAXE500 Wireless router
   based on BCM4908.

----------------------------------------------------------------
Adam Ford (7):
      arm64: dts: imx8mm-beacon: Enable USB Controllers
      arm64: dts: imx8mm: Add CSI nodes
      arm64: dts: imx8mm-beacon: Enable OV5640 Camera
      dt-bindings: soc: imx: Add binding doc for spba bus
      ARM: dts: imx: Change spba to spba-bus
      arm64: dts: imx8mq-evk: link regulator to VPU domain
      dt-bindings: soc: add binding for i.MX8MN DISP blk-ctrl

Alex Bee (1):
      arm64: dts: rockchip: add interrupt and headphone-detection for
Rock Pi4's audio codec

Alex Marginean (1):
      arm64: dts: ls1028a-qds: add overlays for various serdes protocols

Alexander Stein (9):
      arm64: dts: amlogic: meson-g12: Fix thermal-zones indent
      arm64: dts: amlogic: meson-g12: Fix GPU operating point table node na=
me
      arm64: dts: amlogic: Fix SPI NOR flash node name for ODROID N2/N2+
      dt-bindings: arm: fsl: add TQMa8MxML boards
      dt-bindings: arm: fsl: add TQMa8MxNL boards
      dt-bindings: arm: fsl: add TQMa8Mx boards
      arm64: dts: freescale: add initial device tree for TQMa8MQML with i.M=
X8MM
      arm64: dts: freescale: add initial device tree for TQMa8MQNL with i.M=
X8MN
      arm64: dts: freescale: add initial device tree for TQMa8Mx with i.MX8=
M

Alexey Min (1):
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB

Ali El-Haj-Mahmoud (1):
      ARM: dts: aspeed: Add TYAN S8036 BMC machine

Alistair Francis (1):
      ARM: dts: imx7d-remarkable2: add wacom digitizer device

Andrei Kartashev (2):
      dt-bindings: vendor-prefixes: add YADRO
      ARM: dts: aspeed: add device tree for YADRO VEGMAN BMC

AngeloGioacchino Del Regno (3):
      arm64: dts: mediatek: mt8173: Add gce-client-reg to display od/ufo
      arm64: dts: mediatek: mt8173-elm: Move pwm pinctrl to pwm0 node
      arm64: dts: mediatek: mt8173-elm: Add backlight enable pin config

Anton Bambura (2):
      ARM: tegra: Add device-tree for ASUS Transformer Pad TF701T
      ARM: tegra: Enable video decoder on Tegra114

Ariel D'Alessandro (4):
      dt-bindings: Add vendor prefix for BSH Hausgeraete GmbH
      dt-bindings: arm: fsl: Add iMX8MN BSH SMM S2 boards
      dt-bindings: arm: fsl: Add BSH SMM-M2 IMX6ULZ SystemMaster board
      arm64: dts: imx8mn-bsh-smm-s2/pro: Add iMX8MN BSH SMM S2 boards

Arnaud Ferraris (2):
      arm64: dts: allwinner: add 'chassis-type' property
      arm64: dts: freescale: add 'chassis-type' property

Arnd Bergmann (35):
      Merge tag 'renesas-arm-dt-for-v5.17-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'renesas-dt-bindings-for-v5.17-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'ux500-dts-v5.17-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'asahi-soc-dt-5.17' of
https://github.com/AsahiLinux/linux into arm/dt
      Merge tag 'v5.17-rockchip-dts64-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'amlogic-arm64-dt-for-v5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/dt
      Merge tag 'at91-dt-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
      Merge tag 'ixp4xx-dtx-v5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'stm32-dt-for-v5.17-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into
arm/dt
      Merge tag 'asahi-soc-dt-5.17-v2' of
https://github.com/AsahiLinux/linux into arm/dt
      Merge tag 'socfpga_dts_update_for_v5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/dt
      Merge tag 'omap-for-v5.17/dt-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'sunxi-dt-for-5.17-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.17-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'renesas-dt-bindings-for-v5.17-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'tegra-for-5.17-dt-bindings' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'tegra-for-5.17-arm64-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'ti-k3-dt-for-v5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/dt
      Merge tag 'mvebu-dt64-5.17-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'mvebu-dt-5.17-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'imx-bindings-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt64-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'v5.16-next-dts64' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'v5.16-next-dts32' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'samsung-dt-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'tegra-for-5.17-arm-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'qcom-dts-for-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'qcom-arm64-for-5.17-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'arm-soc/for-5.17/devicetree' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'arm-soc/for-5.17/devicetree-arm64' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'arm-soc/for-5.17/drivers' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'aspeed-5.17-devicetree' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/dt
      Revert "ARM: dts: BCM5301X: define RTL8365MB switch on Asus RT-AC88U"

Ar=C4=B1n=C3=A7 =C3=9CNAL (3):
      ARM: dts: BCM5301X: remove unnecessary address & size cells from
Asus RT-AC88U
      ARM: dts: BCM5301X: define RTL8365MB switch on Asus RT-AC88U
      ARM: dts: BCM5301X: correct RX delay and enable flow control on
Asus RT-AC88U

Aswath Govindraju (8):
      arm64: dts: ti: am654-base-board/am65-iot2050-common: Disable mcan no=
des
      arm64: dts: ti: k3-am64-main: Add support for MCAN
      arm64: dts: ti: k3-am642-evm/sk: Add support for main domain
mcan nodes in EVM and disable them on SK
      dt-bindings: arm: ti: Add bindings for J721s2 SoC
      dt-bindings: pinctrl: k3: Introduce pinmux definitions for J721S2
      arm64: dts: ti: Add initial support for J721S2 SoC
      arm64: dts: ti: Add initial support for J721S2 System on Module
      arch: arm64: ti: Add support J721S2 Common Processor Board

Baruch Siach (1):
      arm64: dts: qcom: ipq6018: Fix gpio-ranges property

Ben Tseng (1):
      arm64: dts: mt8183-kukui: Update Tboard sensor mapping table

Biju Das (13):
      arm64: dts: renesas: cat875: Add rx/tx delays
      dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks
      arm64: dts: renesas: r9a07g044: Sort psci node
      arm64: dts: renesas: r9a07g044: Add OSTM nodes
      arm64: dts: renesas: rzg2l-smarc-som: Enable OSTM
      arm64: dts: renesas: r9a07g044: Rename SDHI clocks
      arm64: dts: renesas: r9a07g044: Add WDT nodes
      arm64: dts: renesas: rzg2l-smarc-som: Enable watchdog
      arm64: dts: renesas: r9a07g044: Add OPP table
      arm64: dts: renesas: r9a07g044: Add TSU node
      arm64: dts: renesas: r9a07g044: Create thermal zone to support IPA
      arm64: dts: renesas: r9a07g044: Add Mali-G31 GPU node
      arm64: dts: renesas: rzg2l-smarc-som: Add vdd core regulator

Biwen Li (5):
      arm64: dts: lx2162a-qds: add interrupt line for RTC node
      arm64: dts: ls1028a: add ftm_alarm1 node to be used as wakeup source
      arm64: dts: ls1028a: add flextimer based pwm nodes
      arm64: dts: ls1028a-rdb: enable pwm0
      arm64: dts: ls1028a-qds: move rtc node to the correct i2c bus

Bjorn Andersson (5):
      Merge tag
'e15509b2b7c9b600ab38c5269d4fac609c077b5b.1638861860.git.quic_vamslank@quic=
inc.com'
into dts-for-5.17
      Merge tag '20211207114003.100693-2-vkoul@kernel.org' into arm64-for-5=
.17
      arm64: dts: qcom: pm8998: Add ADC Thermal Monitor node
      arm64: dts: qcom: sdm845: mtp: Add vadc channels and thermal zones
      arm64: dts: qcom: sm6125: Avoid using missing SM6125_VDDCX

Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus-*: add msm-id and board-id

Chanho Park (1):
      arm64: dts: exynos: convert serial_0 to USI on ExynosAutov9

Chris Packham (2):
      arm/arm64: dts: Enable CP0 GPIOs for CN9130-CRB
      arm/arm64: dts: Add MV88E6393X to CN9130-CRB device tree

Christian Gmeiner (1):
      arm64: dts: ti: k3-am64-main: add timesync router node

Christian Hewitt (3):
      arm64: dts: meson-gxbb-wetek: fix HDMI in early boot
      arm64: dts: meson-gxbb-wetek: fix missing GPIO binding
      arm64: dts: meson-gxbb-wetek: use updated LED bindings

Christian Lamparter (2):
      ARM: BCM53016: MR32: convert to Broadcom iProc I2C Driver
      ARM: dts: gemini: NAS4220-B: fis-index-block with 128 KiB sectors

Christoph Niedermaier (3):
      ARM: dts: imx6qdl-dhcom: Align PHY reset timing with other DHCOM SoMs
      ARM: dts: imx6qdl-dhcom: Identify the PHY by ethernet-phy-id0007.c0f0
      ARM: dts: imx6qdl-dhcom: Add USB overcurrent pin on SoM layer

Dang Huynh (9):
      arm64: dts: qcom: sdm630: Assign numbers to eMMC and SD
      arm64: dts: qcom: sdm630-pm660: Move RESIN to pm660 dtsi
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add RPM and fixed regulator=
s
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add PWRKEY and RESIN
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD
      arm64: dts: qcom: sdm660-xiaomi-lavender: Enable Simple Framebuffer
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume up button
      arm64: dts: qcom: Drop input-name property
      ARM: dts: qcom: Drop input-name property

David Heidelberg (9):
      ARM: dts: qcom: update USB nodes with new platform specific compatibl=
e
      arm64: dts: qcom: msm8996: drop not documented adreno properties
      arm64: dts: imx8mq: fix the schema check errors for fsl,tmu-calibrati=
on
      arm64: dts: rockchip: Add missing secondary compatible for PX30 DSI
      ARM: tegra: Rename top-level clocks
      ARM: tegra: nexus7: Drop clock-frequency from NFC node
      arm64: qcom: dts: drop legacy property #stream-id-cells
      arm64: dts: qcom: sdm845: add QFPROM chipset specific compatible
      dt-bindings: ARM: tegra: Document Pegatron Chagall

David Virag (1):
      dt-bindings: arm: samsung: document jackpotlte board binding

Dennis Gilmore (2):
      arm64: dts: rockchip: define usb hub and 2.5GbE nic on helios64
      arm64: dts: rockchip: add variables for pcie completion to helios64

Dikshita Agarwal (1):
      arm64: dts: qcom: sc7280: Add venus DT node

Dillon Min (1):
      ARM: dts: stm32: fix dtbs_check warning on ili9341 dts binding
on stm32f429 disco

Dinh Nguyen (1):
      arm64: dts: n5x: add qspi, usb, and ethernet support

Dmitry Baryshkov (8):
      arm64: dts: qcom: apq8096-db820c: specify adsp firmware name
      arm64: dts: qcom: apq8096-db820c: add missing regulator details
      arm64: dts: qcom: apq8096-db820c: correct lvs1 and lvs2 supply proper=
ty
      arm64: dts: qcom: msm8994-sony-xperia-kitakami: correct lvs1 and
lvs2 supply property
      arm64: dts: qcom: msm8996-sony-xperia-tone: fix SPMI regulators
declaration
      arm64: dts: qcom: msm8916: fix MMC controller aliases
      arm64: dts: qcom: sm8450: Add rpmhpd node
      arm64: dts: qcom: sm8450: add i2c13 and i2c14 device nodes

Dmitry Osipenko (22):
      ARM: dts: elpida_ecb240abacn: Change Elpida compatible
      ARM: tegra: Rename top-level regulators
      ARM: tegra: Rename CPU and EMC OPP table device-tree nodes
      ARM: tegra: Add device-tree for 1080p version of Nyan Big
      ARM: tegra: Enable HDMI CEC on Nyan
      ARM: tegra: Enable CPU DFLL on Nyan
      ARM: tegra: Add CPU thermal zones to Nyan device-tree
      ARM: tegra: Add 500 MHz entry to Tegra30 memory OPP table
      ARM: tegra: Add OPP tables and power domains to Tegra20 device-trees
      ARM: tegra: Add OPP tables and power domains to Tegra30 device-trees
      ARM: tegra: Add Memory Client resets to Tegra20 GR2D, GR3D and Host1x
      ARM: tegra: Add Memory Client resets to Tegra30 GR2D, GR3D and Host1x
      ARM: tegra20/30: Disable unused host1x hardware
      ARM: tegra: Add S/PDIF node to Tegra20 device-tree
      ARM: tegra: Add HDMI audio graph to Tegra20 device-tree
      ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
      ARM: tegra: paz00: Enable S/PDIF and HDMI audio
      dt-bindings: clock: tegra-car: Document new clock sub-nodes
      dt-bindings: host1x: Document OPP and power domain properties
      dt-bindings: host1x: Document Memory Client resets of Host1x,
GR2D and GR3D
      media: dt: bindings: tegra-vde: Convert to schema
      media: dt: bindings: tegra-vde: Document OPP and power domain

Dmitry Shmidt (1):
      arm64: dts: meson-sm1-odroid: add cec nodes

Drew Fustini (2):
      ARM: dts: am335x-boneblack-common: move system-power-controller
      ARM: dts: am335x-icev2: Add system-power-controller to RTC node

Eddie James (2):
      ARM: dts: aspeed: p10: Enable USB host ports
      ARM: dts: aspeed: p10: Add TPM device

Erwan Le Ray (2):
      ARM: dts: stm32: add pull-up to USART3 and UART7 RX pins on
STM32MP15 DKx boards
      ARM: dts: stm32: clean uart4_idle_pins_a node for stm32mp15

Fabien Parent (3):
      arm64: dts: mediatek: mt8192: fix i2c node names
      arm64: dts: mediatek: mt8516: remove 2 invalid i2c clocks
      arm64: dts: mediatek: mt8183-evb: Add node for thermistor

Fabio Estevam (1):
      arm64: dts: imx8mm/n: Remove the 'pm-ignore-notify' property

Fabrice Gasnier (3):
      ARM: dts: stm32: tune the HS USB PHYs on stm32mp15xx-dkx
      ARM: dts: stm32: tune the HS USB PHYs on stm32mp157c-ev1
      ARM: dts: stm32: fix stusb1600 pinctrl used on stm32mp157c-dk

Faiz Abbas (3):
      arm64: dts: ti: k3-am65-mcu: Add Support for MCAN
      arm64: dts: ti: k3-j721e: Add support for MCAN nodes
      arm64: dts: ti: k3-j721e-common-proc-board: Add support for mcu
and main mcan nodes

Florian Fainelli (7):
      Merge tag 'tags/bcm2835-dt-next-2021-12-13' into devicetree/next
      ARM: dts: Cygnus: Fixed iProc PCIe controller properties
      ARM: dts: Cygnus: Update PCIe PHY node unit name(s)
      ARM: dts: HR2: Fixed iProc PCIe MSI sub-node
      ARM: dts: NSP: Fixed iProc PCIe MSI sub-node
      ARM: dts: NSP: Rename SATA unit name
      Merge tag 'tags/bcm2835-bindings-2021-12-18' into devicetree/next

Florian Klink (1):
      arm64: dts: rockchip: Enable HDD power on helios64

Geert Uytterhoeven (6):
      ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add missing camera regulators
      arm64: dts: imx: imx8mn-beacon: Drop undocumented clock-names referen=
ce
      arm64: dts: renesas: Fix operating point table node names
      Merge tag 'renesas-r8a779f0-dt-binding-defs-tag' into
renesas-arm-dt-for-v5.17
      ARM: dts: motorola-mapphone: Drop second ti,wlcore compatible value
      arm64: dts: renesas: Fix pin controller node names

Giulio Benetti (17):
      ARM: dts: imx1: drop "fsl,imx-clk32"
      ARM: dts: imx25: drop "fsl,imx-osc"
      ARM: dts: imx50: drop "fsl,imx-osc"
      ARM: dts: imx50: drop "fsl,imx-ckil"
      ARM: dts: imx50: drop "fsl,imx-ckih1"
      ARM: dts: imx50: drop "fsl,imx-ckih2"
      ARM: dts: imx51: drop "fsl,imx-osc"
      ARM: dts: imx51: drop "fsl,imx-ckil"
      ARM: dts: imx51: drop "fsl,imx-ckih1"
      ARM: dts: imx51: drop "fsl,imx-ckih2"
      ARM: dts: imx53: drop "fsl,imx-osc"
      ARM: dts: imx53: drop "fsl,imx-ckil"
      ARM: dts: imx53: drop "fsl,imx-ckih1"
      ARM: dts: imx53: drop "fsl,imx-ckih2"
      ARM: dts: imx6qdl: drop "fsl,imx-osc"
      ARM: dts: imx6qdl: drop "fsl,imx-ckil"
      ARM: dts: imx6qdl: drop "fsl,imx-ckih1"

Hari Prasath (1):
      ARM: dts: at91: update alternate function of signal PD20

Hector Martin (19):
      dt-bindings: i2c: apple,i2c: Add power-domains property
      dt-bindings: iommu: apple,dart: Add power-domains property
      dt-bindings: pinctrl: apple,pinctrl: Add power-domains property
      dt-bindings: interrupt-controller: apple,aic: Add power-domains prope=
rty
      MAINTAINERS: Add PMGR power state files to ARM/APPLE MACHINE
      dt-bindings: power: Add apple,pmgr-pwrstate binding
      dt-bindings: arm: apple: Add apple,pmgr binding
      arm64: dts: apple: t8103: Add PMGR nodes
      arm64: dts: apple: t8103: Add UART2
      arm64: dts: apple: t8103: Remove PCIe max-link-speed properties
      dt-bindings: power: apple,pmgr-pwrstate: Add apple,min-state prop
      arm64: dts: apple: t8103: Add apple,min-state to DCP PMGR nodes
      dt-bindings: arm: apple: Add t6000/t6001 MacBook Pro 14/16" compatibl=
es
      dt-bindings: i2c: apple,i2c: Add apple,t6000-i2c compatible
      dt-bindings: pci: apple,pcie: Add t6000 support
      dt-bindings: pinctrl: apple,pinctrl: Add apple,t6000-pinctrl compatib=
le
      arm64: dts: apple: t8103: Rename clk24 to clkref
      arm64: dts: apple: t8103: Sort nodes by address
      dt-bindings: mailbox: apple,mailbox: Add power-domains property

Herve Codina (2):
      ARM: dts: spear3xx: Use plgpio regmap in SPEAr310 and SPEAr320
      ARM: dts: spear3xx: Add spear320s dtsi

Howard Chiu (1):
      ARM: dts: aspeed: Adding Facebook Bletchley BMC

Hsin-Yi Wang (7):
      arm64: dts: mt8183: jacuzzi: remove unused ddc-i2c-bus
      arm64: dts: mt8183: Add kukui-jacuzzi-cozmo board
      arm64: dts: mt8183: Add more fennel SKUs
      arm64: dts: mt8183: Add kakadu sku22
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-cozmo
      dt-bindings: arm64: dts: mediatek: Add more SKUs for mt8183 fennel bo=
ard
      dt-bindings: arm64: dts: mediatek: Add sku22 for mt8183 kakadu board

Ioana Radulescu (1):
      arm64: dts: lx2160a-rdb: Add Inphi PHY node

Ivan Bornyakov (1):
      dt-bindings: bus: imx-weim: add words about continuous bclk

Jacky Bai (3):
      dt-bindings: arm: fsl: Add binding for imx8ulp evk
      arm64: dts: imx8ulp: Add the basic dtsi file for imx8ulp
      arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board

Jae Hyun Yoo (3):
      ARM: dts: aspeed: add LCLK setting into LPC IBT node
      dt-bindings: ipmi: bt-bmc: add 'clocks' as a required property
      ARM: dts: aspeed: add LCLK setting into LPC KCS nodes

Jagan Teki (4):
      ARM: dts: stm32: Enable LVDS panel on i.Core STM32MP1 EDIMM2.2
      dt-bindings: arm: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0 10.1=
" OF
      ARM: dts: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0 10.1" OF
      arm64: dts: rockchip: Fix Bluetooth on ROCK Pi 4 boards

Janne Grunau (7):
      arm64: dts: apple: change ethernet0 device type to ethernet
      dt-bindings: i2c: apple,i2c: allow multiple compatibles
      arm64: dts: apple: add #interrupt-cells property to pinctrl nodes
      dt-bindings: arm: apple: Add iMac (24-inch 2021) to Apple bindings
      arm64: dts: apple: Add missing M1 (t8103) devices
      arm64: dts: apple: t8103: Add i2c nodes
      arm64: dts: apple: t8103: Add cd321x nodes

Jason Wang (1):
      ARM: dts: imx: Fix typo in pinfunc comments

Jayesh Choudhary (1):
      arm64: dts: ti: iot2050: Disable mcasp nodes at dtsi level

Jernej Skrabec (13):
      arm64: dts: allwinner: h6: tanix-tx6: Add SPDIF
      arm64: dts: allwinner: h6: tanix-tx6: Add I2C node
      ARM: dts: sun8i: h3: beelink-x2: Sort nodes
      arm64: dts: allwinner: a64: Add CEC clock to HDMI
      ARM: dts: sunxi: Add CEC clock to DW-HDMI
      ARM: dts: sun8i: h3: beelink-x2: Add GPIO CEC node
      ARM: dts: sun8i: Adjust power key nodes
      arm64: dts: allwinner: h6: tanix-tx6: Split to DT and DTSI
      dt-bindings: arm: sunxi: Add Tanix TX6 mini
      arm64: dts: allwinner: h6: Add Tanix TX6 mini dts
      arm64: dts: allwinner: h6: tanix: Add MMC1 node
      arm64: dts: allwinner: h6: tanix-tx6: Enable bluetooth
      arm64: dts: allwinner: h6: Add Hantro G2 node

Jerome Brunet (2):
      arm64: dts: meson: p241: add vcc_5v regulator
      arm64: dts: meson: p241: add sound support

Joakim Zhang (7):
      arm64: dts: imx8mn-evk: add hardware reset for FEC PHY
      arm64: dts: imx8mp-evk: add hardware reset for EQOS PHY
      arm64: dts: imx8m: disable smart eee for FEC PHY
      arm64: dts: imx8m: configure FEC PHY VDDIO voltage
      arm64: dts: imx8mp-evk: disable CLKOUT clock for ENET PHY
      arm64: dts: imx8m: remove unused "nvmem_macaddr_swap" property for FE=
C
      arm64: dts: imx8mp: add mac address for EQOS

Joel Stanley (2):
      dt-bindings: aspeed: Add Secure Boot Controller bindings
      ARM: dts: aspeed: Add secure boot controller node

Jon Hunter (4):
      dt-bindings: Add YAML bindings for NVENC and NVJPG
      arm64: tegra: Add NVENC and NVJPG nodes for Tegra186 and Tegra194
      arm64: tegra: Add ISO SMMU controller for Tegra194
      arm64: tegra: Add dma-coherent for Tegra194 VIC

Julian Ribbeck (1):
      arm64: dts: qcom: Add device tree for Samsung J5 2015 (samsung-j5)

Kate Doeen (2):
      arm64: dts: qcom: sdm845-oneplus-common: set venus firmware path
      arm64: dts: qcom: sdm845-xiaomi-beryllium: set venus firmware path

Katherine Perez (1):
      arm64: dts: qcom: add minimal DTS for Microsoft Surface Duo 2

Kieran Bingham (6):
      arm64: dts: renesas: ulcb: Merge hdmi0_con
      arm64: dts: renesas: salvator-common: Merge hdmi0_con
      arm64: dts: renesas: r8a779a0: Add DU support
      arm64: dts: renesas: Fix thermal bindings
      arm64: dts: renesas: r8a779a0: Add DSI encoders
      arm64: dts: renesas: falcon-cpu: Add DSI display output

Kishon Vijay Abraham I (2):
      arm64: dts: ti: j7200-main: Fix 'dtbs_check' serdes_ln_ctrl node
      arm64: dts: ti: j721e-main: Fix 'dtbs_check' in serdes_ln_ctrl node

Konrad Dybcio (18):
      arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C / XZ3
(Tama platform)
      arm64: dts: qcom: sm8350: Move gpio.h inclusion to SoC DTSI
      arm64: dts: qcom: sm8350: Add missing QUPv3 ID2
      arm64: dts: qcom: sm8350: Add redistributor stride to GICv3
      arm64: dts: qcom: sm8350: Specify clock-frequency for arch timer
      arm64: dts: qcom: sm[68]350: Use interrupts-extended with pdc interru=
pts
      arm64: dts: qcom: sm8350: Shorten camera-thermal-bottom name
      arm64: dts: qcom: *8350* Consolidate PON/RESIN usage
      arm64: dts: qcom: sm8350: Describe GCC dependency clocks
      arm64: dts: qcom: sm8350: Set up WRAP0 QUPs
      arm64: dts: qcom: sm8350: Set up WRAP1 QUPs
      arm64: dts: qcom: sm8350: Set up WRAP2 QUPs
      arm64: dts: qcom: sm8350: Assign iommus property to QUP WRAPs
      arm64: dts: qcom: Add support for Xperia 1 III / 5 III
      arm64: dts: qcom: sm8350-sagami: Enable and populate I2C/SPI nodes
      arm64: dts: qcom: sm8350-sagami: Configure remote processors
      arm64: dts: qcom: sm8350: Add LLCC node
      Revert "arm64: dts: qcom: sm8350: Specify clock-frequency for arch ti=
mer"

Krzysztof Kozlowski (1):
      Merge branch 'for-v5.17/dt-usi' into next/dt64

Kshitiz Godara (2):
      arm64: dts: qcom: sc7280: Define EC and H1 nodes for IDP/CRD
      arm64: dts: qcom: sc7280-crd: Add Touchscreen and touchpad support

Kuldeep Singh (1):
      arm64: dts: lx2162a: Add CAN nodes for LX2162A-QDS

Lad Prabhakar (6):
      arm64: dts: renesas: r9a07g044: Add SCIF[1-4] nodes
      arm64: dts: renesas: rzg2l-smarc: Enable SCIF2 on carrier board
      arm64: dts: renesas: r9a07g044: Add SCI[0-1] nodes
      arm64: dts: renesas: r9a07g044: Add RSPI{0,1,2} nodes
      arm64: dts: renesas: rzg2l-smarc: Enable RSPI1 on carrier board
      arm64: dts: renesas: rzg2l-smarc-som: Enable serial NOR flash

Laurent Pinchart (3):
      ARM: dts: imx7s-warp: Drop undefined property in mipi_csi node
      ARM: dts: imx7: Drop reset-names property for mipi_csi node
      ARM: dts: imx7: Group mipi_csi 'port' children in a 'ports' node

Lei YU (2):
      ARM: dts: Add openbmc-flash-layout-64-alt.dtsi
      ARM: dts: aspeed: g220a: Enable secondary flash

Li Yang (2):
      arm64: dts: ls1088a: Add reboot nodes
      arm64: dts: ls1088a: add snps incr burst type adjustment for usb1

Linus Walleij (4):
      ARM: dts: ux500: Add reset lines to IP blocks
      ARM: dts: ux500: Fixup Gavini magnetometer
      ARM: dts: Add FSG3 system controller and LEDs
      ARM: dts: Add Goramo MultiLink device tree

Luca Weiss (6):
      arm: dts: mt6589: Add device tree for Fairphone 1
      arm64: dts: qcom: sm6350: Fix validation errors
      arm64: dts: qcom: sm6350: Add MPSS nodes
      arm64: dts: qcom: sm6350: Add ADSP nodes
      arm64: dts: qcom: sm6350: Add CDSP nodes
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable ADSP, CDSP & MPSS

Lucas Stach (3):
      arm64: dts: nitrogen8-som: correct network PHY reset
      arm64: dts: nitrogen8-som: correct i2c1 pad-ctrl
      arm64: dts: imx8mm: don't assign PLL2 in SoC dtsi

Manivannan Sadhasivam (6):
      ARM: dts: qcom: sdx55: Add support for PCIe PHY
      ARM: dts: qcom: sdx55-fn980: Enable PCIE0 PHY
      ARM: dts: qcom: sdx55: Add support for PCIe EP
      ARM: dts: qcom: sdx55-fn980: Enable PCIe EP
      ARM: dts: qcom: sdx55-fn980: Enable IPA
      ARM: dts: qcom: sdx55-t55: Enable IPA

Marek Beh=C3=BAn (1):
      ARM: dts: armada-38x: Add generic compatible to UART nodes

Mark Kettenis (1):
      arm64: dts: apple: t8103: Expose PCI node for the WiFi MAC address

Markus Niebel (1):
      ARM: dts: imx6qdl: add TQ-Systems MBa6x device trees

Martin Botka (2):
      arm64: dts: qcom: sm6125: Add RPMPD node
      arm64: dts: qcom: sm6125: Add power domains to sdhc

Martin Kepplinger (4):
      arm64: dts: split out a shared imx8mq-librem5-r3.dtsi description
      arm64: dts: imx8mq-librem5: describe power supply for cameras
      arm64: dts: imx8mq-librem5: describe the selfie cam
      arm64: dts: imx8mq-librem5-r3.dtsi: describe selfie cam XSHUTDOWN pin

Matthew Hagan (1):
      ARM: dts: NSP: MX65: add qca8k falling-edge, PLL properties

Matthias Schiffer (2):
      ARM: dts: imx6qdl-tqma6: add ERR006687 hardware workaround for "a" va=
riant
      dt-bindings: arm: fsl: add TQ-Systems boards based on i.MX6Q/QP/DL

Maxim Schwalm (2):
      ARM: tegra: Add common device-tree for LVDS display panels of
Tegra30 ASUS tablets
      ARM: tegra: nexus7: Use common LVDS display device-tree

Maxime Ripard (1):
      dt-bindings: crypto: Add optional dma properties

Meng Li (1):
      arm64: dts: fsl-ls1043a-rdb: add delay between CS and CLK signal
for flash device

Michael Trimarchi (1):
      ARM: dts: imx6ulz-bsh-smm-m2: Add BSH SMM-M2 IMX6ULZ SystemMaster

Michal Vok=C3=A1=C4=8D (2):
      dt-bindings: arm: fsl: Add Y Soft IOTA Crux/Crux+ boards
      ARM: dts: imx6dl-yapp4: Add Y Soft IOTA Crux/Crux+ board

Micha=C5=82 Miros=C5=82aw (1):
      ARM: tegra: Add device-tree for ASUS Transformer Pad TF300T

Mihai Sain (1):
      ARM: dts: at91: sama5d2_xplained: remove PA11__SDMMC0_VDDSEL from pin=
ctrl

Mikko Perttunen (6):
      dt-bindings: Update headers for Tegra234
      arm64: tegra: Add clock for Tegra234 RTC
      arm64: tegra: Update Tegra234 BPMP channel addresses
      arm64: tegra: Fill in properties for Tegra234 eMMC
      arm64: tegra: Add Tegra234 TCU device
      arm64: tegra: Add NVIDIA Jetson AGX Orin Developer Kit support

Miquel Raynal (3):
      ARM: dts: am437x-cm-t43: Use a correctly spelled DT property
      ARM: dts: am43xx: Describe the magnetic reader/ADC1 hardware module
      ARM: dts: am437x-gp-evm: enable ADC1

Nicolas Frattaroli (2):
      arm64: dts: rockchip: Add spi nodes on rk356x
      arm64: dts: rockchip: Add spi1 pins on Quartz64 A

Nikola Milosavljevic (1):
      ARM: tegra: Add device-tree for ASUS Transformer EeePad TF101

Nishanth Menon (4):
      arm64: dts: ti: k3-am642: Fix the L2 cache sets
      arm64: dts: ti: k3-j7200: Fix the L2 cache sets
      arm64: dts: ti: k3-j721e: Fix the L2 cache sets
      arm64: dts: ti: k3-j7200: Correct the d-cache-sets info

Oleksij Rempel (4):
      dt-bindings: vendor-prefixes: Add an entry for JOZ BV
      dt-bindings: arm: fsl: add JOZ Access Point
      ARM: dts: add JOZ Access Point
      ARM: dts: at91: add Microchip EVB-KSZ9477 board

Oskar Senft (2):
      ARM: dts: aspeed: tyan-s7106: Update nct7802 config
      ARM: dts: aspeed: tyan-s7106: Add uart_routing and fix vuart config

Pali Roh=C3=A1r (1):
      arm64: dts: marvell: armada-37xx: Add xtal clock to comphy node

Pankaj Bansal (1):
      arm64: dts: lx2160a-qds: Add mdio mux nodes

Pankaj Gupta (1):
      arm64: dts: lx2160a: add optee-tz node

Paul Cercueil (2):
      ARM: dts: exynos: Fix BCM4330 Bluetooth reset polarity in I9100
      ARM: dts: exynos: Use interrupt for BCM4330 host wakeup in I9100

Peng Fan (7):
      arm64: dts: imx8m: add cache info
      arm64: dts: imx8qm: add cache info
      arm64: dts: imx8qxp: add cache info
      arm64: dts: ti: k3-j721e: correct cache-sets info
      dt-bindings: power: imx8ulp: add power domain header file
      arm64: dts: imx8ulp: add scmi firmware node
      arm64: dts: imx8ulp: add power domain entry for usdhc

Philip Chen (4):
      arm64: dts: qcom: sc7180: Include gpio.h in edp bridge dts
      arm64: dts: qcom: sc7180: Specify "data-lanes" for DSI host output
      arm64: dts: qcom: sc7180: Support Lazor/Limozeen rev9
      arm64: dts: qcom: sc7180: Support Homestar rev4

Prasad Malisetty (3):
      arm64: dts: qcom: sc7280: Fix incorrect clock name
      arm64: dts: qcom: sc7280: Add pcie clock support
      arm64: dts: qcom: sc7280: Fix 'interrupt-map' parent address cells

Prashant Malani (1):
      arm64: dts: mt8183: kukui: Add Type C node

Prathamesh Shete (2):
      arm64: tegra: Add support to enumerate SD in UHS mode
      arm64: tegra: Update SDMMC4 speeds for Tegra194

Quan Nguyen (2):
      ARM: dts: aspeed: mtjade: Add I2C buses for NVMe devices
      ARM: dts: aspeed: mtjade: Add uefi partition

Rafa=C5=82 Mi=C5=82ecki (4):
      ARM: dts: BCM5301X: update CRU block description
      dt-bindings: arm: bcm: document Netgear RAXE500 binding
      arm64: dts: broadcom: bcm4908: add DT for Netgear RAXE500
      ARM: dts: BCM5301X: use non-deprecated USB 2.0 PHY binding

Rajendra Nayak (2):
      dt-bindings: arm: qcom: Document qcom,sc7280-crd board
      arm64: dts: qcom: sc7280-crd: Add device tree files for CRD

Ran Wang (1):
      arm64: dts: lx2160a: enable usb3-lpm-capable for usb3 nodes

Rob Herring (1):
      ARM: dts: Remove "spidev" nodes

Robert Marko (3):
      arm64: dts: qcom: ipq8074: add MDIO bus
      arm64: dts: marvell: cn9130: add GPIO and SPI aliases
      arm64: dts: marvell: cn9130: enable CP0 GPIO controllers

Russell King (Oracle) (2):
      ARM: dts: vf610-zii-dev-rev-b: correct phy-mode for 6185 dsa link
      ARM: dts: vf610-zii-dev-rev-b: specify phy-mode for external PHYs

Sam Protsenko (7):
      ARM: dts: exynos: Rename hsi2c nodes to i2c for Exynos5260
      arm64: dts: exynos: Rename hsi2c nodes to i2c for Exynos5433 and Exyn=
os7
      dt-bindings: soc: samsung: Add Exynos USI bindings
      dt-bindings: soc: samsung: Fix I2C clocks order in USI binding exampl=
e
      dt-bindings: Add vendor prefix for WinLink
      dt-bindings: arm: samsung: Document E850-96 board binding
      dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos85=
0

Sam Shih (4):
      dt-bindings: arm64: dts: mediatek: Add mt7986 series
      arm64: dts: mediatek: add basic mt7986 support
      arm64: dts: mediatek: add pinctrl support for mt7986a
      arm64: dts: mediatek: add pinctrl support for mt7986b

Samuel Holland (5):
      dt-bindings: clock: sunxi: Export CLK_DRAM for devfreq
      dt-bindings: arm: sunxi: Expand MBUS binding
      dt-bindings: arm: sunxi: Add H5 MBUS compatible
      ARM: dts: sunxi: h3/h5: Update MBUS node
      arm64: dts: allwinner: a64: Update MBUS node

Sascha Hauer (1):
      arm64: dts: rockchip: Change pwm pinctrl-name to "default" on rk356x

Seiya Wang (1):
      arm64: dts: mt8183: support coresight-cpu-debug for mt8183

Shawn Guo (1):
      arm64: dts: qcom: Add missing vdd-supply for QUSB2 PHY

Sin Hui Kho (1):
      arm64: dts: Update NAND MTD partition for Agilex and Stratix 10

Srinivas Kandagatla (6):
      arm64: dts: qcom: sm8250: Add nodes for tx and rx macros with
soundwire masters
      arm64: dts: qcom: sm8250-mtp: Add wcd9380 audio codec node
      arm64: dts: qcom: sm8250-mtp: Add wsa8810 audio codec node
      arm64: dts: qcom: sm8250-mtp: add sound card support
      arm64: dts: qcom: c630: Fix soundcard setup
      arm64: dts: qcom: c630: add headset jack and button detection support

Stefan Agner (1):
      ARM: tegra: Add back gpio-ranges properties

Stefan Eichenberger (1):
      ARM: tegra: Add usb-role-switch property to USB OTG ports

Stefan Wahren (1):
      dt-bindings: soc: bcm: Convert brcm,bcm2835-vchiq to json-schema

Stephan Gerhold (3):
      arm64: dts: qcom: Add missing 'chassis-type's
      arm64: dts: qcom: msm8916: Add RPM sleep stats
      ARM: dts: qcom: Build apq8016-sbc/DragonBoard 410c DTB on ARM32

Sugaya Taichi (3):
      ARM: dts: milbeaut: add a clock node for M10V
      ARM: dts: milbeaut: set clock phandle to timer node
      ARM: dts: milbeaut: set clock phandle to uart node

Sven Peter (2):
      dt-bindings: watchdog: Add Apple Watchdog
      arm64: dts: apple: t8103: Add watchdog node

Svyatoslav Ryhel (6):
      ARM: tegra: Add common device-tree base for Tegra30 ASUS Transformers
      ARM: tegra: Add device-tree for ASUS Transformer Prime TF201
      ARM: tegra: Add device-tree for ASUS Transformer Pad TF300TG
      ARM: tegra: Add device-tree for ASUS Transformer Infinity TF700T
      ARM: tegra: Add device-tree for Pegatron Chagall
      dt-bindings: ARM: tegra: Document ASUS Transformers

Thara Gopinath (1):
      arm64: dts: qcom: sm8250: Add CPU opp tables

Thierry Reding (84):
      ARM: dts: am335x: Use correct vendor prefix for Asahi Kasei Corp.
      ARM: tegra: Clean up external memory controller nodes
      ARM: tegra: Specify correct PMIC compatible on Tegra114 boards
      ARM: tegra: Rename SPI flash chip nodes
      ARM: tegra: Fix compatible string for Tegra114+ timer
      ARM: tegra: Add #reset-cells for Tegra114 MC
      ARM: tegra: Rename GPIO hog nodes to match schema
      ARM: tegra: Rename GPU node on Tegra124
      ARM: tegra: Drop reg-shift for Tegra HS UART
      ARM: tegra: Rename thermal zone nodes
      ARM: tegra: Fix Tegra124 I2C compatible string list
      ARM: tegra: Drop unused AHCI clocks on Tegra124
      ARM: tegra: Sort Tegra124 XUSB clocks correctly
      ARM: tegra: Avoid pwm- prefix in pinmux nodes
      ARM: tegra: Add compatible string for built-in ASIX on Colibri boards
      ARM: tegra: Remove PHY reset GPIO references from USB controller node
      ARM: tegra: Add dummy backlight power supplies
      ARM: tegra: Use correct vendor prefix for Invensense
      ARM: tegra: Remove unsupported properties on Apalis
      ARM: tegra: Remove stray #reset-cells property
      ARM: tegra: Fix SLINK compatible string on Tegra30
      ARM: tegra: Fix I2C mux reset GPIO reference on Cardhu
      ARM: tegra: Avoid phandle indirection on Ouya
      dt-bindings: tegra: Describe recent developer kits consistently
      dt-bindings: tegra: Document Jetson AGX Orin (and devkit)
      dt-bindings: sram: Document NVIDIA Tegra SYSRAM
      dt-bindings: memory: tegra: Update for Tegra194
      dt-bindings: memory: tegra: Add Tegra234 support
      dt-bindings: misc: Convert Tegra MISC to json-schema
      Merge tag 'tegra-for-5.17-dt-bindings-memory' into for-5.17/arm64/dt
      arm64: tegra: Fixup SYSRAM references
      arm64: tegra: Add main and AON GPIO controllers on Tegra234
      arm64: tegra: Describe Tegra234 CPU hierarchy
      arm64: tegra: Rename top-level clocks
      arm64: tegra: Rename top-level regulators
      arm64: tegra: Add native timer support on Tegra186
      arm64: tegra: Fix unit-addresses on Norrin
      arm64: tegra: Remove unsupported properties on Norrin
      arm64: tegra: Fix compatible string for Tegra132 timer
      arm64: tegra: Add OPP tables on Tegra132
      arm64: tegra: Fix Tegra132 I2C compatible string list
      arm64: tegra: Drop unused AHCI clocks on Tegra132
      arm64: tegra: Sort Tegra132 XUSB clocks correctly
      arm64: tegra: Rename thermal zones nodes
      arm64: tegra: Rename power-monitor input nodes
      arm64: tegra: Fix Tegra186 compatible string list
      arm64: tegra: Adjust length of CCPLEX cluster MMIO region
      arm64: tegra: Drop unit-address for audio card graph endpoints
      arm64: tegra: Use JEDEC vendor prefix for SPI NOR flash chips
      arm64: tegra: Drop unsupported nvidia,lpdr property
      arm64: tegra: Fix Tegra194 HSP compatible string
      arm64: tegra: Drop unused properties for Tegra194 PCIe
      arm64: tegra: Remove undocumented Tegra194 PCIe "core_m" clock
      arm64: tegra: Rename TCU node to "serial"
      arm64: tegra: Remove unsupported regulator properties
      arm64: tegra: Rename GPIO hog nodes to match schema
      arm64: tegra: jetson-tx1: Remove extra PLL power supplies for
PCIe and XUSB
      arm64: tegra: smaug: Remove extra PLL power supplies for XUSB
      arm64: tegra: jetson-nano: Remove extra PLL power supplies for
PCIe and XUSB
      arm64: tegra: Add missing TSEC properties on Tegra210
      arm64: tegra: Sort Tegra210 XUSB clocks correctly
      arm64: tegra: Remove unused only-1-8-v properties
      arm64: tegra: Rename Ethernet PHY nodes
      arm64: tegra: Add EMC general interrupt on Tegra194
      arm64: tegra: Add memory controller on Tegra234
      arm64: tegra: Hook up MMC and BPMP to memory controller
      ARM: tegra: Add memory client hotflush resets on Tegra114
      ARM: tegra: Add host1x hotflush reset on Tegra124
      dt-bindings: mmc: tegra: Convert to json-schema
      dt-bindings: mailbox: tegra: Convert to json-schema
      dt-bindings: mailbox: tegra: Document Tegra234 HSP
      dt-bindings: rtc: tegra: Convert to json-schema
      dt-bindings: rtc: tegra: Document Tegra234 RTC
      dt-bindings: fuse: tegra: Convert to json-schema
      dt-bindings: fuse: tegra: Document Tegra234 FUSE
      dt-bindings: mmc: tegra: Document Tegra234 SDHCI
      dt-bindings: serial: 8250: Document Tegra234 UART
      dt-bindings: tegra: pmc: Convert to json-schema
      dt-bindings: firmware: tegra: Convert to json-schema
      dt-bindings: thermal: tegra186-bpmp: Convert to json-schema
      dt-bindings: serial: tegra-tcu: Convert to json-schema
      dt-bindings: serial: Document Tegra234 TCU
      dt-bindings: usb: tegra-xudc: Document interconnects and iommus prope=
rties
      arm64: tegra: Add host1x hotflush reset on Tegra210

Tinghan Shen (1):
      arm64: dts: mt8183: change rpmsg property name

Tudor Ambarus (3):
      ARM: dts: at91: sama5d2: Name the qspi clock
      ARM: dts: at91: sama7g5: Add QSPI nodes
      ARM: dts: at91: sama7g5ek: Add QSPI0 node

Uwe Kleine-K=C3=B6nig (1):
      ARM: dts: bcm2711-rpi-4-b: Add gpio offsets to line name array

Vabhav Sharma (1):
      arm64: dts: ls1028a-qds: enable lpuart1

Vamsi krishna Lanka (4):
      dt-bindings: clock: Add SDX65 GCC clock bindings
      dt-bindings: arm: qcom: Document SDX65 platform and boards
      ARM: dts: qcom: Add SDX65 platform and MTP board support
      ARM: dts: qcom: sdx65: Add pincontrol node

Vinod Koul (11):
      dt-bindings: clock: Add SM8450 GCC clock bindings
      arm64: dts: qcom: Add base SM8450 DTSI
      arm64: dts: qcom: sm8450: Add tlmm nodes
      arm64: dts: qcom: sm8450: Add reserved memory nodes
      arm64: dts: qcom: sm8450: add smmu nodes
      arm64: dts: qcom: Add base SM8450 QRD DTS
      arm64: dts: qcom: sm8450-qrd: Add rpmh regulator nodes
      arm64: dts: qcom: sm8450: add ufs nodes
      arm64: dts: qcom: sm8450-qrd: enable ufs nodes
      arm64: dts: qcom: sm8450: Add usb nodes
      arm64: dts: qcom: sm8450-qrd: Enable USB nodes

Vladimir Oltean (4):
      arm64: dts: ls1028a-rdb: sort nodes alphabetically by label
      arm64: dts: ls1028a-rdb: add an alias for the FlexSPI controller
      arm64: dts: ls1028a-rdb: add aliases for the Ethernet ports
      arm64: dts: ls1028a-rdb: update copyright

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8450: add cpufreq support

Wan Jiabing (1):
      soc: bcm: brcmstb: Add of_node_put() in pm-mips

Wolfram Sang (3):
      arm64: dts: reneas: rzg2: Add SDnH clocks
      arm64: dts: reneas: rcar-gen3: Add SDnH clocks
      dt-bindings: mmc: renesas,sdhi: Add optional SDnH clock

Xiaoliang Yang (1):
      arm64: dts: imx8mp-evk: configure multiple queues on eqos

Xiaowei Bao (1):
      arm64: dts: ls1028a: Add PCIe EP nodes

Yangbo Lu (1):
      arm64: dts: lx2162a-qds: support SD UHS-I and eMMC HS400 modes

Yassine Oudjana (2):
      arm64: dts: qcom: msm8996-xiaomi-scorpio: Add touchkey controller
      arm64: dts: qcom: msm8996-xiaomi-common: Change TUSB320 to TUSB320L

Yoshihiro Shimoda (8):
      dt-bindings: arm: renesas: Document R-Car S4-8 SoC DT bindings
      dt-bindings: reset: renesas,rst: Document r8a779f0 reset module
      dt-bindings: power: renesas,rcar-sysc: Document r8a779f0 SYSC binding=
s
      dt-bindings: arm: renesas: Document Renesas Spider boards
      dt-bindings: power: Add r8a779f0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779f0 CPG Core Clock Definitions
      arm64: dts: renesas: Add Renesas R8A779F0 SoC support
      arm64: dts: renesas: Add Renesas Spider boards support

Yunus Bas (3):
      ARM: dts: imx6qdl: phytec: Add support for optional PEB-EVAL-01 board
      ARM: dts: imx6qdl: phytec: Add support for optional PEB-AV-02 LCD ada=
pter
      ARM: dts: imx6: phytec: Add PEB-WLBT-05 support

Zoltan HERPAI (1):
      ARM: dts: ixp4xx: Add devicetree for Gateway 7001

yangcong (1):
      arm64: dts: qcom: sc7180: Fix ps8640 power sequence for Homestar rev4

 Documentation/devicetree/bindings/arm/apple.yaml   |    27 +-
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |   134 +
 .../devicetree/bindings/arm/aspeed/aspeed,sbc.yaml |    37 +
 .../devicetree/bindings/arm/bcm/brcm,bcm4908.yaml  |     1 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |    78 +
 .../devicetree/bindings/arm/mediatek.yaml          |    20 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |     8 +
 Documentation/devicetree/bindings/arm/renesas.yaml |    12 +
 .../bindings/arm/samsung/samsung-boards.yaml       |    12 +
 .../devicetree/bindings/arm/stm32/stm32.yaml       |     1 +
 Documentation/devicetree/bindings/arm/sunxi.yaml   |     5 +
 .../arm/sunxi/allwinner,sun4i-a10-mbus.yaml        |    91 +-
 Documentation/devicetree/bindings/arm/tegra.yaml   |    48 +-
 .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |   133 -
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |   198 +
 Documentation/devicetree/bindings/arm/ti/k3.yaml   |     6 +
 .../devicetree/bindings/bus/fsl,spba-bus.yaml      |    68 +
 Documentation/devicetree/bindings/bus/imx-weim.txt |     5 +
 .../bindings/clock/nvidia,tegra20-car.yaml         |    37 +
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |    80 +
 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |    85 +
 .../crypto/allwinner,sun4i-a10-crypto.yaml         |    10 +
 .../display/tegra/nvidia,tegra20-host1x.txt        |    53 +
 .../bindings/firmware/nvidia,tegra186-bpmp.txt     |   107 -
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |   186 +
 .../bindings/fuse/nvidia,tegra20-fuse.txt          |    42 -
 .../bindings/fuse/nvidia,tegra20-fuse.yaml         |    89 +
 .../bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml |   135 +
 .../bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml |    94 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |    13 +-
 .../bindings/interrupt-controller/apple,aic.yaml   |     3 +
 .../devicetree/bindings/iommu/apple,dart.yaml      |     3 +
 .../bindings/ipmi/aspeed,ast2400-ibt-bmc.txt       |     2 +
 .../devicetree/bindings/mailbox/apple,mailbox.yaml |     3 +
 .../bindings/mailbox/nvidia,tegra186-hsp.txt       |    72 -
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      |   114 +
 .../devicetree/bindings/media/nvidia,tegra-vde.txt |    64 -
 .../bindings/media/nvidia,tegra-vde.yaml           |   119 +
 .../memory-controllers/nvidia,tegra186-mc.yaml     |    98 +-
 .../bindings/misc/nvidia,tegra186-misc.txt         |    14 -
 .../bindings/misc/nvidia,tegra186-misc.yaml        |    43 +
 .../bindings/misc/nvidia,tegra20-apbmisc.txt       |    17 -
 .../bindings/misc/nvidia,tegra20-apbmisc.yaml      |    51 +
 .../bindings/mmc/nvidia,tegra20-sdhci.txt          |   143 -
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml         |   317 +
 .../devicetree/bindings/mmc/renesas,sdhi.yaml      |    48 +-
 .../devicetree/bindings/pci/apple,pcie.yaml        |    28 +-
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |     7 +-
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    79 +
 .../bindings/power/renesas,rcar-sysc.yaml          |     1 +
 .../devicetree/bindings/reset/renesas,rst.yaml     |     1 +
 .../devicetree/bindings/rtc/nvidia,tegra20-rtc.txt |    24 -
 .../bindings/rtc/nvidia,tegra20-rtc.yaml           |    61 +
 Documentation/devicetree/bindings/serial/8250.yaml |     3 +-
 .../bindings/serial/nvidia,tegra194-tcu.txt        |    35 -
 .../bindings/serial/nvidia,tegra194-tcu.yaml       |    61 +
 .../bindings/soc/bcm/brcm,bcm2835-vchiq.txt        |    17 -
 .../bindings/soc/bcm/brcm,bcm2835-vchiq.yaml       |    53 +
 .../bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml |    97 +
 .../bindings/soc/samsung/exynos-usi.yaml           |   159 +
 Documentation/devicetree/bindings/sram/sram.yaml   |     3 +
 .../thermal/nvidia,tegra186-bpmp-thermal.txt       |    33 -
 .../thermal/nvidia,tegra186-bpmp-thermal.yaml      |    42 +
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml |    13 +
 .../devicetree/bindings/vendor-prefixes.yaml       |     8 +
 .../devicetree/bindings/watchdog/apple,wdt.yaml    |    52 +
 MAINTAINERS                                        |     4 +
 arch/arm/boot/dts/Makefile                         |    39 +-
 arch/arm/boot/dts/am335x-bone-common.dtsi          |     1 +
 arch/arm/boot/dts/am335x-boneblack-common.dtsi     |     4 -
 arch/arm/boot/dts/am335x-boneblue.dts              |     2 +-
 arch/arm/boot/dts/am335x-icev2.dts                 |     4 +
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts        |     2 +-
 arch/arm/boot/dts/am437x-cm-t43.dts                |     2 +-
 arch/arm/boot/dts/am437x-gp-evm.dts                |     8 +
 arch/arm/boot/dts/am437x-l4.dtsi                   |    31 +-
 arch/arm/boot/dts/am43xx-clocks.dtsi               |     7 +
 arch/arm/boot/dts/armada-38x.dtsi                  |     4 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |   267 +
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts   |    12 +
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts |   756 ++
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |    17 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |    11 +
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts        |    40 +
 arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts        |   470 +
 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts       |   149 +
 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts       |   255 +
 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts       |   154 +
 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi           |   311 +
 arch/arm/boot/dts/aspeed-g4.dtsi                   |     1 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |     5 +
 arch/arm/boot/dts/aspeed-g6.dtsi                   |    10 +
 arch/arm/boot/dts/at91-q5xr5.dts                   |    18 -
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |     5 +-
 arch/arm/boot/dts/at91-sama5d3_ksz9477_evb.dts     |   209 +
 arch/arm/boot/dts/at91-sama7g5ek.dts               |    73 +
 arch/arm/boot/dts/at91-wb50n.dts                   |     6 -
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |    18 +-
 arch/arm/boot/dts/bcm-hr2.dtsi                     |     4 +-
 arch/arm/boot/dts/bcm-nsp.dtsi                     |     8 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              |    28 +-
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts       |     3 +-
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts         |    62 +-
 arch/arm/boot/dts/bcm5301x.dtsi                    |    31 +-
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi      |     4 +
 arch/arm/boot/dts/elpida_ecb240abacn.dtsi          |     2 +-
 arch/arm/boot/dts/exynos4210-i9100.dts             |     7 +-
 arch/arm/boot/dts/exynos5260.dtsi                  |     8 +-
 arch/arm/boot/dts/gemini-nas4220b.dts              |     2 +-
 arch/arm/boot/dts/imx1-pinfunc.h                   |     6 +-
 arch/arm/boot/dts/imx1.dtsi                        |     2 +-
 arch/arm/boot/dts/imx25.dtsi                       |     4 +-
 arch/arm/boot/dts/imx27-pinfunc.h                  |     6 +-
 arch/arm/boot/dts/imx28-tx28.dts                   |    36 -
 arch/arm/boot/dts/imx31.dtsi                       |     2 +-
 arch/arm/boot/dts/imx50.dtsi                       |    10 +-
 arch/arm/boot/dts/imx51.dtsi                       |    10 +-
 arch/arm/boot/dts/imx53-tx53.dtsi                  |    11 -
 arch/arm/boot/dts/imx53.dtsi                       |    10 +-
 arch/arm/boot/dts/imx6dl-mba6.dtsi                 |    22 +
 arch/arm/boot/dts/imx6dl-mba6a.dts                 |    21 +
 arch/arm/boot/dts/imx6dl-mba6b.dts                 |    21 +
 arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dts  |     3 +
 arch/arm/boot/dts/imx6q-mba6.dtsi                  |    44 +
 arch/arm/boot/dts/imx6q-mba6a.dts                  |    20 +
 arch/arm/boot/dts/imx6q-mba6b.dts                  |    20 +
 arch/arm/boot/dts/imx6q-phytec-mira-rdk-emmc.dts   |     3 +
 arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dts   |     3 +
 arch/arm/boot/dts/imx6q-yapp4-crux.dts             |    54 +
 arch/arm/boot/dts/imx6qdl-dhcom-drc02.dtsi         |     4 +
 arch/arm/boot/dts/imx6qdl-dhcom-pdk2.dtsi          |     4 +
 arch/arm/boot/dts/imx6qdl-dhcom-som.dtsi           |     8 +-
 arch/arm/boot/dts/imx6qdl-mba6.dtsi                |   526 +
 arch/arm/boot/dts/imx6qdl-mba6a.dtsi               |    36 +
 arch/arm/boot/dts/imx6qdl-mba6b.dtsi               |    52 +
 .../boot/dts/imx6qdl-phytec-mira-peb-av-02.dtsi    |   119 +
 .../boot/dts/imx6qdl-phytec-mira-peb-eval-01.dtsi  |    71 +
 .../boot/dts/imx6qdl-phytec-mira-peb-wlbt-05.dtsi  |    85 +
 arch/arm/boot/dts/imx6qdl-tqma6a.dtsi              |    20 +
 arch/arm/boot/dts/imx6qdl-tx6.dtsi                 |    12 -
 arch/arm/boot/dts/imx6qdl.dtsi                     |     8 +-
 arch/arm/boot/dts/imx6qp-mba6b.dts                 |    18 +
 arch/arm/boot/dts/imx6qp-phytec-mira-rdk-nand.dts  |     3 +
 arch/arm/boot/dts/imx6qp-yapp4-crux-plus.dts       |    54 +
 arch/arm/boot/dts/imx6ul-imx6ull-opos6uldev.dtsi   |    12 -
 .../boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts   |     1 +
 .../boot/dts/imx6ul-phytec-segin-peb-wlbt-05.dtsi  |    90 +
 arch/arm/boot/dts/imx6ul-prti6g.dts                |     6 -
 arch/arm/boot/dts/imx6ul-tx6ul.dtsi                |    24 -
 arch/arm/boot/dts/imx6ull-jozacp.dts               |   456 +
 .../boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dts  |     1 +
 .../boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dts  |     1 +
 .../boot/dts/imx6ull-phytec-segin-peb-wlbt-05.dtsi |    19 +
 arch/arm/boot/dts/imx6ulz-bsh-smm-m2.dts           |   146 +
 arch/arm/boot/dts/imx7d-remarkable2.dts            |    59 +
 arch/arm/boot/dts/imx7s-warp.dts                   |    14 +-
 arch/arm/boot/dts/imx7s.dtsi                       |    22 +-
 arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts   |    59 +
 arch/arm/boot/dts/intel-ixp42x-gateway-7001.dts    |   111 +
 .../arm/boot/dts/intel-ixp42x-goramo-multilink.dts |   180 +
 arch/arm/boot/dts/intel-ixp4xx.dtsi                |    17 +
 arch/arm/boot/dts/milbeaut-m10v.dtsi               |     9 +
 arch/arm/boot/dts/motorola-mapphone-common.dtsi    |     2 +-
 arch/arm/boot/dts/mt6589-fairphone-fp1.dts         |    30 +
 arch/arm/boot/dts/mt6589.dtsi                      |     2 +-
 arch/arm/boot/dts/omap3-tao3530.dtsi               |    14 -
 arch/arm/boot/dts/openbmc-flash-layout-64-alt.dtsi |    35 +
 arch/arm/boot/dts/qcom-apq8016-sbc.dts             |     2 +
 .../arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts |     1 -
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |     4 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |     4 +-
 .../boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts  |     2 +-
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts   |     1 -
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |     1 -
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    |     1 -
 .../boot/dts/qcom-msm8974-sony-xperia-amami.dts    |     1 -
 .../boot/dts/qcom-msm8974-sony-xperia-castor.dts   |     1 -
 .../boot/dts/qcom-msm8974-sony-xperia-honami.dts   |     1 -
 arch/arm/boot/dts/qcom-sdx55-t55.dts               |     6 +
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts   |    59 +
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |    80 +
 arch/arm/boot/dts/qcom-sdx65-mtp.dts               |    25 +
 arch/arm/boot/dts/qcom-sdx65.dtsi                  |   222 +
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |    16 +
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi  |     3 +
 arch/arm/boot/dts/sama5d2.dtsi                     |     2 +
 arch/arm/boot/dts/sama7g5-pinfunc.h                |     2 +-
 arch/arm/boot/dts/sama7g5.dtsi                     |    30 +
 arch/arm/boot/dts/spear1310-evb.dts                |    16 -
 arch/arm/boot/dts/spear1340-evb.dts                |    16 -
 arch/arm/boot/dts/spear310.dtsi                    |     1 +
 arch/arm/boot/dts/spear320.dtsi                    |     1 +
 arch/arm/boot/dts/spear320s.dtsi                   |    24 +
 arch/arm/boot/dts/ste-dbx5x0.dtsi                  |    26 +
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     |    39 +-
 arch/arm/boot/dts/stm32f429-disco.dts              |     2 +-
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |    32 +-
 .../stm32mp157a-icore-stm32mp1-ctouch2-of10.dts    |   132 +
 .../dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts    |    85 +
 arch/arm/boot/dts/stm32mp157c-ev1.dts              |    22 +
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |    16 +
 .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    |     3 +-
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts          |    34 +-
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi             |     1 +
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts          |     3 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts         |     3 +-
 arch/arm/boot/dts/sun8i-h3.dtsi                    |     4 +
 arch/arm/boot/dts/sun8i-r40.dtsi                   |     4 +-
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi      |     3 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 |    15 +-
 arch/arm/boot/dts/sunxi-libretech-all-h3-cc.dtsi   |     1 +
 arch/arm/boot/dts/tegra114-asus-tf701t.dts         |   807 ++
 arch/arm/boot/dts/tegra114-dalmore.dts             |    21 +-
 arch/arm/boot/dts/tegra114-roth.dts                |    16 +-
 arch/arm/boot/dts/tegra114-tn7.dts                 |    10 +-
 arch/arm/boot/dts/tegra114.dtsi                    |    58 +-
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi         |   436 +-
 arch/arm/boot/dts/tegra124-apalis-eval.dts         |     2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts    |     2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |    16 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |    16 +-
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi     |  2606 ++---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |    39 +-
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi       | 11318 ++++++++++-----=
----
 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts        |    11 +
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi     |   758 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |    86 +-
 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi    |   140 +-
 arch/arm/boot/dts/tegra124-venice2.dts             |    35 +-
 arch/arm/boot/dts/tegra124.dtsi                    |    45 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |    27 +-
 arch/arm/boot/dts/tegra20-asus-tf101.dts           |  1280 +++
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts      |     4 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts         |     4 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi             |    18 +-
 arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi   |    82 +-
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi             |    82 +-
 arch/arm/boot/dts/tegra20-harmony.dts              |    21 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts          |    11 +-
 arch/arm/boot/dts/tegra20-paz00.dts                |    22 +-
 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi     |   948 +-
 arch/arm/boot/dts/tegra20-plutux.dts               |     8 +-
 arch/arm/boot/dts/tegra20-seaboard.dts             |    23 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi            |     7 +-
 arch/arm/boot/dts/tegra20-tec.dts                  |     8 +-
 arch/arm/boot/dts/tegra20-trimslice.dts            |    26 +-
 arch/arm/boot/dts/tegra20-ventana.dts              |    15 +-
 arch/arm/boot/dts/tegra20.dtsi                     |   162 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts          |     2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts     |     2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         |     6 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi              |     6 +-
 arch/arm/boot/dts/tegra30-asus-lvds-display.dtsi   |    61 +
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |    67 +-
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |     4 +-
 ...tegra30-asus-nexus7-grouper-memory-timings.dtsi |    12 +-
 .../dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi   |     2 +-
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi |     1 -
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi |     2 -
 arch/arm/boot/dts/tegra30-asus-tf201.dts           |   627 +
 arch/arm/boot/dts/tegra30-asus-tf300t.dts          |  1034 ++
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts         |  1087 ++
 arch/arm/boot/dts/tegra30-asus-tf700t.dts          |   823 ++
 .../boot/dts/tegra30-asus-transformer-common.dtsi  |  1787 +++
 arch/arm/boot/dts/tegra30-beaver.dts               |    24 +-
 arch/arm/boot/dts/tegra30-cardhu-a02.dts           |    12 +-
 arch/arm/boot/dts/tegra30-cardhu-a04.dts           |    14 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |    35 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi             |    25 +-
 arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi   |   144 +-
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi             |   144 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 |  8921 ++++++++-------
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts     |  2859 +++++
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi     |  1370 ++-
 arch/arm/boot/dts/tegra30.dtsi                     |   189 +-
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts          |     6 +-
 arch/arm64/boot/dts/allwinner/Makefile             |     1 +
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     |     1 +
 .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi   |     2 +
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts      |     1 +
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts      |     1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |    14 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |     4 +
 .../dts/allwinner/sun50i-h6-tanix-tx6-mini.dts     |    15 +
 .../boot/dts/allwinner/sun50i-h6-tanix-tx6.dts     |   138 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi |   189 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |     9 +
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |    24 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   112 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |     2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi  |    10 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |    83 +
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |    14 +
 arch/arm64/boot/dts/apple/Makefile                 |     4 +
 arch/arm64/boot/dts/apple/t8103-j274.dts           |    35 +-
 arch/arm64/boot/dts/apple/t8103-j293.dts           |    41 +
 arch/arm64/boot/dts/apple/t8103-j313.dts           |    33 +
 arch/arm64/boot/dts/apple/t8103-j456.dts           |    59 +
 arch/arm64/boot/dts/apple/t8103-j457.dts           |    47 +
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi          |    78 +
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi          |  1138 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |   189 +-
 arch/arm64/boot/dts/broadcom/bcm4908/Makefile      |     1 +
 .../broadcom/bcm4908/bcm4908-netgear-raxe500.dts   |    50 +
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |    24 +-
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |    24 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |     4 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |    36 +-
 arch/arm64/boot/dts/freescale/Makefile             |    22 +
 .../boot/dts/freescale/fsl-ls1028a-qds-13bb.dts    |   113 +
 .../boot/dts/freescale/fsl-ls1028a-qds-65bb.dts    |   108 +
 .../boot/dts/freescale/fsl-ls1028a-qds-7777.dts    |    82 +
 .../boot/dts/freescale/fsl-ls1028a-qds-85bb.dts    |   107 +
 .../boot/dts/freescale/fsl-ls1028a-qds-899b.dts    |    75 +
 .../boot/dts/freescale/fsl-ls1028a-qds-9999.dts    |    79 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |    39 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |   103 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   130 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts  |     2 +
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |    13 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts  |   149 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |    21 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |    10 +
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  |    21 +
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |    93 +
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |     1 -
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |     7 +
 .../dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts   |     1 -
 .../dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts  |     1 -
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |   253 +
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |   335 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |    86 +-
 .../dts/freescale/imx8mn-beacon-baseboard.dtsi     |     1 -
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |     1 -
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    |   426 +
 .../arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts |    48 +
 .../boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts    |    80 +
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |     9 +
 .../boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts |   237 +
 .../arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi |   322 +
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |    29 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |    73 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |    35 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |     9 +
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |    25 +-
 .../boot/dts/freescale/imx8mq-librem5-r3.dtsi      |    45 +
 .../arm64/boot/dts/freescale/imx8mq-librem5-r4.dts |    16 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    97 +-
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      |     1 +
 .../boot/dts/freescale/imx8mq-nitrogen-som.dtsi    |    15 +-
 .../boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |   349 +
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi  |   360 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   115 +-
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |    38 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |    28 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |    64 +
 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h    |   978 ++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   434 +
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |   282 +
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts   |    20 +-
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |    71 +
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |     2 +
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi        |   140 +
 arch/arm64/boot/dts/marvell/cn9130.dtsi            |    15 +
 arch/arm64/boot/dts/mediatek/Makefile              |     6 +
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts       |    57 +
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |   169 +
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts       |    29 +
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi          |    12 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |    10 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |     2 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |     8 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts    |    36 +
 .../mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts  |     1 +
 .../mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts  |     1 +
 .../mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts  |    33 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi  |     1 -
 .../mt8183-kukui-jacuzzi-fennel14-sku2.dts         |    17 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts |     1 +
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |     1 -
 .../dts/mediatek/mt8183-kukui-kakadu-sku22.dts     |    19 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   124 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |    64 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |    20 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi           |    27 +-
 arch/arm64/boot/dts/nvidia/Makefile                |     1 +
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |    36 +-
 .../boot/dts/nvidia/tegra132-peripherals-opp.dtsi  |   426 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |    48 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |    20 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |    20 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |    32 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |    95 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |    12 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |     8 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |    20 +-
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi |     2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |     2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   231 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |     4 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |     3 -
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     |     2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |    37 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |    40 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |    53 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |    22 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |    27 +-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |    24 +
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |    24 +
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi |     5 +
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |     1 -
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   541 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    19 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |    10 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |     2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |    12 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |   209 +
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |     1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |     9 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |     1 -
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |     1 -
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |     3 +-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |    30 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |     4 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts |    28 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |     4 -
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |     1 +
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |     3 -
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |     1 +
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |     2 -
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |     1 -
 arch/arm64/boot/dts/qcom/pm660.dtsi                |    12 +-
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |    10 +
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |     7 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar-r2.dts   |     2 +
 .../boot/dts/qcom/sc7180-trogdor-homestar-r3.dts   |     6 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar-r4.dts   |    21 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |     3 -
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts |     2 +-
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts |    31 +
 ...s =3D> sc7180-trogdor-lazor-limozeen-nots-r9.dts} |     8 +-
 .../dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts  |    46 +
 ...en.dts =3D> sc7180-trogdor-lazor-limozeen-r9.dts} |     6 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts      |     2 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |     2 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |     9 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |     9 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts      |     8 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   |    22 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  |    30 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9.dts      |    18 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |     3 -
 .../dts/qcom/sc7180-trogdor-parade-ps8640.dtsi     |     2 +
 .../boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |     3 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |     4 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |     1 -
 arch/arm64/boot/dts/qcom/sc7280-crd.dts            |    93 +
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi     |   105 +
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |     1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |    89 +-
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |    17 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |     6 +-
 .../dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts |     1 +
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |   351 +
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |   140 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |     1 +
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |     2 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |     2 +
 .../dts/qcom/sdm845-sony-xperia-tama-akari.dts     |    13 +
 .../dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts  |    29 +
 .../dts/qcom/sdm845-sony-xperia-tama-apollo.dts    |    13 +
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |   438 +
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |     1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |     3 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    30 +
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |     1 -
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    55 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   299 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    32 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |     1 -
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   191 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   472 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |     1 -
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |   369 +
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    10 +-
 .../dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts  |    19 +
 .../dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts  |    13 +
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |   259 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   756 +-
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |   398 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  1115 ++
 arch/arm64/boot/dts/renesas/Makefile               |     2 +
 arch/arm64/boot/dts/renesas/cat875.dtsi            |     1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |    22 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |    20 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |    11 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |    22 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |    22 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |    22 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |    22 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |    20 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |     7 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |    11 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |     3 +-
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |    79 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   105 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |    36 +
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts    |    22 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |   121 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   382 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |    76 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |    42 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |     5 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |     5 +-
 arch/arm64/boot/dts/rockchip/px30.dtsi             |     2 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |    87 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |    12 +-
 .../boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts   |    11 +
 .../boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts   |    18 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts |     7 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts |    18 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |     5 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |    96 +-
 arch/arm64/boot/dts/ti/Makefile                    |     2 +
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |    36 +
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            |    40 +
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             |     8 +
 arch/arm64/boot/dts/ti/k3-am642.dtsi               |     2 +-
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi |    20 +
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi            |    30 +
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |     8 +
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |     2 +-
 arch/arm64/boot/dts/ti/k3-j7200.dtsi               |     6 +-
 .../boot/dts/ti/k3-j721e-common-proc-board.dts     |   155 +
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          |   198 +-
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    |    28 +
 arch/arm64/boot/dts/ti/k3-j721e.dtsi               |     6 +-
 .../boot/dts/ti/k3-j721s2-common-proc-board.dts    |   421 +
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |   937 ++
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi   |   302 +
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi       |   175 +
 arch/arm64/boot/dts/ti/k3-j721s2.dtsi              |   189 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h              |     2 -
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h                |     2 -
 drivers/soc/bcm/brcmstb/pm/pm-mips.c               |     5 +-
 include/dt-bindings/clock/qcom,gcc-sdx65.h         |   122 +
 include/dt-bindings/clock/qcom,gcc-sm8450.h        |   244 +
 include/dt-bindings/clock/r8a779f0-cpg-mssr.h      |    64 +
 include/dt-bindings/clock/sun50i-a64-ccu.h         |     2 +-
 include/dt-bindings/clock/sun8i-h3-ccu.h           |     2 +-
 include/dt-bindings/clock/tegra234-clock.h         |    26 +-
 include/dt-bindings/memory/tegra234-mc.h           |    32 +
 include/dt-bindings/pinctrl/k3.h                   |     3 +
 include/dt-bindings/pinctrl/samsung.h              |    13 +-
 include/dt-bindings/power/imx8ulp-power.h          |    26 +
 include/dt-bindings/power/r8a779f0-sysc.h          |    30 +
 include/dt-bindings/reset/tegra234-reset.h         |    12 +-
 include/dt-bindings/soc/samsung,exynos-usi.h       |    17 +
 558 files changed, 55321 insertions(+), 14845 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/apple/apple,pmgr.=
yaml
 create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc=
.yaml
 delete mode 100644
Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
 create mode 100644
Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.=
yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450=
.yaml
 delete mode 100644
Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
 create mode 100644
Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
 delete mode 100644
Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
 create mode 100644
Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
 create mode 100644
Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
 create mode 100644
Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
 delete mode 100644
Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
 create mode 100644
Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vd=
e.txt
 create mode 100644
Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
 delete mode 100644
Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
 create mode 100644
Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
 delete mode 100644
Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
 create mode 100644
Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.yaml
 delete mode 100644
Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
 create mode 100644
Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
 create mode 100644
Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rt=
c.txt
 create mode 100644
Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
 delete mode 100644
Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
 create mode 100644
Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
 delete mode 100644
Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
 create mode 100644
Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
 create mode 100644
Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
 delete mode 100644
Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.txt
 create mode 100644
Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/apple,wdt.ya=
ml
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
 create mode 100644 arch/arm/boot/dts/at91-sama5d3_ksz9477_evb.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-mba6.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-mba6a.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-mba6b.dts
 create mode 100644 arch/arm/boot/dts/imx6q-mba6.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-mba6a.dts
 create mode 100644 arch/arm/boot/dts/imx6q-mba6b.dts
 create mode 100644 arch/arm/boot/dts/imx6q-yapp4-crux.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-mba6.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-mba6a.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-mba6b.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-phytec-mira-peb-av-02.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-phytec-mira-peb-eval-01.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-phytec-mira-peb-wlbt-05.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qp-mba6b.dts
 create mode 100644 arch/arm/boot/dts/imx6qp-yapp4-crux-plus.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-phytec-segin-peb-wlbt-05.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-jozacp.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-peb-wlbt-05.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ulz-bsh-smm-m2.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-gateway-7001.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-goramo-multilink.dts
 create mode 100644 arch/arm/boot/dts/mt6589-fairphone-fp1.dts
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64-alt.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-apq8016-sbc.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx65-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx65.dtsi
 create mode 100644 arch/arm/boot/dts/spear320s.dtsi
 create mode 100644
arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
 create mode 100644 arch/arm/boot/dts/tegra114-asus-tf701t.dts
 create mode 100644 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts
 create mode 100644 arch/arm/boot/dts/tegra20-asus-tf101.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-lvds-display.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-tf201.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-tf300t.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-tf300tg.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-tf700t.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-pegatron-chagall.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.=
dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8103-j293.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8103-j313.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8103-j456.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8103-j457.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
 create mode 100644
arch/arm64/boot/dts/broadcom/bcm4908/bcm4908-netgear-raxe500.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-9999.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.d=
ts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.=
dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.d=
ts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
 create mode 100755 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/mba8mx.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo=
.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.=
dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra132-peripherals-opp.dts=
i
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
 create mode 100644
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dts
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-lazor-limozeen-nots.dts
=3D> sc7180-trogdor-lazor-limozeen-nots-r9.dts} (60%)
 create mode 100644
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-lazor-limozeen.dts =3D>
sc7180-trogdor-lazor-limozeen-r9.dts} (82%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dt=
s
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.=
dts
 create mode 100644
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo=
.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.=
dts
 create mode 100644
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts
 create mode 100644
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-qrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2.dtsi
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8450.h
 create mode 100644 include/dt-bindings/clock/r8a779f0-cpg-mssr.h
 create mode 100644 include/dt-bindings/memory/tegra234-mc.h
 create mode 100644 include/dt-bindings/power/imx8ulp-power.h
 create mode 100644 include/dt-bindings/power/r8a779f0-sysc.h
 create mode 100644 include/dt-bindings/soc/samsung,exynos-usi.h
