Return-Path: <SRS0=L7NY=AA=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9D3C77B61
	for <soc@archiver.kernel.org>; Sun,  9 Apr 2023 10:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79156C4339C; Sun,  9 Apr 2023 10:32:39 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 659E5C433EF;
	Sun,  9 Apr 2023 10:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 659E5C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from p57b77242.dip0.t-ipconnect.de ([87.183.114.66] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1plSLZ-0001KY-O3; Sun, 09 Apr 2023 12:32:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.4 #1
Date: Sun, 09 Apr 2023 12:32:32 +0200
Message-ID: <7289562.MhkbZ0Pkbq@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in subsequent pull-request
Rockchip changes for for 6.4

As always the 64bit DTS part is the big one, with some new boards and
a lot of added support for rk3588 peripherals.


Please pull!

Thanks
Heiko

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.4-rockchip-dts64-1

for you to fetch changes up to 07099a551803e05d3ee42fae152bf404f8dc21f9:

  arm64: dts: rockchip: correct panel supplies on Odroid Go Super (2023-04-05 19:39:39 +0200)

----------------------------------------------------------------
New boards: OrangePi R1 Plus, NanoPi R2C + R5C + R5S, Khadas Edge2.
General RK3588 additions: audio, thermal management, sdmmc, clock fixes,
watchdog; RK3588-Rock5b: rtc, pwm, audio.
Display support for Odroid Go Super and PinephonePro.
And some misc adaptions for recently merged yaml binding conversions.

----------------------------------------------------------------
Cristian Ciocaltea (6):
      arm64: dts: rockchip: Add pwm-fan to rk3588-rock-5b
      arm64: dts: rockchip: Fix SCMI assigned clocks on rk3588s
      arm64: dts: rockchip: Assign PLL_PPLL clock rate to 1.1 GHz on rk3588s
      arm64: dts: rockchip: Add rk3588s I2S nodes
      arm64: dts: rockchip: Add I2S rk3588 nodes
      arm64: dts: rockchip: Add rk3588-rock-5b analog audio

Johan Jonker (6):
      arm64: dts: rockchip: fix px30 lvds node
      arm64: dts: rockchip: fix px30 dsi node
      arm64: dts: rockchip: fix rk3399 dsi node
      arm64: dts: rockchip: fix rk3399 dp node
      arm64: dts: rockchip: rename vbus-supply to phy-supply in rk3566-box-demo.dts
      arm64: dts: rockchip: remove hclk from dsi node on rk356x

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: correct panel supplies on Odroid Go Super

Lucas Tanure (1):
      arm64: dts: rockchip: Add sdmmc node to rk3588

Manoj Sai (1):
      arm64: dts: rockchip: Enable USB OTG for rk3566 Radxa CM3

Martijn Braam (2):
      arm64: dts: rockchip: Add internal display support to rk3399-pinephone-pro
      arm64: dts: rockchip: Add touchscreen support to rk3399-pinephone-pro

Maya Matuszczyk (1):
      arm64: dts: rockchip: Add display support to Odroid Go Super

Sebastian Reichel (1):
      arm64: dts: rockchip: add rk3588 thermal sensor

Shreeya Patel (3):
      arm64: dts: rockchip: Enable watchdog support for RK3588
      dt-bindings: watchdog: rockchip: Add rockchip,rk3588-wdt string
      arm64: dts: rockchip: Enable RTC support for Rock 5B

Tianling Shen (9):
      arm64: dts: rockchip: create common dtsi for NanoPi R5 series
      dt-bindings: Add doc for FriendlyARM NanoPi R5C
      arm64: dts: rockchip: Add FriendlyARM NanoPi R5C
      arm64: dts: rockchip: fix gmac support for NanoPi R5S
      arm64: dts: rockchip: remove I2S1 TDM node for the NanoPi R5 series
      dt-bindings: Add doc for FriendlyARM NanoPi R2C
      arm64: dts: rockchip: Add FriendlyARM NanoPi R2C
      dt-bindings: Add doc for Xunlong OrangePi R1 Plus LTS
      arm64: dts: rockchip: Add Xunlong OrangePi R1 Plus LTS

Vasily Khoruzhick (2):
      dt-bindings: Add doc for FriendlyARM NanoPi R5S
      arm64: dts: rockchip: Add FriendlyElec Nanopi R5S

Yixun Lan (2):
      dt-bindings: arm: rockchip: Add Khadas Edge2 board
      arm64: dts: rockchip: Add Khadas edge2 board

 .../devicetree/bindings/arm/rockchip.yaml          |  24 +-
 .../devicetree/bindings/watchdog/snps,dw-wdt.yaml  |   1 +
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +-
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts |   5 +-
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dts |  40 ++
 .../dts/rockchip/rk3328-orangepi-r1-plus-lts.dts   |  40 ++
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 114 ++++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  20 +-
 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts   |   2 +-
 .../boot/dts/rockchip/rk3566-radxa-cm3-io.dts      |   8 +
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dts | 112 ++++
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 137 +++++
 .../arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi | 590 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |   8 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  97 ++++
 arch/arm64/boot/dts/rockchip/rk3588.dtsi           |  68 +++
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |  37 ++
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          | 203 ++++++-
 19 files changed, 1503 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts



