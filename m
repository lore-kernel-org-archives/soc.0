Return-Path: <SRS0=S59y=F6=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A99CDB465
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48D90C433CA; Mon, 16 Oct 2023 21:24:19 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FC11C433C7;
	Mon, 16 Oct 2023 21:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FC11C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qsV4R-00014F-P5; Mon, 16 Oct 2023 23:24:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.6 #1
Date: Mon, 16 Oct 2023 23:24:15 +0200
Message-ID: <2167992.Mh6RI2rZIc@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.7-rockchip-dts32-1

for you to fetch changes up to c96b13d7c0e494e1072648301e61e13a2a85a362:

  ARM: dts: rockchip: Switch to operating-points-v2 for RK3128's CPU (2023-10-04 23:27:04 +0200)

----------------------------------------------------------------
Someone resurrected a rk3128 board and provided actual SMP support
for it. Of course firmware for that SoC does not come with TF-A so
it's the old-style SMP the older arm32 Rockchip SoCs use.

And additionally the rv1126 got pwm support.

----------------------------------------------------------------
Alex Bee (4):
      ARM: dts: rockchip: Add SRAM node for RK3128
      ARM: dts: rockchip: Add CPU resets for RK3128
      ARM: dts: rockchip: Enable SMP bring-up for RK3128
      ARM: dts: rockchip: Switch to operating-points-v2 for RK3128's CPU

Jagan Teki (6):
      dt-bindings: pwm: rockchip: Document rv1126-pwm
      ARM: dts: rockchip: Add pwm2m0 pins to rv1126
      ARM: dts: rockchip: Add pwm2 node to rv1126
      ARM: dts: rockchip: Add pwm11m0 pins to rv1126
      ARM: dts: rockchip: Add pwm11 node to rv1126
      ARM: dts: rockchip: Enable pwm fan for edgeble-neu2

 .../devicetree/bindings/pwm/pwm-rockchip.yaml      |  1 +
 arch/arm/boot/dts/rockchip/rk3128.dtsi             | 61 ++++++++++++++++++++--
 .../boot/dts/rockchip/rv1126-edgeble-neu2-io.dts   |  4 ++
 arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi     | 16 ++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi             | 22 ++++++++
 5 files changed, 100 insertions(+), 4 deletions(-)



