Return-Path: <SRS0=oCBd=HX=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7829DC4332F
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 21:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C4E7C433CA; Tue, 12 Dec 2023 21:33:51 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4425C433C8;
	Tue, 12 Dec 2023 21:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4425C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rDANv-0007Bn-Ml; Tue, 12 Dec 2023 22:33:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.8 #1
Date: Tue, 12 Dec 2023 22:33:47 +0100
Message-ID: <3197878.5fSG56mABF@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.8-rockchip-dts32-1

for you to fetch changes up to 569b26af7919c15a8ce231b4fae29cfbd811f144:

  ARM: dts: rockchip: add hdmi-connector node to rk3036-kylin (2023-12-12 20:38:36 +0100)

----------------------------------------------------------------
New boards are the Geniatech XPI-3128 (RK3128), Sonoff iHost (rv1109)

One "new" soc is the rv1109 which is a two-core variant of the rv1126
and everything else is identical.

Lots of love for the old rk3128 (power-domains, gpu, gmac, usb) and
rv1126 (uart pins, i2c2 special case) and rework of aliases to have
core busses that are hard-numbered in boards and documentation centrally
in the dtsi, but the per board aliases in the boards (ethernet).

Plus the rk3036 got a yaml hdmi binding which required some small fixes.

----------------------------------------------------------------
Alex Bee (14):
      dt-bindings: arm: rockchip: Add Geniatech XPI-3128
      ARM: dts: rockchip: Add sdmmc_det pinctrl for RK3128
      ARM: dts: rockchip: Add Geniatech XPI-3128 RK3128 board
      ARM: dts: rockchip: Add USB host clocks for RK3128
      ARM: dts: rockchip: Add dwc2 otg fifo siztes for RK3128
      ARM: dts: rockchip: Make usbphy the parent of SCLK_USB480M for RK3128
      ARM: dts: rockchip: Add gmac node for RK3128
      ARM: dts: rockchip: Enable gmac for XPI-3128
      ARM: dts: rockchip: Add power-controller for RK3128
      ARM: dts: rockchip: Add GPU node for RK3128
      ARM: dts: rockchip: Enable GPU for XPI-3128
      ARM: dts: rockchip: Move gpio aliases to SoC dtsi for RK3128
      ARM: dts: rockchip: Move i2c aliases to SoC dtsi for RK3128
      ARM: dts: rockchip: Move uart aliases to SoC dtsi for RK3128

Johan Jonker (3):
      ARM: dts: rockchip: add gpio alias for gpio dt nodes
      ARM: dts: rockchip: fix rk3036 hdmi ports node
      ARM: dts: rockchip: add hdmi-connector node to rk3036-kylin

Tim Lunn (7):
      ARM: dts: rockchip: Add alternate UART pins to rv1126
      ARM: dts: rockchip: Serial aliases for rv1126
      ARM: dts: rockchip: Add i2c2 node to rv1126
      ARM: dts: rockchip: Split up rgmii1 pinctrl on rv1126
      ARM: dts: rockchip: Add rv1109 SoC
      dt-bindings: arm: rockchip: Add Sonoff iHost
      ARM: dts: rockchip: Add Sonoff iHost Smart Home Hub

 .../devicetree/bindings/arm/rockchip.yaml          |  12 +
 arch/arm/boot/dts/rockchip/Makefile                |   3 +
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts        |  17 +
 arch/arm/boot/dts/rockchip/rk3036.dtsi             |  17 +-
 arch/arm/boot/dts/rockchip/rk3066a.dtsi            |   5 +
 arch/arm/boot/dts/rockchip/rk3128-evb.dts          |   5 -
 arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts     | 425 +++++++++++++++++++++
 arch/arm/boot/dts/rockchip/rk3128.dtsi             | 185 +++++++++
 arch/arm/boot/dts/rockchip/rk322x.dtsi             |   4 +
 arch/arm/boot/dts/rockchip/rk3288.dtsi             |   9 +
 arch/arm/boot/dts/rockchip/rk3xxx.dtsi             |   4 +
 arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dts |  21 +
 arch/arm/boot/dts/rockchip/rv1109.dtsi             |  23 ++
 .../boot/dts/rockchip/rv1126-edgeble-neu2-io.dts   |   2 +-
 arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi     |  72 +++-
 arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dts |  29 ++
 .../arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi | 404 ++++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi             |  21 +
 18 files changed, 1236 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1109.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi



