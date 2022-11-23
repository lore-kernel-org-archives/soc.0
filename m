Return-Path: <SRS0=xvFv=3X=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A5BC4332F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 09:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74ADBC433B5; Wed, 23 Nov 2022 09:07:37 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A731CC433D7;
	Wed, 23 Nov 2022 09:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A731CC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oxljB-0006tQ-9A; Wed, 23 Nov 2022 10:07:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.1
Date: Wed, 23 Nov 2022 10:07:32 +0100
Message-ID: <6274427.GXAFRqVoOG@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-dtsfixes1

for you to fetch changes up to 562105c1b072411c71ac2202410d83ee79297624:

  arm64: dts: rockchip: Fix Pine64 Quartz4-B PMIC interrupt (2022-11-13 09:54:59 +0100)

----------------------------------------------------------------
Fixes to make the automated binding tools happier (node-names,
undocumented + unneeded properties) and fixes for non-working
devices on some boards.

----------------------------------------------------------------
Brian Norris (1):
      arm64: dts: rockchip: Drop RK3399-Scarlet's repeated ec_ap_int_l definition

Chen-Yu Tsai (1):
      arm64: dts: rockchip: Fix Pine64 Quartz4-B PMIC interrupt

FUKAUMI Naoki (1):
      arm64: dts: rockchip: keep I2S1 disabled for GPIO function on ROCK Pi 4 series

Furkan Kardame (3):
      arm64: dts: rockchip: Fix gmac failure of rgmii-id from rk3566-roc-pc
      arm64: dts: rockchip: Fix i2c3 pinctrl on rk3566-roc-pc
      arm64: dts: rockchip: remove i2c5 from rk3566-roc-pc

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: lower rk3399-puma-haikou SD controller clock frequency

Jensen Huang (1):
      arm64: dts: rockchip: add enable-strobe-pulldown to emmc phy on nanopi4

Johan Jonker (5):
      ARM: dts: rockchip: fix adc-keys sub node names
      arm64: dts: rockchip: fix adc-keys sub node names
      ARM: dts: rockchip: fix ir-receiver node names
      arm64: dts: rockchip: fix ir-receiver node names
      ARM: dts: rockchip: rk3188: fix lcdc1-rgb24 node name

Lev Popov (1):
      arm64: dts: rockchip: fix quartz64-a bluetooth configuration

Sebastian Reichel (4):
      arm64: dts: rockchip: fix node name for hym8563 rtc
      arm64: dts: rockchip: remove clock-frequency from rtc
      arm: dts: rockchip: fix node name for hym8563 rtc
      arm: dts: rockchip: remove clock-frequency from rtc

 arch/arm/boot/dts/rk3036-evb.dts                           |  3 +--
 arch/arm/boot/dts/rk3066a-mk808.dts                        |  2 +-
 arch/arm/boot/dts/rk3188-radxarock.dts                     |  2 +-
 arch/arm/boot/dts/rk3188.dtsi                              |  2 +-
 arch/arm/boot/dts/rk3288-evb-act8846.dts                   |  2 +-
 arch/arm/boot/dts/rk3288-evb.dtsi                          |  6 +++---
 arch/arm/boot/dts/rk3288-firefly.dtsi                      |  3 +--
 arch/arm/boot/dts/rk3288-miqi.dts                          |  3 +--
 arch/arm/boot/dts/rk3288-rock2-square.dts                  |  3 +--
 arch/arm/boot/dts/rk3288-vmarc-som.dtsi                    |  1 -
 arch/arm64/boot/dts/rockchip/px30-evb.dts                  | 10 +++++-----
 arch/arm64/boot/dts/rockchip/rk3308-evb.dts                | 12 ++++++------
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts             |  2 +-
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts            |  2 +-
 arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts     |  3 +--
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts                |  3 +--
 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi       |  4 ----
 arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi       |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dts          |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dts         |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi           |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts           |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts        |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts        |  3 +--
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi            |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi         |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi      |  3 +--
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi          |  2 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts         |  7 ++++---
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts         |  2 +-
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts             |  8 ++------
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts         |  1 -
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts            |  1 -
 34 files changed, 46 insertions(+), 64 deletions(-)



