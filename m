Return-Path: <SRS0=imG5=HI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01E4C433DB
	for <soc@archiver.kernel.org>; Sat,  6 Feb 2021 00:02:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 88FCB65016; Sat,  6 Feb 2021 00:02:42 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F406500F;
	Sat,  6 Feb 2021 00:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F406500F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=heiko@sntech.de
Received: from p508fdf7d.dip0.t-ipconnect.de ([80.143.223.125] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1l8B3g-00051J-BB; Sat, 06 Feb 2021 01:02:40 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.12
Date: Sat, 06 Feb 2021 01:02:39 +0100
Message-ID: <2184150.ElGaqSPkdT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.12-rockchip-dts32-1

for you to fetch changes up to 1034e2b6b8435758c0d699b77761365fd09a5f4a:

  ARM: dts: rockchip: assign a fixed index to mmc devices on rv1108 boards (2021-01-26 00:31:23 +0100)

----------------------------------------------------------------
Fixed indices for mmc nodes; removal of obsolete amba bus nodes;
addition of nand flash controller odes to rk3036, rk2928, rv1108;
gpu node for rk3288-miqi and some cleanups to make dtbscheck happier.

----------------------------------------------------------------
Demetris Ierokipides (1):
      ARM: dts: rockchip: add gpu node to rk3288-miqi

Johan Jonker (5):
      ARM: dts: rockchip: add QoS register compatibles for rk3066/rk3188
      ARM: dts: rockchip: add QoS register compatibles for rk3288
      ARM: dts: rockchip: rename thermal subnodes for rk3288
      ARM: dts: rockchip: assign a fixed index to mmc devices on rk322x boards
      ARM: dts: rockchip: assign a fixed index to mmc devices on rv1108 boards

Robin Murphy (1):
      ARM: dts: rockchip: Remove bogus "amba" bus nodes

Yifeng Zhao (3):
      ARM: dts: rockchip: Add NFC node for RV1108 SoC
      ARM: dts: rockchip: Add NFC node for RK2928 and other SoCs
      ARM: dts: rockchip: Add NFC node for RK3036 SoC

 arch/arm/boot/dts/rk3036.dtsi     |  83 ++++++++++++++++++++-------
 arch/arm/boot/dts/rk322x.dtsi     |  32 +++++------
 arch/arm/boot/dts/rk3288-miqi.dts |   5 ++
 arch/arm/boot/dts/rk3288.dtsi     | 115 ++++++++++++++++++--------------------
 arch/arm/boot/dts/rk3xxx.dtsi     | 106 ++++++++++++++++++-----------------
 arch/arm/boot/dts/rv1108.dtsi     |  14 +++++
 6 files changed, 205 insertions(+), 150 deletions(-)



