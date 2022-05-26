Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EC7C433EF
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 14:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1611CC3411C; Thu, 26 May 2022 14:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE29BC34114
	for <soc@kernel.org>; Thu, 26 May 2022 14:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653576503;
	bh=hJyUtSUtWAg36pD+6+mjGOsZSbx3P511z/F2D1lxbvw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=aKDrDHxp7mLQNwgJJoTSfDxTFvLvCu4VTT/kFagj6wTQFEpwJt/t51J/q85QYRoyD
	 wze08DpNTZCgbySHUxkQKzMGpHEgcELwUquyT0MYt9xQEguDGJQMI+AmQ7s7qCFi7s
	 RL5Vs5sjn6QTzUqla4VtYvMM3hnOSxLWKPVhc/vxMcya14V+zFaU3zne3I1qhve8fc
	 vBUxa2RVk/eAeje/6nz2HlmiCGp7KdkcBu7IYyysJTC9toeSiUG5Aqx9KB7y7ZP6oH
	 DKvJ3LIVkfSpbOZwc3ve56fFLH5lfm57+OdElTgQrw05OW9LiHzfPJqLT455zyulae
	 C69SaQ7juh2MQ==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2ff7b90e635so17809607b3.5
        for <soc@kernel.org>; Thu, 26 May 2022 07:48:22 -0700 (PDT)
X-Gm-Message-State: AOAM532ybzfIjJl9WmaTqMU+c34zUuBRif/PdJrJrepE1NlsioxUvDnZ
	h029KUVes8AzTjZj++q47fXr/jfGKQ1DL0gX5M0=
X-Google-Smtp-Source: ABdhPJx2uCLwUsupaRKkdpYb1LHlh9eOZo5oBvNTdHhLggvQg2CG5rlWIl4kARGPYUyDFoRcnw4RbvSR75zJOxkPRms=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr39859450ywk.209.1653576501421; Thu, 26
 May 2022 07:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
In-Reply-To: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 26 May 2022 16:48:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a02DSq819Hk82h5gNF+KfBPqsW1prGFKUosgSd+kHG09w@mail.gmail.com>
Message-ID: <CAK8P3a02DSq819Hk82h5gNF+KfBPqsW1prGFKUosgSd+kHG09w@mail.gmail.com>
Subject: [GIT PULL 2/5] ARM: DT changes for 5.19, part 1
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 71ff461c3f41f6465434b9e980c01782763e7ad8=
:

  iommu/omap: Fix regression in probe for NULL pointer dereference
(2022-04-08 11:16:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.1=
9

for you to fetch changes up to 82706d6fb19d0b845146f7108fce3926502c5f52:

  Merge tag 'v5.18-next-dts64' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt (2022-05-13 23:26:21 +0200)

----------------------------------------------------------------
ARM: DT changes for 5.19, part 1

There are 40 branches this time, adding a lot of new hardware
support, and cleanups. Krzysztof Kozlowski continues his treewide
cleanups.

There are a number of new SoCs, all of them as part of existing
families, and typically added along with a reference board:

 - Renesas RZ/G2UL (R9A07G043) is the single-core version of the RZ/G2L
   general-purpose MPU.

 - Renesas RZ/V2M (R9A09G011) is a smart camera SoC

 - Renesas R-Car V4H (R8A779G0) is an automotive chip with Cortex-A76
   cores and deep learning accerlation.

 - Broadcom BCM47622 is a new broadband SoC based on a quad Cortex-A7
   and dual Wifi-6.

 - Corstone1000 is a generic platform from Arm that is used for designing
   custom SoCs, the support for now is for the Fixed Virtual Platform
   emulation for it.

 - Mediatek MT8195 (Kompanio 1200) is a high-end consumer chip used
   in upcoming Chromebooks.

 - NXP i.MXRT1050 is a Cortex-M7 based microcontroller, the first
   MMU-less SoC to be added in a while

New machines based on already supported SoCs this time are mainly
for 32-bit platforms and include:

 - Two wireless routers based on Broadcom bcm4708

 - 30 new boards based on NXP i.MX6, i.MX7 and i.MX8 families, mostly
   for the industrial embedded market, and on NXP LS1021A based
   IOT board.

 - Two ethernet switches based on Microchip LAN966

 - Eight Qualcomm Snapdragon based machines, including a smartwatch,
   a Chromebook board and some phones

 - Another phone based on the old ST-Ericsson Ux500 platform

 - Seven STM32MP1 based boards

 - Four single-board computers based on Rockchip RK3566/RK3568

----------------------------------------------------------------
Note: the full pull request message exceeds 100KB, using a dirstat instead
of the normal diffstat.

Adam Ford (5):
      arm64: dts: imx8mn: Enable HS400-ES
      arm64: dts: imx8mp: Enable HS400-ES
      ARM: dts: logicpd-som-lv: Move pinmuxing to peripheral nodes
      arm64: dts: imx8mm-beacon: Enable RTS-CTS on UART3
      arm64: dts: imx8mn-beacon: Enable RTS-CTS on UART3

Akhil P Oommen (1):
      arm64: dts: qcom: sc7280: Support gpu speedbin

Alexander Bauer (1):
      ARM: dts: imx6ull: Add support for PHYTEC phyGATE-Tauri-S with i.MX 6=
ULL

Alexander Shiyan (8):
      ARM: dts: imx51: Add generic DMA bindings for UART nodes
      ARM: dts: i.MX51: digi-connectcore-som: Remove unused regulators
      ARM: dts: i.MX51: digi-connectcore-som: Update PMIC voltages
      ARM: dts: i.MX51: digi-connectcore-som: Setup usbotg vbus-supply
      ARM: dts: i.MX51: digi-connectcore-jsk: Use usb-nop-xceiv usbphy for =
USB1
      ARM: dts: am335x-myirtech: Add an external clock oscillator for CPU R=
TC
      ARM: dts: am335x-myirtech: Update NAND default partition table layout
      ARM: dts: imx6qdl-phytec: Add LED labels

Alexander Stein (5):
      ARM: dts: imx6ul: add TQ-Systems MBa6ULx device trees
      ARM: dts: imx6ul: add TQ-Systems MBa6ULxL device trees
      ARM: dts: imx6ull: add TQ-Systems MBa6ULLx device trees
      ARM: dts: imx6ull: add TQ-Systems MBa6ULLxL device trees
      ARM: dts: imx7s: fix iomuxc_lpsr node name

Alexandre Torgue (7):
      dt-bindings: clock: stm32mp1: describes clocks if "st,stm32mp1-rcc-se=
cure"
      dt-bindings: clock: stm32mp15: rename CK_SCMI define
      dt-bindings: reset: stm32mp15: rename RST_SCMI define
      ARM: dts: stm32: enable optee firmware and SCMI support on STM32MP15
      dt-bindings: arm: stm32: Add SCMI version of STM32 boards
(DK1/DK2/ED1/EV1)
      ARM: dts: stm32: Add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)
      dt-bindings: clock: stm32mp1: adapt example for "st,stm32mp1-rcc-secu=
re"

Allen-KH Cheng (16):
      arm64: dts: mt8192: Add pwrap node
      arm64: dts: mt8192: Add SCP node
      arm64: dts: mt8192: Add usb-phy node
      arm64: dts: mt8192: Add xhci node
      arm64: dts: mt8192: Fix nor_flash status disable typo
      arm64: dts: mt8192: Add efuse node
      arm64: dts: mt8192: Add m4u and smi nodes
      arm64: dts: mt8192: Add the mmsys reset bit to reset the dsi0
      arm64: dts: mt8192: Add dpi node
      arm64: dts: mt8192: Add PCIe node
      arm64: dts: mt8192: Add H264 venc device node
      arm64: dts: mediatek: mt8173: Add power domain to encoder nodes
      dt-bindings: arm: Add compatible for Mediatek MT8192
      arm64: dts: mt8192: Add spmi node
      arm64: dts: mt8192: Add audio-related nodes
      arm64: dts: mt8192: Add mmc device nodes

Andre Przywara (9):
      dt-bindings: watchdog: sunxi: fix F1C100s compatible
      dt-bindings: watchdog: sunxi: clarify clock support
      ARM: dts: suniv: F1C100: fix watchdog compatible
      dt-bindings: arm: sunxi: document LicheePi Nano name
      ARM: dts: suniv: F1C100: fix CPU node
      ARM: dts: suniv: F1C100: fix timer node
      dt-bindings: spi: sunxi: document F1C100 controllers
      ARM: dts: suniv: F1C100: add SPI support
      ARM: dts: suniv: licheepi-nano: add SPI flash

Andrej Picej (2):
      ARM: dts: imx6ul: peb-av-02: move to 3 cell pwm
      dt-bindings: arm: fsl: add PHYTEC phyGATE Tauri i.MX6 ULL

AngeloGioacchino Del Regno (1):
      arm64: dts: mediatek: mt8173: Add gce-client-reg handle to disp-mutex

Angus Ainslie (1):
      arm64: dts: imx8mq-librem5: add a RO firmware partition

Aniruddha Rao (1):
      arm64: tegra: Update SDMMC1/3 clock source for Tegra194

Ansuel Smith (1):
      ARM: dts: qcom: add syscon and cxo/pxo clock to gcc node for ipq8064

Ariel D'Alessandro (1):
      arm64: dts: imx8mn-bsh-smm-s2pro: Add tlv320aic31xx audio card node

Arnd Bergmann (41):
      Merge tag 'dt-cleanup-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.19-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'renesas-dt-bindings-for-v5.19-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'bindings-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'omap-for-v5.19/dt-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'ux500-dts-v5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'amlogic-arm64-dt-for-v5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/dt
      Merge tag 'amlogic-arm-dt-for-v5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/dt
      Merge tag 'stm32-dt-for-v5.19-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into
arm/dt
      Merge tag 'juno-updates-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/dt
      Merge tag 'arm-soc/for-5.19/devicetree' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'arm-soc/for-5.19/devicetree-arm64' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'omap-for-v5.19/dt-part2-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'dt64-cleanup-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'dt-cleanup-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.19-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'renesas-dt-bindings-for-v5.19-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'tegra-for-5.19-dt-bindings' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'tegra-for-5.19-arm64-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'sunxi-dt-for-5.19-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/dt
      Merge tag 'ti-keystone-dt-for-v5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/dt
      Merge tag 'ti-k3-dt-for-v5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/dt
      Merge tag 'imx-bindings-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'sunxi-dt-for-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/dt
      Merge tag 'qcom-dts-for-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'qcom-arm64-for-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'imx-dt-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt64-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Revert "ARM: dts: BCM5301X: Fix DTC warning for NAND node"
      Merge tag 'v5.19-rockchip-dts64-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'v5.19-rockchip-dts32-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'visconti-arm-dt-for-v5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti
into arm/dt
      Merge tag 'mvebu-dt64-5.19-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'mvebu-dt-5.19-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'at91-dt-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
      Merge tag 'v5.18-next-dts32' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'v5.18-next-dts64' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt

Ar=C4=B1n=C3=A7 =C3=9CNAL (9):
      ARM: dts: BCM5301X: Fix DTC warning for NAND node
      ARM: dts: BCM5301X: Remove cell properties from srab ports on
Asus RT-AC88U
      ARM: dts: BCM5301X: Add rgmii to port@5 of Broadcom switch on
Asus RT-AC88U
      ARM: dts: BCM5301X: Retrieve gmac1 MAC address from NVRAM on Asus RT-=
AC88U
      dt-bindings: arm: bcm: fix BCM53012 and BCM53016 SoC strings
      dt-bindings: arm: bcm: create new description for BCM53016
      ARM: dts: BCM5301X: Fix compatible strings for BCM53012 and BCM53016 =
SoC
      dt-bindings: arm: bcm: add bindings for Asus RT-AC88U
      ARM: dts: BCM5301X: Disable gmac0 and enable port@8 on Asus RT-AC88U

Ashish Mhetre (2):
      dt-bindings: memory: tegra: Update validation for reg and reg-names
      arm64: tegra: Add memory controller channels

Ashish Singhal (1):
      arm64: tegra: Add QSPI controllers on Tegra234

Aswath Govindraju (1):
      arm64: dts: ti: k3-am62: Add support for MCAN

Baruch Siach (1):
      arm64: dts: qcom: ipq6018: Add mdio bus description

Bhupesh Sharma (14):
      arm64: dts: qcom: sm8150: Add pdc interrupt controller node
      arm64: dts: qcom: sm8150: Add ufs power-domain entries
      arm64: dts: qcom: sm8150: Add PCIe nodes
      arm64: dts: qcom: sa8155: Enable PCIe nodes
      arm64: dts: qcom: sm8150: Add support for SDC2
      arm64: dts: qcom: sa8155p-adp: Add support for uSD card
      arm64: dts: qcom: sm8150: Add PDC as the interrupt parent for tlmm
      arm64: dts: qcom: msm8996-xiaomi: Drop max-microamp and
vddp-ref-clk properties from QMP PHY
      arm64: dts: qcom: sc7280: Fix qmp phy node (use phy@ instead of lanes=
@)
      arm64: dts: qcom: sm8450: Fix qmp ufs phy node (use phy@ instead
of lanes@)
      arm64: dts: qcom: ipq6018: Fix qmp usb3 phy node
      arm64: dts: qcom: sm8450: Fix qmp phy node (use phy@ instead of lanes=
@)
      arm64: dts: qcom: sm8150: Fix iommu sid value for SDC2 controller
      arm64: dts: qcom: sa8155p-adp: Disable multiple Tx and Rx queues
for ethernet IP

Biju Das (43):
      dt-bindings: power: renesas,rzg2l-sysc: Document RZ/G2UL SoC
      arm64: dts: renesas: r9a07g044c2-smarc: Enable usb2.0
      arm64: dts: renesas: rzg2lc-smarc-pinfunction: Sort the nodes
      arm64: dts: renesas: rzg2l-smarc: Move out i2c3 and Audio codec
from common dtsi
      arm64: dts: renesas: rzg2lc-smarc: Enable i2c{0,1,2}
      arm64: dts: renesas: rzg2lc-smarc: Enable Audio
      arm64: dts: renesas: rzg2lc-smarc-som: Enable serial NOR flash
      arm64: dts: renesas: rzg2lc-smarc-som: Enable OSTM
      arm64: dts: renesas: rzg2lc-smarc-som: Add vdd core regulator
      dt-bindings: arm: renesas: Document Renesas RZ/G2UL SMARC EVK
      dt-bindings: clock: Add R9A07G043 CPG Clock and Reset Definitions
      arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on carrier board
      arm64: dts: renesas: rzg2l-smarc: Move gpios property of
vccq_sdhi1 from common dtsi
      arm64: dts: renesas: Add initial DTSI for RZ/G2UL SoC
      arm64: dts: renesas: Add initial device tree for RZ/G2UL Type-1 SMARC=
 EVK
      arm64: dts: renesas: r9a07g043: Fillup the pinctrl stub node
      arm64: dts: renesas: rzg2ul-smarc: Add scif0 and audio clk pins
      arm64: dts: renesas: r9a07g043: Add SDHI nodes
      arm64: dts: renesas: r9a07g043: Add GbEthernet nodes
      arm64: dts: renesas: rzg2ul-smarc: Enable microSD on SMARC platform
      arm64: dts: renesas: rzg2ul-smarc-som: Enable eMMC on SMARC platform
      arm64: dts: renesas: rzg2ul-smarc-som: Enable Ethernet on SMARC platf=
orm
      arm64: dts: renesas: r9a07g043: Add I2C2 node and fillup the
I2C{0,1,3} stub nodes
      arm64: dts: renesas: r9a07g043: Add SSI{1,2,3} nodes and fillup
the SSI0 stub node
      arm64: dts: renesas: r9a07g043: Add USB2.0 support
      arm64: dts: renesas: r9a07g043: Fillup the CANFD stub node
      arm64: dts: renesas: r9a07g043: Fillup the OSTM{0,1,2} stub nodes
      arm64: dts: renesas: r9a07g043: Fillup the WDT{0,2} stub nodes
      arm64: dts: renesas: rzg2ul-smarc: Enable i2c{0,1} and wm8978
      arm64: dts: renesas: rzg2ul-smarc: Enable CANFD
      arm64: dts: renesas: rzg2ul-smarc-som: Enable OSTM
      arm64: dts: renesas: rzg2ul-smarc-som: Enable watchdog
      dt-bindings: memory: renesas,rpc-if: Document RZ/G2UL SoC
      arm64: dts: renesas: rzg2l-smarc: Move ssi0 and cpu sound_dai
nodes from common dtsi
      arm64: dts: renesas: rzg2ul-smarc: Enable Audio
      arm64: dts: renesas: rzg2ul-smarc: Enable USB2.0 support
      arm64: dts: renesas: r9a07g044: Fix external clk node names
      arm64: dts: renesas: r9a07g054: Fix external clk node names
      arm64: dts: renesas: r9a07g043: Add RSPI{0,1,2} nodes
      arm64: dts: renesas: r9a07g043: Add OPP table
      arm64: dts: renesas: r9a07g043: Add TSU node
      arm64: dts: renesas: r9a07g043: Create thermal zone to support IPA
      arm64: dts: renesas: r9a07g043: Add SPI Multi I/O Bus controller node

Bjorn Andersson (5):
      Merge branch '20220223172248.18877-1-tdas@codeaurora.org' into
arm64-for-5.19
      Merge branch '20220411072156.24451-2-michael.srba@seznam.cz'
into arm64-for-5.19
      arm64: dts: qcom: sm8350: Define GPI DMA engines
      arm64: dts: qcom: sm8350: Add GENI I2C/SPI DMA channels
      arm64: dts: qcom: sm8350-hdk: Enable &gpi_dma1

Bryan O'Donoghue (3):
      arm64: dts: qcom: sm8250: Add camcc DT node
      arm64: dts: qcom: sm8250: camss: Add CAMSS block definition
      arm64: dts: qcom: sm8250: camss: Add CCI definitions

Caleb Connolly (1):
      arm64: dts: rockchip: add an input enable pinconf to rk3399

Changming Huang (2):
      ARM: dts: Add initial LS1021A IoT board dts support
      dt-bindings: arm: fsl: add ls1021a-iot board

Chanho Park (5):
      dt-bindings: clock: add clock binding definitions for Exynos Auto v9
      dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings
      arm64: dts: exynos: add initial CMU clock nodes in ExynosAutov9
      arm64: dts: exynos: switch USI clocks in ExynosAutov9
      arm64: dts: exynos: switch UFS clock node in ExynosAutov9

Chris Packham (1):
      arm64: dts: marvell: Update sdhci node names to match schema

Christian Hewitt (1):
      arm64: dts: meson: alpa sort the board Makefile

Christopher Obbard (2):
      arm64: dts: rockchip: Rename vdec_mmu node for RK3328
      arm64: dts: rockchip: Add vdec support for RK3328

Chuanhong Guo (1):
      arm64: dts: mediatek: add mtk-snfi for mt7622

Dang Huynh (2):
      ARM: dts: sunxi: nanopi: Remove input-name property
      arm64: dts: mediatek: pumpkin: Remove input-name property

Dave Gerlach (3):
      ARM: dts: am437x-gp-evm: Enable wkup_m3 control of IO isolation
      ARM: dts: am33xx: Add i2c voltage scaling firmware to wkup_m3_ipc
      ARM: dts: am43xx: Add i2c voltage scaling firmware to wkup_m3_ipc

David Jander (21):
      ARM: dts: imx6qdl-vicut1/vicutgo: Set default backlight
brightness to maximum
      ARM: dts: imx6qdl-vicut1/vicutgo: Rename backlight to backlight_lcd
      ARM: dts: imx6qdl-vicut1/vicutgo: Add backlight_led node
      ARM: dts: imx6qdl-vicut1: update gpio-line-names for some GPIOs
      ARM: dts: imx6qdl-victgo: add CAN termination support
      ARM: dts: imx6qdl-vicut1.dtsi: remove TiWi module
      ARM: dts: imx6qdl-vicut1.dtsi: Put nON_SWITCH in own pinctrl grp
      ARM: dts: imx6qdl-vicut1.dtsi: Remove PCIe
      ARM: dts: imx6qdl-vicut1/victgo: Remove UART2
      ARM: dts: imx6qdl-vicut1.dtsi: Fix LED names
      ARM: dts: imx6qdl-vicut1.dtsi: Fix debug LED gpio pins
      ARM: dts: imx6qdl-vicut1.dtsi: Update GPIO line names
      ARM: dts: imx6qdl-vicut1.dtsi: Remove conflicting pinctrl entry
      ARM: dts: imx6q-vicut1.dts: remove sata node
      ARM: dts: imx6dl-victgo.dts: update gpio names
      ARM: dts: imx6dl-victgo.dts: Factor out common parts to
imx6qdl-victgo.dtsi
      ARM: dts: imx6qdl-vicut1.dtsi: Move some node out to DTS files
      ARM: dts: Remove imx6qdl-victgo.dtsi
      ARM: dts: imx6qdl-vicut1: Factor out common parts of 12inch board var=
iants
      ARM: dts: imx6dl-victgo.dts: Remove touchscreen x axis inversion
      ARM: dts: imx6qdl-vicut1.dtsi: Add missing ISB led node

Denys Drozdov (5):
      dt-bindings: arm: fsl: add toradex,colibri-imx6ull
      ARM: dts: imx6ull-colibri: add touchscreen device nodes
      ARM: dts: imx6ull-colibri: update device trees to support overlays
      ARM: dts: imx6ull-colibri: add support for toradex iris carrier board=
s
      ARM: dts: imx6ull-colibri: add support for toradex aster carrier boar=
ds

Diego Sueiro (1):
      arm64: dts: fvp: Add virtio-rng support

Diogo Ivo (1):
      arm64: tegra: Add missing DFLL reset on Tegra210

Dmitry Baryshkov (26):
      arm64: dts: qcom: sdm845-db845c: add wifi variant property
      arm64: dts: qcom: apq8096-db820c: enable MSS node
      arm64: dts: qcom: sdm845: remove snps,dw-pcie compatibles
      arm64: dts: qcom: msm8996: remove snps,dw-pcie compatibles
      arm64: dts: qcom: sm8450-hdk: Enable remoteproc instances
      arm64: dts: qcom: sm8450: add fastrpc nodes
      arm64: dts: qcom: sdm845: correct dynamic power coefficients
      arm64: dts: qcom: pm8350: add temp sensor and thermal zone config
      arm64: dts: qcom: pm8350b: add temp sensor and thermal zone config
      arm64: dts: qcom: pmr735b: add temp sensor and thermal zone config
      arm64: dts: qcom: pm8350c: stop depending on thermal_zones label
      arm64: dts: qcom: pmr735a: stop depending on thermal_zones label
      arm64: dts: qcom: add pm8450 support
      arm64: dts: qcom: sm8450: add PCIe0 PHY node
      arm64: dts: qcom: sm8450: add PCIe0 RC device
      arm64: dts: qcom: sm8450: add PCIe1 PHY node
      arm64: dts: qcom: sm8450: add PCIe1 root device
      arm64: dts: qcom: sm8450-qrd: enable PCIe0 PHY device
      arm64: dts: qcom: sm8450-qrd: enable PCIe0 host
      arm64: dts: qcom: sm8450-hdk: add pcie nodes
      arm64: dts: qcom: msm8996: Drop flags for mdss irqs
      arm64: dts: qcom: sdm630: Drop flags for mdss irqs
      arm64: dts: qcom: sdm660: Drop flags for mdss irqs
      arm64: dts: qcom: sdm845: Drop flags for mdss irqs
      arm64: dts: qcom: sm8250: Drop flags for mdss irqs
      ARM: dts: qcom: msm8974: Drop flags for mdss irqs

Douglas Anderson (4):
      arm64: dts: qcom: sc7280-herobrine: Fix PCIe regulator glitch at boot=
up
      arm64: dts: qcom: sc7280: Delete herobrine-r0
      arm64: dts: qcom: sc7280-herobrine: Audio codec wants 1.8V, not 1.62V
      arm64: dts: qcom: sc7280: eDP for herobrine boards

Eugen Hristev (1):
      ARM: dts: at91: sama7g5: remove interrupt-parent from gic node

Fabien Dessenne (5):
      ARM: dts: stm32: fix pinctrl node name warnings (MCU soc)
      ARM: dts: stm32: fix pinctrl node name warnings (MPU soc)
      ARM: dts: stm32: add EXTI interrupt-parent to pinctrl node on stm32mp=
131
      ARM: dts: stm32: add blue led (Linux heartbeat) on stm32mp135f-dk
      ARM: dts: stm32: add UserPA13 button on stm32mp135f-dk

Fabien Parent (5):
      dt-bindings: arm64: dts: mediatek: Add mt8195-demo board
      arm64: dts: mediatek: Add device-tree for MT8195 Demo board
      arm64: dts: mediatek: mt8183-pumpkin: fix bad thermistor node name
      arm64: dts: mediatek: mt8195-demo: Remove input-name property
      arm64: dts: mediatek: mt8195-demo: enable uart1

Fabio Estevam (10):
      arm64: dts: imx8mn-evk: Add UART3 support
      ARM: dts: mba6ulx: Remove unnecessary #address-cells/#size-cells
      ARM: dts: imx6dl-plybas: Use the standard 'uart-has-rtscts'
      ARM: dts: imx6ul-kontron-n6x1x-s: Use the standard 'uart-has-rtscts'
      arm64: dts: imx8mp-verdin: Use the standard 'uart-has-rtscts'
      arm64: dts: imx8mq-kontron-pitx-imx8m: Use the standard 'uart-has-rts=
cts'
      ARM: dts: imx6sl: Add a label for the cpu node
      dt-bindings: vendor-prefixes: Add prefix for Storopack
      dt-bindings: arm: fsl: Add Storopack i.MX7D SMEGW01 board
      ARM: dts: imx7d-smegw01: Add support for i.MX7D SMEGW01 board

Frank Wunderlich (3):
      arm64: dts: rockchip: Add sata nodes to rk356x
      arm64: dts: rockchip: Add USB nodes for BPI-R2-Pro
      arm64: dts: rockchip: Add SATA support to BPI-R2-Pro

Furkan Kardame (1):
      arm64: dts: rockchip: add dts for Firefly Station M2 rk3566

Geert Uytterhoeven (16):
      arm64: dts: renesas: r8a779f0: Add I2C nodes
      arm64: dts: renesas: spider-cpu: Add I2C4 and EEPROMs
      arm64: dts: renesas: spider: Add Ethernet sub-board
      arm64: dts: renesas: rcar-gen3: Add RPC device nodes
      arm64: dts: renesas: draak: Add RPC HyperFlash device node
      arm64: dts: renesas: ebisu: Add RPC HyperFlash device node
      arm64: dts: renesas: salvator-common: Add RPC HyperFlash device node
      arm64: dts: renesas: ulcb: Add RPC HyperFlash device node
      Merge tag 'renesas-r9a07g043-dt-binding-defs-tag' into HEAD
      arm64: dts: renesas: r8a779f0: Add GPIO nodes
      ARM: dts: r9a06g032: Drop "arm,cortex-a7-timer" from timer node
      Merge tag 'renesas-r8a779g0-dt-binding-defs-tag' into
renesas-arm-dt-for-v5.19
      dt-bindings: soc: renesas: Move renesas,rzg2l-sysc from arm to soc
      arm64: dts: renesas: Add interrupt-names to CANFD nodes
      arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
      Merge tag 'renesas-r9a09g011-dt-binding-defs-tag' into
renesas-arm-dt-for-v5.19

Gireesh Hiremath (15):
      ARM: dts: am335x: Guardian: Update NAND partition table
      ARM: dts: am335x: Guardian: Rename power button label
      ARM: dts: am335x: Guardian: Add keypad
      ARM: dts: am335x: Guardian: Disable poweroff support from RTC
      ARM: dts: am335x: Guardian: Remove mmc status led
      ARM: dts: am335x: Guardian: Update life led
      ARM: dts: am335x: Guardian: Update beeper label
      ARM: dts: am335x: Guardian: Update regulator node name
      ARM: dts: am335x: Guardian: Add lcd port
      ARM: dts: am335x: Guardian: Update backlight parameter
      ARM: dts: am335x: Guardian: Enable UART port two
      ARM: dts: am335x: Guardian: Disable DMA property of USB1
      ARM: dts: am335x: Guardian: Update interface pinmux
      ARM: dts: am335x: Guardian: Add gpio line manes
      ARM: dts: am335x: Guardian: Update comments

Giulio Benetti (1):
      ARM: dts: imx: Add i.MXRT1050-EVK support

Guido G=C3=BCnther (2):
      arm64: dts: imx8mq-librem5: higher boost regulation current
      arm64: dts: imx8mq-librem5-r4: add the correct panel

Harald Geyer (1):
      arm64: dts: allwinner: teres-i: Add GPIO port regulators

Heiko Stuebner (1):
      arm64: dts: rockchip: fix Makefile sorting for BananaPi R2 Pro

Herve Codina (4):
      ARM: dts: r9a06g032: Add missing '#power-domain-cells'
      ARM: dts: r9a06g032: Add internal PCI bridge node
      ARM: dts: r9a06g032: Add USB PHY DT support
      ARM: dts: r9a06g032: Link the PCI USB devices to the USB PHY

Hui Liu (1):
      arm64: dts: mt6359: add PMIC MT6359 related nodes

Ivy Jian (1):
      arm64: dts: qcom: switch panel compatible to "edp-panel" for limozeen

Jack Matthews (1):
      ARM: dts: qcom: pm8226: add node for RTC

Jami Kettunen (1):
      arm64: dts: qcom: msm8998-oneplus-common: Add NFC

Jayesh Choudhary (1):
      arm64: dts: ti: k3-am62: Add SA3UL ranges in cbass_main

Jesse Taube (3):
      ARM: dts: suniv: F1C100: add clock and reset macros
      ARM: dts: suniv: F1C100: add MMC controllers
      ARM: dts: suniv: licheepi-nano: add microSD card

Joel Selvaraj (5):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: change firmware path
and use mbn format
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable qcom ipa driver
      arm64: dts: qcom: sdm845-xiaomi-beryllium: fix typo in panel's
vddio-supply property
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable second wifi channel
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable qcom wled
backlight and link to panel

Johan Jonker (4):
      ARM: dts: rockchip: use generic node name for dma rk3036/rk322x
      arm64: dts: rockchip: use generic node name for pmucru on rk3399
      arm64: dts: rockchip: add clocks property to cru nodes rk3399
      ARM: dts: rockchip: rename pcfg_pull_default node name on rk3036

Jon Hunter (1):
      arm64: tegra: Update PWM fan node name

Jonathan Bakker (4):
      ARM: dts: s5pv210: Remove spi-cs-high on panel in Aries
      ARM: dts: s5pv210: Correct interrupt name for bluetooth in Aries
      ARM: dts: s5pv210: Adjust memory reg entries to match spec
      ARM: dts: s5pv210: Adjust DMA node names to match spec

Katherine Perez (1):
      arm64: dts: qcom: sm8350-duo2: enable battery charger

Kathiravan T (1):
      arm64: dts: qcom: ipq8074: fix the sleep clock frequency

Kieran Bingham (1):
      arm64: dts: renesas: falcon-cpu: Use INTC_EX for SN65DSI86

Kishon Vijay Abraham I (1):
      arm64: dts: ti: k3-am642-sk: Enable WLAN connected to SDHCI0

Koji Matsuoka (1):
      arm64: dts: renesas: r8a77961: Add CAN-FD node

Konrad Dybcio (39):
      arm64: dts: qcom: sm8250-edo: Add dual CS35L41 amps
      arm64: dts: qcom: msm8994: Fix sleep clock name
      arm64: dts: qcom: msm8992-libra: Add CPU regulators
      arm64: dts: qcom: msm8992-libra: Temporarily restrict CPU count to 1
      arm64: dts: qcom: msm8992-libra: Remove superfluous status =3D "okay"
      arm64: dts: qcom: msm8994: Add MMCC node
      arm64: dts: qcom: msm8992: Use the correct GCC compatible
      arm64: dts: qcom: msm8992: Use the correct MMCC compatible
      arm64: dts: qcom: msm8994: Fix the cont_splash_mem address
      arm64: dts: qcom: msm8992-libra: Fix up the framebuffer
      arm64: dts: qcom: msm8994-kitakami: Disable a mistakengly enabled I2C=
 host
      arm64: dts: qcom: msm8994-kitakami: Update regulator configuration
      arm64: dts: qcom: msm8994: Add OCMEM node
      arm64: dts: qcom: msm8994: Fix BLSP[12]_DMA channels count
      arm64: dts: qcom: msm8994: Add watchdog timer node
      arm64: dts: qcom: msm8994: Add mmc aliases
      ARM: dts: qcom-*-sony*: Mention SONY board names in DT filenames
      ARM: dts: qcom-msm8974: Remove properties that are always overriden
      ARM: dts: qcom-msm8974*: Fix UART naming
      ARM: dts: qcom-msm8974*: Fix I2C labels
      ARM: dts: qcom-msm8974: Fix up mdss nodes
      ARM: dts: qcom-msm8974: Fix up SDHCI nodes
      ARM: dts: qcom-msm8974*: Rename msmgpio to tlmm
      ARM: dts: qcom-apq8074-dragonboard: Use &labels
      ARM: dts: qcom-msm8974-fp2: Use &labels
      ARM: dts: qcom-msm8974-lge-nexus5: Use &labels
      ARM: dts: qcom-msm8974-klte: Use &labels
      ARM: dts: qcom-msm8974-{"hon","am"}ami: Commonize and modernize the D=
Ts
      ARM: dts: qcom-msm8974-castor: Use &labels
      ARM: dts: qcom-msm8974pro: Use &labels
      ARM: dts: qcom-msm8974pro-*: Use the 8974pro name in DT filenames
      ARM: dts: qcom-msm8974: Convert ADSP to a MMIO device
      ARM: dts: qcom-msm8974: Sort and clean up nodes
      ARM: dts: qcom-msm8974*: Enable IMEM unconditionally
      ARM: dts: qcom-msm8974*: Consolidate I2C/UART/SDHCI
      ARM: dts: qcom-msm8974*: Clean up old GPIO declarations
      ARM: dts: qcom-msm8974-rhine: Add NFC and enable I2C hosts
      ARM: dts: qcom-msm8974-rhine: Add pstore node
      ARM: dts: qcom-msm8974*: Remove unnecessary include

Krzysztof Kozlowski (76):
      ARM: dts: rockchip: correct interrupt flags on rk3188 boards
      ARM: dts: exynos: remove deprecated unit address for LPDDR3
timings on Odroid
      arm64: dts: exynos: move aliases to board in Exynos850
      ARM: dts: exynos: add a specific compatible to MCT
      arm64: dts: exynos: add a specific compatible to MCT
      arm64: dts: tesla: add a specific compatible to MCT on FSD
      ARM: dts: exynos: drop deprecated SFR region from MIPI phy
      ARM: dts: exynos: align EHCI/OHCI nodes with dtschema on Exynos4
      ARM: dts: s5pv210: align EHCI/OHCI nodes with dtschema
      ARM: dts: s5pv210: Use standard arrays of generic PHYs for
EHCI/OHCI device
      ARM: dts: broadcom: align SPI NOR node name with dtschema
      arm64: dts: broadcom: align SPI NOR node name with dtschema
      ARM: dts: nspire: use lower case hex addresses in node unit addresses
      ARM: dts: ox820: align interrupt controller node name with dtschema
      ARM: dts: socfpga: align interrupt controller node name with dtschema
      arm64: dts: meson: align SPI NOR node name with dtschema
      ARM: dts: meson: align SPI NOR node name with dtschema
      arm64: dts: synaptics: remove unused DTSI for AS370
      ARM: dts: s5pv210: align DMA channels with dtschema
      arm64: dts: rockchip: correct interrupt flags on rk3399 boards
      arm64: dts: freescale: align SPI NOR node name with dtschema
      ARM: dts: imx: align SPI NOR node name with dtschema
      ARM: dts: qcom: align SPI NOR node name with dtschema
      ARM: dts: qcom: rename WCNSS child name to bluetooth
      ARM: dts: qcom: ipq4019: align dmas in SPI/UART with DT schema
      ARM: dts: qcom: ipq4019: align clocks in I2C with DT schema
      ARM: dts: qcom: msm8660: disable GSBI8
      arm64: dts: qcom: align SPI NOR node name with dtschema
      arm64: dts: qcom: msm8996: drop unsupported UFS vddp-ref-clk-max-micr=
oamp
      arm64: dts: qcom: msm8996: correct UFS compatible
      arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS
      arm64: dts: qcom: msm8916: rename WCNSS child name to bluetooth
      arm64: dts: qcom: align dmas in I2C/SPI/UART with DT schema
      arm64: dts: qcom: align clocks in I2C/SPI with DT schema
      arm64: dts: qcom: msm8953: do not use underscore in node name
      arm64: dts: qcom: msm8994: remove SMD qcom,local-pid property
      arm64: dts: qcom: add RPM clock controller fallback compatible
      ARM: dts: qcom: msm8974-lge-nexus5: move gpio-keys out of soc
      ARM: dts: qcom: msm8974-samsung-klte: move gpio-keys out of soc
      ARM: dts: qcom: do not use underscore in node name
      arm64: dts: hisilicon: align 'freq-table-hz' with dtschema in UFS
      ARM: dts: qcom: sdx55: do not use underscore in BCM node name
      ARM: dts: qcom: sdx55: remove wrong unit address from RPMH RSC clocks
      arm64: dts: qcom: do not use underscore in BCM node name
      arm64: dts: qcom: msm8994: override nodes by label
      arm64: dts: qcom: msm8996: override nodes by label
      ARM: dts: nuvoton: align SPI NOR node name with dtschema
      ARM: dts: omap: align SPI NOR node name with dtschema
      ARM: dts: marvell: align SPI NOR node name with dtschema
      ARM: dts: keystone: Align SPI NOR node name with dtschema
      ARM: dts: keystone: Fix missing fallback and case in SPI NOR
node compatible
      arm64: dts: mediatek: mt8183: align Google CROS EC PWM node name
with dtschema
      arm64: dts: mediatek: align operating-points table name with dtschema
      arm64: dts: mediatek: align thermal zone node names with dtschema
      arm64: dts: mt8183-kukui: align SPI NOR node name with dtschema
      arm64: dts: microchip: align SPI NOR node name with dtschema
      arm64: dts: marvell: align SPI NOR node name with dtschema
      arm64: dts: juno: Drop useless 'dma-channels/requests' properties
      dt-bindings: arm: stm32: narrow DH STM32MP1 SoM boards
      dt-bindings: arm: stm32: correct blank lines
      ARM: dts: am33xx: use new 'dma-channels/requests' properties
      ARM: dts: dm81xx: use new 'dma-channels/requests' properties
      ARM: dts: exynos: add atmel,24c128 fallback to Samsung EEPROM
      arm64: dts: exynos: move XTCXO clock frequency to board in Exynos Aut=
o v9
      arm64: dts: exynos: drop useless 'dma-channels/requests' properties
      arm64: dts: fsd: drop useless 'dma-channels/requests' properties
      ARM: dts: s5pv210: drop useless 'dma-channels/requests' properties
      ARM: dts: exynos: drop useless 'dma-channels/requests' properties
      ARM: dts: zynq-7000: drop useless 'dma-channels/requests' properties
      ARM: dts: socfpga: drop useless 'dma-channels/requests' properties
      arm64: dts: stratix10/agilex: drop useless
'dma-channels/requests' properties
      arm64: dts: broadcom: drop useless 'dma-channels/requests' properties
      dt-bindings: dmaengine: fsl-imx: deprecate '#dma-channels' and
'#dma-requests'
      ARM: dts: imx27: use new 'dma-channels' property
      Merge tag 'samsung-dt-bindings-clk-exynosautov9-5.19' into next/dt64
      ARM: dts: at91: use generic node name for dataflash

Kuldeep Singh (8):
      ARM: dts: bcm-cygnus: Update spi clock properties
      ARM: dts: ste-dbx: Update spi clock-names property
      arm64: dts: lx2160a: Update can node property
      ARM: dts: qcom: mdm9615: User generic node name for DMA
      ARM: dts: qcom: apq8064: User generic node name for DMA
      arm64: dts: qcom: msm8996: User generic node name for DMA
      ARM: dts: qcom: ipq4019: User generic node name for DMA
      ARM: dts: qcom: ipq8064: User generic node name for DMA

Lad Prabhakar (16):
      arm64: dts: renesas: r9a07g054: Fillup the ADC stub node
      arm64: dts: renesas: r9a07g054: Fillup the SDHI{0,1} stub nodes
      arm64: dts: renesas: r9a07g054l2-smarc: Drop deleting gpio-hog
pins related to SDHI
      arm64: dts: renesas: r9a07g054: Fillup the CANFD stub node
      arm64: dts: renesas: r9a07g054l2-smarc: Drop deleting
can{0,1}-stb-hog nodes
      arm64: dts: renesas: r9a07g054: Fillup the I2C{0,1,2,3} stub nodes
      arm64: dts: renesas: r9a07g054: Fillup the sbc stub node
      arm64: dts: renesas: r9a07g054: Fillup the OSTM{0,1,2} stub nodes
      arm64: dts: renesas: r9a07g054: Fillup the WDT{0,1,2} stub nodes
      arm64: dts: renesas: r9a07g054: Add SSI{1,2,3} nodes and fillup
the SSI0 stub node
      arm64: dts: renesas: r9a07g054: Add USB2.0 phy and host support
      arm64: dts: renesas: r9a07g054: Add USB2.0 device support
      arm64: dts: renesas: r9a07g054: Add SPI{0,2} nodes and fillup
SPI1 stub node
      arm64: dts: renesas: r9a07g054: Fillup the GPU node
      arm64: dts: renesas: r9a07g054: Add OPP table
      arm64: dts: renesas: r9a07g054: Add TSU node

Laurent Pinchart (3):
      arm64: dts: imx8mp: Add MEDIAMIX power domains
      arm64: dts: renesas: Remove empty lvds endpoints
      arm64: dts: renesas: Remove empty rgb output endpoints

Li Yang (4):
      ARM: dts: ls1021a: remove "simple-bus" compatible from ifc node
      ARM: dts: update ifc node name to be memory-controller
      arm64: dts: remove "simple-bus" compatible from ifc node
      arm64: dts: freescale: update ifc node name to be memory-controller

Lin Huang (2):
      arm64: dts: rockchip: Add dfi and dmc nodes to rk3399
      arm64: dts: rockchip: Enable dmc and dfi nodes on gru

Linus Walleij (8):
      dt-bindings: arm: ux500: Document Codina-TMO
      ARM: dts: ux500: Add Codina TMO device tree
      ARM: dts: ux500: Register Amstaos proximity sensor
      ARM: dts: ux500: Add line impedance to fuel gauge
      ARM: dts: ux500: Add GPS to Janice device tree
      ARM: dts: ux500: Add GPS to Skomer device tree
      ARM: dts: ux500: Add NFC to the Codina
      ARM: dts: ux500: Add GPS to the Codina

Luca Weiss (15):
      arm64: dts: qcom: sm6350: Fix naming of uart9
      arm64: dts: qcom: sm6350: Add I2C busses
      arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695 haptics
      arm64: dts: qcom: sm6350: Add UFS nodes
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable UFS
      dt-bindings: arm: qcom: Document asus,sparrow device
      ARM: dts: qcom: Add support for ASUS ZenWatch 2
      arm64: dts: qcom: sm6350: Add wifi node
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable wifi
      ARM: dts: qcom: msm8974-FP2: We're msm8974pro
      ARM: dts: qcom: msm8974-FP2: Add mmc* aliases
      ARM: dts: qcom: msm8974: Add missing license headers
      ARM: dts: qcom: msm8974-FP2: Add support for touchscreen
      ARM: dts: qcom: msm8974-FP2: Configure charger
      ARM: dts: qcom: msm8974-FP2: Add supplies for remoteprocs

Lucas Stach (5):
      arm64: dts: imx8mp: add GPC node with GPU power domains
      arm64: dts: imx8mp: add GPU nodes
      dt-bindings: power: imx8mp: add defines for HDMI blk-ctrl domains
      dt-bindings: soc: add binding for i.MX8MP HDMI blk-ctrl
      arm64: dts: imx8mp: add HSIO power-domains

Manikanta Pubbisetty (1):
      arm64: dts: qcom: sc7280: Add WCN6750 WiFi node

Manoj Sai (3):
      arm64: dts: imx8mp: Add Engicam i.Core MX8M Plus SoM
      arm64: dts: imx8mp: Add Engicam i.Core MX8M Plus EDIMM2.2 Starter Kit
      dt-bindings: arm: fsl: Add Engicam i.Core MX8M Plus EDIMM2.2 Starter =
Kit

Marcel Ziswiler (17):
      arm64: dts: imx8mm-verdin: update regulator names
      arm64: dts: imx8mm-verdin: multi-line comment style
      arm64: dts: imx8mm-verdin: alphabetically re-order nodes
      arm64: dts: imx8mm-verdin: only dashes in node names
      arm64: dts: imx8mm-verdin: comment about i2c level shifter
      arm64: dts: imx8mm-verdin: update iomux configuration
      arm64: dts: imx8mm-verdin: re-order pinctrl groups
      arm64: dts: imx8mm-verdin: capitalisation of verdin comments
      arm64: dts: imx8mm-verdin: note about disabled sd1 pull-ups
      arm64: dts: imx8mm-verdin: add sd1 sleep pinctrl
      arm64: dts: imx8mp: add uart2 dma
      arm64: dts: freescale: add initial support for verdin imx8m plus
      dt-bindings: arm: fsl: add toradex,verdin-imx8mp et al.
      ARM: dts: imx6ull-colibri: fix nand bch geometry
      ARM: dts: imx6ull-colibri: add/update some comments
      ARM: dts: imx6ull-colibri: move gpio-keys node to som dtsi
      ARM: dts: imx6ull-colibri: improve pinctrl node names

Marek Vasut (15):
      arm64: dts: imx8mm: Add support for Data Modul i.MX8M Mini eDM SBC
      ARM: dts: stm32: Add alternate pinmux for ethernet0 pins
      ARM: dts: stm32: Add alternate pinmux for mco2 pins
      ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on DHCOM
      arm64: dts: imx8mp: Add missing speed grade phandle
      arm64: dts: imx8mp: Add cpu-freq support
      ARM: dts: stm32: Fix PHY post-reset delay on Avenger96
      arm64: dts: imx8mm: Add i.MX8M Mini Toradex Verdin based Menlo board
      dt-bindings: rcc: Add optional external ethernet RX clock properties
      dt-bindings: arm: Add Data Modul i.MX8M Mini eDM SBC
      dt-bindings: arm: Add i.MX53 based Menlo board comment
      dt-bindings: arm: Add i.MX8M Mini Toradex Verdin based Menlo board
      arm64: dts: imx8mm: Add CPLD on MX8Menlo board
      arm64: dts: imx8mm: Disable USB2 OC on Data Modul i.MX8M Mini eDM SBC
      arm64: dts: imx8mm: Use 100 kHz I2C2 on Data Modul i.MX8M Mini eDM SB=
C

Mark Brown (1):
      ARM: dts: imx6qdl-udoo: Disable USB host to work around boot issues

Markus Niebel (4):
      arm64: dt: imx8mq: support pwm polarity inversion
      arm64: dt: imx8mm: support pwm polarity inversion
      arm64: dt: imx8mn: support pwm polarity inversion
      arm64: dt: imx8mp: support pwm polarity inversion

Martin Kepplinger (2):
      arm64: dts: imx8mq-librem5: make the volume buttons a wakeup source
      arm64: dts: imx8mq-librem5: remove description of CHG_STATUS_B

Matthias Kaehlcke (7):
      arm64: dts: qcom: sc7280: Add SAR sensors for herobrine
      arm64: dts: qcom: sc7280: Add device tree for herobrine villager
      arm64: dts: qcom: sc7280: Rename crd to crd-r3
      arm64: dts: qcom: sc7280: Add 'piglin' to the crd-r3 compatible strin=
gs
      arm64: dts: qcom: sc7280: herobrine: disable some regulators by defau=
lt
      arm64: dts: qcom: sc7280: Add CRD rev5
      arm64: dts: qcom: sc7280: Add SAR sensors to herobrine crd

Matthias Schiffer (2):
      arm64: dts: ti: k3-am64-mcu: remove incorrect UART base clock rates
      dt-bindings: arm: fsl: add TQ Systems boards based on i.MX6UL(L)

Max Krummenacher (13):
      ARM: dts: imx6dl-colibri: Drop dedicated v1.1 device tree
      ARM: dts: imx6dl-colibri: Fix I2C pinmuxing
      ARM: dts: imx6dl-colibri: Disable add-on accessories
      ARM: dts: imx6dl-colibri: Command pmic to standby for poweroff
      ARM: dts: imx6dl-colibri: Add additional pingroups
      ARM: dts: imx6dl-colibri: Move common nodes to SoM dtsi
      ARM: dts: imx6dl-colibri: Cleanup
      ARM: dts: imx6dl-colibri: Add usdhc1 sleep pin configuration
      ARM: dts: imx6dl-colibri: Add support for Toradex Iris carrier boards
      ARM: dts: imx6dl-colibri: Add support for Toradex Aster carrier board
      dt-bindings: arm: fsl: imx6dl-colibri: Drop dedicated v1.1 bindings
      dt-bindings: arm: fsl: Add carriers for toradex,colibri-imx6dl
      ARM: dts: imx6ull-colibri: change touch i2c parameters

Michael Riesch (6):
      dt-bindings: arm: rockchip: add radxa rock3 model a
      arm64: dts: rockchip: add basic dts for the radxa rock3 model a
      arm64: dts: rockchip: add usb3 support to rk3568-evb1-v10
      arm64: dts: rockchip: add usb3 support to the radxa rock3 model a
      arm64: dts: rockchip: enable usb hub on the radxa rock3 model a
      arm64: dts: rockchip: enable otg/drd operation of usb_host0_xhci in r=
k356x

Michael Srba (2):
      dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clock=
s
      arm64: dts: qcom: msm8998: reserve potentially inaccessible clocks

Michael Walle (23):
      arm64: dts: imx8mn-evk: use proper names for PMIC outputs
      arm64: dts: imx8mn-evk: fix the min/max voltages of the PMIC
      arm64: dts: imx8mn-evk: add QSPI flash
      arm64: dts: ls1028a: sl28: use ocelot-8021q tagging by default
      arm64: dts: ls1028a: default to OTG mode for USB
      arm64: dts: imx8mn: add 8MNANOD3L-EVK device tree
      dt-bindings: arm: fsl: add IMX8MN DDR3L eval board
      ARM: dts: ls1021a: reduce the interrupt-map-mask
      arm64: dts: freescale: reduce the interrup-map-mask
      ARM: dts: lan966x: rename pinctrl nodes
      ARM: dts: lan966x: swap dma channels for crypto node
      ARM: dts: lan966x: add sgpio node
      ARM: dts: lan966x: add missing uart DMA channel
      ARM: dts: lan966x: add all flexcom usart nodes
      ARM: dts: lan966x: add flexcom SPI nodes
      ARM: dts: lan966x: add flexcom I2C nodes
      ARM: dts: lan966x: add basic Kontron KSwitch D10 support
      ARM: dts: lan966x: add hwmon node
      ARM: dts: lan966x: add MIIM nodes
      ARM: dts: lan966x: add reset switch reset node
      ARM: dts: lan966x: add serdes node
      ARM: dts: lan966x: add switch node
      ARM: dts: kswitch-d10: enable networking

Mike Leach (1):
      arm64: dts: juno: add CTI entries to device tree

Ming Qian (1):
      arm64: dts: freescale: imx8q: add imx vpu codec entries

Miquel Raynal (5):
      ARM: dts: r9a06g032: Add the two DMA nodes
      ARM: dts: r9a06g032: Describe the DMA router
      ARM: dts: r9a06g032: Fill the UART DMA properties
      ARM: dts: r9a06g032: Fix the NAND controller node
      ARM: dts: r9a06g032: Describe the RTC

Nobuhiro Iwamatsu (7):
      arm64: dts: visconti: Add clock controller support for TMPV7708
      arm64: dts: visconti: Update the clock providers for UART
      arm64: dts: visconti: Update the clock providers for I2C
      arm64: dts: visconti: Update the clock providers for watchdog timer
      arm64: dts: visconti: Update the clock providers for SPI
      arm64: dts: visconti: Update the clock providers for ethernet device
      arm64: dts: visconti: Update the clock providers for PCIe host contro=
ller

N=C3=ADcolas F. R. A. Prado (2):
      arm64: dts: mediatek: Format mediatek,larbs as an array of phandles
      arm64: dts: mt8192: Follow binding order for SCP registers

Oleksandr Suvorov (2):
      ARM: dts: imx6dl-colibri: Add gpio-line-names
      ARM: dts: imx6ull-colibri: add gpio-line-names

Oleksij Rempel (10):
      ARM: dts: exynos: fix ethernet node name for different odroid boards
      ARM: dts: exynos: fix compatible strings for Ethernet USB devices
      ARM: dts: bcm283x: fix ethernet node name
      arm64: dts: imx8mm-kontron: fix ethernet node name
      ARM: dts: omap3/4/5: fix ethernet node name for different OMAP boards
      ARM: dts: imx6qdl-vicut1.dtsi: add thermal zone and attach tmp103 to =
it.
      dt-bindings: arm: stm32: Add compatible strings for Protonic T1L boar=
ds
      dt-bindings: net: silabs,wfx: add prt,prtt1c-wfm200 antenna variant
      ARM: dts: stm32: stm32mp15-pinctrl: add spi1-1 pinmux group
      ARM: dts: stm32: add support for Protonic PRTT1x boards

Pali Roh=C3=A1r (1):
      ARM: dts: turris-omnia: Add atsha204a node

Paul Elder (2):
      dt-bindings: soc: Add i.MX8MP media block control DT bindings
      arm64: dts: imx8mp: Add MEDIA_BLK_CTRL

Peng Fan (1):
      arm64: dts: imx8mq: add hdmi phy 27m clock

Peter Geis (8):
      arm64: dts: rockchip: add rk356x dwc3 usb3 nodes
      arm64: dts: rockchip: enable dwc3 on quartz64-a
      arm64: dts: rockchip: add rk356x sfc support
      dt-bindings: arm: rockchip: Add Pine64 Quartz64 Model B
      dt-bindings: arm: rockchip: Add Pine64 SoQuartz SoM
      dt-bindings: arm: rockchip: Add Firefly Station M2
      arm64: dts: rockchip: add Pine64 Quartz64-B device tree
      arm64: dts: rockchip: add SoQuartz CM4IO dts

Petr Vorel (1):
      arm64: dts: qcom: msm8994-huawei-angler: Add sdhc1 definition

Phil Edworthy (4):
      dt-bindings: arm: renesas: Document Renesas RZ/V2M SoC and EVK board
      dt-bindings: clock: Add r9a09g011 CPG Clock Definitions
      arm64: dts: renesas: Add initial DTSI for RZ/V2M SoC
      arm64: dts: renesas: Add initial device tree for RZ/V2M EVK

Phil Elwell (4):
      ARM: dts: bcm2835-rpi-zero-w: Fix GPIO line name for Wifi/BT
      ARM: dts: bcm2837-rpi-cm3-io3: Fix GPIO line names for SMPS I2C
      ARM: dts: bcm2837-rpi-3-b-plus: Fix GPIO line name of power LED
      ARM: dts: bcm283x: Align ETH_CLK GPIO line name

Philip Oberfichtner (2):
      ARM: dts: Add bosch acc board
      dt-bindings: arm: Add bosch acc board

Philip Rinn (1):
      arm64: dts: allwinner: a64: olinuxino: Enable audio

Philippe Schenker (3):
      ARM: dts: imx6ull-colibri: use pull-down for adc pins
      ARM: dts: imx6ull-colibri: add phy-supply to fec
      ARM: dts: imx6ull-colibri: update usdhc1 pixmux and signaling

Qianggui Song (2):
      arm64: dts: meson-s4: add pinctrl node
      arm64: dts: meson-s4: add gpio_intc node

Rafa=C5=82 Mi=C5=82ecki (1):
      ARM: dts: BCM5301X: Update pin controller node name

Rahul T R (2):
      arm64: dts: ti: k3-j721e-sk: Enable DisplayPort
      arm64: dts: ti: k3-j721e-sk: Enable HDMI

Rakesh Pillai (1):
      arm64: dts: qcom: sc7280: Add WPSS remoteproc node

Rayyan Ansari (1):
      ARM: dts: qcom: pm8226: Add VADC node

Rex-BC Chen (1):
      arm64: dts: mt8183: Update disp_aal node compatible

Rob Herring (1):
      arm64: dts: qcom: sdm845: shift6mq: Fix boolean properties with value=
s

Robert Marko (5):
      arm64: dts: uDPU: update partition table
      arm64: dts: uDPU: correct temperature sensors
      arm64: dts: marvell: espressobin-ultra: fix SPI-NOR config
      arm64: dts: marvell: espressobin-ultra: add PHY and switch reset pins
      arm64: dts: marvell: espressobin-ultra: enable front USB3 port

Robin Murphy (1):
      arm64: dts: rockchip: Add some pins for NanoPi4

Robin van der Gracht (2):
      ARM: dts: imx6dl-victgo: Add interrupt-counter nodes
      ARM: dts: imx6dl-victgo: The TGO uses a lg,lb070wv8 compatible 7" dis=
play

Rohit Agarwal (12):
      ARM: dts: qcom: sdx65: Add support for A7 PLL clock
      ARM: dts: qcom: sdx65: Add support for APCS block
      ARM: dts: qcom: sdx65: Add spmi node
      ARM: dts: qcom: sdx65-mtp: Add pmk8350b and pm8150b pmic
      ARM: dts: qcom: Add PMIC pmx65 dts
      ARM: dts: qcom: sdx65-mtp: Add pmx65 pmic
      ARM: dts: qcom: sdx65: Add rpmpd node
      ARM: dts: qcom: sdx65-mtp: Add regulator nodes
      ARM: dts: qcom: sdx65: Add reserved memory nodes
      ARM: dts: qcom: sdx65: Add support for SDHCI controller
      ARM: dts: qcom: sdx65: Enable ARM SMMU
      ARM: dts: qcom: sdx65: Add support for TCSR Mutex

Rui Miguel Silva (2):
      dt-bindings: Add Arm corstone1000 platform
      arm64: dts: Add Arm corstone1000 platform support

Rui Salvaterra (2):
      arm64: dts: mt7622: specify the number of DMA requests
      arm64: dts: mt7622: specify the L2 cache topology

SHIMAMOTO Takayoshi (1):
      ARM: dts: BCM5301X: Add DT for WZR-1166DHP,DHP2

Sameer Pujar (2):
      arm64: tegra: Add ASRC device on Tegra186 and later
      arm64: tegra: Enable ASRC on various platforms

Samuel Holland (2):
      arm64: dts: rockchip: Add accelerometer to rk3566-pinenote
      arm64: dts: rockchip: Add USB and TCPC to rk3566-pinenote

Sandeep Maheswaram (1):
      arm64: dts: qcom: sc7280: Add wakeup-source property for USB node

Sankeerth Billakanti (1):
      arm64: dts: qcom: sc7280: rename edp_out label to mdss_edp_out

Sascha Hauer (1):
      arm64: dts: rockchip: rename HDMI ref clock to 'ref' on rk3399

Satya Priya (2):
      arm64: dts: qcom: pm8350c: Add pwm support
      arm64: dts: qcom: Enable pm8350c pwm for sc7280-idp2

Shaik Sajida Bhanu (1):
      arm64: dts: qcom: sc7280: Add reset entries for SDCC controllers

Shawn Lin (1):
      arm64: dts: rockchip: Move drive-impedance-ohm to emmc phy on rk3399

Sherry Sun (1):
      arm64: dts: imx8mp: add ddr controller node to support EDAC on imx8mp

Shunzhou Jiang (1):
      arm64: dts: add support for S4 power domain controller

Souradeep Chowdhury (1):
      arm64: dts: qcom: sc7280: Set the default dr_mode for usb2

Stefan Wahren (2):
      ARM: dts: bcm2835-rpi-b: Fix GPIO line names
      ARM: dts: bcm283x: Remove gpio line name NC

Stephan Gerhold (3):
      arm64: dts: qcom: msm8916: Add BAM-DMUX for WWAN network interfaces
      arm64: dts: qcom: msm8916-huawei-g7: Clarify installation instruction=
s
      arm64: dts: qcom: msm8916-huawei-g7: Add sound card

Stephen Boyd (8):
      arm64: dts: qcom: sc7280: Fix sar1_irq_odl node name
      arm64: dts: qcom: sc7280-herobrine: Drop outputs on fpmcu pins
      arm64: dts: qcom: sc7180-trogdor: Simplify SAR sensor enabling
      arm64: dts: qcom: sc7180: Remove ipa interconnect node
      ARM: dts: qcom: sdx55: Remove ipa interconnect node
      arm64: dts: qcom: sc7180-trogdor: Simplify trackpad enabling
      arm64: dts: qcom: sc7180-trogdor: Simplify spi0/spi6 labeling
      arm64: dts: qcom: Only include sc7180.dtsi in sc7180-trogdor.dtsi

Sudeep Holla (2):
      arm64: dts: juno: Fix SCMI power domain IDs for ETF and CS funnel
      arm64: dts: fvp: Align virtio device node names with dtschema

Sumit Gupta (1):
      arm64: tegra: Add node for Tegra234 CCPLEX cluster

Taniya Das (2):
      dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
      arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio clock controller=
s

Thorsten Scherer (1):
      ARM: dts: ci4x10: Adapt to changes in imx6qdl.dtsi regarding fec cloc=
ks

Tim Harvey (7):
      arm64: dts: imx8m{m,n}-venice-*: add missing uart-has-rtscts
property to UARTs
      arm64: dts: imx: Add i.MX8M Plus Gateworks gw7400 dts support
      dt-bindings: arm: Add i.MX8M Plus Gateworks GW74xx board
      arm64: dts: imx8mm-venice-gw7902: fix pcie bindings
      arm64: dts: imx8m*venice: add missing clock-names to pcie_phy
      arm64: dts: imx8mm-venice-gw7902: add vdd_5p0 ADC channel
      arm64: dts: imx8mm-venice-gw7901: remove unnecessary cpu temp overrid=
e

Tinghan Shen (2):
      dt-bindings: arm: mediatek: Add mt8195 pericfg compatible
      arm64: dts: Add mediatek SoC mt8195 and evaluation board

Tomi Valkeinen (2):
      arm64: dts: ti: k3-j721e-*: add DP & DP PHY
      arm64: dts: ti: k3-j721e-common-proc-board: add DP to j7 evm

Tommaso Merciai (1):
      arm64: dts: imx8mm-evk: add pwm1/backlight support

Tony Lindgren (32):
      dt-bindings: omap: Add clock-output-names and #clock-cells
      dt-bindings: clock: ti: Add clock-output-names for clockctrl
      dt-bindings: clock: ti: Add clock-output-names for TI composite clock=
s
      ARM: dts: Add clksel node for am3 ehrpwm
      ARM: dts: Add clksel node for am3 gfx
      ARM: dts: Add clksel node for am3 clkout
      ARM: dts: Use clock-output-names for am3
      ARM: dts: Use clock-output-names for dra7
      ARM: dts: Use clock-output-names for am4
      ARM: dts: Add clock-output-names for omap4
      ARM: dts: Drop custom clkctrl compatible and update omap4 l4per
      ARM: dts: Add clock-output-names for omap5
      ARM: dts: Drop custom clkctrl compatible and update omap5 l4per
      ARM: dts: Group omap3 CONTROL_DEVCONF0 clocks
      ARM: dts: Group omap3 CONTROL_DEVCONF1 clocks
      ARM: dts: Group omap3 CM_FCLKEN1_CORE clocks
      ARM: dts: Group omap3 crypto accelerator clocks
      ARM: dts: Group omap3 CM_ICLKEN1_CORE clocks
      ARM: dts: Group omap3 CM_ICLKEN3_CORE clocks
      ARM: dts: Group omap3 CM_CLKSEL_CORE clocks
      ARM: dts: Group omap3 CM_FCLKEN_WKUP clocks
      ARM: dts: Group omap3 CM_ICLKEN_WKUP clocks
      ARM: dts: Group omap3 CM_CLKSEL_WKUP clocks
      ARM: dts: Group omap3 CM_CLKSEL1_PLL clocks
      ARM: dts: Group omap3 CM_CLKOUT_CTRL clocks
      ARM: dts: Group omap3 CM_FCLKEN_DSS clocks
      ARM: dts: Group omap3 CM_CLKSEL_DSS clocks
      ARM: dts: Group omap3 CM_FCLKEN_CAM clocks
      ARM: dts: Group omap3 CM_FCLKEN_PER clocks
      ARM: dts: Group omap3 CM_ICLKEN_PER clocks
      ARM: dts: Group omap3 CM_CLKSEL_PER clocks
      ARM: dts: Group omap3 CM_CLKSEL1_EMU clocks

Ulrich Hecht (2):
      arm64: dts: renesas: r8a779a0: Add CANFD device node
      arm64: dts: renesas: falcon: Enable CANFD 0 and 1

Uwe Kleine-K=C3=B6nig (1):
      ARM: dts: imx6qdl-tx6: Drop some duplicated properties

Valentin Caron (2):
      ARM: dts: stm32: add RTC node on stm32mp131
      ARM: dts: stm32: enable RTC support on stm32mp135f-dk

Vignesh Raghavendra (4):
      arm64: dts: ti: k3-am62: Add more peripheral nodes
      arm64: dts: ti: k3-am625-sk: Enable on board peripherals
      arm64: dts: ti: k3-am625-sk: Add ECAP APWM nodes
      arm64: dts: ti: k3-am62-mcu: Enable MCU GPIO module

Vijaya Krishna Nivarthi (2):
      arm64: dts: qcom: sc7280-idp: Configure CTS pin to bias-bus-hold
for bluetooth
      arm64: dts: qcom: sc7280-qcard: Configure CTS pin to
bias-bus-hold for bluetooth

Vinod Koul (14):
      arm64: dts: qcom: sm8150: add ethernet node
      arm64: dts: qcom: sa8155p-adp: Enable ethernet node
      arm64: dts: qcom: sm8450: Add gpi_dma nodes
      arm64: dts: qcom: sm8450: Fix missing iommus for qup
      arm64: dts: qcom: sm8450: Add qup nodes for qup0
      arm64: dts: qcom: sm8450: Add qup nodes for qup1
      arm64: dts: qcom: sm8450: Add qup nodes for qup2
      arm64: dts: qcom: sm8450: Fix missing iommus for qup1
      arm64: dts: qcom: sm8450-qrd: Enable spi and i2c nodes
      arm64: dts: qcom: qrb5165-rb5: Fix can-clock node name
      arm64: dts: qcom: db845c: Add support for MCP2517FD
      arm64: dts: qcom: sc7280: Add GPI DMAengines
      arm64: dts: qcom: sc7280: Add GENI I2C/SPI DMA channels
      arm64: dts: qcom: sc7280-idp: Enable GPI DMAs

Vladimir Zapolskiy (2):
      arm64: dts: qcom: sm8450: Add thermal sensor controllers
      arm64: dts: qcom: sm8450: Add thermal zones

Vyacheslav Bocharov (4):
      arm64: meson: add dts bluetooth node for JetHub H1
      arm64: meson: dts: update serial alias in dts for JetHub D1
      arm64: meson: update SDIO voltage in dts for JetHub D1
      arm64: meson: update WiFi SDIO in dts for JetHub D1

William Zhang (2):
      dt-bindings: arm: add bcmbca device tree binding document
      ARM: dts: add dts files for bcmbca soc 47622

Wolfram Sang (5):
      ARM: dts: rcar-gen2: Add interrupt properties to watchdog nodes
      ARM: dts: rzg1: Add interrupt properties to watchdog nodes
      arm64: dts: renesas: rcar-gen3: Add interrupt properties to watchdog =
nodes
      arm64: dts: renesas: rzg2: Add interrupt properties to watchdog nodes
      arm64: dts: renesas: rcar-gen4: Add interrupt properties to watchdog =
nodes

Yassine Oudjana (4):
      arm64: dts: qcom: msm8996: Revamp reserved memory
      arm64: dts: qcom: msm8996: Unify smp2p naming
      arm64: dts: qcom: msm8996: Add MSS and SLPI
      arm64: dts: qcom: msm8996-xiaomi-*: Enable MSS and SLPI

Yegor Yefremov (1):
      ARM: dts: am335x-baltos: update MPU regulator range

Yong Wu (2):
      arm: dts: mediatek: Get rid of mediatek, larb for MM nodes
      arm64: dts: mediatek: Get rid of mediatek, larb for MM nodes

Yoshihiro Shimoda (7):
      dt-bindings: power: Add r8a779g0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
      dt-bindings: arm: renesas: Document R-Car V4H White Hawk DT bindings
      dt-bindings: reset: renesas,rst: Document r8a779g0 reset module
      dt-bindings: power: renesas,rcar-sysc: Document r8a779g0 SYSC binding=
s
      arm64: dts: renesas: Add Renesas R8A779G0 SoC support
      arm64: dts: renesas: Add Renesas White Hawk boards support

dirstat only
   0.9% Documentation/devicetree/bindings/arm/
   0.9% Documentation/devicetree/bindings/clock/
   0.4% Documentation/devicetree/bindings/soc/
  44.1% arch/arm/boot/dts/
   0.9% arch/arm64/boot/dts/arm/
  11.4% arch/arm64/boot/dts/freescale/
   5.4% arch/arm64/boot/dts/mediatek/
   1.6% arch/arm64/boot/dts/nvidia/
  15.4% arch/arm64/boot/dts/qcom/
   6.9% arch/arm64/boot/dts/renesas/
   5.1% arch/arm64/boot/dts/rockchip/
   1.9% arch/arm64/boot/dts/ti/
   1.2% arch/arm64/boot/dts/
   2.6% include/dt-bindings/clock/
