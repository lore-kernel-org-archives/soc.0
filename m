Return-Path: <SRS0=gSCk=Q6=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEAFC433F5
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 10:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 368DDC34626; Mon, 13 Dec 2021 10:04:56 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9506BC3460D;
	Mon, 13 Dec 2021 10:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9506BC3460D
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from p5b127e39.dip0.t-ipconnect.de ([91.18.126.57] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1mwiCR-0000r3-FE; Mon, 13 Dec 2021 11:04:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 5.16
Date: Mon, 13 Dec 2021 11:04:52 +0100
Message-ID: <3072346.MIvVl8DfR5@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-dtsfixes1

for you to fetch changes up to aef4b9a89a376a9cabe5e744729914e7766c59bb:

  arm64: dts: rockchip: fix poweroff on helios64 (2021-11-21 18:59:06 +0100)

----------------------------------------------------------------
Fixes for some board-level issues (regulators, mmc, poweroff, audio)

----------------------------------------------------------------
Alex Bee (1):
      arm64: dts: rockchip: fix audio-supply for Rock Pi 4

Artem Lapkin (1):
      arm64: dts: rockchip: remove mmc-hs400-enhanced-strobe from rk3399-khadas-edge

Florian Klink (1):
      arm64: dts: rockchip: fix poweroff on helios64

John Keeping (2):
      arm64: dts: rockchip: fix rk3308-roc-cc vcc-sd supply
      arm64: dts: rockchip: fix rk3399-leez-p710 vcc3v3-lan supply

 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi   | 1 -
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi     | 2 +-
 5 files changed, 4 insertions(+), 4 deletions(-)



