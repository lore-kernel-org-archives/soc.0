Return-Path: <SRS0=L7NY=AA=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0B3C7619A
	for <soc@archiver.kernel.org>; Sun,  9 Apr 2023 00:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44D24C4339C; Sun,  9 Apr 2023 00:01:26 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC660C433EF;
	Sun,  9 Apr 2023 00:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC660C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from p57b77242.dip0.t-ipconnect.de ([87.183.114.66] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1plIUe-0006zQ-22; Sun, 09 Apr 2023 02:01:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.3
Date: Sun, 09 Apr 2023 02:01:14 +0200
Message-ID: <10559306.CDJkKcVGEf@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find a below a collection of fixes for the current release 6.3
cycle.

Please pull

Thanks
Heiko


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.3-rockchip-dtsfixes1

for you to fetch changes up to 60a655debd36e3278a46872accc1a51a54f94f02:

  arm64: dts: rockchip: correct panel supplies on some rk3326 boards (2023-04-05 19:38:03 +0200)

----------------------------------------------------------------
Lower sd card speeds for two boards to make them run more reliable,
missing 32k clock definition for Anbric xx3 devices, missing cache-levels
for rk3588, fixed rk3326-board display supplies and more dt-schema fixes.

----------------------------------------------------------------
Chris Morgan (1):
      arm64: dts: rockchip: Add clk_rtc_32k to Anbernic xx3 Devices

Dan Johansen (2):
      arm64: dts: rockchip: Lower sd speed on rk3566-soquartz
      arm64: dts: rockchip: Lower SD card speed on rk3399 Pinebook Pro

Javier Martinez Canillas (1):
      arm64: dts: rockchip: Remove non-existing pwm-delay-us property

Jianqun Xu (1):
      ARM: dts: rockchip: fix a typo error for rk3288 spdif node

Krzysztof Kozlowski (3):
      arm64: dts: rockchip: use just "port" in panel on Pinebook Pro
      arm64: dts: rockchip: use just "port" in panel on RockPro64
      arm64: dts: rockchip: correct panel supplies on some rk3326 boards

Rob Herring (1):
      arm64: dts: rockchip: Fix rk3399 GICv3 ITS node name

Sebastian Reichel (1):
      arm64: dts: rockchip: add rk3588 cache level information

 arch/arm/boot/dts/rk3288.dtsi                          |  2 +-
 .../arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dts |  2 ++
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi     |  2 --
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2-v11.dts |  2 ++
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts     |  2 ++
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi           |  1 -
 .../arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi   |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts   | 18 ++++--------------
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi     | 12 +++---------
 arch/arm64/boot/dts/rockchip/rk3399.dtsi               |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353x.dtsi      |  6 ++++--
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts |  6 ++++--
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi      |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi              |  9 +++++++++
 15 files changed, 33 insertions(+), 35 deletions(-)



