Return-Path: <SRS0=3mQs=ZN=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90708ECAAA1
	for <soc@archiver.kernel.org>; Sat, 10 Sep 2022 01:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 779BAC43470; Sat, 10 Sep 2022 01:21:48 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28120C433C1;
	Sat, 10 Sep 2022 01:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28120C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oWpBp-00019N-7l; Sat, 10 Sep 2022 03:21:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.1 #1
Date: Sat, 10 Sep 2022 03:21:44 +0200
Message-ID: <4766760.31r3eYUQgx@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-dts32-1

for you to fetch changes up to 1dabb74971b38d966ecef566bafddc4a34f4db9d:

  ARM: dts: rockchip: restyle emac nodes (2022-09-10 00:58:36 +0200)

----------------------------------------------------------------
Adapt emac nodes to make them conform to the newly yaml-converted binding.

----------------------------------------------------------------
Johan Jonker (2):
      ARM: dts: rockchip: fix rk3036 emac node compatible string
      ARM: dts: rockchip: restyle emac nodes

 arch/arm/boot/dts/rk3036-evb.dts        | 16 ++++++++++------
 arch/arm/boot/dts/rk3036-kylin.dts      | 16 ++++++++++------
 arch/arm/boot/dts/rk3036.dtsi           |  4 +---
 arch/arm/boot/dts/rk3066a-marsboard.dts | 17 ++++++++++-------
 arch/arm/boot/dts/rk3066a-rayeager.dts  | 15 ++++++++++-----
 arch/arm/boot/dts/rk3188-radxarock.dts  | 19 +++++++++++--------
 arch/arm/boot/dts/rk3xxx.dtsi           |  2 --
 7 files changed, 52 insertions(+), 37 deletions(-)



