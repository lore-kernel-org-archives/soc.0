Return-Path: <SRS0=S59y=F6=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D03FCDB465
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D6E8C433C7; Mon, 16 Oct 2023 21:21:59 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 784CCC433C8;
	Mon, 16 Oct 2023 21:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 784CCC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qsV2A-00012N-W7; Mon, 16 Oct 2023 23:21:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.6
Date: Mon, 16 Oct 2023 23:21:54 +0200
Message-ID: <1965242.usQuhbGJ8B@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find a below a collection of fixes for the current release 6.6
cycle.

Please pull

Thanks
Heiko


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.6-rockchip-dtsfixes1

for you to fetch changes up to 8cd79b729e746cb167f1563d015a93fc0a079899:

  arm64: dts: rockchip: Fix i2s0 pin conflict on ROCK Pi 4 boards (2023-10-16 21:10:05 +0200)

----------------------------------------------------------------
I2S pinctrl fixes, someone resurrected the rk3128 arm32 and found some
needed fixes and finally some sound fixes for the px30 ringneck som.

----------------------------------------------------------------
Alex Bee (4):
      ARM: dts: rockchip: Fix i2c0 register address for RK3128
      ARM: dts: rockchip: Add missing arm timer interrupt for RK3128
      ARM: dts: rockchip: Add missing quirk for RK3128's dma engine
      ARM: dts: rockchip: Fix timer clocks for RK3128

Christopher Obbard (2):
      arm64: dts: rockchip: Add i2s0-2ch-bus-bclk-off pins to RK3399
      arm64: dts: rockchip: Fix i2s0 pin conflict on ROCK Pi 4 boards

Ermin Sunj (1):
      arm64: dts: rockchip: use codec as clock master on px30-ringneck-haikou

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: set codec system-clock-fixed on px30-ringneck-haikou

 arch/arm/boot/dts/rockchip/rk3128.dtsi                | 18 ++++++++++--------
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts | 10 ++++++----
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi              | 10 ++++++++++
 4 files changed, 27 insertions(+), 12 deletions(-)



