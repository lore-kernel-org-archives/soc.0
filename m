Return-Path: <SRS0=v9WN=FK=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BFAC4361B
	for <soc@archiver.kernel.org>; Sun,  6 Dec 2020 18:31:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9403F2312F; Sun,  6 Dec 2020 18:31:45 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBDB2311B;
	Sun,  6 Dec 2020 18:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDBDB2311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=heiko@sntech.de
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1klyox-0003wQ-9t; Sun, 06 Dec 2020 19:31:43 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.11
Date: Sun, 06 Dec 2020 19:31:42 +0100
Message-ID: <4582475.GXAFRqVoOG@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-dts32-1

for you to fetch changes up to 29952fea5e85083374d19cb0a33206962e087d5b:

  ARM: dts: rockchip: Add SDIO0 node for VMARC SOM (2020-11-30 14:30:56 +0100)

----------------------------------------------------------------
Veyron backlight fix, another fix for dtbs-check and some additions
to the rk3288-based VMARC boards.

----------------------------------------------------------------
Alexandru Stan (1):
      ARM: dts: rockchip: Remove 0 point from brightness-levels on rk3288-veyron

Jagan Teki (2):
      ARM: dts: rockchip: Add rtc node for VMARC SOM
      ARM: dts: rockchip: Add SDIO0 node for VMARC SOM

Johan Jonker (1):
      ARM: dts: rockchip: rename wdt nodename to watchdog on rv1108

 arch/arm/boot/dts/rk3288-veyron-jaq.dts            |  2 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts         |  2 +-
 arch/arm/boot/dts/rk3288-veyron-tiger.dts          |  2 +-
 arch/arm/boot/dts/rk3288-vmarc-som.dtsi            | 40 ++++++++++++++++++++++
 .../boot/dts/rockchip-radxa-dalang-carrier.dtsi    | 21 ++++++++++++
 arch/arm/boot/dts/rv1108.dtsi                      |  2 +-
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     | 16 +++++++++
 7 files changed, 81 insertions(+), 4 deletions(-)



