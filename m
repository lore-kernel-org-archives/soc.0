Return-Path: <SRS0=5SgQ=VT=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA537C433F5
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 04:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79AAFC2BBE4; Wed, 11 May 2022 04:07:13 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1808AC385DE;
	Wed, 11 May 2022 04:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1808AC385DE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nodcx-0000SY-QE; Wed, 11 May 2022 06:07:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 5.18
Date: Wed, 11 May 2022 06:07:07 +0200
Message-ID: <2300256.NG923GbCHz@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-dtsfixes1

for you to fetch changes up to 77047ed73dd8b80c209bf5b5c215b858f1f5b14a:

  arm64: dts: rockchip: Add gmac1 and change network settings of bpi-r2-pro (2022-04-10 18:34:50 +0200)

----------------------------------------------------------------
Fixes for the mass-production version of BananaPi R2-Pro.
The mass market version received some changes compared to
preproduction versions and especially the io-domain setting
could affect the lifespan of the board if the wrong dt
gets booted on it.

----------------------------------------------------------------
Frank Wunderlich (2):
      arm64: dts: rockchip: Change io-domains of bpi-r2-pro
      arm64: dts: rockchip: Add gmac1 and change network settings of bpi-r2-pro

 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 40 +++++++++++++++++++---
 1 file changed, 35 insertions(+), 5 deletions(-)



