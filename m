Return-Path: <SRS0=7/pu=EB=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4986BC27C52
	for <soc@archiver.kernel.org>; Wed, 16 Aug 2023 22:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2786C433C7; Wed, 16 Aug 2023 22:02:10 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12896C433C9;
	Wed, 16 Aug 2023 22:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12896C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875bbf.versanet.de ([83.135.91.191] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qWOab-0007ab-Ls; Thu, 17 Aug 2023 00:02:05 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.5
Date: Thu, 17 Aug 2023 00:02:04 +0200
Message-ID: <4519945.8hzESeGDPO@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find a below a collection of fixes for the current release 6.5
cycle.

Please pull

Thanks
Heiko


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.5-rockchip-dtsfixes1

for you to fetch changes up to ebceec271e552a2b05e47d8ef0597052b1a39449:

  arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4 boards (2023-07-24 20:51:25 +0200)

----------------------------------------------------------------
Correct wifi interrupt flags for some boards, fixed wifi on Rock PI4,
disabled hs400 speeds for some boards having problems with data
intergrity and some dt property/styling fixes.

----------------------------------------------------------------
Christopher Obbard (2):
      arm64: dts: rockchip: Disable HS400 for eMMC on ROCK Pi 4
      arm64: dts: rockchip: Disable HS400 for eMMC on ROCK 4C+

Cristian Ciocaltea (1):
      arm64: dts: rockchip: Drop invalid regulator-init-microvolt property

Krzysztof Kozlowski (5):
      arm64: dts: rockchip: correct wifi interrupt flag in eaidk-610
      arm64: dts: rockchip: correct wifi interrupt flag in Rock Pi 4B
      arm64: dts: rockchip: correct wifi interrupt flag in Box Demo
      arm64: dts: rockchip: add missing space before { on indiedroid nova
      arm64: dts: rockchip: minor whitespace cleanup around '='

Yogesh Hegde (1):
      arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4 boards

 arch/arm64/boot/dts/rockchip/px30.dtsi                   | 16 ++++++++--------
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts           |  1 -
 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts        |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts        |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi         |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts     |  3 +--
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi       |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi  |  3 ---
 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts         |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts       |  3 ---
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi        |  2 --
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts       |  2 --
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts       |  2 --
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dts     |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts           |  2 --
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi        |  3 ---
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts       |  3 ---
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts         |  3 ---
 arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi  |  4 ----
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts       |  3 ---
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi      |  3 ---
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts        |  3 ---
 arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi      |  3 ---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts          |  3 ---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts          |  1 -
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts |  8 ++++----
 27 files changed, 22 insertions(+), 69 deletions(-)



