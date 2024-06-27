Return-Path: <SRS0=v425=N5=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC03C2BD09
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 21:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31D90C32789; Thu, 27 Jun 2024 21:36:08 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06C99C2BBFC;
	Thu, 27 Jun 2024 21:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06C99C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b6a.versanet.de ([83.135.91.106] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sMwmh-0002b5-OG; Thu, 27 Jun 2024 23:36:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.10
Date: Thu, 27 Jun 2024 23:36:02 +0200
Message-ID: <10237789.nnTZe4vzsl@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find a below a collection of fixes for the current release 6.10
cycle.

Please pull

Thanks
Heiko


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.10-rockchip-dtsfixes1

for you to fetch changes up to 8d7ec44aa5d1eb94a30319074762a1740440cdc8:

  arm64: dts: rockchip: Add sound-dai-cells for RK3368 (2024-06-24 17:05:23 +0200)

----------------------------------------------------------------
Apart from the regular dts fixes for wrong addresses, missing
or wrong properties, this reverts the previous move away from
cd-gpios to the mmc-controller's internal card-detect.
With this change applied, it was reported that boards could not
detect card anymore, so this go reverted of course.

----------------------------------------------------------------
Alex Bee (1):
      arm64: dts: rockchip: Add sound-dai-cells for RK3368

Andy Yan (1):
      arm64: dts: rockchip: Fix the i2c address of es8316 on Cool Pi 4B

Dragan Simic (1):
      arm64: dts: rockchip: Fix the DCDC_REG2 minimum voltage on Quartz64 Model B

FUKAUMI Naoki (3):
      Revert "arm64: dts: rockchip: remove redundant cd-gpios from rk3588 sdmmc nodes"
      arm64: dts: rockchip: make poweroff(8) work on Radxa ROCK 5A
      arm64: dts: rockchip: fix PMIC interrupt pin on ROCK Pi E

Heiko Stuebner (1):
      arm64: dts: rockchip: set correct pwm0 pinctrl on rk3588-tiger

Hsin-Te Yuan (1):
      arm64: dts: rockchip: Fix the value of `dlg,jack-det-rate` mismatch on rk3399-gru

Johan Jonker (1):
      ARM: dts: rockchip: rk3066a: add #sound-dai-cells to hdmi node

Jonas Karlman (3):
      arm64: dts: rockchip: Fix rk3308 codec@ff560000 reset-names
      arm64: dts: rockchip: Fix SD NAND and eMMC init on rk3308-rock-pi-s
      arm64: dts: rockchip: Rename LED related pinctrl nodes on rk3308-rock-pi-s

 arch/arm/boot/dts/rockchip/rk3066a.dtsi                |  1 +
 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts      | 18 +++++++++++++-----
 arch/arm64/boot/dts/rockchip/rk3308.dtsi               |  2 +-
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts      |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3368.dtsi               |  3 +++
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi           |  2 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts     |  2 +-
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts    |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts        |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi         |  5 +++++
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts     |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts       |  2 ++
 13 files changed, 34 insertions(+), 12 deletions(-)



