Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0698C433F5
	for <soc@archiver.kernel.org>; Wed,  3 Nov 2021 22:54:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 74318611C1; Wed,  3 Nov 2021 22:54:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA21461108
	for <soc@kernel.org>; Wed,  3 Nov 2021 22:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635980042;
	bh=gxNywe6QbHerxV3Ien4qoGyzzOEMoFB4CTA52+T33zY=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=bHdjXDk7S+YUM96NC0ZBCnooSb5dXpZbyU7QP1eFVm4pm4Bnjn6MijNAbGz1Gsozz
	 H00cOCexqgntc+eJpXQZjOFooaYib14hEWXFG5uF1yVEdQaTGqxXbGuvgFM/h9jNW8
	 LLgSq+OZU+64LzpSWguvOEJkXcK0penk5DynCfVq9CWsTFvyh47/tCb+TaQRHs49SO
	 8zIwMTwag4AdsHkKq7/+/JsdyroD6OgjIO1+9NRajr7uZN1vGhENR+WH0AUlNrFBj8
	 fkyLXVgENK7gk0j9szVfObvWdVXPTSdCeYWsY52OxI9OJun2ANV1Ni4lLAA0dNiii8
	 hgWxw4MRvMtRQ==
Received: by mail-wm1-f50.google.com with SMTP id y84-20020a1c7d57000000b00330cb84834fso5828608wmc.2
        for <soc@kernel.org>; Wed, 03 Nov 2021 15:54:01 -0700 (PDT)
X-Gm-Message-State: AOAM532/7jn/FCoRjkPGHQrpK9kzBQ1BSanWNMqz4o0ELcGpJOpgvO2D
	QOwGoL97sfq2Fd/lxrnMnxWkLimbhzE432QAbcE=
X-Google-Smtp-Source: ABdhPJyeYady7XQDRDDVlpLUPfriwBhjmrEBDdT/n4VedViqSOdVgJkwN2oY8Dv99M3oQCZDMaBGvrOQFj8G/Fw3C7s=
X-Received: by 2002:a05:600c:4f42:: with SMTP id m2mr18741843wmq.82.1635980039736;
 Wed, 03 Nov 2021 15:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 3 Nov 2021 23:53:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3A94cW4hxjkgDu1OMH9iJYaONbktZL=yfjxVCWLLGiYw@mail.gmail.com>
Message-ID: <CAK8P3a3A94cW4hxjkgDu1OMH9iJYaONbktZL=yfjxVCWLLGiYw@mail.gmail.com>
Subject: [GIT PULL 2/4] ARM: SoC DT updates for v5.16
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29=
:

  Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.16

for you to fetch changes up to c17c7cc775b31ab54e8cba05f9e7b16fd32dd84f:

  Merge tag 'asahi-soc-dt-5.16-v2' of
https://github.com/AsahiLinux/linux into arm/dt (2021-10-27 15:35:55
+0200)

----------------------------------------------------------------
ARM: SoC DT updates for v5.16

This is a rather large update for the ARM devicetree files, after a few
quieter releases, with 775 total commits and 47 branches pulled into
this one. There are 5 new SoC types plus some minor variations, and
a total of 60 new machines, so I'm limiting the summary to the main
noteworthy items:

 - Apple M1 gain support for PCI and pinctrl, getting a bit
   closer to a usable system out of the box.

 - Qualcomm gains support for Snapdragon 690 (aka SM6350) as
   well as SM7225, 11 new smartphones, and three additional
   Chromebooks, and improvements all over the place.

 - Samsung gains support for ExynosAutov9, an automotive version
   of their smartphone SoC, but otherwise no major changes.

 - Microchip adds the SAMA5D29 SoC in the SAMA5 family, and a
   number of improvements for the recently added SAMA7 family.
   The LAN966 SoC that was added in the platform code does not
   have dts files yet. Two board files are added for the older
   at91sam9g20 SoC

 - Aspeed supports two additional server boards using their AST2600
   as BMC, and improves support for qemu models

 - Rockchip RK3566/RK3688 gets added, along with six new
   development boards using RK3328/RK3399/RK3566, and one
   Chromebook tablet.

 - Two NAS boxes are added using the ARMv4 based Gemini platform

 - One new board is added to the Intel Arria SoC FPGA family

 - Marvell adds one network switch based on Armada 381 and the
   new MOCHAbin 7040 development board

 - NXP adds support for the S32G2 automotive SoC, two imx6 based
   ebook readers, and three additional development boards, which
   is notably less than their usual additions, but they also gain
   improvements to their many existing boards

 - STmicroelectronics adds their stm32mp13 SoC family along with
   a reference board

 - Renesas adds new versions of their R-Car Gen3 SoCs and many
   updates for their older generations

 - Broadcom adds support for a number of Cisco Meraki wireless
   controllers, along with two new boards and other updates for
   BCM53xx/BCM47xx networking SoCs and the Raspberry Pi
   boards

 - Mediatek improves support for the MT81xx SoCs used in Chromebooks
   as well as the MT76xx networking SoCs

 - NVIDIA adds a number of cleanups and additional support for
   more hardware on the already supported machines

 - TI K3 adds support for three new boards along with cleanups

 - Toshiba adds one board for the Visconti family

 - Xilinx adds five new ZynqMP based machines

 - Amlogic support is added for the Radxa Zero and two Jethub
   home automation controllers, along with changes to other
   machines

 - Rob Herring continues his work on fixing dtc warnings all over
   the tree.

 - Minor updates for TI OMAP, Mstar, Allwinner/sunxi, Hisilicon,
   Ux500, Unisoc

----------------------------------------------------------------
Adam Porter (1):
      ARM: dts: at91: add CalAmp LMU5000 board

Adriana Kobylak (1):
      ARM: dts: aspeed: rainier: Add power-config-full-load gpio

Akhil P Oommen (1):
      arm64: dts: qcom: sc7280: Add gpu support

Alex Bee (7):
      dt-bindings: Add doc for ROCK Pi 4 A+ and B+
      arm64: dts: rockchip: Add RK3399 ROCK Pi 4A+ board
      arm64: dts: rockchip: Add RK3399 ROCK Pi 4B+ board
      arm64: dts: rockchip: add ES8316 codec for ROCK Pi 4
      arm64: dts: rockchip: add SPDIF node for ROCK Pi 4
      arm64: dts: rockchip: Re-add interrupt-names for RK3399's vpu
      arm64: dts: rockchip: Fix GPU register width for RK3328

Alexandre Torgue (3):
      ARM: dts: stm32: add STM32MP13 SoCs support
      dt-bindings: stm32: document stm32mp135f-dk board
      ARM: dts: stm32: add initial support of stm32mp135f-dk board

Amelie Delaunay (1):
      ARM: dts: stm32: use usbphyc ck_usbo_48m as USBH OHCI clock on stm32m=
p151

Amit Kumar Mahapatra (1):
      arm64: zynqmp: Do not duplicate flash partition label property

Amit Pundir (2):
      arm64: dts: qcom: sdm845-db845c: Add msm-id and board-id
      arm64: dts: qcom: qrb5165-rb5: Add msm-id and board-id

Anand Moon (4):
      arm64: dts: meson-g12a: Fix the pwm regulator supply properties
      arm64: dts: meson-g12b: Fix the pwm regulator supply properties
      arm64: dts: meson-sm1: Fix the pwm regulator supply properties
      arm64: dts: meson-g12b-odroid-n2: add 5v regulator gpio

Andreas Kemnade (13):
      dt-bindings: arm: fsl: Add E70K02 based ebook readers
      ARM: dts: add Netronix E70K02 board common file
      ARM: dts: imx: add devicetree for Kobo Libra H2O
      ARM: dts: imx: add devicetree for Tolino Vision 5
      ARM: dts: imx: e60k02: correct led node name
      ARM: dts: imx6sl: fixup of operating points
      ARM: dts: imx6sll: fixup of operating points
      ARM: dts: omap3: fix cpu thermal label name
      arm: dts: omap3-gta04: cleanup LCD definition
      arm: dts: omap3-gta04: fix missing sensor supply
      arm: dts: omap3-gta04a5: fix missing sensor supply
      arm: dts: omap3-gta04a4: accelerometer irq fix
      arm: dts: omap3-gta04: cleanup led node names

Andrew Jeffery (2):
      ARM: dts: aspeed: p10bmc: Use KCS 3 for MCTP binding
      ARM: dts: aspeed: p10bmc: Enable KCS channel 2

AngeloGioacchino Del Regno (18):
      arm64: dts: qcom: msm8998: Configure the MultiMedia Clock
Controller (MMCC)
      arm64: dts: qcom: msm8998: Configure the multimedia subsystem iommu
      arm64: dts: qcom: msm8998: Fix CPU/L2 idle state latency and residenc=
y
      arm64: dts: qcom: msm8998: Move qfprom iospace to calibrated values
      arm64: dts: qcom: msm8998: Configure Adreno GPU and related IOMMU
      arm64: dts: qcom: pmi8998: Add node for WLED
      arm64: dts: qcom: msm8998: Introduce support for Sony Yoshino platfor=
m
      arm64: dts: qcom: msm8998-xperia: Add RMI4 touchscreen support
      arm64: dts: qcom: msm8998-xperia: Add support for wcn3990 Bluetooth
      arm64: dts: qcom: msm8998-xperia: Add support for gpio vibrator
      arm64: dts: qcom: msm8998-xperia: Configure display boost regulators
      arm64: dts: qcom: msm8998-xperia: Add camera regulators
      arm64: dts: qcom: msm8998-xperia: Add audio clock and its pin
      arm64: dts: qcom: Add support for MSM8998 F(x)tec Pro1 QX1000
      arm64: dts: qcom: msm8998-fxtec-pro1: Add physical keyboard leds
      arm64: dts: qcom: msm8998-fxtec-pro1: Add Goodix GT9286 touchscreen
      arm64: dts: qcom: msm8998-fxtec-pro1: Add tlmm keyboard keys
      arm64: dts: qcom: sdm630: Add disabled Venus support

Angus Ainslie (3):
      arm64: dts: imx8mq-librem5: delay the startup of the SDIO
      arm64: dts: imx8mq-librem5: add power sequencing for M.2 cards
      arm64: dts: imx8mq-librem5: Limit the max sdio frequency

Arnaud Ferraris (2):
      arm64: dts: rockchip: add 'chassis-type' property
      arm64: dts: qcom: add 'chassis-type' property

Arnd Bergmann (48):
      Merge tag 'zynqmp-dt-for-v5.16' of
https://github.com/Xilinx/linux-xlnx into arm/dt
      Merge tag 'v5.16-rockchip-dts64-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'v5.16-rockchip-dts32-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.16-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'renesas-dt-bindings-for-v5.16-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'zynqmp-dt-for-v5.16-v2' of
https://github.com/Xilinx/linux-xlnx into arm/dt
      Merge tag 'amlogic-arm64-dt-for-v5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/dt
      Merge tag 'tegra-for-5.16-dt-bindings' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'tegra-for-5.16-arm64-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'v5.15-next-dts32' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'omap-for-v5.16/dt-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'at91-dt-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
      Revert "arm64: dts: Add support for Unisoc's UMS512"
      Merge tag 'tegra-for-5.16-arm-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
      Merge tag 'ti-k3-dt-for-v5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux into arm/dt
      Merge tag 'v5.15-next-dts64' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/dt
      Merge tag 'qcom-dts-for-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'qcom-arm64-for-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'samsung-dt-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'arm-soc/for-5.16/devicetree' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'arm-soc/for-5.16/devicetree-arm64' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge tag 'ux500-dts-for-v5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'hisi-arm64-dt-for-5.16' of
git://github.com/hisilicon/linux-hisi into arm/dt
      Merge tag 'aspeed-5.16-devicetree' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/dt
      Merge tag 'renesas-arm-dt-for-v5.16-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/dt
      Merge tag 'stm32-dt-for-v5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into
arm/dt
      Merge tag 'mvebu-dt64-5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'mvebu-dt-5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/dt
      Merge tag 'visconti-arm-dt-for-v5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti
into arm/dt
      Merge tag 'imx-bindings-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'imx-dt64-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
      Merge tag 'sunxi-dt-for-5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/dt
      Merge tag 'ixp4xx-dts-for-v5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'gemini-dts-for-v5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/dt
      Merge tag 'v5.16-rockchip-dts64-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'v5.16-rockchip-dts32-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/dt
      Merge tag 'arm-soc/for-5.15/devicetree' of
https://github.com/Broadcom/stblinux into arm/dt
      Merge branch 'mstar-dt-next' of
https://github.com/linux-chenxing/linux into arm/dt
      Merge tag 'omap-for-v5.16/gpmc-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/dt
      Merge tag 'aspeed-5.16-devicetree-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/dt
      Merge tag 'at91-dt-5.16-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
      Merge tag 'samsung-dt-5.16-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'samsung-dt64-5.16-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
      Merge tag 'qcom-dts-for-5.16-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'qcom-arm64-for-5.16-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
      Merge tag 'asahi-soc-dt-5.16-v2' of
https://github.com/AsahiLinux/linux into arm/dt

Ar=C4=B1n=C3=A7 =C3=9CNAL (1):
      ARM: dts: BCM5301X: Add DT for Asus RT-AC88U

B. J. Wyman (1):
      ARM: dts: aspeed: rainier: Remove PSU gpio-keys

Ben Tyner (3):
      ARM: dts: rainier: Define name for gpio line Q2
      ARM: dts: everest: Define name for gpio line Q2
      ARM: dts: everest: Define name for gpio line B6

Bhupesh Sharma (5):
      arm64: dts: qcom: sdm845: Use RPMH_CE_CLK macro directly
      arm64: dts: qcom: sm8150: Add fastrpc nodes
      arm64: dts: qcom: sa8155p-adp: Enable remoteproc capabilities
      arm64: dts: qcom: ipq6018: Remove unused
'qcom,config-pipe-trust-reg' property
      arm64: dts: qcom: ipq6018: Remove unused 'iface_clk' property
from dma-controller node

Biju Das (16):
      arm64: dts: renesas: r9a07g044: Add DMAC support
      arm64: dts: renesas: r9a07g044: Add USB2.0 phy and host support
      arm64: dts: renesas: r9a07g044: Add USB2.0 device support
      arm64: dts: renesas: r9a07g044: Add external audio clock nodes
      arm64: dts: renesas: r9a07g044: Add SSI support
      arm64: dts: renesas: rzg2l-smarc: Enable USB2.0 support
      arm64: dts: renesas: rzg2l-smarc: Enable I2C{0,1,3} support
      arm64: dts: renesas: r9a07g044: Add DMA support to SSI
      arm64: dts: renesas: rzg2l-smarc: Add WM8978 sound codec
      arm64: dts: renesas: rzg2l-smarc: Enable audio
      arm64: dts: renesas: rzg2l-smarc: Add Mic routing
      arm64: dts: renesas: r9a07g044: Add SDHI nodes
      arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on SMARC platform
      arm64: dts: renesas: rzg2l-smarc: Enable microSD on SMARC platform
      arm64: dts: renesas: r9a07g044: Add GbEthernet nodes
      arm64: dts: renesas: rzg2l-smarc-som: Enable Ethernet

Bjorn Andersson (4):
      arm64: dts: qcom: apq8016-sbc: Update modem and WiFi firmware path
      arm64: dts: qcom: sdm845: Drop standalone smem node
      arm64: dts: qcom: sm8350: Add CPU topology and idle-states
      Revert "arm64: dts: qcom: msm8916-asus-z00l: Add sensors"

Brian Norris (2):
      arm64: dts: rockchip: add RK3399 Gru gpio-line-names
      arm64: dts: rockchip: add Coresight debug range for RK3399

Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus: enable second wifi channel

Chanho Park (3):
      arm64: dts: exynos: add initial support for exynosautov9 SoC
      arm64: dts: exynos: add minimal support for exynosautov9 sadk board
      arm64: dts: exynos: add chipid node for exynosautov9 SoC

Chen-Yu Tsai (2):
      dt-bindings: arm: rockchip: Add gru-scarlet-dumo board
      arm64: dts: rockchip: Add gru-scarlet-dumo board

Chester Lin (7):
      dt-bindings: arm: fsl: add NXP S32G2 boards
      dt-bindings: serial: fsl-linflexuart: convert to json-schema format
      dt-bindings: serial: fsl-linflexuart: add compatible for S32G2
      arm64: dts: add NXP S32G2 support
      arm64: dts: s32g2: add serial/uart support
      arm64: dts: s32g2: add VNP-EVB and VNP-RDB2 support
      arm64: dts: s32g2: add memory nodes for evb and rdb2

Chia-Wei Wang (1):
      ARM: dts: aspeed: Add uart routing to device tree

Chris Morgan (4):
      arm64: dts: rockchip: Add SFC to PX30
      arm64: dts: rockchip: Add SFC to RK3308
      arm64: dts: rockchip: Enable SFC for Odroid Go Advance
      arm64: dts: rockchip: Correct regulator for USB host on Odroid-Go2

Christian Gmeiner (1):
      arm64: dts: ti: k3-am64-mcu: Add pinctrl

Christian Hewitt (3):
      dt-bindings: arm: amlogic: add support for Radxa Zero
      arm64: dts: amlogic: add support for Radxa Zero
      arm64: dts: meson: add audio playback to rbox-pro

Christian Lamparter (2):
      ARM: BCM53016: Specify switch ports for Meraki MR32
      ARM: BCM53016: MR32: get mac-address from nvmem

Chuanjia Liu (2):
      ARM: dts: mediatek: Update MT7629 PCIe node for new format
      arm64: dts: mediatek: Split PCIe node for MT2712 and MT7622

Chukun Pan (2):
      arm64: dts: allwinner: NanoPi R1S H5: Add generic compatible
string for I2C EEPROM
      arm64: dts: qcom: ipq8074: Add QUP5 I2C node

Chun-Jie Chen (1):
      arm64: dts: mediatek: Add mt8192 clock controllers

Chunyan Zhang (2):
      dt-bindings: arm: Add bindings for Unisoc's UMS512
      arm64: dts: Add support for Unisoc's UMS512

Claudiu Beznea (7):
      ARM: dts: at91: at91sam9260: add pinctrl label
      dt-bindings: add vendor prefix for calamp
      dt-bindings: ARM: at91: document CalAmp LMU5000 board
      dt-bindings: add vendor prefix for exegin
      dt-bindings: ARM: at91: document exegin q5xr5 board
      ARM: dts: at91: sama7g5: add tcb nodes
      ARM: dts: at91: sama7g5-ek: use blocks 0 and 1 of TCB0 as cs and ce

Corentin Labbe (5):
      ARM: dts: gemini: add labels for USB, IDE, flash and ethernet
      dt-bindings: add vendor prefix for edimax
      dt-bindings: add vendor prefix for ssi
      ARM: gemini: add device tree for edimax NS2502
      ARM: gemini: add device tree for ssi1328

Dan Johansen (1):
      arm64: dts: rockchip: Setup USB typec port as datarole on for Pineboo=
k Pro

Dang Huynh (1):
      arm64: dts: allwinner: pinetab: Add HDMI support

Daniel Lezcano (1):
      arm64: dts: rockchip: Add idle cooling devices to rk3399

David Heidelberg (17):
      ARM: dts: qcom: apq8064: Convert adreno from legacy
gpu-pwrlevels to opp-v2
      ARM: dts: qcom: apq8064: adjust memory node according to specs
      ARM: dts: qcom: fill secondary compatible for multiple boards
      dt-bindings: arm: qcom, add missing devices
      ARM: tegra: acer-a500: Correct compatible of ak8975 magnetometer
      ARM: tegra: Remove unused backlight-boot-off property
      arm64: tegra: Remove unused backlight-boot-off property
      ARM: dts: qcom: mdm9615: fix memory node for Sierra Wireless WP8548
      dt-bindings: arm: qcom-ipq4019: add missing device compatible
      ARM: dts: ipq4019-ap.dk01.1-c1: add device compatible in the dts
      dt-bindings: arm: qcom: Fix Nexus 4 vendor prefix
      ARM: dts: qcom: fix memory and mdio nodes naming for RB3011
      ARM: dts: qcom: correct mmc node naming
      ARM: dts: qcom: fix flash node naming for RB3011
      ARM: dts: qcom: fix thermal zones naming
      arm64: dts: qcom: sdm845-oneplus: remove devinfo-size from ramoops no=
de
      ARM: dts: qcom: fix typo in IPQ8064 thermal-sensor node

Dennis Gilmore (3):
      arm64: dts: rockchip: set stdout-path on helios64
      arm64: dts: rockchip: add SPI support to helios64
      arm64: dts: rockchip: enable tsadc on helios64

Dmitry Baryshkov (23):
      arm64: dts: qcom: pm8150: use qcom,pm8998-pon binding
      arm64: dts: qcom: pm8150: specify reboot mode magics
      arm64: dts: qcom: qrb5165-rb5: enabled pwrkey and resin nodes
      arm64: dts: qcom: sm8250: remove mmcx regulator
      ARM: dts: qcom-apq8064: stop using legacy clock names for HDMI
      arm64: dts: qcom: pm8916: fix mpps device tree node
      arm64: dts: qcom: pm8994: fix mpps device tree node
      arm64: dts: qcom: apq8016-sbc: fix mpps state names
      arm64: dts: qcom: pm8916: add interrupt controller properties
      arm64: dts: qcom: pm8994: add interrupt controller properties
      ARM: dts: qcom-apq8064: add gpio-ranges to mpps nodes
      ARM: dts: qcom-msm8660: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pm8841: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pm8941: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pma8084: add gpio-ranges to mpps nodes
      ARM: dts: qcom-mdm9615: add gpio-ranges to mpps node, fix its name
      ARM: dts: qcom-apq8060-dragonboard: fix mpps state names
      ARM: dts: qcom-apq8064: add interrupt controller properties
      ARM: dts: qcom-mdm9615: add interrupt controller properties
      ARM: dts: qcom-msm8660: add interrupt controller properties
      ARM: dts: qcom-pm8841: add interrupt controller properties
      ARM: dts: qcom-pm8941: add interrupt controller properties
      ARM: dts: qcom-pma8084: add interrupt controller properties

Dmitry Osipenko (4):
      ARM: tegra: Update Broadcom Bluetooth device-tree nodes
      ARM: tegra: Add new properties to USB PHY device-tree nodes
      ARM: tegra: nexus7: Enable USB OTG mode
      arm64: tegra: Add new USB PHY properties on Tegra132

Dongjin Kim (1):
      arm64: dts: meson: sm1: add Ethernet PHY reset line for ODROID-C4/HC4

Douglas Anderson (4):
      arm64: dts: qcom: sc7180: Base dynamic CPU power coefficients in real=
ity
      arm64: dts: qcom: sc7280: Move the SD CD GPIO pin out of the dtsi fil=
e
      arm64: dts: qcom: sc7180: Base homestar's power coefficients in reali=
ty
      arm64: dts: qcom: pmk8350: Make RTC disabled by default; enable
on sc7280-idp

Drew Fustini (1):
      ARM: dts: am335x-pocketbeagle: switch to pinconf-single

Duc Nguyen (2):
      arm64: dts: renesas: r8a779a0: Add TPU device node
      arm64: dts: renesas: r8a779a0: Add RPC node

Durai Manickam KR (2):
      ARM: dts: at91-sama5d27_som1_ek: Added I2C bus recovery support
      ARM: dts: at91-sama5d2_icp.dts: Added I2C bus recovery support

Eddie James (10):
      ARM: dts: aspeed: rainier: Add system LEDs
      ARM: dts: aspeed: everest: Add I2C bus 15 muxes
      ARM: dts: aspeed: Add ADC for AST2600 and enable for Rainier and Ever=
est
      ARM: dts: aspeed: p10bmc: Fix ADC iio-hwmon battery node name
      ARM: dts: aspeed: rainier and everest: Remove PCA gpio specification
      ARM: dts: aspeed: everest: Add I2C switch on bus 8
      ARM: dts: aspeed: everest: Add IBM Operation Panel I2C device
      ARM: dts: aspeed: everest: Fix bus 15 muxed eeproms
      ARM: dts: aspeed: rainier: Add eeprom on bus 12
      ARM: dts: aspeed: rainier: Remove gpio hog for GPIOP7

Enric Balletbo i Serra (5):
      arm64: dts: mediatek: Move reset controller constants into common loc=
ation
      dt-bindings: mediatek: Add #reset-cells to mmsys system controller
      dt-bindings: display: mediatek: add dsi reset optional property
      arm64: dts: mt8173: Add the mmsys reset bit to reset the dsi0
      arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0

Eugen Hristev (4):
      ARM: dts: at91: sama5d27_wlsom1: add wifi device
      ARM: dts: at91: sama7g5: add node for the ADC
      ARM: dts: at91: sama7g5ek: enable ADC on the board
      ARM: dts: at91: sama7g5: add rtc node

Fabio Estevam (11):
      arm64: dts: imx8mm-kontron-n801x-som: Fix the SPI chipselect polarity
      arm64: dts: imx8mm-venice: Fix the SPI chipselect polarity
      ARM: dts: imx6dl-alti6p: Fix the SPI chipselect polarity
      ARM: dts: imx6qp-prtwd3: Fix the SPI chipselect polarity
      ARM: dts: imx6qdl-tqma6: Fix the SPI chipselect polarity
      ARM: dts: imx7d-sdb: Fix the SPI chipselect polarity
      arm64: dts: qcom: sm6125: Remove leading zeroes
      ARM: dts: imx6qdl-apalis: Avoid underscore in node name
      ARM: dts: imx6qdl-apalis: Pass 'io-channel-cells' to the ADC
      ARM: dts: imx6qdl-apalis: Add a label for the touchscreen
      ARM: dts: imx6qdl-apalis: Fix typo in ADC comment

Fabrice Gasnier (1):
      ARM: dts: stm32: fix STUSB1600 Type-C irq level on stm32mp15xx-dkx

Florian Fainelli (2):
      Merge tag 'tags/bcm2835-dt-next-2021-10-06' into devicetree/next
      Merge tag 'tags/bcm2835-dt-fixes-2021-10-06' into devicetree/fixes

Frank Wunderlich (1):
      arm: dts: mt7623: add otg nodes for bpi-r2

Frieder Schrempf (3):
      arm64: dts: imx8mm: Add GPU nodes for 2D and 3D core
      arm64: dts: imx8mm-kontron: Fix reset delays for ethernet PHY
      arm64: dts: imx8mm-kontron: Add support for ultra high speed
modes on SD card

Geert Uytterhoeven (27):
      dt-bindings: arm: renesas: Document more R-Car Gen3e Socs and boards
      ARM: dts: rza2mevb: Add I2C EEPROM support
      arm64: dts: renesas: Factor out Draak board support
      arm64: dts: renesas: Factor out Ebisu board support
      arm64: dts: renesas: Add Renesas R8A779M0 SoC support
      arm64: dts: renesas: Add Renesas R8A779M2 SoC support
      arm64: dts: renesas: Add Renesas R8A779M4 SoC support
      arm64: dts: renesas: Add Renesas R8A779M5 SoC support
      arm64: dts: renesas: Add Renesas R8A779M6 SoC support
      arm64: dts: renesas: Add Renesas R8A779M7 SoC support
      arm64: dts: renesas: Add Renesas R8A779M8 SoC support
      arm64: dts: renesas: Add support for Salvator-XS with R-Car M3Ne-2G
      ARM: dts: renesas: Fix SMSC Ethernet compatible values
      arm64: dts: renesas: beacon: Fix Ethernet PHY mode
      ARM: dts: renesas: Add compatible properties to KSZ8041 Ethernet PHYs
      ARM: dts: renesas: Add compatible properties to KSZ8081 Ethernet PHYs
      ARM: dts: renesas: Add compatible properties to KSZ9031 Ethernet PHYs
      ARM: dts: renesas: Add compatible properties to LAN8710A Ethernet PHY=
s
      ARM: dts: renesas: Add compatible properties to RTL8201FL Ethernet PH=
Ys
      ARM: dts: renesas: Add compatible properties to uPD6061x Ethernet PHY=
s
      arm64: dts: renesas: Add compatible properties to AR8031 Ethernet PHY=
s
      arm64: dts: renesas: Add compatible properties to KSZ9031 Ethernet PH=
Ys
      arm64: dts: renesas: Add compatible properties to RTL8211E Ethernet P=
HYs
      ARM: dts: r-mobile: Add missing Ethernet PHY resets
      ARM: dts: rzg1: Add missing Ethernet PHY resets
      arm64: dts: renesas: rcar-gen3: Add missing Ethernet PHY resets
      arm64: dts: renesas: rcar-gen3e: Add Cortex-A57 2 GHz opps

George Liu (1):
      ARM: dts: fp5280g2: Enable KCS 3 for MCTP binding

Gowtham Tammana (1):
      ARM: dts: dra7: add entry for bb2d module

Grzegorz Szymaszek (1):
      ARM: dts: stm32: set the DCMI pins on stm32mp157c-odyssey

Guido G=C3=BCnther (1):
      arm64: dts: imx8mq-librem5: wire up the wifi regulator

Hari Prasath (1):
      ARM: at91: dts: sama5d29: Add dtsi file for sama5d29

Heiko Stuebner (8):
      arm64: dts: rockchip: add csi-dphy to px30
      arm64: dts: rockchip: add #phy-cells to mipi-dsi1 on rk3399
      arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
      arm64: dts: rockchip: add isp1 node on rk3399
      arm64: dts: rockchip: add isp node for px30
      arm64: dts: rockchip: hook up camera on px30-evb
      dt-bindings: arm: rockchip: add rk3368 compatible string to pmu.yaml
      arm64: dts: rockchip: add powerdomains to rk3368

Isaac Kurth (2):
      ARM: dts: everest: Add 'factory-reset-toggle' as GPIOF6
      ARM: dts: aspeed: rainier: Add 'factory-reset-toggle' as GPIOF6

J.R. Divya Antony (4):
      arm64: dts: qcom: msm8916-asus-z00l: Add sensors
      arm64: dts: qcom: msm8916-asus-z00l: Add touchscreen
      arm64: dts: qcom: msm8916-asus-z00l: Add SDCard
      arm64: dts: qcom: msm8916-asus-z00l: Add sensors

Jakob Unterwurzacher (3):
      arm64: dts: rockchip: fix LDO_REG4 / LDO_REG7 confusion on rk3368-lio=
n
      arm64: dts: rockchip: define iodomains for rk3368-lion
      arm64: dts: rockchip: add phandles to muxed i2c buses on rk3368-lion

Jan Kiszka (6):
      arm64: dts: ti: iot2050: Flip mmc device ordering on Advanced devices
      arm64: dts: ti: iot2050: Disable SR2.0-only PRUs
      arm64: dts: ti: iot2050: Add/enabled mailboxes and carve-outs
for R5F cores
      dt-bindings: arm: ti: Add bindings for Siemens IOT2050 PG2 boards
      arm64: dts: ti: iot2050: Prepare for adding 2nd-generation boards
      arm64: dts: ti: iot2050: Add support for product generation 2 boards

Jernej Skrabec (3):
      dt-bindings: sound: sun4i-i2s: add Allwinner R40 I2S compatible
      ARM: dts: sun8i: r40: Add I2S nodes
      arm64: dts: allwinner: a64: Add GPU opp table

Joel Stanley (3):
      ARM: dts: aspeed: p10bmc: Define secure boot gpio
      ARM: dts: aspeed: rainier: Add front panel LEDs
      ARM: dts: aspeed: rainier: Enable earlycon

Johan Jonker (13):
      arm64: dts: rockchip: remove interrupt-names from iommu nodes
      arm64: dts: rockchip: rename flash nodenames
      arm64: dts: rockchip: remove clock_in_out from gmac2phy node in
rk3318-a95x-z2.dts
      arm64: dts: rockchip: remove ddc-i2c-scl-* properties from
rk3318-a95x-z2.dts
      ARM: dts: rockchip: add adc-keys node to rk3066a-mk808
      ARM: dts: rockchip: change rv1108 gmac nodename
      ARM: dts: rockchip: rename opp-table node names
      ARM: dts: rockchip: add more angle brackets to operating-points
property on rk3066a
      ARM: dts: rockchip: swap timer clock-names
      ARM: dts: rockchip: change gpio nodenames
      arm64: dts: rockchip: change gpio nodenames
      arm64: dts: rockchip: fix resets in tsadc node for rk356x
      ARM: dts: rockchip: remove usb-phy fallback string from rk3066a/rk318=
8

John Wang (1):
      ARM: dts: aspeed: fp5280g2: Use the 64M layout

Kansho Nishida (2):
      arm64: dts: mt8183: add audio node
      arm64: dts: mt8183: add kukui platform audio node

Kathiravan T (1):
      arm64: dts: qcom: ipq6018: add usb3 DT description

Kieran Bingham (1):
      arm64: dts: renesas: r8a779a0: falcon-cpu: Add SW47-SW49 support

Kishon Vijay Abraham I (6):
      arm64: dts: ti: k3-j721e-main: Fix "max-virtual-functions" in
PCIe EP nodes
      arm64: dts: ti: k3-j721e-main: Fix "bus-range" upto 256 bus
number for PCIe
      arm64: dts: ti: j7200-main: Fix "vendor-id"/"device-id"
properties of pcie node
      arm64: dts: ti: j7200-main: Fix "bus-range" upto 256 bus number for P=
CIe
      arm64: dts: ti: j7200-main: Add *max-virtual-functions* for
pcie-ep DT node
      arm64: dts: ti: k3-am65-main: Cleanup "ranges" property in "pcie" DT =
node

Konrad Dybcio (22):
      dt-bindings: arm: cpus: Add Kryo 560 CPUs
      arm64: dts: qcom: Add SM6350 device tree
      arm64: dts: qcom: sm6350: Add LLCC node
      arm64: dts: qcom: sm6350: Add RPMHCC node
      arm64: dts: qcom: sm6350: Add GCC node
      arm64: dts: qcom: sm6350: Add TLMM block node
      arm64: dts: qcom: sm6350: Add USB1 nodes
      arm64: dts: qcom: sm6350: Add cpufreq-hw support
      arm64: dts: qcom: sm6350: Add TSENS nodes
      arm64: dts: qcom: sm6350: Add AOSS_QMP
      arm64: dts: qcom: sm6350: Add SPMI bus
      arm64: dts: qcom: sm6350: Add PRNG node
      arm64: dts: qcom: sm6350: Add RPMHPD and BCM voter
      arm64: dts: qcom: sm6350: Add SDHCI1/2 nodes
      arm64: dts: qcom: sm6350: Add apps_smmu and assign iommus prop to USB=
1
      arm64: dts: qcom: sm6350: Add device tree for Sony Xperia 10 III
      arm64: dts: qcom: pm6150l: Add missing include
      arm64: dts: qcom: sdm845: Add XO clock to SDHCI
      arm64: dts: qcom: sdm845: Disable Adreno, modem and Venus by default
      arm64: dts: qcom: sdm845: Don't disable MDP explicitly
      arm64: dts: qcom: sdm845: Add size/address-cells to dsi[01]
      arm64: dts: qcom: sdm845: Move gpio.h inclusion to SoC DTSI

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Add FRU EEPROM

Krzysztof Kozlowski (14):
      arm64: dts: exynos: align operating-points table name with
dtschema in Exynos5433
      arm64: dts: exynos: add proper comaptible FSYS syscon in Exynos5433
      ARM: dts: exynos: drop undocumented samsung,sata-freq property
in Exynos5250
      arm64: dts: rockchip: align operating-points table name with dtschema
      arm64: dts: hisilicon: align operating-points table name with dtschem=
a
      arm64: dts: freescale: imx8mq-librem5: align operating-points
table name with dtschema
      ARM: dts: exynos: remove unneeded DVS voltages from PMIC on Arndale
      ARM: dts: exynos: use spaces instead of tabs around '=3D'
      ARM: dts: imx6dl-b1x5v2: drop unsupported vcc-supply for MPL3115A2
      ARM: dts: imx6dl-prtrvt: drop undocumented TRF7970A NFC properties
      arm64: dts: exynos: add 'chassis-type' property
      ARM: dts: exynos: add 'chassis-type' property
      ARM: dts: s5pv210: add 'chassis-type' property
      arm64: dts: qcom: msm8996: move clock-frequency from PN547 NFC to I2C=
 bus

Kuldeep Singh (2):
      arm64: dts: imx8mp: Reorder flexspi clock-names entry
      arm64: dts: ls1012a: Add serial alias for ls1012a-rdb

Kuogee Hsieh (1):
      arm64: dts: qcom: sc7280: fix display port phy reg property

Lad Prabhakar (5):
      arm64: dts: renesas: rzg2l-smarc: Add scif0 pins
      arm64: dts: renesas: rzg2l-smarc-som: Move extal and memory
nodes to SOM DTSI
      arm64: dts: renesas: rzg2l-smarc-som: Enable ADC on SMARC platform
      arm64: dts: renesas: rzg2l-smarc: Enable CANFD
      arm64: dts: renesas: r9a07g044: Add SPI Multi I/O Bus controller node

Levin Du (4):
      dt-bindings: add doc for Firefly ROC-RK3328-PC
      arm64: dts: rockchip: add support for Firefly ROC-RK3328-PC
      dt-bindings: add doc for Firefly ROC-RK3399-PC-PLUS
      arm64: dts: rockchip: add support for Firefly ROC-RK3399-PC-PLUS

Li Yang (17):
      dt-bindings: arm: fsl: add ls1021a-tsn board
      ARM: dts: ls1021a: remove clock-names property for i2c nodes
      ARM: dts: ls1021a: change dma channels order to match schema
      ARM: dts: ls1021a: change to use SPDX identifiers
      ARM: dts: ls1021a-qds: Add node for QSPI flash
      ARM: dts: ls1021a: update pcie nodes for dt-schema check
      ARM: dts: ls1021a: fix board compatible to follow binding schema
      ARM: dts: ls1021a: breakup long values in thermal node
      ARM: dts: ls1021a: disable ifc node by default
      ARM: dts: ls1021a: remove regulators simple-bus
      ARM: dts: ls1021a: fix memory node for schema check
      ARM: dts: ls1021a: add #dma-cells to qdma node
      ARM: dts: ls1021a: add #power-domain-cells for power-controller node
      ARM: dts: ls1021a-qds: change fpga to simple-mfd device
      ARM: dts: ls1021a-tsn: remove undocumented property "position"
from mma8452 node
      ARM: dts: ls1021a: move thermal-zones node out of soc/
      ARM: dts: ls1021a-tsn: use generic "jedec,spi-nor" compatible for fla=
sh

Liang Chen (4):
      dt-bindings: arm: rockchip: add rk3568 compatible string to pmu.yaml
      arm64: dts: rockchip: add pmu and qos nodes for rk3568
      arm64: dts: rockchip: add watchdog to rk3568
      arm64: dts: rockchip: add pwm nodes for rk3568

Lin.TommySC =E6=9E=97=E4=B8=96=E6=AC=BD TAO (1):
      ARM: dts: aspeed: Adding Inventec Transformers BMC

Linus Walleij (6):
      ARM: dts: Add PTP timesource to the IXP456x
      ARM: dts: ux500: Tag Janice display SPI correct
      ARM: dts: ux500: Skomer regulator fixes
      ARM: dts: ux500: Fix up SD card pin config
      ARM: dts: ux500: Skomer eMMC needs 300 ms power on
      ARM: dts: ux500: Switch battery nodes to standard

Luca Weiss (13):
      ARM: dts: qcom: msm8226: Add more SoC bits
      ARM: dts: qcom: Add pm8226 PMIC
      dt-bindings: arm: qcom: Document APQ8026 SoC binding
      ARM: dts: qcom: Add support for LG G Watch R
      dt-bindings: arm: Add MT6589 Fairphone 1
      arm64: dts: qcom: Add PM6350 PMIC
      arm64: dts: qcom: sm6350: add debug uart
      dt-bindings: arm: cpus: Add Kryo 570 CPUs
      dt-bindings: arm: qcom: Document sm7225 and fairphone,fp4 board
      arm64: dts: qcom: Add SM7225 device tree
      arm64: dts: qcom: sm7225: Add device tree for Fairphone 4
      dt-bindings: arm: qcom: rename vendor of apq8026-lenok
      ARM: dts: qcom: apq8026-lg-lenok: rename board vendor

Lucas Stach (10):
      arm64: dts: imx8mq-reform2: add uSDHC2 CD pinctrl
      arm64: dts: zii-ultra: add PCIe PHY supply
      dt-bindings: soc: add binding for i.MX8MM VPU blk-ctrl
      dt-bindings: power: imx8mm: add defines for VPU blk-ctrl domains
      dt-bindings: soc: add binding for i.MX8MM DISP blk-ctrl
      dt-bindings: power: imx8mm: add defines for DISP blk-ctrl domains
      arm64: dts: imx8mm: add GPC node
      arm64: dts: imx8mm: put USB controllers into power-domains
      arm64: dts: imx8mm: add VPU blk-ctrl
      arm64: dts: imx8mm: add DISP blk-ctrl

Manaf Meethalavalappu Pallikunhi (1):
      arm64: dts: qcom: sc7280: Add gpu thermal zone cooling support

Marc Zyngier (3):
      arm64: dts: apple: t8103: Add PCIe DARTs
      arm64: dts: apple: t8103: Add root port interrupt routing
      arm64: dts: apple: j274: Expose PCI node for the Ethernet MAC address

Marcel Ziswiler (3):
      dt-bindings: arm: fsl: clean-up all toradex boards/modules
      dt-bindings: arm: fsl: add toradex,colibri-imx6ull-emmc
      ARM: dts: mvebu: add device tree for netgear gs110emx switch

Marek Vasut (1):
      ARM: dts: stm32: Reduce DHCOR SPI NOR frequency to 50 MHz

Marijn Suijten (7):
      arm64: dts: qcom: msm8998: Provide missing "xo" and "sleep_clk" to GC=
C
      ARM: dts: qcom: msm8974: Add xo_board reference clock to DSI0 PHY
      arm64: dts: qcom: sm6125: Improve indentation of multiline properties
      arm64: dts: qcom: pmi8994: Fix "eternal"->"external" typo in WLED nod=
e
      arm64: dts: qcom: pmi8994: Remove hardcoded linear WLED enabled-strin=
gs
      arm64: dts: qcom: Move WLED num-strings from pmi8994 to sony-xperia-t=
one
      arm64: dts: qcom: pm660l: Remove board-specific WLED configuration

Mark Kettenis (2):
      arm64: apple: Add pinctrl nodes
      arm64: apple: Add PCIe node

Martin Kepplinger (1):
      arm64: dts: imx8mq-librem5: add reset gpio to mantix panel descriptio=
n

Mateusz Kwiatkowski (1):
      ARM: dts: bcm283x: Fix VEC address for BCM2711

Matthew Hagan (16):
      ARM: dts: NSP: add device names to compatible
      dt-bindings: arm: bcm: add NSP devices to SoCs
      ARM: dts: NSP: enable DMA on bcm988312hr
      ARM: dts: NSP: disable qspi node by default
      ARM: dts: NSP: add MDIO bus controller node
      ARM: dts: NSP: Move USB3 PHY to internal MDIO bus
      dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
      ARM: dts: NSP: Add common bindings for MX64/MX65
      ARM: dts: NSP: Add Ax stepping modifications
      ARM: dts: NSP: Add DT files for Meraki MX64 series
      ARM: dts: NSP: Add DT files for Meraki MX65 series
      ARM: dts: NSP: Add bcm958623hr board name to dts
      ARM: dts: NSP: Fix mpcore, mmc node names
      ARM: dts: NSP: Fix MDIO mux node names
      ARM: dts: NSP: Fix MX64/MX65 eeprom node name
      ARM: dts: NSP: Fix MX65 MDIO mux warnings

Matthias Brugger (1):
      arm64: dts: rockchip: Disable CDN DP on Pinebook Pro

Matthias Kaehlcke (3):
      arm64: dts: qcom: sc7180-trogdor: Delete ADC config for unused thermi=
stors
      arm64: dts: qcom: Add sc7180-trogdor-homestar
      arm64: dts: qcom: sc7280: Add Herobrine

Matthias Schiffer (3):
      ARM: dts: imx7-tqma7/mba7: correct spelling of "TQ-Systems"
      ARM: dts: imx7-tqma7: add SPI-NOR flash
      ARM: dts: imx7-mba7: add default SPI-NOR flash partition layout

Maulik Shah (2):
      arm64: dts: qcom: Enable RPMh Sleep stats
      arm64: dts: qcom: Enable RPM Sleep stats

Mauro Carvalho Chehab (3):
      arm64: dts: hisilicon: Add support for Hikey 970 PMIC
      arm64: tegra: Fix pcie-ep DT nodes
      dt-bindings: PCI: tegra194: Fix PCIe endpoint node names

Max Krummenacher (1):
      ARM: dts: colibri-imx6ull-emmc: add device tree

Maxime Ripard (16):
      dt-bindings: sunxi: Add CPU Configuration Controller Binding
      dt-bindings: sunxi: Add Allwinner A80 PRCM Binding
      ARM: dts: sunxi: Rename power-supply names
      ARM: dts: sunxi: Rename gpio pinctrl names
      ARM: dts: sunxi: Fix OPP arrays
      ARM: dts: sunxi: Fix OPPs node name
      ARM: dts: sunxi: Fix the SPI NOR node names
      ARM: dts: tbs711: Fix touchscreen compatible
      ARM: dts: cubieboard4: Remove the dumb-vga-dac compatible
      arm64: dts: allwinner: h5: Fix GPU thermal zone node name
      arm64: dts: allwinner: h6: Fix de3 parent clocks ordering
      arm64: dts: allwinner: a100: Fix thermal zone node name
      arm64: dts: allwinner: pinetab: Change regulator node name to
avoid warning
      arm64: dts: allwinner: teres-i: Add missing reg
      arm64: dts: allwinner: teres-i: Remove wakekup-source from the PMIC
      dt-bindings: interconnect: sunxi: Add R40 MBUS compatible

Michael Riesch (9):
      arm64: dts: rockchip: add gmac0 node to rk3568
      arm64: dts: rockchip: rk3568-evb1-v10: add ethernet support
      arm64: dts: rockchip: add core io domains node for rk356x
      arm64: dts: rockchip: enable io domains on rk3568-evb1-v10
      arm64: dts: rockchip: add regulators of rk809 pmic to rk3568-evb1-v10
      arm64: dts: rockchip: add node for sd card to rk3568-evb1-v10
      arm64: dts: rockchip: add pinctrl and alias to emmc node to
rk3568-evb1-v10
      arm64: dts: rockchip: add missing rockchip,grf property to rk356x
      arm64: dts: rockchip: add saradc to rk3568-evb1-v10

Michael Walle (8):
      arm64: dts: hisilicon: fix arm,sp805 compatible string
      arm64: dts: freescale: fix arm,sp805 compatible string
      arm64: dts: ls1028a: move pixel clock pll into /soc
      arm64: dts: ls1028a: move Mali DP500 node into /soc
      arm64: dts: ls1028a: add Vivante GPU node
      arm64: dts: ls1028a: disable usb controller by default
      arm64: dts: ls1028a: move PHY nodes to MDIO controller
      arm64: dts: ls1028a: use phy-mode instead of phy-connection-type

Michal Simek (33):
      arm64: zynqmp: Disable CCI by default
      arm64: zynqmp: Enable fpd_dma for zcu104 platforms
      arm64: zynqmp: Fix irps5401 device nodes
      arm64: zynqmp: Add pinctrl description for all boards
      arm64: zynqmp: Correct zcu111 psgtr description
      arm64: zynqmp: Wire psgtr for zc1751-xm015
      arm64: zynqmp: Correct psgtr description for zcu100-revC
      arm64: zynqmp: Add phy description for usb3.0
      arm64: zynqmp: Disable WP on zcu111
      arm64: zynqmp: Add missing mio-bank properties to dc1 and dc5
      arm64: zynqmp: Wire DP and DPDMA for dc1/dc4
      arm64: zynqmp: Enable nand driver for dc2 and dc3
      arm64: zynqmp: Remove additional newline
      arm64: zynqmp: Move clock node to zynqmp-clk-ccf.dtsi
      arm64: zynqmp: Add nvmem alises for eeproms
      arm64: zynqmp: List reset property for ethernet phy
      arm64: zynqmp: Remove can aliases from zc1751
      arm64: zynqmp: Move DP nodes to the end of file on zcu106
      arm64: zynqmp: Add note about UHS mode on some boards
      arm64: zynqmp: Remove information about dma clock on zcu106
      arm64: zynqmp: Wire qspi on multiple boards
      arm64: zynqmp: Move rtc to different location on zcu104-revA
      arm64: zynqmp: Add reset description for sata
      arm64: zynqmp: Sync psgtr node location with zcu104-revA
      arm64: zynqmp: Remove description for 8T49N287 and si5382 chips
      arm64: zynqmp: Add support for zcu102-rev1.1 board
      arm64: zynqmp: Add psgtr description to zc1751 dc1 board
      arm64: zynqmp: Remove not documented is-dual property
      arm64: zynqmp: Fix serial compatible string
      arm64: zynqmp: Enable gpio and qspi for zc1275-revA
      arm64: zynqmp: Enable xlnx,zynqmp-dwc3 driver for xilinx boards
      arm64: zynqmp: Wire psgtr for zc1751-xm013
      arm64: zynqmp: Add support for Xilinx Kria SOM board

Michal Vok=C3=A1=C4=8D (2):
      ARM: dts: imx6dl-yapp4: Fix lp5562 LED driver probe
      ARM: dts: imx6dl-yapp4: Remove the unused white LED channel

Mikko Perttunen (2):
      dt-bindings: Add YAML bindings for NVDEC
      arm64: tegra: Add NVDEC to Tegra186/194 device trees

Mounika Grace Akula (1):
      arm64: zynqmp: Add reset-on-timeout to all boards and modify
default timeout value

Nicolas Frattaroli (3):
      arm64: dts: rockchip: enable spdif on Quartz64 A
      arm64: dts: rockchip: Add i2s1 on rk356x
      arm64: dts: rockchip: Add analog audio on Quartz64

Nicolas Saenz Julienne (2):
      ARM: dts: bcm2711-rpi-4-b: Fix pcie0's unit address formatting
      ARM: dts: bcm2711-rpi-4-b: Fix usb's unit address

Niklas S=C3=B6derlund (3):
      arm64: dts: renesas: r8a779a0: Add and connect all CSI-2, ISP
and VIN nodes
      arm64: dts: renesas: Add ports node to all adv7482 nodes
      mailmap: Fix text encoding for Niklas S=C3=B6derlund

Nishanth Menon (6):
      arm64: dts: ti: ti-k3*: Introduce aliases for mmc nodes
      arm64: dts: ti: k3-am65: Relocate thermal-zones to SoC specific locat=
ion
      arm64: dts: ti: Makefile: Collate AM64 platforms together
      dt-bindings: arm: ti: Add missing compatibles for j721e/j7200 evms
      arm64: dts: ti: k3-j721e-common-proc-board: Add j721e-evm compatible
      arm64: dts: ti: k3-j7200-common-proc-board: Add j7200-evm compatible

Nobuhiro Iwamatsu (1):
      arm64: dts: visconti: Add PCIe host controller support for TMPV7708 S=
oC

Ola Jeppsson (1):
      arm64: dts: qcom: sm8350: Add fastrpc nodes

Oleksij Rempel (1):
      ARM: dts: imx6: skov: provide panel support for lt2 variants

Olivier Moysan (2):
      ARM: dts: stm32: fix SAI sub nodes register range
      ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15

Oskar Senft (1):
      ARM: dts: aspeed: Add TYAN S7106 BMC machine

Owen Kirby (1):
      ARM: dts: at91: add Exegin Q5xR5 board

Paul Kocialkowski (1):
      arm64: dts: rockchip: Add VPU support for the PX30

Pawe=C5=82 Anikiel (1):
      dts: socfpga: Add Mercury+ AA1 devicetree

Peter Geis (13):
      arm64: dts: rockchip: move rk3568 dtsi to rk356x dtsi
      arm64: dts: rockchip: split rk3568 device tree
      arm64: dts: rockchip: add rk3566 dtsi
      arm64: dts: rockchip: add basic dts for Pine64 Quartz64-A
      arm64: dts: rockchip: fix rk3568 mbi-alias
      arm64: dts: rockchip: add rk356x gmac1 node
      arm64: dts: rockchip: adjust rk3568 pll clocks
      arm64: dts: rockchip: enable gmac node on quartz64-a
      arm64: dts: rockchip: add thermal fan control to rockpro64
      arm64: dts: rockchip: add rk356x gpio debounce clocks
      arm64: dts: rockchip: add rk3568 tsadc nodes
      arm64: dts: rockchip: add thermal support to Quartz64 Model A
      arm64: dts: rockchip: add spdif node to rk356x

Peter Rosin (1):
      ARM: dts: at91: tse850: the emac<->phy interface is rmii

Philip Chen (2):
      arm64: dts: sc7180: Factor out ti-sn65dsi86 support
      arm64: dts: sc7180: Support Parade ps8640 edp bridge

Prasad Malisetty (2):
      arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes
      arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board

Quan Nguyen (1):
      ARM: dts: aspeed: mtjade: Add some gpios

Rafa=C5=82 Mi=C5=82ecki (9):
      ARM: dts: BCM5301X: Fix nodes names
      ARM: dts: BCM5301X: Fix MDIO mux binding
      ARM: dts: BCM5301X: Fix memory nodes names
      ARM: dts: BCM5301X: Specify switch ports for more devices
      arm64: dts: broadcom: bcm4908: Fix NAND node name
      arm64: dts: broadcom: bcm4908: Move reboot syscon out of bus
      arm64: dts: broadcom: bcm4908: Fix UART clock name
      ARM: dts: BCM53573: Describe on-SoC BCM53125 rev 4 switch
      ARM: dts: BCM53573: Add Tenda AC9 switch ports

Raffaele Tranquillini (2):
      arm64: dts: qcom: msm8996: xiaomi-gemini: Add support for Xiaomi Mi 5
      arm64: dts: qcom: msm8996: xiaomi-gemini: Enable JDI LCD panel

Rajendra Nayak (2):
      arm64: dts: qcom: sc7280-idp: Add vcc-supply for qfprom
      arm64: dts: qcom: sc7280: Define CPU topology

Rajesh Patil (5):
      arm64: dts: qcom: sc7280: Configure SPI-NOR FLASH for sc7280-idp
      arm64: dts: qcom: sc7280: Configure uart7 to support bluetooth
on sc7280-idp
      arm64: dts: qcom: sc7280: Add aliases for I2C and SPI
      arm64: dts: qcom: sc7180: Add qspi compatible
      arm64: dts: qcom: sc7280: Add 200MHz in qspi_opp_table

Richard Zhu (2):
      ARM: dts: imx: fix the schema check errors
      arm64: dts: imx8mq: fix the schema check errors

Rob Herring (7):
      arm64: dts: freescale: Fix 'interrupt-map' parent address cells
      ARM: dts: ixp4xx: Group PCI interrupt properties together
      ARM: dts: gemini: Consolidate PCI interrupt-map properties
      ARM: dts: spear13xx: Drop malformed 'interrupt-map' on PCI nodes
      arm64: dts: qcom: Fix 'interrupt-map' parent address cells
      ARM: dts: arm: Update register-bit-led nodes 'reg' and node names
      ARM: dts: arm: Update ICST clock nodes 'reg' and node names

Robert Marko (3):
      arm64: dts: qcom: ipq8074: remove USB tx-fifo-resize property
      arm64: dts: qcom: ipq8074: add SPMI bus
      arm64: dts: marvell: add Globalscale MOCHAbin

Roger Quadros (8):
      dt-bindings: mtd: Remove gpmc-nor.txt
      dt-bindings: net: Remove gpmc-eth.txt
      dt-bindings: memory-controllers: Introduce ti,gpmc-child
      dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
      dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
      dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
      ARM: dts: omap: Fix boolean properties gpmc,cycle2cycle-{same|diff}cs=
en
      ARM: dts: omap: fix gpmc,mux-add-data type

Roja Rani Yarubandi (4):
      arm64: dts: qcom: sc7280: Add QSPI node
      arm64: dts: qcom: sc7280: Add QUPv3 wrapper_0 nodes
      arm64: dts: qcom: sc7280: Update QUPv3 UART5 DT node
      arm64: dts: qcom: sc7280: Add QUPv3 wrapper_1 nodes

Romain Perier (2):
      ARM: dts: mstar: Add rtc device node
      ARM: dts: mstar: Mark timer with arm,cpu-registers-not-fw-configured

Sai Prakash Ranjan (1):
      arm64: dts: qcom: sc7180: Add IMEM and pil info regions

Sameer Pujar (4):
      arm64: tegra: Audio graph sound card for Jetson TX2 NX
      arm64: tegra: Update HDA card name on Jetson TX2 NX
      arm64: tegra: Add few AHUB devices for Tegra210 and later
      arm64: tegra: Extend APE audio support on Jetson platforms

Sebastian Krzyszkowiak (2):
      arm64: dts: imx8mq-librem5: Fix led_r and led_g pinctrl assignments
      arm64: dts: imx8mq-librem5: set debounce interval of volume
buttons to 50ms

Shaik Sajida Bhanu (1):
      arm64: dts: qcom: sc7180: Use maximum drive strength values for eMMC

Shawn Guo (14):
      arm64: dts: qcom: ipq6018: Fix qcom,controlled-remotely property
      arm64: dts: qcom: ipq8074: Fix qcom,controlled-remotely property
      arm64: dts: qcom: sdm845: Fix qcom,controlled-remotely property
      arm64: dts: qcom: Update BAM DMA node name per DT schema
      arm64: dts: qcom: pm660: Add reboot mode support
      arm64: dts: qcom: sdm630-nile: Correct regulator label name
      ARM: dts: qcom: sdx55: Drop '#clock-cells' from QMP PHY node
      arm64: dts: qcom: msm8996: Move '#clock-cells' to QMP PHY child node
      arm64: dts: qcom: Correct QMP PHY child node name
      arm64: dts: qcom: Drop max-microamp and vddp-ref-clk properties
from QMP PHY
      arm64: dts: qcom: Drop reg-names from QMP PHY nodes
      arm64: dts: qcom: msm8998-clamshell: Add missing vdda supplies
      arm64: dts: qcom: Fix IPQ8074 PCIe PHY nodes
      arm64: dts: qcom: ipq8074-hk01: Add dummy supply for QMP USB3 PHY

Sibi Sankar (11):
      arm64: dts: qcom: sc7180: Use QMP property to control load state
      arm64: dts: qcom: sc7280: Use QMP property to control load state
      arm64: dts: qcom: sdm845: Use QMP property to control load state
      arm64: dts: qcom: sm8150: Use QMP property to control load state
      arm64: dts: qcom: sm8250: Use QMP property to control load state
      arm64: dts: qcom: sm8350: Use QMP property to control load state
      arm64: dts: qcom: sc7280: Update reserved memory map
      arm64: dts: qcom: sc7280: Add/Delete/Update reserved memory nodes
      arm64: dts: qcom: sc7280: Add nodes to boot modem
      arm64: dts: qcom: sc7280: Add Q6V5 MSS node
      arm64: dts: qcom: sc7280: Update Q6V5 MSS node

Simon Xue (1):
      arm64: dts: rockchip: add saradc node for rk3568

Sinthu Raja (4):
      dt-bindings: arm: ti: Add compatible for J721E SK
      arm64: dts: ti: Add support for J721E SK
      arm64: dts: ti: k3-j721e-sk: Add IPC sub-mailbox nodes
      arm64: dts: ti: k3-j721e-sk: Add DDR carveout memory nodes

Srinivas Neeli (1):
      arm64: zynqmp: Update rtc calibration value

Steev Klimaszewski (1):
      arm64: dts: qcom: c630: add second channel for wifi

Stefan Wahren (8):
      ARM: dts: bcm2711: fix MDIO #address- and #size-cells
      ARM: dts: bcm2711-rpi-4-b: fix sd_io_1v8_reg regulator states
      dt-bindings: display: bcm2835: add optional property power-domains
      ARM: dts: bcm283x-rpi: Move Wifi/BT into separate dtsi
      dt-bindings: arm: bcm2835: Add Raspberry Pi Compute Module 4
      ARM: dts: Add Raspberry Pi Compute Module 4
      ARM: dts: Add Raspberry Pi Compute Module 4 IO Board
      arm64: dts: broadcom: Add reference to RPi CM4 IO Board

Stefano Stabellini (1):
      arm64: zynqmp: Add missing SMID for pcie to zynqmp.dtsi

Stephan Gerhold (22):
      arm64: dts: qcom: msm8916: Add unit name for /soc node
      arm64: dts: qcom: msm8916: Add "qcom,msm8916-sdhci" compatible
      arm64: dts: qcom: msm8916-longcheer-l8150: Add missing sensor interru=
pts
      arm64: dts: qcom: msm8916: Fix Secondary MI2S bit clock
      arm64: dts: qcom: pm8916: Remove wrong reg-names for rtc@6000
      arm64: dts: qcom: pm8916: Add pm8941-misc extcon for USB detection
      arm64: dts: qcom: msm8916-longcheer-l8150: Use &pm8916_usbin extcon
      arm64: dts: qcom: apq8016-sbc: Clarify firmware-names
      arm64: dts: qcom: msm8916: Drop underscore in node name
      arm64: dts: qcom: Add device tree for Samsung Galaxy S4 Mini Value Ed=
ition
      arm64: dts: qcom: msm8916-samsung-serranove: Add touch screen
      arm64: dts: qcom: msm8916-samsung-serranove: Add touch key
      arm64: dts: qcom: msm8916-samsung-serranove: Add IMU
      arm64: dts: qcom: msm8916-samsung-serranove: Add rt5033 battery
      arm64: dts: qcom: msm8916-samsung-serranove: Add NFC
      ARM: qcom: Add ARCH_MSM8916 for MSM8916 on ARM32
      arm64: dts: qcom: msm8916: Add CPU ACC and SAW/SPM
      ARM: dts: qcom: msm8916: Add include for SMP without PSCI on ARM32
      ARM: dts: qcom: msm8916-samsung-serranove: Include dts from arm64
      arm64: dts: qcom: Fix node name of rpm-msg-ram device nodes
      arm64: dts: qcom: msm8916: Drop standalone smem node
      arm64: dts: qcom: Drop unneeded extra device-specific includes

Stephen Boyd (1):
      arm64: dts: qcom: sc7280: Use GIC_SPI for intc cells

Sujit Kautkar (1):
      arm64: dts: qcom: sc7180-trogdor: Enable IPA on LTE only SKUs

Suman Anna (1):
      arm64: dts: ti: k3-am64-main: Add ICSSG nodes

Sungbo Eo (1):
      arm: dts: mt7623: add musb device nodes

Taniya Das (1):
      arm64: dts: qcom: sc7280: Add clock controller ID headers

Thara Gopinath (2):
      arm64: dts: qcom: sdm845: Add support for LMh node
      arm64: dts: qcom: sdm845: Remove cpufreq cooling devices for CPU
thermal zones

Thierry Reding (2):
      ARM: tegra: Remove useless usb-ehci compatible string
      arm64: tegra: Remove useless usb-ehci compatible string

Tim Harvey (1):
      arm64: dts: imx8mm-venice-gw7901.dts: disable pgc_gpumix

Tommaso Merciai (1):
      arm64: dts: rockchip: fix PCI reg address warning on rk3399-gru

Vamsi krishna Lanka (1):
      dt-bindings: arm: qcom: Document SDX65 platform and boards

Vladimir Oltean (2):
      dt-bindings: arm: fsl: document the LX2160A BlueBox 3 boards
      arm64: dts: ls1028a: mark internal links between Felix and ENETC
as capable of flow control

Vladimir Zapolskiy (2):
      arm64: dts: qcom: msm8996: Add device tree entries to support
crypto engine
      arm64: dts: qcom: sdm845: Fix Qualcomm crypto engine bus clock

Vyacheslav Bocharov (4):
      dt-bindings: arm: amlogic: add bindings for Jethub D1/H1
      dt-bindings: vendor-prefixes: add jethome prefix
      arm64: dts: meson-gxl: add support for JetHub H1
      arm64: dts: meson-axg: add support for JetHub D1

Wasim Khan (1):
      arm64: dts: add device tree for the LX2160A on the NXP BlueBox3 board

Wolfram Sang (2):
      arm64: dts: renesas: r8a77961: Add TPU device node
      arm64: dts: renesas: falcon-cpu: Add SPI flash via RPC

Yassine Oudjana (3):
      arm64: dts: qcom: db820c: Move blsp1_uart2 pin states to msm8996.dtsi
      arm64: dts: qcom: msm8996: Add blsp2_i2c3
      arm64: dts: qcom: msm8996: Add support for the Xiaomi MSM8996 platfor=
m

Yoshihiro Shimoda (2):
      arm64: dts: renesas: r8a779a0: Add IPMMU nodes
      arm64: dts: renesas: r8a779a0: Add iommus into sdhi node

Yuji Ishikawa (3):
      arm64: dts: visconti: Add 150MHz fixed clock to TMPV7708 SoC
      dt-bindings: arm: toshiba: Add the TMPV7708 VisROBO VRB board
      arm64: dts: visconti: Add DTS for the VisROBO board

Yunus Bas (2):
      ARM: dts: imx6: phycore-som: Disable micro-SD write protection
      ARM: dts: imx6: phytec: Add gpio pinctrl for i2c bus recovery

pshete (1):
      arm64: tegra: Add additional GPIO interrupt entries on Tegra194

satya priya (1):
      arm64: dts: qcom: sc7280: Add volume up support for sc7280-idp

 .mailmap                                           |    1 +
 Documentation/devicetree/bindings/arm/amlogic.yaml |    3 +
 .../devicetree/bindings/arm/atmel-at91.yaml        |   12 +
 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |    1 +
 .../devicetree/bindings/arm/bcm/brcm,nsp.yaml      |   65 +-
 Documentation/devicetree/bindings/arm/cpus.yaml    |    2 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |   99 +-
 .../devicetree/bindings/arm/mediatek.yaml          |    1 +
 .../bindings/arm/mediatek/mediatek,mmsys.yaml      |    4 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   23 +
 Documentation/devicetree/bindings/arm/renesas.yaml |   61 +
 .../devicetree/bindings/arm/rockchip.yaml          |   48 +-
 .../devicetree/bindings/arm/rockchip/pmu.yaml      |    4 +
 .../bindings/arm/samsung/samsung-boards.yaml       |    6 +
 .../devicetree/bindings/arm/sprd/sprd.yaml         |    5 +
 .../devicetree/bindings/arm/stm32/stm32.yaml       |    4 +
 .../arm/sunxi/allwinner,sun4i-a10-mbus.yaml        |    1 +
 .../arm/sunxi/allwinner,sun6i-a31-cpuconfig.yaml   |   38 +
 .../arm/sunxi/allwinner,sun9i-a80-prcm.yaml        |   33 +
 Documentation/devicetree/bindings/arm/ti/k3.yaml   |   15 +-
 Documentation/devicetree/bindings/arm/toshiba.yaml |    1 +
 Documentation/devicetree/bindings/arm/xilinx.yaml  |   17 +
 .../bindings/display/brcm,bcm2835-dsi0.yaml        |    3 +
 .../bindings/display/brcm,bcm2835-hdmi.yaml        |    3 +
 .../bindings/display/brcm,bcm2835-v3d.yaml         |    3 +
 .../bindings/display/brcm,bcm2835-vec.yaml         |    3 +
 .../bindings/display/mediatek/mediatek,dsi.txt     |    6 +
 .../bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml |  106 +
 .../bindings/memory-controllers/omap-gpmc.txt      |  157 -
 .../bindings/memory-controllers/ti,gpmc-child.yaml |  245 ++
 .../bindings/memory-controllers/ti,gpmc.yaml       |  172 +
 .../devicetree/bindings/mtd/gpmc-nand.txt          |  147 -
 Documentation/devicetree/bindings/mtd/gpmc-nor.txt |   98 -
 .../devicetree/bindings/mtd/gpmc-onenand.txt       |   48 -
 .../devicetree/bindings/mtd/ti,gpmc-nand.yaml      |  121 +
 .../devicetree/bindings/mtd/ti,gpmc-onenand.yaml   |   81 +
 Documentation/devicetree/bindings/net/gpmc-eth.txt |   97 -
 .../bindings/pci/nvidia,tegra194-pcie.txt          |    2 +-
 .../bindings/serial/fsl,s32-linflexuart.txt        |   22 -
 .../bindings/serial/fsl,s32-linflexuart.yaml       |   48 +
 .../bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml |   94 +
 .../bindings/soc/imx/fsl,imx8mm-vpu-blk-ctrl.yaml  |   76 +
 .../bindings/sound/allwinner,sun4i-a10-i2s.yaml    |    3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   10 +
 MAINTAINERS                                        |    1 +
 arch/arm/boot/dts/Makefile                         |   26 +-
 arch/arm/boot/dts/am335x-pocketbeagle.dts          |    1 +
 arch/arm/boot/dts/arm-realview-eb.dtsi             |   42 +-
 arch/arm/boot/dts/arm-realview-pb1176.dts          |   42 +-
 arch/arm/boot/dts/arm-realview-pb11mp.dts          |   48 +-
 arch/arm/boot/dts/arm-realview-pbx.dtsi            |   42 +-
 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts  |  295 ++
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |    5 +
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |   21 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |  883 ++---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       | 1287 +++++--
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |    9 +-
 .../boot/dts/aspeed-bmc-inventec-transformers.dts  |  328 ++
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts        |  488 +++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |    6 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |    6 +
 arch/arm/boot/dts/aspeed-g6.dtsi                   |   26 +
 arch/arm/boot/dts/at91-lmu5000.dts                 |  147 +
 arch/arm/boot/dts/at91-q5xr5.dts                   |  199 ++
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi          |   12 +-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |   23 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi        |   70 +
 arch/arm/boot/dts/at91-sama5d2_icp.dts             |   22 +-
 arch/arm/boot/dts/at91-sama7g5ek.dts               |   20 +
 arch/arm/boot/dts/at91-tse850-3.dts                |    2 +-
 arch/arm/boot/dts/at91sam9260.dtsi                 |    2 +-
 arch/arm/boot/dts/axp209.dtsi                      |    6 +-
 arch/arm/boot/dts/axp22x.dtsi                      |    6 +-
 arch/arm/boot/dts/axp81x.dtsi                      |   10 +-
 arch/arm/boot/dts/bcm-nsp-ax.dtsi                  |   70 +
 arch/arm/boot/dts/bcm-nsp.dtsi                     |   52 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              |   49 +-
 arch/arm/boot/dts/bcm2711-rpi-cm4-io.dts           |  138 +
 arch/arm/boot/dts/bcm2711-rpi-cm4.dtsi             |  113 +
 arch/arm/boot/dts/bcm2711.dtsi                     |   12 +-
 arch/arm/boot/dts/bcm2835-common.dtsi              |    8 +
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts           |   31 +-
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts         |   36 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts         |   36 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |   36 +-
 arch/arm/boot/dts/bcm283x-rpi-wifi-bt.dtsi         |   34 +
 arch/arm/boot/dts/bcm283x.dtsi                     |    8 -
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts        |   39 +-
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |   37 +
 arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts        |    2 +-
 arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts  |    2 +-
 arch/arm/boot/dts/bcm4709-linksys-ea9200.dts       |    2 +-
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts        |    2 +-
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts        |   44 +-
 arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts  |    2 +-
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts       |  200 ++
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |   42 +
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    |    2 +-
 arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts      |   37 +
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts      |   37 +
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts      |    2 +-
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts           |   37 +
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts         |   35 +-
 arch/arm/boot/dts/bcm5301x.dtsi                    |   10 +-
 arch/arm/boot/dts/bcm53573.dtsi                    |   18 +
 arch/arm/boot/dts/bcm94708.dts                     |    2 +-
 arch/arm/boot/dts/bcm94709.dts                     |    2 +-
 arch/arm/boot/dts/bcm958522er.dts                  |    3 +-
 arch/arm/boot/dts/bcm958525er.dts                  |    3 +-
 arch/arm/boot/dts/bcm958525xmc.dts                 |    3 +-
 arch/arm/boot/dts/bcm958622hr.dts                  |    3 +-
 arch/arm/boot/dts/bcm958623hr.dts                  |    3 +-
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi      |  281 ++
 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi    |  163 +
 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts     |   25 +
 arch/arm/boot/dts/bcm958625-meraki-mx64.dts        |   24 +
 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts    |   33 +
 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts       |   32 +
 arch/arm/boot/dts/bcm958625-meraki-mx65.dts        |   24 +
 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts       |   32 +
 .../arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi |  129 +
 arch/arm/boot/dts/bcm958625hr.dts                  |    3 +-
 arch/arm/boot/dts/bcm958625k.dts                   |    3 +-
 arch/arm/boot/dts/bcm988312hr.dts                  |    7 +-
 arch/arm/boot/dts/dra7.dtsi                        |   19 +
 arch/arm/boot/dts/e60k02.dtsi                      |    2 +-
 arch/arm/boot/dts/e70k02.dtsi                      |  320 ++
 arch/arm/boot/dts/emev2-kzm9d.dts                  |    2 +-
 arch/arm/boot/dts/exynos3250-rinato.dts            |    1 +
 arch/arm/boot/dts/exynos4210-i9100.dts             |    1 +
 arch/arm/boot/dts/exynos4210-origen.dts            |   24 +-
 arch/arm/boot/dts/exynos4210-trats.dts             |    1 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |    1 +
 arch/arm/boot/dts/exynos4412-i9300.dts             |    1 +
 arch/arm/boot/dts/exynos4412-i9305.dts             |    1 +
 arch/arm/boot/dts/exynos4412-n710x.dts             |    1 +
 arch/arm/boot/dts/exynos4412-origen.dts            |   14 +-
 arch/arm/boot/dts/exynos4412-p4note-n8010.dts      |    1 +
 arch/arm/boot/dts/exynos4412-trats2.dts            |    1 +
 arch/arm/boot/dts/exynos5250-arndale.dts           |    3 -
 arch/arm/boot/dts/exynos5250-snow-rev5.dts         |    1 +
 arch/arm/boot/dts/exynos5250-snow.dts              |    1 +
 arch/arm/boot/dts/exynos5250-spring.dts            |    1 +
 arch/arm/boot/dts/exynos5250.dtsi                  |    1 -
 arch/arm/boot/dts/exynos5420-peach-pit.dts         |    1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts          |    1 +
 arch/arm/boot/dts/gemini-dlink-dir-685.dts         |   18 -
 arch/arm/boot/dts/gemini-ns2502.dts                |  148 +
 arch/arm/boot/dts/gemini-sl93512r.dts              |   18 -
 arch/arm/boot/dts/gemini-sq201.dts                 |   18 -
 arch/arm/boot/dts/gemini-ssi1328.dts               |  138 +
 arch/arm/boot/dts/gemini-wbd111.dts                |   18 -
 arch/arm/boot/dts/gemini-wbd222.dts                |   18 -
 arch/arm/boot/dts/gemini.dtsi                      |   33 +-
 arch/arm/boot/dts/imx6dl-alti6p.dts                |    2 +-
 arch/arm/boot/dts/imx6dl-b1x5v2.dtsi               |    1 -
 arch/arm/boot/dts/imx6dl-prtrvt.dts                |    2 -
 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts         |    1 +
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi         |   11 +-
 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts          |    1 +
 arch/arm/boot/dts/imx6qdl-apalis.dtsi              |    7 +-
 arch/arm/boot/dts/imx6qdl-phytec-mira.dtsi         |   31 +-
 arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi  |   12 +-
 arch/arm/boot/dts/imx6qdl-skov-revc-lt2.dtsi       |   99 +
 arch/arm/boot/dts/imx6qdl-tqma6.dtsi               |    2 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     |    7 +-
 arch/arm/boot/dts/imx6qp-prtwd3.dts                |    4 +-
 arch/arm/boot/dts/imx6qp.dtsi                      |    2 +-
 arch/arm/boot/dts/imx6sl-tolino-vision5.dts        |  349 ++
 arch/arm/boot/dts/imx6sl.dtsi                      |   18 +-
 arch/arm/boot/dts/imx6sll-kobo-librah2o.dts        |  339 ++
 arch/arm/boot/dts/imx6sll.dtsi                     |   22 +-
 arch/arm/boot/dts/imx6sx.dtsi                      |    6 +-
 arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi   |   12 +-
 arch/arm/boot/dts/imx6ul-phytec-segin.dtsi         |    1 +
 arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dts |   17 +
 .../arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi |  185 +
 arch/arm/boot/dts/imx6ull-colibri.dtsi             |   32 +-
 arch/arm/boot/dts/imx7-mba7.dtsi                   |   42 +-
 arch/arm/boot/dts/imx7-tqma7.dtsi                  |   47 +-
 arch/arm/boot/dts/imx7d-mba7.dts                   |    6 +-
 arch/arm/boot/dts/imx7d-sdb.dts                    |    2 +-
 arch/arm/boot/dts/imx7d-tqma7.dtsi                 |    4 +-
 arch/arm/boot/dts/imx7d.dtsi                       |    7 +-
 arch/arm/boot/dts/imx7s-mba7.dts                   |    6 +-
 arch/arm/boot/dts/imx7s-tqma7.dtsi                 |    4 +-
 arch/arm/boot/dts/integrator.dtsi                  |   23 +-
 arch/arm/boot/dts/integratorap-im-pd1.dts          |    9 +-
 arch/arm/boot/dts/integratorap.dts                 |   15 +-
 arch/arm/boot/dts/integratorcp.dts                 |    9 +-
 arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts      |    2 +
 arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts    |    2 +
 arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts  |    2 +
 arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts   |    2 +
 .../arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts |    2 +
 arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts  |    2 +
 arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts        |    2 +
 arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts   |    2 +
 arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts  |    2 +
 arch/arm/boot/dts/intel-ixp42x-netgear-wg302v2.dts |    2 +
 .../arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts |    2 +
 arch/arm/boot/dts/intel-ixp45x-ixp46x.dtsi         |    8 +
 .../boot/dts/intel-ixp4xx-reference-design.dtsi    |    2 +
 arch/arm/boot/dts/intel-ixp4xx.dtsi                |    2 -
 arch/arm/boot/dts/iwg20d-q7-common.dtsi            |    2 +
 arch/arm/boot/dts/ls1021a-qds.dts                  |   85 +-
 arch/arm/boot/dts/ls1021a-tsn.dts                  |    4 +-
 arch/arm/boot/dts/ls1021a-twr.dts                  |   63 +-
 arch/arm/boot/dts/ls1021a.dtsi                     |  219 +-
 arch/arm/boot/dts/mps2.dtsi                        |   10 +-
 arch/arm/boot/dts/mstar-v7.dtsi                    |    9 +
 arch/arm/boot/dts/mt7623.dtsi                      |   33 +
 arch/arm/boot/dts/mt7623a.dtsi                     |    4 +
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts      |   25 +
 arch/arm/boot/dts/mt7629-rfb.dts                   |    3 +-
 arch/arm/boot/dts/mt7629.dtsi                      |   45 +-
 arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi          |    4 +-
 arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi          |    2 +-
 arch/arm/boot/dts/omap-zoom-common.dtsi            |    4 +-
 arch/arm/boot/dts/omap2430-sdp.dts                 |    4 +-
 arch/arm/boot/dts/omap3-cpu-thermal.dtsi           |    2 +-
 arch/arm/boot/dts/omap3-devkit8000-common.dtsi     |    4 +-
 arch/arm/boot/dts/omap3-gta04.dtsi                 |   23 +-
 arch/arm/boot/dts/omap3-gta04a5.dts                |    2 +
 arch/arm/boot/dts/omap3-overo-tobiduo-common.dtsi  |    2 +-
 arch/arm/boot/dts/omap3-sb-t35.dtsi                |    4 +-
 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts        |  237 ++
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |   10 +-
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts |    2 +-
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts        |    6 +-
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |    6 +-
 .../arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts |    4 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                |   63 +-
 arch/arm/boot/dts/qcom-apq8084.dtsi                |    8 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dts    |    2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi      |    1 -
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts    |    2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts    |    2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts    |    2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts    |    2 +-
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts           |    2 +-
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts          |    8 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |   26 +-
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi         |    2 +-
 arch/arm/boot/dts/qcom-mdm9615.dtsi                |   16 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi                |  263 +-
 arch/arm/boot/dts/qcom-msm8660-surf.dts            |    4 +-
 arch/arm/boot/dts/qcom-msm8660.dtsi                |   27 +-
 .../boot/dts/qcom-msm8916-samsung-serranove.dts    |    3 +
 arch/arm/boot/dts/qcom-msm8916-smp.dtsi            |   62 +
 arch/arm/boot/dts/qcom-msm8960-cdp.dts             |    4 +-
 arch/arm/boot/dts/qcom-msm8960.dtsi                |    4 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |   16 +-
 arch/arm/boot/dts/qcom-pm8226.dtsi                 |   27 +
 arch/arm/boot/dts/qcom-pm8841.dtsi                 |    7 +-
 arch/arm/boot/dts/qcom-pm8941.dtsi                 |   11 +-
 arch/arm/boot/dts/qcom-pma8084.dtsi                |   11 +-
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |    1 -
 arch/arm/boot/dts/r7s72100-genmai.dts              |    2 +
 arch/arm/boot/dts/r7s72100-gr-peach.dts            |    2 +
 arch/arm/boot/dts/r7s72100-rskrza1.dts             |    2 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             |   21 +
 arch/arm/boot/dts/r8a73a4-ape6evm.dts              |    1 +
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts      |    3 +
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |    2 +
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts            |    2 +
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts             |    4 +
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts        |    2 +
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts             |    4 +
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          |    2 +
 arch/arm/boot/dts/r8a7778-bockw.dts                |    2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts               |    2 +-
 arch/arm/boot/dts/r8a7790-lager.dts                |    2 +
 arch/arm/boot/dts/r8a7790-stout.dts                |    2 +
 arch/arm/boot/dts/r8a7791-koelsch.dts              |    2 +
 arch/arm/boot/dts/r8a7791-porter.dts               |    2 +
 arch/arm/boot/dts/r8a7793-gose.dts                 |    2 +
 arch/arm/boot/dts/r8a7794-alt.dts                  |    2 +
 arch/arm/boot/dts/r8a7794-silk.dts                 |    2 +
 arch/arm/boot/dts/rk3036.dtsi                      |   10 +-
 arch/arm/boot/dts/rk3066a-mk808.dts                |   27 +
 arch/arm/boot/dts/rk3066a.dtsi                     |   32 +-
 arch/arm/boot/dts/rk3188.dtsi                      |   13 +-
 arch/arm/boot/dts/rk3229.dtsi                      |    2 +-
 arch/arm/boot/dts/rk322x.dtsi                      |   14 +-
 arch/arm/boot/dts/rk3288.dtsi                      |   22 +-
 arch/arm/boot/dts/rv1108.dtsi                      |   16 +-
 arch/arm/boot/dts/s5pv210-fascinate4g.dts          |    1 +
 arch/arm/boot/dts/s5pv210-galaxys.dts              |    1 +
 arch/arm/boot/dts/sama5d29.dtsi                    |   16 +
 arch/arm/boot/dts/sama7g5.dtsi                     |   43 +
 arch/arm/boot/dts/sh73a0-kzm9g.dts                 |    2 +-
 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts  |  112 +
 arch/arm/boot/dts/spear1310.dtsi                   |    6 -
 arch/arm/boot/dts/spear1340.dtsi                   |    2 -
 arch/arm/boot/dts/ste-ab8500.dtsi                  |   13 +-
 arch/arm/boot/dts/ste-ab8505.dtsi                  |   13 +-
 arch/arm/boot/dts/ste-href.dtsi                    |    6 +
 arch/arm/boot/dts/ste-snowball.dts                 |    6 +
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts     |    4 +
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     |    4 +
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts     |    4 +
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     |    7 +
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts       |    4 +
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     |   38 +-
 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi           |   64 +
 arch/arm/boot/dts/stm32mp131.dtsi                  |  283 ++
 arch/arm/boot/dts/stm32mp133.dtsi                  |   37 +
 arch/arm/boot/dts/stm32mp135.dtsi                  |   12 +
 arch/arm/boot/dts/stm32mp135f-dk.dts               |   56 +
 arch/arm/boot/dts/stm32mp13xc.dtsi                 |   17 +
 arch/arm/boot/dts/stm32mp13xf.dtsi                 |   17 +
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |    8 +-
 arch/arm/boot/dts/stm32mp151.dtsi                  |   18 +-
 arch/arm/boot/dts/stm32mp157c-odyssey.dts          |    6 +
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi       |    2 +-
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |    2 +-
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts     |   11 +-
 arch/arm/boot/dts/sun4i-a10.dtsi                   |   11 +-
 arch/arm/boot/dts/sun5i-a13.dtsi                   |   15 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                   |   44 +-
 arch/arm/boot/dts/sun7i-a20-bananapi.dts           |   17 +-
 arch/arm/boot/dts/sun7i-a20.dtsi                   |   34 +-
 arch/arm/boot/dts/sun8i-a33.dtsi                   |    4 +-
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts          |    2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  |    4 +-
 arch/arm/boot/dts/sun8i-h3.dtsi                    |    4 +-
 arch/arm/boot/dts/sun8i-r40.dtsi                   |   39 +
 arch/arm/boot/dts/sun8i-v3-sl631.dtsi              |    2 +-
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts        |    2 +-
 arch/arm/boot/dts/sunxi-libretech-all-h3-it.dtsi   |    2 +-
 arch/arm/boot/dts/tegra114.dtsi                    |    8 +-
 arch/arm/boot/dts/tegra124.dtsi                    |   12 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |    7 +-
 arch/arm/boot/dts/tegra20-paz00.dts                |    2 -
 arch/arm/boot/dts/tegra20.dtsi                     |   13 +-
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |   30 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 |    5 +-
 arch/arm/boot/dts/tegra30.dtsi                     |   12 +-
 arch/arm/boot/dts/versatile-ab-ib2.dts             |    6 +-
 arch/arm/boot/dts/versatile-ab.dts                 |   27 +-
 arch/arm/mach-qcom/Kconfig                         |   10 +
 arch/arm64/boot/dts/allwinner/axp803.dtsi          |   10 +-
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |    6 +-
 .../boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi     |    2 +-
 .../boot/dts/allwinner/sun50i-a64-orangepi-win.dts |    2 +-
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts      |   28 +-
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts      |    3 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |   17 +
 .../boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi      |    2 +-
 .../boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts |    9 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |    2 +-
 .../boot/dts/allwinner/sun50i-h6-cpu-opp.dtsi      |    2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |    8 +-
 arch/arm64/boot/dts/amlogic/Makefile               |    3 +
 .../dts/amlogic/meson-axg-jethome-jethub-j100.dts  |  362 ++
 .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |  405 +++
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |    2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |    2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |    2 +-
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |    4 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |    6 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |    4 +-
 .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts |  241 ++
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |   61 +
 .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |    2 +-
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |    2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |    6 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |    2 +-
 arch/arm64/boot/dts/apple/t8103-j274.dts           |   23 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |  207 ++
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi      |   27 +-
 arch/arm64/boot/dts/broadcom/Makefile              |    1 +
 .../arm64/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts |    2 +
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  |   16 +-
 arch/arm64/boot/dts/exynos/Makefile                |    3 +-
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |   10 +-
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      |    1 +
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     |    1 +
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |    6 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi      | 1189 +++++++
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   56 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  306 ++
 arch/arm64/boot/dts/freescale/Makefile             |    4 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts  |    1 +
 .../freescale/fsl-ls1028a-kontron-sl28-var1.dts    |   60 +-
 .../freescale/fsl-ls1028a-kontron-sl28-var2.dts    |   17 +-
 .../freescale/fsl-ls1028a-kontron-sl28-var4.dts    |   49 +-
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts     |   31 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |   10 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |   19 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   72 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   40 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |   40 +-
 .../dts/freescale/fsl-lx2160a-bluebox3-rev-a.dts   |   34 +
 .../boot/dts/freescale/fsl-lx2160a-bluebox3.dts    |  658 ++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   24 +-
 .../boot/dts/freescale/imx8mm-kontron-n801x-s.dts  |   32 +-
 .../dts/freescale/imx8mm-kontron-n801x-som.dtsi    |    4 +-
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |    2 +-
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |    2 +-
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   |    2 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   24 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  180 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   46 +-
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      |    1 +
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |    2 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   10 +-
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |  124 +
 arch/arm64/boot/dts/freescale/s32g274a-evb.dts     |   34 +
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts    |   40 +
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |    8 +-
 arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts  |   22 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi          |    2 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |    4 +-
 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi   |   86 +
 arch/arm64/boot/dts/marvell/Makefile               |    1 +
 .../boot/dts/marvell/armada-7040-mochabin.dts      |  458 +++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |   97 +-
 arch/arm64/boot/dts/mediatek/mt6358.dtsi           |    1 +
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |   16 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |    6 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           |  112 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |    2 +
 .../mt8183-kukui-audio-da7219-max98357a.dtsi       |   13 +
 .../mt8183-kukui-audio-da7219-rt1015p.dtsi         |   13 +
 .../dts/mediatek/mt8183-kukui-audio-da7219.dtsi    |   54 +
 .../dts/mediatek/mt8183-kukui-audio-max98357a.dtsi |   13 +
 .../dts/mediatek/mt8183-kukui-audio-rt1015p.dtsi   |   13 +
 .../mt8183-kukui-audio-ts3a227e-max98357a.dtsi     |   13 +
 .../mt8183-kukui-audio-ts3a227e-rt1015p.dtsi       |   13 +
 .../dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi  |   32 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts   |    1 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-damu.dts     |    1 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi  |    1 +
 .../mt8183-kukui-jacuzzi-juniper-sku16.dts         |    1 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts    |    1 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts    |    1 +
 .../mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts  |    1 +
 .../mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts  |    1 +
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dts      |    1 +
 .../boot/dts/mediatek/mt8183-kukui-kodama.dtsi     |    1 +
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi      |    5 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   67 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   99 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  163 +
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |    2 -
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   12 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1554 ++++++++-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |  506 ++-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  136 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 1495 +++++++-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 1522 ++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  209 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  876 +++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  876 +++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   81 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   12 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |  832 ++++-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |  826 -----
 .../apq8094-sony-xperia-kitakami-karin_windy.dts   |    1 +
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        | 1070 +++++-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       | 1105 ------
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts       |    3 -
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   93 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |    6 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   92 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |    1 +
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |  126 +
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |    1 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   63 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |    1 +
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |   15 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi          |   21 -
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |    1 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |    1 +
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |  534 +++
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |    1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   89 +-
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     |    2 +
 .../qcom/msm8992-msft-lumia-octagon-talkman.dts    |    1 +
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |    2 +
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |    1 +
 .../qcom/msm8994-msft-lumia-octagon-cityman.dts    |    1 +
 .../dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts  |    1 +
 .../qcom/msm8994-sony-xperia-kitakami-karin.dts    |    1 +
 .../qcom/msm8994-sony-xperia-kitakami-satsuki.dts  |    1 +
 .../qcom/msm8994-sony-xperia-kitakami-sumire.dts   |    1 +
 .../qcom/msm8994-sony-xperia-kitakami-suzuran.dts  |    1 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts           |   24 +-
 arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi          |   30 -
 .../dts/qcom/msm8996-sony-xperia-tone-dora.dts     |    1 +
 .../dts/qcom/msm8996-sony-xperia-tone-kagura.dts   |    1 +
 .../dts/qcom/msm8996-sony-xperia-tone-keyaki.dts   |    1 +
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |    1 +
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |  673 ++++
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |  465 +++
 .../arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts |  432 +++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   96 +-
 .../boot/dts/qcom/msm8998-asus-novago-tp370ql.dts  |    1 +
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |    2 +
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |  320 ++
 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts    |    1 +
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |    1 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |    4 -
 .../boot/dts/qcom/msm8998-oneplus-cheeseburger.dts |    1 +
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |    4 -
 .../boot/dts/qcom/msm8998-oneplus-dumpling.dts     |    1 +
 .../dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts |   31 +
 .../dts/qcom/msm8998-sony-xperia-yoshino-maple.dts |   55 +
 .../qcom/msm8998-sony-xperia-yoshino-poplar.dts    |   36 +
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  670 ++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  223 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |    1 +
 arch/arm64/boot/dts/qcom/pm6350.dtsi               |   54 +
 arch/arm64/boot/dts/qcom/pm660.dtsi                |    5 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |    7 -
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |   18 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |   13 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi              |    5 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |   12 +
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |    1 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    7 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   14 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   12 +-
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts     |   14 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |    3 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar-r2.dts   |   20 +
 .../boot/dts/qcom/sc7180-trogdor-homestar-r3.dts   |   15 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |  336 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |   13 +
 .../boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi      |   11 +
 .../dts/qcom/sc7180-trogdor-parade-ps8640.dtsi     |  109 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts     |    8 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r2.dts     |    8 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    9 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |    1 +
 .../boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |   90 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  101 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   85 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dts      |   14 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     | 1412 ++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   12 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  271 +-
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |    8 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 3562 +++++++++++++++-=
----
 .../dts/qcom/sdm630-sony-xperia-ganges-kirin.dts   |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-discovery.dts |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-pioneer.dts   |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-voyager.dts   |    1 +
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |    8 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   58 +-
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |    1 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |   17 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   16 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |   18 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   26 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |    1 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |    1 +
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |   19 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  243 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   21 +-
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |    1 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   59 +-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |   58 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  965 ++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  320 ++
 arch/arm64/boot/dts/qcom/sm7225.dtsi               |   16 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    2 -
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    3 +-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    2 -
 .../dts/qcom/sm8150-sony-xperia-kumano-bahamut.dts |    1 +
 .../dts/qcom/sm8150-sony-xperia-kumano-griffin.dts |    1 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  161 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |    2 -
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |    2 -
 .../dts/qcom/sm8250-sony-xperia-edo-pdx203.dts     |    1 +
 .../dts/qcom/sm8250-sony-xperia-edo-pdx206.dts     |    1 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   52 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    2 -
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  302 +-
 arch/arm64/boot/dts/renesas/Makefile               |    2 +
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |    3 +
 arch/arm64/boot/dts/renesas/cat875.dtsi            |    2 +
 arch/arm64/boot/dts/renesas/draak.dtsi             |  686 ++++
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |  803 +++++
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |    2 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   11 +
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |    4 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |    4 +
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |    4 +
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |    4 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  788 +----
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |  671 +---
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |   70 +
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |    2 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 1458 ++++++++
 arch/arm64/boot/dts/renesas/r8a779m0.dtsi          |   12 +
 arch/arm64/boot/dts/renesas/r8a779m1.dtsi          |    9 +
 arch/arm64/boot/dts/renesas/r8a779m2.dtsi          |   12 +
 arch/arm64/boot/dts/renesas/r8a779m3.dtsi          |    9 +
 arch/arm64/boot/dts/renesas/r8a779m4.dtsi          |   12 +
 .../boot/dts/renesas/r8a779m5-salvator-xs.dts      |   36 +
 arch/arm64/boot/dts/renesas/r8a779m5.dtsi          |   21 +
 arch/arm64/boot/dts/renesas/r8a779m6.dtsi          |   12 +
 arch/arm64/boot/dts/renesas/r8a779m7.dtsi          |   12 +
 arch/arm64/boot/dts/renesas/r8a779m8.dtsi          |   12 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  337 ++
 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts  |    7 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |  275 ++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |  292 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   56 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |    2 +
 arch/arm64/boot/dts/rockchip/Makefile              |    6 +
 arch/arm64/boot/dts/rockchip/px30-evb.dts          |   52 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  126 +-
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |   49 +-
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts    |    3 -
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |   28 +-
 arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts     |  110 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   17 +-
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |   47 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |  191 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts    |    1 +
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |  176 +
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  |    1 +
 .../boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts  |   41 +
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |  182 +
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |    4 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |   36 +
 arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi   |    6 +-
 arch/arm64/boot/dts/rockchip/rk3399-opp.dtsi       |    6 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    7 +-
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |  218 ++
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |   54 +
 .../boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts   |   14 +
 .../boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts   |   47 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |   29 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  116 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |  548 +++
 arch/arm64/boot/dts/rockchip/rk3566.dtsi           |   20 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |  313 ++
 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi   |    9 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |  644 +---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           | 1145 +++++++
 arch/arm64/boot/dts/ti/Makefile                    |    4 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |  280 ++
 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi            |    8 +
 arch/arm64/boot/dts/ti/k3-am64.dtsi                |    2 +
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            |    8 +
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             |    8 +
 .../boot/dts/ti/k3-am65-iot2050-common-pg1.dtsi    |   46 +
 .../boot/dts/ti/k3-am65-iot2050-common-pg2.dtsi    |   51 +
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi |   39 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |    8 +-
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi         |    4 -
 arch/arm64/boot/dts/ti/k3-am65.dtsi                |    2 +
 .../dts/ti/k3-am6528-iot2050-basic-common.dtsi     |   60 +
 .../boot/dts/ti/k3-am6528-iot2050-basic-pg2.dts    |   24 +
 arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dts |   56 +-
 arch/arm64/boot/dts/ti/k3-am654.dtsi               |    4 +
 .../dts/ti/k3-am6548-iot2050-advanced-common.dtsi  |   56 +
 .../boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dts |   29 +
 .../boot/dts/ti/k3-am6548-iot2050-advanced.dts     |   50 +-
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |    3 +
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |    7 +-
 arch/arm64/boot/dts/ti/k3-j7200.dtsi               |    2 +
 .../boot/dts/ti/k3-j721e-common-proc-board.dts     |    3 +
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          |   16 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts             | 1002 ++++++
 arch/arm64/boot/dts/ti/k3-j721e.dtsi               |    3 +
 arch/arm64/boot/dts/toshiba/Makefile               |    1 +
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts   |    6 +
 .../boot/dts/toshiba/tmpv7708-visrobo-vrb.dts      |   61 +
 .../boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi     |   44 +
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi          |   59 +
 arch/arm64/boot/dts/xilinx/Makefile                |   14 +
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi     |   13 +-
 .../arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dts |  315 ++
 .../arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dts |  298 ++
 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts  |  289 ++
 arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dts |   21 +
 arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts  |   16 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts  |   16 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dts  |   18 +-
 .../boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts    |  298 +-
 .../boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts    |  342 +-
 .../boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts    |   49 +-
 .../boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts    |   24 +-
 .../boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts    |  330 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts  |  264 +-
 .../arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.1.dts |   15 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts  |  320 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts  |    3 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts  |  292 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts  |  250 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts  |  340 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts  |  274 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   93 +-
 drivers/watchdog/mtk_wdt.c                         |    6 +-
 include/dt-bindings/power/imx8mm-power.h           |    9 +
 .../{reset-controller =3D> reset}/mt2712-resets.h    |    0
 include/dt-bindings/reset/mt8173-resets.h          |    2 +
 .../{reset-controller =3D> reset}/mt8183-resets.h    |    3 +
 .../{reset-controller =3D> reset}/mt8192-resets.h    |    0
 710 files changed, 49140 insertions(+), 9337 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/arm/sunxi/allwinner,sun6i-a31-cpuconfig.y=
aml
 create mode 100644
Documentation/devicetree/bindings/arm/sunxi/allwinner,sun9i-a80-prcm.yaml
 create mode 100644
Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
 delete mode 100644
Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 create mode 100644
Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
 create mode 100644
Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nand.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nor.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.y=
aml
 delete mode 100644 Documentation/devicetree/bindings/net/gpmc-eth.txt
 delete mode 100644
Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.txt
 create mode 100644
Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
 create mode 100644
Documentation/devicetree/bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/soc/imx/fsl,imx8mm-vpu-blk-ctrl.yaml
 create mode 100644 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
 create mode 100644 arch/arm/boot/dts/at91-lmu5000.dts
 create mode 100644 arch/arm/boot/dts/at91-q5xr5.dts
 create mode 100644 arch/arm/boot/dts/bcm-nsp-ax.dtsi
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-cm4-io.dts
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-cm4.dtsi
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-wifi-bt.dtsi
 create mode 100644 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
 create mode 100644 arch/arm/boot/dts/e70k02.dtsi
 create mode 100644 arch/arm/boot/dts/gemini-ns2502.dts
 create mode 100644 arch/arm/boot/dts/gemini-ssi1328.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-revc-lt2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6sl-tolino-vision5.dts
 create mode 100644 arch/arm/boot/dts/imx6sll-kobo-librah2o.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-smp.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-pm8226.dtsi
 create mode 100644 arch/arm/boot/dts/sama5d29.dtsi
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
 create mode 100644 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp131.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp133.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp135.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp135f-dk.dts
 create mode 100644 arch/arm/boot/dts/stm32mp13xc.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp13xf.dtsi
 create mode 100644
arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
 create mode 100644
arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-=
a.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dts
 create mode 100644 arch/arm64/boot/dts/freescale/s32g2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32g274a-evb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
 create mode 100644 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219-max98357a.dtsi
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219-rt1015p.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.=
dtsi
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-max98357a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-rt1015p=
.dtsi
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e-max98357a.dtsi
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e-rt1015p.dtsi
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dt=
si
 create mode 100644 arch/arm64/boot/dts/qcom/pm6350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.d=
tsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dt=
si
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213=
.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7225.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/draak.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ebisu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m0.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m4.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m5.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m6.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m7.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m8.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dt=
s
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk356x.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am65-iot2050-common-pg1.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am65-iot2050-common-pg2.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-common.d=
tsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dts
 create mode 100644
arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-common.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.d=
ts
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-sk.dts
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.1.dts
 rename include/dt-bindings/{reset-controller =3D> reset}/mt2712-resets.h (=
100%)
 rename include/dt-bindings/{reset-controller =3D> reset}/mt8183-resets.h (=
98%)
 rename include/dt-bindings/{reset-controller =3D> reset}/mt8192-resets.h (=
100%)
