Return-Path: <SRS0=7/pu=EB=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E4AC27C41
	for <soc@archiver.kernel.org>; Wed, 16 Aug 2023 22:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66BA4C433CB; Wed, 16 Aug 2023 22:02:58 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3B24C433C9;
	Wed, 16 Aug 2023 22:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3B24C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875bbf.versanet.de ([83.135.91.191] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qWObO-0007b0-M7; Thu, 17 Aug 2023 00:02:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.6 #1
Date: Thu, 17 Aug 2023 00:02:54 +0200
Message-ID: <7414564.rnE6jSC6OK@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in a subsequent pull-request
Rockchip changes for for 6.6 .

As always the 64bit DTS part is the big one, with some new boards and
yet another lot of added support for rk3588 peripherals.


Please pull!

Thanks
Heiko


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.6-rockchip-dts64-1

for you to fetch changes up to a721e28dfad2dec895a5aada85fb0fac0223e2d2:

  arm64: dts: rockchip: Add NanoPC T6 PCIe Ethernet support (2023-08-12 15:13:00 +0200)

----------------------------------------------------------------
New boards are the NanoPC T6, Firefly Station P2, Radxa Rock 4SE.

Many new peripherals for the still only basic supported rk3588 soc
(PCIe2, PCIe3, USB2, SATA, Combo-Phys).

Improvements to the Rock-5a development board based on this soc (saradc,
i2c on dsi and csi, fan, eeprom, analog audio, leds, sd-card,
some regulators, pmic).

Improvements for the edgeble-neu6b (rs485, rs232, pwm-fan, rtc, sata,
sata, sd-card, pmic)

RK3399 got the PCIe endpoint node when used as a PCIe-client.

And some minor changes for some boards: spi-flash for RockPi 4,
SATA and fixed PCIe regulators for Radxa E25 and using enable-gpios
on engicam and gru boards.

----------------------------------------------------------------
Christopher Obbard (3):
      arm64: dts: rockchip: Move OPP table from ROCK Pi 4 dtsi
      dt-bindings: arm: rockchip: Add Radxa ROCK 4SE
      arm64: dts: rockchip: Add Radxa ROCK 4SE

Cristian Ciocaltea (1):
      arm64: dts: rockchip: Update sound card label on rk3588-rock-5b

FUKAUMI Naoki (1):
      arm64: dts: rockchip: fix/update sdmmc properties for rock-5a and -5b

Furkan Kardame (2):
      dt-bindings: arm: rockchip: Add Firefly Station P2
      arm64: dts: rockchip: add dts for Firefly Station P2 aka rk3568-roc-pc

Jagan Teki (8):
      arm64: dts: rockchip: Drop unchanged max-frequency from rk3588 boards
      arm64: dts: rockchip: Add PMIC for edgeble-neu6b
      arm64: dts: rockchip: Add microSD card for edgeble-neu6b
      arm64: dts: rockchip: Enable SATA for edgeble-neu6b
      arm64: dts: rockchip: Enable RTC for edgeble-neu6b
      arm64: dts: rockchip: Enable PWM FAN for edgeble-neu6b
      arm64: dts: rockchip: Enable RS232 for edgeble-neu6b
      arm64: dts: rockchip: Enable RS485 for edgeble-neu6b

John Clark (1):
      arm64: dts: rockchip: Add NanoPC T6 PCIe Ethernet support

Jonas Karlman (2):
      arm64: dts: rockchip: Fix PCIe regulators on Radxa E25
      arm64: dts: rockchip: Enable SATA on Radxa E25

Krzysztof Kozlowski (2):
      arm64: dts: rockchip: switch rk3399-gru boards to enable-gpios
      arm64: dts: rockchip: switch px30-engicam to enable-gpios

Lucas Tanure (1):
      arm64: dts: rockchip: add SD card support to rock-5a

Rick Wertenbroek (1):
      arm64: dts: rockchip: Add dtsi entry for RK3399 PCIe endpoint core

Sebastian Reichel (21):
      dt-bindings: vendor-prefixes: Add prefix for belling
      dt-bindings: eeprom: at24: add Belling BL24C16A
      arm64: dts: rockchip: add PMIC to rock-5a
      arm64: dts: rockchip: add vdd_cpu_big regulators to rock-5a
      arm64: dts: rockchip: add 5V regulator to rock-5a
      arm64: dts: rockchip: add status LED to rock-5a
      arm64: dts: rockchip: add analog audio to rock-5a
      arm64: dts: rockchip: add I2C EEPROM to rock-5a
      arm64: dts: rockchip: add vdd_npu_s0 regulator to rock-5a
      arm64: dts: rockchip: enable I2C interface from DSI and CSI connectors on rock-5a
      arm64: dts: rockchip: add SARADC to rock-5a
      arm64: dts: rockchip: add fan support to rock-5a
      arm64: dts: rockchip: add combo PHYs to rk3588
      arm64: dts: rockchip: add SATA support to rk3588
      arm64: dts: rockchip: enable SATA on rk3588-evb1
      arm64: dts: rockchip: add USB2 support for rk3588
      arm64: dts: rockchip: add USB2 to rk3588-evb1
      arm64: dts: rockchip: add USB2 to rk3588-rock5b
      arm64: dts: rockchip: add USB2 to rk3588s-rock5a
      arm64: dts: rockchip: add PCIe3 support for rk3588
      arm64: dts: rockchip: add rk3588 PCIe2 support

Stefan Nagy (1):
      arm64: dts: rockchip: Enable internal SPI flash for ROCK Pi 4A/B/C

Thomas McKahan (2):
      dt-bindings: arm: rockchip: Add NanoPC T6
      arm64: dts: rockchip: Add NanoPC T6

 .../devicetree/bindings/arm/rockchip.yaml          |  15 +
 Documentation/devicetree/bindings/eeprom/at24.yaml |   3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/rockchip/Makefile              |   3 +
 .../boot/dts/rockchip/px30-engicam-ctouch2.dtsi    |   2 +-
 .../rockchip/px30-engicam-px30-core-edimm2.2.dts   |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts   |  65 ++
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |   1 -
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dts |  11 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts |  11 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts |  11 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  27 +
 arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts  |  24 +-
 arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts     | 643 +++++++++++++++
 .../boot/dts/rockchip/rk3588-edgeble-neu6a.dtsi    |   1 -
 .../boot/dts/rockchip/rk3588-edgeble-neu6b-io.dts  |  66 ++
 .../boot/dts/rockchip/rk3588-edgeble-neu6b.dtsi    | 359 ++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |  83 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts  | 888 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  78 +-
 arch/arm64/boot/dts/rockchip/rk3588.dtsi           | 215 +++++
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 -
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |   1 -
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   | 665 ++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          | 286 +++++++
 26 files changed, 3436 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts



