Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F611C432BE
	for <soc@archiver.kernel.org>; Wed,  1 Sep 2021 20:00:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4112B610D1; Wed,  1 Sep 2021 20:00:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC8BA610C9
	for <soc@kernel.org>; Wed,  1 Sep 2021 20:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630526429;
	bh=7qCXdPxiK/CU9hAZaRKyedm3lckO7j3polCbaEnUML8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sSKk4XG86Kcs6GpN458M/tmZMXeEYBVw2nWZXSgXibUoYWDerlSROFSsP7rXvZen/
	 OeMdFCEpSslRX0y5USkH+QQ6KiHOjNIkZb02mKWZu2VQ6H1kZf9cimCApLDtBtOMvR
	 z1t+5h6SfvBkylT87Vzxx4dt/NUyv9kYqpsljvRtLpOuZ+zboSob+G2vy5mZ2ovl5W
	 58Oigkwpvb+p32q/g/5fryuEwKcxsPjON8RU4JsB7bAI1yZWKGPXRPCMJA0yYzlI2D
	 ItyaZvzotyyb80cDdC0J/lq6dkOfclbtq5PTgIfKKDObfFMRiFHYp5kL5n79BF8Qm9
	 3pI170Vl636kA==
Received: by mail-wr1-f42.google.com with SMTP id z4so1381866wrr.6
        for <soc@kernel.org>; Wed, 01 Sep 2021 13:00:28 -0700 (PDT)
X-Gm-Message-State: AOAM532i1lEUbAjX5tFDFY+xsnS7G4hOvGkmVfVy2CjARvIgd/LZvzR9
	NHV/gG6darew3ag8q6oRTnd09KbgJTBerw1ks+o=
X-Google-Smtp-Source: ABdhPJx1UYl/ppByyUAXu0G0LZ/IrfPvXq/aVUdywuy/0gNb54HUyau9QchiCgbK7qlvgdvvSLjk33EMe/DmFWimjwc=
X-Received: by 2002:adf:c390:: with SMTP id p16mr1246488wrf.105.1630526426864;
 Wed, 01 Sep 2021 13:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
In-Reply-To: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 1 Sep 2021 20:00:09 +0000
X-Gmail-Original-Message-ID: <CAK8P3a2OTMQFQ6CWWQTcSS9wx0_iOukHt7pzMZjxOQHs3fXb5Q@mail.gmail.com>
Message-ID: <CAK8P3a2OTMQFQ6CWWQTcSS9wx0_iOukHt7pzMZjxOQHs3fXb5Q@mail.gmail.com>
Subject: [GIT PULL 4/4] ARM: SoC DT changes for 5.15
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit c500bee1c5b2f1d59b1081ac879d73268ab0ff17=
:

  Linux 5.14-rc4 (2021-08-01 17:04:17 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.15

for you to fetch changes up to 9e62ec0e661ca7161e5830bdbf8e69831b41e866:

  arm/arm64: dts: Fix remaining dtc 'unit_address_format' warnings
(2021-08-26 13:46:29 +0200)

----------------------------------------------------------------
ARM: SoC DT changes for 5.15

As usual, the bulk of work in the SoC tree goes into DT files,
this time with a roughly even split between 32-bit and 64-bit
SoCs rather than the usual mostly 64-bit changes.

New SoCs:

 - Microchip SAMA7 SoC family based on Cortex-A7, a new
   32-bit platform based on the older SAMA5 series.

 - Qualcomm Snapdragon SDM636 and SM8150, variations of the
   existing phone SoCs.

 - Renesas R-Car H3e-2G and M3e-2G SoCs, variations of
   older Renesas SoCs.

New boards:

 - Marvell CN913x reference boards

 - ASpeed AST2600 BMC implementations for Facebook Cloudripper,
   Elbert and Fuji server boards.

 - Snapdragon 665 based Sony Xperia 10II

 - Snapdragon MSM8916 based Xiaomi Redmi 2

 - Snapdragon MSM8226 based Samsung Galaxy S3 Neo

 - NXP i.MX based 32-bit boards:
   - DHCOM based PicoITX
   - DHSOM based DRC0=E1=BB=89
   - SolidRun SolidSense
   - SKOV i.MX6 boards.

 - NXP i.MX based 64-bit boards:
   - Nitrogen8 SoM and MNT Reform2
   - LS1088A based Traverse Ten64
   - i.MX8M based GW7902.

 - NVIDIA Jetson TX2 NX Developer Kit

 - 4KOpen STiH418-b2264 development board

 - ux500 based Samsung phones: Gavini, Codina and Kyle

 - TI AM335x based Sancloud BBE Lite

 - ixp4xx dts files to replace all old board files

Other changes:

 - Treewide fixes for dtc warnings

 - Rockchips i/o domain support

 - TI OMAP/AM3 CPSW switch driver support

 - Improved device support for allwinner, aspeed, qualcomm, NXP,
   nvidia, Renesas, Samsung, Amlogic, Mediatek, ixp4xx, stm32, sti,
   OMAP and actions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Adam Ford (1):
      arm64: dts: renesas: beacon: Enable micbias

Alain Volmat (13):
      ARM: dts: sti: update flexgen compatible within stih418-clock
      ARM: dts: sti: update flexgen compatible within stih407-clock
      ARM: dts: sti: update flexgen compatible within stih410-clock
      ARM: dts: sti: update clkgen-pll entries in stih407-clock
      ARM: dts: sti: update clkgen-pll entries in stih410-clock
      ARM: dts: sti: update clkgen-pll entries in stih418-clock
      ARM: dts: sti: update clkgen-fsyn entries in stih407-clock
      ARM: dts: sti: update clkgen-fsyn entries in stih410-clock
      ARM: dts: sti: update clkgen-fsyn entries in stih418-clock
      ARM: dts: sti: add the spinor controller node within stih407-family
      ARM: dts: sti: disable rng11 on the stih418 platform
      ARM: dts: sti: add the thermal sensor node within stih418
      ARM: dts: sti: Introduce 4KOpen (stih418-b2264) board

Alex Elder (4):
      arm64: dts: qcom: sc7280: add IPA information
      arm64: dts: qcom: sc7280: enable IPA for sc7280-idp
      arm64: dts: qcom: sc7180: define ipa_fw_mem node
      arm64: dts: qcom: sm8350: fix IPA interconnects

Alexey Minnekhanov (1):
      ARM: dts: qcom: msm8974-klte: Enable remote processors

Alim Akhtar (2):
      arm64: dts: exynos: Add cpu cache information to Exynos7
      arm64: dts: exynos: Add cpu cache information to Exynos5433

Alistair Francis (1):
      ARM: dts: imx7d-remarkable2: Add WiFi support

Anand Moon (3):
      ARM: dts: meson8b: odroidc1: Fix the pwm regulator supply properties
      ARM: dts: meson8b: mxq: Fix the pwm regulator supply properties
      ARM: dts: meson8b: ec100: Fix the pwm regulator supply properties

Andreas Obergschwandtner (1):
      ARM: tegra: tamonten: Fix UART pad setting

Andrew F. Davis (1):
      ARM: dts: am4372: Add PRUSS MDIO controller node

Andrew Jeffery (1):
      ARM: dts: everest: Add phase corrections for eMMC

AngeloGioacchino Del Regno (14):
      arm64: dts: qcom: Add support for SONY Xperia X Performance / XZ
/ XZs (msm8996, Tone platform)
      arm64: dts: qcom: sdm630: Rewrite memory map
      arm64: dts: qcom: sdm630: Add qfprom subnodes
      arm64: dts: qcom: sdm630: Fix TLMM node and pinctrl configuration
      arm64: dts: qcom: sdm630: Add SDHCI2 node
      arm64: dts: qcom: sdm630: Add interconnect and opp table to sdhc_1
      arm64: dts: qcom: sdm630: Add GPU Clock Controller node
      arm64: dts: qcom: sdm630: Add clocks and power domains to SMMU nodes
      arm64: dts: qcom: sdm630: Add qcom,adreno-smmu compatible
      arm64: dts: qcom: sdm630: Add Adreno 508 GPU configuration
      arm64: dts: qcom: pm660: Support SPMI regulators on PMIC sid 1
      arm64: dts: qcom: pm660l: Support SPMI regulators on PMIC sid 3
      arm64: dts: qcom: sdm630: Configure the camera subsystem
      arm64: dts: qcom: sdm630-xperia-nile: Add all RPM and fixed regulator=
s

Arnaud Pouliquen (2):
      ARM: dts: stm32: Add coprocessor detach mbox on stm32mp157c-ed1 board
      ARM: dts: stm32: Add coprocessor detach mbox on stm32mp15x-dkx boards

Arnd Bergmann (32):
      Merge tag 'renesas-arm-dt-for-v5.15-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'renesas-dt-bindings-for-v5.15-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'ux500-dts-v5.15-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'at91-dt-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
      Merge tag 'omap-for-v5.15/dt-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'sti-dt-for-v5.15-round1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti into arm/dt
      Merge tag 'stm32-dt-for-v5.15-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into
arm/dt
      Merge tag 'ixp4xx-dts-arm-soc-v5.15-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'v5.14-next-dts32' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'v5.14-next-dts64' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'ti-k3-dt-for-v5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux into arm/dt
      Merge tag 'amlogic-arm64-dt-for-v5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/dt
      Merge tag 'amlogic-arm-dt-for-v5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/dt
      Merge tag 'samsung-dt-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'omap-for-v5.15/dt-am3-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'renesas-arm-dt-for-v5.15-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'amlogic-arm64-dt-for-v5.15-v2' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/dt
      Merge tag 'tegra-for-5.15-dt-bindings' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'tegra-for-5.15-arm-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'tegra-for-5.15-arm64-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'imx-bindings-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt64-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'qcom-dts-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'qcom-arm64-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'aspeed-5.15-devicetree' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/dt
      Merge tag 'sunxi-dt-for-5.15-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/dt
      Merge tag 'hisi-arm64-dt-for-5.15' of
git://github.com/hisilicon/linux-hisi into arm/dt
      Merge tag 'mvebu-dt64-5.15-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'v5.15-rockchip-dts32-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'zynq-dt-for-v5.15' of
https://github.com/Xilinx/linux-xlnx into arm/dt

Artem Lapkin (2):
      arm64: dts: meson: improve gxl-s905x-khadas-vim wifi
      arm64: dts: meson: improve gxm-khadas-vim2 wifi

Aswath Govindraju (1):
      ARM: dts: vf610-zii-dev-rev-b: Remove #address-cells and
#size-cells property from at93c46d dt node

Bartosz Dudziak (3):
      ARM: dts: qcom: Add support for MSM8226 SoC
      dt-bindings: arm: qcom: Document MSM8226 SoC binding
      ARM: dts: qcom: Add initial DTS file for Samsung Galaxy S III Neo pho=
ne

Baruch Siach (1):
      arm64: dts: qcom: ipq6018: correct TCSR block area

Bhupesh Sharma (4):
      arm64: dts: qcom: sm8150: Add UFS ICE capability
      arm64: dts: qcom: Use correct naming for dwc3 usb nodes in dts files
      arm64: dts: qcom: sm8150: Sort dc_noc and gem_noc nodes
      arm64: dts: qcom: Fix usb entries for SA8155p adp board

Biju Das (2):
      arm64: dts: renesas: r9a07g044: Add I2C nodes
      arm64: dts: renesas: hihope-rzg2-ex: Add EtherAVB internal rx delay

Bilal Wasim (1):
      arm64: dts: mediatek: mt8173: Add domain supply for mfg_async

Bjorn Andersson (4):
      arm64: dts: qcom: sdm850-yoga: Enable IPA
      ARM: dts: qcom: msm8974: castor: Add Bluetooth-related nodes
      arm64: dts: qcom: sm8350: Add wakeup-parent to tlmm
      Merge tag 'v5.14-rc3' into arm64-for-5.15

Caleb Connolly (2):
      arm64: dts: qcom: sdm845-oneplus-common: enable debug UART
      arm64: dts: qcom: sdm845-oneplus: add ipa firmware names

Chen-Yu Tsai (1):
      arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth

Chris Morgan (1):
      ARM: dts: rockchip: Add SFC to RV1108

Christian Hewitt (2):
      arm64: dts: meson: add audio playback to nexbox-a1
      arm64: dts: meson: add audio playback to vega-s95 dtsi

Christoph Niedermaier (16):
      dt-bindings: arm: fsl: Add DHCOM PicoITX and DHCOM DRC02 boards
      ARM: dts: imx6q-dhcom: Add the parallel system bus
      ARM: dts: imx6q-dhcom: Add interrupt and compatible to the ethernet P=
HY
      ARM: dts: imx6q-dhcom: Fill GPIO line names on DHCOM SoM
      ARM: dts: imx6q-dhcom: Adding Wake pin to the PCIe pinctrl
      ARM: dts: imx6q-dhcom: Align stdout-path with other DHCOM SoMs
      ARM: dts: imx6q-dhcom: Add keys and leds to the PDK2 board
      ARM: dts: imx6q-dhcom: Remove ddc-i2c-bus property
      ARM: dts: imx6q-dhcom: Set minimum memory size of all DHCOM i.MX6 var=
iants
      ARM: dts: imx6q-dhcom: Use 1G ethernet on the PDK2 board
      ARM: dts: imx6q-dhcom: Rework of the DHCOM GPIO pinctrls
      ARM: dts: imx6q-dhcom: Rearrange of iomux
      ARM: dts: imx6q-dhcom: Cleanup of the devicetrees
      ARM: dts: imx6qdl-dhcom: Split SoC-independent parts of DHCOM SOM and=
 PDK2
      ARM: dts: imx6qdl-dhcom: Add DHCOM based PicoITX board
      ARM: dts: imx6qdl-dhcom: Add DHSOM based DRC02 board

Claudiu Beznea (3):
      dt-bindings: atmel-sysreg: add bindings for sama7g5
      ARM: dts: at91: add pinctrl-{names, 0} for all gpios
      ARM: dts: at91: add conflict note for d3

Codrin Ciubotariu (1):
      ARM: dts: at91: sama5d2_icp: enable digital filter for I2C nodes

Craig Tatlor (1):
      ARM: dts: qcom: msm8974: Add blsp2_uart7 for bluetooth on sirius

Cristian Ciocaltea (2):
      ARM: dts: owl-s500: Add ethernet support
      ARM: dts: owl-s500-roseapplepi: Add ethernet support

Daniel Baluta (1):
      arm64: dts: imx8mp: Add dsp node

David Heidelberg (1):
      ARM: dts: qcom: apq8064: correct clock names

David Lechner (1):
      ARM: dts: am335x-boneblue: add gpio-line-names

Dmitry Baryshkov (7):
      arm64: dts: qcom: sm8250: fix usb2 qmp phy node
      arm64: dts: qcom: sdm845: move bus clock to mdp node for sdm845 targe=
t
      arm64: dts: qcom: sm8250: remove bus clock from the mdss node
for sm8250 target
      arm64: dts: qcom: sc7180: assign DSI clock source parents
      arm64: dts: qcom: sdm845: assign DSI clock source parents
      arm64: dts: qcom: sdm845-mtp: assign DSI clock source parents
      arm64: dts: qcom: sm8250: assign DSI clock source parents

Dmitry Osipenko (16):
      arm64: tegra194: p2888: Correct interrupt trigger type of
temperature sensor
      ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees
      ARM: tegra: ouya: Add interrupt to temperature sensor node
      ARM: tegra: paz00: Add interrupt to temperature sensor node
      ARM: tegra: nexus7: Add interrupt to temperature sensor node
      ARM: tegra: acer-a500: Add interrupt to temperature sensor node
      ARM: tegra: nyan: Correct interrupt trigger type of temperature senso=
r
      ARM: tegra: apalis: Correct interrupt trigger type of temperature sen=
sor
      ARM: tegra: cardhu: Correct interrupt trigger type of temperature sen=
sor
      ARM: tegra: dalmore: Correct interrupt trigger type of temperature se=
nsor
      ARM: tegra: jetson-tk1: Correct interrupt trigger type of
temperature sensor
      ARM: tegra: acer-a500: Remove bogus USB VBUS regulators
      ARM: tegra: acer-a500: Add power supplies to accelerometer
      ARM: tegra: acer-a500: Use verbose variant of atmel,wakeup-method val=
ue
      ARM: tegra: acer-a500: Improve thermal zones
      ARM: tegra: nexus7: Improve thermal zones

Douglas Anderson (1):
      arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip

Dylan Hung (1):
      ARM: dts: aspeed-g6: Fix HVI3C function-group in pinctrl dtsi

Eugen Hristev (3):
      dt-bindings: ARM: at91: document sama7g5ek board
      ARM: dts: at91: add sama7g5 SoC DT and sama7g5-ek
      ARM: dts: at91: sama5d27_som1_ek: enable ADC node

Fabio Estevam (1):
      arm64: dts: imx8mm-venice-gw7901: Remove unnecessary
#address-cells/#size-cells

Felipe Balbi (1):
      arm64: dts: qcom: sm8150: add SPI nodes

Frank Wunderlich (1):
      arm: dts: mt7623: increase passive cooling trip

Geert Uytterhoeven (28):
      arm64: dts: renesas: salvator-x(s): Factor out HDMI1 parts
      arm64: dts: renesas: salvator-x(s): Factor out SATA parts
      arm64: dts: renesas: salvator-x(s): Factor out USB ch2 parts
      arm64: dts: renesas: salvator-xs: Factor out USB ch3 parts
      ARM: dts: r8a73a4: Remove non-functional DMA support
      ARM: dts: rzg1: Add generic compatible strings to IIC nodes
      arm64: dts: renesas: r8a774c0: Add generic compatible string to IIC n=
ode
      arm64: dts: renesas: r8a77990: Add generic compatible string to IIC n=
ode
      arm64: dts: renesas: rzg2: Rename i2c_dvfs to iic_pmic
      arm64: dts: renesas: r8a779a0: Restore sort order
      arm64: dts: renesas: r8a77995: draak: Remove bogus adv7511w propertie=
s
      arm64: dts: renesas: r8a77990: ebisu: Add I2C EEPROM for PMIC
      ARM: dts: qcom: apq8060: Correct Ethernet node name and drop
bogus irq property
      dt-bindings: arm: renesas: Document R-Car H3e-2G and M3e-2G SoCs
and boards
      arm64: dts: renesas: rcar-gen3: Add SoC model to comment headers
      arm64: dts: renesas: Add Renesas R8A779M1 SoC support
      arm64: dts: renesas: Add Renesas R8A779M3 SoC support
      arm64: dts: renesas: Add support for Salvator-XS with R-Car H3e-2G
      arm64: dts: renesas: Add support for H3ULCB with R-Car H3e-2G
      arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car H3e=
-2G
      arm64: dts: renesas: Add support for Salvator-XS with R-Car M3e-2G
      arm64: dts: renesas: Add support for M3ULCB with R-Car M3e-2G
      arm64: dts: renesas: Add support for M3ULCB+Kingfisher with R-Car M3e=
-2G
      Merge tag 'renesas-r9a07g044-dt-binding-defs-tag2' into HEAD
      dt-bindings: i2c: renesas,riic: Add interrupt-names
      ARM: dts: rza: Add I2C interrupt-names
      arm64: dts: renesas: r9a07g044: Add I2C interrupt-names
      dt-bindings: i2c: renesas,riic: Make interrupt-names required

Georgi Djakov (2):
      arm64: dts: qcom: sm8250: Fix epss_l3 unit address
      arm64: dts: qcom: msm8916: Enable CoreSight STM component

Gokul Sriram Palanisamy (2):
      arm64: dts: qcom: ipq6018: Update WCSS PIL driver compatible
      arm64: dts: qcom: ipq8074: Add scm on IPQ8074 SoCs

Grygorii Strashko (16):
      ARM: dts: am335x-baltos: switch to new cpsw switch drv
      ARM: dts: am335x-nano: switch to new cpsw switch drv
      ARM: dts: am335x-chiliboard: switch to new cpsw switch drv
      ARM: dts: am335x-cm-t335: switch to new cpsw switch drv
      ARM: dts: am335x-igep0033: switch to new cpsw switch drv
      ARM: dts: am335x-lxm: switch to new cpsw switch drv
      ARM: dts: am335x-moxa-uc: switch to new cpsw switch drv
      ARM: dts: am335x-myirtech: switch to new cpsw switch drv
      ARM: dts: am335x-osd3358-sm-red: switch to new cpsw switch drv
      ARM: dts: am335x-pdu001: switch to new cpsw switch drv
      ARM: dts: am335x-pepper: switch to new cpsw switch drv
      ARM: dts: am335x-phycore: switch to new cpsw switch drv
      ARM: dts: am335x-shc: switch to new cpsw switch drv
      ARM: dts: am335x-sl50: switch to new cpsw switch drv
      ARM: dts: am33xx: update ethernet aliases
      ARM: dts: am335x-bone: switch to new cpsw switch drv

Hsin-Yi Wang (4):
      arm64: dts: mt8183: kukui: Use aliases to mmc nodes
      arm64: dts: mt8173: elm: Use aliases to mmc nodes
      arm64: dts: mt8183: add mediatek,gce-events in mutex
      dt-bindings: mediatek: Add optional mediatek,gce-events property

Ioana Ciornei (3):
      arm64: dts: lx2160ardb: update PHY nodes with IRQ information
      arm64: dts: ls2088ardb: update PHY nodes with IRQ information
      arm64: dts: ls1088ardb: update PHY nodes with IRQ information

Jernej Skrabec (3):
      arm64: dts: allwinner: h6: tanix-tx6: Fix regulator node names
      arm64: dts: allwinner: h6: tanix-tx6: Add PIO power supplies
      arm64: dts: allwinner: h6: tanix-tx6: enable emmc

Jim Wright (1):
      ARM: dts: aspeed: p10bmc: Add power control pins

Joel Stanley (3):
      ARM: dts: rainier, everest: Add TPM reset GPIO
      ARM: dts: aspeed: tacoma: Add TPM reset GPIO
      ARM: dts: aspeed: ast2500evb: Enable built in RTC

Johan Jonker (6):
      ARM: dts: rockchip: rename pcfg_* nodenames for rk3066/rk3188
      ARM: dts: rockchip: add space after &grf on rk3188
      ARM: dts: rockchip: rename timer compatible strings for rk3066a
      ARM: dts: rockchip: remove interrupt-names from iommu nodes
      ARM: dts: rockchip: add io-domains node to rk3188.dtsi
      ARM: dts: rockchip: add io-domains nodes to rv1108.dtsi

Jonathan Marek (1):
      arm64: dts: qcom: sm8350: add qupv3_id_1/i2c13 nodes

Judy Hsiao (2):
      arm64: dts: qcom: sc7180: Set adau wakeup delay to 80 ms
      arm64: dts: qcom: sc7180: trogdor: Update audio codec to Max98360A

Kathiravan T (1):
      arm64: dts: qcom: ipq6018: enable USB2 support

Konrad Dybcio (31):
      arm64: dts: qcom: Add PMI8996 DTSI file
      arm64: dts: qcom: Add MSM8996v3.0 DTSI file
      arm64: dts: qcom: msm8996-*: Disable HDMI by default
      arm64: dts: qcom: sdm630: Add RPMPD nodes
      arm64: dts: qcom: sdm630: Add MMCC node
      arm64: dts: qcom: sdm630: Add interconnect provider nodes
      arm64: dts: qcom: sdm630: Add MDSS nodes
      arm64: dts: qcom: sdm630: Add USB configuration
      arm64: dts: qcom: sdm630: Add TSENS node
      arm64: dts: qcom: sdm630: Add modem/ADSP SMP2P nodes
      arm64: dts: qcom: sdm630: Add thermal-zones configuration
      arm64: dts: qcom: sdm630: Add ADSP remoteproc configuration
      arm64: dts: qcom: sdm630: Raise tcsr_mutex_regs size
      arm64: dts: qcom: pm660l: Add WLED support
      arm64: dts: qcom: pm660(l): Add VADC and temp alarm nodes
      arm64: dts: qcom: sdm660: Make the DTS an overlay on top of 630
      arm64: dts: qcom: Add device tree for SDM636
      arm64: dts: qcom: sdm630: Add IMEM node
      arm64: dts: qcom: sdm660: Add required nodes for DSI1
      arm64: dts: qcom: sdm630-nile: Use &labels
      arm64: dts: qcom: sdm630-nile: Add USB
      arm64: dts: qcom: sdm630-nile: Add Volume up key
      arm64: dts: qcom: sdm630-xperia: Retire sdm630-sony-xperia-ganges.dts=
i
      arm64: dts: qcom: sdm630-nile: Add Synaptics touchscreen.
      arm64: dts: qcom: sdm630-nile: Specify ADSP firmware name
      arm64: dts: qcom: sdm630-nile: Enable uSD card slot
      arm64: dts: qcom: sdm630-nile: Remove gpio-keys autorepeat
      arm64: dts: qcom: sdm630: Add I2C functions to I2C pins
      arm64: dts: qcom: sdm630: Add DMA to I2C hosts
      arm64: dts: qcom: sm8250: Add DMA to I2C/SPI
      arm64: dts: qcom: pm8004: Enable the PMIC peripherals by default

Konstantin Porotchkin (3):
      arm64: dts: cn913x: add device trees for topology B boards
      arm64: dts: add support for Marvell cn9130-crb platform
      arch/arm64: dts: change 10gbase-kr to 10gbase-r in Armada

Krzysztof Kozlowski (9):
      arm64: dts: exynos: add CPU topology to Exynos5433
      ARM: dts: exynos: add CPU topology to Exynos3250
      ARM: dts: exynos: add CPU topology to Exynos4210
      ARM: dts: exynos: add CPU topology to Exynos4412
      ARM: dts: exynos: add CPU topology to Exynos5250
      ARM: dts: exynos: add CPU topology to Exynos5260
      ARM: dts: exynos: add CPU topology to Exynos5420
      ARM: dts: exynos: add CPU topology to Exynos5422
      arm64: dts: exynos: correct GIC CPU interfaces address range on Exyno=
s7

Kuninori Morimoto (2):
      arm64: dts: renesas: r8a77995: Add R-Car Sound support
      arm64: dts: renesas: r8a77995: draak: Add R-Car Sound support

Kuogee Hsieh (1):
      arm64: dts: qcom: sc7180: Add DisplayPort node

Kwon Tae-young (3):
      arm64: dts: imx8qxp-ai_ml: Fix checkpatch warnings
      arm64: dts: imx8mq-evk: add CD pinctrl for usdhc2
      arm64: dts: imx8mq-evk: Remove unnecessary blank lines

Lad Prabhakar (4):
      dt-bindings: clock: r9a07g044-cpg: Add entry for P0_DIV2 core clock
      arm64: dts: renesas: r9a07g044: Add pinctrl node
      arm64: dts: renesas: r9a07g044: Add ADC node
      arm64: dts: renesas: r9a07g044: Add CANFD node

Linus Walleij (20):
      ARM: dts: ux500: Add device tree for Samsung Gavini
      ARM: dts: ux500: Flag eMMCs as non-SDIO/SD
      ARM: dts: ux500: Add devicetree for Codina
      ARM: dts: ux500: Add a device tree for Kyle
      ARM: dts: ux500: Adjust operating points to reality
      ARM: dts: qcom: Fix up APQ8060 DragonBoard license
      ARM: dts: ixp4xx: Fix up bad interrupt flags
      ARM: dts: ixp4xx: Add devicetree for Iomega NAS 100D
      ARM: dts: ixp4xx: Move EPBX100 flash to external bus node
      ARM: dts: ixp4xx: Add devicetree for D-Link DSM-G600 rev A
      ARM: dts: ixp4xx: Add second UART
      ARM: dts: ixp4xx: Use the expansion bus
      ARM: dts: ixp4xx: Add devicetree for Netgear WG302v2
      ARM: dts: ixp4xx: Add Arcom Vulcan device tree
      ARM: dts: ixp4xx: Add Gateworks Avila GW2348 device tree
      ARM: dts: ixp4xx: Add CF to GW2358
      ARM: dts: ixp4xx: Add Intel IXDP425 etc reference designs
      ARM: dts: ixp4xx: Add device trees for Coyote and IXDPG425
      ARM: dts: ixp4xx: Add devicetree for Linksys WRV54G
      ARM: dts: ixp4xx: Add a devicetree for Freecom FSG-3

Lokesh Vutla (5):
      ARM: dts: Add support for dra762 abz package
      arm64: dts: ti: k3-am64-main: Add epwm nodes
      arm64: dts: ti: k3-am64-main: Add ecap pwm nodes
      arm64: dts: ti: k3-am642-evm: Add pwm nodes
      arm64: dts: ti: k3-am642-sk: Add pwm nodes

Lucas Stach (6):
      dt-bindings: arm: fsl: add Nitrogen8 SoM
      dt-bindings: vendor-prefixes: add mntre
      dt-bindings: arm: fsl: add MNT Reform2 board
      arm64: dts: imx8mq: add Nitrogen8 SoM
      arm64: dts: imx8mq: add support for MNT Reform2
      arm64: dts: imx8mq-reform2: add sound support

Ludovic Desroches (1):
      ARM: dts: at91: sama5d4_xplained: change the key code of the gpio key

Magnus Damm (2):
      arm64: dts: renesas: r8a77995: draak: Add SW56 support
      arm64: dts: renesas: r8a77990: ebisu: Add SW4 support

Marek Vasut (6):
      ARM: dts: stm32: Set {bitclock,frame}-master phandles on DHCOM SoM
      ARM: dts: stm32: Add backlight and panel supply on DHCOM SoM
      ARM: dts: stm32: Add usbphyc_port1 supply on DHCOM SoM
      ARM: dts: stm32: Set {bitclock,frame}-master phandles on ST DKx
      ARM: dts: stm32: Update AV96 adv7513 node per dtbs_check
      arm64: dts: imx8m: Replace deprecated fsl,usbphy DT props with phys

Martin Blumenstingl (3):
      ARM: dts: meson8: Use a higher default GPU clock frequency
      ARM: dts: meson: Add the AIU audio controller
      ARM: dts: meson8b: ec100: wire up the RT5640 audio codec

Martin Botka (2):
      arm64: dts: qcom: Add support for SM6125
      arm64: dts: qcom: sm6125: Add support for Sony Xperia 10II

Martin Kepplinger (1):
      arm64: dts: imx8mq: add mipi csi phy and csi bridge descriptions

Mathew McBride (5):
      arm64: dts: ls1088a: add internal PCS for DPMAC1 node
      arm64: dts: ls1088a: add missing PMU node
      arm64: dts: add device tree for Traverse Ten64 (LS1088A)
      dt-bindings: vendor-prefixes: add Traverse Technologies
      dt-bindings: arm: fsl: Add Traverse Ten64 (LS1088A) board

Matthew Hagan (1):
      ARM: dts: qcom: add ahb reset to ipq806x-gmac

Mauro Carvalho Chehab (1):
      arm64: dts: HiSilicon: hi3660: address a PCI warning

Michael Walle (2):
      ARM: dts: zynq: add NAND flash controller node
      ARM: dts: ebaz4205: enable NAND support

Mirela Rabulea (2):
      dt-bindings: media: imx-jpeg: Add compatible for i.MX8QM JPEG codec
      arm64: dts: imx8: Add jpeg encoder/decoder nodes

Nicolas Ferre (1):
      ARM: dts: at91: use the right property for shutdown controller

Oleksij Rempel (3):
      dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
      dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based boards
      ARM: dts: imx6qp-prtwd3: configure ENET_REF clock to 125MHz

Pali Roh=C3=A1r (1):
      arm64: dts: marvell: armada-37xx: Extend PCIe MEM space

Patrice Chotard (4):
      ARM: dts: sti: remove clk_ignore_unused from bootargs for stih407-b21=
20
      ARM: dts: sti: remove clk_ignore_unused from bootargs for stih410-b21=
20
      ARM: dts: sti: remove clk_ignore_unused from bootargs for stih418-b21=
99
      ARM: dts: sti: remove clk_ignore_unused from bootargs for stih410-b22=
60

Paul Barker (5):
      ARM: dts: am335x-boneblack: Extract HDMI config
      ARM: dts: am335x-sancloud-bbe: Extract common code
      ARM: dts: am335x-sancloud-bbe-lite: New devicetree
      ARM: dts: am335x-sancloud-bbe: Fix missing pinctrl refs
      ARM: dts: am335x-sancloud-bbe: Drop usb wifi comment

Peng Fan (3):
      arm64: dts: imx8mm: update pmu compatible
      arm64: dts: imx8qxp: update pmu compatible
      arm64: dts: imx8m: drop interrupt-affinity for pmu

Peter Ujfalusi (2):
      ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
      ARM: dts: omap4-l4-abe: Add McASP configuration

Ping Guo (1):
      ARM: dts: aspeed: Add Inspur NF5280M6 BMC machine

Raag Jadav (1):
      arm64: dts: ls1046a: fix eeprom entries

Rajendra Nayak (3):
      arm64: dts: qcom: sc7280: Add qfprom node
      dt-bindings: arm: qcom: Document qcom,sc7280-idp2 board
      arm64: dts: qcom: sc7280-idp: Add device tree files for IDP2

Ravi Kumar Bokka (1):
      arm64: dts: qcom: sc7180:: modified qfprom CORR size as per RAW size

Rob Herring (1):
      arm/arm64: dts: Fix remaining dtc 'unit_address_format' warnings

Robert Foss (1):
      arm64: dts: qcom: sm8350: Rename GENI serial engine DT node

Robert Marko (2):
      arm64: dts: qcom: ipq8074: add crypto nodes
      arm64: dts: qcom: ipq8074: add PRNG node

Russell King (1):
      ARM: dts: add SolidRun SolidSense support

Russell King (Oracle) (1):
      dt-bindings: arm: fsl: add SolidSense boards

Sam Ravnborg (1):
      ARM: dts: add SKOV imx6q and imx6dl based boards

Sandeep Maheswaram (3):
      arm64: dts: qcom: sc7280: Add USB related nodes
      arm64: dts: qcom: sc7280: Add USB nodes for IDP board
      arm64: dts: qcom: sc7280: Add interconnect properties for USB

Selvam Sathappan Periakaruppan (1):
      arm64: dts: qcom: ipq6018: Add pcie support

Shaik Sajida Bhanu (1):
      arm64: dts: qcom: sc7280: Add nodes for eMMC and SD card

Sibi Sankar (1):
      arm64: dts: qcom: sc7280: Fixup the cpufreq node

Stefan Chulski (1):
      dts: marvell: Enable 10G interfaces on 9130-DB and 9131-DB boards

Stephan Gerhold (5):
      arm64: dts: qcom: Add device tree for Xiaomi Redmi 2 (wingtech-wt8804=
7)
      arm64: dts: qcom: msm8916-wingtech-wt88047: Add touchscreen
      arm64: dts: qcom: msm8916-wingtech-wt88047: Add notification LED
      arm64: dts: qcom: msm8916-wingtech-wt88047: Add IMU
      ARM: dts: ux500: ab8500: Link USB PHY to USB controller node

Steven Lee (4):
      dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
      dt-bindings: aspeed-sgpio: Add ast2600 sgpio
      ARM: dts: aspeed-g6: Add SGPIO node.
      ARM: dts: aspeed-g5: Remove ngpios from sgpio node.

Suman Anna (10):
      ARM: dts: am33xx-l4: Add PRUSS node
      ARM: dts: am33xx-l4: Add PRUSS MDIO controller node
      ARM: dts: am335x-bone-common: Enable PRU-ICSS node
      ARM: dts: am335x-evm: Enable PRU-ICSS module
      ARM: dts: am335x-evmsk: Enable PRU-ICSS module
      ARM: dts: am335x-icev2: Enable PRU-ICSS module
      ARM: dts: am4372: Add the PRU-ICSS1 DT node
      ARM: dts: am4372: Add the PRU-ICSS0 DT node
      ARM: dts: am57xx: Add PRU-ICSS nodes
      ARM: dts: am57xx: Add PRUSS MDIO controller nodes

Tao Ren (12):
      ARM: dts: aspeed: Enable ADC in Facebook AST2400 common dtsi
      ARM: dts: aspeed: wedge40: Remove redundant ADC device
      ARM: dts: aspeed: galaxy100: Remove redundant ADC device
      ARM: dts: aspeed: wedge100: Enable ADC channels
      ARM: dts: Add Facebook BMC 128MB flash layout
      ARM: dts: aspeed: wedge400: Use common flash layout
      ARM: dts: aspeed: Common dtsi for Facebook AST2600 Network BMCs
      ARM: dts: aspeed: Add Facebook Cloudripper (AST2600) BMC
      ARM: dts: aspeed: Add Facebook Elbert (AST2600) BMC
      ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC
      ARM: dts: aspeed: minipack: Update flash partition table
      ARM: dts: aspeed: cloudripper: Add comments for "mdio1"

Thara Gopinath (3):
      arm64: dts: qcom: sm8150: Add CPU opp tables
      arm64: dts: qcom: sm8150-mtp: Add 8150 compatible string
      arm64: dts: qcom: sm8150: Fix incorrect cpu opp table entry

Thierry Reding (5):
      dt-bindings: tegra: Document NVIDIA Jetson TX2 NX developer kit
      arm64: tegra: Add PWM nodes on Tegra186
      arm64: tegra: Add NVIDIA Jetson TX2 NX Developer Kit support
      arm64: tegra: Add missing interconnects property for USB on Tegra186
      arm64: tegra: Fix compatible string for Tegra132 CPUs

Thomas Perrot (1):
      ARM: dts: imx7: add ftm nodes for Flex Timers

Tim Harvey (9):
      ARM: dts: imx6qdl-gw5xxx: add missing USB OTG OC pinmux
      ARM: dts: imx6qdl-gw5904: atecc508a support
      dt-bindings: arm: imx: add imx8mm/imx8mn GW7902 support
      arm64: dts: imx: Add i.mx8mm/imx8mn Gateworks gw7902 dts support
      arm64: dts: imx8mm-venice-gw700x: fix mp5416 pmic config
      arm64: dts: imx8mm-venice-gw700x: fix invalid pmic pin config
      arm64: dts: imx8mm-venice-gw71xx: fix USB OTG VBUS
      arm64: dts: imx8mm-venice-gw7901: add support for USB hub subload
      arm64: dts: imx8mm-venice-gw7901: enable pull-down on gpio outputs

Tudor Ambarus (1):
      ARM: dts: at91: sama5d4_xplained: Remove spi0 node

V Sujith Kumar Reddy (2):
      arm64: dts: qcom: sc7180: Update lpass cpu node for audio over dp
      arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI

Vidya Sagar (1):
      arm64: tegra: Fix Tegra194 PCIe EP compatible string

Vinod Koul (11):
      arm64: dts: qcom: msm8996: don't use empty memory node
      arm64: dts: qcom: msm8998: don't use empty memory node
      arm64: dts: qcom: sdm630: don't use empty memory node
      arm64: dts: qcom: ipq8074: fix pci node reg property
      arm64: dts: qcom: sdm660: use reg value for memory node
      arm64: dts: qcom: ipq6018: drop '0x' from unit address
      arm64: dts: qcom: sdm630: don't use underscore in node name
      arm64: dts: qcom: msm8994: don't use underscore in node name
      arm64: dts: qcom: msm8996: don't use underscore in node name
      dt-bindings: arm: qcom: Document alcatel,idol347 board
      dt-bindings: arm: qcom: Drop qcom,mtp

Wesley Cheng (1):
      arm64: dts: qcom: pm8150b: Add DTS node for PMIC VBUS booster

Yassine Oudjana (1):
      arm64: dts: qcom: msm8996: Add gpu cooling support

Yoshihiro Shimoda (1):
      arm64: dts: renesas: r8a77961: Add iommus to ipmmu_ds[01] related nod=
es

satya priya (1):
      arm64: dts: qcom: sc7280: Remove pm8350 and pmr735b for sc7280-idp

 .../devicetree/bindings/arm/atmel-at91.yaml        |    5 +
 .../devicetree/bindings/arm/atmel-sysregs.txt      |   14 +-
 Documentation/devicetree/bindings/arm/fsl.yaml     |   29 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   10 +
 Documentation/devicetree/bindings/arm/renesas.yaml |   50 +-
 Documentation/devicetree/bindings/arm/tegra.yaml   |    1 +
 .../devicetree/bindings/gpio/aspeed,sgpio.yaml     |   77 ++
 .../devicetree/bindings/gpio/sgpio-aspeed.txt      |   46 -
 .../devicetree/bindings/i2c/renesas,riic.yaml      |   30 +-
 .../devicetree/bindings/mailbox/mtk-gce.txt        |   15 +
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   |   19 +-
 .../devicetree/bindings/thermal/qcom-tsens.yaml    |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    6 +
 arch/arm/boot/dts/Makefile                         |   41 +-
 arch/arm/boot/dts/am335x-baltos-ir2110.dts         |   10 +-
 arch/arm/boot/dts/am335x-baltos-ir3220.dts         |    8 +-
 arch/arm/boot/dts/am335x-baltos-ir5221.dts         |    8 +-
 arch/arm/boot/dts/am335x-baltos.dtsi               |    5 +-
 arch/arm/boot/dts/am335x-bone-common.dtsi          |   17 +-
 arch/arm/boot/dts/am335x-boneblack-common.dtsi     |  135 --
 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi       |  141 ++
 arch/arm/boot/dts/am335x-boneblack-wireless.dts    |    3 +-
 arch/arm/boot/dts/am335x-boneblack.dts             |    1 +
 arch/arm/boot/dts/am335x-boneblue.dts              |  143 +-
 arch/arm/boot/dts/am335x-bonegreen-wireless.dts    |    2 +-
 arch/arm/boot/dts/am335x-chiliboard.dts            |   13 +-
 arch/arm/boot/dts/am335x-cm-t335.dts               |   13 +-
 arch/arm/boot/dts/am335x-evm.dts                   |    4 +
 arch/arm/boot/dts/am335x-evmsk.dts                 |    4 +
 arch/arm/boot/dts/am335x-icev2.dts                 |    4 +
 arch/arm/boot/dts/am335x-igep0033.dtsi             |   12 +-
 arch/arm/boot/dts/am335x-lxm.dts                   |   14 +-
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi  |   12 +-
 arch/arm/boot/dts/am335x-moxa-uc-2101.dts          |    7 +-
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi  |   16 +-
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi         |   25 +-
 arch/arm/boot/dts/am335x-myirtech-myd.dts          |   18 +-
 arch/arm/boot/dts/am335x-nano.dts                  |   13 +-
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts       |   10 +-
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts       |   10 +-
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts       |   10 +-
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts        |   13 +-
 arch/arm/boot/dts/am335x-pcm-953.dtsi              |   10 +-
 arch/arm/boot/dts/am335x-pdu001.dts                |   14 +-
 arch/arm/boot/dts/am335x-pepper.dts                |   14 +-
 arch/arm/boot/dts/am335x-phycore-som.dtsi          |   14 +-
 arch/arm/boot/dts/am335x-regor.dtsi                |   11 +-
 arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi  |   67 +
 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts     |   50 +
 arch/arm/boot/dts/am335x-sancloud-bbe.dts          |   96 +-
 arch/arm/boot/dts/am335x-shc.dts                   |   38 +-
 arch/arm/boot/dts/am335x-sl50.dts                  |   12 +-
 arch/arm/boot/dts/am335x-wega.dtsi                 |   11 +-
 arch/arm/boot/dts/am33xx-l4.dtsi                   |   82 ++
 arch/arm/boot/dts/am33xx.dtsi                      |    4 +-
 arch/arm/boot/dts/am4372.dtsi                      |  165 +++
 arch/arm/boot/dts/am437x-cm-t43.dts                |    4 +
 arch/arm/boot/dts/am437x-gp-evm.dts                |    4 +
 arch/arm/boot/dts/am437x-idk-evm.dts               |    4 +
 arch/arm/boot/dts/am437x-sk-evm.dts                |    4 +
 arch/arm/boot/dts/am43x-epos-evm.dts               |    4 +
 arch/arm/boot/dts/am57-pruss.dtsi                  |  178 ++-
 arch/arm/boot/dts/am571x-idk.dts                   |    8 +
 arch/arm/boot/dts/am572x-idk.dts                   |    8 +
 arch/arm/boot/dts/am5748.dtsi                      |    6 +-
 arch/arm/boot/dts/am574x-idk.dts                   |   10 +-
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi    |    8 +
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts          |    8 +
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |    4 +
 .../boot/dts/aspeed-bmc-facebook-cloudripper.dts   |  544 ++++++++
 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts   |  185 +++
 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts     | 1251 ++++++++++++++++=
+
 .../arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts |    4 -
 arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts |    8 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts |    5 +
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts  |    4 -
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts |   48 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |    6 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts   |  691 ++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |    2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |    1 -
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi           |    4 +-
 arch/arm/boot/dts/aspeed-g6.dtsi                   |   28 +
 .../boot/dts/ast2400-facebook-netbmc-common.dtsi   |    4 +
 .../boot/dts/ast2600-facebook-netbmc-common.dtsi   |  169 +++
 arch/arm/boot/dts/at91-kizbox3_common.dtsi         |    2 +-
 arch/arm/boot/dts/at91-sam9x60ek.dts               |   18 +-
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi          |   12 +-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |    6 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts      |    2 +-
 arch/arm/boot/dts/at91-sama5d2_icp.dts             |    8 +-
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts          |    6 +-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |   16 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts        |   31 +-
 arch/arm/boot/dts/at91-sama5d4_xplained.dts        |   32 +-
 arch/arm/boot/dts/at91-sama7g5ek.dts               |  656 +++++++++
 arch/arm/boot/dts/dm8148-evm.dts                   |    8 +-
 arch/arm/boot/dts/dm8168-evm.dts                   |    8 +-
 arch/arm/boot/dts/dra74x-p.dtsi                    |   27 +
 arch/arm/boot/dts/dra76x.dtsi                      |   12 -
 arch/arm/boot/dts/exynos3250.dtsi                  |   11 +
 arch/arm/boot/dts/exynos4210.dtsi                  |   11 +
 arch/arm/boot/dts/exynos4412.dtsi                  |   17 +
 arch/arm/boot/dts/exynos5250.dtsi                  |   11 +
 arch/arm/boot/dts/exynos5260.dtsi                  |   38 +-
 arch/arm/boot/dts/exynos5420-cpus.dtsi             |   32 +
 arch/arm/boot/dts/exynos5422-cpus.dtsi             |   32 +
 .../boot/dts/facebook-bmc-flash-layout-128.dtsi    |   60 +
 arch/arm/boot/dts/imx6dl-dhcom-picoitx.dts         |   20 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts         |   13 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts         |  106 ++
 arch/arm/boot/dts/imx6dl-solidsense.dts            |   54 +
 arch/arm/boot/dts/imx6q-dhcom-pdk2.dts             |  270 +---
 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts          |   36 +
 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts          |  128 ++
 .../boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts    |  127 ++
 arch/arm/boot/dts/imx6q-solidsense.dts             |   54 +
 arch/arm/boot/dts/imx6qdl-dhcom-drc02.dtsi         |  139 ++
 arch/arm/boot/dts/imx6qdl-dhcom-pdk2.dtsi          |  361 +++++
 arch/arm/boot/dts/imx6qdl-dhcom-picoitx.dtsi       |   69 +
 ...imx6q-dhcom-som.dtsi =3D> imx6qdl-dhcom-som.dtsi} |  631 ++++++---
 arch/arm/boot/dts/imx6qdl-gw51xx.dtsi              |    1 +
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi              |    1 +
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi              |    1 +
 arch/arm/boot/dts/imx6qdl-gw553x.dtsi              |    1 +
 arch/arm/boot/dts/imx6qdl-gw5904.dtsi              |    5 +
 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi       |   54 +
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi            |  477 +++++++
 arch/arm/boot/dts/imx6qdl-solidsense.dtsi          |  160 +++
 arch/arm/boot/dts/imx6qp-prtwd3.dts                |    2 +
 arch/arm/boot/dts/imx6s-dhcom-drc02.dts            |   30 +
 arch/arm/boot/dts/imx7d-remarkable2.dts            |   91 ++
 arch/arm/boot/dts/imx7s.dtsi                       |   28 +
 arch/arm/boot/dts/integratorap-im-pd1.dts          |    4 +-
 arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts      |  110 ++
 arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts    |  167 +++
 arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts  |  145 ++
 arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts   |  158 +++
 .../arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts |  172 +++
 arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts  |  146 ++
 arch/arm/boot/dts/intel-ixp42x-ixdp425.dts         |   72 +
 arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts        |  125 ++
 arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts   |   30 +-
 arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts  |  173 +++
 arch/arm/boot/dts/intel-ixp42x-netgear-wg302v2.dts |   95 ++
 .../arm/boot/dts/intel-ixp42x-welltech-epbx100.dts |   84 +-
 arch/arm/boot/dts/intel-ixp42x.dtsi                |    5 +
 .../arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts |   81 +-
 arch/arm/boot/dts/intel-ixp43x-kixrp435.dts        |   68 +
 arch/arm/boot/dts/intel-ixp43x.dtsi                |    6 +
 arch/arm/boot/dts/intel-ixp45x-ixp46x.dtsi         |   11 +
 arch/arm/boot/dts/intel-ixp46x-ixdp465.dts         |   38 +
 .../boot/dts/intel-ixp4xx-reference-design.dtsi    |  132 ++
 arch/arm/boot/dts/intel-ixp4xx.dtsi                |   44 +-
 arch/arm/boot/dts/keystone-k2e-netcp.dtsi          |    2 +-
 arch/arm/boot/dts/keystone-k2hk-netcp.dtsi         |    2 +-
 arch/arm/boot/dts/keystone-k2l-netcp.dtsi          |    2 +-
 arch/arm/boot/dts/meson.dtsi                       |   12 +
 arch/arm/boot/dts/meson8.dtsi                      |   68 +
 arch/arm/boot/dts/meson8b-ec100.dts                |   48 +-
 arch/arm/boot/dts/meson8b-mxq.dts                  |    4 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts             |    4 +-
 arch/arm/boot/dts/meson8b.dtsi                     |   63 +
 arch/arm/boot/dts/mt7623.dtsi                      |    2 +-
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |    4 +-
 arch/arm/boot/dts/omap4-l4-abe.dtsi                |   38 +-
 arch/arm/boot/dts/owl-s500-roseapplepi.dts         |   45 +
 arch/arm/boot/dts/owl-s500.dtsi                    |   10 +
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |   23 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                |   30 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |   20 +-
 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts  |   25 +
 arch/arm/boot/dts/qcom-msm8226.dtsi                |  147 ++
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    |   11 +
 .../boot/dts/qcom-msm8974-sony-xperia-castor.dts   |   81 ++
 arch/arm/boot/dts/qcom-msm8974.dtsi                |    9 +
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |    2 +-
 arch/arm/boot/dts/r7s72100.dtsi                    |    8 +
 arch/arm/boot/dts/r7s9210.dtsi                     |    8 +
 arch/arm/boot/dts/r8a73a4.dtsi                     |   44 -
 arch/arm/boot/dts/r8a7742.dtsi                     |    4 +-
 arch/arm/boot/dts/r8a7743.dtsi                     |    4 +-
 arch/arm/boot/dts/r8a7744.dtsi                     |    4 +-
 arch/arm/boot/dts/rk3066a.dtsi                     |   10 +-
 arch/arm/boot/dts/rk3188.dtsi                      |   13 +-
 arch/arm/boot/dts/rk3288.dtsi                      |    6 -
 arch/arm/boot/dts/rv1108.dtsi                      |   49 +-
 arch/arm/boot/dts/sama7g5-pinfunc.h                |  923 +++++++++++++
 arch/arm/boot/dts/sama7g5.dtsi                     |  528 +++++++
 arch/arm/boot/dts/ste-ab8500.dtsi                  |   36 +-
 arch/arm/boot/dts/ste-ab8505.dtsi                  |   30 +-
 arch/arm/boot/dts/ste-db8500.dtsi                  |   13 +-
 arch/arm/boot/dts/ste-db8520.dtsi                  |   13 +-
 arch/arm/boot/dts/ste-db9500.dtsi                  |    9 +-
 arch/arm/boot/dts/ste-dbx5x0-pinctrl.dtsi          |   18 +
 arch/arm/boot/dts/ste-href.dtsi                    |    4 +
 arch/arm/boot/dts/ste-snowball.dts                 |    2 +
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts     |  863 ++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     |  854 ++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts     |    2 +
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     |    4 +-
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts       |  664 +++++++++
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     |    2 +
 arch/arm/boot/dts/stih407-b2120.dts                |    1 -
 arch/arm/boot/dts/stih407-clock.dtsi               |  128 +-
 arch/arm/boot/dts/stih407-family.dtsi              |   15 +
 arch/arm/boot/dts/stih410-b2120.dts                |    1 -
 arch/arm/boot/dts/stih410-b2260.dts                |    1 -
 arch/arm/boot/dts/stih410-clock.dtsi               |  138 +-
 arch/arm/boot/dts/stih418-b2199.dts                |    1 -
 arch/arm/boot/dts/stih418-b2264.dts                |  151 ++
 arch/arm/boot/dts/stih418-clock.dtsi               |  136 +-
 arch/arm/boot/dts/stih418.dtsi                     |   12 +
 arch/arm/boot/dts/stm32429i-eval.dts               |    2 +-
 arch/arm/boot/dts/stm32f469-disco.dts              |    2 +-
 arch/arm/boot/dts/stm32mp157c-ed1.dts              |    4 +-
 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     |    4 +
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      |   49 +-
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |    5 +-
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |    6 +-
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |   12 +-
 arch/arm/boot/dts/tegra114-dalmore.dts             |    2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |    2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |    2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |    2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |    2 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |   90 +-
 arch/arm/boot/dts/tegra20-paz00.dts                |    4 +
 arch/arm/boot/dts/tegra20-tamonten.dtsi            |   14 +-
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |   60 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |    2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 |   13 +-
 arch/arm/boot/dts/tegra30.dtsi                     |   87 +-
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts          |    2 -
 arch/arm/boot/dts/zynq-7000.dtsi                   |   21 +
 arch/arm/boot/dts/zynq-ebaz4205.dts                |   12 +
 .../boot/dts/allwinner/sun50i-h6-tanix-tx6.dts     |   27 +-
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |   13 +-
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |   61 +
 .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |    2 +
 .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |    3 +-
 .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |   61 +
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |  102 ++
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |   37 +-
 arch/arm64/boot/dts/freescale/Makefile             |    4 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts |    8 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  |    7 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts  |    9 +
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |  389 ++++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   18 +
 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts  |    4 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |    4 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |   80 ++
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   |   64 +-
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |    5 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   15 +-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |  911 +++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |    9 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |  884 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |    4 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   31 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   14 +-
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      |  213 +++
 .../boot/dts/freescale/imx8mq-nitrogen-som.dtsi    |  275 ++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  105 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |   12 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |    2 +
 arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts    |    2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |   13 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |    4 +-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |    2 +-
 arch/arm64/boot/dts/marvell/Makefile               |    5 +
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |   17 +
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |   11 +-
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     |    2 +-
 .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |    2 +-
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     |    4 +-
 arch/arm64/boot/dts/marvell/cn9130-crb-A.dts       |   38 +
 arch/arm64/boot/dts/marvell/cn9130-crb-B.dts       |   46 +
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi        |  222 +++
 arch/arm64/boot/dts/marvell/cn9130-db-B.dts        |   22 +
 arch/arm64/boot/dts/marvell/cn9130-db.dts          |  403 +-----
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi         |  410 ++++++
 arch/arm64/boot/dts/marvell/cn9131-db-B.dts        |   22 +
 arch/arm64/boot/dts/marvell/cn9131-db.dts          |  197 +--
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi         |  206 +++
 arch/arm64/boot/dts/marvell/cn9132-db-B.dts        |   22 +
 arch/arm64/boot/dts/marvell/cn9132-db.dts          |  218 +--
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi         |  227 +++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |   10 +
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |    4 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |    2 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |    2 +
 arch/arm64/boot/dts/nvidia/Makefile                |    1 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |    4 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |  718 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   91 ++
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |    2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |    6 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    9 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |    1 +
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts       |    8 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |    8 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  157 ++-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |    2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   54 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |    3 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |  313 +++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   27 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi          |    8 +
 .../qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts |   11 +
 .../msm8996-pmi8996-sony-xperia-tone-kagura.dts    |   11 +
 .../msm8996-pmi8996-sony-xperia-tone-keyaki.dts    |   11 +
 .../dts/qcom/msm8996-sony-xperia-tone-dora.dts     |   27 +
 .../dts/qcom/msm8996-sony-xperia-tone-kagura.dts   |   15 +
 .../dts/qcom/msm8996-sony-xperia-tone-keyaki.dts   |   26 +
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |  956 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi         |   63 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   44 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi                |  133 ++
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |   54 +
 arch/arm64/boot/dts/qcom/pm8004.dtsi               |    2 -
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |    6 +
 arch/arm64/boot/dts/qcom/pmi8996.dtsi              |   15 +
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   60 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |    2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   62 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  102 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  241 +---
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  341 +++++
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |   23 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  419 +++++-
 .../dts/qcom/sdm630-sony-xperia-ganges-kirin.dts   |   14 +-
 .../boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi   |   40 -
 .../dts/qcom/sdm630-sony-xperia-nile-discovery.dts |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-pioneer.dts   |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-voyager.dts   |    1 +
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |  527 ++++++-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 1441 ++++++++++++++++=
++--
 .../dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts |   14 +-
 arch/arm64/boot/dts/qcom/sdm636.dtsi               |   23 +
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |    2 -
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |  519 +++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    3 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   11 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   35 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    5 +
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |  139 ++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  566 ++++++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  797 ++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  217 ++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   53 +-
 arch/arm64/boot/dts/renesas/Makefile               |    8 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |    8 +
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |    1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |    4 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |    8 +-
 .../arm64/boot/dts/renesas/r8a77950-salvator-x.dts |   73 -
 arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts   |    2 +-
 arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts      |    2 +-
 arch/arm64/boot/dts/renesas/r8a77950.dtsi          |    2 +
 .../arm64/boot/dts/renesas/r8a77951-salvator-x.dts |   73 -
 .../boot/dts/renesas/r8a77951-salvator-xs.dts      |  122 --
 arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts   |    2 +-
 arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts      |    2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |    5 +
 arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts   |    2 +-
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts      |    2 +-
 arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts   |    2 +-
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts      |    3 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   29 +
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |   14 -
 arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts   |    2 +-
 arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts      |    2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |    2 +
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |    2 +-
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |    2 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |   50 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |    6 +-
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |  169 ++-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  158 +++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |    2 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   26 +-
 .../boot/dts/renesas/r8a779m1-salvator-xs.dts      |   53 +
 arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts   |   19 +
 arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts      |   54 +
 arch/arm64/boot/dts/renesas/r8a779m1.dtsi          |   12 +
 .../boot/dts/renesas/r8a779m3-salvator-xs.dts      |   46 +
 arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts   |   18 +
 arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts      |   45 +
 arch/arm64/boot/dts/renesas/r8a779m3.dtsi          |   12 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  184 +++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   76 +-
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi       |   56 +
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |  114 ++
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            |   56 +
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             |   64 +
 include/dt-bindings/clock/r9a07g044-cpg.h          |    1 +
 406 files changed, 27991 insertions(+), 3897 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yam=
l
 delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
 create mode 100644 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
 create mode 100644 arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
 create mode 100644 arch/arm/boot/dts/at91-sama7g5ek.dts
 create mode 100644 arch/arm/boot/dts/dra74x-p.dtsi
 create mode 100644 arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-dhcom-picoitx.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-solidsense.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
 create mode 100644 arch/arm/boot/dts/imx6q-solidsense.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-dhcom-drc02.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-dhcom-pdk2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-dhcom-picoitx.dtsi
 rename arch/arm/boot/dts/{imx6q-dhcom-som.dtsi =3D> imx6qdl-dhcom-som.dtsi=
} (57%)
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-solidsense.dtsi
 create mode 100644 arch/arm/boot/dts/imx6s-dhcom-drc02.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-ixdp425.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-netgear-wg302v2.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp43x-kixrp435.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp46x-ixdp465.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp4xx-reference-design.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8226.dtsi
 create mode 100644 arch/arm/boot/dts/sama7g5-pinfunc.h
 create mode 100644 arch/arm/boot/dts/sama7g5.dtsi
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-codina.dts
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts
 create mode 100644 arch/arm/boot/dts/stih418-b2264.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-nitrogen-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-crb-A.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-crb-B.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-db-B.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-db.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9131-db-B.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9131-db.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9132-db-B.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9132-db.dtsi
 create mode 100644
arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.=
dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagur=
a.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyak=
i.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmi8996.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp2.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm636.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx20=
1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3.dtsi
