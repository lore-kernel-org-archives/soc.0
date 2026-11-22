Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795356194;
	b=YITfHbPnbV7d+9+Oonuf9Bl8NbbCXuaBTAPzCVLssIQNw0kAgCY13aH21CodbF+k1iDR
	 z+63qzf/oz6eQNG2dpFhSMCXIqKYM0KAAQuZYtPERI2lJtYR7X/rgZXw7RihU+xuq2Z55
	 LOvBbb/e5ke+f5rKUCYV+0FwmFvHc5w2AohDtwASzt4XBCwnBzPcFKMj549tOOQTiQ7Ah
	 xYtr/+tAKyIJQM1GhwfxuAtb/eCLQ73Eyz8KQdTjn+pi9eTFAQX5w3IrSfHFsvKf5EDVc
	 EWPK5/PA/T/yCeY3n5BxPrCJ/lgYfl8G+RaH1uNQ1pIQL78H4qeV6SYTUFEdw3o0M8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356194;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=76p2SWlEDkeW+JfFIChbZsSZ5ZvE6h96Rg+QuZCXZnA=;
	b=yfC0CYru16nMC0Az9snqtOHYn2qlK+Y8xjnzCpFkXvekSaZ2JGGd4V18tx6PVxLYURDt
	 Z01vmmd4dI/IOQbY2P/SZoJyqK+7UsSCGHgFeo9bA5xGJGGMct/bLHups02ZNtA8bBLTV
	 /sbFOhOz5vNnXP0y8H9AqkC9lu2hq0d3NgIiEMf15jX3thnfh4NX0g50cJrWuKT/WQ5zF
	 GSFT1FjoybpU2aoPsEqHYxgWeepblwTOmfjJQzfsVM0oKBGCW7skoRODujLbmZrSL1lsO
	 qR+gWqSFsFsXxTxItuO1amIgDR+tePCtNso0Px0vNe7xwIL9z/NyRtQ+1B3lKgpuM9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=0hZh19VC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7360A606A320
	for <soc@lists.linux.dev>; Sun, 22 Nov 2026 14:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=0hZh19VC
Received: by smtp.kernel.org (Postfix)
	id D21171F000D3; Sun, 22 Nov 2026 14:03:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795356193;
	b=oGSIN6Dnv7SR0oxrjnvq22y/INZwpkXrH8IpkL4Zbl1omp99Bu824KwIrEpfXTShbQdR
	 3MQYwNDLE4buYwhKaRTt9IsdAOShd71EXue3VBf9yFo0gEgVU8bxrQDtW3uRlxqB2KsNW
	 csx6O6hoykQqRN5iMtqEoghRcN/VgUHiZOufETA8NHFGACCclYhY8ev3WfvA6kLftv9O0
	 LJ2Ev92x7rZBB9XLlOZ5NYU9+Z5s3z0CKx6DyHvfmLZsyyd7lGub6sXvSaPEzDCkoP1Td
	 uky0m1zP6K7tZ1v+gqf7e+68Nga6q5b2VBfqZt9W+D6B94qzssdTRMHv/TUZTRwk6yw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795356193;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=76p2SWlEDkeW+JfFIChbZsSZ5ZvE6h96Rg+QuZCXZnA=;
	b=Eat603APTE/UV/q6WIrqkpwGP15tgULcOP9MOf7r+rnmLzPVMhpq+etc8ZYJvfffwr+I
	 7hnNvEV6oYzWq8k0GNu/l4DEojTp8NSXxrmcs9p2AGHlTpRpKs7DOoVbBNUlv5NrKPi4E
	 BtFMaV9nuS3pVhQ81ufDTmT9IK9XDlACRdX7/rDseLgrVVa7gwkHvCb361WWUXF2ro73l
	 VJMfDltNUEdVSoqPN+SSQzK/zUbdllWoUCx5C3eC8dlBaq35MOQDIUw8G1NzGEcu9xkw1
	 EVC0Z/+72JCaNxd9md1CIAEW9IXmxpOzWdAHS9sHDsiSmk7cqB17e+UGGiwPL1SktFw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=0hZh19VC;
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21D361F000CA;
	Sun, 22 Nov 2026 14:03:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=0hZh19VC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 21D361F000CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=76p2SWlEDkeW+JfFIChbZsSZ5ZvE6h96Rg+QuZCXZnA=; b=0hZh19VC4U4K8M+FGxkTzy7By8
	SDjX09vaVpBkusoBOnEQ7WADyn3Dz9GZezTH5S3qde1kCqx9YrDW8xslqgHqAGfw5amSBreZNYEFD
	zGl8U1VS/GExLZZxn3a8i3T3ROgvUDPh5RPoLEAOpWEklRWBSb+KESzqfu996awTWJtyW+ZZVRJNU
	S2TkFuH3fe2GFqP0CoGMbLHYXf4Su276r+TqJs7uWxhxLMrcKOCWcJG5Wkv/0e4wLaEjPLK5YAnAn
	YliwbTi5yBn/cdtF5InaOYVSkDe2Awm5OALbFkXKbORKxJtuIeZnfNZX6kpPjXAgEK7uJOsaamG3k
	eETDzG5w==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.5 #1
Date: Sun, 22 Nov 2026 15:02:59 +0100
Message-ID: <0mz4dc8hQSOr4_mBKfnwog@sntech.de>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below a first bunch of Rockchip dt changes for arm64
for the next merge window.

Nothing really stands out.

Please pull.

Thanks
Heiko


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.5-rockchip-dts64-1

for you to fetch changes up to 30eb5fd93649928b9e4149d24fa182c8521fdc20:

  arm64: dts: rockchip: Enable all CPU OPPs on Kobol Helios64 (2026-11-13 21:35:29 +0100)

----------------------------------------------------------------
New boards: FriendlyElec NanoPi M6V2, Vicharak Axon Lite, ArmSoM Sige7s
Global: RK3576 cache hierarchy, RK3588 VOP2 reset
And of course a big chunk of board-level improvements.

----------------------------------------------------------------
Chris Morgan (1):
      arm64: dts: rockchip: Add icm42607p IMU for RG-Vita-Pro

Cole Munz (1):
      arm64: dts: rockchip: add rk3576 cache hierarchy information to CPU nodes

Cristian Ciocaltea (1):
      arm64: dts: rockchip: Add RK3588 VOP2 resets

Dennis Gilmore (1):
      arm64: dts: rockchip: Fix adc-keys wiring for Orange Pi 5 family

Deomid rojer Ryabkov (2):
      arm64: dts: rockchip: Fix VCCIO4/VCCIO6 supplies on NanoPi R2S Plus
      arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus

Fabio Estevam (2):
      arm64: dts: rockchip: Fix the BT clock-names on rk3399-hugsun-x99
      arm64: dts: rockchip: Fix the BT clock-names on rk3399-leez-p710

Hrushiraj Gandhi (2):
      dt-bindings: arm: rockchip: Add Vicharak Axon Lite board
      arm64: dts: rockchip: Add Vicharak Axon Lite board

Igor Paunovic (1):
      arm64: dts: rockchip: fix hym8563 interrupt pin on Orange Pi 5 Plus

Igor Velkov (13):
      arm64: dts: rockchip: Add vdd_log and vdd_center to Kobol Helios64
      arm64: dts: rockchip: Enable HS400 enhanced strobe on Kobol Helios64 eMMC
      arm64: dts: rockchip: Enable USB host0 on Kobol Helios64
      arm64: dts: rockchip: Add the buzzer to Kobol Helios64
      arm64: dts: rockchip: Add the front panel LEDs to Kobol Helios64
      arm64: dts: rockchip: Add the GPIO expander to Kobol Helios64
      arm64: dts: rockchip: Describe the Ethernet PHY on ROCK Pi 4
      arm64: dts: rockchip: Add the GPU to Kobol Helios64
      arm64: dts: rockchip: Label the fans on Kobol Helios64
      arm64: dts: rockchip: Add the battery charger to Kobol Helios64
      arm64: dts: rockchip: Enable SDR104 on the Kobol Helios64 SD card
      arm64: dts: rockchip: Describe more of the power tree on Kobol Helios64
      arm64: dts: rockchip: Enable all CPU OPPs on Kobol Helios64

Jianfeng Liu (2):
      dt-bindings: arm: rockchip: Add ArmSoM Sige7s
      arm64: dts: rockchip: Add ArmSoM Sige7s board

Jiaxing Hu (1):
      arm64: dts: rockchip: let TCPM own the USB-C VBUS on CM5-IO

Joachim Eastwood (13):
      arm64: dts: rockchip: fix sd min/max voltage on rk3588s-nanopi
      arm64: dts: rockchip: enable mmc-hs400 and add supplies on rk3588s-nanopi
      arm64: dts: rockchip: add voltage iio-hwmon device on rk3588s-nanopi
      arm64: dts: rockchip: move vcc_3v3_s0 to nanopi-r6
      arm64: dts: rockchip: rename sd power pin from rk3588s-nanopi
      arm64: dts: rockchip: rename usb host power pin on rk3588s-nanopi
      arm64: dts: rockchip: rename gmac1 reset pin on rk3588s-nanopi
      arm64: dts: rockchip: rename pcie2 power pin on rk3588s-nanopi-m6
      arm64: dts: rockchip: rename pcie2 power rail on rk3588s-nanopi-m6
      dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6V2
      arm64: dts: rockchip: rename rtl8211f node on rk3588s-nanopi
      arm64: dts: rockchip: add support for NanoPi M6V2 board
      arm64: dts: rockchip: fix pcie wlan chip on rk3588-h96-max-v58

Jonathan Schmid (1):
      arm64: dts: rockchip: Pull down the eMMC data strobe on RK3576

Kel Modderman (2):
      arm64: dts: rockchip: Move SD card regulator to Orange Pi 5/5B
      arm64: dts: rockchip: Add headphone amplifier to Orange Pi 5 Pro

Leonard Lausen (1):
      arm64: dts: rockchip: Enable Wi-Fi on the NanoPi M5

Miguel Jesus Seron Gonzalez (2):
      arm64: dts: rockchip: use rgmii-id for gmac0 on odroid-m1
      arm64: dts: rockchip: keep vcc3v3_pcie enabled from boot on odroid-m1

Mizuno Miotsuki (1):
      arm64: dts: rockchip: Enable audio on DFRobot UNIHIKER M10 V1.2

Pufan Jin (1):
      arm64: dts: rockchip: Enable the NPU on LubanCat 4

Ricardo Pardini (6):
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPC-T6
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on ROCK 5 family
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on CM3588
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPi R5S
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPi R6C
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on ROCK 5 ITX

Richard DeFrese (1):
      arm64: dts: rockchip: route ES8388 MCLK to the IO pin on Orange Pi 5/5B

Ryan Leung (2):
      arm64: dts: rockchip: add maskrom ADC button to NanoPi R76S
      arm64: dts: rockchip: add maskrom and recovery ADC buttons to NanoPi M5

Sebastian Reichel (5):
      arm64: dts: rockchip: Add missing PCIe wake pinmux on RK3588 EVB1
      arm64: dts: rockchip: Enable NPU on RK3588 EVB1
      arm64: dts: rockchip: Enable HDMI sound on RK3588 EVB1
      arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
      arm64: dts: rockchip: Add Bluetooth to RK3588 EVB1

Shawn Lin (1):
      arm64: dts: rockchip: enable PCIe3x2 on rk3568-evb1

 .../devicetree/bindings/arm/rockchip.yaml          |  12 +
 arch/arm64/boot/dts/rockchip/Makefile              |   3 +
 .../boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts |  30 +
 .../boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts   |  60 ++
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts |   2 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 286 ++++++++-
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts  |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  11 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |  34 +
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts |  30 +
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts  |   6 +-
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   |  12 +-
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     |   1 -
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  |  61 ++
 .../arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts |  14 +
 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi   |   2 +-
 .../dts/rockchip/rk3576-vicharak-axon-lite.dts     | 714 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  74 +++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  12 +
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   | 180 +++++-
 .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   |  15 +
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts |   5 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |  30 +
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |   4 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |  30 +
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |  15 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |  18 +
 .../boot/dts/rockchip/rk3588s-armsom-sige7s.dts    |  16 +
 .../arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts |  35 +-
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi |  14 +-
 .../boot/dts/rockchip/rk3588s-nanopi-m6v2.dts      |  92 +++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |  14 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts |  20 +
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   |  55 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi   |  31 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5-pro.dts   |  21 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |  23 +-
 37 files changed, 1896 insertions(+), 88 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-vicharak-axon-lite.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts



