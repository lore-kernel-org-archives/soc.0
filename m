Return-Path: <SRS0=3mQs=ZN=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4D4ECAAA1
	for <soc@archiver.kernel.org>; Sat, 10 Sep 2022 01:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCB51C433C1; Sat, 10 Sep 2022 01:21:20 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55DD9C433D6;
	Sat, 10 Sep 2022 01:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55DD9C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oWpBN-00019F-5k; Sat, 10 Sep 2022 03:21:17 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.1 #1
Date: Sat, 10 Sep 2022 03:21:16 +0200
Message-ID: <5600929.DvuYhMxLoT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in subsequent pull-requests
Rockchip changes for for 6.1

As always the 64bit DTS part is the big one.

Please pull!

Thanks
Heiko


The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-dts64-1

for you to fetch changes up to 91419ae0420f0c91a326655d687b740826d0a3f9:

  arm64: dts: rockchip: use BCLK to GPIO switch on rk3399 (2022-09-10 01:08:48 +0200)

----------------------------------------------------------------
New boards the Anberic RG353P and RG503, Radxa Rock4c+ (variant with
different display outputs), Pine64 Pinephone Pro, Open AI Lab EAIDK-610.

New components of the rk356x (Video encoder/decoder, pcie, CSI dphy).

New board-peripherals for rock3a (pcie, i2c, regulators, rtc), quartz64-b
(pcie, analog audio) and BPI-R2-Pro (pcie), ROCK Pi (leds), Odroid Go (charger)

Usage of the new-ish bclk special handling for audio on rk3399.

----------------------------------------------------------------
Andy Yan (3):
      dt-bindings: vendor-prefixes: Add OPEN AI LAB
      dt-bindings: arm: rockchip: Add EAIDK-610
      arm64: dts: rockchip: Add dts for a rk3399 based board EAIDK-610

Chris Morgan (4):
      arm64: dts: rockchip: add rk817 chg to Odroid Go Advance
      dt-bindings: vendor-prefixes: add Anbernic
      dt-bindings: arm: rockchip: Add Anbernic RG353P and RG503
      arm64: dts: rockchip: add Anbernic RG353P and RG503

Chukun Pan (2):
      arm64: dts: rockchip: add rtc to rock3a
      arm64: dts: rockchip: Enable PCIe controller on rock3a

FUKAUMI Naoki (2):
      arm64: dts: rockchip: add LED for ROCK Pi 4A/B/C/A+/B+
      arm64: dts: rockchip: add LEDs for ROCK 4C+

Frank Wunderlich (3):
      arm64: dts: rockchip: Add PCIe v3 nodes to rk3568
      arm64: dts: rockchip: Add PCIe v3 nodes to BPI-R2-Pro
      arm64: dts: rockchip: Add regulator suffix to BPI-R2-Pro

Jagan Teki (3):
      dt-bindings: arm: rockchip: Document Radxa ROCK 4C+
      arm64: dts: rockchip: Add RK3399-T OPP table
      arm64: dts: rockchip: rk3399: Radxa ROCK 4C+

Judy Hsiao (1):
      arm64: dts: rockchip: use BCLK to GPIO switch on rk3399

Martijn Braam (1):
      arm64: dts: rockchip: Add initial support for Pine64 PinePhone Pro

Michael Riesch (4):
      arm64: dts: rockchip: add vcc_cam regulator to rock-3a
      arm64: dts: rockchip: add vcc_mipi regulator to rock-3a
      arm64: dts: rockchip: specify pinctrl for i2c adapters on rock-3a
      arm64: dts: rockchip: add csi dphy node to rk356x

Nicolas Frattaroli (3):
      arm64: dts: rockchip: Add analog audio output on quartz64-b
      arm64: dts: rockchip: Add PCIe 2 nodes to quartz64-b
      arm64: dts: rockchip: Add Hantro encoder node to rk356x

Ondrej Jirman (1):
      arm64: dts: rockchip: Fix SD card controller probe on Pinephone Pro

Piotr Oniszczuk (1):
      arm64: dts: rockchip: Add VPU support for RK3568/RK3566

Tom Fitzhenry (1):
      dt-bindings: arm: rockchip: Add PinePhone Pro bindings

 .../devicetree/bindings/arm/rockchip.yaml          |  25 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |  26 +
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts  | 939 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |  10 +
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 398 +++++++++
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      | 679 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  21 +
 arch/arm64/boot/dts/rockchip/rk3399-t-opp.dtsi     | 114 +++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  25 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353p.dts   |  94 +++
 .../boot/dts/rockchip/rk3566-anbernic-rg503.dts    |  87 ++
 .../boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi   | 831 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts |  66 +-
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 129 ++-
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    | 113 +++
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           | 122 +++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  52 ++
 19 files changed, 3732 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-t-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi



