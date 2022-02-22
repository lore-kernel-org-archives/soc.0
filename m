Return-Path: <SRS0=i+47=TF=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432C7C433EF
	for <soc@archiver.kernel.org>; Tue, 22 Feb 2022 11:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01B76C340F0; Tue, 22 Feb 2022 11:46:18 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BCBE6C340E8;
	Tue, 22 Feb 2022 11:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCBE6C340E8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nMTcN-00038z-Ud; Tue, 22 Feb 2022 12:46:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 5.17
Date: Tue, 22 Feb 2022 12:46:06 +0100
Message-ID: <1973741.CViHJPHrxy@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.17-rockchip-dtsfixes1

for you to fetch changes up to 3916c3619599a3970d3e6f98fb430b7c46266ada:

  ARM: dts: rockchip: fix a typo on rk3288 crypto-controller (2022-02-12 01:27:33 +0100)

----------------------------------------------------------------
Fix the display-port-sound on Gru devices, DDR voltage on the Quartz-A
board, fix emmc signal-integrity and usb OTG mode on rk3399-puma as well
as a number of dtschema fixes to make the reduce the number of errors.

----------------------------------------------------------------
Brian Norris (1):
      arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output

Corentin Labbe (1):
      ARM: dts: rockchip: fix a typo on rk3288 crypto-controller

Frank Wunderlich (2):
      arm64: dts: rockchip: fix dma-controller node names on rk356x
      arm64: dts: rockchip: drop pclk_xpcs from gmac0 on rk3568

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: fix rk3399-puma eMMC HS400 signal integrity

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: align pl330 node name with dtschema

Peter Geis (1):
      arm64: dts: rockchip: fix Quartz64-A ddr regulator voltage

Quentin Schulz (1):
      arm64: dts: rockchip: fix rk3399-puma-haikou USB OTG mode

Sascha Hauer (2):
      arm64: dts: rockchip: reorder rk3399 hdmi clocks
      ARM: dts: rockchip: reorder rk322x hmdi clocks

 arch/arm/boot/dts/rk322x.dtsi                       |  4 ++--
 arch/arm/boot/dts/rk3288.dtsi                       |  2 +-
 arch/arm64/boot/dts/rockchip/px30.dtsi              |  2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi            |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi        | 17 ++++++++++++-----
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi       | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi            |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts  |  2 --
 arch/arm64/boot/dts/rockchip/rk3568.dtsi            |  6 ++----
 arch/arm64/boot/dts/rockchip/rk356x.dtsi            |  4 ++--
 11 files changed, 45 insertions(+), 21 deletions(-)



