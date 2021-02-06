Return-Path: <SRS0=imG5=HI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FAFC433E0
	for <soc@archiver.kernel.org>; Sat,  6 Feb 2021 00:02:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5FAA76500F; Sat,  6 Feb 2021 00:02:01 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A60065014;
	Sat,  6 Feb 2021 00:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A60065014
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=heiko@sntech.de
Received: from p508fdf7d.dip0.t-ipconnect.de ([80.143.223.125] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1l8B2y-00050v-Lj; Sat, 06 Feb 2021 01:01:56 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 5.12
Date: Sat, 06 Feb 2021 01:01:56 +0100
Message-ID: <4622596.31r3eYUQgx@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in the next mails Rockchip changes
targetted at 5.12

Please pull
Thanks
Heiko

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.12-rockchip-defconfig64-1

for you to fetch changes up to 3c8e5d51e4c6e5e93d31f59d4a54fb3a14358ee4:

  arm64: defconfig: Enable REGULATOR_MP8859 (2021-01-09 15:09:49 +0100)

----------------------------------------------------------------
Enable REGULATOR_MP8859 - the main power supply for one Rockchip board.

----------------------------------------------------------------
Jagan Teki (1):
      arm64: defconfig: Enable REGULATOR_MP8859

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)



