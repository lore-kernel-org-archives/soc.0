Return-Path: <SRS0=DdcB=OR=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4C1C433EF
	for <soc@archiver.kernel.org>; Mon, 27 Sep 2021 09:43:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3E6F261165; Mon, 27 Sep 2021 09:43:28 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880D161157;
	Mon, 27 Sep 2021 09:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 880D161157
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from user91-192-32-221.grape.cz ([91.192.32.221] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1mUnAT-0002DE-Ta; Mon, 27 Sep 2021 11:43:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.16
Date: Mon, 27 Sep 2021 11:43:25 +0200
Message-ID: <5121280.Lt9SDvczpP@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-dts32-1

for you to fetch changes up to 3e6f8124a78840d074fab36853ee1f5a2e7cffe5:

  ARM: dts: rockchip: swap timer clock-names (2021-09-20 15:22:48 +0200)

----------------------------------------------------------------
ADC-keys for the mk808 board and a number of further cleanups
to make dt-schema happier.

----------------------------------------------------------------
Johan Jonker (5):
      ARM: dts: rockchip: add adc-keys node to rk3066a-mk808
      ARM: dts: rockchip: change rv1108 gmac nodename
      ARM: dts: rockchip: rename opp-table node names
      ARM: dts: rockchip: add more angle brackets to operating-points property on rk3066a
      ARM: dts: rockchip: swap timer clock-names

 arch/arm/boot/dts/rk3036.dtsi       |  4 ++--
 arch/arm/boot/dts/rk3066a-mk808.dts | 27 +++++++++++++++++++++++++++
 arch/arm/boot/dts/rk3066a.dtsi      | 17 ++++++++---------
 arch/arm/boot/dts/rk3188.dtsi       |  2 +-
 arch/arm/boot/dts/rk3229.dtsi       |  2 +-
 arch/arm/boot/dts/rk322x.dtsi       |  6 +++---
 arch/arm/boot/dts/rk3288.dtsi       |  4 ++--
 arch/arm/boot/dts/rv1108.dtsi       |  8 ++++----
 8 files changed, 48 insertions(+), 22 deletions(-)



