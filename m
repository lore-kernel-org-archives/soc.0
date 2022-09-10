Return-Path: <SRS0=3mQs=ZN=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D6CECAAA1
	for <soc@archiver.kernel.org>; Sat, 10 Sep 2022 01:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30C50C433B5; Sat, 10 Sep 2022 01:19:42 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7400C433D6;
	Sat, 10 Sep 2022 01:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7400C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oWp9l-00018O-6y; Sat, 10 Sep 2022 03:19:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.0
Date: Sat, 10 Sep 2022 03:19:36 +0200
Message-ID: <2645885.mvXUDI8C0e@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.0-rockchip-dtsfixes1

for you to fetch changes up to ea89926d9690f055fd8da929f6621a760e8e0f14:

  arm64: dts: rockchip: Remove 'enable-active-low' from rk3566-quartz64-a (2022-09-05 12:18:20 +0200)

----------------------------------------------------------------
Drop some not-specified properties, fix phy-supply properties,
fix edp clock on Gru, fix usb port on BPI-R2-Pro, fix license typo,
fix wlan-wake-pin on Gru-Bob and lower the sd-card speed on Quartz64-B

----------------------------------------------------------------
Brian Norris (1):
      arm64: dts: rockchip: Pull up wlan wake# on Gru-Bob

Fabio Estevam (2):
      arm64: dts: rockchip: Remove 'enable-active-low' from rk3399-puma
      arm64: dts: rockchip: Remove 'enable-active-low' from rk3566-quartz64-a

Frank Wunderlich (1):
      arm64: dts: rockchip: fix upper usb port on BPI-R2-Pro

Jagan Teki (1):
      arm64: dts: rockchip: Fix typo in lisense text for PX30.Core

Michael Riesch (2):
      arm64: dts: rockchip: fix property for usb2 phy supply on rock-3a
      arm64: dts: rockchip: fix property for usb2 phy supply on rk3568-evb1-v10

Nicolas Frattaroli (1):
      arm64: dts: rockchip: Lower sd speed on quartz64-b

zain wang (1):
      arm64: dts: rockchip: Set RK3399-Gru PCLK_EDP to 24 MHz

 arch/arm64/boot/dts/rockchip/px30-engicam-px30-core.dtsi | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts          | 5 +++++
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi  | 9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi            | 1 -
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts       | 1 -
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts          | 2 +-
 9 files changed, 20 insertions(+), 8 deletions(-)



