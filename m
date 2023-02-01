Return-Path: <SRS0=2vJj=55=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF93C636D3
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 23:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C45E0C433D2; Wed,  1 Feb 2023 23:04:10 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58BA8C433EF;
	Wed,  1 Feb 2023 23:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58BA8C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from p508fda63.dip0.t-ipconnect.de ([80.143.218.99] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pNM98-0007MW-AJ; Thu, 02 Feb 2023 00:04:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.3 #1
Date: Thu, 02 Feb 2023 00:04:05 +0100
Message-ID: <6491956.DvuYhMxLoT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in subsequent pull-request
Rockchip changes for for 6.3

As always the 64bit DTS part is the big one, with the most interesting
change probably being the addition of the rk3588 soc support and some
boards using it.

Though also the 32bit side got quite a bit attention this time
even with support for new SoCs.


Please pull!

Thanks
Heiko

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.3-rockchip-dts64-1

for you to fetch changes up to ef9134d9bbce071c9e4ebdcbb6f8fb1a5dd0a67e:

  arm64: dts: rockchip: Correct the model name for Radxa E25 (2023-01-29 13:12:28 +0100)

----------------------------------------------------------------
New SoC supported is the rk3588.

New boards rk3588-evb1, EmbedFire Lubancat 1+2 (based on different SoCs),
a number of Radxa boards (rock-5a and -5b, compute module 3, cm3i e25),
OrangePi R1 plus and the Edgeble Neu6 SoM and baseboard.

A number of improvements for the Odroid Go (and its clones) including
touchscreen and display support, led and audio changes.

As well as some improvements for the rk356x, better gpu thermal values for
px30 and some minor improvement for rock3a, rock5a, rk3566-demo,
roc-rk3399-pc and bi-r2pro.

----------------------------------------------------------------
Alex Riabchenko (1):
      arm64: dts: rockchip: Add IR receiver to BPI-R2Pro

Andy Yan (3):
      dt-bindings: arm: rockchip: Add EmbedFire LubanCat 2
      arm64: dts: rockchip: Add dts for EmbedFire rk3568 LubanCat 2
      arm64: dts: rockchip: Enable wifi module AP6398s for rk3566 box demo

Chris Morgan (6):
      arm64: dts: rockchip: Change audio card name for Odroid Go
      arm64: dts: rockchip: don't set cpll rate for Odroid Go
      arm64: dts: rockchip: update px30 thermal zones for GPU
      arm64: dts: rockchip: Update leds for Odroid Go Advance
      arm64: dts: rockchip: add Hynitron cst340 for Anbernic 353 series
      arm64: dts: rockchip: add display to RG503

Christopher Obbard (4):
      arm64: dts: rockchip: Add rock-5b board
      arm64: dts: rockchip: Update sdhci alias for rock-5a
      arm64: dts: rockchip: Remove empty line from rock-5a
      arm64: dts: rockchip: Update sdhci alias for rock-5b

Chukun Pan (4):
      dt-bindings: arm: rockchip: add Radxa CM3I E25
      arm64: dts: rockchip: Add Radxa CM3I E25
      dt-bindings: arm: rockchip: Add Orange Pi R1 Plus
      arm64: dts: rockchip: rk3328: Add Orange Pi R1 Plus

Furkan Kardame (1):
      arm64: dts: rockchip: add audio nodes to rk3566-roc-pc

Jagan Teki (12):
      arm64: dts: rockchip: rk3588: Add Edgeble Neu6 Model A SoM
      arm64: dts: rockchip: rk3588: Add Edgeble Neu6 Model A IO
      dt-bindings: arm: rockchip: Add Radxa Compute Module 3
      arm64: dts: rockchip: Add rk3566 based Radxa Compute Module 3
      arm64: dts: rockchip: Add Radxa Compute Module 3 IO board
      arm64: dts: rockchip: Update eMMC, SD aliases for Radxa SoM boards
      arm64: dts: rockchip: Update eMMC, SD aliases for Radxa SBC boards
      arm64: dts: rockchip: rk3566: Enable WiFi, BT support for Radxa CM3
      arm64: dts: rockchip: Fix compatible for Radxa CM3
      arm64: dts: rockchip: Add missing CM3i fallback compatible for Radxa E25
      arm64: dts: rockchip: Drop unneeded model for Radxa CM3i
      arm64: dts: rockchip: Correct the model name for Radxa E25

Jianqun Xu (1):
      arm64: dts: rockchip: Add rk3588 pinctrl data

Jonas Karlman (2):
      arm64: dts: rockchip: assign rate to clk_rtc_32k on rk356x
      arm64: dts: rockchip: fix hdmi cec on rock-3a

Kever Yang (2):
      arm64: dts: rockchip: Add base DT for rk3588 SoC
      arm64: dts: rockchip: Add rk3588-evb1 board

Lucas Tanure (1):
      arm64: dts: rockchip: Fix RX delay for ethernet phy on rk3588s-rock5a

Manoj Sai (2):
      arm64: dts: rockchip: increase spi-max-frequency of nor flash for roc-rk3399-pc
      arm64: dts: rockchip: Enable Ethernet for Radxa CM3 IO

Michael Riesch (1):
      arm64: dts: rockchip: add pinctrls for 16-bit/18-bit rgb interface to rk356x

Sebastian Reichel (3):
      dt-bindings: soc: rockchip: add initial rk3588 syscon compatibles
      dt-bindings: arm: rockchip: add initial rk3588 boards
      arm64: dts: rockchip: Add rock-5a board

Wenhao Cui (3):
      dt-bindings: vendor-prefixes: Document EmbedFire
      dt-bindings: arm: rockchip: Add EmbedFire LubanCat 1
      arm64: dts: rockchip: Add EmbedFire LubanCat 1

 .../devicetree/bindings/arm/rockchip.yaml          |   44 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/rockchip/Makefile              |    9 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |   33 +-
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi |   41 +-
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dts  |  373 +++
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |    2 +-
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |    4 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |    4 +-
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |    4 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353p.dts   |   19 +
 .../boot/dts/rockchip/rk3566-anbernic-rg353v.dts   |   12 +
 .../boot/dts/rockchip/rk3566-anbernic-rg503.dts    |   55 +
 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts   |   24 +-
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts |  595 ++++
 .../boot/dts/rockchip/rk3566-radxa-cm3-io.dts      |  272 ++
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi |  425 +++
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts     |   44 +-
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts |   13 +
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts |  733 +++++
 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi   |   94 +
 .../arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi |  415 +++
 arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts  |  228 ++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |    6 +-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |    5 +-
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dts  |   27 +
 .../boot/dts/rockchip/rk3588-edgeble-neu6a.dtsi    |   32 +
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |  129 +
 arch/arm64/boot/dts/rockchip/rk3588-pinctrl.dtsi   |  516 +++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   44 +
 arch/arm64/boot/dts/rockchip/rk3588.dtsi           |   58 +
 arch/arm64/boot/dts/rockchip/rk3588s-pinctrl.dtsi  | 3403 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |   73 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          | 1703 ++++++++++
 35 files changed, 9413 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s.dtsi



