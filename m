Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F84C43334
	for <soc@archiver.kernel.org>; Sat,  9 Jul 2022 08:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9FB1C385A5; Sat,  9 Jul 2022 08:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1987EC341CE;
	Sat,  9 Jul 2022 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657355420;
	bh=QRz7l5fly0asX+Ump7K4RBQg9jV2MZsy1FTBKlSiAuQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y1ruR1OogQqI8DOc7Gso9K+OzrS9fR7SsQ6ZdRo+hjClJTqDMfkJY0ecX0D3yS+XE
	 SL9wF+3KeVJ4GZDhOI2JD2w15Po9V7WqZt+8jBzgAo+HjFbnPNdVkJ65cUcEYVVdaJ
	 JMJZb/DTTxsKV+NXAsdQ2VEjCMqacrH/tzADmRXpoNzNixRMz1oL+vIjZNv6vR2Wbr
	 gRzK5Lo79s4YQovmKg/ec7y0xwaqVcdxc+vG34lKDqgzxqooYTfSmOKRDq+jeK7u2L
	 vAcGE8IIiGiprJbcgVgS4lRBBLEKAjIgSdQ4J8tGKeiZArJT+FYi5YmCr3qpwcxfrW
	 2sXlj9qsQCHlA==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] i.MX device tree change for 5.20
Date: Sat,  9 Jul 2022 16:29:49 +0800
Message-Id: <20220709082951.15123-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220709082951.15123-1-shawnguo@kernel.org>
References: <20220709082951.15123-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.20

for you to fetch changes up to 04069a86bf9650f82ee29715322165bd7739a7c2:

  ARM: dts: layerscape: Add SFP node for TA 2.1 devices (2022-07-05 09:04:14 +0800)

----------------------------------------------------------------
i.MX device tree change for 5.20:

- A series from Alexander Stein to fix some i.MX6UL dt_binding_check
  warnings.
- Replace deprecated 'enable-sdio-wakeup' property with 'wakeup-source'
  for a couple of boards.
- A set of imx7-colibri device tree updates from Marcel Ziswiler to
  improve devices Display, Touch, Ethernet and SD/MMC, and also adds
  Toradex Iris carrier board.
- A few improvements on imx6qdl-colibri board, correct SGTL5000 MCLK
  handling, simplify handling of inverted PWM backlight.
- A series from Max Krummenacher (and Oleksandr Suvorov) to improve the
  existing i.MX6 Apalis carrier board device trees and adds a new device
  tree for the Ixora V1.2 carrier board.
- Add USB dual-role switching using extcon for imx7-colibri board.
- Add SFP node for TA 2.1 devices for LayerScape SoCs.
- Other small and random updates on various boards.

----------------------------------------------------------------
Alexander Stein (6):
      ARM: dts: imx6ul: add missing properties for sram
      ARM: dts: imx6ul: change operating-points to uint32-matrix
      ARM: dts: imx6ul: fix keypad compatible
      ARM: dts: imx6ul: fix csi node compatible
      ARM: dts: imx6ul: fix lcdif node compatible
      ARM: dts: imx6ul: fix qspi node compatible

Andreas Kemnade (2):
      ARM: dts: imx6sl-tolino-shine2hd: fix led node name.
      ARM: dts: imx6: fix node names for ebook reader keys

Baruch Siach (1):
      ARM: imx6ul: drop the adc num-channels property

Denys Drozdov (1):
      ARM: dts: imx6q-apalis: Clean-up sd card support

Fabio Estevam (4):
      ARM: dts: imx: Pass a label to the soc node
      ARM: dts: imx: Pass a label to the AIPS nodes
      ARM: dts: imx7d-smegw01: Replace 'enable-sdio-wakeup'
      ARM: dts: imx6q-bosch-acc: Replace 'enable-sdio-wakeup'

Krzysztof Kozlowski (1):
      ARM: dts: fsl: adjust whitespace around '='

Marcel Ziswiler (17):
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

Max Krummenacher (14):
      ARM: dts: imx6qdl-colibri: Mux mclk for sgtl5000 with the codec node
      ARM: dts: imx6qdl-colibri: backlight pwm: Simplify inverted backlight
      ARM: dts: imx6qdl-colibri: backlight pwm: Adapt brightness steps
      ARM: dts: imx7-colibri: add ethernet aliases
      Revert "ARM: dts: imx6qdl-apalis: Avoid underscore in node name"
      ARM: dts: imx6q-apalis: Add gpio-line-names
      ARM: dts: imx6q-apalis: Command pmic to standby for poweroff
      ARM: dts: imx6q-apalis: Move Atmel MXT touch ctrl to SoM dtsi
      ARM: dts: imx6q-apalis: move gpio-keys to SoM dtsi
      ARM: dts: imx6q-apalis: Disable HDMI
      ARM: dts: imx6q-apalis: Add support for Toradex Ixora V1.2 carrier boards
      ARM: dts: imx6q-apalis: backlight pwm: Simplify inverted backlight
      ARM: dts: imx6q-apalis: backlight pwm: Adapt brightness steps
      ARM: dts: imx6q-apalis: Cleanup

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

Philippe Schenker (1):
      ARM: dts: imx7-colibri: add usb dual-role switching using extcon

Robin van der Gracht (1):
      ARM: dts: imx6qdl-prti6q.dtsi: Add applicable properties to usdhc3

Sean Anderson (1):
      ARM: dts: layerscape: Add SFP node for TA 2.1 devices

Simon Holesch (1):
      ARM: dts: imx6ulz-bsh-smm-m2: Support proper board power off

Stefan Agner (1):
      ARM: dts: imx7-colibri: set lcdif clock source to video pll

Ulrich Ölmann (1):
      ARM: dts: imx6: skov: add pwm-regulator to control the panel's VCOM

 arch/arm/boot/dts/Makefile                         |   7 +
 arch/arm/boot/dts/e60k02.dtsi                      |   4 +-
 arch/arm/boot/dts/e70k02.dtsi                      |   8 +-
 arch/arm/boot/dts/imx25.dtsi                       |   2 +-
 arch/arm/boot/dts/imx27.dtsi                       |   6 +-
 arch/arm/boot/dts/imx31.dtsi                       |   4 +-
 arch/arm/boot/dts/imx50.dtsi                       |   6 +-
 arch/arm/boot/dts/imx51-ts4800.dts                 |   2 +-
 arch/arm/boot/dts/imx51.dtsi                       |   6 +-
 arch/arm/boot/dts/imx53.dtsi                       |   6 +-
 arch/arm/boot/dts/imx6dl-plym2m.dts                |   2 +-
 arch/arm/boot/dts/imx6dl-prtvt7.dts                |   2 +-
 arch/arm/boot/dts/imx6dl-victgo.dts                |   2 +-
 arch/arm/boot/dts/imx6dl.dtsi                      |   2 +-
 arch/arm/boot/dts/imx6q-apalis-eval.dts            | 127 +---
 arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts      | 263 +------
 arch/arm/boot/dts/imx6q-apalis-ixora-v1.2.dts      | 276 +++++++
 arch/arm/boot/dts/imx6q-apalis-ixora.dts           | 113 +--
 arch/arm/boot/dts/imx6q-bosch-acc.dts              |   4 +-
 .../boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts    |   6 +
 arch/arm/boot/dts/imx6q.dtsi                       |   4 +-
 arch/arm/boot/dts/imx6qdl-apalis.dtsi              | 638 +++++++++++++---
 arch/arm/boot/dts/imx6qdl-colibri.dtsi             |  19 +-
 arch/arm/boot/dts/imx6qdl-prti6q.dtsi              |   3 +
 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi       |   4 +-
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi            |  10 +
 arch/arm/boot/dts/imx6qdl.dtsi                     |   6 +-
 arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts       |  10 +-
 arch/arm/boot/dts/imx6sx.dtsi                      |   2 +-
 arch/arm/boot/dts/imx6ul-kontron-n6x1x-s.dtsi      |   1 -
 arch/arm/boot/dts/imx6ul-phytec-segin.dtsi         |   5 -
 arch/arm/boot/dts/imx6ul-tqma6ul2l.dtsi            |   2 +-
 arch/arm/boot/dts/imx6ul.dtsi                      |  36 +-
 arch/arm/boot/dts/imx6ull-colibri.dtsi             |   1 -
 arch/arm/boot/dts/imx6ull-tqma6ull2.dtsi           |   2 +-
 arch/arm/boot/dts/imx6ull-tqma6ull2l.dtsi          |   2 +-
 arch/arm/boot/dts/imx6ull.dtsi                     |   2 +-
 arch/arm/boot/dts/imx6ulz-bsh-smm-m2.dts           |   4 +
 arch/arm/boot/dts/imx7-colibri-aster.dtsi          | 142 +---
 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi        | 156 +---
 arch/arm/boot/dts/imx7-colibri-iris-v2.dtsi        | 112 +++
 arch/arm/boot/dts/imx7-colibri-iris.dtsi           | 108 +++
 arch/arm/boot/dts/imx7-colibri.dtsi                | 830 +++++++++++++--------
 arch/arm/boot/dts/imx7d-colibri-aster.dts          |  30 +-
 arch/arm/boot/dts/imx7d-colibri-emmc-aster.dts     |  10 +-
 arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dts   |  10 +-
 arch/arm/boot/dts/imx7d-colibri-emmc-iris-v2.dts   |  21 +
 arch/arm/boot/dts/imx7d-colibri-emmc-iris.dts      |  21 +
 arch/arm/boot/dts/imx7d-colibri-emmc.dtsi          |  17 +-
 arch/arm/boot/dts/imx7d-colibri-eval-v3.dts        |  45 +-
 arch/arm/boot/dts/imx7d-colibri-iris-v2.dts        |  83 +++
 arch/arm/boot/dts/imx7d-colibri-iris.dts           |  56 ++
 arch/arm/boot/dts/imx7d-colibri.dtsi               |  13 +-
 arch/arm/boot/dts/imx7d-sdb.dts                    |   2 +-
 arch/arm/boot/dts/imx7d-smegw01.dts                |   4 +-
 arch/arm/boot/dts/imx7d.dtsi                       |   2 +-
 arch/arm/boot/dts/imx7s-colibri-aster.dts          |  27 +-
 arch/arm/boot/dts/imx7s-colibri-eval-v3.dts        |  43 +-
 arch/arm/boot/dts/imx7s-colibri-iris-v2.dts        |  78 ++
 arch/arm/boot/dts/imx7s-colibri-iris.dts           |  51 ++
 arch/arm/boot/dts/imx7s-colibri.dtsi               |   5 +-
 arch/arm/boot/dts/imx7s.dtsi                       |   2 +-
 arch/arm/boot/dts/imxrt1050.dtsi                   |   4 +-
 arch/arm/boot/dts/ls1021a-iot.dts                  |   2 +-
 arch/arm/boot/dts/ls1021a.dtsi                     |   7 +
 65 files changed, 2235 insertions(+), 1245 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6q-apalis-ixora-v1.2.dts
 create mode 100644 arch/arm/boot/dts/imx7-colibri-iris-v2.dtsi
 create mode 100644 arch/arm/boot/dts/imx7-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/imx7d-colibri-emmc-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/imx7d-colibri-emmc-iris.dts
 create mode 100644 arch/arm/boot/dts/imx7d-colibri-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/imx7d-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/imx7s-colibri-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/imx7s-colibri-iris.dts
