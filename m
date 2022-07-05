Return-Path: <SRS0=tHfl=XK=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C36BC43334
	for <soc@archiver.kernel.org>; Tue,  5 Jul 2022 11:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 427A0C341CE; Tue,  5 Jul 2022 11:11:29 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 645B3C341C7;
	Tue,  5 Jul 2022 11:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 645B3C341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o8gSk-0000Ch-BY; Tue, 05 Jul 2022 13:11:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.20 #1
Date: Tue, 05 Jul 2022 13:11:23 +0200
Message-ID: <14795241.VsHLxoZxqI@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.20-rockchip-dts32-1

for you to fetch changes up to e5a3cbe8b45b0a436a39cc969b7bcc8353248018:

  ARM: dts: rockchip: correct gpio-keys properties on rk3288-tinker (2022-06-22 21:04:38 +0200)

----------------------------------------------------------------
NFC flash node on rk3066a-mk808 and some dts styling fixes
(alignment and node names).

----------------------------------------------------------------
Johan Jonker (1):
      ARM: dts: rockchip: enable nfc node in rk3066a-mk808.dts

Krzysztof Kozlowski (3):
      ARM: dts: rockchip: adjust whitespace around '='
      ARM: dts: rockchip: align gpio-key node names with dtschema
      ARM: dts: rockchip: correct gpio-keys properties on rk3288-tinker

 arch/arm/boot/dts/rk3066a-bqcurie2.dts                 |  4 ++--
 arch/arm/boot/dts/rk3066a-mk808.dts                    | 18 ++++++++++++++++++
 arch/arm/boot/dts/rk3066a-rayeager.dts                 |  2 +-
 arch/arm/boot/dts/rk3188-bqedison2qc.dts               |  4 ++--
 arch/arm/boot/dts/rk3188-px3-evb.dts                   |  2 +-
 arch/arm/boot/dts/rk3188-radxarock.dts                 |  2 +-
 arch/arm/boot/dts/rk3229-evb.dts                       |  2 +-
 arch/arm/boot/dts/rk3288-evb.dtsi                      |  2 +-
 arch/arm/boot/dts/rk3288-firefly-reload.dts            |  2 +-
 arch/arm/boot/dts/rk3288-firefly.dtsi                  |  2 +-
 arch/arm/boot/dts/rk3288-phycore-rdk.dts               |  4 ++--
 arch/arm/boot/dts/rk3288-popmetal.dts                  |  2 +-
 arch/arm/boot/dts/rk3288-r89.dts                       |  2 +-
 arch/arm/boot/dts/rk3288-rock2-square.dts              |  2 +-
 arch/arm/boot/dts/rk3288-tinker.dtsi                   |  4 +---
 .../arm/boot/dts/rk3288-veyron-broadcom-bluetooth.dtsi | 10 +++++-----
 arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi        |  2 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts             |  4 ++--
 arch/arm/boot/dts/rk3288-veyron-pinky.dts              |  2 +-
 arch/arm/boot/dts/rk3288-veyron.dtsi                   |  2 +-
 arch/arm/boot/dts/rv1108-elgin-r1.dts                  | 14 +++++++-------
 arch/arm/boot/dts/rv1108-evb.dts                       | 14 +++++++-------
 arch/arm/boot/dts/rv1108.dtsi                          |  2 +-
 23 files changed, 60 insertions(+), 44 deletions(-)



