Return-Path: <SRS0=gSCk=Q6=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2424AC433EF
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 10:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08985C34600; Mon, 13 Dec 2021 10:32:43 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B397BC34601;
	Mon, 13 Dec 2021 10:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B397BC34601
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from p5b127e39.dip0.t-ipconnect.de ([91.18.126.57] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1mwidL-00010J-2E; Mon, 13 Dec 2021 11:32:39 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.17 #1
Date: Mon, 13 Dec 2021 11:32:39 +0100
Message-ID: <3637342.7akbv5NDAT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below Rockchip changes for for 5.17.

Please pull!

Thanks
Heiko

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.17-rockchip-dts64-1

for you to fetch changes up to f471b1b2db0819917c54099ab68349ad6a7e9e19:

  arm64: dts: rockchip: Fix Bluetooth on ROCK Pi 4 boards (2021-12-12 13:50:22 +0100)

----------------------------------------------------------------
Improvements on a number of boards:
- helios64: hdd-power, pcie, 2.5GbE nic
- spi for rk356x and on the Quartz-A board
- headphone, bluetooth support on Rock Pi4
And some misc soc improvements:
- missing dsi compatible on px30
- pwm pinctrl name on rk356x

----------------------------------------------------------------
Alex Bee (1):
      arm64: dts: rockchip: add interrupt and headphone-detection for Rock Pi4's audio codec

David Heidelberg (1):
      arm64: dts: rockchip: Add missing secondary compatible for PX30 DSI

Dennis Gilmore (2):
      arm64: dts: rockchip: define usb hub and 2.5GbE nic on helios64
      arm64: dts: rockchip: add variables for pcie completion to helios64

Florian Klink (1):
      arm64: dts: rockchip: Enable HDD power on helios64

Jagan Teki (1):
      arm64: dts: rockchip: Fix Bluetooth on ROCK Pi 4 boards

Nicolas Frattaroli (2):
      arm64: dts: rockchip: Add spi nodes on rk356x
      arm64: dts: rockchip: Add spi1 pins on Quartz64 A

Sascha Hauer (1):
      arm64: dts: rockchip: Change pwm pinctrl-name to "default" on rk356x

 arch/arm64/boot/dts/rockchip/px30.dtsi             |  2 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 87 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi | 12 ++-
 .../boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts   | 11 +++
 .../boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts   | 18 +++-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts |  7 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts | 18 +++-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |  5 ++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           | 96 ++++++++++++++++++----
 9 files changed, 232 insertions(+), 24 deletions(-)



