Return-Path: <SRS0=9ssg=J6=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77114C48BF6
	for <soc@archiver.kernel.org>; Wed, 21 Feb 2024 22:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C2F4C433C7; Wed, 21 Feb 2024 22:57:59 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE9BAC433F1;
	Wed, 21 Feb 2024 22:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE9BAC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e861914.versanet.de ([94.134.25.20] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rcvX7-0000og-OV; Wed, 21 Feb 2024 23:57:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.9 #1
Date: Wed, 21 Feb 2024 23:57:43 +0100
Message-ID: <3622360.hdfAi7Kttb@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in a subsequent pull-request
Rockchip changes for for 6.9 .

Some new boards, some new peripherals, nothing really stands out.


Please pull!

Thanks
Heiko


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.9-rockchip-dts64-1

for you to fetch changes up to 4622485f005aaf0f7a684b69280d0494e0ea301e:

  arm64: dts: rockchip: Add USB3.0 to Indiedroid Nova (2024-02-13 20:28:08 +0100)

----------------------------------------------------------------
New boards: Powkiddy RGB10MAX3, Pine64 PineTab2, NanoPi R6C+R6S, Anbernic
RG-ARC S and RG-ARC D.
New peripherals: rs485 on Theobroma Systems boards, usb3 on Indidroid Nova,
Edgeble NCM6A (usb2, m.2, ethernet, wifi, cpu-regulator), Rock-5b rfkill
for wifi, cache information for rk3399.
Snmaller DT fixes (hdmi nodes, aliases, redundant card-detect gpios, max-
frequency for spi-flashes on rock-pi 4 boards, missing pmu-io-domains on
Ringneck)

----------------------------------------------------------------
Alexey Charkov (1):
      arm64: dts: rockchip: add rfkill node for M.2 Key E WiFi on rock-5b

Chris Morgan (8):
      arm64: dts: rockchip: Move device specific properties
      dt-bindings: arm: rockchip: Add Anbernic RG-Arc
      arm64: dts: rockchip: add Anbernic RG-ARC S and RG-ARC D
      arm64: dts: rockchip: Add Touch to Anbernic RG-ARC D
      arm64: dts: rockchip: Update powkiddy rk2023 dtsi for RGB10MAX3
      dt-bindings: arm: rockchip: Add Powkiddy RGB10MAX3
      arm64: dts: rockchip: Add Powkiddy RGB10MAX3
      arm64: dts: rockchip: Add USB3.0 to Indiedroid Nova

Dragan Simic (1):
      arm64: dts: rockchip: Add cache information to the SoC dtsi for RK3399

Farouk Bouabid (2):
      arm64: dts: rockchip: add rs485 support on uart2 of rk3399-puma-haikou
      arm64: dts: rockchip: add rs485 support on uart5 of px30-ringneck-haikou

Hugh Cole-Baker (1):
      arm64: dts: rockchip: enable NanoPC-T6 MiniPCIe power

Iskander Amara (1):
      arm64: dts: rockchip: add missing definition of pmu io domains 1 and 2 on ringneck

Jagan Teki (10):
      arm64: dts: rockchip: Drop edgeble-neu6b dcdc-reg4 regulator-init-microvolt
      arm64: dts: rockchip: Add edgeble-neu6a-common DT
      arm64: dts: rockchip: Add common DT for edgeble-neu6b-io
      arm64: dts: rockchip: Add Edgeble NCM6A WiFi6 Overlay
      arm64: dts: rockchip: Add vdd_cpu_big reg to rk3588-edgeble-ncm6
      arm64: dts: rockchip: Add Edgeble NCM6A-IO 2.5G ETH
      arm64: dts: rockchip: Add Edgeble NCM6A-IO M.2 M-Key
      arm64: dts: rockchip: Add Edgeble NCM6A-IO M.2 B-Key, E-Key
      arm64: dts: rockchip: Add Edgeble NCM6A-IO USB2
      arm64: dts: rockchip: Add LED_GREEN for edgeble-neu6a

Johan Jonker (2):
      arm64: dts: rockchip: fix rk3328 hdmi ports node
      arm64: dts: rockchip: fix rk3399 hdmi ports node

John Clark (2):
      arm64: dts: rockchip: add sdmmc card detect to the nanopc-t6
      arm64: dts: rockchip: fix nanopc-t6 sdmmc regulator

Kever Yang (1):
      arm64: dts: rockchip: remove redundant cd-gpios from rk3588 sdmmc nodes

Manuel Traut (2):
      dt-bindings: arm64: rockchip: Add Pine64 PineTab2
      arm64: dts: rockchip: Add devicetree for Pine64 PineTab2

Muhammed Efe Cetin (3):
      dt-bindings: arm: rockchip: Add NanoPi R6 series boards
      arm64: dts: rockchip: Add support for NanoPi R6S
      arm64: dts: rockchip: Add support for NanoPi R6C

Quentin Schulz (2):
      arm64: dts: rockchip: add spi controller aliases on rk3399
      arm64: dts: rockchip: remove duplicate SPI aliases for helios64

Stefan Nagy (1):
      arm64: dts: rockchip: Increase maximum frequency of SPI flash for ROCK Pi 4A/B/C

Trevor Woerner (1):
      arm64: dts: rockchip: adjust phy-handle name on rock-pi-e

 .../devicetree/bindings/arm/rockchip.yaml          |  47 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   8 +
 .../boot/dts/rockchip/px30-ringneck-haikou.dts     |   1 +
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |   6 +
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |   4 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  11 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |   3 -
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |   3 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dts |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  82 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dts |  60 ++
 .../boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dts |  19 +
 .../boot/dts/rockchip/rk3566-anbernic-rg-arc.dtsi  | 237 ++++++
 .../boot/dts/rockchip/rk3566-anbernic-rg353x.dtsi  |  74 ++
 .../boot/dts/rockchip/rk3566-anbernic-rg503.dts    |  74 ++
 .../boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi   |  74 --
 .../boot/dts/rockchip/rk3566-pinetab2-v0.1.dts     |  28 +
 .../boot/dts/rockchip/rk3566-pinetab2-v2.0.dts     |  48 ++
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi  | 943 +++++++++++++++++++++
 .../dts/rockchip/rk3566-powkiddy-rgb10max3.dts     |  87 ++
 .../boot/dts/rockchip/rk3566-powkiddy-rgb30.dts    |  18 +
 .../boot/dts/rockchip/rk3566-powkiddy-rk2023.dts   |  18 +
 .../boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi  |  18 +-
 .../dts/rockchip/rk3588-edgeble-neu6a-common.dtsi  | 466 ++++++++++
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dts  |  10 +-
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi | 232 +++++
 .../dts/rockchip/rk3588-edgeble-neu6a-wifi.dtso    |  56 ++
 .../boot/dts/rockchip/rk3588-edgeble-neu6a.dtsi    |  25 +-
 .../boot/dts/rockchip/rk3588-edgeble-neu6b-io.dts  |  76 +-
 .../boot/dts/rockchip/rk3588-edgeble-neu6b.dtsi    | 383 +--------
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts  |  31 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |   1 -
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   1 -
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   8 +-
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |   8 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts |  14 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts | 764 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |   1 -
 40 files changed, 3325 insertions(+), 620 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-common.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts



